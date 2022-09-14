rm *.o
rm *.elf
rm *.img
as -c -o boot.o boot.S
gcc -c -nostdlib -o kernel.o kernel.c -lgcc
ld -T link.ld boot.o kernel.o -o kernel.elf -nostdlib
objcopy kernel.elf -O binary kernel.img
qemu-system-arm -m 128 -M raspi2 -serial stdio -kernel kernel.elf
