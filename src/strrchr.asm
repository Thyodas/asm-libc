bits 64
global strrchr

section .text
strrchr:
    ; rdi, rsi, rdx, rcx
    push    rbp
    mov     rbp, rsp

    xor rax, rax
    loop:
        cmp byte [rdi], sil
        je  found

        cmp byte [rdi], 0
        jz  end

        inc rdi
        jmp loop
        found:
            mov rax, rdi
            inc rdi
            cmp byte [rax], 0
            jnz loop
    end:

    mov     rsp, rbp
    pop     rbp
    ret
