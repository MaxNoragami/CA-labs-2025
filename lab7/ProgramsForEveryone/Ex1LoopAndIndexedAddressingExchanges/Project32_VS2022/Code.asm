;// Program to swap pairs of array elements
;// Exchanges element i with i+1, i+2 with i+3, etc.

INCLUDE Irvine32.inc

.data
;// Define an array with an even number of elements
array DWORD 10, 20, 30, 40, 50, 60, 70, 80  ;// 8 elements(even number)
arraySize = ($ - array) / TYPE array        ;// Calculate the number of elements
arrayMsg BYTE "Array elements: ", 0
commaSpace BYTE ", ", 0

.code
main PROC
    ;// Display the original array
    mov edx, OFFSET arrayMsg
    call WriteString
    mov esi, OFFSET array    ;// ESI points to the first element
    mov ecx, arraySize       ;// ECX counts the elements
    call DisplayArray

    ;// Exchange pairs of elements
    mov esi, OFFSET array    ;// ESI points to the first element
    mov ecx, arraySize       
    shr ecx, 1               ;// Divide by 2 to get number of pairs
    
exchangeLoop:
    mov eax, [esi]           ;// Get first element of the pair (i)
    mov ebx, [esi + 4]       ;// Get second element of the pair (i+1)
    mov [esi], ebx           ;// Store second element at first position
    mov [esi + 4], eax       ;// Store first element at second position
    add esi, 8               ;// Move to the next pair (skip 2 DWORD elements)
    loop exchangeLoop        ;// Continue until all pairs are processed

    ;// Display the modified array
    call Crlf
    mov edx, OFFSET arrayMsg
    call WriteString
    mov esi, OFFSET array    ;// ESI points to the first element again
    mov ecx, arraySize       ;// Reset element counter
    call DisplayArray
    
    exit
main ENDP

;// Procedure to display array elements
DisplayArray PROC
    push ecx                 ;// Save the loop counter
displayLoop:
    mov eax, [esi]           ;// Get the current element
    call WriteInt            ;// Display it
    add esi, TYPE array      ;// Point to the next element
    dec ecx                  ;// Decrement loop counter
    jz endDisplay            ;// If zero, we're done
    
    ;// Display comma and space between elements
    mov edx, OFFSET commaSpace
    call WriteString
    jmp displayLoop

endDisplay:
    call Crlf                ;// New line
    pop ecx                  ;// Restore original ECX value
    ret
DisplayArray ENDP

END main