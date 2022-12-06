section .text
%define TYPE 32
%include "common.asm"

aoc:
	push esi
	push ebx
	push ebp

	xor ecx, ecx
	xor ebx, ebx
	xor edx, edx
	xor ebp, ebp
	xor esi, esi
	xor eax, eax
@add:
	add ecx, esi
	mov esi, [input+eax*4]
@next_elf:
	inc eax
	test esi, esi
	jnz @add
	cmp ecx, ebx
	jl @lower
	mov ebx, ecx
	cmp ebx, edx
	jl @lower
	xchg ebx, edx
	cmp edx, ebp
	jl @lower
	xchg ebp, edx
@lower:
	xor ecx, ecx
	mov esi, [input+eax*4]
	test esi, esi
	jnz @next_elf

end:

	mov eax, ebx
	add eax, edx
	add eax, ebp
	pop ebp
	pop ebx
	pop esi
	ret

section .data
%include "day01input.asm"
