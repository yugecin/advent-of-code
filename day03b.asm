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

	push 0 ; 0=oxygen generator rating
	; Instead of calling the function, push the "return" address on stack
	; and go into the function code. Disgusting.. ;)
	push @@start

; calc function with one arg
; arg0: 0=oxygen 1=CO2
@@calc:
	mov ecx, 1000 ; num input numbers
	mov esi, input ; input
	mov edi, 100000000000b ; current bit being checked

	; separate the input into two arrays, based on the bit being checked
	; meanwhile, count the bit occurence/incidence
	; then continue doing that but using one of the two arrays as new input
@@split:
	mov dword [num_values], 0
	mov dword [num_values+4], 0
@@splitnext:
	xor eax, eax
	mov ebx, [esi]
	test ebx, edi
	setnz al
	mov edx, dword [num_values+eax*4]
	inc dword [num_values+eax*4] ; inc correct number
	imul eax, 1000*4
	mov dword [values+edx*4+eax], ebx ; store the value
	add esi, 4
	loop @@splitnext

	mov eax, dword [num_values] ; num values with 0 bit
	cmp dword [num_values+4], eax ; num values with 1 bit
	setge al
	xor eax, [esp+4] ; arg0
	and eax, 1
	; prepare next iteration: put num in ecx; values in esi; check if end
	mov ecx, dword [num_values+eax*4] ; num input numbers
	imul eax, 1000
	cmp ecx, 1
	jz @@oneleft
	lea esi, dword [values+eax*4] ; input
	shr edi, 1 ; check next bit
	;jz @@end ; this should never happen
	jmp @@split

@@oneleft:
	mov eax, dword [values+eax*4]
	retn

@@start:
	mov dword [oxygen_gen_rating], eax
	mov dword [esp], 1 ; 1="CO2 scrubber rating"
	call @@calc
	mul dword [oxygen_gen_rating]
	xor edx, edx ; 64bit return value
	add esp, 4 ; pop the arg for calling @@cal

	pop edi
	pop ebx
	pop esi
	ret

section .bss
	oxygen_gen_rating resd 1
	num_values resd 2
	values resd 2000

%include "day03input.asm"
