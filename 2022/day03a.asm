section .text
%define TYPE 32
%include "common.asm"

aoc:
	push esi
	push edi

	xor eax, eax
	xor edx, edx

	mov esi, input
@nextline:
	push eax
	xor eax, eax
	mov ecx, 60/4 ; need 58 but want to use stosd
	lea edi, [itemcunt+65-2] ; -2 because extra 2 (see ^)
	rep stosd
	pop eax
	call getlinelen
	shr ecx, 1
	push ecx
@next_in_compartment0:
	mov dl, [esi]
	mov byte [itemcunt+edx], 1
	inc esi
	loop @next_in_compartment0
	pop ecx
@next_in_compartment1:
	mov dl, [esi]
	cmp byte [itemcunt+edx], 1
	lea esi, [esi+1]
	loopne @next_in_compartment1
	movzx edx, byte [itemscore+edx]
	add eax, edx
	lea esi, [esi+ecx+1]
	mov dl, [esi]
	test dl, dl
	jnz @nextline

@ret:
	pop edi
	pop esi
	ret

; res in ecx
getlinelen:
	push esi
@nextchar:
	mov dl, [esi]
	test dl, dl
	lea esi, [esi+1]
	jnz @nextchar
	mov ecx, esi
	pop esi
	sub ecx, esi
	dec ecx
	ret

section .bss
	itemcunt resb 123
section .data
	itemscore db 65 dup(0), 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 6 dup(0), 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26
%include "day03input.asm"
