bits 64
global ffs

section .text
ffs:
    ; rdi, rsi, rdx, rcx
    push    rbp
    mov     rbp, rsp

    xor     rax, rax
    cmp     edi, 0
    jz end
    loop:
        inc rax
        mov esi, edi
        and esi, 1
        cmp esi, 1
        je end
        shr edi, 1
        cmp rax, 33
        jne loop
    end:

    mov     rsp, rbp
    pop     rbp
    ret
