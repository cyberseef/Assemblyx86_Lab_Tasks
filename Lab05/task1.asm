.model small
.stack 100h
.data
.code
mov cx,10
mov al,9
add al,48

l1:
mov dl,al
mov ah,2
int 21h
dec al
loop l1

mov ah,4ch
int 21h
end