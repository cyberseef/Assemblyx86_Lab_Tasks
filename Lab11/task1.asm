.model small
.stack 100h
.data
var DB 'Touseef', '$'
var1 DB '=============', '$'

.code
mov ax, @data
mov ds, ax

mov ah, 00h
mov al, 03h
int 10h

mov bh, 0
mov dh, 12
mov dl, 28
mov ah, 02H
int 10H

lea si, var1
call func

inc dh
mov dl, 28
mov ah, 02H
int 10H
mov al, '|'
mov ah, 0eH
int 10H
lea si, var
call func

mov al, '|'
mov ah, 0eH
int 10H

inc dh
mov dl, 28
mov ah, 02H
int 10H
lea si, var1
call func

mov ah, 4ch
int 21h

func proc
l2:
lodsb
cmp al, '$'
je l3
mov ah, 0eH
int 10H
jmp l2
l3:
ret
func endp

END
