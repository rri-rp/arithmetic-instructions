; Arithmetic Instructions - Equation 1
; result = -var1 * 10
; Expected result: -50

section .text
    global _start

_start:
    mov eax, [var1]            ; EAX = 5
    neg eax                    ; EAX = -5
    imul eax, 10               ; EAX = -50
    mov [result], eax          ; Store -50 in result

    mov eax, 1                 ; Linux sys_exit
    mov ebx, 0                 ; Exit status 0
    int 0x80

section .data
    var1 dd 5

section .bss
    result resd 1
