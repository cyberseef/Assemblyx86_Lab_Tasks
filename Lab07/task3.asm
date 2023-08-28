.model small
.stack 100h
.data
array2 dw 1, 2, 3, 4, 5, 6, 7, 8, 9
sum2 dw 0
sum_msg2 db 'Sum of elements: $'
sum_str2 db 5 dup(' ')
.code
mov ax, @data
mov ds, ax

mov bx, 0  
mov cx, 9  

l1:
mov ax, [array2+bx]  
add [sum2], ax       
add bx, 2          
loop l1

mov ax, [sum2]
lea bx, sum_str2
add bx, 4
mov byte ptr [bx], '$'
dec bx

l2:
mov dx, 0   
mov cx, 10
div cx
add dl, '0'
dec bx
mov [bx], dl
cmp ax, 0   
jnz l2

mov ah, 09h
lea dx, sum_msg2
int 21h

mov ah, 09h
lea dx, sum_str2
int 21h

mov ah, 4ch
int 21h
end
