.model small
.stack 100h
.data
.code
main proc
    mov ax, @data
    mov ds, ax

    mov cx, 10
    mov bx, 0
    mov dx, 0

L1:
    mov ah, 2
    mov dl, ' '
    int 21h

    mov ah, 2
    mov dl, '9'
    int 21h

    mov ah, 2
    mov dl, ' '
    int 21h

    inc bx
    cmp bx, 10
    je L2

    inc dx
    cmp dx, 10
    je L3

    jmp L1

L2:
    mov ah, 2
    mov dl, 0dh
    int 21h

    mov ah, 2
    mov dl, 0ah
    int 21h

    dec cx
    cmp cx, 0
    je exit

    mov bx, 0
    mov dx, 0
    jmp L1

L3:
    mov ah, 2
    mov dl, 0dh
    int 21h

    mov ah, 2
    mov dl, 0ah
    int 21h

    dec cx
    cmp cx, 0
    je exit

    mov bx, 0
    mov dx, 0
    jmp L1

exit:
    mov ah, 4ch
    int 21h
endp
end main
