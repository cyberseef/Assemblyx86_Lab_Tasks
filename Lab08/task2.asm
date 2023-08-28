.model small
.stack 100h
.data
    msg1 db 10,13,"Enter a number (max 5 digits): $"
    msg2 db 10,13,"Reverse of the number is : $"
    input_buffer db 7    ; To store the user input (5 digits + carriage return + null terminator)
    num dw ?             ; Store the multi-digit number
    rev dw ?             ; Store the reversed number
.code
mov ax, @data
mov ds, ax

mov ah, 09h
lea dx, msg1
int 21h

; Read user input (up to 5 digits)
mov ah, 01h
mov si, offset input_buffer
readLoop:
    int 21h
    cmp al, 13
    je inputDone
    
    mov [si], al
    inc si
    cmp si, offset input_buffer + 7
    jb readLoop
inputDone:

; Convert ASCII digits to numeric value (multi-digit number)
mov bx, 10
mov cx, 0
mov si, offset input_buffer

convertLoop:
    mov al, [si]
    cmp al, 13
    je inputConverted

    sub al, '0'
    mul bx
    add cx, ax

    inc si
    jmp convertLoop

inputConverted:
; Call the procedure to reverse the digits
call reverseDigits

mov ah, 09h
lea dx, msg2
int 21h

; Display the reversed number
mov ax, rev
add ax, 3030h
mov dl, ah
mov ah, 02h
int 21h

mov dl, al
mov ah, 02h
int 21h

exit:
mov ah, 4Ch
int 21h

reverseDigits proc
    push ax
    push bx
    push cx
    push dx

    ; Initialize variables
    mov bx, 10
    mov cx, 0

reverseLoop:
    mov dx, 0
    div bx
    mov bx, 10
    mov ax, dx

    ; Multiply the reversed number by 10
    push cx
    mov cx, 10
    mul cx
    pop cx

    ; Add the current digit to the reversed number
    add cx, ax

    ; Check if the original number is zero
    cmp num, 0
    jnz reverseLoop

    mov rev, cx

    pop dx
    pop cx
    pop bx
    pop ax
    ret
reverseDigits endp

end
