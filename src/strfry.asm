bits 64
global strfry

section .text
strlen:
    ; rdi, rsi, rdx, rcx
    push    rbp
    mov     rbp, rsp

    xor     rax, rax
    cmp byte [rdi], 0
    jz strlenend
    strlenloop:
        inc rax
        inc rdi
        cmp byte [rdi], 0
        jnz strlenloop
    strlenend:

    mov     rsp, rbp
    pop     rbp
    ret


strfry:
    ; rdi, rsi, rdx, rcx
    push    rbp
    mov     rbp, rsp
    push    r8
    push    r9
    push    r10
    push    rbx

    push    rdi
    call    strlen
    pop     rdi
    mov     rcx, rax ; rcx contains rdi str len

    mov rbx, rdi ; rbx is original str ptr
    cmp rdx, 0
    jz  end
    cmp rdx, 1
    jz  end
    mov r10, rcx
    add r10, rcx
    add r10, rcx
    loop:
        rdrand eax ; -> EDX:EAX
        xor edx, edx
        div ecx ; rand index is in edx
        mov esi, edx
        rdrand eax ; -> EDX:EAX
        xor edx, edx
        div ecx ; rand index is in edx
        mov edi, edx
        ; two rand index in esi and edi

        mov r8b, byte [rbx + rsi]
        mov r9b, byte [rbx + rdi]
        mov byte [rbx + rsi], r9b
        mov byte [rbx + rdi], r8b
        dec r10
        cmp r10, 0
        jnz loop
    end:

    mov     rax, rbx

    pop     rbx
    pop     r10
    pop     r9
    pop     r8
    mov     rsp, rbp
    pop     rbp
    ret
