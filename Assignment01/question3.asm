.model small
.stack 100h
.data
ROWS dw 3
COLS dw 3
matrix dw 1, 2, 3, 4, 5, 6, 7, 8, 9
maxVal dw 1
.code
main proc
mov ax, @data
mov ds, ax
mov es, ax
mov cx, ROWS
mov bx, COLS
mov si, 0
mov di, 0
mov ax, matrix[si][di]
mov maxVal, ax
mov ax, 0
mov bx, 0
mov dx, 0
mov cx, 0
mov si, 0
mov di, 0
mov ax, matrix[si][di]
mov bx, maxVal
cmp ax, bx
jle L1
mov maxVal, ax
L1:
inc di
cmp di, COLS
jne L1
inc si
cmp si, ROWS
jne L1

mov ax, 4ch
int 21h
main endp
end main