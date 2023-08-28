.model small
.stack 100h
.data
fname db 'output.txt', 0
str1 db 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '$'
str2 db ' Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s.', '$'
result db 200 dup ('$')

.code
main proc
    mov ax, @data
    mov ds, ax

    lea si, str1
    lea di, result

l1:
    mov al, [si]
    mov [di], al
    inc si
    inc di
    cmp al, '$'
    jnz l1

    dec di

    lea si, str2

l2:
    mov al, [si]
    mov [di], al
    inc si
    inc di
    cmp al, '$'
    jnz l2

    mov byte ptr [di], '$'

    mov ah, 3ch
    mov cx, 0
    mov dx, offset fname
    int 21h

    mov bx, ax

    lea dx, result
    mov cx, di
    mov ah, 40h
    int 21h

    mov ah, 3eh
    int 21h

    mov ah, 3dh
    mov al, 0
    mov dx, offset fname
    int 21h

    mov bx, ax

    mov dx, offset result
    mov cx, 200
    mov ah, 3fh
    int 21h

    mov ah, 3eh
    int 21h

    mov dx, offset result
    mov ah, 09h
    int 21h

    mov ah, 4ch
    int 21h
main endp

end main
