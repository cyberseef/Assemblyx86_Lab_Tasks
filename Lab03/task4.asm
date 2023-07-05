.model small
.stack 100h
.data
var1 dw 2
var2 dw 5
var4 dw ?
.code
mov ax, @data
mov ds, ax

mov ax, var1
mov bx, 5
mul bx
;ax =5

mov bx, var2
sub bx, 3

;bx = 2
div bx ;5/2
mov var4, ax

;mov bx,10
;div bx

mov dx, ax
add dx, 48
mov ah, 02h
int 21h

;mov dl, ah
;add dl, 48
;mov ah, 02h
;int 21h

mov ah, 4ch
int 21h
end
