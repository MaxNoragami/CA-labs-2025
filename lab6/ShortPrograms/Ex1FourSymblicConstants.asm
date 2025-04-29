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
extern printf               ; GoLink will find this in msvcrt.dll
extern ExitProcess          ; GoLink will find this in kernel32.dll

; Define symbolic constants for the value 25 in different formats
DECIMAL_25 equ 25          ; Decimal representation
BINARY_25  equ 0b11001     ; Binary representation (NASM syntax)
OCTAL_25   equ 031         ; Octal representation (NASM syntax)
HEX_25     equ 0x19        ; Hexadecimal representation (NASM syntax)

Start:
    ; Save registers
    push ebp
    mov ebp, esp
    
    ; Push parameters to printf in reverse order (C calling convention)
    push HEX_25            ; Hex value - fourth %d
    push OCTAL_25          ; Octal value - third %d
    push BINARY_25         ; Binary value - second %d
    push DECIMAL_25        ; Decimal value - first %d
    push format            ; Format string
    call printf
    add esp, 20            ; Clean up stack (5 parameters * 4 bytes)
    
    ; Exit program
    push 0                 ; Return code 0
    call ExitProcess       ; No need to clean stack as we're exiting
    
    ; Never reached, but good practice
    mov esp, ebp
    pop ebp
    ret