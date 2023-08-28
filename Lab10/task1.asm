.model small
.stack 100h
.data
fname DB 'first.txt'
fhandle dw 0
buffer db 5000 dup ('$')
.code
main proc
mov ax,@data
mov ds,ax
mov dx, offset fname
mov al,2
mov ah,3dh
int 21h
mov bx,ax
mov dx,offset buffer
mov ah,3fh
int 21h
mov ah,09
int 21h

mov ah,4ch
int 21h
exit:
main endp
end main