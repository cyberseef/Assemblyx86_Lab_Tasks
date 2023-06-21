.model small
.stack
.data
.code
mov al, 2
mov bl, 4

sub bl, al
add bl, 48

mov dl, bl
mov ah, 02h
int 21h

mov ah, 4ch
int 21h
end