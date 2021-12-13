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

	; decide min and max first
	; do it without branches except for the loop
	; (because I want to and it's fun)
	xor dl, dl
	xor ebx, ebx
	xor ecx, ecx
	mov bx, word [input] ; min
	mov cx, word [input] ; max
	mov esi, input
@@nextinput:
	mov ax, word [esi]
	; set min
	cmp ax, bx
	setl dl ; dl=0 if new>=current; dl=1 if new<current
	dec dl ; dl=FF if new>=current; dl=0 if new<current
	movsx dx, dl ; dx=dl
	and bx, dx ; bx=bx if new>=current; bx=0 if new<current (bx=current)
	not dx ; dx=~dx
	and ax, dx ; ax=0 if new>=current; ax=ax if new<current (ax=new)
	or bx, ax ; nop if new>=current cuz ax will be 0
	; set max
	mov ax, word [esi]
	cmp ax, cx
	setge dl ; dl=1 if new>=current; dl=0 if new<current
	dec dl ; dl=0 if new>=current; dl=FF if new<current
	movsx dx, dl ; dx=dl
	and cx, dx ; dx=0 if new>=current; dx=dx if new<current (dx=current)
	not dx ; dx=~dx
	and ax, dx ; ax=ax if new>=current; ax=0 if new<current (ax=new)
	or cx, ax ; nop if new<current cuz ax will be 0
	add esi, 2
	cmp esi, @@input_end
	jl @@nextinput
	; cool, bx is now the min value; cx is the max value

	; now calculate fuel needed to go to all horiz positions from min to max
	push 0FFFFFFFFh ; least_fuel
	; ecx is max, let's make that num iters needed to go from min to max
	inc cx
	sub cx, bx
	; ebx is the current target horiz pos
@@next_end_horiz_pos:
	xor edx, edx ; fuel counter for this horiz pos
	mov esi, input
@@addnextfuel:
	xor eax, eax
	movzx edi, word [esi]
	sub edi, ebx ; current-=target
	; do a branchless abs because it's fun
	sets al ; al=1 if current<0; al=0 if current>=0
	sub edi, eax ; reverse two's complement part 1: sub 1 (or not)
	xor al, 1 ; al=0 if current<0; al=1 if current>=0
	dec eax	; eax=FFFFFFFF if current<0; eax=0 if current>=0
	xor edi, eax ; reverse two's complement part 2: xor all bits (or not)
	; abs done
	add edx, edi ; fuel counter for this horiz pos
	add esi, 2
	cmp esi, @@input_end
	jl @@addnextfuel
	; update least_fuel if current is less (current=edx)
	; do this in the same branchless min() algorithm as above
	mov edi, dword [esp] ; least_fuel
	cmp edx, edi
	setb al ; al=0 if new>=current; al=1 if new<current
	dec al ; al=FF if new>=current; al=0 if new<current
	movsx eax, al ; eax=al
	and edi, eax ; edi=edi if new>=current; edi=0 if new<current
	not eax ; eax=~eax
	and edx, eax ; edx=0 if new>=current; edx=edx if new<current (edx=new)
	or edi, edx ; nop if new>=current cuz edx will be 0
	mov dword [esp], edi ; least_fuel
	inc ebx ; next possible target horiz pos
	loop @@next_end_horiz_pos

	pop eax ; least_fuel
	xor edx, edx ; 64bit return value

	pop edi
	pop ebx
	pop esi
	retn

%include "day07input.asm"
