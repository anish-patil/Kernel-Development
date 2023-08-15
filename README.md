# Kernel-Development

Kernel development refers to the process of creating and maintaining the core component of an operating system known as the kernel. 
The kernel is a piece of software that acts as a bridge between the hardware and the user-level applications, enabling them to communicate and interact with the computer's hardware resources such as memory, processors, and devices.

## Real-Mode

Real mode is a CPU operating mode found in x86-based computer systems. In this mode, the processor operates in a manner similar to the early Intel 8086 processor, which set the architecture's original design.
Learnt to develop an actual bootloader and boot a message from hardware, it does not require any OS

## Protected-Mode
Protected Mode is a CPU operating mode in x86-based computer systems that offers advanced memory protection and multitasking capabilities compared to the simpler Real Mode. 

### Global-Descriptor-Table

The Global Descriptor Table (GDT) is a data structure used in x86-based computer systems, particularly those using the Protected Mode of the x86 architecture. The GDT is a part of the memory management mechanism and is used to define the memory segments and access privileges for those segments in a protected mode environment.

The Global Descriptor Table (GDT) is like a special book that lists out all these rules for each section of the memory. It's like a big instruction manual that tells the computer's brain (the processor) how to handle different parts of memory.

### Creating-Cross-Compiler

Creating a cross-compiler for compiling C code to run in protected mode on a different architecture or platform involves several steps and can be a complex process. The Linkl below gives an overview on how to do it

[Setup-Guide](https://wiki.osdev.org/GCC_Cross-Compiler)

#### Download-Binutils

[Binutils](https://www.gnu.org/software/binutils/)

#### Download-GCC
Go to the link below and click on 

[GCC](https://www.gnu.org/software/gcc/mirrors.html)

"France (no snapshots): (ftp.lip6.fr), thanks to ftpmaint@lip6.fr"
remove 'ftp' protocol and add instead 'https'
