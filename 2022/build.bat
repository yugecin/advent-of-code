:: any given first argument will be passed to aoc2021.exe
@ECHO OFF
REM don't call vcvars32 if it was already called in this session
REM otherwise it will error eventually because of too long input lines (because it appends to PATH)
IF "%VSINSTALLDIR%" NEQ "" GOTO:SKIPVCVARS
CALL "C:\Users\Robin\broftware\Microsoft Visual Studio 8\VC\bin\vcvars32.bat"
REM my vcvars returns errorlevel 9009 (attempted to execute a non-existing command), so skipping next check
::IF %ERRORLEVEL% NEQ 0 GOTO:ERR

:SKIPVCVARS
CALL :RUN day01a.asm %1 || GOTO:ERR
CALL :RUN day01b.asm %1 || GOTO:ERR
CALL :RUN day02a.asm %1 || GOTO:ERR
CALL :RUN day02a-faster.asm %1 || GOTO:ERR
CALL :RUN day02b.asm %1 || GOTO:ERR
CALL :RUN day02b-faster.asm %1 || GOTO:ERR
GOTO:EOF

:RUN
ECHO ======= %1
NASM -f win32 %1 -o ../aoc.obj || GOTO:EOF
LINK /NOLOGO /DLL /EXPORT:aoc ../aoc.obj /OUT:../aoc.dll || GOTO:EOF
"../aoc2021.exe" %2
GOTO:EOF

:ERR
ECHO.
ECHO.
ECHO FAILURE
SET %ERRORLEVEL%=2
