;//Z = { (X/8 + 32 - Y),	if (X + Y) / 2 > 0
;//	    (2Y - 60), if (X + Y) / 2 <= 0

INCLUDE Irvine32.inc        ;// Provides I/O operations and other utilities

.data
mesX byte "X value: ", 0    ;// Message to display X value
mesY byte "Y value: ", 0    ;// Message to display Y value
mesR byte "Result: ", 0     ;// Label for displaying the result
vrx sdword 0                ;// Variable to store X value (signed 32-bit)
vry sdword 0                ;// Variable to store Y value (signed 32-bit)
rez sdword 0                ;// Variable to store the result (signed 32-bit)

.code
main PROC

call Randomize              ;// Initialize random number generator with system time seed

;// Generate random X value using RandomRange
mov eax, 101                ;// Set range to 101 (will generate 0 to 100)
call RandomRange            ;// Generate number between 0 and 100
sub eax, 50                 ;// Shift range to -50 to 50
mov vrx, eax                ;// Store random value in vrx
mov edx, OFFSET mesX        ;// Load address of X message into EDX
call WriteString            ;// Display "X value: "
call WriteInt               ;// Display the generated X value
call Crlf                   ;// New line

;// Generate random Y value using Random32
call Random32               ;// Generate a random 32-bit integer (0 to 2^32-1)
mov edx, 0                  ;// Clear EDX for division
mov ebx, 101                ;// Divide by 101 to get a number in range 0-100
div ebx                     ;// EDX now contains remainder (0 to 100)
sub edx, 50                 ;// Shift range to -50 to 50
mov vry, edx                ;// Store random value in vry
mov edx, OFFSET mesY        ;// Load address of Y message into EDX
call WriteString            ;// Display "Y value: "
mov eax, vry                ;// Move Y to EAX for display
call WriteInt               ;// Display the generated Y value
call Crlf                   ;// New line

xor eax, eax                ;// Clear EAX register (set to 0)
mov edx, 0                  ;// Clear EDX register

;// Calculate (X + Y) / 2
mov eax, vrx                ;// Move X value to EAX
add eax, vry                ;// Add Y to EAX (X + Y)
mov ebx, 2                  ;// Move 2 to EBX
cdq                         ;// Convert doubleword to quadword (sign-extend EAX into EDX:EAX)
idiv ebx                    ;// Signed division of EDX:EAX by EBX, quotient in EAX

;// Check if (X + Y) / 2 > 0
cmp eax, 0                  ;// Compare result with 0
jg con1                     ;// Jump to con1 label if result > 0 (jg = jump if greater)

;// Calculate 2Y - 60 (second equation)
mov eax, vry                ;// Move Y value to EAX
mov ebx, 2                  ;// Set EBX to 2
imul ebx                    ;// Signed multiply EAX by EBX (2*Y)
sub eax, 60                 ;// Subtract 60 from EAX (2Y - 60)
mov rez, eax                ;// Store result in rez variable
jmp ex                      ;// Jump to ex (exit calculation section)

;// Calculate X/8 + 32 - Y (first equation)
con1: mov eax, vrx          ;// Move X value to EAX
mov ebx, 8                  ;// Set EBX to 8
cdq                         ;// Convert doubleword to quadword (sign-extend EAX into EDX:EAX)
idiv ebx                    ;// Signed division of EDX:EAX by EBX, quotient in EAX
add eax, 32                 ;// Add 32 to EAX (X/8 + 32)
sub eax, vry                ;// Subtract Y from EAX (X/8 + 32 - Y)
mov rez, eax                ;// Store result in rez variable

ex: mov edx, OFFSET mesR    ;// Load address of the result message into EDX
call WriteString            ;// Display "Result: "
mov eax, rez                ;// Move result to EAX for display
call WriteInt               ;// Write the integer value in EAX to the console
call Crlf                   ;// Carriage return and line feed (new line)

exit                        ;// Terminate program
main ENDP                   ;// End of main procedure
END main                    ;// End of program, specifying the entry point