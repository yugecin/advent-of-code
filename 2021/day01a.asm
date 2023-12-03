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

	xor eax, eax
	xor ecx, ecx
	mov ebx, [input]
	lea edx, [input+4]
@@next:
	mov esi, [edx]
	cmp esi, ebx
	seta cl
	add eax, ecx
	mov ebx, esi
	add edx, 4
	cmp edx, end
	jl @@next

	xor edx, edx ; 64bit return value
	pop ebx
	pop esi
	ret

%include "day01input.asm"
