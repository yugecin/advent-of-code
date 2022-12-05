section .text
%include "dllentry.asm"

%define NUMSTACKS 9
global aoc
aoc:
	push edi
	push esi
	push ebx

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
@domove:
	mov dl, [stacksize+esi]
	dec dl
	mov [stacksize+esi], dl
	mov bl, [stackdata+esi+edx]
	mov dl, [stacksize+edi]
	mov [stackdata+edi+edx], bl
	inc dl
	mov [stacksize+edi], dl
	loop @domove
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

%include "day05input.txt"
