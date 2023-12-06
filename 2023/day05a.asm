section .text
%define TYPE 64
%define REQUIRE_PRINTF
%include "common.asm"

;%define INPUT testinput
%define INPUT input

%define MAX_MAP_ENTRIES 50
%define NUM_MAPS 7

; the input just barely fits in dwords, thankgod
struc entry
	.src_to: resd 1
	.range: resd 1 ; must be at +4, see [1]
	.src_from: resd 1 ; must be at +8, see [1]
	.dest_from: resd 1 ; must be at +C, see [1]
	.dest_to: resd 1
endstruc

aoc:
	push esi
	push edi
	push ebp
	mov edi, num_map_entries
	xor eax, eax
	mov ecx, NUM_MAPS
	rep stosd
	mov edi, 0ffffffffh

	; skip to first map
	mov esi, INPUT
@find_first_map:
	inc esi
	mov al, [esi]
	cmp al, '-'
	jne @find_first_map
	; gotcha
	add esi, 14 ; skip to start of s-t-s map
	mov edx, 0 ; map idx
	call fill_map
	add esi, 25 ; skip to start of s-t-f map
	inc edx
	call fill_map
	add esi, 26 ; skip to start of f-t-w map
	inc edx
	call fill_map
	add esi, 21 ; skip to start of w-t-l map
	inc edx
	call fill_map
	add esi, 27 ; skip to start of l-t-t map
	inc edx
	call fill_map
	add esi, 30 ; skip to start of t-t-h map
	inc edx
	call fill_map
	add esi, 27 ; skip to start of h-t-l map
	inc edx
	call fill_map

	; go over map entries to fill in unset fields
	mov ebp, maps
	mov ecx, NUM_MAPS
@complete_map:
	push ecx
	mov ecx, MAX_MAP_ENTRIES
@complete_entry:
	mov eax, [ebp+entry.range]
	dec eax ; we need inclusive range :)
	mov ebx, [ebp+entry.src_from]
	add ebx, eax
	mov [ebp+entry.src_to], ebx
	mov ebx, [ebp+entry.dest_from]
	add ebx, eax
	mov [ebp+entry.dest_to], ebx
	add ebp, entry_size
	loop @complete_entry
	pop ecx
	loop @complete_map

	; parse seeds
	mov esi, INPUT+7
@parse_next_seed_number:
	movzx eax, byte [esi]
	sub al, '0'
@parse_seed_number:
	inc esi
	movzx ebx, byte [esi]
	cmp bl, '0'
	jae @still_part_of_seed_number
	; kk we have seed in eax
	inc esi ; put this correct for next seed number
		; find the fucker's location
			%define PRINTF_A "seed"
			%define PRINTF_B "> %lld"
			pushad
			push printf_a
			call [printf]
			add esp, 4
			popad
			jmp @aaaaa
			printeax:
				pushad
				push 0
				push eax
				push printf_b
				call [printf]
				add esp, 12
				popad
			ret
			@aaaaa:
			call printeax
		xor edx, edx ; map idx
		call mapit
			call printeax
		inc edx
		call mapit
			call printeax
		inc edx
		call mapit
			call printeax
		inc edx
		call mapit
			call printeax
		inc edx
		call mapit
			call printeax
		inc edx
		call mapit
			call printeax
		inc edx
		call mapit
			call printeax
		; save location in result if lower than prev
		cmp eax, edi
		cmovb edi, eax
	test byte [esi], 0ffh
	jz @end
	jmp @parse_next_seed_number
@still_part_of_seed_number:
	imul eax, 10
	sub bl, '0'
	add eax, ebx
	jmp @parse_seed_number

@end:
	; returning 64 bit number because we're maybe breaking the signed 32 bit barrier
	xor edx, edx
	mov eax, edi
	pop ebp
	pop edi
	pop esi
	ret

; (edx is map index, eax is target number)
mapit:
	mov ebp, edx
	imul ebp, MAX_MAP_ENTRIES*entry_size
	add ebp, maps
	mov ecx, [num_map_entries+edx*4]
@next_entry:
	cmp eax, [ebp+entry.src_from]
	jb @oob
	cmp eax, [ebp+entry.src_to]
	ja @oob
	; got the entry, calculate location
	sub eax, [ebp+entry.src_from]
	add eax, [ebp+entry.dest_from]
	ret
@oob:
	add ebp, entry_size
	loop @next_entry
	ret ; any source numbers that aren't mapped correspond to the same destination number

; (edx is map index, esi is input location)
fill_map:
	mov ebp, edx
	imul ebp, MAX_MAP_ENTRIES*entry_size
	; parse a line of a map (3 numbers into struc)
@parse_line:
	cmp dword [num_map_entries+edx*4], MAX_MAP_ENTRIES
	jl @ok
	; exceeded max, crash (need to increase MAX_MAP_ENTRIES if we get here)
	int 3
	@ok:
	; parse 3 numbers and put them in the ebp struc
	mov ecx, 3 ; 3 numbers to parse
@parse_next_map_number:
	movzx eax, byte [esi]
	sub al, '0'
@parse_map_number:
	inc esi
	movzx ebx, byte [esi]
	cmp bl, '0'
	jb @end_of_map_number
	imul eax, 10
	sub bl, '0'
	add eax, ebx
	jmp @parse_map_number
@end_of_map_number:
	mov [maps+ebp+ecx*4], eax ; [1]
	inc esi
	loop @parse_next_map_number
	inc dword [num_map_entries+edx*4]
	add ebp, entry_size
	; see if we're at the end of the map
	mov al, [esi]
	test al, al
	jnz @parse_line
	; yes end of map
	ret

section .bss
	num_map_entries resd NUM_MAPS
	maps resb entry_size*MAX_MAP_ENTRIES*NUM_MAPS
section .rodata
	printf_a db PRINTF_A,10,0
	printf_b db PRINTF_B,10,0
%include "day05input.asm"
