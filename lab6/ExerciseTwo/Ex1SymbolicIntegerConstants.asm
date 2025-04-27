;-------------------------------------------------------------
; 1. Symbolic Integer Constants
; Write a program that defines symbolic constants for all 
; seven days of the week. Create an array variable that uses 
; the symbols as initializers.
;-------------------------------------------------------------

section .data
    ; Define symbolic constants for days of the week
    SUNDAY    equ 0
    MONDAY    equ 1
    TUESDAY   equ 2
    WEDNESDAY equ 3
    THURSDAY  equ 4
    FRIDAY    equ 5
    SATURDAY  equ 6
    
    ; We create an array initialized with the symbolic constants
    days_array dd SUNDAY, MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY
    
    ; The array size calculation, number of elements
    DAYS_COUNT equ ($ - days_array) / 4  ; 4 bytes per dword
    
    ; Output messages
    msg db "Array of days initialized with symbolic constants", 10
    msg_len equ $ - msg

section .text
global _start

_start:
    ; Print message
    mov rax, 1           ; syscall: write
    mov rdi, 1           ; file descriptor: stdout
    mov rsi, msg         ; message to write
    mov rdx, msg_len     ; message length
    syscall
    
    ; As an example we access the first element (SUNDAY)
    mov eax, [days_array]        ; EAX = 0 (SUNDAY)
    
    ; Then we access the fifth element (THURSDAY)
    mov ebx, [days_array + 16]   ; EBX = 4 (THURSDAY)
                                 ; Offset is 16, 4 bytes * 4 elements
    
    ; Then we get the value for Wednesday
    mov ecx, [days_array + WEDNESDAY*4]  ; Using constant as index
    
    ; Exit program
    mov rax, 60
    xor rdi, rdi
    syscall