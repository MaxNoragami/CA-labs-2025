;-------------------------------------------------------------
; 3. Symbolic Text Constants
; Write a program that defines symbolic names for several 
; string literals (characters between quotes). Use each 
; symbolic name in a variable definition.
;-------------------------------------------------------------

; We define symbolic text constants using the %define directive
; These will be textually replaced before assembly
%define GREETING "Hello, World!"
%define ERROR_MSG "An error occurred!"
%define PROMPT "Enter your name: "
%define FAREWELL "Goodbye!"
%define VERSION "v1.0"

section .data
    ; We use each symbolic name in variable definitions
    ; The assembler will substitute the string literals defined above
    greeting_msg db GREETING, 0       ; Becomes: db "Hello, World!", 0
    error_message db ERROR_MSG, 0     ; Becomes: db "An error occurred!", 0
    input_prompt db PROMPT, 0         ; Becomes: db "Enter your name: ", 0
    exit_message db FAREWELL, 0       ; Becomes: db "Goodbye!", 0
    version_info db "Program Version: ", VERSION, 0  ; Combined string
    
    msg db "Symbolic text constants example", 10
    msg_len equ $ - msg

section .text
global _start

_start:
    mov rax, 1              ; syscall: write
    mov rdi, 1              ; file descriptor: stdout
    mov rsi, msg            ; message to write
    mov rdx, msg_len        ; message length
    syscall
    
    ; Exit program
    mov rax, 60             ; syscall: exit
    xor rdi, rdi            ; return code 0
    syscall