%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp ; for correct debugging
    xor eax, eax  
    
    lea      ebx, [array]
    mov      ecx, 8
    
    push    ebx
    push    ecx
    
next:    
    mov     dx, [ebx]
    cmp     dx, 0
    jl      skip
    add     ax, dx

skip:            
    add     ebx,4  
    loop    next   
    pop     ecx
    pop     ebx
    
    PRINT_DEC 1, ax
    
    ret
    
section .data
array: DD 6, -4, 11, -2, -9, 4, -5, 0
