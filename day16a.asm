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

	xor edi, edi ; sum of version numbers
	xor esi, esi ; next bit idx to read

	call pop_packet

	mov eax, edi
	xor edx, edx ; 64bit return value

	pop edi
	pop ebx
	pop esi
	retn

; recursive shizzle
; returns number of bits read
pop_packet:
	xor ecx, ecx
	; packet version
	xor ebx, ebx
	mov ch, 3
	call shift_next_ch_bits_into_ebx
	add edi, ebx
	; type
	xor bl, bl
	mov ch, 3
	call shift_next_ch_bits_into_ebx
	cmp bl, 4
	jne @@operator_packet
	; type 4 packet: number
	xor ebx, ebx
	push 0 ; number of bits that makes the number
@@read_next_number_part:
	add dword [esp], 5 ; number of bits that makes the number
	xor ebx, ebx
	mov ch, 1
	call shift_next_ch_bits_into_ebx
	push ebx ; first bit indicating whether this is the last(0) or not(1)
	mov ch, 4
	call shift_next_ch_bits_into_ebx
	pop eax ; first bit indicating whether this is the last(0) or not(1)
	test al, al
	jnz @@read_next_number_part
	pop eax ; number of bits that makes the number
	add eax, 3+3
	retn
@@operator_packet:
	; operator packet
	; read mode
	xor ebx, ebx
	mov ch, 1
	call shift_next_ch_bits_into_ebx
	test bl, bl
	jnz @@op_with_num_packets
	; operator packet read mode = total length of subpackets
	xor ebx, ebx
	mov ch, 15
	call shift_next_ch_bits_into_ebx
	push ebx ; total length that will be read
@@length_not_zero:
	push ebx ; total length left
	call pop_packet
	pop ebx ; total length left
	sub ebx, eax ; sub return value of pop_packet
	jnz @@length_not_zero
	pop eax ; total length that will be read
	add eax, 15+1+3+3
	retn
@@op_with_num_packets:
	; operator packet read mode = number of subpackets
	xor ebx, ebx
	mov ch, 11
	call shift_next_ch_bits_into_ebx
	push 0 ; total length of subpackets read
	push ebx ; number of subpackets left
@@op_read_next_subpacket:
	pop ecx ; number of subpackets left
	test ecx, ecx
	jz @@no_subpackets_left
	dec ecx
	push ecx ; number of subpackets left
	call pop_packet
	add dword [esp+4], eax ; total length
	jmp @@op_read_next_subpacket
@@no_subpackets_left:
	pop eax ; total length of subpackets read
	add eax, 11+1+3+3
	retn

shift_next_ch_bits_into_ebx:
	push edx
	push edi
@@next:
	mov edi, esi
	shr edi, 2
	mov al, byte [input+edi]
	sub al, "0"
	cmp al, 10
	jb @@notatof
	sub al, "A"-"9"-1
@@notatof:
	mov edx, esi
	shl edi, 2
	sub edx, edi
	mov cl, 3
	sub cl, dl
	shr al, cl
	and al, 1
	inc esi
	shl ebx, 1
	or bl, al
	dec ch
	jnz @@next
	pop edi
	pop edx
	retn

%include "day16input.asm"
