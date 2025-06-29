bits 64
global memset

section .text
memset:
    ; rdi, rsi, rdx, rcx
    push    rbp
    mov     rbp, rsp

    mov rax, rdi
    cmp rdx, 0
    jz  end
    loop:
        mov byte [rdi], sil
        inc rdi
        dec rdx
        jnz  loop
    end:

    mov     rsp, rbp
    pop     rbp
    ret
