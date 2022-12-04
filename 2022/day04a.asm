section .text
%include "dllentry.asm"

global aoc
aoc:
	push esi
	push edi
	xor edx, edx
	xor edi, edi
	mov esi, input
@next:
	mov eax, [esi]
	test eax, eax
	jz @end
	mov cx, ax
	shr eax, 16
	cmp ax, cx
	jg @ok
	xchg ax, cx
@ok:
	cmp ah, ch
	jne @okk
	cmp al, cl
	jl @okk
	xchg ax, cx
@okk:
	cmp cl, al
	setge ah
	cmp ch, al
	setge dl
	and dl, ah
	add edi, edx
	lea esi, [esi+4]
	jmp @next

@end:
	mov eax, edi
	xor edx, edx ; 64bit return value
	pop edi
	pop esi
	ret

section .rodata
%include "day04input.txt"
