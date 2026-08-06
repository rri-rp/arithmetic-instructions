; Arithmetic Instructions - Equation 2
; result = var1 + var2 + var3 + var4
; Expected result: 30

section .text
    global _start

_start:
    mov eax, [var1]            ; EAX = 4
    add eax, [var2]            ; EAX = 10
    add eax, [var3]            ; EAX = 18
    add eax, [var4]            ; EAX = 30
    mov [result], eax          ; Store 30 in result

    mov eax, 1                 ; Linux sys_exit
    mov ebx, 0                 ; Exit status 0
    int 0x80

section .data
    var1 dd 4
    var2 dd 6
    var3 dd 8
    var4 dd 12

section .bss
    result resd 1
