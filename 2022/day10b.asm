section .text
%define TYPE 32
%include "common.asm"

aoc:
	push edi
	push esi
	push ebp
	push ebx

	mov edx, 0 ; column
	mov edi, 0 ; row
	mov ebp, 1 ; V
	mov esi, input
	@loop:
		mov bx, [esi]
		test bl, bl
		jz @end
		lea esi, [esi+2]
		cmp bl, "a"
		je @add
		push @loop
		jmp do_thing
		@add:
		call do_thing
		call do_thing
		movsx ebx, bh
		add ebp, ebx
		jmp @loop

@end:
	mov eax, -2
@end2:
	pop ebx
	pop ebp
	pop esi
	pop edi
	ret

do_thing:
	cmp edx, ebp
	setne cl
	lea eax, [ebp-1]
	cmp edx, eax
	setne ch
	and cl, ch
	lea eax, [ebp+1]
	cmp edx, eax
	setne ch
	and cl, ch
	dec cl
	mov eax, edi
	imul eax, 40
	mov [output+eax+edx], cl
	inc edx
	cmp edx, 40
	je @eor
	ret
	@eor:
	xor edx, edx
	inc edi
	cmp edi, 6
	je @ret
	ret
@ret:
	xor eax, eax
	add esp, 4
	jmp @end2

section .bss
	output resb 60*4
%include "day10input.asm"
