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

	; zero out result
	mov ecx, 9
	xor eax, eax
	mov edi, values
	rep stosd

	mov ecx, 300 ; number of initial values
@@copyinput:
	mov al, byte [input+ecx-1] ; -1 because ecx is +1
	inc dword [values+eax*4]
	loop @@copyinput

	; instead of copying values[1] to values[0] etc every iteration,
	; just mark values[1] as being the spot where the value0 resides
	; and so on
	mov ecx, 80 ; number of days
	xor eax, eax ; eax points to idx of values where value0 is
	xor edx, edx
@@nextday:
	; get value0
	mov esi, dword [values+eax*4]
	; mov idx ptr
	inc al
	cmp al, 8
	setg bl
	dec bl ; if al>8 then bl=0; if al<=8 then bl=FF
	and al, bl ; if al>8 then al=0; if al<=8 then al=al
	; spot of previous value0 is now value8, so no change necessary there
	; but still need to add the previous value0 (ESI) to value6
	mov dl, al
	add dl, 6
	cmp dl, 8
	setle bl
	dec bl ; if dl<=8 then bl=0; if dl>8 then bl=FF
	and bl, 9 ; if dl<=8 then bl=0; if dl>8 then bl=9
	sub dl, bl ; dl=dl%9
	add dword [values+edx*4], esi
	loop @@nextday

	mov eax, dword [values]
	add eax, dword [values+4]
	add eax, dword [values+8]
	add eax, dword [values+0Ch]
	add eax, dword [values+010h]
	add eax, dword [values+014h]
	add eax, dword [values+018h]
	add eax, dword [values+01Ch]
	add eax, dword [values+020h]
	xor edx, edx ; 64bit return value

	pop edi
	pop ebx
	pop esi
	retn

section .bss
	values resd 9

%include "day06input.asm"
