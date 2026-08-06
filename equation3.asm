; Arithmetic Instructions - Equation 3
; result = (-var1 * var2) + var3
; Expected result: -1

section .text
    global _start

_start:
    mov eax, [var1]            ; EAX = 7
    neg eax                    ; EAX = -7
    imul eax, [var2]           ; EAX = -21
    add eax, [var3]            ; EAX = -1
    mov [result], eax          ; Store -1 in result

    mov eax, 1                 ; Linux sys_exit
    mov ebx, 0                 ; Exit status 0
    int 0x80

section .data
    var1 dd 7
    var2 dd 3
    var3 dd 20

section .bss
    result resd 1
