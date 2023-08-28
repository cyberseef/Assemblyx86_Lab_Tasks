.model small
.stack 100h
.data
    msg1 db 10,13,"Enter first number (2 digits) : $"
    msg2 db 10,13,"Enter second number (2 digits) : $"
    msg3 db 10,13,"Enter third number (2 digits) : $"
    msg4_max db 10,13,"The maximum number is : $"
    msg4_min db 10,13,"The minimum number is : $"
    num1 db ?
    num2 db ?
    num3 db ?
    num4 db ?
    num5 db ?
    num6 db ?
    max db ?
    max_units db ?
    min db ?
    min_units db ?
.code
mov ax, @data
mov ds, ax

; Input for the first number
lea dx, msg1
mov ah, 9
int 21h

; Read first digit of the first number
mov ah, 1
int 21h
sub al, '0'
mov num1, al

; Read second digit of the first number
mov ah, 1
int 21h
sub al, '0'
mov num2, al

; Input for the second number
lea dx, msg2
mov ah, 9
int 21h

; Read first digit of the second number
mov ah, 1
int 21h
sub al, '0'
mov num3, al

; Read second digit of the second number
mov ah, 1
int 21h
sub al, '0'
mov num4, al

; Input for the third number
lea dx, msg3
mov ah, 9
int 21h

; Read first digit of the third number
mov ah, 1
int 21h
sub al, '0'
mov num5, al

; Read second digit of the third number
mov ah, 1
int 21h
sub al, '0'
mov num6, al

; Combine digits to form the actual numbers
mov al, num1
mov ah, 10
mul ah
add al, num2
mov bx, ax ; bx = First number
mov bh, num1
mov bl, num2

mov al, num3
mov ah, 10
mul ah
add al, num4
cmp ax, bx
jg l1
mov bx, ax ; bx = Second number
mov bh, num3
mov bl, num4

l1:
mov al, num5
mov ah, 10
mul ah
add al, num6
cmp ax, bx
jg l2
mov bx, 0
mov bh, num5 ; bx = Third number
mov bl, num6

l2:
mov max, bh ; Store the tens digit of the maximum number
mov max_units, bl ; Store the units digit of the maximum number

lea dx, msg4_max
mov ah, 9
int 21h

mov al, max ; Convert the tens digit of the maximum number to ASCII
add al, '0'
mov ah, 0
mov dl, al
mov ah, 2
int 21h

mov al, max_units ; Convert the units digit of the maximum number to ASCII
add al, '0'
mov ah, 0
mov dl, al
mov ah, 2
int 21h

; Find the minimum number
mov al, num1 ; Assume the first number is the minimum
mov ah, num2
mov bl, al
mov bh, ah

mov al, num3 ; Compare with the second number
mov ah, num4
cmp ax, bx
jl l3

mov al, num3 ; If the second number is smaller, update the minimum
mov ah, num4

l3:
mov bl, al
mov bh, ah

mov al, num5 ; Compare with the third number
mov ah, num6
cmp ax, bx
jl l4

mov al, num5 ; If the third number is smaller, update the minimum
mov ah, num6

l4:
mov min, bh ; Store the tens digit of the minimum number
mov min_units, bl ; Store the units digit of the minimum number

lea dx, msg4_min
mov ah, 9
int 21h

mov al, min_units ; Convert the units digit of the minimum number to ASCII
add al, '0'
mov ah, 0
mov dl, al
mov ah, 2
int 21h

mov al, min ; Convert the tens digit of the minimum number to ASCII
add al, '0'
mov ah, 0
mov dl, al
mov ah, 2
int 21h

exit:
mov ah, 4Ch ; Exit program
int 21h

end
