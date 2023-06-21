.model small
.stack
.data
.code
mov ah, 01h
int 21h

mov bl, al
add bl, 32

mov dl, bl
mov ah, 02h
int 21h

mov ah, 4ch
int 21h
end