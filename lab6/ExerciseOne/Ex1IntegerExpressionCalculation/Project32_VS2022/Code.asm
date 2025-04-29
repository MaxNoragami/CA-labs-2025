;// ------------------------------------------------------------ -
;// 1. Integer Expression Calculation
;// Using the AddTwo program from Section 3.2 as a reference,
;// write a program that calculates the following expression,
;// using registers: A = (A + B) - (C + D). Assign integer values
;// to the EAX, EBX, ECX, and EDX registers
;// ------------------------------------------------------------ -

.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.code
main proc
;// Assign initial values to registers
mov eax, 10	;// Initialize A = 10
mov ebx, 5	;// Initialize B = 5
mov ecx, 3	;// Initialize C = 3
mov edx, 2	;// Initialize D = 2

;// Calculate (A + B)
add eax, ebx	;// EAX = EAX + EBX = A + B = 15

;// Calculate (C + D)
add ecx, edx	;// ECX = ECX + EDX = C + D = 5

;// Calculate (A + B) - (C + D)
sub eax, ecx	;// EAX = EAX - ECX = (A + B) - (C + D) = 15 - 5 = 10

invoke ExitProcess, 0
main endp
end main