.model small
.stack 100h
.data
str db 100 dup('$')
revstr db 100 dup('$')
.code
mov ax, @data
mov ds, ax

lea dx, str 
mov ah, 0ah
int 21h

lea si, str+2
lea di, revstr

mov cx, 0
mov cl, [si - 1]

add si, cx
dec si

l2:
mov al, [si]
mov [di], al
inc di
dec si
loop l2

lea dx, revstr
mov ah, 09h
int 21h

mov ah, 4ch
int 21h
end