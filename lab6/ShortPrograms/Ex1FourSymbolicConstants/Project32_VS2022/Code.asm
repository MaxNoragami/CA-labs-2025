; //------------------------------------------------------------ -
; // 1. Define four symbolic constants that represent integer 25
; // in decimal, binary, octal, and hexadecimal formats.
; //------------------------------------------------------------ -

.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

;// Define the constants for number 25
DECIMAL_25 = 25	;// Decimal format(base 10)
BINARY_25 = 11001b	;// Binary format(base 2)
OCTAL_25 = 31o		;// Octal format(base 8)
HEX_25 = 19h		;// Hexadecimal format(base 16)

.code
main proc
;// Move each constant to a different register so we can view them during debugging as 25 in the HEX form that's 19
mov eax, DECIMAL_25	;// EAX = 25 (decimal)
mov ebx, BINARY_25	;// EBX = 25 (binary format)
mov ecx, OCTAL_25	;// ECX = 25 (octal format)
mov edx, HEX_25	;// EDX = 25 (hex format)

;// You can verify that all registers contain the same value(25)
;// but were defined using different number representations

invoke ExitProcess, 0
main endp
end main