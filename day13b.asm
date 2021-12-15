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

	; do them folds
	mov ecx, input_folds
@@nextfold:
	movzx esi, byte [ecx] ; teh fold direction
	sub esi, "x"
	shl esi, 1
	mov bx, word [ecx+2] ; teh fold coord
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
	add ecx, 4
	cmp ecx, @@input_folds_end
	jl @@nextfold

	; go thru all coords and count them
	xor eax, eax
	xor edx, edx
	mov ecx, (@@input_coords_end-input_coords)/4
@@count_next_coord:
	movzx edi, word [coords+ecx*4-4] ; x
	movzx esi, word [coords+ecx*4-4+2] ; y
	imul esi, 40
	mov bl, byte [grid+esi+edi]
	test bl, bl
	jnz @@nz ; jcc seems faster than "or 1" and always writing
	mov byte [grid+esi+edi], 1
	inc eax
@@nz:
	loop @@count_next_coord

	; see day13b.png for the result by inspecting memory with CheatEngine
	or eax, 0FFFFFFFFh
	or edx, 0FFFFFFFFh ; 64bit return value

@@endfold:
	pop edi
	pop ebx
	pop esi
	retn

section .bss
	coords resd 1000 ; my input is 897 long
	grid resb 30*40 ; thanks to Wieku's img I know a row is 39 chars long
@@grid_end:

%include "day13input.asm"
