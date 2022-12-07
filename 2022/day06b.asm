section .text
%define TYPE 32
%include "common.asm"

aoc:
	push edi
	push ebx

	xor eax, eax
	mov ecx, 52/4
	mov edi, stuff
	rep stosd

	xor ebx, ebx
	xor edx, edx
@neeeext:
	mov dl, [input+eax]
	add dl, dl ; word you bitch
	inc ax
	cmp [stuff-194+edx], bx
	jle @nah
	mov bx, [stuff-194+edx]
	mov [stuff-194+edx], ax
	jmp @neeeext
@nah:
	mov cx, ax
	sub cx, bx
	cmp cx, 13
	jg @end
	mov [stuff-194+edx], ax
	jmp @neeeext

@end:
	pop ebx
	pop edi
	ret

%include "day06input.asm"
