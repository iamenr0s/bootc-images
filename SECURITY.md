# Security Policy

## Supported Versions

Only the current tag of each image receives security fixes. Images are rebuilt
nightly from the latest docker-hardened-images base and the distro's live repos.
Deployed hosts pick fixes up with `bootc upgrade`.

| Version | Supported |
| ------- | --------- |
| Current version tags on Docker Hub and Quay (e.g. `centos-hardened-bootc:10`) | ✅ |
| Per-arch tags (`-amd64`, `-arm64`) | ✅ (same builds as the version tag) |
| Pinned digests of older builds | ❌ |

## Reporting a Vulnerability

Please **do not** open a public issue for security vulnerabilities.

Instead, report them privately via [GitHub private vulnerability reporting](https://github.com/iamenr0s/bootc-images/security/advisories/new).

Include a description of the issue, steps to reproduce, and the affected image,
tag, architecture and deployment method (bootc-image-builder, `bootc install`, ...) if relevant.

You can expect an initial response within 7 days. Once the issue is confirmed, a fix
will be released as soon as practical (through the CVE gate and build pipeline), and
you will be credited in the release notes unless you prefer otherwise.

Vulnerabilities in the hardened base userspace belong upstream in
[docker-hardened-images](https://github.com/iamenr0s/docker-hardened-images/security/advisories/new).

## Automated scanning

Every build is gated on grype and trivy: no fixable High/Critical findings before push
(`scripts/scan.sh`). Published images are rescanned every 6 hours (`rescan.yml`), and
newly found CVEs automatically open a `security`-labeled issue.
