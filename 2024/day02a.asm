section .text
%define TYPE 32
%include "common.asm"

aoc:
	push esi
	push edx
	xor eax, eax

	mov esi, input
@checkline:
	xor cl, cl
	mov bh, [esi]
	mov bl, [esi+1]
	test bx, bx
	jz @end
	cmp bh, bl
	setg cl
	mov bl, bh
@nextpair:
	inc esi
	xor ch, ch
	mov bh, bl
	mov bl, [esi]
	test bl, bl
	jnz @checkpair
	inc eax
	inc esi
	jmp @checkline
@checkpair:
	cmp bh, bl
	je @nextline
	setg ch
	cmp ch, cl
	jne @nextline
	test ch, ch
	jnz @g
	mov ch, bl
	sub ch, bh
	jmp @c
@g:
	mov ch, bh
	sub ch, bl
@c:
	cmp ch, 1
	jl @nextline
	cmp ch, 3
	jng @nextpair
@nextline:
	mov bl, [esi]
	inc esi
	test bl, bl
	jnz @nextline
@eol:
	mov bl, [esi]
	test bl, bl
	jnz @checkline
@end:
	pop edx
	pop esi
	ret

section .data
section .rodata
%include "day02input.asm"
