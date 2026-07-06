; Arithmetic Instructions - Equation 4
; Objective: result = (var1 * 2) / (var2 - 3)
; Chosen values: var1 = 24, var2 = 9
; Expected result: (24 * 2) / (9 - 3) = 48 / 6 = 8
;
; Assemble: nasm -f elf64 -g -F dwarf equation4.asm -o equation4.o
; Link:     ld equation4.o -o equation4
; Debug:    gdb ./equation4

section .data
    var1 dd 24
    var2 dd 9

section .bss
    result resd 1

section .text
    global _start

_start:
    ; result = (var1 * 2) / (var2 - 3)

    ; Calculate numerator: var1 * 2.
    mov eax, dword [var1]       ; eax = var1
    imul eax, 2           ; eax = var1 * 2

    ; Calculate denominator: var2 - 3.
    mov ebx, dword [var2]       ; ebx = var2
    sub ebx, 3            ; ebx = var2 - 3

    ; Prepare EDX:EAX for signed division, then divide by EBX.
    cdq                   ; sign-extend eax into edx:eax
    idiv ebx              ; eax = quotient, edx = remainder

    mov dword [result], eax     ; result = eax

    ; Exit program successfully.
    mov rax, 60           ; Linux sys_exit
    xor rdi, rdi          ; status code 0
    syscall
