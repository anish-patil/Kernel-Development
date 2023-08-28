ENTRY(_start)
OUTPUT_FORMAT(binary)
SECTIONS
{
    . = 1M;
    /* For Code*/
    .text : ALIGN(4096) /*ALIGN(4096) specifies that the section should be aligned to a 4096-byte (4 KB) boundary.*/
    {
        *(.text)
    } 
    /*For read only data*/
    .rodata : ALIGN(4096)
    {
        *(.rodata)
    }
    /*For initialised data*/
    .data : ALIGN(4096)
    {
        *(.data)
    }
    /*for uninitialised data, variables that arent explicitly initialised*/
    .bss : ALIGN(4096)
    {
        *(COMMON)
        *(.bss)
    }

    .asm : ALIGN(4096)
    {
        *(.asm)
    }
}   