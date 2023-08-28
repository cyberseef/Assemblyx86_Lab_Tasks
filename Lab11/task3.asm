.model small
.stack 100h
.data
.code
mov ax, @data
mov ds, ax
mov ah, 00H
mov al, 13H
int 10H

mov dx, 80
mov cx, 100
mov al, 0eH
mov bh, 0

l1:
push cx

l2:
mov ah, 0cH
int 10H
inc cx
cmp cx, 120
jl l2

pop cx
inc dx
cmp dx, 120
jl l1

mov ah, 00H
int 16H

mov ah, 00H
mov al, 03H
int 10H

mov ah, 4cH
int 21H
end
