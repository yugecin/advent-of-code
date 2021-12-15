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
	push ebx
	push edi

	; copy input
	mov ecx, (@@input_coords_end-input_coords)/4 ; /4 because copying dwords
	mov esi, input_coords
	mov edi, coords
	rep movsd
	; zero grid
	mov ecx, (@@grid_end-grid)/4
	xor eax, eax
	mov edi, grid
	rep stosd

	; do them folds (only one fold for part1)
	movzx esi, byte [input_folds] ; teh fold direction
	sub esi, "x"
	shl esi, 1
	mov bx, word [input_folds+2] ; teh fold coord
	mov edi, (@@input_coords_end-input_coords)/4
@@fold_next_coord:
	mov dx, word [coords+edi*4+esi-4]
	cmp dx, bx
	jbe @@nofold
	mov ax, dx
	sub ax, bx
	shl ax, 1
	sub dx, ax
	mov word [coords+edi*4+esi-4], dx
@@nofold:
	dec edi
	jnz @@fold_next_coord

	; go thru all coords and count them
	xor eax, eax
	xor edx, edx
	mov ecx, (@@input_coords_end-input_coords)/4
@@count_next_coord:
	movzx edi, word [coords+ecx*4-4] ; x
	movzx esi, word [coords+ecx*4-4+2] ; y
	imul esi, 1500
	mov bl, byte [grid+esi+edi]
	test bl, bl
	jnz @@nz ; jcc seems faster than "or 1" and always writing
	mov byte [grid+esi+edi], 1
	inc eax
@@nz:
	loop @@count_next_coord

	xor edx, edx ; 64bit return value

@@endfold:
	pop edi
	pop ebx
	pop esi
	retn

section .bss
	coords resd 1000 ; my input is 897 long
	grid resb 1500*1500 ; my highest input is 1310, so taking 1500 I guess
@@grid_end:

%include "day13input.asm"
