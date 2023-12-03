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
	mov dword [values+064h*4], 0 ; down
	mov dword [values+075h*4], 0 ; up
	mov dword [values+066h*4], 0 ; forwards
	xor eax, eax
	mov esi, input
@@next:
	mov al, byte [esi]
	test al, al
	jz @@end
	mov cl, byte [esi+1]
	movzx ecx, cl
	add dword [values+eax*4], ecx
	add esi, 2
	jmp @@next

@@end:
	mov eax, dword [values+064h*4] ; down
	mov ecx, dword [values+075h*4] ; up
	sub eax, ecx
	mul dword [values+066h*4] ; forwards
	xor edx, edx ; 64bit return value

	pop ebx
	pop esi
	ret

section .bss
	values resd 128

%include "day02input.asm"
