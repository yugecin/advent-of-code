section .text
%define TYPE 32
%include "common.asm"

;%define INPUT testinput
;%define GRID 11
%define INPUT input
%define GRID 141

aoc:
	push ebp
	push esi
	push edx
	push edi
	or ebx, 0ffffffffh
	xor ecx, ecx
	mov dword [result], 0
	mov esi, INPUT-1

@nextchar:
	inc esi
	inc ebx
	mov dl, [esi]
	test dl, dl
	jnz @noteol
	;eol
	or ebx, 0ffffffffh
	inc ecx
	mov dl, [esi+1]
	test dl, dl
	jnz @nextchar
	;eof
	pop edi
	pop edx
	pop esi
	pop ebp
	mov eax, [result]
	ret
@noteol:
	cmp dl, '*'
	jnz @nextchar
	; star
	mov eax, 1 ; result
	mov edx, 0 ; count how many numbers, must be eq 2
	push ebx
	push ecx
	sub ebx, 3
	dec ecx
	push 3
	push ecx
	push ebx
	call check ; -3,-1
	inc ecx
	push 3
	push ecx
	push ebx
	call check ; -3,0
	inc ecx
	push 3
	push ecx
	push ebx
	call check ; -3,1
	inc ebx
	push 2
	push ecx
	push ebx
	call check ; -2,1
	dec ecx
	push 2
	push ecx
	push ebx
	call check ; -2,0
	dec ecx
	push 2
	push ecx
	push ebx
	call check ; -2,-1
	inc ebx
	push 1
	push ecx
	push ebx
	call check ; -1,-1
	inc ecx
	push 1
	push ecx
	push ebx
	call check ; -1,0
	inc ecx
	push 1
	push ecx
	push ebx
	call check ; -1,1
	inc ebx
	push 1
	push ecx
	push ebx
	call check ; 0,1
	sub ecx, 2
	push 1
	push ecx
	push ebx
	call check ; 0,-1
	inc ebx
	push 1
	push ecx
	push ebx
	call check ; 1,-1
	inc ecx
	push 1
	push ecx
	push ebx
	call check ; 1,0
	inc ecx
	push 1
	push ecx
	push ebx
	call check ; 1,1
	pop ecx
	pop ebx
	cmp edx, 2
	jne @nextchar
	add [result], eax
	jmp @nextchar

check:
	mov ebx, [esp+4]
	mov ecx, [esp+8]
	push ebx
	cmp ebx, GRID
	jae @nope
	cmp ecx, GRID
	jae @nope
	mov ebp, ecx
	imul ebp, ebp, GRID
	add ebp, ebx
	test ebx, ebx
	jz @nocheckbefore
	; if not at x=0, check if we're not in the middle of a number
	mov bl, byte [INPUT+ebp-1]
	sub bl, '0'
	cmp bl, 9
	jbe @nope ; we're in the middle of a number, aboooooort
@nocheckbefore:
	xor edi, edi
	mov bl, byte [INPUT+ebp]
	sub bl, '0'
	cmp bl, 9
	ja @nope
		push ecx
		movzx ecx, bl ; result
	@morenumber:
		inc edi
		inc ebp
		movzx ebx, byte [INPUT+ebp]
		sub ebx, '0'
		cmp ebx, 9
		ja @hasnumber
		imul ecx, ecx, 10
		add ecx, ebx
		jmp @morenumber
	@hasnumber:
		cmp edi, [esp+014h]
		jl @lolabort
		imul eax, ecx
		inc edx
	@lolabort:
		pop ecx
@nope:
	pop ebx
	retn 12

section .bss
	result resd 1
section .data
%include "day03input.asm"
