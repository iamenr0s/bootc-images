# BootC Images

[![build](https://img.shields.io/github/actions/workflow/status/iamenr0s/bootc-images/build.yml?label=build&logo=github)](https://github.com/iamenr0s/bootc-images/actions/workflows/build.yml)
[![rescan](https://img.shields.io/github/actions/workflow/status/iamenr0s/bootc-images/rescan.yml?label=rescan&logo=github)](https://github.com/iamenr0s/bootc-images/actions/workflows/rescan.yml)
[![Renovate](https://img.shields.io/badge/renovate-enabled-brightgreen?logo=renovatebot)](renovate.json)
[![License](https://img.shields.io/github/license/iamenr0s/bootc-images)](LICENSE)

Bootable container images (bootc) layered on
[docker-hardened-images](https://github.com/iamenr0s/docker-hardened-images):
the hardened `-full` image supplies a minimal, patched userspace, and
[`bootc-setup.sh`](images/common/bootc-setup.sh) adds the kernel, bootloader and
ostree/bootc plumbing. Fedora, AlmaLinux, Rocky Linux and CentOS Stream; amd64 and arm64.

## Quick start

```bash
sudo bootc switch quay.io/iamenr0s/centos-hardened-bootc:10   # first time (or docker.io/...)
sudo bootc upgrade     # stage the newest image; applied on next boot
sudo bootc rollback    # back to the previous deployment
```

To build disk images, use [bootc-image-builder](https://github.com/osbuild/bootc-image-builder)
or `bootc install to-disk` from the image. `/etc` is 3-way merged on upgrade (local edits
survive); `/var` is never touched.

## Available Images

| Build | CVEs | Quay.io | Docker Hub |
|---|---|---|---|
| [![fedora43](https://img.shields.io/github/actions/workflow/status/iamenr0s/bootc-images/build.yml?label=fedora43&logo=github)](https://github.com/iamenr0s/bootc-images/actions/workflows/build.yml) | [![CVEs](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fiamenr0s%2Fbootc-images%2Fbadges%2Fbadges%2Fcve-fedora-43.json)](https://github.com/iamenr0s/bootc-images/actions/workflows/rescan.yml) | [![Quay Pulls](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fiamenr0s%2Fbootc-images%2Fbadges%2Fbadges%2Fquay-fedora-hardened-bootc.json)](https://quay.io/repository/iamenr0s/fedora-hardened-bootc?tab=tags&tag=43) | [![Docker Pulls](https://img.shields.io/docker/pulls/iamenr0s/fedora-hardened-bootc?logo=docker)](https://hub.docker.com/r/iamenr0s/fedora-hardened-bootc) |
| [![fedora44](https://img.shields.io/github/actions/workflow/status/iamenr0s/bootc-images/build.yml?label=fedora44&logo=github)](https://github.com/iamenr0s/bootc-images/actions/workflows/build.yml) | [![CVEs](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fiamenr0s%2Fbootc-images%2Fbadges%2Fbadges%2Fcve-fedora-44.json)](https://github.com/iamenr0s/bootc-images/actions/workflows/rescan.yml) | [![Quay Pulls](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fiamenr0s%2Fbootc-images%2Fbadges%2Fbadges%2Fquay-fedora-hardened-bootc.json)](https://quay.io/repository/iamenr0s/fedora-hardened-bootc?tab=tags&tag=44) | [![Docker Pulls](https://img.shields.io/docker/pulls/iamenr0s/fedora-hardened-bootc?logo=docker)](https://hub.docker.com/r/iamenr0s/fedora-hardened-bootc) |
| [![almalinux10](https://img.shields.io/github/actions/workflow/status/iamenr0s/bootc-images/build.yml?label=almalinux10&logo=github)](https://github.com/iamenr0s/bootc-images/actions/workflows/build.yml) | [![CVEs](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fiamenr0s%2Fbootc-images%2Fbadges%2Fbadges%2Fcve-almalinux-10.json)](https://github.com/iamenr0s/bootc-images/actions/workflows/rescan.yml) | [![Quay Pulls](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fiamenr0s%2Fbootc-images%2Fbadges%2Fbadges%2Fquay-almalinux-hardened-bootc.json)](https://quay.io/repository/iamenr0s/almalinux-hardened-bootc?tab=tags&tag=10) | [![Docker Pulls](https://img.shields.io/docker/pulls/iamenr0s/almalinux-hardened-bootc?logo=docker)](https://hub.docker.com/r/iamenr0s/almalinux-hardened-bootc) |
| [![rockylinux10](https://img.shields.io/github/actions/workflow/status/iamenr0s/bootc-images/build.yml?label=rockylinux10&logo=github)](https://github.com/iamenr0s/bootc-images/actions/workflows/build.yml) | [![CVEs](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fiamenr0s%2Fbootc-images%2Fbadges%2Fbadges%2Fcve-rockylinux-10.json)](https://github.com/iamenr0s/bootc-images/actions/workflows/rescan.yml) | [![Quay Pulls](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fiamenr0s%2Fbootc-images%2Fbadges%2Fbadges%2Fquay-rockylinux-hardened-bootc.json)](https://quay.io/repository/iamenr0s/rockylinux-hardened-bootc?tab=tags&tag=10) | [![Docker Pulls](https://img.shields.io/docker/pulls/iamenr0s/rockylinux-hardened-bootc?logo=docker)](https://hub.docker.com/r/iamenr0s/rockylinux-hardened-bootc) |
| [![centos10](https://img.shields.io/github/actions/workflow/status/iamenr0s/bootc-images/build.yml?label=centos10&logo=github)](https://github.com/iamenr0s/bootc-images/actions/workflows/build.yml) | [![CVEs](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fiamenr0s%2Fbootc-images%2Fbadges%2Fbadges%2Fcve-centos-10.json)](https://github.com/iamenr0s/bootc-images/actions/workflows/rescan.yml) | [![Quay Pulls](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fiamenr0s%2Fbootc-images%2Fbadges%2Fbadges%2Fquay-centos-hardened-bootc.json)](https://quay.io/repository/iamenr0s/centos-hardened-bootc?tab=tags&tag=10) | [![Docker Pulls](https://img.shields.io/docker/pulls/iamenr0s/centos-hardened-bootc?logo=docker)](https://hub.docker.com/r/iamenr0s/centos-hardened-bootc) |

Tags: per-version multi-arch manifest (`44`) plus single-arch `44-amd64` / `44-arm64`.
Both registries carry the same digests. CVE badges come from the 6-hourly
[`rescan.yml`](.github/workflows/rescan.yml); Quay pull badges (last ~3 months) are
refreshed daily by [`quay-pulls-badge.yml`](.github/workflows/quay-pulls-badge.yml).

| Distro | Versions | Image (`quay.io/iamenr0s/`, `docker.io/iamenr0s/`) | Base |
|---|---|---|---|
| Fedora | 43, 44 | `fedora-hardened-bootc` | `fedora-hardened:<ver>-full` |
| AlmaLinux | 10 | `almalinux-hardened-bootc` | `almalinux-hardened:10-full` |
| Rocky Linux | 10 | `rockylinux-hardened-bootc` | `rockylinux-hardened:10-full` |
| CentOS Stream | 10 | `centos-hardened-bootc` | `centos-hardened:10-full` |

## Defaults

- SSH: no root login, key-only ([`40-hardening.conf`](images/common/files/etc/ssh/sshd_config.d/40-hardening.conf)).
- Root locked; no users or keys baked in. Provision with cloud-init (included), a
  bootc-image-builder `config.toml`, or `bootc install --root-ssh-authorized-keys`.
- composefs root, read-only `/sysroot`; `/home`, `/root`, `/opt`, `/srv`, `/mnt` live in `/var`.
- Enabled: sshd, NetworkManager, chronyd, cloud-init, bootloader-update.
- `passwd` is not setuid (stripped by the hardened base), so users can't set their own
  passwords. Intended with key-only SSH.

## Develop

Needs rootful podman. The boot test also needs KVM, qemu and OVMF.

```bash
sudo scripts/build.sh centos 10                                # build + bootc container lint
sudo podman save --format oci-dir -o /tmp/oci localhost/centos-hardened-bootc:10
scripts/scan.sh /tmp/oci                                       # grype + trivy CVE gate
sudo scripts/boot-test.sh localhost/centos-hardened-bootc:10   # install to disk, boot to login
```

```
images/Containerfile          # shared by all distros; BASE_IMAGE is a build arg
images/common/bootc-setup.sh  # hardened base -> bootc (kernel, bootloader, ostree, /var layout)
images/common/files/          # copied into every image
images/<distro>/<ver>/env     # BASE_IMAGE=quay.io/iamenr0s/<distro>-hardened:<ver>-full
scripts/                      # build, scan, boot-test, install-scanners
policies/                     # grype.yaml (CVE exceptions), trivy.yaml
```

**Adding a distro/version:** add `images/<distro>/<ver>/env`; CI builds one matrix row per
env file, no per-distro code needed. End-of-life releases (e.g. Fedora 42) are not shipped.
EL8/EL9 bases fail on purpose: their rpmdb lives in `/var/lib/rpm` (see `bootc-setup.sh`).

## CI and vulnerability scanning

| Workflow | When | Does |
|---|---|---|
| `build.yml` | PR, push to `main`, nightly 05:17 UTC | Build on native amd64/arm64, CVE gate, boot test (amd64, KVM). On `main`/nightly: push per-arch tags, then one multi-arch manifest **per distro** (a failed distro doesn't block the others; manifests only ever point at gated images). |
| `rescan.yml` | every 6 h | Scan published images; open or update one `security` issue per distro+version; write CVE badges. |
| `quay-pulls-badge.yml` | daily | Refresh pull badges. |

**Gate:** `scripts/scan.sh` runs grype and trivy and fails on any **fixable** High/Critical.
Scanners are pinned release binaries verified against published checksums
(`scripts/install-scanners.sh`; no `curl | sh`). The rescan runs grype only.

**Exceptions** live in `policies/grype.yaml`; each needs a reason and a review date:

- CentOS Stream `el10_N` mismatch: grype expects RHEL point releases (`el10_2`) that Stream never ships.
- Unpublished distro fixes: the fix exists upstream (RHEL, PyPI) but not yet in the distro's
  repo (e.g. AlmaLinux kernel/expat, Fedora urllib3). Pinned to the installed version, so they expire
  when the image ships a newer one.
- Go modules inside RPM-owned binaries (only a distro rebuild fixes them).
- `vmlinuz` matched against NVD ranges (the kernel RPM is still gated via distro advisories).

### Build failed on a CVE?

1. `gh run list --limit 5`, then `gh run view <id> --log-failed | grep -E 'High|Critical'`
   for the package, installed version and "fixed in" version.
2. Check the fix is really unpublished, inside the base image CI uses:
   `podman run --rm quay.io/iamenr0s/<distro>-hardened:<ver>-full sh -c 'dnf repoquery --latest-limit=1 --qf "%{name}-%{evr}" <pkg>'`
   (not `dnf list --upgrades`). If it is published, rebuild instead of ignoring.
3. Add a pinned ignore to `policies/grype.yaml` (installed version, "verified" date, review
   date ~10 days out), on a branch, and open a PR. Confirm both grype and trivy pass.
4. Build step failing on `repomd.xml` checksum? That's a mirror mid-sync: rerun the job.

## Maintenance

[Renovate](renovate.json) runs weekly (Mon before 06:00 Europe/London; security fixes any time):
SHA-pins GitHub Actions, bumps grype/trivy in `install-scanners.sh`, and automerges non-major
updates once CI is green. Runner images are bumped by hand so both arches move together. Base
images need no updates: every build pulls the current hardened tag.

### One-time CI setup

1. Optional variables `DOCKERHUB_ORG`, `QUAY_ORG` (default: repository owner).
2. A **`release` environment** with secrets `DOCKERHUB_USERNAME`, `DOCKERHUB_TOKEN`,
   `QUAY_USERNAME`, `QUAY_TOKEN`, and a deployment branch policy limited to `main`
   (PR builds never see credentials).
3. Make the Quay `<distro>-hardened-bootc` repos **public** (badges and rescan read anonymously).
4. Create the orphan **`badges`** branch the badge workflows push to.
5. Enable private vulnerability reporting and branch protection with Code Owners review.

## Contributing, security, license

See [CONTRIBUTING.md](CONTRIBUTING.md) (checks and PR checklist),
[CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) and [SECURITY.md](SECURITY.md) (private reporting only).
Licensed under the [MIT License](LICENSE). Author: iamenr0s.
