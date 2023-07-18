.model small
.stack 100h
.data
    arr db "abc","def","ghi","jkl","mno","pqr","stu","vwx","yz"
    arr_size equ $-arr
    arr_len equ arr_size/3
    arr_sum dw arr_len dup(0)
    arr_sum_index dw arr_len dup(0)
    arr_sorted db arr_size dup(0)
    arr_sorted_size equ $-arr_sorted
    arr_sorted_len equ arr_sorted_size/3
    newline db 0Ah, 0Dh, '$'

.code
mov ax, @data
mov ds, ax

mov cx, arr_len
mov si, 0
mov di, 0

sum_loop:
    mov ax, 0
    mov bx, si

char_loop:
    mov al, arr[bx]

    mov dl, bl
    mov cl, 8
    shl dl, cl

    mov cl, al
    mov al, dl
    mul cl

    add ax, dx
    inc bx
    cmp byte ptr arr[bx], 0
    jnz char_loop

    mov arr_sum[di], ax
    mov arr_sum_index[di], si

    inc di
    add si, 3
    loop sum_loop

mov cx, arr_len
dec cx

sort_loop:
    mov di, 0

inner_loop:
    mov ax, arr_sum[di]
    cmp ax, arr_sum[di + 2]
    jbe skip_swap

    xchg ax, arr_sum[di + 2]
    mov arr_sum[di], ax

    mov ax, arr_sum_index[di]
    xchg ax, arr_sum_index[di + 2]
    mov arr_sum_index[di], ax

skip_swap:
    add di, 2
    loop inner_loop

loop sort_loop

mov si, 0
mov di, 0

rearrange_loop:
    mov ax, arr_sum_index[di]
    mov bx, ax
    shl bx, 1

copy_loop:
    mov al, arr[bx]
    mov arr_sorted[si], al
    inc si
    inc bx
    cmp byte ptr arr[bx], 0
    jnz copy_loop

    mov byte ptr arr_sorted[si], ','
    inc si

    add di, 2
    cmp di, arr_len
    jl rearrange_loop

mov ah, 9
mov dx, offset arr_sorted
int 21h

mov ah, 4Ch
int 21h

end
