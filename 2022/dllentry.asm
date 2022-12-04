; see https://learn.microsoft.com/en-us/cpp/build/reference/entry-entry-point-symbol?view=msvc-170
; @12 because 3 arguments, dunno why the extra underscore
global __DllMainCRTStartup@12
__DllMainCRTStartup@12:
	mov eax, 1
	retn 0Ch
