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

	mov eax, edx
	mov edx, edi

	pop edi
	pop ebx
	pop esi
	retn

; recursive shizzle
; returns number of bits read in eax, result of expression in edi:edx(hi32:lo32)
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
	xor edx, edx ; result of expression (lo32)
	xor edi, edi ; result of expression (hi32)
	push 3+3 ; bit size of this packet
@@read_next_number_part:
	add dword [esp], 5 ; bit size of this packet
	xor ebx, ebx
	mov ch, 1
	call shift_next_ch_bits_into_ebx
	push ebx ; first bit indicating whether this is the last(0) or not(1)
	xor ebx, ebx
	mov ch, 4
	call shift_next_ch_bits_into_ebx
	mov eax, edx
	shr eax, 28
	and eax, 0Fh
	shl edi, 4 ; result of expression (hi32)
	or edi, eax ; result of expression (hi32)
	shl edx, 4 ; result of expression (lo32)
	or dl, bl ; result of expression (lo32)
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
	push edx ; value of the popped packet (lo32)
	push edi ; value of the popped packet (hi32)
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
	push edx ; value of the popped packet (lo32)
	push edi ; value of the popped packet (hi32)
	inc ebx
	push ebx ; number of read subpackets
	add dword [esp+ebx*8+4], eax ; bit size of this packet
	jmp @@op_read_next_subpacket
@@operator_packet_do_operation_and_return:
	; now top of the stack is amount of numbers, and following that are
	; those numbers (first hi32 then lo32), then and the bit size of all
	; this, then the operator
	pop ecx
	mov eax, dword [esp+ecx*8+4] ; the operator
	pop edi ; result (hi32)
	pop edx ; result (lo32)
	dec ecx ; because the first value is already in edx
	jmp dword [opjmptable+eax*4]
@@sum:
	dec ecx
	js @@endop
	pop eax ; (hi32)
	pop ebx ; (lo32)
	add edx, ebx
	adc edi, eax
	jmp @@sum
@@product:
	dec ecx
	js @@endop
	pop eax ; (hi32)
	pop ebx ; (lo32)
	push ecx
	; AAAAAAAAAAAAAAAAAAAAARGH
	test eax, eax
	setz cl
	test ebx, ebx
	setz ch
	cmp cx, 0101h
	je @@product_zero
	test edx, edx
	setz cl
	test edi, edi
	setz ch
	cmp cx, 0101h
	je @@product_zero
	; BBBBBBBBBBBBBBBBBBBBBBBBB
	; mov lowest to eax:ebx for speed
	cmp edi, eax
	jb @@productswap
	ja @@productnoswap
	cmp edx, ebx
	jae @@productnoswap
@@productswap:
	push edi
	push edx
	mov edi, eax
	mov edx, ebx
	pop ebx
	pop eax
@@productnoswap:
	push edx ; (lo32)
	push edi ; (hi32)
	jmp @@product_firstround
@@product_continue:
	add edx, dword [esp+4]
	adc edi, dword [esp]
@@product_firstround:
	sub ebx, 1
	sbb eax, 0
	test eax, eax
	setz cl
	test ebx, ebx
	setz ch
	cmp cx, 0101h
	jne @@product_continue
	add esp, 8 ; because the push above @@product_continue
	pop ecx
	jmp @@product ; next number
@@product_zero:
	pop ecx
	xor edx, edx ; result (lo32)
	xor edi, edi ; result (hi32)
@@product_zero_popnums:
	dec ecx
	js @@endop
	add esp, 8
	jmp @@product_zero_popnums
@@min:
	dec ecx
	js @@endop
	pop eax ; (hi32)
	pop ebx ; (lo32)
	cmp eax, edi ; (hi32)
	ja @@min
	jb @@min_yes
	cmp ebx, edx ; (lo32)
	jae @@min
@@min_yes:
	mov edi, eax ; (hi32)
	mov edx, ebx ; (lo32)
	jmp @@min
@@max:
	dec ecx
	js @@endop
	pop eax ; (hi32)
	pop ebx ; (lo32)
	cmp eax, edi ; (hi32)
	jb @@max
	ja @@max_yes
	cmp ebx, edx ; (lo32)
	jbe @@max
@@max_yes:
	mov edi, eax ; (hi32)
	mov edx, ebx ; (lo32)
	jmp @@max
@@gt:
	pop eax ; (hi32)
	pop ebx ; (lo32)
	cmp eax, edi ; (hi32)
	ja @@gtlt_yes
	jb @@gtlt_no
	cmp ebx, edx ; (lo32)
	ja @@gtlt_yes
@@gtlt_no:
	xor edi, edi ; result (hi32)
	mov edx, 0 ; result (hi32)
	jmp @@endop
@@gtlt_yes:
	xor edi, edi ; result (hi32)
	mov edx, 1 ; result (hi32)
	jmp @@endop
@@lt:
	pop eax ; (hi32)
	pop ebx ; (lo32)
	cmp eax, edi ; (hi32)
	jb @@gtlt_yes
	ja @@gtlt_no
	cmp ebx, edx ; (lo32)
	jb @@gtlt_yes
	jmp @@gtlt_no
@@eq:
	pop eax ; (hi32)
	pop ebx ; (lo32)
	cmp eax, edi ; (hi32)
	sete cl
	cmp ebx, edx ; (lo32)
	sete ch
	and cl, ch
	movzx edx, cl ; (lo32)
	xor edi, edi ; (hi32)
@@endop:
	pop eax ; bit size of this packet
	add esp, 4 ; the operator was here
	ret
@@crash: ; type 4 is a number packet
	int 3
opjmptable:
	dd @@sum, @@product, @@min, @@max, @@crash, @@gt, @@lt, @@eq

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
