# Welcome to Real-Mode

Real mode is a CPU operating mode found in x86-based computer systems. In this mode, the processor operates in a manner similar to the early Intel 8086 processor, which set the architecture's original design.

## Hello World on Bootloader

[Ralph Brown's Interrupt List](https://www.ctyme.com/intr/int.htm)

To see disassembly output

    ```terminal
    ndisasm ./boot.bin
    ```

Hello World on Qemu Emulator i.e bootloader

    ```terminal
    qemu-system-x86_64 -hda ./boot.bin
    ```
![Screenshot from 2023-08-15 17-30-02](https://github.com/anish-patil/Kernel-Development/assets/101693650/eab213d8-dae4-4e98-a368-c5f216f83808)

## Understanding Real Mode
