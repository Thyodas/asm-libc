bits 64
global strcmp

section .text
strcmp:
    ; rdi, rsi, rdx, rcx
    push    rbp
    mov     rbp, rsp

    xor     rax, rax
    xor     rcx, rcx
    loop:
        mov r10b, byte [rdi]
        mov r11b, byte [rsi]

        cmp r10b, 0
        jz  end
        cmp r11b, 0
        jz  end
        cmp r10b, r11b
        jne  end

        inc rdi
        inc rsi
        jmp loop
    end:

    movzx   rax, r10b
    movzx   rcx, r11b
    sub     rax, rcx

    mov     rsp, rbp
    pop     rbp
    ret
