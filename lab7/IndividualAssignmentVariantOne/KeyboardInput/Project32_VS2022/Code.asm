;//Z = { (X/8 + 32 - Y),	if (X + Y) / 2 > 0
;//	    (2Y - 60), if (X + Y) / 2 <= 0

INCLUDE Irvine32.inc		;// Provides I/O operations and other utilities

.data
mes1 byte "Enter the X:", 0	;// Prompt message for X input
mes2 byte "Enter the Y:", 0	;// Prompt message for Y input
mes3 byte "Result:", 0		;// Label for displaying the result
vrx dword 0				;// Variable to store X value (32-bit)
vry dword 0				;// Variable to store Y value (32-bit)
rez dd 0					;// Variable to store the result (dd = define doubleword, 32-bit)

.code
main PROC

mov edx, OFFSET mes1		;// Load address of the first message into EDX
call WriteString			;// Display "Enter the X:"
call ReadInt				;// Read signed integer input from user, stored in EAX
mov vrx, eax				;// Store the input value in the vrx variable

mov edx, OFFSET mes2		;// Load address of the second message into EDX
call WriteString			;// Display "Enter the Y:"
call ReadInt				;// Read signed integer input from user, stored in EAX
mov vry, eax				;// Store the input value in the vry variable

xor eax, eax				;// Clear EAX register (set to 0)
mov edx, 0				;// Clear EDX register

;// Calculate (X + Y) / 2
mov eax, vrx				;// Move X value to EAX
add eax, vry				;// Add Y to EAX (X + Y)
mov ebx, 2				;// Move 2 to EBX
cdq						;// Convert doubleword to quadword (sign-extend EAX into EDX:EAX)
idiv ebx					;// Signed division of EDX:EAX by EBX, quotient in EAX

;// Check if (X + Y) / 2 > 0
cmp eax, 0				;// Compare result with 0
jg con1					;// Jump to con1 label if result > 0 (jg = jump if greater)

;// Calculate 2Y - 60 (second equation)
mov eax, vry				;// Move Y value to EAX
mov ebx, 2				;// Set EBX to 2
imul ebx					;// Signed multiply EAX by EBX (2*Y)
sub eax, 60				;// Subtract 60 from EAX (2Y - 60)
mov rez, eax				;// Store result in rez variable
jmp ex					;// Jump to ex (exit calculation section)

;// Calculate X/8 + 32 - Y (first equation)
con1: mov eax, vrx			;// Move X value to EAX
mov ebx, 8				;// Set EBX to 8
cdq						;// Convert doubleword to quadword (sign-extend EAX into EDX:EAX)
idiv ebx					;// Signed division of EDX:EAX by EBX, quotient in EAX
add eax, 32				;// Add 32 to EAX (X/8 + 32)
sub eax, vry				;// Subtract Y from EAX (X/8 + 32 - Y)
mov rez, eax				;// Store result in rez variable

ex: mov edx, OFFSET mes3		;// Load address of the result message into EDX
call WriteString			;// Display "Result:"
mov eax, rez				;// Move result to EAX for display
call WriteInt				;// Write the integer value in EAX to the console
call Crlf					;// Carriage return and line feed (new line)

exit						;// Terminate program
main ENDP					;// End of main procedure
END main					;// End of program, specifying the entry point