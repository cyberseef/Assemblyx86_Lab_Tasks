.model small
.stack
.data
.code
mov al, 7
add al, 48

mov dl, al
mov ah,02h
int 21h

inc al
mov dl, al
mov ah,02h
int 21h

mov ah, 4ch
int 21h
end