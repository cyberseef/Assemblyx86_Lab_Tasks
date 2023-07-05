.model small
.stack 100h
.data
.code
mov al,1
mov bl,3

mov cl,al
mov al,bl
mov bl,cl

mov dl,al
add dl,48
mov ah,02h
int 21h

mov dl,bl
add dl,48
mov ah,02h
int 21h

mov ah,4ch
int 21h
end
