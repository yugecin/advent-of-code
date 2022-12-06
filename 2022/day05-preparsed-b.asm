section .text
%include "dllentry.asm"

%define NUMSTACKS 9
global aoc
aoc:
	push edi
	push esi
	push ebx

	mov edi, stacksize
	mov esi, _stacksize
	mov ecx, 9*2*64/4
	rep movsd

	mov eax, rules
	xor edx, edx
@nextrule:
	mov ecx, [eax]
	test ecx, ecx
	jz @makemsg
	add eax, 4
	movzx esi, ch
	dec esi
	shl esi, 6
	mov edi, ecx
	shr edi, 16
	dec edi
	shl edi, 6
	and ecx, 0FFh
	mov dl, [stacksize+esi]
	mov ebx, esi
	sub dl, cl
	add esi, edx
	mov [stacksize+ebx], dl
	mov dl, [stacksize+edi]
	mov ebx, edi
	add edi, edx
	add dl, cl
	mov [stacksize+ebx], dl
	add esi, stackdata
	add edi, stackdata
	rep movsb
	jmp @nextrule

@makemsg:
	mov ecx, NUMSTACKS
	mov edx, stacksize
	mov edi, msg
	xor eax, eax
@addnext:
	mov al, [edx]
	sub al, 1
	jc @emptystack
	mov al, [stackdata-stacksize+edx+eax]
	mov [edi], al
	inc edi
@emptystack:
	add edx, 64
	loop @addnext

	mov eax, 0FFFFFFFFh
	mov edx, 0FFFFFFFFh
	pop ebx
	pop esi
	pop edi
	ret

%include "day05-preparsed-input.txt"
