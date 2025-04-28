;-------------------------------------------------------------
; 1. Integer Expression Calculation
; Using the AddTwo program from Section 3.2 as a reference,
; write a program that calculates the following expression,
; using registers: A = (A + B) − (C + D). Assign integer values
; to the EAX, EBX, ECX, and EDX registers
;-------------------------------------------------------------
section .data
    ; Values for the calculation
    valA dd 5                ; A = 5
    valB dd 10               ; B = 10
    valC dd 15               ; C = 15
    valD dd 20               ; D = 20
    result dd 0              ; To store the result
    
    ; Format string for printf
    format db "Calculation: (%d + %d) - (%d + %d) = %d", 10, 0

section .text
global Start
extern printf
extern ExitProcess

Start:
    ; Initialize registers with values
    mov eax, [rel valA]     ; A = 5
    mov ebx, [rel valB]     ; B = 10
    mov ecx, [rel valC]     ; C = 15
    mov edx, [rel valD]     ; D = 20
   
    ; Calculate A = (A + B) - (C + D)
    add eax, ebx            ; EAX = A + B (15)
    add ecx, edx            ; ECX = C + D (35)
    sub eax, ecx            ; EAX = (A + B) - (C + D) (-20)
    
    ; Store the result
    mov [rel result], eax
    
    ; Display the result using printf
    lea rcx, [rel format]   ; Format string (1st parameter)
    mov edx, [rel valA]     ; A value (2nd parameter)
    mov r8d, [rel valB]     ; B value (3rd parameter)
    mov r9d, [rel valC]     ; C value (4th parameter)
    
    ; Fifth parameter needs to go on the stack
    sub rsp, 40             ; Shadow space (32) + extra for parameter (8)
    mov eax, [rel valD]
    mov [rsp+32], rax       ; D value (5th parameter)
    
    ; Result is the 6th parameter
    mov eax, [rel result]
    mov [rsp+40], rax       ; Result value (6th parameter)
    
    xor rax, rax            ; No floating point arguments
    call printf
    add rsp, 40             ; Restore stack
   
    ; Exit program
    xor rcx, rcx            ; Exit code 0
    call ExitProcess