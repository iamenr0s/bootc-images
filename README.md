# BootC Images

[![build](https://img.shields.io/github/actions/workflow/status/iamenr0s/bootc-images/build.yml?label=build&logo=github)](https://github.com/iamenr0s/bootc-images/actions/workflows/build.yml)
[![rescan](https://img.shields.io/github/actions/workflow/status/iamenr0s/bootc-images/rescan.yml?label=rescan&logo=github)](https://github.com/iamenr0s/bootc-images/actions/workflows/rescan.yml)
[![Dependabot](https://img.shields.io/badge/dependabot-enabled-brightgreen?logo=dependabot)](.github/dependabot.yml)
[![License](https://img.shields.io/github/license/iamenr0s/bootc-images)](LICENSE)

Bootable container images layered on
[docker-hardened-images](https://github.com/iamenr0s/docker-hardened-images).
The hardened `full` image supplies a minimal, patched userspace, and
[`images/common/bootc-setup.sh`](images/common/bootc-setup.sh) adds the kernel,
bootloader (bootupd, grub, shim) and ostree/bootc plumbing. Those steps mirror
upstream's minimal manifest, which you can see in
`/usr/share/doc/bootc-base-imagectl/manifests/minimal/` in any `centos-bootc` image.

## Available Images

| Build | CVEs | Quay.io | Docker Hub |
|---|---|---|---|
| [![fedora43](https://img.shields.io/github/actions/workflow/status/iamenr0s/bootc-images/build.yml?label=fedora43&logo=github)](https://github.com/iamenr0s/bootc-images/actions/workflows/build.yml) | [![CVEs](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fiamenr0s%2Fbootc-images%2Fbadges%2Fbadges%2Fcve-fedora-43.json)](https://github.com/iamenr0s/bootc-images/actions/workflows/rescan.yml) | [![Quay Pulls](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fiamenr0s%2Fbootc-images%2Fbadges%2Fbadges%2Fquay-fedora-hardened-bootc.json)](https://quay.io/repository/iamenr0s/fedora-hardened-bootc?tab=tags&tag=43) | [![Docker Pulls](https://img.shields.io/docker/pulls/iamenr0s/fedora-hardened-bootc?logo=docker)](https://hub.docker.com/r/iamenr0s/fedora-hardened-bootc) |
| [![fedora44](https://img.shields.io/github/actions/workflow/status/iamenr0s/bootc-images/build.yml?label=fedora44&logo=github)](https://github.com/iamenr0s/bootc-images/actions/workflows/build.yml) | [![CVEs](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fiamenr0s%2Fbootc-images%2Fbadges%2Fbadges%2Fcve-fedora-44.json)](https://github.com/iamenr0s/bootc-images/actions/workflows/rescan.yml) | [![Quay Pulls](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fiamenr0s%2Fbootc-images%2Fbadges%2Fbadges%2Fquay-fedora-hardened-bootc.json)](https://quay.io/repository/iamenr0s/fedora-hardened-bootc?tab=tags&tag=44) | [![Docker Pulls](https://img.shields.io/docker/pulls/iamenr0s/fedora-hardened-bootc?logo=docker)](https://hub.docker.com/r/iamenr0s/fedora-hardened-bootc) |
| [![almalinux10](https://img.shields.io/github/actions/workflow/status/iamenr0s/bootc-images/build.yml?label=almalinux10&logo=github)](https://github.com/iamenr0s/bootc-images/actions/workflows/build.yml) | [![CVEs](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fiamenr0s%2Fbootc-images%2Fbadges%2Fbadges%2Fcve-almalinux-10.json)](https://github.com/iamenr0s/bootc-images/actions/workflows/rescan.yml) | [![Quay Pulls](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fiamenr0s%2Fbootc-images%2Fbadges%2Fbadges%2Fquay-almalinux-hardened-bootc.json)](https://quay.io/repository/iamenr0s/almalinux-hardened-bootc?tab=tags&tag=10) | [![Docker Pulls](https://img.shields.io/docker/pulls/iamenr0s/almalinux-hardened-bootc?logo=docker)](https://hub.docker.com/r/iamenr0s/almalinux-hardened-bootc) |
| [![rockylinux10](https://img.shields.io/github/actions/workflow/status/iamenr0s/bootc-images/build.yml?label=rockylinux10&logo=github)](https://github.com/iamenr0s/bootc-images/actions/workflows/build.yml) | [![CVEs](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fiamenr0s%2Fbootc-images%2Fbadges%2Fbadges%2Fcve-rockylinux-10.json)](https://github.com/iamenr0s/bootc-images/actions/workflows/rescan.yml) | [![Quay Pulls](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fiamenr0s%2Fbootc-images%2Fbadges%2Fbadges%2Fquay-rockylinux-hardened-bootc.json)](https://quay.io/repository/iamenr0s/rockylinux-hardened-bootc?tab=tags&tag=10) | [![Docker Pulls](https://img.shields.io/docker/pulls/iamenr0s/rockylinux-hardened-bootc?logo=docker)](https://hub.docker.com/r/iamenr0s/rockylinux-hardened-bootc) |
| [![centos10](https://img.shields.io/github/actions/workflow/status/iamenr0s/bootc-images/build.yml?label=centos10&logo=github)](https://github.com/iamenr0s/bootc-images/actions/workflows/build.yml) | [![CVEs](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fiamenr0s%2Fbootc-images%2Fbadges%2Fbadges%2Fcve-centos-10.json)](https://github.com/iamenr0s/bootc-images/actions/workflows/rescan.yml) | [![Quay Pulls](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fiamenr0s%2Fbootc-images%2Fbadges%2Fbadges%2Fquay-centos-hardened-bootc.json)](https://quay.io/repository/iamenr0s/centos-hardened-bootc?tab=tags&tag=10) | [![Docker Pulls](https://img.shields.io/docker/pulls/iamenr0s/centos-hardened-bootc?logo=docker)](https://hub.docker.com/r/iamenr0s/centos-hardened-bootc) |

Each distro's versions are published as tags of a single `<distro>-hardened-bootc`
repository per registry (`docker.io/iamenr0s/...` and `quay.io/iamenr0s/...`, same digests),
so pull counters are repo-wide within a distro. The Quay badges show pulls over the
last ~3 months (Quay exposes no all-time counter); refreshed daily by
[`quay-pulls-badge.yml`](.github/workflows/quay-pulls-badge.yml). CVE badges come
from the 6-hourly [`rescan.yml`](.github/workflows/rescan.yml).

## Image catalog

| Distro | Versions | Image | Tags | Base (docker-hardened-images) |
|---|---|---|---|---|
| Fedora | 43, 44 | `fedora-hardened-bootc` | `43`, `43-amd64`, `43-arm64`, `44`, `44-amd64`, `44-arm64` | `fedora-hardened:43-full`, `fedora-hardened:44-full` |
| AlmaLinux | 10 | `almalinux-hardened-bootc` | `10`, `10-amd64`, `10-arm64` | `almalinux-hardened:10-full` |
| RockyLinux | 10 | `rockylinux-hardened-bootc` | `10`, `10-amd64`, `10-arm64` | `rockylinux-hardened:10-full` |
| CentOS Stream | 10 | `centos-hardened-bootc` | `10`, `10-amd64`, `10-arm64` | `centos-hardened:10-full` |

The bare version tag (e.g. `44`) is a multi-arch manifest (amd64 + arm64). The
`-amd64`/`-arm64` tags point at the single-arch images behind it. Pull from either registry:

```bash
podman pull quay.io/iamenr0s/fedora-hardened-bootc:44
podman pull docker.io/iamenr0s/fedora-hardened-bootc:44
```

## Defaults

- SSH: no root login, key-only (`images/common/files/etc/ssh/sshd_config.d/40-hardening.conf`)
- root locked; no users or keys baked in. Provision them with cloud-init (included),
  or with a bootc-image-builder `config.toml` or `bootc install --root-ssh-authorized-keys`
- composefs root, read-only `/sysroot`; `/home`, `/root`, `/opt`, `/srv`, `/mnt` live in `/var`
- Enabled: sshd, NetworkManager, chronyd, cloud-init, bootloader-update
- `passwd` is not setuid (stripped by the hardened base), so users can't change their
  own passwords. That's intended with key-only SSH.

## Layout

```
images/
  Containerfile            # shared by every distro; BASE_IMAGE is a build arg
  common/bootc-setup.sh    # hardened base -> bootc (kernel, bootloader, ostree, /var layout)
  common/files/            # copied into every image
  <distro>/<version>/env   # BASE_IMAGE=quay.io/iamenr0s/<distro>-hardened:<version>-full
scripts/build.sh           # build one distro/version
scripts/boot-test.sh       # install to disk + KVM boot to login prompt
```

### Adding a distro

Add `images/<distro>/<version>/env` pointing at that distro's hardened `-full`
image. CI builds one matrix row per env file. All catalog images build, lint and
pass the CVE gate with no per-distro code. End-of-life releases (e.g. Fedora 42,
`SUPPORT_END=2026-05-27`) are not shipped: they get no security updates. EL8/EL9 bases fail on
purpose, because their rpmdb lives in `/var/lib/rpm` (see `bootc-setup.sh`).

## Build

Rootful podman (bootc install and the boot test use root's storage):

```bash
sudo scripts/build.sh centos 10        # -> localhost/centos-hardened-bootc:10
```

The build ends with `bootc container lint`. Boot test (needs KVM, qemu and OVMF):

```bash
sudo scripts/boot-test.sh localhost/centos-hardened-bootc:10
```

## Deploy and update

Build disk images with
[bootc-image-builder](https://github.com/osbuild/bootc-image-builder), or run
`bootc install to-disk` from the image. On a deployed host:

```bash
sudo bootc switch quay.io/iamenr0s/centos-hardened-bootc:10   # first time only (or docker.io/...)
sudo bootc upgrade      # stage the new image, applied on next boot
sudo bootc rollback     # go back to the previous deployment
```

`/etc` is 3-way merged on upgrade: if you edit an image-shipped file locally,
later image versions won't overwrite it. `/var` is never touched by upgrades.

## Vulnerability scanning

The same approach as docker-hardened-images:

1. **Gate before push:** every build (each arch) runs `scripts/scan.sh`, which is grype
   plus trivy (vulnerabilities and secrets). CI fails on any **fixable** High/Critical.
2. **Continuous rescan:** `rescan.yml` scans the published images every 6 hours and
   opens a `security`-labeled issue on new findings.
3. **Documented exceptions:** `policies/grype.yaml` ignores only false "fixable"
   matches, and each has a reason and a review date. Three classes today:
   - CentOS Stream's version scheme: grype expects RHEL `el10_N` releases that Stream
     never ships (confirmed with `dnf check-update`).
   - Go modules inside RPM-owned binaries: trivy skips these too, and only a distro
     rebuild fixes them.
   - `vmlinuz` matched against NVD ranges: the kernel RPM is still gated through the
     distro's own advisories.

Scanners are pinned release binaries, verified against their published checksums
(`scripts/install-scanners.sh`, no `curl | sh`).

## CI

`.github/workflows/build.yml` builds on native amd64 and arm64 runners, runs the CVE
gate and boot-tests amd64 under KVM. Pushes to `main` and the nightly run (05:17 UTC,
after the hardened images' nightly) publish per-arch tags and a multi-arch manifest
to Docker Hub and Quay.

### CI setup (one-time)

1. Optional repository **variables** `DOCKERHUB_ORG`, `QUAY_ORG`: registry namespaces.
   Both default to the GitHub repository owner.
2. Create a **`release` environment** (Settings -> Environments) holding the secrets
   `DOCKERHUB_USERNAME`, `DOCKERHUB_TOKEN`, `QUAY_USERNAME`, `QUAY_TOKEN`, with its
   **deployment branch policy restricted to `main`**. No other branch or workflow can
   reach the push credentials, and PR builds run without them.
3. Make the `<distro>-hardened-bootc` repositories **public** on Quay (new Quay repos
   are private by default); the rescan and pull badges read them anonymously.
4. Create the orphan **`badges`** branch that the badge workflows push to
   (an empty orphan branch pushed to `origin badges` is enough).
5. Enable **private vulnerability reporting** and, in branch protection,
   **Require review from Code Owners**.

## Contributing

Contributions are welcome — see [CONTRIBUTING.md](CONTRIBUTING.md) for the
local pipeline commands and pull request checklist. This project follows the
[Contributor Covenant Code of Conduct](CODE_OF_CONDUCT.md).

## Security

See [SECURITY.md](SECURITY.md) — GitHub private vulnerability reporting, no
public issues for security bugs.

## License

This project is licensed under the [MIT License](LICENSE).

## Author Information

Author: iamenr0s
