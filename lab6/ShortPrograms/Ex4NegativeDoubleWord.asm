;-------------------------------------------------------------
; 4. Find out if you can declare a variable of type DWORD and 
; assign it a negative value. What does this tell you about 
; the assembler’s type checking?
;-------------------------------------------------------------
section .data
    ; We define a DWORD aka double word variable with a neg value
    negative_dword dd -10          ; Define double word (32-bit) with value -10
    positive_dword dd 10           ; For comparison
section .text
global _start
_start:
    ; We load the neg DWORD value
    mov eax, [negative_dword]      ; EAX now contains -10 (0xFFFFFFF6 in hex)

    ; Then we also load the positive DWORD value
    mov ebx, [positive_dword]      ; EBX now contains 10

    ; Exit program
    mov rax, 60
    xor rdi, rdi
    syscall