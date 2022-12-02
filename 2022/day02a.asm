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

	xor eax, eax
	xor ecx, ecx

	mov esi, input
@next:
	mov dl, [esi]
	test dl, dl
	jz @end
	sub dl, "A"
	mov cl, [esi+1]
	sub cl, "X"
	movzx edx, byte [score+edx*4+ecx]
	add eax, edx
	lea esi, [esi+2]
	jmp @next

@end:
	xor edx, edx ; 64bit return value
	pop esi
	ret

section .data
	score db \
		4,\
		8,\
		3,\
		0,\
		1,\
		5,\
		9,\
		0,\
		7,\
		2,\
		6,\
		0
%include "day02input.asm"
