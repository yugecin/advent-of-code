section .text
%define TYPE 32
%include "common.asm"

%if 0
%define INPUT testinput
%define GRIDSIZE 12
%else
%define INPUT input
%define GRIDSIZE 50
%endif

section .data
	; here we keep track of the existing antinode positions
	antinode db GRIDSIZE*GRIDSIZE dup(0)
	numantinodes dd 0
	; list of locations per character. we're assuming that each character has no more than 20 occurences or we're fucked
	characterlocations dw 128 dup(20 dup(0))
	; for the above list of lists, keep track how many elements there are per character
	numcharacterlocations db 128 dup(0)

section .text
;-----------------------------
collect_character_locations:
	push ebx
	push esi
	push edi

	xor eax, eax
	mov edi, antinode
	mov ecx, GRIDSIZE*GRIDSIZE/4
	rep stosd
	mov edi, numcharacterlocations
	mov ecx, 128/4
	rep stosd

	xor ebx, ebx
	mov eax, -1
.next_location:
	inc eax
	cmp eax, GRIDSIZE*GRIDSIZE
	jbe .not_end
	pop edi
	pop esi
	pop ebx
	ret
.not_end:
	mov bl, [INPUT+eax]
	cmp bl, '.'
	je .next_location
	mov esi, eax ; save current pos
	xor edx, edx
	mov ecx, GRIDSIZE
	div ecx
	mov dh, al ; y
	movzx ecx, byte [numcharacterlocations+ebx]
	lea eax, [ebx*4+ebx]
	lea eax, [eax*4]
	lea eax, [eax*2]
	mov [characterlocations+eax+ecx*2], dx
	inc cl
	mov [numcharacterlocations+ebx], cl
	mov eax, esi ; restore current pos
	jmp .next_location

;-----------------------------
add_antinodes_for_pair: ; (a,b)
	push ebx
	mov ebx, [esp+8]
	mov edx, [esp+0Ch]
	mov ax, dx
	sub al, bl
	sub ah, bh

	add dl, al
	add dh, ah
	cmp dl, GRIDSIZE
	jae .skip1
	cmp dh, GRIDSIZE
	jae .skip1
	movzx ecx, dh
	imul ecx, GRIDSIZE
	movzx edx, dl
	add ecx, edx
	mov edx, 1
	xchg [antinode+ecx], dl
	test dl, dl
	setz dl
	add dword [numantinodes], edx
.skip1:
	sub bl, al
	sub bh, ah
	cmp bl, GRIDSIZE
	jae .skip2
	cmp bh, GRIDSIZE
	jae .skip2
	movzx ecx, bh
	imul ecx, GRIDSIZE
	movzx edx, bl
	add ecx, edx
	mov edx, 1
	xchg [antinode+ecx], dl
	test dl, dl
	setz dl
	add dword [numantinodes], edx
.skip2:
	pop ebx
	ret

;-----------------------------
add_antinodes_for_all_character_pairs: ; (character)
	push ebp
	mov ebp, [esp+8]
	mov al, [numcharacterlocations+ebp]
	cmp al, 2
	jae .notempty
	pop ebp
	ret
.notempty:
	push ebx
	push edi
	push esi
	movzx edi, al ; max
	lea esi, [ebp*4+ebp] ; char
	lea esi, [esi*4]
	lea esi, [characterlocations+esi*2]
	mov ebp, -1 ; a
.next_a:
	inc ebp
	cmp ebp, edi
	jae .end
	mov ebx, ebp ; b
.next_b:
	inc ebx
	cmp ebx, edi
	jae .next_a
	push dword [esi+ebp*2]
	push dword [esi+ebx*2]
	call add_antinodes_for_pair
	add esp, 8
	jmp .next_b
.end:
	pop esi
	pop edi
	pop ebx
	pop ebp
	ret

;-----------------------------
aoc:
	mov dword [numantinodes], 0
	call collect_character_locations

	push ebp
	sub esp, 4
	mov ebp, 127
.next_character:
	mov [esp], ebp
	call add_antinodes_for_all_character_pairs
	dec ebp
	cmp ebp, '.'
	jnz .next_character
	add esp, 4
	pop ebp
	mov eax, [numantinodes]
	ret

section .rodata
%include "day08input.asm"
