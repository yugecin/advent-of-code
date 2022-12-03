section .text
; If not using this name, my link.exe gives an unsuppressible warning that
; "entrypoint is not __stdcall with 12 bytes of args".
global __DllMainCRTStartup@12
__DllMainCRTStartup@12:
	mov eax, 1
	retn 0Ch

global aoc
aoc:
	push esi
	push edi

	xor eax, eax
	xor edx, edx

	mov esi, input
@nextgroup:
	push eax
	xor eax, eax
	mov ecx, 60/4 ; need 58 but want to use stosd
	lea edi, [itemcunt+65-2] ; -2 because extra 2 (see ^)
	rep stosd
	pop eax
	call getlinelen
@cunt_in_first:
	mov dl, [esi]
	mov byte [itemcunt+edx], 1
	inc esi
	loop @cunt_in_first
	inc esi
	call getlinelen
@cunt_in_second:
	mov dl, [esi]
	cmp byte [itemcunt+edx], 1
	jne @abc
	mov byte [itemcunt+edx], 2
@abc:
	inc esi
	loop @cunt_in_second
	inc esi
	call getlinelen
@cunt_in_third:
	mov dl, [esi]
	cmp byte [itemcunt+edx], 2
	je @got
	inc esi
	loop @cunt_in_third
@got:
	movzx edx, byte [itemscore+edx]
	add eax, edx
	lea esi, [esi+ecx+1]
	mov dl, [esi]
	test dl, dl
	jnz @nextgroup

@ret:
	xor edx, edx ; 64bit return value
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
