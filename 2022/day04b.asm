section .text
%define TYPE 32
%include "common.asm"

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
	mov edx, eax
	cmp cl, al
	cmovg eax, ecx
	cmp ch, dh
	cmovl edx, ecx
	cmp al, dh
	setle dl
	and edx, 1
	add edi, edx
	lea esi, [esi+4]
	jmp @next

@end:
	mov eax, edi
	pop edi
	pop esi
	ret

section .rodata
%include "day04input.txt"
