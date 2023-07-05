.model small
.stack 100h
.data
.code
mov ah,01h
int 21h
sub al,48

mov bl,2
div bl
cmp ah,0
je l1
jmp l2

l1:
mov ah,02h
mov dl,'E'
int 21h
jmp exit

l2:
mov ah,02h
mov dl,'O'
int 21h

exit:
mov ah,4ch
int 21h
end