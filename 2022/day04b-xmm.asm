section .text
%define TYPE 32
%include "common.asm"

;punpckhqd: 1 2 3 4 -> 3 3 4 4
;punpckhqdq: 1 2 3 4 -> 3 4 3 4

global aoc
aoc:
	push esi
	push edi
	xor edi, edi
	mov esi, input
@next:
	movdqa xmm0, [esi]
	movd eax, xmm0
	call doline
	pextrd eax, xmm0, 1
	call doline
	punpckhqdq xmm0, xmm0
	movd eax, xmm0
	call doline
	pextrd eax, xmm0, 1
	call doline
	add esi, 16
	jmp @next

doline:
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
	ret

@end:
	add esp, 4 ; // since we are in the 'doline' func, pop its return address
	mov eax, edi
	pop edi
	pop esi
	ret

section .rodata
	align 16
%include "day04input.txt"
