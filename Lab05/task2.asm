.model small
.stack 100h
.data
var1 db 1
.code
mov ax,@data
mov ds,ax
l1:
mov dl,var1
add dl,48
mov ah,02h
int 21h

add var1,2
cmp var1,10
jbe l1

exit:
mov ah,4ch
int 21h
end