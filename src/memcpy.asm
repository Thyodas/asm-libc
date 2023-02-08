bits 64
global memcpy

section .text
memcpy:
    ; rdi, rsi, rdx, rcx
    push    rbp
    mov     rbp, rsp

    mov rax, rdi
    cmp rdx, 0
    jz  end
    loop:
        mov cl, byte [rsi]
        mov byte [rdi], cl
        inc rdi
        inc rsi
        dec rdx
        jnz  loop
    end:

    mov     rsp, rbp
    pop     rbp
    ret
