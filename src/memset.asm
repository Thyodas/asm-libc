bits 64
global memset

section .text
memset:
    ; rdi, rsi, rdx, rcx
    push    rbp
    mov     rbp, rsp

    mov rcx, rdi
    cmp rdx, 0
    jz  end
    loop:
        mov byte [rcx], sil
        inc rcx
        dec rdx
        jnz  loop
    end:

    mov rax, rdi

    mov     rsp, rbp
    pop     rbp
    ret
