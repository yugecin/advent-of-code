section .text
%define TYPE 32
%include "common.asm"

aoc:
	push esi
	push edx
	xor eax, eax

	mov esi, input
@continue:
	mov ebx, [esi]
	test ebx, ebx
	jz @end
	cmp ebx, "don'"
	jnz @nodon
	add esi, 3
	cmp dword [esi], "'t()"
	jnz @continue
@nodo:
	inc esi
	mov ebx, [esi]
	test ebx, ebx
	jz @end
	cmp ebx, "do()"
	jne @nodo
	add esi, 4
	jmp @continue
@nodon:
	cmp ebx, "mul("
	jz @mul
	inc esi
	jmp @continue
@mul:
	add esi, 4
	mov bl, [esi]
	sub bl, '0'
	cmp bl, 9
	ja @continue
	movzx ecx, bl
	inc esi
	mov bl, [esi]
	cmp bl, ','
	je @n
	sub bl, '0'
	cmp bl, 9
	ja @continue
	movzx ebx, bl
	imul ecx, 10
	add ecx, ebx
	inc esi
	mov bl, [esi]
	cmp bl, ','
	je @n
	sub bl, '0'
	cmp bl, 9
	ja @continue
	movzx ebx, bl
	imul ecx, 10
	add ecx, ebx
	inc esi
	mov bl, [esi]
	cmp bl, ','
	jne @continue
@n:
	inc esi
	mov bl, [esi]
	sub bl, '0'
	cmp bl, 9
	ja @continue
	movzx edx, bl
	inc esi
	mov bl, [esi]
	cmp bl, ')'
	je @e
	sub bl, '0'
	cmp bl, 9
	ja @continue
	movzx ebx, bl
	imul edx, 10
	add edx, ebx
	inc esi
	mov bl, [esi]
	cmp bl, ')'
	je @e
	sub bl, '0'
	cmp bl, 9
	ja @continue
	movzx ebx, bl
	imul edx, 10
	add edx, ebx
	inc esi
	mov bl, [esi]
	cmp bl, ')'
	jne @continue
@e:
	imul ecx, edx
	add eax, ecx
	jmp @continue
@end:
	pop edx
	pop esi
	ret

section .data
section .rodata
%include "day03input.asm"
