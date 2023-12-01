section .text
%define TYPE 32
%include "common.asm"

aoc:
	push edx
	push esi
	xor eax, eax
	mov esi, input

	mov edx, 0ffff0000h
@n:
	mov bl, [esi]
	test bl, bl
	jnz @nz
	movzx ebx, dh
	imul bx, bx, 10
	add dl, bl
	movzx edx, dl
	add eax, edx
	inc esi
	test dword [esi], 0ffh
	jz @end
	mov edx, 0ffff0000h
	jmp @n
@nz:
	sub bl, '0'
	cmp bl, 9
	ja @nah
	test edx, 0ffff0000h
	jz @hasfirst
	mov dh, bl
	and edx, 0ffffh
@hasfirst:
	mov dl, bl
@nah:
	inc esi
	jmp @n

@end:
	pop esi
	pop edx
	ret

section .data
%include "day01input.asm"
