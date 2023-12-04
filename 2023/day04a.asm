section .text
%define TYPE 32
%include "common.asm"

;%define INPUT testinput
%define INPUT input

aoc:
	push ebp
	push esi
	push edi
	xor ebp, ebp
	mov esi, INPUT

.nextline:
	xor ebx, ebx
	add esi, 10
	xor eax, eax
	mov edi, table
	mov ecx, 100/4
	rep stosd

.beforepipe:
	mov ax, [esi]
	cmp al, '|'
	je .afterpipe
	movzx cx, al
	movzx eax, ah
	sub al, '0'
	cmp cl, ' '
	je .noten
	sub cl, '0'
	imul cx, cx, 10
	add al, cl
.noten:
	mov byte [table+eax], 1
	add esi, 3
	jmp .beforepipe
.afterpipe:
	add esi, 2
.afterpipe.loop:
	mov ax, [esi]
	test ax, ax
	jz .end
	cmp ax, "Ca"
	jne .isnumber
	add ebp, ebx
	jmp .nextline
.isnumber:
	movzx cx, al
	movzx eax, ah
	sub al, '0'
	cmp cl, ' '
	je .notenB
	sub cl, '0'
	imul cx, cx, 10
	add al, cl
.notenB:
	test byte [table+eax], 1
	jz .notwinning
	shl ebx, 1
	setz cl
	or bl, cl
.notwinning:
	add esi, 3
	jmp .afterpipe.loop
.end:

	mov eax, ebp
	pop edi
	pop esi
	pop ebp
	ret

section .bss
	table resb 100
section .rodata
%include "day04input.asm"
