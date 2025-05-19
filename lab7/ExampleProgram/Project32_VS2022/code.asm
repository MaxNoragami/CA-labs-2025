;//Z = { (X/8 + 32 - Y,	if X < 2Y
;//	    (2Y - 60, if X >= 2Y

INCLUDE Irvine32.inc;// Provides I/O operations and other utilities

.data
mes1 byte "Enter the X:", 0;// Prompt message for X input
mes2 byte "Enter the Y:", 0;// Prompt message for Y input
mes3 byte "Result:", 0;// Label for displaying the result
vrx dword 0;// Variable to store X value (32-bit)
vry dword 0;// Variable to store Y value (32-bit)
rez dd 0;// Variable to store the result (dd = define doubleword, 32-bit)

.code
main PROC

mov edx, OFFSET mes1;// Load address of the first message into EDX
call WriteString;// Display "Enter the X:"
call ReadDec;// Read decimal input from user, stored in EAX
mov vrx, eax;// Store the input value in the vrx variable

mov edx, OFFSET mes2;// Load address of the second message into EDX
call WriteString;// Display "Enter the Y:"
call ReadDec;// Read decimal input from user, stored in EAX
mov vry, eax;// Store the input value in the vry variable

xor eax, eax;// Clear EAX register (set to 0)
mov edx, 0;// Clear EDX register

mov eax, vry;// Move Y value to EAX
mov bx, 2;// Set BX to 2
mul bx;// Multiply EAX by BX (2*Y)
cmp vrx, eax;// Compare X with 2Y
jb con1;// Jump to con1 label if X < 2Y (jb = jump if below)

mov eax, vry;// Move Y value to EAX
mov bx, 2;// Set BX to 2
mul bx;// Multiply EAX by BX (2*Y)
sub eax, 60;// Subtract 60 from EAX (2Y - 60)
mov rez, eax;// Store result in rez variable
jmp ex;// Jump to ex (exit calculation section)

con1: mov eax, vrx;// Move X value to EAX
mov bx, 8;// Set BX to 8
div bx;// Divide EAX by BX, quotient in AX (X/8)
add eax, 32;// Add 32 to EAX (X/8 + 32)
sub eax, vry;// Subtract Y from EAX (X/8 + 32 - Y)
mov rez, eax;// Store result in rez variable

ex: mov edx, OFFSET mes3;// Load address of the result message into EDX
call WriteString;// Display "Result:"
call WriteInt;// Write the integer value in EAX to the console
call Crlf;// Carriage return and line feed (new line)

exit;// Terminate program
main ENDP;// End of main procedure
END main;// End of program, specifying the entry point