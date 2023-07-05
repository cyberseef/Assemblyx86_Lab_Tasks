.model small
.stack 100h
.data
.code
mov al,5
mov bl,1

add al,bl

mov dl,al
mov ah,02h
add dl,48
int 21h

mov ah, 4ch
int 21h
end