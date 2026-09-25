#!/usr/bin/env bash
# Build a bootc image for one distro/version on the host architecture.
# Usage (as root): scripts/build.sh <distro> <version> [image-ref]
#   default image-ref: localhost/<distro>-hardened-bootc:<version>
# Reads BASE_IMAGE from images/<distro>/<version>/env.
set -euo pipefail

DISTRO="${1:?distro required (e.g. centos)}"
VERSION="${2:?version required (e.g. 10)}"
IMAGE="${3:-localhost/${DISTRO}-hardened-bootc:${VERSION}}"

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
ENV_FILE="${ROOT}/images/${DISTRO}/${VERSION}/env"
[ -f "${ENV_FILE}" ] || { echo "no such image: ${ENV_FILE}" >&2; exit 1; }
# shellcheck source=/dev/null
source "${ENV_FILE}"
: "${BASE_IMAGE:?BASE_IMAGE not set in ${ENV_FILE}}"

podman build \
  --pull=always \
  --build-arg BASE_IMAGE="${BASE_IMAGE}" \
  --file "${ROOT}/images/Containerfile" \
  --tag "${IMAGE}" \
  "${ROOT}/images"
