qemu-system-riscv64 -M virt -m 4096M -nographic -bios ../opensbi/build/platform/generic/firmware/fw_jump.bin -kernel ../rt-thread/bsp/qemu-virt64-riscv/rtthread.bin
