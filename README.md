# Kernel-Development

Kernel development refers to the process of creating and maintaining the core component of an operating system known as the kernel. 
The kernel is a piece of software that acts as a bridge between the hardware and the user-level applications, enabling them to communicate and interact with the computer's hardware resources such as memory, processors, and devices.

## Real-Mode


Real mode is a CPU operating mode found in x86-based computer systems. In this mode, the processor operates in a manner similar to the early Intel 8086 processor, which set the architecture's original design.
Learnt to develop an actual bootloader and boot a message from hardware, it does not require any OS

![Screenshot from 2023-08-15 17-30-02](https://github.com/anish-patil/Kernel-Development/assets/101693650/eab213d8-dae4-4e98-a368-c5f216f83808)


## Protected-Mode
Protected Mode is a CPU operating mode in x86-based computer systems that offers advanced memory protection and multitasking capabilities compared to the simpler Real Mode. 

### Global-Descriptor-Table

The Global Descriptor Table (GDT) is a data structure used in x86-based computer systems, particularly those using the Protected Mode of the x86 architecture. The GDT is a part of the memory management mechanism and is used to define the memory segments and access privileges for those segments in a protected mode environment.

The Global Descriptor Table (GDT) is like a special book that lists out all these rules for each section of the memory. It's like a big instruction manual that tells the computer's brain (the processor) how to handle different parts of memory.

### ATA_LBA_READ
Here's how the ***ata_lba_read*** function works and how it might be connected to kernel development:

   - **Initialization and Setup:**
        The function starts by backing up the value in the eax register to ebx for later restoration.
        The code then prepares the necessary control signals for sending various parts of the Logical Block Address (LBA) to the storage device's control registers.

   - **Sending LBA and Control Signals:**
        The highest 8 bits of the LBA are extracted using shr eax, 24 and combined with control bits to form a command that is sent to the _0x1F6_ port. This sets up the drive and head selection for the device.
        The lower bits of the LBA, the total number of sectors to read, and more bits of the LBA are sent to their respective ports to inform the storage device about the read operation.

   - **Initiating Read Operation:**
        The _0x1F7_ port is used to send a command that initiates the read operation (```mov al, 0x20``` and ```out dx, al```). This tells the storage device to start reading data sectors.

   - **Waiting for Device to Be Ready:**
        A loop labeled ```.try_again``` repeatedly checks the status of the storage device using the in al, dx instruction. The status byte's "busy" bit is tested to ensure the device is ready for the next operation.

   - **Reading Data Sectors:**
        After the device is ready, the code uses insw to read a word (16 bits) of data from the data port (_0x1F0_) of the storage device into memory. This is repeated in a loop to read multiple sectors.

   - **Looping for Multiple Sectors:**
        The loop .next_sector instruction repeats the data reading process for a specified number of iterations (sectors), as determined by the initial value of ecx.

   - **Returning and Concluding:**
        After reading all the necessary sectors, the function ends with a ret instruction, returning control to the caller.
    
### Creating-Cross-Compiler

Creating a cross-compiler for compiling C code to run in protected mode on a different architecture or platform involves several steps and can be a complex process. The Link below gives an overview on how to do it.

[Setup-Guide](https://wiki.osdev.org/GCC_Cross-Compiler)

#### Download-Binutils

[Binutils](https://www.gnu.org/software/binutils/)

#### Download-GCC

[GCC](https://ftp.lip6.fr/pub/gcc/)


