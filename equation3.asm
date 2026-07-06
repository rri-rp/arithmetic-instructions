; Arithmetic Instructions - Equation 3
; Objective: result = (-var1 * var2) + var3
; Expected result: -1
;
; Assemble: nasm -f elf64 -g -F dwarf equation3.asm -o equation3.o
; Link:     ld equation3.o -o equation3
; Debug:    gdb ./equation3

section .data
    var1 dd 7
    var2 dd 3
    var3 dd 20

section .bss
    result resd 1

section .text
    global _start

_start:
    ; result = (-var1 * var2) + var3
    mov eax, dword [var1]       ; eax = var1
    neg eax               ; eax = -var1
    imul eax, dword [var2]      ; eax = -var1 * var2
    add eax, dword [var3]       ; eax = (-var1 * var2) + var3
    mov dword [result], eax     ; result = eax

    ; Exit program successfully.
    mov rax, 60           ; Linux sys_exit
    xor rdi, rdi          ; status code 0
    syscall
