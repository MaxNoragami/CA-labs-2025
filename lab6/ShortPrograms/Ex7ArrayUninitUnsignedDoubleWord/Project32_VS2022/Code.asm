;// ------------------------------------------------------------ -
;// 7. Declare an array of 120 uninitialized unsigned doubleword
;// values.
;// ------------------------------------------------------------ -

.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
;// Array of 120 uninitialized DWORD values
myArray DWORD 120 DUP(? )	;// Using DUP operator with ? to create uninitialized array

.code
main proc
;// We can access elements if needed
mov eax, OFFSET myArray		;// Get the array's base address

;// Optional: access some array elements
mov ebx, [eax]				;// First element (index 0)
mov ecx, [eax + 4]			;// Second element (index 1)
mov edx, [eax + 476]		;// Last element (index 119, offset = 119*4)

invoke ExitProcess, 0
main endp
end main