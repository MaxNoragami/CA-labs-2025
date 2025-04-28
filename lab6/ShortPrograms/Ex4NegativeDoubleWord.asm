;-------------------------------------------------------------
; 4. Find out if you can declare a variable of type DWORD and
; assign it a negative value. What does this tell you about
; the assembler's type checking?
;-------------------------------------------------------------
section .data
    ; We define a DWORD aka double word variable with a neg value
    negative_dword dd -10          ; Define double word (32-bit) with value -10
    positive_dword dd 10           ; For comparison
    
    ; Format strings for output
    format db "Negative DWORD value: %d (hex: 0x%08X)", 10
           db "Positive DWORD value: %d (hex: 0x%08X)", 10, 0

section .text
global Start
extern printf
extern ExitProcess

Start:
    ; Reserve stack space
    sub rsp, 40
    
    ; We load the neg DWORD value
    mov eax, [rel negative_dword]  ; EAX now contains -10 (0xFFFFFFF6 in hex)
    ; Then we also load the positive DWORD value
    mov ebx, [rel positive_dword]  ; EBX now contains 10
    
    ; Display the values
    lea rcx, [rel format]          ; Format string
    mov edx, eax                   ; Negative value as decimal
    mov r8d, eax                   ; Negative value as hex
    mov r9d, ebx                   ; Positive value as decimal
    
    ; Last parameter on stack
    mov [rsp+32], ebx              ; Positive value as hex
    
    xor rax, rax                   ; No floating point args
    call printf
    
    ; Exit program
    xor rcx, rcx                   ; Return code 0
    call ExitProcess