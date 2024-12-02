:: any given first argument will be passed to aoc2024.exe, usually /BENCH or /DEBUG, see aoc2024.c for details
@ECHO OFF
REM don't call vcvars32 if it was already called in this session
REM otherwise it will error eventually because of too long input lines (because it appends to PATH)
IF "%VSINSTALLDIR%" NEQ "" GOTO:SKIPVCVARS
CALL "C:\Users\Robin\broftware\Microsoft Visual Studio 8\VC\bin\vcvars32.bat"
REM my vcvars returns errorlevel 9009 (attempted to execute a non-existing command), so skipping next check
::IF %ERRORLEVEL% NEQ 0 GOTO:ERR

:SKIPVCVARS
GOTO:EOF

:RUN
ECHO ================================================================================
ECHO PROGRAM: %1
NASM -f win32 %1 -o aoc.obj || GOTO:EOF
LINK /NOLOGO /DLL /EXPORT:aoc /EXPORT:type /EXPORT:get64ops /EXPORT:getprintf aoc.obj /OUT:aoc.dll > linkoutput.txt || GOTO:LINKERR
DEL linkoutput.txt
MOVE aoc.dll ../2023/aoc.dll > nul
"../2023/aoc2023.exe" %2
GOTO:EOF
:LINKERR
TYPE linkoutput.txt
DEL linkoutput.txt
GOTO:EOF

:ERR
ECHO.
ECHO.
ECHO FAILURE
SET %ERRORLEVEL%=2
