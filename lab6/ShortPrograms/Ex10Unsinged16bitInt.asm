;-------------------------------------------------------------
; 10. Declare an unsigned 16-bit integer variable named 
; wArray that uses three initializers.
;-------------------------------------------------------------

section .data
    ; We declare 'wArray' - an array of 3 unsigned 16-bit integers, words, with initial values 42, 1000, and 65000
    wArray dw 42, 1000, 65000   ; 'dw' = define word, 16-bit values, 2 bytes
                                ; Total size is 6 bytes, 3 elements * 2 bytes

section .text
global _start

_start:
    ; As an example we try to access the first element
    mov ax, [wArray]        ; Load first element 42 into AX
    
    ; Then we access the second element, at offset 2 bytes
    mov bx, [wArray + 2]    ; Load second element 1000 into BX
    
    ; Last but not least we try to access the third element, at offset 4 bytes
    mov cx, [wArray + 4]    ; Load third element (65000) into CX
    
    ; Exit program
    mov rax, 60
    xor rdi, rdi
    syscall