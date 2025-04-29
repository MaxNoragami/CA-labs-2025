;// ------------------------------------------------------------ -
;// 10. Declare an unsigned 16 - bit integer variable named
;// wArray that uses three initializers.
;// ------------------------------------------------------------ -

.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
wArray WORD 1234h, 5678h, 9ABCh	;// Array of 3 WORD values (16-bit unsigned integers)

.code
main proc
;// We can access elements if needed
mov ax, wArray					;// First element (index 0)
mov bx, wArray + 2				;// Second element (index 1)
mov cx, wArray + 4				;// Third element (index 2)

invoke ExitProcess, 0
main endp
end main