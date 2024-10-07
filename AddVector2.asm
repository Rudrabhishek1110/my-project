org 100h
.MODEL SMALL
.STACK 100H
.DATA
V1 DB 1, 2, 3, 4, 5,6,10,9,7,8
V2 DB 13, 12, 45, 27, 31 ,41,48,52,59,63
V3 DB ?, ?, ?, ?, ?, ? ,?,?,?,?
num DB 10
ten DB 10
spc DB ' $'
output_msg DB 10, 13, 'Result Vector: $'
.CODE
main PROC
.STARTUP
mov si, 0 ;initializing index register si 
mov cl, num
mov ch, 0                   
mov ax, 0  

Add_loop:
mov al, V1[si] ; move contents at address V1 + contents of register si  to al
add al, V2[si]
mov V3[si], al
inc si
dec cl
jne Add_loop
mov ah, 09h
lea dx, output_msg ; print output message

int 21h
mov si, 0
mov cl, num
Print_loop:
mov ax, 0
mov al, V3[si] ; to display integer in ax
inc si
div ten ; al=2 , ah=3
push ax ; in order to avoid being overwritten, store ax in stack
mov dl, al
add dl, 30h
mov ah, 02h
int 21h ; to display ten's place digit previously stored in al i.e. 2
pop ax ; restore value of ax from stack
mov dl, ah
add dl, 30h
mov ah, 02h
int 21h ; to display unit's place digit previously stored in var i.e. 3
mov ah,09h
lea dx, spc ; to print spaces
int 21h
dec cl
jne Print_loop

mov ah ,4ch
mov al ,0
int 21h
main ENDP
END main

