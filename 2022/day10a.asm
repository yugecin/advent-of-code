section .text
%define TYPE 32
%include "common.asm"

aoc:
	push edi
	push esi
	push ebp
	push ebx

	mov edx, 1 ; current cycle
	mov edi, 21 ; current cycle but not really
	mov ebp, 1 ; V
	xor eax, eax
	mov esi, input
	@loop:
		mov bx, [esi]
		test bl, bl
		jz @end
		lea esi, [esi+2]
		cmp bl, "a"
		je @add
		push @loop
		jmp check_and_increase_cycle
		@add:
		call check_and_increase_cycle
		call check_and_increase_cycle
		movsx ebx, bh
		add ebp, ebx
		jmp @loop

@end:
	pop ebx
	pop ebp
	pop esi
	pop edi
	ret

check_and_increase_cycle:
	cmp edi, 40
	je @yes
	@lolno:
	inc edx
	inc edi
	ret
@yes:
	cmp edx, 230
	ja @lolno
	mov ecx, ebp
	imul ecx, edx
	add eax, ecx
	inc edx
	mov edi, 1
	ret

%include "day10input.asm"
