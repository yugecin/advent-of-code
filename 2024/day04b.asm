section .text
%define TYPE 32
%include "common.asm"

struc gridwalker
	.cols: resd 1
	.rows: resd 1
	.posx: resd 1
	.posy: resd 1
	.SIZE: resd 0
endstruc

%define INPUT input

aoc:
	push esi
	push edi
	push edx
	push ebp

	mov edi, gw
	mov ecx, gridwalker.SIZE
	xor eax, eax
	rep stosb

	mov esi, INPUT
	.calc_num_cols:
		mov bl, [esi]
		inc esi
		test bl, bl
		jz .calc_num_rows
		inc dword [gw+gridwalker.cols]
		jmp .calc_num_cols
	.calc_num_rows:
		inc dword [gw+gridwalker.rows]
		add esi, [gw+gridwalker.cols]
		inc esi ; skip the row ending 0 entry
		mov bl, [esi]
		test bl, bl
		jnz .calc_num_rows

	inc dword [gw+gridwalker.rows]
	mov dword [gw+gridwalker.posx], -1

	xor ebp, ebp
	lea esi, [INPUT-1]
	.next_cell:
		inc dword [gw+gridwalker.posx]
		inc esi
		mov bl, [esi]
		test bl, bl
		jnz .not_eol
		inc dword [gw+gridwalker.posy]
		mov ebx, [gw+gridwalker.rows]
		cmp ebx, [gw+gridwalker.posy]
		je @end
		mov dword [gw+gridwalker.posx], -1
		jmp .next_cell
	.not_eol:
		cmp bl, 'A'
		jne .next_cell
		xor bx, bx
		push dword [gw+gridwalker.posy]
		push dword [gw+gridwalker.posx]
		add dword [esp+0], -1 ; x
		add dword [esp+4], -1 ; y
		call get_cell
		cmp al, 'M'
		sete ah
		or bl, ah
		cmp al, 'S'
		sete ah
		or bh, ah
		add dword [esp+0], 2 ; x
		add dword [esp+4], 2 ; y
		call get_cell
		cmp al, 'M'
		sete ah
		or bl, ah
		cmp al, 'S'
		sete ah
		or bh, ah
		cmp bx, 0x0101
		jne .skip
		xor bx, bx
		add dword [esp+0], -2 ; x
		call get_cell
		cmp al, 'M'
		sete ah
		or bl, ah
		cmp al, 'S'
		sete ah
		or bh, ah
		add dword [esp+0], 2 ; x
		add dword [esp+4], -2 ; y
		call get_cell
		cmp al, 'M'
		sete ah
		or bl, ah
		cmp al, 'S'
		sete ah
		or bh, ah
		xor eax, eax
		cmp bx, 0x0101
		sete al
		add ebp, eax
		.skip:
		add esp, 8
		jmp .next_cell
@end:
	mov eax, ebp
	pop ebp
	pop edx
	pop edi
	pop esi
	ret

get_cell: ;(x,y)
	mov eax, [esp+8] ; y
	imul eax, dword [gw+gridwalker.cols]
	add eax, [esp+8] ; because rows have an extra 0 entry
	add eax, [esp+4] ; x
	mov al, [INPUT+eax]
	ret

section .data
gw:
	istruc gridwalker
		at gridwalker.cols, dd 0
		at gridwalker.rows, dd 0
		at gridwalker.posx, dd 0
		at gridwalker.posy, dd 0
	iend
section .rodata
%include "day04input.asm"
