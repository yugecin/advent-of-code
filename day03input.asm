section .rodata
	; there are 1000 input numbers
	input dd \
		111011001010b, 010011101110b, 110001001010b, 001101011101b, 110100000011b,\
		010110110010b, 101000110110b, 010100000011b, 111001101111b, 111001100011b,\
		000110000100b, 111011110100b, 010001100000b, 100011000010b, 001001111010b,\
		101001010010b, 110000111010b, 011100110101b, 010111101111b, 100011001001b,\
		011110100001b, 011101110110b, 001011111001b, 001110010100b, 100001001000b,\
		000100110111b, 011111110010b, 010101110011b, 001101011100b, 100001110101b,\
		111000100000b, 010111001010b, 110000001010b, 101011110100b, 101010011111b,\
		011001001000b, 010010100100b, 001100111110b, 011111100101b, 011010011001b,\
		000010010100b, 010001110111b, 000101011001b, 001110101100b, 100011100101b,\
		110001011100b, 100101011110b, 111000001010b, 000010111010b, 001001000010b,\
		011011001100b, 000111110000b, 110110110010b, 001011111100b, 110111110101b,\
		001000101010b, 101010011001b, 111110011001b, 001000111110b, 110110010010b,\
		010011001000b, 110100100010b, 111000100011b, 110111000001b, 110110010001b,\
		001100011011b, 111100010111b, 110110101001b, 100010000101b, 001001101000b,\
		010000110101b, 111010001100b, 110000001110b, 100111110010b, 110101110011b,\
		011100111010b, 100000010001b, 101000111101b, 001010001100b, 110100000000b,\
		011001110100b, 011010101111b, 001011011000b, 111100101000b, 101001110100b,\
		001111100001b, 110111110111b, 101100010000b, 110000010101b, 110111010101b,\
		101110100100b, 011010001001b, 011101110111b, 101011110111b, 011001101111b,\
		101101001011b, 010000100011b, 111011111100b, 110101000100b, 011111101011b,\
		101000001110b, 000111001010b, 011100010010b, 010011011111b, 100000001101b,\
		000110001011b, 101100110101b, 001001010000b, 001111101100b, 110100010011b,\
		100011111001b, 110000101100b, 101111101101b, 010011100110b, 011000011101b,\
		111110001111b, 000100111011b, 000001001100b, 111110000010b, 001001110111b,\
		100000110010b, 011000111000b, 100010100110b, 111110100010b, 000001010110b,\
		011010001101b, 001100001010b, 100111001001b, 001010110101b, 100111000101b,\
		110011001110b, 011100000110b, 101111111110b, 001110100010b, 110101011010b,\
		000011111001b, 101011110110b, 000111000110b, 110010001100b, 001001010101b,\
		011111001011b, 100010101101b, 001000010000b, 110111110001b, 001111110011b,\
		110111101101b, 010011010001b, 100110101000b, 001011100100b, 001010111011b,\
		101000010001b, 000101001011b, 011010010011b, 011011000001b, 111111010101b,\
		010000011001b, 101100111101b, 001001110010b, 000010001011b, 111000001001b,\
		010001001100b, 110110011011b, 111011100100b, 001000001010b, 101110010110b,\
		010010000100b, 100000011011b, 010000110011b, 111111101101b, 101010001011b,\
		001011110100b, 000111100011b, 110011100111b, 000011100000b, 100101001110b,\
		110100000010b, 110101110101b, 100001010101b, 010100000110b, 011010110110b,\
		001011000101b, 010010100001b, 001001100110b, 111011110111b, 100110011111b,\
		100111010000b, 010010111010b, 001000101100b, 000101101110b, 011001010111b,\
		010001000110b, 001110111000b, 010001001010b, 111000011000b, 000011110000b,\
		111100011110b, 101110111001b, 001101001000b, 111010110110b, 001110101010b,\
		100001111011b, 110010010110b, 101001101011b, 001100111011b, 111001010100b,\
		101111011011b, 010010000010b, 101101101111b, 101000101000b, 001100100010b,\
		111001100101b, 110110001011b, 000110011001b, 110010110000b, 000111101111b,\
		010010001101b, 110110111101b, 010100100100b, 001111010110b, 001101000011b,\
		011110010011b, 101111101010b, 111001000110b, 000110001001b, 100100001000b,\
		010100110010b, 001011001011b, 100010110100b, 001110101111b, 001001101011b,\
		000111100100b, 000001111011b, 100111111101b, 111011100110b, 000100101101b,\
		100110110000b, 010001000000b, 111111111111b, 011010001110b, 001100000100b,\
		000010010000b, 000100100000b, 010100010101b, 100100111110b, 001100111100b,\
		000001010010b, 011010000001b, 000000111010b, 110011110111b, 110011100110b,\
		000011011011b, 001001001001b, 100111100111b, 110000101110b, 101100101111b,\
		110001110110b, 111011111001b, 101000110001b, 010000011110b, 001011110101b,\
		001100011010b, 111001110001b, 001110110001b, 101011010100b, 110110100111b,\
		101011001100b, 110010111100b, 011111001111b, 110001101011b, 011100111100b,\
		111101110010b, 001111000001b, 100101110101b, 110001101000b, 110001100110b,\
		000011110110b, 001111111111b, 110101001111b, 101000111001b, 101100111001b,\
		110011011011b, 011100100111b, 111000001100b, 110010001001b, 000101001000b,\
		010101101100b, 110010000100b, 011000010101b, 010001101111b, 011000000100b,\
		111111100101b, 000011101011b, 011001111010b, 011010000101b, 000001001011b,\
		001111001010b, 001011011010b, 010011111010b, 101001110001b, 101001000000b,\
		100101100101b, 111100000010b, 110000000100b, 010110000101b, 011011011101b,\
		010110101001b, 010011000111b, 110000010001b, 000101100001b, 111000000100b,\
		000011001101b, 101101110011b, 110101011101b, 001111000010b, 101110011100b,\
		000100001010b, 111101110001b, 110110111111b, 001011101011b, 100001010100b,\
		011001110010b, 010001111000b, 001101101011b, 011011101001b, 010111101010b,\
		011110000000b, 111111000010b, 100010110111b, 111010111111b, 100110001001b,\
		011111000000b, 000111000010b, 111001111100b, 111010100111b, 001010110010b,\
		100011110001b, 011100000100b, 011110010110b, 101001000011b, 100011111101b,\
		001100100111b, 000110100100b, 001001000111b, 101000000000b, 011100010101b,\
		101110010111b, 000110010001b, 010101001111b, 010010000111b, 001010001111b,\
		000111000101b, 111101111010b, 010010111111b, 101111101110b, 101100101000b,\
		101101010101b, 000011111011b, 011111000101b, 011111111001b, 101000100111b,\
		010101110111b, 000111101100b, 011010011010b, 110001000010b, 100110111100b,\
		011110011011b, 001101011010b, 010001011001b, 100110100001b, 001010111001b,\
		011100011011b, 110001111101b, 100111100100b, 101111111101b, 111000011001b,\
		000000101110b, 101111011100b, 010100111111b, 010001010100b, 011001111100b,\
		110100010001b, 110001111110b, 111001110000b, 001110010111b, 001100101101b,\
		111001100001b, 000100011101b, 011101011010b, 010110010000b, 100000111100b,\
		100100100110b, 110111111000b, 001111000111b, 111111110010b, 111010111011b,\
		001000111000b, 101010110101b, 011001110110b, 001100110001b, 000111101001b,\
		010011000001b, 001101011001b, 111001111010b, 000110011011b, 000101000100b,\
		110000011011b, 010011011000b, 011100111111b, 010101101101b, 101100110100b,\
		001011010101b, 010001000011b, 001000000111b, 111111011011b, 110000000011b,\
		100101010110b, 001001001101b, 000101010100b, 111101101100b, 000111110101b,\
		100101010010b, 101110001110b, 101011111110b, 011011000011b, 000111010101b,\
		011010001000b, 001010110000b, 011110000110b, 001111100110b, 111001111110b,\
		000101101111b, 110111100100b, 100011101001b, 111000100101b, 100100111101b,\
		110001000011b, 110000101111b, 110001111100b, 000101000111b, 001011110000b,\
		010000001100b, 101101110001b, 000110100111b, 011101000001b, 001111101101b,\
		100000000100b, 010010000000b, 001111101000b, 001010111010b, 101010011010b,\
		111010100011b, 101111110010b, 001011110110b, 100010010001b, 010110010110b,\
		110111111010b, 000111001011b, 000001111100b, 100101101111b, 010100011101b,\
		000010011110b, 011100100000b, 011101100000b, 110000100111b, 110111100000b,\
		100001110100b, 011111011011b, 101110110001b, 010000011000b, 010011010101b,\
		001101100101b, 110110100101b, 101000011110b, 101011000011b, 000010010101b,\
		101001110000b, 110001011111b, 001101101101b, 000001111111b, 110010111001b,\
		111001010101b, 000010101100b, 111011100101b, 011111001110b, 011000011010b,\
		111111110110b, 111010110111b, 011010010110b, 110011001011b, 000010101000b,\
		011101011100b, 111010110000b, 010011110010b, 011110010001b, 101111111001b,\
		010010110101b, 101010101001b, 001101110001b, 011111110110b, 011110110001b,\
		001111001100b, 110000011001b, 111001000101b, 111110101001b, 010011010100b,\
		110011000010b, 110000100100b, 101000101001b, 010101011010b, 011001100011b,\
		101110101101b, 100100001011b, 111010010001b, 111010001110b, 100110101100b,\
		111010010111b, 101111001010b, 111101111111b, 101111000110b, 101111101111b,\
		011001001101b, 100110000111b, 101101010100b, 110100011010b, 010111010001b,\
		110011101011b, 101001001100b, 100111010111b, 000011111110b, 011110000101b,\
		001011110111b, 100000110110b, 011110100111b, 011100011111b, 010100111101b,\
		100100010011b, 001000101001b, 010111010110b, 100000011100b, 000000111111b,\
		111101111001b, 011011100100b, 101011010110b, 111010001111b, 111101111101b,\
		110100110010b, 010001001110b, 011001110011b, 110100110101b, 110010100010b,\
		111111111101b, 000110011100b, 011010100110b, 000000010011b, 100100010110b,\
		110110010111b, 101011101001b, 110000000010b, 001110011001b, 111111011110b,\
		000111000001b, 110010101011b, 111111111001b, 010001010010b, 001111010100b,\
		011011110101b, 110000000111b, 100011010010b, 000010110111b, 111100111111b,\
		111111101010b, 011000100011b, 011111000100b, 011100001001b, 110001011011b,\
		011011010111b, 100000101111b, 101001100100b, 110000110101b, 000001110111b,\
		110101001000b, 000001100000b, 010001111110b, 011110011101b, 011011100111b,\
		110000011010b, 111010100110b, 001101110010b, 111000010000b, 010110101000b,\
		010001010111b, 000010101111b, 111000001110b, 111011100001b, 111100011001b,\
		101111001110b, 101011011000b, 101100101100b, 111111110011b, 101010010101b,\
		110110010101b, 001100111010b, 100001101000b, 001100000011b, 010110110000b,\
		101110101011b, 100001100101b, 011001011010b, 110110001111b, 001000000110b,\
		011101011111b, 001010101001b, 001111101001b, 111100011111b, 100010110010b,\
		000001101110b, 011110011010b, 010110100101b, 010010100011b, 101010001000b,\
		010000001001b, 111100110011b, 110010001111b, 000101100010b, 011111100000b,\
		000100000001b, 100100010000b, 011110000011b, 000010010001b, 110010101001b,\
		000000001010b, 110010011100b, 000000100100b, 100010110001b, 101111001100b,\
		000001101010b, 111011010110b, 010101011101b, 100110101011b, 101001011011b,\
		010011100100b, 111000001000b, 100111110001b, 100100101011b, 011001101001b,\
		010101110000b, 101000011001b, 101111110111b, 010111110011b, 011111111111b,\
		011100110011b, 010010110010b, 111011111101b, 011110000010b, 100001101010b,\
		110100011100b, 001001010011b, 001110000010b, 000110000101b, 010110001010b,\
		101000101010b, 100000101001b, 000001101100b, 001001111011b, 100011010000b,\
		010000100000b, 001111111000b, 111011111000b, 100011101000b, 100110001100b,\
		010001010011b, 100110110101b, 100001010011b, 100100101111b, 011101101011b,\
		011110111101b, 101110010100b, 101010110111b, 001010001011b, 011111001101b,\
		111011001101b, 111011000110b, 001100000001b, 101100110111b, 101100110010b,\
		001000110011b, 111010101010b, 010101010110b, 111100111001b, 111000101001b,\
		111000010101b, 001000101101b, 100111000010b, 100000010110b, 000100011000b,\
		010100011100b, 111010110011b, 100011100011b, 111111110101b, 110101010110b,\
		011001001011b, 011101110100b, 111110000110b, 011010100101b, 110100010010b,\
		011111100010b, 111010110001b, 100111000100b, 100000010101b, 111000110010b,\
		111100101001b, 101010100010b, 000110010010b, 001111101111b, 010011111011b,\
		110010000011b, 000010101101b, 111111100111b, 101001110110b, 100111011001b,\
		011010011111b, 011011011001b, 110001000001b, 111011011011b, 001011001111b,\
		100101000010b, 110000010010b, 000011011000b, 010111001001b, 010001111010b,\
		110101000110b, 111011101010b, 001100110101b, 001111000110b, 000000000010b,\
		010100111010b, 111101110110b, 101101110101b, 011001010101b, 010110001101b,\
		011110100011b, 010101010101b, 100110100011b, 101111110011b, 000111111101b,\
		010011000100b, 000010110101b, 000001011010b, 101100001000b, 000101111001b,\
		100001001100b, 110110000100b, 111010011000b, 110000001000b, 010111001101b,\
		100111000000b, 000001010000b, 000110101110b, 000100110011b, 101011101000b,\
		100110110010b, 111011100000b, 100000101011b, 111100101011b, 100010100011b,\
		101001000001b, 110001111010b, 001001110101b, 001000101110b, 101011111010b,\
		000110110110b, 000100010000b, 111001110010b, 100010111101b, 111110110010b,\
		001111110001b, 011111101101b, 001001101111b, 110111100001b, 000010111111b,\
		101110001111b, 101011101011b, 110001010010b, 011010100111b, 011011010110b,\
		111100001000b, 111100001111b, 111101011110b, 010000000000b, 000000011000b,\
		001000000100b, 010111100001b, 101110010011b, 000101000101b, 101100010110b,\
		010111011111b, 000010100101b, 100001111110b, 011101001000b, 100010001101b,\
		100111100001b, 011010110001b, 010110101100b, 111010110100b, 010110010101b,\
		010100111100b, 110001100101b, 010010011000b, 111110110011b, 110001101100b,\
		100011001110b, 100001000000b, 101001100000b, 010111111101b, 011000110001b,\
		101001011101b, 100110011101b, 011101111000b, 000000100001b, 010000010000b,\
		110100010110b, 101100011101b, 111011001111b, 100101111000b, 110101010100b,\
		101111000011b, 000101110000b, 110101110100b, 010110111000b, 100010101001b,\
		010111001111b, 001011111101b, 001111010011b, 101001101010b, 011110010100b,\
		001100110111b, 010111010111b, 000001100100b, 100001000010b, 101001111011b,\
		000011000100b, 111000100100b, 111010111001b, 101101001111b, 001010110011b,\
		001000000011b, 111111101001b, 101001010101b, 001010110110b, 110101110010b,\
		101101010001b, 101010111000b, 110100000101b, 111100110100b, 100010111000b,\
		010010001111b, 011000111101b, 110011011000b, 101010111001b, 011000010000b,\
		001001000001b, 001100101000b, 110111001001b, 011001000110b, 101001101000b,\
		100010011101b, 000001001101b, 010001011110b, 111111000001b, 000111100010b,\
		110110011111b, 000001110110b, 110101010001b, 110100100011b, 100110010100b,\
		010101100111b, 000000011110b, 001000010011b, 000101011010b, 010101101110b,\
		001010111100b, 110100111101b, 101101011011b, 011011101100b, 100000000001b,\
		000101010111b, 101010010011b, 110001000110b, 101110001000b, 010110000010b,\
		110100001011b, 010110100110b, 000110100101b, 111110111100b, 110010101101b,\
		110111101110b, 001111000000b, 001101010000b, 010011000011b, 011110010101b,\
		100001000100b, 000000111011b, 010011010110b, 100110110111b, 111000000000b,\
		100101111110b, 110011001100b, 100001001111b, 100100010010b, 001101111011b,\
		110010000010b, 011101001011b, 011000010111b, 010000010100b, 100100101010b,\
		001100101100b, 000100101001b, 100100000011b, 101010111011b, 000001100101b,\
		101011110101b, 100101111111b, 010101100001b, 101000001010b, 000011110010b,\
		111001010010b, 100001100011b, 010111111111b, 001110011000b, 010001011000b,\
		000011001110b, 110010111011b, 001100001111b, 100001110111b, 110000010000b,\
		101110000001b, 001011100110b, 010101001101b, 001001001111b, 001110100100b,\
		111110111010b, 011101100010b, 001010011011b, 011011010011b, 111000101011b,\
		110110110001b, 110100101111b, 000000100010b, 111111101111b, 111000101101b,\
		011001000010b, 100000001001b, 000101011100b, 110100100110b, 111011011111b,\
		110110111100b, 110011110000b, 111110011110b, 001101010010b, 101000111110b,\
		010101110110b, 101100000011b, 001111101110b, 010101011001b, 110010110010b,\
		100100110111b, 011100000001b, 101110000110b, 001011101000b, 000011100111b,\
		010101000000b, 101011100000b, 100100010001b, 011011100010b, 011010000100b,\
		010010110011b, 011010111101b, 010010011100b, 010010010011b, 011000011111b,\
		101101111111b, 010100001010b, 100100110100b, 101011101111b, 100100100010b,\
		010001011101b, 101101110000b, 110010000101b, 111011010111b, 010011110111b,\
		100101000011b, 001100111101b, 110110100000b, 101001100011b, 111001000011b,\
		100001011111b, 010000111101b, 100011100001b, 101100011010b, 100110100000b
	end db 0