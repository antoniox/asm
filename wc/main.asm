SECTION .data

SECTION .bss
    BUF_SIZE equ 1024
    buffer resb BUF_SIZE

SECTION .text
    global _start

    extern format_integer

_start:
    nop

    ; counter will be in edi
    xor edi, edi

    ; read from buffer
.loop: mov eax, 3
    mov ebx, 0
    mov ecx, buffer
    mov edx, BUF_SIZE
    int 0x80

    cmp eax, 0
    jna .done

    add edi, eax
    jmp .loop

.done: mov eax, edi
    call format_integer

    ; returns address of number in eax & size of string in ebx 
    mov ecx, eax
    mov edx, ebx

    ; write to stdout
    mov eax, 4
    mov ebx, 1
    int 0x80

    ; exit
    mov eax, 1
    mov ebx, 0
    int 0x80

    nop
