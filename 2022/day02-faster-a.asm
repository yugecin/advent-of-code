section .text
%define TYPE 32
%include "common.asm"

aoc:
	push esi

	xor eax, eax
	mov esi, input
@next:
	mov edx, [esi]
	test edx, edx
	jz @end
	movzx edx, byte [score+edx]
	add eax, edx
	lea esi, [esi+4]
	jmp @next

@end:
	pop esi
	ret

section .data
	score \
		db 0x5841 dup(0)
		db 4, 1, 7
		db 0xFD dup(0)
		db 8, 5, 2
		db 0xFD dup(0)
		db 3, 9, 6
%include "day02-faster-input.asm"
