bits 64
global strncmp

section .text
strncmp:
    ; rdi, rsi, rdx, rcx
    push    rbp
    mov     rbp, rsp
    push r10
    push r11

    xor     rax, rax
    xor     rcx, rcx
    xor     r10b, r10b
    xor     r11b, r11b

    loop:
        cmp rdx, 0
        jz  end

        mov r10b, byte [rdi]
        mov r11b, byte [rsi]

        cmp rdx, 0
        jz  end
        cmp r10b, 0
        jz  end
        cmp r11b, 0
        jz  end
        cmp r10b, r11b
        jne  end

        inc rdi
        inc rsi
        dec rdx
        jmp loop
    end:

    movzx   rax, r10b
    movzx   rcx, r11b
    sub     rax, rcx

    pop r11
    pop r10
    mov     rsp, rbp
    pop     rbp
    ret
