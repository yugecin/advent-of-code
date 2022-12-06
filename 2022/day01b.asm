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
	push ebp

	xor ecx, ecx
	xor ebx, ebx
	xor edx, edx
	xor ebp, ebp
	xor esi, esi
	xor eax, eax
@add:
	add ecx, esi
	mov esi, [input+eax*4]
@next_elf:
	inc eax
	test esi, esi
	jnz @add
	cmp ecx, ebx
	jl @lower
	mov ebx, ecx
	cmp ebx, edx
	jl @lower
	xchg ebx, edx
	cmp edx, ebp
	jl @lower
	xchg ebp, edx
@lower:
	xor ecx, ecx
	mov esi, [input+eax*4]
	test esi, esi
	jnz @next_elf

end:

	mov eax, ebx
	add eax, edx
	add eax, ebp
	xor edx, edx ; 64bit return value
	pop ebp
	pop ebx
	pop esi
	ret

section .data
%include "day01input.asm"
