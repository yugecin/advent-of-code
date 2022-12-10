section .text
%define TYPE 32
%include "common.asm"

%define SIZE 99
%define ISIZE (SIZE-2)
aoc:
	push edi
	push esi
	push ebp

	mov dword [maxscore], 0
	mov esi, 1 ; x pos
	mov edi, 1 ; y pos

	@loop:
		mov ebp, edi
		imul ebp, SIZE
		lea ebp, [input+ebp+esi]
		mov bl, [ebp]

		mov dword [current], 1

		xor eax, eax
		mov ecx, esi
		lea eax, [ecx+1]
		@left:
			mov edx, eax
			sub edx, ecx
			neg edx
			cmp [ebp+edx], bl
			jge @blockdleft
			loop @left
		inc ecx
		@blockdleft:
		sub eax, ecx
		imul eax, [current]
		mov [current], eax
		mov ecx, ISIZE+1
		sub ecx, esi
		lea eax, [ecx+1]
		@right:
			mov edx, eax
			sub edx, ecx
			cmp [ebp+edx], bl
			jge @blockdright
			loop @right
		inc ecx
		@blockdright:
		sub eax, ecx
		imul eax, [current]
		mov [current], eax
		mov ecx, edi
		lea eax, [ecx+1]
		@up:
			mov edx, eax
			sub edx, ecx
			imul edx, SIZE
			neg edx
			cmp [ebp+edx], bl
			jge @blockdup
			loop @up
		inc ecx
		@blockdup:
		sub eax, ecx
		imul eax, [current]
		mov [current], eax
		mov ecx, ISIZE+1
		sub ecx, edi
		lea eax, [ecx+1]
		@down:
			mov edx, eax
			sub edx, ecx
			imul edx, SIZE
			cmp [ebp+edx], bl
			jge @blockddown
			loop @down
		inc ecx
		@blockddown:
		sub eax, ecx
		imul eax, [current]
		cmp eax, [maxscore]
		jle @nah
		mov [maxscore], eax
		@nah:

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
	mov eax, [maxscore]
	pop ebp
	pop esi
	pop edi
	ret

section .bss
	maxscore resd 1
	current resd 1
%include "day08input.asm"
