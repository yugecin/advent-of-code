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

	; copy input, so we can change it freely
	mov ecx, 25 ; 100 draws / 4 (because copying dwords)
	mov esi, input_draws
	mov edi, draws
	rep movsd
	mov ecx, 25*25 ; 100 boards with 25 numbers / 4 (because copying dwords)
	mov esi, input_boards
	mov edi, boards
	rep movsd
	mov ecx, 25 ; 100 boards / 4 (because moving dwords)
	xor eax, eax
	mov edi, board_already_won
	rep stosd

	mov esi, draws ; draws (duh)

	sub esp, 0Ch
@@nextdraw:
	movzx edi, byte [esi] ; draw
	xor ebx, ebx ; boardidx
@@nextboard:
	; first check if board hasn't already won yet
	mov al, byte [board_already_won+ebx]
	test al, al
	jnz @@boardalreadywon
	mov eax, ebx ; make board ptr
	imul eax, 25
	add eax, boards
	mov dword [esp+4], edi ; draw
	mov dword [esp], eax ; board
	call check_board_for_drawn_number
	mov byte [board_already_won+ebx], al
@@boardalreadywon:
	inc ebx
	cmp ebx, 100 ; we have 100 boards
	jl @@nextboard
	inc esi ; next draw
	cmp esi, boards
	jl @@nextdraw

	add esp, 0Ch ; counter the sub done at the start for args
	mov eax, dword [result]
	pop edi
	pop ebx
	pop esi
	retn

; checks if number is on board, then marks, then decides if it wins, then scores
; arg0: ptr to start of board
; arg4: number drawn
; ret 1 if board wins
check_board_for_drawn_number:
	push esi
	push ebx
	push edi

	mov ebx, [esp+014h] ; number drawn
	mov edi, [esp+010h] ; board

	; loop below counts from 5 to 1 instead of 4 to 0
	; so adjust the offset of the board access (-1-5)
	sub edi, 6
	mov ecx, 5 ; num rows
@@nextrow:
	mov esi, 5 ; col
@@nextcol:
	mov eax, 5
	mul ecx ; row displacement
	add eax, esi ; col displacement
	cmp bl, byte [edi+eax]
	jne @@nomatch
	; cool, match, mark out stuffs
	; put 0x80 in cell to mark it (numbers are 0-99 so that bit can be used)
	mov byte [edi+eax], 080h
	; check for a full row
	mov edx, 5
@@checkwin_nextrow:
	xor eax, eax
	or al, [edi+edx+1] ; (remember the "sub edi, 6" at the start, hence +1)
	or al, [edi+edx+2]
	or al, [edi+edx+3]
	or al, [edi+edx+4]
	or al, [edi+edx+5]
	and al, 07Fh ; because marked cells are 0x80
	jz @@gotawinnerbaby
	add edx, 5
	cmp edx, 25
	jbe @@checkwin_nextrow
	; check for a full col
	mov edx, 5
@@checkwin_nextcol:
	xor eax, eax
	or al, [edi+5+edx] ; (remember the "sub edi, 6" at the start, hence +5)
	or al, [edi+10+edx]
	or al, [edi+15+edx]
	or al, [edi+20+edx]
	or al, [edi+25+edx]
	and al, 07Fh ; because marked cells are 0x80
	jz @@gotawinnerbaby
	dec edx
	jnz @@checkwin_nextcol
@@nomatch:
	dec esi ; col
	jnz @@nextcol
	loop @@nextrow

	xor eax, eax
@@ret:
	pop edi
	pop ebx
	pop esi
	retn

@@gotawinnerbaby:
	; calculate score and store it
	; edi has the board position, but remember the "sub edi, 6"
	add edi, 5 ; still need -1 displacement because next loop is 25-1
	mov ecx, 25 ; numbers in a board
	xor eax, eax
@@addnextnr:
	movzx ebx, byte [edi+ecx]
	and bl, 07Fh ; because marked cells are 0x80
	add eax, ebx
	loop @@addnextnr
	mul dword [esp+014h] ; number drawn
	mov dword [result], eax
	mov eax, 1
	jmp @@ret

section .bss
	result resd 1
	draws resb 100
	boards resb 25*100
	board_already_won resb 100

%include "day04input.asm"
