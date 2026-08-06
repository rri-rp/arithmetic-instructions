; Arithmetic Instructions - Equation 4
; result = (var1 * 2) / (var2 - 3)
; var1 = 24 and var2 = 9
; Expected result: 8

section .text
    global _start

_start:
    mov eax, [var1]            ; EAX = 24
    imul eax, 2                ; EAX = 48

    mov ebx, [var2]            ; EBX = 9
    sub ebx, 3                 ; EBX = 6

    cdq                        ; Sign-extend EAX into EDX:EAX
    idiv ebx                   ; EAX = 48 / 6 = 8
    mov [result], eax          ; Store 8 in result

    mov eax, 1                 ; Linux sys_exit
    mov ebx, 0                 ; Exit status 0
    int 0x80

section .data
    var1 dd 24
    var2 dd 9

section .bss
    result resd 1
