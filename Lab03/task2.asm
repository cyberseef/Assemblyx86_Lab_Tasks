.model small
.stack 100h
.data
a dw 10
b dw 12
.code
mov ax,@data
mov ds,ax
mov ax,a
add ax,b

mov bl,10
div bl

mov dl,al
add dl,48
mov ah,02h
int 21h

mov dl,ah
add dl,48
mov ah,02h
int 21h

mov ah,4ch
int 21h
end
