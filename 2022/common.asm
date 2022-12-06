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
global type, aoc
type:
	mov eax, TYPE
	ret
