# Welcome to Real-Mode

Real mode is a CPU operating mode found in x86-based computer systems. In this mode, the processor operates in a manner similar to the early Intel 8086 processor, which set the architecture's original design.

## Hello World on Bootloader

To compile the assembly file in initial stages

     nasm -f bin ./boot.asm -o ./boot.bin

To see disassembly output

    ndisasm ./boot.bin

Hello World on Qemu Emulator i.e bootloader

    qemu-system-x86_64 -hda ./boot.bin

### Output

![Screenshot from 2023-08-15 17-30-02](https://github.com/anish-patil/Kernel-Development/assets/101693650/eab213d8-dae4-4e98-a368-c5f216f83808)

## Understanding Real Mode

- Only 1 MB of RAM is accessible
- Based on old x86 architecture
- No Security
- Only 16 BITS is accessible at one time

[Ralph Brown's Interrupt List](https://www.ctyme.com/intr/int.htm)

## Segmentation Memory Model

Accessed by a segment and an offset. Programs can be loaded in different areas of the memory but run without problems. Multiple segements are available with the use of segment registers.

4 types of Data Segments

- DS (Data Segment)
- ES (Extra Segment)
- CS (Code Segment)
- SS (Stack Segment)

### Calc of Absolute Offset

Take the segment multiply by 16 and add the offset.

Example - Segment 0x7cf offset 0x0F.

1. `0x7cf` in hexadecimal = 1999 in decimal.
2. When you multiply 1999 by 16, you get 31984 in decimal.
3. 31984 in decimal = `0x7cf0` in hexadecimal.
4. If you add `0x0f` (15 in decimal) to `0x7cf0`, you get `0x7cff`.

##  Interrupt Vector Table

Interrupts are like subroutines but you don't need to know the memory address to invoke them.

When you invoke an interrupt the processor get interrupted, old state gets saved and pushed to stack.

So the interrupt vector table describes where these interrupt are in the memory 

- We have 256 interrupt handler
- Each entry in table is 4 bytes
- 1st 2 bytes of an entry is the offset in memory and the next 2 bytes are segment in memory.
- Interrupts are in Numerical order.

![IVT Image](https://github.com/anish-patil/Kernel-Development/assets/101693650/d6026d65-4dc7-41a2-be50-810e5ef32484)
