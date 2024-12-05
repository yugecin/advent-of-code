section .text
%define TYPE 32
%include "common.asm"
%define INPUT testinput
%define INPUT input

aoc:
	push esi
	push edi
	push edx
	push ebp
	xor ebp, ebp

	xor eax, eax
	mov edi, numrules
	mov ecx, 25
	rep stosd

	mov esi, INPUT
	xor ebx, ebx
.next_rule:
	mov dx, [esi]
	add esi, 2
	test dx, dx
	jz .first_update_row
	movzx ecx, dl
	mov bl, byte [numrules+ecx]
	inc byte [numrules+ecx]
	imul ecx, 50
	mov [rules+ecx+ebx], dh
	jmp .next_rule

.first_update_row:
	mov bl, [esi]
.next_update_row:
	xor eax, eax
	mov edi, printed
	mov ecx, 25
	rep stosd
	mov edx, 0 ; row len
.next_update_row_entry:
	inc edx
	mov byte [printed+ebx], 1
	movzx edi, byte [numrules+ebx]
	mov eax, ebx
	imul eax, 50
	add eax, rules
.check_next_rule:
	test edi, edi
	jz .all_rules_checked
	mov cl, [eax]
	mov cl, [printed+ecx]
	test cl, cl
	jz .rule_passed
	.go_to_eol:
		inc esi
		mov bl, [esi]
		test bl, bl
		jnz .go_to_eol
		jmp .go_next_update_row_if_present
.rule_passed:
	inc eax
	dec edi
	jmp .check_next_rule
.all_rules_checked:
	inc esi
	mov bl, [esi]
	test bl, bl
	jnz .next_update_row_entry
	;add row middle
		shr edx, 1
		neg edx
		movzx edx, byte [esi+edx-1]
		add ebp, edx
.go_next_update_row_if_present:
	inc esi
	mov bl, [esi]
	test bl, bl
	jnz .next_update_row

.end:
	mov eax, ebp
	pop ebp
	pop edx
	pop edi
	pop esi
	ret

section .data
	printed db 100 dup(0)
	numrules db 100 dup(0)
	rules db 100 dup(50 dup(0))
section .rodata
%include "day05input.asm"
