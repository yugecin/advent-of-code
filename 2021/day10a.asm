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

	xor eax, eax
	xor edi, edi ; score
	mov esi, input
@@nextline:
	xor ebx, ebx ; current tokenstack size
@@nextchar:
	mov al, byte [esi]
	cmp al, 0Ah
	jz @@eol
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
@@eol:
	inc esi
	cmp esi, @@input_end
	jb @@nextline

	mov eax, edi
	xor edx, edx ; 64bit return value

	pop edi
	pop ebx
	pop esi
	retn
@@error:
	sub al, 029h ; ")"
	add edi, dword [scores+eax*4]
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
	dd 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,\
	0, 0, 0, 0, 25137, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,\
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 57, 0, 0,\
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,\
	0, 0, 0, 0, 0, 1197

section .bss
	tokenstack resb 200 ; max input line len is about 110 or so

%include "day10input.asm"
