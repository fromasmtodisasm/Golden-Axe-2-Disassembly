@ECHO OFF

REM // build the ROM
call build %1


REM // clean up after us
IF EXIST ga2.p del ga2.p
IF EXIST ga2.h del ga2.h
IF EXIST ga2.bin del ga2.bin
IF EXIST ga2.prev.bin del ga2.prev.bin
IF EXIST ga2.log ( IF "%1"=="-pe" del ga2.log )

REM // if someone ran this from Windows Explorer, prevent the window from disappearing immediately
pause
