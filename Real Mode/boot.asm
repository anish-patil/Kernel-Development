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
; handle_zero: 
; mov ah,0eh
; mov al,'C'
; mov bx,0x00
; int 0x10
; iret


step2:

    cli ;Disables Interrupts
    mov ax,0x7c0
    mov ds,ax
    mov es,ax
    mov ax,0x00
    mov ss,ax
    mov sp,0x7c00
    sti ;Enables Interrupts

    mov ah,02h  ;Read Sector Command
    mov al,1    ;One Sector to read
    mov ch,0    ;Cylinder number low eight bits
    mov cl,2    ;Read Sector 2
    mov dh,0    ;head Number(using CHS way)
    mov bx,buffer
    int 0x13
    jc error
    mov si,buffer
    call print
    jmp $
    
    ; mov word[ss:0x00], handle_zero  ;Offset if SS not mentioned, it gets defaulted to DS which is right now pointing to 0x7c00 
    ; mov word[ss:0x02], 0x7c0        ;Segment
    ; int 0;Calling our own made interrupt
    ; mov si, message
    ; call print
error: 
    mov si, error_message
    call print
    jmp $
print: 
    mov bx,0
.loop:
    lodsb   ; DS:SI
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

error_message:
    db 'Failed to Load Sector',0

; message: db 'Hello World!', 0

times 510 -($ - $$) db 0
dw 0xAA55


buffer: