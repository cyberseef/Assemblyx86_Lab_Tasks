.model small
.stack 100h
.data
.code
mov dl,65
mov cx,26

l1:
mov ah,02h
int 21h
inc dl
loop l1
mov dl,90
mov cx,26

l2:
mov ah,02h
int 21h
dec dl
loop l2

exit:
mov ah,4ch
int 21h
end