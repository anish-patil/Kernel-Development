# Kernel-Development

Kernel development refers to the process of creating and maintaining the core component of an operating system known as the kernel. The kernel is a piece of software that acts as a bridge between the hardware and the user-level applications, enabling them to communicate and interact with the computer's hardware resources such as memory, processors, and devices.

## Steps to Booted System

- BIOS is executed directly from ROM.
- CPU excutes instruction directly from the BIOS's ROM.
- The BIOS loads itself onto RAM.
- BIOS will initialize essential hardware.
- BIOS looks for a bootloader to boot by searching all storage mediums for the  boot signature "0x55AA".
- BIOS loads bootloader into RAM at absolute address "0x7c00".
- BIOS instructs to jump to this absolute boot address and begin executing the OS bootloader.
- BIOS basically contains routines to execute our bootloader which in turn executes our kernel, it is basically a kernel in itself which operates in 16bit mode also known as REAL MODE.

## Writing bootloader to our USB stick

1. Go to your repective directory where the code is written

2. In terminal, to check all the disks in system

   ```terminal
   sudo fdisk -l
   ```

3. Select /dev/sdb as that is your USB stick

   ```terminal
   sudo dd if=./boot.bin of=/dev/sdb
   ```

4. Plug it into your machine and Enter into your BIOS and boot from USB

## Installation for Real Mode Development

1. Install NASM

   ```terminal
   sudo apt install nasm
   ```

2. Install Emulator to run our bootloader and kernel

   ```terminal
   sudo apt install qemu-system-x86
   ```
