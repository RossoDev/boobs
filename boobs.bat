@echo off
setlocal enabledelayedexpansion

REM NEXT
:next
cls

:loop
Set /a num=(%Random% %%9)+1
color %num%

echo ^(.^) ^(.^)
echo:
echo  [1] START
echo  [2] USAGE
echo  [3] LINKS
echo  [4] EXIT

CHOICE /C 1234 /M "Enter your choice:"

IF ERRORLEVEL 4 GOTO exi
IF ERRORLEVEL 3 GOTO social
IF ERRORLEVEL 2 GOTO usage
IF ERRORLEVEL 1 GOTO app

REM EXIT
:exi
exit

REM SOCIAL
:social

cls
echo:
echo  [1] GITHUB
echo  [2] MAIN

CHOICE /C 12 /M "Enter your choice:"

IF ERRORLEVEL 2 (
    GOTO next)
IF ERRORLEVEL 1 (
    START CHROME https://github.com/RossoDev/)

goto social

REM USAGE
:usage
color a
cls

echo On the main page press 1 to start the program, in the size window enter a number ^(I recommend below 10^) and press enter.
echo Look at the result ;)

pause

goto next

echo

REM APP
:app
color a
cls

set /P size="Size: "

echo %size%|findstr /r /c:"^[0-9][0-9]*$" >nul
if errorlevel 1 (
    echo Put a positive number please.
    pause
    exit ) else (

    cls

    set "spaces="

    for /l %%i in (1,1,%size%) do set "spaces=!spaces! "

    echo ^(!spaces!.!spaces!^) ^(!spaces!.!spaces!^)

    pause
    goto app
)