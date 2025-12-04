section .text
%define TYPE 32
%include "common.asm"

aoc:
	push esi
	push ebp
	xor eax, eax
	mov ebp, 50

	mov esi, input
@next:
	mov cl, [esi]
	test cl, cl
	jz @end
	mov bx, [esi+2]
	add esi, 4
	cmp cl, 'L'
	mov ecx, 0
	setne cl
	dec ecx
	and cx, bx

	movzx ebx, bx
	movzx ecx, cx
	add ebp, ebx
	sub ebp, ecx
	sub ebp, ecx
	; uuuuuuuuughhhhhhhhhh yeah
@b:
	cmp ebp, 0
	jl @l
	cmp ebp, 100
	jl @ok
	sub ebp, 100
	jmp @b
@l:
	add ebp, 100
	jmp @b
@ok:
	xor ebx, ebx
	test ebp, ebp
	setz bl
	add eax, ebx
	jmp @next
@end:
	pop ebp
	pop esi
	ret

section .data
section .rodata
%include "day01input.asm"
