%ifdef REQUIRE_64_OPS
section .bss
	div64 resd 1
	mul64 resd 1
	mod64 resd 1
section .text
get64ops:
	mov eax, [esp+4]
	mov [div64], eax
	mov eax, [esp+8]
	mov [mul64], eax
	mov eax, [esp+12]
	mov [mod64], eax
	ret
%else
get64ops:
	ret
%endif

; see https://learn.microsoft.com/en-us/cpp/build/reference/entry-entry-point-symbol?view=msvc-170
; @12 because 3 arguments, dunno why the extra underscore
global __DllMainCRTStartup@12
__DllMainCRTStartup@12:
	mov eax, 1
	retn 0Ch

; 'type' tells how to interpret the result of 'aoc':
; - 0: interpret as 0 terminated string
; - 32: interpret as 32 bit integer
; - 64: interpret as 64 bit integer
; define 'TYPE' before including this file
type:
	mov eax, TYPE
	ret

global type, aoc, get64ops
