.model small
.stack 100h
.data
    result dw 0

.code
Factorial MACRO number
    mov cx, number
    mov ax, 1

    l1:
    mul cx
    loop l1

    mov result, ax
endm

main proc
    mov ax, @data
    mov ds, ax

    mov cx, 4
    Factorial cx

    mov ax, result
    mov bl, 10
    div bl

    mov dl, al
    add dl, 48
    mov ah, 02h
    int 21h

    mov ax, result
    mov bl, 10
    div bl

    mov dl, ah
    add dl, 48
    mov ah, 02h
    int 21h

    mov ah, 4Ch
    int 21h
main ENDP

END main
