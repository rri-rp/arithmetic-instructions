; Arithmetic Instructions - Equation 2
; Objective: result = var1 + var2 + var3 + var4
; Expected result: 30
;
; Assemble: nasm -f elf64 -g -F dwarf equation2.asm -o equation2.o
; Link:     ld equation2.o -o equation2
; Debug:    gdb ./equation2

section .data
    var1 dd 4
    var2 dd 6
    var3 dd 8
    var4 dd 12

section .bss
    result resd 1

section .text
    global _start

_start:
    ; result = var1 + var2 + var3 + var4
    mov eax, dword [var1]       ; eax = var1
    add eax, dword [var2]       ; eax = var1 + var2
    add eax, dword [var3]       ; eax = var1 + var2 + var3
    add eax, dword [var4]       ; eax = var1 + var2 + var3 + var4
    mov dword [result], eax     ; result = eax

    ; Exit program successfully.
    mov rax, 60           ; Linux sys_exit
    xor rdi, rdi          ; status code 0
    syscall
