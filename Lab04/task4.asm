.model small
.stack 100h
.data
var1 db ?
var2 db ?
var3 dw ?
var4 db ?
.code
main proc
mov ax, @data
mov ds, ax
mov ah, 01h
int 21h
mov var1, al

mov ah, 01h
int 21h
mov var2, al

cmp al, var1
je l1
jmp l2

l1:
mov var3, 10
mov ax, var3
mov bl, 10
div bl

mov bl, al
mov dl,bl
add dl, 48
mov ah,02h
int 21h

mov ax, var3
mov bl, 10
div bl

mov bh,ah
mov dl,bh
add dl,48
mov ah,02h
int 21h

jmp exit

l2:
mov var3, 6
mov var4, 7
mov ah,02h
mov dx,var3
add dl,48
int 21h
mov ah,02h
mov dl,var4
add dl,48
int 21h

exit:
mov ah, 4ch
int 21h
main endp
end main

