default rel
bits 64

global strstr

section .text
strlen:
    ; rdi, rsi, rdx, rcx
    push    rbp
    mov     rbp, rsp

    xor     rax, rax
    cmp byte [rdi], 0
    jz endStrlen
    loopStrlen:
        inc rax
        inc rdi
        cmp byte [rdi], 0
        jnz loopStrlen
    endStrlen:

    mov     rsp, rbp
    pop     rbp
    ret

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

    loopStrncmp:
        cmp rdx, 0
        jz  end

        mov r10b, byte [rdi]
        mov r11b, byte [rsi]

        cmp rdx, 0
        jz  endStrncmp
        cmp r10b, 0
        jz  endStrncmp
        cmp r11b, 0
        jz  endStrncmp
        cmp r10b, r11b
        jne  endStrncmp

        inc rdi
        inc rsi
        dec rdx
        jmp loopStrncmp
    endStrncmp:

    movzx   rax, r10b
    movzx   rcx, r11b
    sub     rax, rcx

    pop r11
    pop r10
    mov     rsp, rbp
    pop     rbp
    ret

strstr:
    ; rdi, rsi, rdx, rcx
    push    rbp
    mov     rbp, rsp

    push    rdi
    mov     rdi, rsi

    call    strlen

    mov     rdx, rax    ; rdx = rsi string len
    pop     rdi

    mov     rax, rdi
    cmp     rdx, 0
    jz      end

    loop:
        push    rdi
        push    rsi
        push    rdx
        call    strncmp
        pop     rdx
        pop     rsi
        pop     rdi

        cmp     rax, 0
        jz      loopEnd

        inc     rdi
        jmp     loop
    loopEnd:

    xor     rax, rax
    cmp     byte [rdi], 0
    jz      end

    mov     rax, rdi

    end:
    mov     rsp, rbp
    pop     rbp
    ret
