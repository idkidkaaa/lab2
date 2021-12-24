%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging

    xor     eax, eax
    xor     esi, esi
    
    lea     esi,  [test_array]
    mov     ecx,  8 ; size of the test_array
     
    push    ecx
    push    esi
    
l:
    mov     dl,   [esi]
    mov     ebx,  esi
    mov     edi,  8
    sub     edi,  ecx

wl:
    cmp     edi, 0
    jz      skip
    mov     dh,  [ebx - 4]
    cmp     dh,  dl
    jl      skip
    jmp     swap
    
dc:
    dec     edi
    sub     ebx, 4
    jmp     wl
         
swap:
    mov     al,        [ebx]
    mov     [ebx],     dh
    mov     [ebx - 4], al  
    jmp     dc  
    
skip:
    mov     [ebx], dl
    add     esi,   4
    
    loop    l
    
    pop     esi
    pop     ecx
        
    ret
    
section .data
test_array:  DD 1, 4, 7, 5, 9, 0, 2, 3
