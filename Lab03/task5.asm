.model small
.stack 100h
.data
var1 db 1
var2 db 2
var3 db 3
var4 db ?
.code
mov ax,@data
mov ds,ax

mov al,var1
mov bl,var2
mul bl

add al,var3

mov var4,al

mov dl,var4
mov ah,02h
add dl,48
int 21h

mov ah,4ch
int 21h
end