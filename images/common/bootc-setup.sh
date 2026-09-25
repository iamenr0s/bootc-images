#!/usr/bin/env bash
# Turn a docker-hardened-images "full" image into a bootc image.
# Runs inside the Containerfile build. Each step mirrors a piece of the
# upstream bootc minimal manifest (centos-bootc image,
# /usr/share/doc/bootc-base-imagectl/manifests/minimal/*.yaml); the file it
# comes from is noted per step. Upstream does these via rpm-ostree compose.
set -euo pipefail

arch="$(uname -m)"

# /var/lib is wiped below (per-deployment state). EL8/EL9 keep the rpmdb there,
# which would wipe the package database. Supported bases keep it in /usr.
# ponytail: fail instead of relocating; relocate + %_dbpath macro when EL9 is added.
if [ -d /var/lib/rpm ] && [ ! -L /var/lib/rpm ]; then
  echo "rpmdb lives in /var/lib/rpm (EL8/EL9?): not supported yet" >&2
  exit 1
fi

# --- kernel-install.yaml: one kernel, installed ostree-style, no dracut into /boot
mkdir -p /usr/lib/kernel/install.conf.d
printf '# bootc: kernel lives in /usr/lib/modules, initramfs built below\nlayout=ostree\n' \
  | tee /usr/lib/kernel/install.conf /usr/lib/kernel/install.conf.d/00-bootc-kernel-layout.conf >/dev/null
if [ -d /usr/share/dnf5/libdnf.conf.d ]; then
  printf "[main]\ninstallonlypkgs=''\nprotect_running_kernel=False\n" \
    > /usr/share/dnf5/libdnf.conf.d/20-ostree.conf
else
  printf "installonlypkgs=''\nprotect_running_kernel=False\n" >> /etc/dnf/dnf.conf
fi

# --- package set: minimal manifest (bootc, bootupd, kernel, ostree, selinux)
#     plus what this image adds on top (networking, SSH, provisioning, containers)
bootloader=(grub2-efi-aa64 efibootmgr shim)
[ "${arch}" = x86_64 ] && bootloader=(grub2 grub2-efi-x64 efibootmgr shim microcode_ctl)

dnf -y install --setopt=install_weak_deps=False \
  kernel dracut systemd systemd-pam dbus \
  bootc bootupd ostree nss-altfiles \
  xfsprogs e2fsprogs dosfstools \
  selinux-policy-targeted container-selinux tpm2-tools zstd \
  "${bootloader[@]}" \
  NetworkManager openssh-server cloud-init sudo podman chrony

# --- manifest.yaml: provisioning is cloud-init's job, not systemd-firstboot
rm -f /usr/lib/systemd/system/sysinit.target.wants/systemd-firstboot.service

# --- grub2-removals.yaml: desktop-oriented grub boot-success bits
rm -f /etc/grub.d/08_fallback_counting /etc/grub.d/10_reset_boot_success /etc/grub.d/12_menu_auto_hide
rpm -ql grub2-tools 2>/dev/null | grep '^/usr/lib/systemd/' | while read -r f; do
  [ -d "${f}" ] || rm -f "${f}"
done

# --- bootupd.yaml: bootloader update payload. rpm-ostree compose moves /boot
#     into /usr/lib/ostree-boot; without it the shim/grub EFI files are still
#     in /boot/efi, so move them to where bootupd looks.
mkdir -p /usr/lib/ostree-boot
[ -d /boot/efi ] && cp -a /boot/efi /usr/lib/ostree-boot/
bootupctl backend generate-update-metadata
rm -rf /usr/lib/ostree-boot/loader

# --- includes/centos-stream.yaml: default root filesystem for `bootc install`
mkdir -p /usr/lib/bootc/install
printf '[install]\nroot-fs-type = "xfs"\n' > /usr/lib/bootc/install/20-rootfs.toml

# --- ostree.yaml: composefs root, read-only sysroot
mkdir -p /usr/lib/ostree
printf '[composefs]\nenabled = yes\n[sysroot]\nreadonly = true\n' > /usr/lib/ostree/prepare-root.conf

# --- initramfs.yaml: generic (non-hostonly) initramfs with ostree + bootc modules
mkdir -p /usr/lib/dracut/dracut.conf.d
cat > /usr/lib/dracut/dracut.conf.d/20-bootc-base.conf <<'EOF'
hostonly=no
export DRACUT_NO_XATTR=1
add_dracutmodules+=" kernel-modules dracut-systemd systemd-initrd base ostree bootc virtiofs tpm2-tss "
EOF
kver="$(ls /usr/lib/modules)"
[ "$(wc -w <<<"${kver}")" -eq 1 ] || { echo "expected exactly one kernel, got: ${kver}" >&2; exit 1; }
dracut --no-hostonly --reproducible --force "/usr/lib/modules/${kver}/initramfs.img" "${kver}"
find /boot -mindepth 1 -delete   # kernel + initramfs live in /usr/lib/modules; bootc owns /boot

# --- basic-fixes.yaml: tmp on tmpfs (needed with a read-only composefs root)
mkdir -p /usr/lib/systemd/system/local-fs.target.wants
ln -sf ../tmp.mount /usr/lib/systemd/system/local-fs.target.wants/tmp.mount
if [ -f /usr/lib/tmpfiles.d/provision.conf ]; then
  sed -i -e 's, /root, /var/roothome,' -e '/^d- \/var\/roothome /d' /usr/lib/tmpfiles.d/provision.conf
fi

# --- rpm-ostree filesystem layout: mutable dirs become symlinks into /var,
#     created at boot by tmpfiles (tmpfiles.yaml + finalize.d/01-var.sh)
userdel -r nonroot   # distroless runtime user, meaningless on a host
for d in home opt srv mnt; do rm -rf "/${d:?}" && ln -s "var/${d}" "/${d}"; done
# shellcheck disable=SC2114  # replacing system dirs with symlinks is the point
rm -rf /root /media && ln -s var/roothome /root && ln -s run/media /media
mkdir -p /sysroot && ln -s sysroot/ostree /ostree
rm -f /usr/lib/tmpfiles.d/home.conf
cat > /usr/lib/tmpfiles.d/bootc-base.conf <<'EOF'
d /var/home 0755 root root -
d /var/roothome 0700 root root -
d /var/opt 0755 root root -
d /var/srv 0755 root root -
d /var/mnt 0755 root root -
d /var/lib/rpm-state 0755 - - -
EOF

# --- systemd-presets.yaml: presets are canonical, not whatever RPM scripts enabled
printf 'disable dnf-makecache.timer\nenable bootloader-update.service\n' \
  > /usr/lib/systemd/system-preset/85-bootc.preset
rm -rf /etc/systemd/system/* /etc/systemd/user/*
systemctl preset-all
systemctl --user --global preset-all

# --- cleanup: /var is per-deployment state, never image content
dnf clean all
rm -rf /var/log/* /var/cache/* /var/lib/* /var/tmp/*
# /run and /tmp are tmpfs at runtime; the bind-mounted script can't be removed
rm -rf /run/* /tmp/* 2>/dev/null || true

# --- rpm-ostree "autovar": bootc only seeds /var on first install, so every
#     /var path left in the image needs a tmpfiles.d entry to exist on upgrades
known="$(systemd-tmpfiles --cat-config | awk '$1 !~ /^#/ {print $2}')"
find /var -mindepth 1 \( -type d -o -type l \) \
     -printf '%y /var/%P %m %u %g %l\n' | sort -k2 | while read -r type path mode user group target; do
  grep -qxF "${path}" <<<"${known}" && continue
  if [ "${type}" = l ]; then echo "L ${path} - - - - ${target}"; else echo "d ${path} 0${mode} ${user} ${group} -"; fi
done > /usr/lib/tmpfiles.d/bootc-autovar.conf

bootc container lint
