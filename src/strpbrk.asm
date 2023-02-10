bits 64
global strpbrk

section .text
strchr:
    ; rdi, rsi, rdx, rcx
    push    rbp
    mov     rbp, rsp

    mov rax, rdi
    cmp byte [rdi], sil
    je end
    xor rax, rax
    cmp byte [rdi], 0
    je end
    loopStrchr:
        inc rdi

        cmp byte [rdi], sil
        je  foundStrchr

        cmp byte [rdi], 0
        jz  endStrchr

        jmp loopStrchr
        foundStrchr:
            mov rax, rdi
            jmp end
    endStrchr:

    mov     rsp, rbp
    pop     rbp
    ret

strpbrk:
    ; rdi, rsi, rdx, rcx
    push    rbp
    mov     rbp, rsp

    loop:
        cmp     byte [rdi], 0
        jz      notFound

        push    rdi
        push    rsi
        mov     rdx, rsi    ; temp for swap
        mov     sil, byte [rdi]
        mov     rdi, rdx
        call    strchr
        pop     rsi
        pop     rdi

        cmp     rax, 0
        jnz     found

        inc     rdi
        jmp     loop
        found:
            mov rax, rdi
            jmp end
        notFound:
            xor rax, rax
            jmp end

    end:
    mov     rsp, rbp
    pop     rbp
    ret