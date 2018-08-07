@ECHO OFF

REM // make sure we can write to the file gabuilt.bin
REM // also make a backup to gabuilt.prev.bin
IF NOT EXIST ga2.bin goto LABLNOCOPY
IF EXIST ga2.prev.bin del gabuilt.prev.bin
IF EXIST ga2.prev.bin goto LABLNOCOPY
move /Y ga2.bin ga2.prev.bin
IF EXIST ga2.bin goto LABLERROR3
:LABLNOCOPY

REM // delete some intermediate assembler output just in case
IF EXIST ga2.p del ga2.p
IF EXIST ga2.p goto LABLERROR2
IF EXIST ga2.h del ga2.h
IF EXIST ga2.h goto LABLERROR1

REM // clear the output window
REM cls

REM // run the assembler
REM // -xx shows the most detailed error output
REM // -E creates log file for errors/warnings
REM // -A gives us a small speedup
set AS_MSGPATH=AS/win32
set USEANSI=n

REM // allow the user to choose to output error messages to file by supplying the -logerrors parameter
IF "%1"=="-logerrors" ( "AS/win32/asw.exe" -xx -c -E -A ga2.asm ) ELSE "AS/win32/asw.exe" -xx -c -E -A ga2.asm

REM // if there were errors, a log file is produced
IF EXIST ga2.log goto LABLERROR4

REM // combine the assembler output into a rom
IF EXIST ga2.p "AS/win32/gap2bin" ga2.p ga2.bin ga2.h

REM // done -- pause if we seem to have failed, then exit
IF NOT EXIST ga2.p goto LABLPAUSE
IF NOT EXIST ga2.bin goto LABLPAUSE
fixheader ga2.bin
exit /b
:LABLPAUSE

pause


exit /b

:LABLERROR1
echo Failed to build because write access to ga2.h was denied.
pause


exit /b

:LABLERROR2
echo Failed to build because write access to ga2.p was denied.
pause


exit /b

:LABLERROR3
echo Failed to build because write access to ga2.bin was denied.
pause

exit /b

:LABLERROR4
REM // display a noticeable message
echo.
echo ***************************************************************************
echo *                                                                         *
echo *   There were build errors/warnings. See ga2.log for more details.   *
echo *                                                                         *
echo ***************************************************************************
echo.
pause

