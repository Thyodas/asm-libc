bits 64
global strchr

section .text
strchr:
    ; rdi, rsi, rdx, rcx
    push    rbp
    mov     rbp, rsp

    cmp byte [rdi], sil
    je end
    loop:
        inc rdi

        cmp byte [rdi], sil
        je  found

        cmp byte [rdi], 0
        jz  isNull

        jmp loop
        found:
            mov rax, rdi
            jmp end
        isNull:
            mov rax, 0
            jmp end
    end:

    mov     rsp, rbp
    pop     rbp
    ret
