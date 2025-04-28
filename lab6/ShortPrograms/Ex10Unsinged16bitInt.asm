;-------------------------------------------------------------
; 10. Declare an unsigned 16-bit integer variable named
; wArray that uses three initializers.
;-------------------------------------------------------------
section .data
    ; We declare 'wArray' - an array of 3 unsigned 16-bit integers (words)
    ; dw = define word (16-bit values, 2 bytes each)
    ; Total size is 6 bytes (3 elements * 2 bytes)
    wArray dw 42, 1000, 65000
    
    ; Note: 65000 is close to the maximum value for an unsigned 16-bit integer (65535)
    ; In hexadecimal, these values are:
    ; 42    = 0x002A
    ; 1000  = 0x03E8
    ; 65000 = 0xFDE8
   
    ; Format string for printf
    ; %u = unsigned decimal integer
    ; 10 = ASCII code for newline
    ; 0 = null terminator (required for C strings)
    format db "Value: %u", 10, 0

section .text
global Start        ; Entry point for GoLink
extern printf       ; External function from C runtime library
extern ExitProcess  ; Windows API function to exit the program

Start:
    ; Reserve shadow space on the stack (required by Windows x64 calling convention)
    ; This reserves 32 bytes for the called function to save register parameters
    ; Plus 8 bytes for 16-byte stack alignment (required by x64 ABI)
    sub rsp, 40
   
    ; Print the first element (42)
    ; Step 1: Load the 16-bit value and zero-extend it to 32 bits
    ;         'rel' ensures position-independent code with correct addressing
    movzx edx, word [rel wArray]      ; EDX = second parameter for printf (the value)
    
    ; Step 2: Load the address of the format string
    lea rcx, [rel format]             ; RCX = first parameter for printf (format string)
    
    ; Step 3: Clear RAX (no floating point arguments in this printf call)
    xor rax, rax
    
    ; Step 4: Call printf
    call printf                       ; Display "Value: 42"
   
    ; Print the second element (1000)
    ; wArray + 2 = address of first element + 2 bytes = address of second element
    movzx edx, word [rel wArray + 2]  ; Load second element with zero extension
    lea rcx, [rel format]             ; Format string
    xor rax, rax                      ; No floating point args
    call printf                       ; Display "Value: 1000"
   
    ; Print the third element (65000)
    ; wArray + 4 = address of first element + 4 bytes = address of third element
    movzx edx, word [rel wArray + 4]  ; Load third element with zero extension
    lea rcx, [rel format]             ; Format string
    xor rax, rax                      ; No floating point args
    call printf                       ; Display "Value: 65000"
   
    ; Exit program
    xor rcx, rcx                      ; RCX = 0 (exit code)
    call ExitProcess                  ; Terminate program