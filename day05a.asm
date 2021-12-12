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
	mov ecx, 1000*1000/4 ; /4 because setting dwords
	xor eax, eax
	mov edi, result
	rep stosd

	; draw the "lines" on the board
	; each input is 4 words
	mov esi, input
@@drawnextline:
	; DH holds dx, DL holds dy, CX holds distance
	xor edx, edx
	xor ecx, ecx
	mov ax, word [esi] ; x1
	mov bx, word [esi+4] ; x2
	cmp ax, bx
	jb @@xinc
	jz @@checky
@@xdec:
	mov dh, 0FFh
	mov cx, ax
	sub cx, bx
	jmp @@checky
@@xinc:
	mov dh, 1
	mov cx, bx
	sub cx, ax
@@checky:
	mov ax, word [esi+2] ; y1
	mov bx, word [esi+6] ; y2
	cmp ax, bx
	jb @@yinc
	jz @@draw
@@ydec:
	mov dl, 0FFh
	mov cx, ax
	sub cx, bx
	jmp @@draw
@@yinc:
	mov dl, 1
	mov cx, bx
	sub cx, ax
@@draw:
	; skip diagonal lines
	mov ax, dx
	and ax, 0101h
	cmp ax, 0101h
	je @@skipdraw
	movzx ebx, word [esi] ; (start)x
	movzx edi, word [esi+2] ; (start)y
	inc ecx ; otherwise it doesn't include the end
@@drawloop:
	mov eax, edi
	imul eax, 1000
	inc byte [result+eax+ebx]
	; move x
	movsx eax, dh
	add ebx, eax
	; move y
	movsx eax, dl
	add edi, eax
	loop @@drawloop
@@skipdraw:
	add esi, 8
	cmp esi, @@input_end
	jl @@drawnextline

	; and count
	mov ecx, 1000*1000
	mov esi, result
	xor eax, eax
	xor edx, edx
@@count:
	cmp byte [esi], 2
	setge dl
	add eax, edx
	inc esi
	loop @@count

	pop edi
	pop ebx
	pop esi
	retn

section .bss
	result resb 1000*1000

%include "day05input.asm"
