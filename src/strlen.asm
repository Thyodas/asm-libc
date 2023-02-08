bits 64
global strlen

section .text
strlen:
    ; rdi, rsi, rdx, rcx
    push    rbp
    mov     rbp, rsp

    xor     rax, rax
    cmp byte [rdi], 0
    jz end
    loop:
        inc rax
        inc rdi
        cmp byte [rdi], 0
        jnz loop
    end:

    mov     rsp, rbp
    pop     rbp
    ret
