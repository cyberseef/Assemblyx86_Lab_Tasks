.model small
.stack 100h
.data
a db 3
b db 3
.code
mov ax,@data
mov ds,ax

mov al,a
mov bl,b
sub al,bl

add al,48
mov ah,02h
mov dl,al
int 21h

mov ah,4ch
int 21h
end
