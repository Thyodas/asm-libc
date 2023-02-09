bits 64
global strcmp

section .text
strcmp:
    ; rdi, rsi, rdx, rcx
    push    rbp
    mov     rbp, rsp

    xor rdx, rdx
    loop:
        mov dx, word [rdi]
        sub dx, word [rsi]

        cmp word [rdi], 0
        jz end
        cmp word [rsi], 0
        jz end

        inc rdi
        inc rsi
        jmp  loop
    end:

    xor rax, rax
    mov rax, 0
    cmp dx, 0
    je endprog

    mov rax, -1
    cmp dx, 0
    jl endprog

    mov rax, 1

    endprog:
    mov     rsp, rbp
    pop     rbp
    ret
