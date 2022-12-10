section .text
%define TYPE 32
%include "common.asm"

%define SIZE 99
%define ISIZE (SIZE-2)
aoc:
	push edi
	push esi
	push ebp

	mov eax, SIZE*2+ISIZE*2
	mov esi, 1 ; x pos
	mov edi, 1 ; y pos

	@loop:
		mov ebp, edi
		imul ebp, SIZE
		lea ebp, [input+ebp+esi]
		mov bl, [ebp]

		mov ecx, esi
		@left:
			mov edx, ecx
			neg edx
			cmp [ebp+edx], bl
			jge @blockdleft
			loop @left
		jmp @notblockd
		@blockdleft:
		mov ecx, ISIZE+1
		sub ecx, esi
		@right:
			cmp [ebp+ecx], bl
			jge @blockdright
			loop @right
		jmp @notblockd
		@blockdright:
		mov ecx, edi
		@up:
			mov edx, ecx
			imul edx, SIZE
			neg edx
			cmp [ebp+edx], bl
			jge @blockdup
			loop @up
		jmp @notblockd
		@blockdup:
		mov ecx, ISIZE+1
		sub ecx, edi
		@down:
			mov edx, ecx
			imul edx, SIZE
			cmp [ebp+edx], bl
			jge @blockddown
			loop @down
		@notblockd:
		inc eax

		@blockddown:
		cmp esi, SIZE-2
		jb @not_row_end
		cmp edi, SIZE-2
		je @end
		inc edi
		mov esi, 1
		jmp @loop
		@not_row_end:
		inc esi
		jmp @loop

@end:

	pop ebp
	pop esi
	pop edi
	ret

%include "day08input.asm"
