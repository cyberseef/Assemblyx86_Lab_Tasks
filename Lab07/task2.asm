.model small
.stack 100h
.data
array db 's','t','u','v','w','x','y','z'
vowels dw 0
.code
mov ax, @data
mov ds, ax

mov cx, 8
mov si, 0
mov bx, 0

l1:
mov al, array[si]
cmp al, 'a'
je l2
cmp al, 'e'
je l2
cmp al, 'i'
je l2
cmp al, 'o'
je l2
cmp al, 'u'
je l2
jmp l3

l2:
inc bx
push ax
mov dl, al
mov ah, 02h
int 21h
pop ax

l3:
inc si
loop l1

mov vowels, bx

mov ah, 4ch
int 21h
end
