global fnv1a32
global fnv1a64

fnv1a32_offset    equ 0x811c9dc5
fnv1a32_prime     equ 0x01000193

fnv1a64_offset    equ 0xcbf29ce484222325
fnv1a64_prime     equ 0x00000100000001b3

fnv1a32:
    xor rbx, rbx                ; clear buffer for *s
    xor rax, rax                ; clear hash at beginning, since we dont movsx 
                                ; the 32 bit offset into a 64bit register
    mov rax, fnv1a32_offset     ; Lower 32-bits of hash = fnv1a32_offset_basis
    mov r8, fnv1a32_prime       ; to mul

    ; for each byte of data (until zero is reached)
    .hashbyte:
        mov bl, BYTE [rdi]      ; bl = *s
        test bl, bl
        jz .ret
        xor rax, rbx            ; hash ^= *s
        mul r8                  ; hash *= fnv1a32_prime
        add rdi, 1              ; s++
        jmp .hashbyte
    .ret:
        ret

fnv1a64:
    xor rbx, rbx                ; clear buffer for *s
    mov rax, fnv1a64_offset     ; hash = fnv1a64_offset_basis
    mov r8, fnv1a64_prime       ; multiplier
.hashbyte:
    mov bl, BYTE [rdi]          ; bl = *s
    test bl, bl
    jz .ret
    xor rax, rbx                ; hash ^= *s
    mul r8                      ; hash *= fnv1a64_prime
    add rdi, 1                  ; s++
    jmp .hashbyte
.ret:
    ret