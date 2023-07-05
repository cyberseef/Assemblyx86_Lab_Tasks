.model small
.stack 100h
.data
.code
mov ah,01h
int 21h
sub al,48
mov bl,al
mov ah,01h
int 21h
sub al,48
mov bh,al

cmp bh,bl
je l1
jmp l2

l1:
mov ah,02h
mov dl,'Y'
int 21h
jmp exit

l2:
mov ah,02h
mov dl,'N'
int 21h

exit:
mov ah,4ch
int 21h
end
