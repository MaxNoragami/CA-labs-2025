;-------------------------------------------------------------
; 1. Integer Expression Calculation
; Using the AddTwo program from Section 3.2 as a reference, 
; write a program that calculates the following expression, 
; using registers: A = (A + B) − (C + D). Assign integer values 
; to the EAX, EBX, ECX, and EDX registers
;-------------------------------------------------------------

global _start

_start:
    ; Initialize registers with values
    mov eax, 5       ; A = 5
    mov ebx, 10      ; B = 10
    mov ecx, 15      ; C = 15
    mov edx, 20      ; D = 20
    
    ; Calculate A = (A + B) - (C + D)
    add eax, ebx     ; EAX = A + B
    add ecx, edx     ; ECX = C + D
    sub eax, ecx     ; EAX = (A + B) - (C + D)
    
    ; At this point, EAX contains the result of (5 + 10) - (15 + 20)
    ; which is 15 - 35 = -20
    
    ; Exit program
    mov rax, 60
    xor rdi, rdi
    syscall