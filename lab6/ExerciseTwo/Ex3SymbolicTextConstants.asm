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
   
    header db "Symbolic text constants example:", 10, 0
    format db "%s", 10, 0

section .text
global Start
extern printf
extern ExitProcess

Start:
    ; Reserve stack space
    sub rsp, 40
    
    ; Display header
    lea rcx, [rel header]
    xor rax, rax
    call printf
    
    ; Display greeting message
    lea rcx, [rel format]
    lea rdx, [rel greeting_msg]
    xor rax, rax
    call printf
    
    ; Display error message
    lea rcx, [rel format]
    lea rdx, [rel error_message]
    xor rax, rax
    call printf
    
    ; Display input prompt
    lea rcx, [rel format]
    lea rdx, [rel input_prompt]
    xor rax, rax
    call printf
    
    ; Display exit message
    lea rcx, [rel format]
    lea rdx, [rel exit_message]
    xor rax, rax
    call printf
    
    ; Display version info
    lea rcx, [rel format]
    lea rdx, [rel version_info]
    xor rax, rax
    call printf
    
    ; Restore stack and exit
    add rsp, 40
    xor rcx, rcx
    call ExitProcess