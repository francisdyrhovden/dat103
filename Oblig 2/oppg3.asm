cr equ 13 ; Vognretur
lf equ 10 ; Linjeskift

section .data
crlf db cr,lf
crlflen equ $ - crlf

section .text
global _start
_start:
mov ecx, 12
mov eax, '1'
l1:
mov [num], eax
mov eax, 4
mov ebx, 1
push ecx
mov ecx, num
mov edx, 1
int 0x80
mov eax, [num]
sub eax, '0'
inc eax

digg:
cmp eax, 10
jl cont
mov ebx, eax 
mov eax, 1 

sub ebx, 10 
mov eax, ebx

cont: 
add eax, '0'
pop ecx
call nylinje
loop l1
mov edx,nlLen
mov ecx,nl
mov ebx,1
mov eax,4
int 0x80
mov eax,1
int 0x80
section .bss
num resb 1
segment .data
nl dw 0xa
nlLen equ $ - nl

nylinje:
push eax
push ebx
push ecx
push edx
mov edx,crlflen
mov ecx,crlf
mov ebx,1 ; stdout
mov eax,4 ; syswrite
int 80h
pop edx
pop ecx
pop ebx
pop eax
ret
