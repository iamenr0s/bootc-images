#!/usr/bin/env bash
# Install an image to a raw disk with its own bootc, boot it under KVM/UEFI,
# and pass once the serial console reaches a login prompt with no failed units.
# Usage (as root): scripts/boot-test.sh <image-ref>
# Needs: podman, qemu-system-x86_64, OVMF, /dev/kvm. The image must already be
# in root's container storage.
set -euo pipefail

IMAGE="${1:?image ref required}"
OVMF="${OVMF:-/usr/share/ovmf/OVMF.fd}"
TIMEOUT="${TIMEOUT:-300}"

work="$(mktemp -d)"
qpid=""
trap '[ -n "${qpid}" ] && kill "${qpid}" 2>/dev/null; rm -rf "${work}"' EXIT

truncate -s 10G "${work}/disk.raw"
podman run --rm --privileged --pid=host \
  --security-opt label=type:unconfined_t \
  -v /dev:/dev -v /var/lib/containers:/var/lib/containers -v "${work}:/output" \
  "${IMAGE}" \
  bootc install to-disk --via-loopback --generic-image \
    --karg console=ttyS0,115200n8 /output/disk.raw

qemu-system-x86_64 -enable-kvm -cpu host -m 2048 -smp 2 \
  -bios "${OVMF}" \
  -drive "file=${work}/disk.raw,format=raw,if=virtio" \
  -display none -monitor none -serial "file:${work}/serial.log" &
qpid=$!

for ((waited = 0; waited < TIMEOUT; waited += 5)); do
  if grep -q '\[FAILED\]' "${work}/serial.log" 2>/dev/null; then
    grep '\[FAILED\]' "${work}/serial.log" >&2
    echo "boot test: failed units" >&2
    exit 1
  fi
  if grep -q 'login:' "${work}/serial.log" 2>/dev/null; then
    echo "boot test: reached login prompt after ~${waited}s"
    exit 0
  fi
  kill -0 "${qpid}" 2>/dev/null || break
  sleep 5
done

tail -n 50 "${work}/serial.log" >&2 || true
echo "boot test: no login prompt within ${TIMEOUT}s" >&2
exit 1
