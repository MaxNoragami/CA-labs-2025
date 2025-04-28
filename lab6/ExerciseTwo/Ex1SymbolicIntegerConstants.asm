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
   
    ; Create an array initialized with the symbolic constants
    days_array dd SUNDAY, MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY
   
    ; The array size calculation, number of elements
    DAYS_COUNT equ ($ - days_array) / 4  ; 4 bytes per dword
    
    ; Day names for display
    day_names db "Sunday", 0, "Monday", 0, "Tuesday", 0, "Wednesday", 0
              db "Thursday", 0, "Friday", 0, "Saturday", 0
    
    ; Format strings for printf
    header_fmt db "Array of days initialized with symbolic constants:", 10, 0
    day_fmt db "days_array[%d] = %d (%s)", 10, 0
    access_fmt db 10, "Accessing elements:", 10
               db "First element (SUNDAY): %d", 10
               db "Fifth element (THURSDAY): %d", 10
               db "Value at index WEDNESDAY: %d", 10, 0

section .text
global Start
extern printf
extern ExitProcess

Start:
    ; Print header
    lea rcx, [rel header_fmt]
    xor rax, rax
    sub rsp, 32             ; Shadow space
    call printf
    
    ; Print each day in the array
    mov r12, 0              ; Loop counter
    
.loop:
    cmp r12, DAYS_COUNT
    jge .loop_end
    
    ; Calculate day name pointer
    mov r13, r12
    lea r14, [rel day_names]
    
    ; Find the correct day name string
    mov r15, 0              ; String index counter
.find_name:
    cmp r15, r13
    je .found_name
    
    ; Move to next string (find null terminator)
.find_null:
    cmp byte [r14], 0
    je .next_string
    inc r14
    jmp .find_null
    
.next_string:
    inc r14                 ; Skip the null byte
    inc r15
    jmp .find_name
    
.found_name:
    ; Print current array element
    lea rcx, [rel day_fmt]      ; Format string
    mov rdx, r12                ; Array index
    mov r8d, [rel days_array + r12*4]  ; Array value
    mov r9, r14                 ; Day name string
    xor rax, rax
    call printf
    
    inc r12
    jmp .loop
    
.loop_end:
    ; Demonstrate element access
    mov eax, [rel days_array]          ; First element (SUNDAY)
    mov ebx, [rel days_array + 16]     ; Fifth element (THURSDAY)
    mov ecx, [rel days_array + WEDNESDAY*4]  ; Using constant as index
    
    ; Display access results
    lea rcx, [rel access_fmt]
    mov edx, eax            ; SUNDAY value
    mov r8d, ebx            ; THURSDAY value
    mov r9d, ecx            ; WEDNESDAY value
    xor rax, rax
    call printf
    
    add rsp, 32             ; Restore stack
    
    ; Exit program
    xor rcx, rcx            ; Exit code 0
    call ExitProcess