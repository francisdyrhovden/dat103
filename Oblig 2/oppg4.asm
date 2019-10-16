; Konstanter
	SYS_EXIT equ 1
	SYS_READ equ 3
	SYS_WRITE equ 4
	STDIN equ 0
	STDOUT equ 1
	STDERR equ 2

; Datasegment
section .bss
	a resb 1
	i resb 1

; Kodesegment med program
section .text

global _start
_start:
	mov [a], byte 0
	mov [i], byte 0
    mov eax, [a]
	mov ebx, [i]
    jmp main
    
mindreEnnTi:
	add eax, 1
	add ebx, 1
	
main:
	cmp ebx, 10
	jl mindreEnnTi
storreEnnTi:
	sub eax, 1
	add	ebx, 1
	cmp ebx, 20
	jl 	storreEnnTi
	add eax, '0'
	mov [a], eax
	mov ecx, a
	mov edx, 1
	mov ebx, STDOUT
	mov eax, SYS_WRITE
	int 80h
	mov eax,SYS_EXIT
	mov ebx,0
	int 80h

