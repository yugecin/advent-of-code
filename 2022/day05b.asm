section .text
%define TYPE 0
%include "common.asm"

%define NUMSTACKS 9
aoc:
	push edi
	push esi
	push ebx

	xor eax, eax
	mov edi, stacksize
	mov ecx, NUMSTACKS*2*64/4
	rep stosd

	; put initialstack into stackdata
	mov esi, initialstack+1
@continueparse:
	xor ecx, ecx
@nextstackline:
	mov eax, [esi]
	add esi, 4
	cmp al, "1"
	jz @nextparsephase
	cmp al, " "
	jz @empty
	mov ebx, ecx
	shl ebx, 6
	movzx edx, byte [stacksize+ebx]
	inc byte [stacksize+ebx]
	neg edx
	mov [stackdata+ebx+63+edx], al
@empty:
	inc ecx
	cmp ecx, NUMSTACKS
	jl @nextstackline
	jmp @continueparse
@nextparsephase:
	xor eax, eax
	xor ebx, ebx
@parsemovestuff:
	mov edx, ebx
	shl edx, 6
	movzx esi, byte [stacksize+edx]
	mov ecx, esi
	neg esi
	push esi
	push ecx
	lea esi, [stackdata+edx+64+esi]
	lea edi, [stackdata+edx]
	rep movsb
	pop ecx
	pop esi
	lea edi, [stackdata+edx+64+esi]
	rep stosb
	inc ebx
	cmp ebx, NUMSTACKS
	jl @parsemovestuff

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
	mov byte [edi], 0

	mov eax, msg
	pop ebx
	pop esi
	pop edi
	ret

%include "day05input.txt"
