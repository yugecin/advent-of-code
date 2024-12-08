section .text
%define TYPE 32
%include "common.asm"

%if 0
%define INPUT testinput
%define GRIDSIZE 10
%else
%define INPUT input
%define GRIDSIZE 130
%endif

aoc:
	push edi
	push esi
	push ebp
	mov edi, walked
	mov ecx, (GRIDSIZE*GRIDSIZE)/4
	xor eax, eax
	rep stosd
	mov dword [numpositions], 0
	mov dword [yup_loop], 0

	; collect startpos first so we don't need to calc that every walk
	xor edx, edx ; x
	mov eax, -1 ; y
	.find_start:
		inc eax
		cmp byte [INPUT+eax], "^"
		jne .find_start
	mov ebp, GRIDSIZE
	div ebp
	mov [startpos], edx
	mov [startpos+4], eax

	; first walk to collect all positions that the guard walks
	push .first_walk_fn_collect_position
	jmp .first_walk
	.first_walk_fn_collect_position:
		mov eax, [esp+4] ; position
		mov cl, 1
		xchg [walked+eax], cl
		test cl, cl
		jnz .nodup
		mov ecx, [numpositions]
		mov [positions+ecx*4], eax
		inc ecx
		mov [numpositions], ecx
		.nodup:
		mov eax, 1
		ret
.first_walk:
	call walk
	add esp, 4

	; now place an obstacle at every position and walk and see if guard goes to the same spot twice with the same direction :^)
	jmp .other_walks
	.check_if_in_loop:
		mov eax, [esp+4] ; position
		mov ecx, [esp+8] ; direction
		lea ecx, [eax*4+ecx]
		mov eax, 1
		xchg [walkedpositions+ecx], al
		add [yup_loop], eax
		xor al, 1
		ret
.other_walks:
	mov ebp, -1
	push .check_if_in_loop ; walk arg
.put_next_obstacle:
	inc ebp
	cmp ebp, [numpositions]
	jae .end
	xor eax, eax
	mov edi, walkedpositions
	mov ecx, GRIDSIZE*GRIDSIZE
	rep stosd
	mov eax, [positions+ebp*4]
	mov byte [INPUT+eax], "#"
	call walk
	mov eax, [positions+ebp*4]
	mov byte [INPUT+eax], "."
	jmp .put_next_obstacle
.end:
	add esp, 4 ; walk arg
	; might have fucked startposition (^) by overwriting it with . when restoring, so fix that:
	imul eax, [startpos+4], GRIDSIZE
	add eax, [startpos]
	mov byte [INPUT+eax], "^"
	mov eax, [yup_loop]
	pop ebp
	pop esi
	pop edi
	ret

;=======================================================
walk: ; (fn(index,direction)=>bool)   fn gets current position as index, direction, returns z if need to quit walking
	push ebx
	mov ebx, [esp+8] ; fn
	push ebp
	push edi
	mov edx, [startpos]
	mov eax, [startpos+4]
	xor edi, edi ; direction
.move:
	xor ecx, ecx
	add dl, [delta+edi*2]
	add al, [delta+edi*2+1]
	cmp dl, GRIDSIZE
	setae cl
	cmp al, GRIDSIZE
	setae ch
	test cx, cx
	jnz .end
	imul ebp, eax, GRIDSIZE
	cmp byte [INPUT+ebp+edx], "#"
	jne .not_obstacle
	sub dl, [delta+edi*2]
	sub al, [delta+edi*2+1]
	inc edi
	and edi, 3
	jmp .move
.not_obstacle:
	push eax ; store
	push edx ; store
	push edi ; direction
	lea eax, [ebp+edx]
	push eax ; position
	call ebx
	mov ecx, eax
	add esp, 8
	pop edx ; restore
	pop eax ; restore
	test ecx, ecx
	jnz .move
.end:
	pop edi
	pop ebp
	pop ebx
	ret

section .rodata
	delta db 0,-1,1,0,0,1,-1,0
section .data
	walked db GRIDSIZE*GRIDSIZE dup(0)
	positions dd GRIDSIZE*GRIDSIZE dup(0)
	numpositions dd 0
	startpos dd 0,0
	walkedpositions dd GRIDSIZE*GRIDSIZE dup(0)
	yup_loop dd 0
%include "day06input.asm"
