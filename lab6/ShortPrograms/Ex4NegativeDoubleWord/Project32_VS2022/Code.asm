;// ------------------------------------------------------------ -
;// 4. Find out if you can declare a variable of type DWORD and
;// assign it a negative value.What does this tell you about
;// the assembler's type checking?
;// ------------------------------------------------------------ -

.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
myDWORD DWORD - 5	;// Attempting to assign negative value to DWORD

.code
main proc
;// Load the value into a register to examine it
mov eax, myDWORD

;// Move a positive value as comparison
mov ebx, 5

invoke ExitProcess, 0
main endp
end main