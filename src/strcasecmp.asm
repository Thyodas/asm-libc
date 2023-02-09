bits 64
global strcasecmp

section .text
chrToLower:
    push    rbp
    mov     rbp, rsp

    mov r12, rdi
    mov al, r12b

    cmp r12b, 'A'
    jb endChrToLower

    cmp r12b, 'Z'
    ja endChrToLower

    add al, ('a' - 'A')

    endChrToLower:
    mov     rsp, rbp
    pop     rbp
    ret

strcasecmp:
    ; rdi, rsi, rdx, rcx
    push    rbp
    mov     rbp, rsp
    push r10
    push r11
    push r12

    loop:
        mov r10b, byte [rdi]
        mov r11b, byte [rsi]

        cmp r10b, 0
        jz  end
        cmp r11b, 0
        jz  end

        push rdi

        mov rdi, r10
        call chrToLower
        mov r10b, al

        mov rdi, r11
        call chrToLower
        mov r11b, al

        pop rdi

        cmp r10b, r11b
        jne  end

        inc rdi
        inc rsi
        jmp loop
    end:

    xor     rax, rax
    xor     rcx, rcx
    movzx   rax, r10b
    movzx   rcx, r11b
    sub     rax, rcx


    pop r12
    pop r11
    pop r10
    mov     rsp, rbp
    pop     rbp
    ret
