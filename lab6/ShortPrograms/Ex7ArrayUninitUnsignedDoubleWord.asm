;-------------------------------------------------------------
; 7. Declare an array of 120 uninitialized unsigned doubleword 
; values.
;-------------------------------------------------------------

section .bss
    ; We declare an array of 120 uninitialized doublewords
    dword_array resd 120    ; Reserve space for 120 doublewords, 4 bytes each
                           ; Total size: 480 bytes, 120 * 4 bytes

section .text
global _start

_start:
    ; As example we initialize the first element of the array
    mov dword [dword_array], 42    ; as test we store 42 in the first element
    
    ; THen we access the first element
    mov eax, [dword_array]         ; Load first element into EAX
    
    ; Then we access the second element, at offset 4 bytes
    mov ebx, [dword_array + 4]     ; Load second element into EBX
    
    ; Exit program
    mov rax, 60
    xor rdi, rdi
    syscall