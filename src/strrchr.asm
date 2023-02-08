bits 64
global strrchr

section .text
strrchr:
    ; rdi, rsi, rdx, rcx
    push    rbp
    mov     rbp, rsp

    mov rax, rdi
    cmp byte [rdi], sil
    je end
    xor rax, rax
    cmp byte [rdi], 0
    je end
    loop:
        inc rdi

        cmp byte [rdi], sil
        je  found

        cmp byte [rdi], 0
        jz  end

        jmp loop
        found:
            mov rax, rdi
            cmp byte [rdi], 0
            jnz loop
    end:

    mov     rsp, rbp
    pop     rbp
    ret
