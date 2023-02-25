bits 64
global memfrob

section .text
memfrob:
    ; rdi, rsi, rdx, rcx
    push    rbp
    mov     rbp, rsp

    mov rax, rdi
    cmp rsi, 0
    jz  end
    loop:
        xor  byte [rdi], 42
        inc  rdi
        dec  rsi
        jnz  loop
    end:

    mov     rsp, rbp
    pop     rbp
    ret
