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
	mov ecx, 18
	xor eax, eax
	mov edi, values
	rep stosd

	mov ecx, 300 ; number of initial values
@@copyinput:
	mov al, byte [input+ecx-1] ; -1 because ecx is +1
	inc dword [values+eax*8]
	loop @@copyinput

	; instead of copying values[1] to values[0] etc every iteration,
	; just mark values[1] as being the spot where the value0 resides
	; and so on
	mov ecx, 256 ; number of days
	xor eax, eax ; eax points to idx of values where value0 is
	xor edx, edx
@@nextday:
	; get value0
	mov esi, dword [values+eax*8] ; lo32
	mov edi, dword [values+eax*8+4] ; hi32
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
	add dword [values+edx*8], esi ; lo32
	adc dword [values+edx*8+4], edi ; hi32
	loop @@nextday

	mov eax, dword [values]
	mov edx, dword [values+4]
	add eax, dword [values+8]
	adc edx, dword [values+0Ch]
	add eax, dword [values+010h]
	adc edx, dword [values+014h]
	add eax, dword [values+018h]
	adc edx, dword [values+01Ch]
	add eax, dword [values+020h]
	adc edx, dword [values+024h]
	add eax, dword [values+028h]
	adc edx, dword [values+02Ch]
	add eax, dword [values+030h]
	adc edx, dword [values+034h]
	add eax, dword [values+038h]
	adc edx, dword [values+03Ch]
	add eax, dword [values+040h]
	adc edx, dword [values+044h]
	; result is in edx:eax (hi32:lo32)
	; this should work with the C# aoc2021.exe runner

	pop edi
	pop ebx
	pop esi
	retn

section .bss
	values resd 18

%include "day06input.asm"
