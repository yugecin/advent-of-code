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
	push edi
	mov ecx, 13
	mov edi, values
	xor eax, eax
	rep stosd
	xor ebx, ebx
	mov esi, input
@@next:
	mov eax, [esi]
	mov ecx, 12
@@nextbit:
	mov ebx, eax
	and ebx, 1
	add [values+ecx*4], ebx
	shr eax, 1
	dec ecx
	jnz @@nextbit
	add esi, 4
	cmp esi, end
	jl @@next

	xor eax, eax
	mov ecx, 12
	mov esi, values
@@nextbitcombine:
	shl eax, 1
	add esi, 4
	cmp dword [esi], 500 ; 1000 input numbers
	setg bl
	or eax, ebx
	dec ecx
	jnz @@nextbitcombine

	mov esi, eax
	xor eax, 111111111111b
	mul esi
	xor edx, edx ; 64bit return value

	pop edi
	pop ebx
	pop esi
	ret

section .bss
	values resd 13

%include "day03input.asm"
