.Model Small
.Stack 100h
.Data
fname db 'second.txt',0
handle dw 0
text db 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s $'
.Code
main proc
	mov ax, @data
	mov ds, ax
	mov ah, 3ch
	mov cl, 0
	mov dx, offset fname
	int 21h
	mov dx, offset fname
	mov cl, 2
	mov ah, 3dh
	int 21h
	mov cx, 160
	mov bx, ax
	mov dx, offset text
	mov ah, 40h
	int 21h
	mov ah, 3fh
	int 21h
	mov ah, 09
	int 21h
	mov ah, 3eh

mov bx, handle
int 21h
mov ah, 4ch
int 21h
main endp
end main