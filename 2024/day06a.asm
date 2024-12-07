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
	xor eax, eax
	mov edi, walked
	mov ecx, (GRIDSIZE*GRIDSIZE)/4
	rep stosd
	; edx is x and eax is y because div stores quotient in eax and remainder in edx, which is great because the initial position finding can be done by just incrementing eax and dividing
	xor edx, edx ; x
	mov eax, -1 ; y
	.find_start:
		inc eax
		cmp byte [INPUT+eax], "^"
		jne .find_start
	mov esi, 1 ; uniq positions
	mov byte [walked+eax], 1
	mov ebp, GRIDSIZE
	div ebp
	xor edi, edi ; direction
.move:
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
	mov ecx, 1
	xchg [walked+ebp+edx], cl
	xor cl, 1
	add esi, ecx
	jmp .move
.end:
	mov eax, esi
	pop ebp
	pop esi
	pop edi
	ret

section .data
	walked db GRIDSIZE*GRIDSIZE dup(0)
section .rodata
	delta db 0,-1,1,0,0,1,-1,0
%include "day06input.asm"
