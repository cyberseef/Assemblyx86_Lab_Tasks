.model small
.386
.stack 
.data
b1 db "Enter first name: ",'$'
b2 db "Enter last name : ",'$'
b3 db "Enter age : ",'$'
b4 db "Enter Overall Percent : ",'$'
var1 db "Hello ",'$'
var2 db "How are you? Congratulations on reaching the age ",'$'
space db ' ','$'
newLine db 0Ah,0Dh,'$'
final db 20 DUP(?)
Student struct
name1 db 100 DUP(?)
name2 db 100 DUP(?)
age db 2 DUP(?)
percent db 2 DUP(?)
Student ends
S1 Student <>
.code

mov ax,@data
mov ds,ax

mov dx,0
mov dx,offset b1
mov ah,09h
int 21h

mov dx,offset S1.name1
mov ah,3FH
int 21h


mov dx,0
mov dx,offset b2
mov ah,09h
int 21h

mov dx,offset S1.name2
mov ah,3FH
int 21h


mov dx,0
mov dx,offset b3
mov ah,09h
int 21h

mov dx,offset S1.age
mov ah,3FH
int 21h



mov dx,0
mov dx,offset b4
mov ah,09h
int 21h

mov dx,offset S1.percent
mov ah,3FH
int 21h


mov dx,0
mov dx, offset var1
mov ah,09h
int 21h

mov dx,0
mov dx, offset S1.name1
mov ah,09h
int 21h

mov dx,0
mov dx, offset space
mov ah,09h
int 21h

mov dx,0
mov dx, offset S1.name2
mov ah,09h
int 21h

mov dx,0
mov dx, offset var2
mov ah,09h
int 21h

;mov dx,0
;mov dx, offset cong
;mov ah,09h
;int 21h

mov dx,0
mov dx, offset S1.age
mov ah,09h
int 21h

mov ah,4ch
int 21h
end