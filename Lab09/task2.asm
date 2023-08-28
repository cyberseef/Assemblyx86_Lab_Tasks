.model small
.stack 100h

.data
msg1 db "Enter a string : $"
msg2 db "Number of vowels : $"
msg3 db "Number of consonants : $"
str db 80 dup('$')
vowels db 0
consonants db 0

.code
Count proc
    xor al, al
    xor bh, bh

    l1:
    mov bl, [si]
    cmp bl, 0Dh
    je l6

    cmp bl, 'a'
    jl check_uppercase
    cmp bl, 'e'
    jg check_uppercase
    inc al
    jmp skip_char

    check_uppercase:
    cmp bl, 'A'
    jl check_consonant
    cmp bl, 'E'
    jg check_consonant
    inc al
    jmp skip_char

    check_consonant:
    cmp bl, 'z'
    jg check_uppercase_letter
    cmp bl, 'a'
    jl not_letter
    cmp bl, 'z'
    jg not_letter
    inc bh
    jmp skip_char

    check_uppercase_letter:
    cmp bl, 'Z'
    jl not_letter
    cmp bl, 'A'
    jl not_letter
    cmp bl, 'Z'
    jg not_letter
    inc bh
    jmp skip_char

    not_letter:

    skip_char:
    inc si
    jmp l1

    l6:
    mov vowels, al
    mov consonants, bh

    ret
Count endp

main proc
    mov ax, @data
    mov ds, ax

    mov ah, 09h
    lea dx, msg1
    int 21h

    mov ah, 0Ah
    lea dx, str
    int 21h

    mov si, offset str

    lea si, str
    call Count

    mov ah, 09h
    lea dx, msg2
    int 21h

    mov al, vowels
    add al, 48
    mov dl, al
    mov ah, 02h
    int 21h

    mov ah, 09h
    lea dx, msg3
    int 21h

    mov al, consonants
    add al, 48
    mov dl, al
    mov ah, 02h
    int 21h

    mov ah, 4Ch
    int 21h
main endp
end main
