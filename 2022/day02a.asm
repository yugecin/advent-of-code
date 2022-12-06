section .text
%define TYPE 32
%include "common.asm"

aoc:
	push esi

	xor eax, eax
	xor ecx, ecx

	mov esi, input
@next:
	mov dl, [esi]
	test dl, dl
	jz @end
	sub dl, "A"
	mov cl, [esi+1]
	sub cl, "X"
	movzx edx, byte [score+edx*4+ecx]
	add eax, edx
	lea esi, [esi+2]
	jmp @next

@end:
	pop esi
	ret

section .data
	score db 4, 8, 3, 0, 1, 5, 9, 0, 7, 2, 6, 0
%include "day02input.asm"
