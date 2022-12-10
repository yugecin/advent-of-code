section .text
%define TYPE 32
%include "common.asm"

%define NUMSHITS 20000
aoc:
	push edi
	push esi
	push ebp
	push ebx

	mov dword [numshits], 0
	xor ebp, ebp ; we start on top
	mov esi, input
	xor ebx, ebx ; xy
@nextinput:
	mov ax, [esi]
	test ax, ax
	jz @end
	lea esi, [esi+2]
	movzx ecx, ah
	cmp al, "R"
	jne @nr
	mov edi, 0
	jmp @domove
	@nr:
	cmp al, "L"
	jne @nl
	mov edi, 4
	jmp @domove
	@nl:
	cmp al, "U"
	jne @nu
	mov edi, 8
	jmp @domove
	@nu:
	cmp al, "D"
	jne @nd
	mov edi, 12
	@domove:
		lea eax, [ebp*8]
		mov eax, [movemap1+eax*2+edi]
		mov edx, ebx
		shr edx, 16
		add dx, ax
		shr eax, 16
		add bx, ax
		shl edx, 16
		and ebx, 0FFFFh
		or ebx, edx
		lea eax, [ebp*8]
		mov ebp, [movemap2+eax*2+edi]
		mov edx, [numshits]
		cmp edx, NUMSHITS
		jae @of
		inc dword [numshits]
		mov [shits+edx*4], ebx
		loop @domove
	jmp @nextinput

@end:
	mov eax, 1
	xor esi, esi
	mov ecx, [numshits]
	lea ecx, [ecx-1]
	@next:
		lea esi, [esi+1]
		lea ebx, [shits+esi*4]
		mov edi, ebx
		mov ebx, [ebx]
		mov ebp, ecx
		mov ecx, esi
		@checkuniq:
			lea edi, [edi-4]
			cmp ebx, [edi]
			je @notuniq
			loop @checkuniq
		inc eax
		@notuniq:
		mov ecx, ebp
		loop @next
@exit:
	pop ebx
	pop ebp
	pop esi
	pop edi
	ret
@nd:
	mov eax, -2
	jmp @exit
@of:
	mov eax, -3 ; increase NUMSHITS if this is the result
	jmp @exit

section .bss
	numshits resd 1
	shits resd NUMSHITS
section .rodata
		; R   R   L   L   U   U   D   D
		; head position: 0ontop, 1tl, 2tm, 3tr, 4mr, 5br, 6bm, 7bl, 8ml
	movemap1 dw \
		  0,  0,  0,  0,  0,  0,  0,  0,\
		  0,  0, -1,  1, -1,  1,  0,  0,\
		  0,  0,  0,  0,  0,  1,  0,  0,\
		  1,  1,  0,  0,  1,  1,  0,  0,\
		  1,  0,  0,  0,  0,  0,  0,  0,\
		  1, -1,  0,  0,  0,  0,  1, -1,\
		  0,  0,  0,  0,  0,  0,  0, -1,\
		  0,  0, -1, -1,  0,  0, -1, -1,\
		  0,  0, -1,  0,  0,  0,  0,  0,
		; R  L  U  D
	movemap2 dd \
		  4, 8, 2, 6,\
		  2, 8, 2, 8,\
		  3, 1, 2, 0,\
		  4, 2, 2, 4,\
		  4, 0, 3, 5,\
		  4, 6, 4, 6,\
		  5, 7, 0, 6,\
		  6, 8, 8, 6,\
		  0, 8, 1, 7
%include "day09input.asm"
