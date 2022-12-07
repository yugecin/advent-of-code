section .text
%define TYPE 32
%include "common.asm"

aoc:
	push ebp
	push edi
	push esi
	push ebx

	xor eax, eax
	mov ecx, (4+4+256+1+1000*256)/4
	mov edi, current_path_len
	rep stosd
	; add root dir in nodes
	mov byte [nodes+4], 1
	mov byte [nodes+5], 1
	mov byte [nodes+6], 0
	mov byte [nodes+7], "/"
	mov byte [num_nodes], 1

	mov esi, input
@next_input:
	mov eax, [esi]
	test al, al
	jz @all_is_read
	cmp eax, "$ cd"
	jnz @not_a_cd
	add esi, 5
	mov al, [esi]
	cmp al, "."
	jz @go_up_one_level
	cmp al, "/"
	jz @go_to_root
	; cd <dir>
	push esi
	call strlen
	mov ecx, eax
	mov edi, current_path_data
	add edi, [current_path_len]
	add [current_path_len], ecx
	rep movsb
	mov byte [edi], "/"
	inc byte [current_path_len]
	inc byte [current_path_levels]
	lea esi, [esi+1]
	jmp @next_input
@go_up_one_level:
	dec byte [current_path_levels]
	mov eax, [current_path_len]
	lea eax, [current_path_data+eax]
	@findsep:
		lea eax, [eax-1]
		mov cl, [eax-1]
		cmp cl, "/"
		jnz @findsep
	sub eax, current_path_data
	mov [current_path_len], al
	lea esi, [esi+3]
	jmp @next_input
@go_to_root:
	mov byte [current_path_len], 1
	mov byte [current_path_data], "/"
	mov byte [current_path_levels], 1
	lea esi, [esi+2]
	jmp @next_input
@not_a_cd:
	cmp eax, "$ ls"
	jnz @file_list_entry
	lea esi, [esi+5]
	jmp @next_input
@file_list_entry:
	cmp eax, "dir "
	jz @file_list_dir_entry
	; file_list_file_entry
	xor ecx, ecx
	xor eax, eax
	@atoi:
		imul eax, 10
		add eax, ecx
		mov cl, [esi]
		cmp cl, " "
		lea esi, [esi+1]
		lea ecx, [ecx-"0"]
		jnz @atoi
	@add_file_list_entry_has_size_in_eax:
	; get correct node position
	mov ecx, [num_nodes]
	inc dword [num_nodes]
	shl ecx, 8
	lea edi, [nodes+ecx]
	mov edx, edi
	; size
	mov [edi], eax
	; is dir
	test eax, eax
	setz al
	mov [edi+4], al
	; path len
	mov al, [current_path_len]
	mov [edi+5], al
	; path levels
	mov al, [current_path_levels]
	mov [edi+6], al
	; path
	lea edi, [edi+7]
	push esi ; to save while copying current_path but also as arg to call strlen
	mov esi, current_path_data
	mov ecx, [current_path_len]
	rep movsb
	mov esi, [esp] ; restore esi after copying current_path
	call strlen
	mov ecx, eax
	rep movsb
	add byte [edx+5], al ; adjust path len, now that we know the file name len
	mov al, [edx+4]
	test al, al
	jz @not_a_dir
	; dir, need to append "/"
	inc byte [edx+5]
	mov byte [edi], "/"
	@not_a_dir:
	lea esi, [esi+1]
	jmp @next_input
@file_list_dir_entry:
	lea esi, [esi+4]
	xor eax, eax
	jmp @add_file_list_entry_has_size_in_eax

@all_is_read:

	; now we find the entry with the highest path levels
	xor eax, eax
	mov esi, nodes+6
	mov ecx, [num_nodes]
@check_next_node_path_lvl:
	mov dl, [esi]
	lea esi, [esi+256]
	cmp dl, al
	cmovg ax, dx
	loop @check_next_node_path_lvl

	; go down until path level 0, summing shit in the meantime
	movzx ecx, al
@path_level_down:
	mov eax, ecx ; target path level
	lea ebx, [eax-1] ; parent path level
	push ecx
	mov ecx, [num_nodes]
	mov esi, nodes+6
	@find_next_node_with_lvl:
		cmp [esi], al
		jnz @not_now
		; this entry has desired path level,
		; now need to iterate all nodes again and sum this node's size into
		; any node that is one pathlevel down and substring matches
		mov ebp, [esi-6] ; node size
		push eax
		push ecx
		push esi

			mov eax, esi
			movzx edx, byte [esi-1]
			lea edx, [edx+esi-1] ; edx is at end of path-1 (for the case the last char is "/")
			@find_slash:
				cmp byte [edx], "/"
				lea edx, [edx-1]
				jnz @find_slash
			lea edi, [esi-1] ; because edx is one less and we need slash
			sub edx, edi
			; edx = target length strncmp, ebx/bl = target path level

			mov ecx, [num_nodes]
			mov esi, nodes+6
			@find_next_parent:
				cmp [esi], bl
				jnz @no
				; path level ok
				cmp [esi-1], dl
				jnz @no
				; path length ok
				push esi
				push ecx
				mov ecx, edx
				push edi
				lea edi, [esi+1]
				lea esi, [eax+1]
				@next_path_char:
					cmpsb
					jnz @not_parent_path
					loop @next_path_char
					; found parent, fucking finally
					add esp, 08h ; instead of following pops:
					;pop edi ; temp
					;pop ecx ; not needed (see pop below)
					pop esi
					add [esi-6], ebp
					pop esi
					pop ecx
					pop eax
					jmp @not_now ; we done
				@not_parent_path:
				pop edi
				pop ecx
				pop esi
				@no:
				lea esi, [esi+256]
				loop @find_next_parent

		pop esi
		pop ecx
		pop eax
		@not_now:
		lea esi, [esi+256]
		loop @find_next_node_with_lvl
	pop ecx
	loop @path_level_down

	; the thing of part 2
	mov eax, 70000000
	sub eax, [nodes]
	mov ebp, 30000000
	sub ebp, eax
	mov eax, -1
	lea esi, [nodes+4]
	mov ecx, [num_nodes]
@teh_count:
	cmp byte [esi], 1
	jne @nah_not_this_node
	mov edx, [esi-4]
	cmp edx, eax
	ja @nah_not_this_node
	cmp edx, ebp
	jb @nah_not_this_node
	mov eax, edx
	@nah_not_this_node:
	lea esi, [esi+256]
	loop @teh_count

	pop ebx
	pop esi
	pop edi
	pop ebp
	ret

strlen:
	mov eax, [esp+4]
@strlen_next:
	mov cl, [eax]
	test cl, cl
	jz @strlen_ret
	inc eax
	jmp @strlen_next
@strlen_ret:
	sub eax, [esp+4]
	retn 04h

section .bss
	; path length of 250 ought to be enough
	current_path_len resd 1
	current_path_levels resd 1
	current_path_data resb 256
	num_nodes resd 1
	nodes resb 1000*256 ; size(4), is dir(1), path length(1), path levels(1), path(249)

%include "day07input.asm"
