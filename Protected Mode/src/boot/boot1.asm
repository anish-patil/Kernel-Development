ORG 0x7c00
BITS 16

CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start

;BPB expects short jump so we can trick it to write code in fake BPB created with NULL bytes
_start:
    jmp short start
    nop
times 33 db 0 ;Why 33 bytes; to fill BIOS parameter block(BPB) with NULL bytes

start:
    jmp 0:step2 ;makes our CS to become 0x7c0 since our origin is 0


step2:

    cli ;Disables Interrupts
    mov ax,0x00
    mov ds,ax
    mov es,ax
    mov ss,ax
    mov sp,0x7c00
    sti ;Enables Interrupts

.load_protected:
    cli
    lgdt[gdt_descriptor]
    mov eax,cr0
    or eax,0x1 
    mov cr0,eax
    jmp CODE_SEG:load32

;GDT- Global Descriptor Table
gdt_start:    
gdt_null:
    dd 0x0
    dd 0x0
;offset 0x08
gdt_code:     ;CS should point to this
    dw 0xffff ; Segment limit first 0-15 bits
    dw 0      ; Base first 0-15 bits 
    db 0      ; Base 16-23
    db 0x9a   ; Access byte
    db 11001111b; high 4 bit flags and low 4 bit flags
    db 0       ; Base 24-31 bits

;offset 0x10
gdt_data:   ;DS SS ES FS GS linked to this
    dw 0xffff ; Segment limit first 0-15 bits
    dw 0      ; Base first 0-15 bits
    db 0      ; Base 16-23
    db 0x92   ; Access byte
    db 11001111b; high 4 bit flags and low 4 bit flags
    db 0       ; Base 24-31 bits

gdt_end:

gdt_descriptor:
    dw gdt_end - gdt_start-1
    dd gdt_start

[BITS 32]
load32:
;Setting up all register in protected mode
    mov ax,DATA_SEG
    mov ds,ax
    mov es,ax
    mov fs,ax
    mov gs,ax
    mov ss,ax
    mov ebp,0x00200000    ;ebp- Base pointer
    mov esp,ebp

    ;Enabling A20 Line to access above 1MB limit
    in al,0x92
    or al,2
    out 0x92,al

    jmp $

times 510 -($ - $$) db 0
dw 0xAA55
