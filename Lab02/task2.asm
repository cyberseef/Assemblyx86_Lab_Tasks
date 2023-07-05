.model small
.stack 100h
.data
.code
mov ah,01h
int 21h

mov dl,al
sub dl,48
mov ah,02h
int 21h

mov ah,4ch
int 21h
end