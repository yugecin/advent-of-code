section .text
%define TYPE 32
%include "common.asm"

%define GRID 142 ; extra before and after so we can read -1 and +1

aoc:
	push esi
	push edi
	push edx
	push ebp
	mov dword [result], 0
	xor eax, eax
	mov ecx, (postgrid-grid)/4
	mov edi, grid
	rep stosd

	mov esi, input-1
	mov ebx, -1 ; x
	xor ecx, ecx ; y
@preparse_next:
	inc esi
	inc ebx
	mov dl, [esi]
	test dl, dl
	jnz @preparse_noteol
	; eol
	test ebx, ebx ; eol at x=0 means end of input
	jz @donepreparse
	mov ebx, -1
	inc ecx
	jmp @preparse_next
@preparse_noteol:
	cmp dl, '.'
	jz @preparse_next
	sub dl, '0'
	cmp dl, 9
	jbe @preparse_next
	mov edx, ecx
	imul edx, edx, GRID
	mov byte [grid+edx+ebx], 1
	jmp @preparse_next

@donepreparse:
	mov esi, input-1
	mov eax, -1 ; x
	xor ebx, ebx ; y
@next:
	inc esi
	inc eax
	movzx edx, byte [esi]
	test edx, edx
	jnz @noteol
	;eol
	test eax, eax ; eol at x=0 means end of input
	jz @end
	mov eax, -1
	inc ebx
	jmp @next
@noteol:
	sub edx, '0'
	cmp edx, 9
	ja @next
	mov edi, edx
	xor ecx, ecx
@parseint:
	inc esi
	inc ecx
	movzx edx, byte [esi]
	sub edx, '0'
	cmp edx, 9
	ja @doneparseint
	imul edi, edi, 10
	add edi, edx
	jmp @parseint
@doneparseint:
	dec esi
	pushad
	push ecx
	push ebx
	push eax
	call check
	popad
	lea eax, [eax+ecx-1]
	jmp @next

@end:
	pop ebp
	pop edx
	pop edi
	pop esi
	mov eax, [result]
	ret

check: ; stdcall (x,y,number_str_len)
	pop ebp
	pop eax
	dec eax
	pop ebx
	dec ebx
	pop ecx
	add ecx, 2
	push ecx
	call uhu
	mov ecx, [esp]
	inc ebx
	call uhu
	mov ecx, [esp]
	inc ebx
	call uhu
	mov [esp], ebp
	ret

uhu:
	mov edx, ebx
	imul edx, edx, GRID
	add edx, eax
	test byte [grid+edx+ecx-1], 1
	jnz @gotcha
	loop uhu
	ret
@gotcha:
	add [result], edi
	add esp, 8
	jmp ebp

section .bss
	pregrid resb GRID
	grid resb GRID*GRID
	postgrid resb GRID
	result resd 0
section .data
%include "day03input.asm"
