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

	; zero out slid
	mov ecx, 1998
	mov edi, slid
	xor eax, eax
	rep stosd

	; first calculate the sliding values
	mov esi, input
	lea edx, [slid+8]
@@next_slid:
	mov eax, dword [esi]
	add dword [edx-8], eax
	add dword [edx-4], eax
	add dword [edx], eax
	add edx, 4
	add esi, 4
	cmp esi, end
	jl @@next_slid

	; then use the same solution as day01a.asm
	xor eax, eax
	xor ecx, ecx
	mov ebx, [slid]
	lea edx, [slid+4]
@@next:
	mov esi, [edx]
	cmp esi, ebx
	seta cl
	add eax, ecx
	mov ebx, esi
	add edx, 4
	cmp edx, slid_end
	jl @@next

	xor edx, edx ; 64bit return value
	pop edi
	pop ebx
	pop esi
	ret

section .bss
	; there's 2000 input values, so last 2 values can't create a 3 value window
	slid resd 1998
	slid_end resd 1

%include "day01input.asm"
