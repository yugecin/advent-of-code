section .bss
	monkehs resb monkeh_size*NUM_MONKEHS
section .rodata
example:
	istruc monkeh
		at monkeh.numitems, dd 2
		at monkeh.items, dq 79, 98
		at monkeh.operation, dd op_mul
		at monkeh.oparg, db 19
		at monkeh.testnumber, db 23
		at monkeh.iftrue, db 2
		at monkeh.iffalse, db 3
	iend
	istruc monkeh
		at monkeh.numitems, dd 4
		at monkeh.items, dq 54, 65, 75, 74
		at monkeh.operation, dd op_plus
		at monkeh.oparg, db 6
		at monkeh.testnumber, db 19
		at monkeh.iftrue, db 2
		at monkeh.iffalse, db 0
	iend
	istruc monkeh
		at monkeh.numitems, dd 3
		at monkeh.items, dq 79, 60, 97
		at monkeh.operation, dd op_square
		at monkeh.oparg, db 0
		at monkeh.testnumber, db 13
		at monkeh.iftrue, db 1
		at monkeh.iffalse, db 3
	iend
	istruc monkeh
		at monkeh.numitems, dd 1
		at monkeh.items, dq 74
		at monkeh.operation, dd op_plus
		at monkeh.oparg, db 3
		at monkeh.testnumber, db 17
		at monkeh.iftrue, db 0
		at monkeh.iffalse, db 1
	iend
input:
	istruc monkeh
		at monkeh.numitems, dd 2
		at monkeh.items, dq 71, 86
		at monkeh.operation, dd op_mul
		at monkeh.oparg, db 13
		at monkeh.testnumber, db 19
		at monkeh.iftrue, db 6
		at monkeh.iffalse, db 7
	iend
	istruc monkeh
		at monkeh.numitems, dd 6
		at monkeh.items, dq 66, 50, 90, 53, 88, 85
		at monkeh.operation, dd op_plus
		at monkeh.oparg, db 3
		at monkeh.testnumber, db 2
		at monkeh.iftrue, db 5
		at monkeh.iffalse, db 4
	iend
	istruc monkeh
		at monkeh.numitems, dd 7
		at monkeh.items, dq 97, 54, 89, 62, 84, 80, 63
		at monkeh.operation, dd op_plus
		at monkeh.oparg, db 6
		at monkeh.testnumber, db 13
		at monkeh.iftrue, db 4
		at monkeh.iffalse, db 1
	iend
	istruc monkeh
		at monkeh.numitems, dd 4
		at monkeh.items, dq 82, 97, 56, 92
		at monkeh.operation, dd op_plus
		at monkeh.oparg, db 2
		at monkeh.testnumber, db 5
		at monkeh.iftrue, db 6
		at monkeh.iffalse, db 0
	iend
	istruc monkeh
		at monkeh.numitems, dd 5
		at monkeh.items, dq 50, 99, 67, 61, 86
		at monkeh.operation, dd op_square
		at monkeh.oparg, db 0
		at monkeh.testnumber, db 7
		at monkeh.iftrue, db 5
		at monkeh.iffalse, db 3
	iend
	istruc monkeh
		at monkeh.numitems, dd 8
		at monkeh.items, dq 61, 66, 72, 55, 64, 53, 72, 63
		at monkeh.operation, dd op_plus
		at monkeh.oparg, db 4
		at monkeh.testnumber, db 11
		at monkeh.iftrue, db 3
		at monkeh.iffalse, db 0
	iend
	istruc monkeh
		at monkeh.numitems, dd 3
		at monkeh.items, dq 59, 79, 63
		at monkeh.operation, dd op_mul
		at monkeh.oparg, db 7
		at monkeh.testnumber, db 17
		at monkeh.iftrue, db 2
		at monkeh.iffalse, db 7
	iend
	istruc monkeh
		at monkeh.numitems, dd 1
		at monkeh.items, dq 55
		at monkeh.operation, dd op_plus
		at monkeh.oparg, db 7
		at monkeh.testnumber, db 3
		at monkeh.iftrue, db 2
		at monkeh.iffalse, db 1
	iend
