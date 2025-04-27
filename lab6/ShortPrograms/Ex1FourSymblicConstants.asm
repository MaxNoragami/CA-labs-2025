;-------------------------------------------------------------
; 1. Define four symbolic constants that represent integer 25 
; in decimal, binary, octal, and hexadecimal formats.
;-------------------------------------------------------------

section .text
global _start

; Here we define symbolic constants for the value 25 in different formats
DECIMAL_25 equ 25         ; Decimal representation
BINARY_25  equ 0b11001    ; Binary representation (NASM syntax)
OCTAL_25   equ 031        ; Octal representation (NASM syntax)
HEX_25     equ 0x19       ; Hexadecimal representation (NASM syntax)

_start:
    ; We use the constants for demonstration
    mov rax, DECIMAL_25   ; Load decimal 25 into RAX
    mov rbx, BINARY_25    ; Load binary 25 into RBX
    mov rcx, OCTAL_25     ; Load octal 25 into RCX
    mov rdx, HEX_25       ; Load hex 25 into RDX
    
    ; Verify all constants equal 25
    ; RAX = RBX = RCX = RDX = 25
    
    ; Exit program with return code 0
    mov rax, 60           ; syscall number for exit
    xor rdi, rdi          ; status 0
    syscall               ; invoke system call