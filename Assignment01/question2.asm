.model small
.stack 100h
.data
    n dw 3
    A dw 1,2,3,4,5,6,7,8,9
.code
main proc
    mov ax, @data
    mov ds, ax

    mov bx, n
    dec bx
    shl bx, 1

    mov cx, n

    outer_loop:
        dec cx

        mov di, cx

        inner_loop:
            push cx

            mov si, di

            mov ax, di
            sub ax, cx
            shl ax, 1

            mov bx, ax
            add bx, di

            mov dx, n

            element_loop:
                mov ax, A[bx]
                xchg ax, A[bx+bx]
                mov A[bx+bx], ax

                add bx, bx
                add bx, di

                dec dx
                jnz element_loop

            pop cx

            add di, n
            cmp di, bx
            jb inner_loop

    mov ah, 4ch
    int 21h
main endp
end main
