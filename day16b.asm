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

	xor esi, esi ; next bit idx to read

	call pop_packet

	xor eax, eax
	xchg eax, edx

	pop edi
	pop ebx
	pop esi
	retn

; recursive shizzle
; returns number of bits read in eax, result of expression in edx
pop_packet:
	xor ecx, ecx
	; packet version
	xor ebx, ebx
	mov ch, 3
	call shift_next_ch_bits_into_ebx
	; type
	xor bl, bl
	mov ch, 3
	call shift_next_ch_bits_into_ebx
	cmp bl, 4
	jne @@operator_packet
	; type 4 packet: number
	xor edx, edx ; result of expression
	push 3+3 ; bit size of this packet
@@read_next_number_part:
	add dword [esp], 5 ; bit size of this packet
	xor ebx, ebx
	mov ch, 1
	call shift_next_ch_bits_into_ebx
	push ebx ; first bit indicating whether this is the last(0) or not(1)
	mov ch, 4
	call shift_next_ch_bits_into_ebx
	shl edx, 4 ; result of expression
	or dl, bl ; result of expression
	pop eax ; first bit indicating whether this is the last(0) or not(1)
	test al, al
	jnz @@read_next_number_part
	pop eax ; bit size of this packet
	retn
@@operator_packet:
	; operator packet
	push ebx ; the operator
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
	lea eax, [ebx+15+1+3+3]
	push eax ; total length of this packet
	push 0 ; number of read subpackets
@@length_not_zero:
	push ebx ; total length left
	call pop_packet
	pop ebx ; total length left
	pop ecx ; number of read subpackets
	push edx ; value of the popped packet
	inc ecx
	push ecx ; number of read subpackets
	sub ebx, eax ; sub return value of pop_packet
	jnz @@length_not_zero
	jmp @@operator_packet_do_operation_and_return
@@op_with_num_packets:
	; operator packet read mode = number of subpackets
	xor ebx, ebx
	mov ch, 11
	call shift_next_ch_bits_into_ebx
	push 11+1+3+3 ; bit size of this packet
	mov ecx, ebx ; number of subpackets left
	push 0 ; number of read subpackets
@@op_read_next_subpacket:
	test ecx, ecx
	jz @@operator_packet_do_operation_and_return
	dec ecx
	push ecx ; number of subpackets left
	call pop_packet
	pop ecx ; number of subpackets left
	pop ebx ; number of read subpackets
	push edx ; value of the popped packet
	inc ebx
	push ebx ; number of read subpackets
	add dword [esp+ebx*4+4], eax ; bit size of this packet
	jmp @@op_read_next_subpacket
@@operator_packet_do_operation_and_return:
	; now top of the stack is amount of numbers, and following that are
	; those numbers, then and the bit size of all this, then the operator
	pop ecx
	mov edi, dword [esp+ecx*4+4] ; the operator
	pop edx
	dec ecx ; because the first value is already in edx
	jmp dword [opjmptable+edi*4]
@@sum:
	dec ecx
	js @@endop
	pop ebx
	add edx, ebx
	jmp @@sum
@@product:
	dec ecx
	js @@endop
	pop ebx
	imul edx, ebx
	jmp @@product
@@min:
	dec ecx
	js @@endop
	pop ebx
	cmp ebx, edx
	cmovb edx, ebx
	jmp @@min
@@max:
	dec ecx
	js @@endop
	pop ebx
	cmp ebx, edx
	cmovae edx, ebx
	jmp @@max
@@ge:
	pop ebx
	cmp ebx, edx
	setg dl
	and edx, 1
	jmp @@endop
@@le:
	pop ebx
	cmp ebx, edx
	setl dl
	and edx, 1
	jmp @@endop
@@eq:
	pop ebx
	cmp edx, ebx
	sete dl
	and edx, 1
@@endop:
	pop eax ; bit size of this packet
	add esp, 4 ; the operator was here
	ret
@@crash: ; type 4 is a number packet
	int 3
opjmptable:
	dd @@sum, @@product, @@min, @@max, @@crash, @@ge, @@le, @@eq

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
