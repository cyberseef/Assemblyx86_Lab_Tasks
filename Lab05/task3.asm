.model small
.stack 100h
.data
.code
mov cx,50
mov ah,2
mov dl,'A'
l1:
int 21h
loop l1
mov ah,4ch
int 21h
end