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

	mov byte [numpoints], 0

	xor eax, eax
	mov esi, input
@@nextline:
	xor ebx, ebx ; current tokenstack size
@@nextchar:
	mov al, byte [esi]
	cmp al, 0Ah
	jz @@docomplete
	movzx edx, al
	sub dl, 028h ; "("
	mov cl, 029h ; ")"
	jmp dword [jmptable+edx*4]
@@brace:
	add cl, 07Dh-05Dh
@@bracket:
	add cl, 05Dh-03Eh
@@angled:
	add cl, 03Eh-029h
@@paren:
	mov byte [tokenstack+ebx], cl
	inc ebx
	inc esi
	jmp @@nextchar
@@close:
	dec ebx
	js @@error
	cmp al, byte [tokenstack+ebx]
	jne @@error
	inc esi
	jmp @@nextchar
@@docomplete:
	push esi
	xor eax, eax ; score (lo32)
	xor esi, esi ; score (hi32)
	test ebx, ebx
	jz @@eol
@@continuecomplete:
	movzx edx, byte [tokenstack+ebx-1] ; -1 because ebx is +1
	; eax*=5
	push edx ; i'm tired mkay
	push ebx
	mov edx, eax
	mov ebx, esi
	add eax, edx
	adc esi, ebx
	add eax, edx
	adc esi, ebx
	add eax, edx
	adc esi, ebx
	add eax, edx
	adc esi, ebx
	pop ebx
	pop edx
	sub edx, 029h ; ")"
	movzx edx, byte [scores+edx]
	add eax, edx
	adc esi, 0
	dec ebx
	jnz @@continuecomplete
	movzx ecx, byte [numpoints]
	mov dword [points+ecx*8], eax ; store points (lo32)
	mov dword [points+ecx*8+4], esi ; store points (hi32)
	inc cl
	mov byte [numpoints], cl
	pop esi
@@eol:
	inc esi
	cmp esi, @@input_end
	jb @@nextline

	; sort the points...
	movzx edx, byte [numpoints]
@@nextsortthing:
	movzx ecx, byte [numpoints]
	mov ebx, 0FFFFFFFFh ; min (hi32)
	mov esi, 0FFFFFFFFh ; min (lo32) (and edi is idx)
@@find_min:
	mov eax, dword [points+ecx*8-8+4] ; (hi32)
	cmp eax, ebx
	ja @@notless
	jb @@less
	mov eax, dword [points+ecx*8-8] ; (lo32)
	cmp eax, esi
	jnb @@notless
@@less:
	mov esi, dword [points+ecx*8-8] ; (lo32)
	mov ebx, dword [points+ecx*8-8+4] ; (hi32)
	lea edi, [ecx-1]
@@notless:
	loop @@find_min
	mov eax, dword [points+edi*8] ; (lo32)
	mov ecx, dword [points+edi*8+4] ; (hi32)
	mov dword [points+edi*8], 0FFFFFFFFh ; (lo32)
	mov dword [points+edi*8+4], 0FFFFFFFFh ; (hi32)
	dec edx
	mov [sortedpoints+edx*8], eax ; (lo32)
	mov [sortedpoints+edx*8+4], ecx ; (hi32)
	jnz @@nextsortthing

	; and return the middle one
	movzx ebx, byte [numpoints]
	shr ebx, 1
	mov eax, dword [sortedpoints+ebx*8] ; (lo32)
	mov edx, dword [sortedpoints+ebx*8+4] ; (hi32)

	pop edi
	pop ebx
	pop esi
	retn
@@error:
@@findeol:
	inc esi
	cmp byte [esi], 0Ah
	jne @@findeol
	jmp @@eol
u:
	int 3 ; crash baby
jmptable:
	dd @@paren, @@close, u, u, u, u, u, u, u, u, u, u, u, u, u, u, u, u,\
	u, u, @@angled, u, @@close, u, u, u, u, u, u, u, u, u, u, u, u, u, u,\
	u, u, u, u, u, u, u, u, u, u, u, u, u, u, @@bracket, u, @@close, u, u,\
	u, u, u, u, u, u, u, u, u, u, u, u, u, u, u, u, u, u, u, u, u, u, u, u,\
	u, u, u, @@brace, u, @@close
scores:
	db 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,\
	0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,\
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0,\
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,\
	0, 0, 0, 0, 0, 3

section .bss
	tokenstack resb 200 ; max input line len is about 110 or so
	sortedpoints resq 110
	points resq 110 ; 103 input lines
	numpoints resb 1

%include "day10input.asm"
