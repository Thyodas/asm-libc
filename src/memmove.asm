bits 64
global memmove

section .text
memmove:
    ; rdi, rsi, rdx, rcx
    push    rbp
    mov     rbp, rsp

    mov rax, rdi
    mov rcx, rdx
    cld
    cmp rdi, rsi
    jl start
    add rdi, rdx
    add rsi, rdx
    std

    start:
        repnz movsb

    mov     rsp, rbp
    pop     rbp
    ret
