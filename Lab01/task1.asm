.model small
.stack
.data
.code
mov al,'T'

mov dl, al
mov ah, 02h
int 21h

mov al,'o'

mov dl, al
mov ah, 02h
int 21h

mov al,'m'

mov ah, 4ch
int 21h
end
