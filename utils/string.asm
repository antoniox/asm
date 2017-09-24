SECTION .data

SECTION .bss
    num_buffer resb 20

SECTION .text
    global format_integer

; In: uint in eax
; Out: address of formatted uint in eax,
;      string length of formatted uint in ebx
; Modifies: eax, ebx
format_integer:
    push ecx
    push edx
    push edi

    xor ecx, ecx
    mov edi, 10

    ; fill num_buffer with digits
.loop: xor edx, edx
    div edi
    add dl, 0x30
    mov byte [num_buffer + ecx], dl
    inc ecx

    cmp eax, 0
    jne .loop 

    ; store num of chars in string into ebx
    mov ebx, ecx
    ; store number of reversals into edi
    mov edi, ecx

    ; loop edi / 2 times
    shr edi, 1

    ; inverse repr to big endian
.inv_loop: cmp edi, ecx
    jae .done

    mov dl, byte [num_buffer + ecx - 1]
    xchg dl, byte [num_buffer + edi]
    xchg dl, byte [num_buffer + ecx - 1]

    dec ecx
    inc edi

    jmp .inv_loop

.done: mov eax, num_buffer

    pop edi
    pop edx
    pop ecx

    ret
