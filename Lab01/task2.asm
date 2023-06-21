.model small
.stack
.data
.code
mov al,'H'

mov dl, al
mov ah, 02h
int 21h

mov al,'e'

mov dl, al
mov ah, 02h
int 21h

mov al,'l'

mov dl, al
mov ah, 02h
int 21h

mov al,'l'

mov dl, al
mov ah, 02h
int 21h

mov al,'o'

mov dl, al
mov ah, 02h
int 21h

mov al,' '

mov dl, al
mov ah, 02h
int 21h

mov al,'W'

mov dl, al
mov ah, 02h
int 21h

mov al,'o'

mov dl, al
mov ah, 02h
int 21h

mov al,'r'

mov dl, al
mov ah, 02h
int 21h

mov al,'l'

mov dl, al
mov ah, 02h
int 21h

mov al,'d'

mov dl, al
mov ah, 02h
int 21h

mov ah, 4ch
int 21h
end
