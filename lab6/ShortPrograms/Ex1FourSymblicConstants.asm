;-------------------------------------------------------------
; Define four symbolic constants that represent integer 25
; in decimal, binary, octal, and hexadecimal formats.
;-------------------------------------------------------------

section .data
    format db "Number 25 in different formats:", 10
           db "Decimal: %d", 10
           db "Binary: %d (0b11001)", 10
           db "Octal: %d (031)", 10
           db "Hexadecimal: %d (0x19)", 10, 0

section .text
global Start                ; Exactly "Start" for GoLink
extern printf
extern ExitProcess

; Define symbolic constants for the value 25 in different formats
DECIMAL_25 equ 25          ; Decimal representation
BINARY_25  equ 0b11001     ; Binary representation (NASM syntax)
OCTAL_25   equ 031         ; Octal representation (NASM syntax)
HEX_25     equ 0x19        ; Hexadecimal representation (NASM syntax)

Start:
    ; Reserve stack space
    sub rsp, 40
    
    ; Display all formats
    lea rcx, [rel format]  ; Format string
    mov rdx, DECIMAL_25    ; Decimal value - first %d
    mov r8, BINARY_25      ; Binary value - second %d
    mov r9, OCTAL_25       ; Octal value - third %d
    
    ; Fifth parameter on stack
    mov rax, HEX_25
    mov [rsp+32], rax      ; Hex value - fourth %d
    
    xor rax, rax           ; No floating point args
    call printf
    
    ; Exit program
    xor rcx, rcx           ; Return code 0
    call ExitProcess