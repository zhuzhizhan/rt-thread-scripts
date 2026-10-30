#!/bin/sh

if [ ! -f "sd.bin" ]; then
    echo "Creating FAT image sd.bin ..."
    dd if=/dev/zero of=sd.bin bs=1M count=64
    mkfs.fat sd.bin
fi

qemu-system-riscv64 -M virt -m 4096M -nographic \
    -bios ../opensbi/build/platform/generic/firmware/fw_jump.bin \
    -kernel ../rt-thread/bsp/qemu-virt64-riscv/rtthread.bin \
    -drive if=none,file=sd.bin,format=raw,id=blk0 \
    -device virtio-blk-device,drive=blk0,bus=virtio-mmio-bus.0
