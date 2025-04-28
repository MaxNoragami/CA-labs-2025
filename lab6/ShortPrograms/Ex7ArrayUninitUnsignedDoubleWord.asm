;-------------------------------------------------------------
; 7. Declare an array of 120 uninitialized unsigned doubleword
; values.
;-------------------------------------------------------------
section .bss
    ; We declare an array of 120 uninitialized doublewords
    dword_array resd 120    ; Reserve space for 120 doublewords, 4 bytes each
                           ; Total size: 480 bytes, 120 * 4 bytes
section .data
    ; Format strings for output
    format db "First element (initialized): %d", 10
           db "Second element (uninitialized): %d", 10
           db "Total array size: %d bytes", 10, 0
    
    array_size dd 480       ; 120 * 4 bytes

section .text
global Start
extern printf
extern ExitProcess

Start:
    ; Reserve stack space
    sub rsp, 40
    
    ; As example we initialize the first element of the array
    mov dword [rel dword_array], 42    ; Store 42 in the first element
   
    ; Then we access the first element
    mov eax, [rel dword_array]         ; Load first element into EAX
   
    ; Then we access the second element, at offset 4 bytes
    mov ebx, [rel dword_array + 4]     ; Load second element into EBX
    
    ; Display the values
    lea rcx, [rel format]              ; Format string
    mov edx, eax                       ; First element value
    mov r8d, ebx                       ; Second element value
    mov r9d, [rel array_size]          ; Total array size
    
    xor rax, rax                       ; No floating point args
    call printf
    
    ; Exit program
    xor rcx, rcx                       ; Return code 0
    call ExitProcess