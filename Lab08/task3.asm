.model small
.stack 100h
.data

digitCount dw 0
enteredNumber dw 0
temp1 dw 0
temp2 db 0
inputStr db "Enter any number: ","$"
outputStr db 0Ah,0Dh,"Entered Number is: ","$"

.code
mov ax,@data
mov ds,ax

mov ah,09h
mov dx,offset inputStr
int 21h

input:
mov ah,01h
int 21h
cmp al,13
je convertInput

sub al,48
mov ah,0
mov temp1,ax
mov ax,0

mov ax,enteredNumber
mov bl,10
mul bl
add ax,temp1
mov enteredNumber,ax
inc digitCount
jmp input

convertInput:
mov si, offset inputStr + 2
mov cx, 0

convertLoop:
mov al, [si]
cmp al, 13
je stopIt

sub al, '0'
mov ah, 0
mov bx, 10
mul bx
add cx, ax

inc si
jmp convertLoop

stopIt:
mov digitCount, cx

mov ah, 09h
mov dx, offset outputStr
int 21h

mov cx, 0
mov ax, enteredNumber

breakIt:
cmp cx, digitCount
je displayIt

mov bx, 10
div bx
push dx
inc cx
jmp breakIt

displayIt:
cmp cx, 0
je exit
dec cx
pop dx
add dl, 48
mov ah, 02h
int 21h
jmp displayIt

exit:
mov ah, 4ch
int 21h
end
