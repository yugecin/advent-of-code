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
	cmp dword [esi], "four"
	jne @a
	mov bl, 4
	jmp @ugh
@a:
	cmp dword [esi], "five"
	jne @b
	mov bl, 5
	jmp @ugh
@b:
	cmp dword [esi], "nine"
	jne @c
	mov bl, 9
	jmp @ugh
@c:
	cmp dword [esi], "thre"
	jne @d
	cmp byte [esi+4], 'e'
	jne @d
	mov bl, 3
	jmp @ugh
@d:
	cmp dword [esi], "seve"
	jne @e
	cmp byte [esi+4], 'n'
	jne @e
	mov bl, 7
	jmp @ugh
@e:
	cmp dword [esi], "eigh"
	jne @f
	cmp byte [esi+4], 't'
	jne @f
	mov bl, 8
	jmp @ugh
@f:
	cmp word [esi], "on"
	jne @g
	cmp byte [esi+2], 'e'
	jne @g
	mov bl, 1
	jmp @ugh
@g:
	cmp word [esi], "tw"
	jne @h
	cmp byte [esi+2], 'o'
	jne @h
	mov bl, 2
	jmp @ugh
@h:
	cmp word [esi], "si"
	jne @i
	cmp byte [esi+2], 'x'
	jne @i
	mov bl, 6
	jmp @ugh
@i:
	sub bl, '0'
	cmp bl, 9
	ja @nah
@ugh:
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
