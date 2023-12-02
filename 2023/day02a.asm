section .text
%define TYPE 32
%include "common.asm"

; assuming max number 99 per cube amount thing

aoc:
	push esi
	push edx
	xor eax, eax
	xor ecx, ecx

	mov esi, input
@doline:
	push esi
	add esi, 6
@findstart:
	mov bl, [esi]
	cmp bl, ':'
	je @startline
	inc esi
	jmp @findstart
@startline:
@nextcube:
	add esi, 2
	mov bx, [esi]
	sub bl, '0'
	cmp bh, ' '
	je @singledigit
	movzx cx, bl
	imul cx, cx, 10
	sub bh, '0'
	add cl, bh
	mov bl, cl
	inc esi
@singledigit:
	add esi, 2
	movzx ecx, byte [esi]
	cmp bl, byte [colorcnt-'a'+ecx]
	ja @impossible
	movzx ecx, byte [colorlen-'a'+ecx]
	add esi, ecx
	mov cl, [esi]
	test cl, cl
	jnz @nextcube
	; parse game id and add
	xor edx, edx
	pop ebx
	push eax
	add ebx, 5
@g:
	mov al, [ebx]
	cmp al, ':'
	jz @ok
	imul dx, dx, 10
	sub al, '0'
	add dl, al
	inc ebx
	jmp @g
@ok:
	pop eax
	add eax, edx
@ateol:
	inc esi
	test byte [esi], 0ffh
	jz @end
	jmp @doline
@impossible:
	add esp, 4
@gotoeol:
	inc esi
	mov cl, [esi]
	test cl, cl
	jnz @gotoeol
	jmp @ateol

@end:
	pop edx
	pop esi
	ret

section .data
section .rodata
	; map of counts per color (r/g/b)
	colorcnt db 0,14,0,0,0,0,13,0,0,0,0,0,0,0,0,0,0,12
	;           a,b ,c,d,e,f,g ,h,i,j,k,l,m,n,o,p,q,r
	; map of how many characters to skip when reading 'r' or 'g' or 'b':
	colorlen db 0,4,0,0,0,0,5,0,0,0,0,0,0,0,0,0,0,3
	;           a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r
%include "day02input.asm"
