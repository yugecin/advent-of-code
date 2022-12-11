section .text
%define TYPE 32
%define REQUIRE_64_OPS
%include "common.asm"

;%define INPUT example
;%define MAX_ITEMS 40
;%define NUM_MONKEHS 4
;%define ROUNDS 20

%define INPUT input
%define MAX_ITEMS 40
%define NUM_MONKEHS 8
%define ROUNDS 20

struc monkeh
	.numitems: resd 1
	.numinspected: resd 1
	.items: resq MAX_ITEMS
	.operation: resd 1
	.oparg: resb 1
	.testnumber: resb 1
	.iftrue: resb 1
	.iffalse: resb 1
endstruc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
aoc:
	push edi
	push esi

	mov edi, monkehs
	mov esi, INPUT
	mov ecx, monkeh_size*NUM_MONKEHS
	rep movsb

	mov esi, ROUNDS
	.nextround:
		call doround
		dec esi
		jnz .nextround

	push ebp
	xor eax, eax
	xor edi, edi
	mov esi, NUM_MONKEHS
	.nextmonkeh:
		lea ebp, [esi-1]
		imul ebp, monkeh_size
		mov ebp, [monkehs+ebp+monkeh.numinspected]
		cmp ebp, eax
		ja .biggest
		cmp ebp, edi
		cmova edi, ebp
		jmp .next
		.biggest:
		xchg eax, edi
		mov eax, ebp
		.next:
		dec esi
		jnz .nextmonkeh
	pop ebp
	mul edi

	pop esi
	pop edi
	ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
doround:
	push esi
	push ebp
	mov ebp, monkehs
	mov esi, NUM_MONKEHS
	.nextmonkeh:
		mov ecx, ebp
		call monkeh__do
		add ebp, monkeh_size
		dec esi
		jnz .nextmonkeh
	pop ebp
	pop esi
	ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
monkeh__do: ; ()
	push ebp
	push esi
	mov ebp, ecx
	xor esi, esi
	.nextitem:
		cmp esi, [ebp+monkeh.numitems]
		je .done
		inc dword [ebp+monkeh.numinspected]
		push esi
		mov ecx, ebp
		call monkeh__inspectitem
		push edx
		push eax
		push edx
		push eax
		mov ecx, ebp
		call monkeh__getthrowtarget
		push eax
		call throwitem
		inc esi
		jmp .nextitem
	.done:
	mov dword [ebp+monkeh.numitems], 0
	pop esi
	pop ebp
	ret 0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
monkeh__inspectitem: ; (index)
	movzx eax, byte [ecx+monkeh.oparg]
	push eax ; oparg
	mov eax, [esp+8]
	push dword [ecx+monkeh.items+eax*8+4] ; value:edx
	push dword [ecx+monkeh.items+eax*8] ; value:eax
	mov eax, [ecx+monkeh.operation]
	call eax
	push 0
	push 3
	push edx
	push eax
	call [div64]
	add esp, 16
	ret 4
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
monkeh__getthrowtarget: ; (value:eax, value:edx)
	mov eax, [esp+4]
	mov edx, [esp+8]
	push ebp
	mov ebp, ecx
	movzx ecx, byte [ebp+monkeh.testnumber]
	push 0
	push ecx
	push edx
	push eax
	call [mod64]
	add esp, 16
	test eax, eax
	setnz al
	and eax, 1
	movzx eax, byte [ebp+monkeh.iftrue+eax]
	pop ebp
	ret 8
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
throwitem: ; (target, value:eax, value:edx)
	push ebp
	mov ebp, [esp+8]
	mov eax, [esp+12]
	mov edx, [esp+16]
	imul ebp, monkeh_size
	add ebp, monkehs
	mov ecx, [ebp+monkeh.numitems]
	; optionally test if the monkeh still has space
	mov [ebp+monkeh.items+ecx*8+4], edx
	mov [ebp+monkeh.items+ecx*8], eax
	inc ecx
	mov [ebp+monkeh.numitems], ecx
	pop ebp
	ret 12
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
monkeh__op_mul: ; (value:eax, value:edx, arg)
	mov eax, [esp+4]
	mov edx, [esp+8]
	push 0
	push dword [esp+16]
	push edx
	push eax
	call [mul64]
	add esp, 16
	ret 12
monkeh__op_square: ; (value:eax, value:edx, arg)
	mov edx, [esp+8]
	mov eax, [esp+4]
	push edx
	push eax
	push edx
	push eax
	call [mul64]
	add esp, 16
	ret 12
monkeh__op_plus: ; (value:eax, value:edx, arg)
	mov eax, [esp+4]
	mov edx, [esp+8]
	add eax, [esp+12]
	adc edx, 0
	ret 12

%include "day11input.asm"
