;// ------------------------------------------------------------ -
;// 3. Symbolic Text Constants
;// Write a program that defines symbolic names for several
;// string literals(characters between quotes). Use each
;// symbolic name in a variable definition.
;// ------------------------------------------------------------ -

.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

;// Define symbolic names for string literals using TEXTEQU
GREETING TEXTEQU <"Hello, World!">
USERNAME TEXTEQU <"John Doe">
MESSAGE TEXTEQU <"Welcome to Assembly Programming">
ERROR_MSG TEXTEQU <"An error has occurred">
SUCCESS_MSG TEXTEQU <"Operation completed successfully">

.data
;// Use each symbolic name in variable definitions
greetingStr BYTE GREETING, 0		;// Null-terminated string
userStr BYTE USERNAME, 0			;// Null-terminated string
welcomeMsg BYTE MESSAGE, 0		;// Null-terminated string
errorText BYTE ERROR_MSG, 0		;// Null-terminated string
successText BYTE SUCCESS_MSG, 0	;// Null-terminated string

.code
main proc
;// Demonstrate usage by loading addresses of strings
mov eax, OFFSET greetingStr		;// Address of greeting string
mov ebx, OFFSET userStr			;// Address of username string
mov ecx, OFFSET welcomeMsg		;// Address of welcome message
mov edx, OFFSET errorText		;// Address of error message

invoke ExitProcess, 0
main endp
end main