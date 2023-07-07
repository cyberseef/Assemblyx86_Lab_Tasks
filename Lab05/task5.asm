.model small
.stack 100h
.data
.code   
mov cx, 7

l1:
mov bx, 1

l2:
mov dl, bl
add dl, 48
mov ah, 02h
mov dl, dl
int 21h

inc bx
cmp bx, cx
jle l2

mov ah, 02h
mov dl, 0ah
int 21h

dec cx
cmp cx, 0
jg l1
    
mov ah, 4Ch
int 21h
end