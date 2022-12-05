section .text
%include "dllentry.asm"

global aoc
aoc:
	push esi
	push edi
	xor edi, edi
	mov esi, input
@next:
	mov eax, [esi]
	test eax, eax
	jz @end
	mov cx, ax
	shr eax, 16
	cmp al, cl
	setge dl
	setle dh
	cmp ah, ch
	setle al
	setge ah
	and al, dl
	and ah, dh
	or al, ah
	and eax, 1
	add edi, eax
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
