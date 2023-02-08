bits 64
global strlen

section .text
strlen:
    ; rdi, rsi, rdx, rcx
    push    rbp
    mov     rbp, rsp

    xor     rcx, rcx
    cmp byte [rdi], 0
    jz end
    loop:
        inc rcx
        cmp byte [rdi+rcx], 0
        jnz loop
    end:
    mov rax, rcx

    mov     rsp, rbp
    pop     rbp
    ret
