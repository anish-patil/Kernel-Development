ORG 0
BITS 16

;BPB expects short jump so we can trick it to write code in fake BPB created with NULL bytes
_start:
    jmp short start
    nop
times 33 db 0 ;Why 33 bytes; to fill BIOS parameter block(BPB) with NULL bytes

start:
    jmp 0x7c0:step2 ;makes our CS to become 0x7c0 since our origin is 0

;Making our own interrupts
handle_zero: 
    mov ah,0eh
    mov al,'C'
    mov bx,0x00
    int 0x10
    iret

handle_one:
    mov ah,0eh
    mov al,'R'
    mov bx,0x00
    int 0x10
    iret

step2:

    cli ;Disables Interrupts
    mov ax,0x7c0
    mov ds,ax
    mov es,ax
    mov ax,0x00
    mov ss,ax
    mov sp,0x7c00
    sti ;Enables Interrupts

    mov word[ss:0x00], handle_zero
    mov word[ss:0x02], 0x7c0

    mov word[ss:0x04], handle_one ;Offset
    mov word[ss:0x06], 0x7c0      ;Segment
   
    int 1;Calling our own made interrupt

    mov si, message
    call print
    jmp $

print: 
    mov bx,0
.loop:
    lodsb
    cmp al,0
    je .done
    call printChar
    jmp .loop

.done:
    ret

printChar:
    mov ah,0eh
    int 0x10
    ret

message: db 'Hello World!', 0

times 510 -($ - $$) db 0
dw 0xAA55