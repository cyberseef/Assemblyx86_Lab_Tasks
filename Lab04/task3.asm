.model small
.stack 100h
.data
.code
mov ah,01h
int 21h
sub al,48

cmp al,8
jae l1
cmp al,7
jae l2
cmp al,6
jae l3
cmp al,5
jae l4
cmp al,4
jae l5
cmp al,3
jae l6
jmp l7

l1:
mov ah,02h
mov dl,'A'
int 21h
jmp exit

l2:
mov ah,02h
mov dl,'A'
int 21h
mov ah,02h
mov dl,'-'
int 21h
jmp exit

l3:
mov ah,02h
mov dl,'B'
int 21h
mov ah,02h
mov dl,'+'
int 21h
jmp exit

l4:
mov ah,02h
mov dl,'B'
int 21h
jmp exit

l5:
mov ah,02h
mov dl,'B'
int 21h
mov ah,02h
mov dl,'-'
int 21h
jmp exit

l6:
mov ah,02h
mov dl,'C'
int 21h
mov ah,02h
mov dl,'+'
int 21h
jmp exit

l7:
mov ah,02h
mov dl,'F'
int 21h
jmp exit

exit:
mov ah,4ch
int 21h
end