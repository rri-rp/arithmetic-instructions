; Arithmetic Instructions - Equation 1
; Objective: result = -var1 * 10
; Expected result: -50
;
; Assemble: nasm -f elf64 -g -F dwarf equation1.asm -o equation1.o
; Link:     ld equation1.o -o equation1
; Debug:    gdb ./equation1

section .data
    var1 dd 5

section .bss
    result resd 1

section .text
    global _start

_start:
    ; result = -var1 * 10
    mov eax, dword [var1]       ; eax = var1
    neg eax               ; eax = -var1
    imul eax, 10          ; eax = -var1 * 10
    mov dword [result], eax     ; result = eax

    ; Exit program successfully.
    mov rax, 60           ; Linux sys_exit
    xor rdi, rdi          ; status code 0
    syscall
