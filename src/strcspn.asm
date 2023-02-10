bits 64
global strcspn

section .text
strchr:
    ; rdi, rsi, rdx, rcx
    push    rbp
    mov     rbp, rsp

    mov rax, rdi
    cmp byte [rdi], sil
    je endStrchr
    xor rax, rax
    cmp byte [rdi], 0
    je endStrchr
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

strcspn:
    ; rdi, rsi, rdx, rcx
    push    rbp
    mov     rbp, rsp

    xor     rcx, rcx
    loop:
        cmp     byte [rdi], 0
        jz      end

        push    rdi
        push    rsi
        mov     rdx, rsi    ; temp for swap
        mov     sil, byte [rdi]
        mov     rdi, rdx
        call    strchr
        pop     rsi
        pop     rdi

        cmp     rax, 0
        jnz     end

        inc     rdi
        inc     rcx
        jmp     loop

    end:
    mov     rax, rcx

    mov     rsp, rbp
    pop     rbp
    ret