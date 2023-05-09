global fnv1a

fnv32_offset    equ 0x811c9dc5
fnv32_prime     equ 0x01000193

section .text

fnv1a:
    ; Hash = rax
    ; Data = rdi
    xor rax, rax
    mov rax, fnv32_offset
    mov r8, fnv32_prime     ; to mul
    ; for each byte of data (until zero is reached)
.hashbyte:
    xor rbx, rbx              ; rbx = 0
    mov bl, BYTE [rdi]      ; bl = *data
    cmp bl, 0
    je .ret
    xor rax, rbx            ; hash = hash ^ *data
    mul r8                  ; hash = hash * fnv_prime
    add rdi, 1
    jmp .hashbyte
.ret:
    ret