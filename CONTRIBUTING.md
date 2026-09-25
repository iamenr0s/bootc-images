# Contributing

Thanks for taking the time to contribute to `bootc-images`!

## Getting started

1. Fork the repository and create your branch from `main`.
2. You need rootful `podman`, plus `shellcheck`, `grype` and `trivy` for the checks
   below. For the boot test you also need `qemu-system-x86_64`, OVMF and `/dev/kvm`.

## Making changes

- Keep changes small and focused, one topic per pull request.
- Images are layered on the published
  [docker-hardened-images](https://github.com/iamenr0s/docker-hardened-images) `-full`
  images. Don't switch to upstream `*-bootc` bases or rebuild the rootfs.
- Layout: one shared `images/Containerfile`, shared `images/common/` (setup script and
  files), and one `images/<distro>/<version>/env` per OS version. Put per-distro logic
  in `bootc-setup.sh` only when a distro really differs, and say why in a comment.
- Adding a distro or version means adding its `env` file. CI builds one matrix row per env file.
- Keep the image bootc-native: no secrets, passwords or keys in the image, and no
  package-based host upgrades. `/var` content needs a `tmpfiles.d` entry, and
  `bootc container lint` enforces that.
- Vulnerability ignores in `policies/grype.yaml` need a reason and a review date.

## Testing

Before opening a pull request, run the checks for the image(s) you touched:

```bash
sudo scripts/build.sh centos 10                        # build + bootc container lint
sudo podman save --format oci-dir -o /tmp/oci localhost/centos-hardened-bootc:10
scripts/scan.sh /tmp/oci                               # grype + trivy CVE gate
sudo scripts/boot-test.sh localhost/centos-hardened-bootc:10   # needs KVM
shellcheck scripts/*.sh images/common/*.sh
```

## Submitting a pull request

1. Make sure the checks above pass for the image(s) you changed.
2. Fill in the pull request template.
3. A maintainer will review your PR. CI (build, lint, CVE gate, boot test) must be green before merge.

## Reporting bugs and requesting features

Use the issue templates. They ask for the details (distro, version, architecture,
deployment method) needed to reproduce a problem. Report security issues privately
as described in [SECURITY.md](SECURITY.md).

## Code of Conduct

This project follows the [Contributor Covenant Code of Conduct](CODE_OF_CONDUCT.md). By participating you agree to abide by it.
