INCLUDE Irvine32.inc                  ;// Include Irvine32 library for I/O and other utility procedures

.data
    buffer    BYTE 100 DUP(0)         ;// Define a 100-byte buffer initialized to zeros for storing random strings
    strMsg    BYTE "RdmnStr: ", 0     ;// Define a string label for display with null terminator
    strLen    DWORD 12                ;// Define the default length for each random string (10 characters)

.code
main PROC
    mov ecx, 10                       ;// Set ECX as counter to generate 10 strings in total
    
generate_loop:
    ;// Display message prefix
    mov edx, OFFSET strMsg            ;// Load the address of the message string into EDX for WriteString
    call WriteString                  ;// Call the procedure to display the message prefix on console
    
    ;// Set up parameters for RandomString
    mov eax, strLen                   ;// Move string length value (10) into EAX as first parameter
    lea esi, buffer                   ;// Load effective address of buffer into ESI as second parameter
    call RandomString                 ;// Call our custom procedure to generate a random string
    
    ;// Display the generated string
    mov edx, OFFSET buffer            ;// Load the address of the buffer (now containing random string) into EDX
    call WriteString                  ;// Call the procedure to display the generated random string
    call Crlf                         ;// Call the procedure to output a carriage return and line feed
    
    loop generate_loop                ;// Decrement ECX and jump back to generate_loop if ECX > 0
    
    exit                              ;// Exit the program and return control to the operating system
main ENDP

RandomString PROC
    ;// Input: EAX = length of string, ESI = pointer to buffer
    push ecx                          ;// Save ECX register value on the stack to preserve it
    push edx                          ;// Save EDX register value on the stack to preserve it
    push esi                          ;// Save ESI register value on the stack to preserve it
    
    mov ecx, eax                      ;// Copy the requested string length from EAX to ECX as loop counter
    
generate_char:
    ;// Generate random number between 0 and 25
    mov eax, 26                       ;// Set EAX to 26 (number of letters in alphabet) for RandomRange
    call RandomRange                  ;// Generate random number between 0-25, result stored in EAX
    
    ;// Convert to capital letter (ASCII 65-90)
    add al, 'A'                       ;// Add ASCII value of 'A' (65) to convert number to capital letter
    
    ;// Store in buffer
    mov [esi], al                     ;// Store the generated character at the memory location pointed by ESI
    inc esi                           ;// Increment ESI to point to the next byte in the buffer
    
    loop generate_char                ;// Decrement ECX and jump back to generate_char if ECX > 0
    
    ;// Add null terminator
    mov BYTE PTR [esi], 0             ;// Place a null terminator (0) at the end of the string
    
    pop esi                           ;// Restore original ESI value from stack
    pop edx                           ;// Restore original EDX value from stack
    pop ecx                           ;// Restore original ECX value from stack
    
    ret                               ;// Return to the calling procedure
RandomString ENDP

END main                              ;// End of the program, specifying main as the entry point