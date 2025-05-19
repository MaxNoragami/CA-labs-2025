INCLUDE Irvine32.inc

.data
;// Define a Word array (16-bit) with some values
wordArray WORD 123h, 456h, 789h, 0ABCh, 0DEFh, 1A2Bh, 3C4Dh, 567Eh, 89ABh, 0CDEFh
wordArraySize = ($ - wordArray) / TYPE wordArray    ;// Calculate the number of elements
    
;// Define a doubleword array (32-bit) to copy the values into
dwordArray DWORD LENGTHOF wordArray DUP(0)         ;// Initialize with zeros

.code
main PROC
;// Set up the loop
mov esi, 0                           ;// Source index for wordArray
mov edi, 0                           ;// Destination index for dwordArray
mov ecx, LENGTHOF wordArray          ;// Loop counter
    
copyLoop:
movzx eax, wordArray[esi]            ;// Move word to eax with zero extension
mov dwordArray[edi], eax             ;// Copy the value to the dword array
add esi, TYPE wordArray              ;// Move to the next word
add edi, TYPE dwordArray             ;// Move to the next dword
loop copyLoop                        ;// Decrement ecx and loop if not zero
    
;// Display the arrays to verify the copy
call Crlf
mov esi, OFFSET wordArray            ;// ESI = address of array
mov ecx, LENGTHOF wordArray          ;// ECX = number of units
mov ebx, TYPE wordArray              ;// EBX = size of each unit (2 bytes)
call DumpMem                         ;// Display the word array
    
call Crlf
mov esi, OFFSET dwordArray           ;// ESI = address of array
mov ecx, LENGTHOF dwordArray         ;// ECX = number of units
mov ebx, TYPE dwordArray             ;// EBX = size of each unit (4 bytes)
call DumpMem                         ;// Display the dword array
    
exit
main ENDP
END main