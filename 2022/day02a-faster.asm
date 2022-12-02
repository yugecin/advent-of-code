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
	mov esi, input
@next:
	mov edx, [esi]
	test edx, edx
	jz @end
	movzx edx, byte [score+edx]
	add eax, edx
	lea esi, [esi+4]
	jmp @next

@end:
	xor edx, edx ; 64bit return value
	pop esi
	ret

section .data
	score \
		db 0x5841 dup(0)
		db 4, 1, 7
		db 0xFD dup(0)
		db 8, 5, 2
		db 0xFD dup(0)
		db 3, 9, 6
%include "day02input-faster.asm"
