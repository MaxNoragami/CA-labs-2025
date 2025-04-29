;// ------------------------------------------------------------ -
;// 1. Symbolic Integer Constants
;// Write a program that defines symbolic constants for all
;// seven days of the week. Create an array variable that uses
;// the symbols as initializers.
;// ------------------------------------------------------------ -

.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

;// Define symbolic constants for days of the week
SUNDAY = 0
MONDAY = 1
TUESDAY = 2
WEDNESDAY = 3
THURSDAY = 4
FRIDAY = 5
SATURDAY = 6

.data
;// Create an array initialized with the symbolic constants
daysArray DWORD SUNDAY, MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY

.code
main proc
;// Load days directly into registers - first four days
mov eax, SUNDAY			;// EAX = SUNDAY (0)
mov ebx, MONDAY			;// EBX = MONDAY (1)
mov ecx, TUESDAY			;// ECX = TUESDAY (2)
mov edx, WEDNESDAY			;// EDX = WEDNESDAY (3)

;// Perform some operations with first four days
add eax, 10				;// SUNDAY + 10 = 10
mul ebx					;// MONDAY * (SUNDAY+10) = 1 * 10 = 10 (EAX now contains 10)
add ecx, edx				;// TUESDAY + WEDNESDAY = 2 + 3 = 5

;// Load the remaining days
mov eax, THURSDAY			;// EAX = THURSDAY (4)
mov ebx, FRIDAY			;// EBX = FRIDAY (5)
mov edx, SATURDAY			;// EDX = SATURDAY (6)

invoke ExitProcess, 0
main endp
end main