%include "io.inc"

section .text
global CMAIN
CMAIN:
    
    lea esi, [a]
    
; извлечение значения с индексом 0
    mov al, [esi]
    mov dl, 0x1f
    and al, dl
    PRINT_DEC 1, al

; извлечение значения с индексом 1
    mov al, [esi + 1]
    mov dl, 0x03
    and al, dl
    shl al, 3
    mov bl, al
    mov al, [esi]
    mov dl, 0xe0
    and al, dl
    shr al, 5
    or  bl, al
    PRINT_DEC 1, bl

; извлечение значения с индексом 2
    mov al ,[esi + 1]
    mov dl, 0x7c
    and al, dl
    shr al, 2
    PRINT_DEC 1, al
    
; извлечение значения с индексом 3
    mov al, [esi + 2]
    mov dl, 0x04
    and al, dl
    shl al, 4
    mov bl, al
    mov al, [esi + 1]
    mov dl, 0x80
    and al, dl
    shr al, 7
    or  bl, al
    PRINT_DEC 1, bl
    
; извлечение значения с индексом 4
    mov al, [esi + 3]
    mov dl, 0x01
    and al, dl
    shl al, 1
    mov bl, al
    mov al, [esi + 2]
    mov dl, 0x70
    and al, dl
    shr al, 4
    or  bl, al
    PRINT_DEC 1, bl
    
; извлечение значения с индексом 5
    mov al, [esi + 3]
    mov dl, 0x3e
    and al, dl
    shr al, 1
    PRINT_DEC 1, al

; извлечение значения с индексом 6
    mov al, [esi + 4]
    mov dl, 0x07
    and al, dl
    mov bl, al
    mov al, [esi + 3]
    mov dl, 0xc0
    and al, dl
    shr al, 4
    or  bl, al
    PRINT_DEC 1, bl
    
; извлечение значения с индексом 7
    mov al, [esi + 4]
    mov dl, 0xf8
    and al, dl
    shr al, 3
    PRINT_DEC 1, al
    
    ret
    
section.data
;packed array [30, 25, 4, 1, 7, 10, 15, 21]
a: DB 0x3E, 0x93, 0x70, 0xD4, 0xAB
