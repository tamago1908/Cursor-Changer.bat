@echo off & setlocal
mode con: | find "75" >nul && mode con: | find "25" >nul
if "%errorlevel%"=="1" (mode con: cols=75 lines=25& set boottime1=%time%& set batbeta=& set updateavailable=& set updatemyversion=& set updateversion=)
if "%batbootargumentbad%"=="false" (title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| €”õ’†...) else if not "%1"=="BatBootErrorHandlerArgument1908??" (title ƒJ[ƒ\ƒ‹‘Ö‚¦)
if not defined dummy (set /p nothing=[?25h<nul)

rem Windows versionƒ`ƒFƒbƒN‚ğƒoƒCƒpƒX‚µ‚½‚¢ê‡‚Í"true"‚ğ’Ç‰Á‚µ‚Ä‚­‚¾‚³‚¢B(—á : set bypasswinvercheck=true)
rem O======================O
set bypasswinvercheck=
rem O======================O

rem ƒJ[ƒ\ƒ‹‘Ö‚¦ by tamago_1908
rem English version.

rem https://github.com/tamago1908/cursor-changer.bat 

rem OS•À‚İ‚Ì‹@”\‚ğ‚Á‚½ƒoƒbƒ`ƒtƒ@ƒCƒ‹A"ƒJ[ƒ\ƒ‹‘Ö‚¦"
rem Ú×‚Ígithub‚ğQÆB

rem O==============================================================O
rem I                                                              I
rem I                       ! DISCLAIMER !                         I
rem I                                                              I
rem I         If you don't understand what you are doing,          I
rem I       I suggest you close immediately and do nothing.        I
rem I      If you have attempted to view the contents of this      I
rem I      BATCH for any reason, I do not recommend that you       I
rem I       change the contents of this BATCH at the least.        I
rem I      This batch is very long and complex. If you change      I
rem I        anything at all, that alone can cause an error.       I
rem I     Please note that tamago_1908 does not provide support    I
rem I          for errors or problems caused by your changes       I
rem I                         to this batch.                       I
rem I                                                              I
rem O==============================================================O
rem                 This batch is created by tamago_1908
rem                         ƒJ[ƒ\ƒ‹‘Ö‚¦.bat

rem ã‹L‚ÌƒƒbƒZ[ƒW‚Ì•\¦‚ª•ö‚ê‚Ä‚¢‚éH‚È‚çVirtual Studio Code‚ÅŠJ‚­‚Ì‚ğ„§‚µ‚Ü‚·...

rem   Copyright 2021 tamago_1908

rem   Licensed under the Apache License, Version 2.0 (the "License");
rem   you may not use this file except in compliance with the License.
rem   You may obtain a copy of the License at
rem
rem       http://www.apache.org/licenses/LICENSE-2.0
rem
rem   Unless required by applicable law or agreed to in writing, software
rem   distributed under the License is distributed on an "AS IS" BASIS,
rem   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
rem   See the License for the specific language governing permissions and
rem   limitations under the License.

rem İ’è‚Ì“K‰‚ğ‰ü‘P‚·‚é

rem Œv‰æ     : rem customƒe[ƒ}‹@”\ (ˆêƒJƒ‰[) ‚ğÀ‘•‚·‚é (1.15?)
rem ã ‹ï‘Ì“I‚É‚ÍColor_Applyer‚ğÀ‘•‚µ‚ÄAæ‚Éfor•ª‚Å‹ó”’‚ğ—˜—p‚µ‚Ä•¶šF‚È‚Ç‚ğw’èAŒã‚É•`Ê‚³‚ê‚éGUI‚âƒnƒCƒ‰ƒCƒg‚Í]—ˆ‚Ì•û–@‚ÅÅ“K‰»‚·‚éB

rem ‚à‚¤­‚µŒ«‚¢•û–@‚Åİ’èƒtƒ@ƒCƒ‹‚È‚Ç‚Ì‰ü•Ï‚ğŒŸ’m‚·‚é  (1.15?)
rem o—ˆ‚½‚çapplication manager‚ğŠ®¬‚³‚¹‚é (1.15?)


rem ƒrƒ‹ƒh”Ô†‚Æƒo[ƒWƒ‡ƒ“‚ğ–¾‹L‚·‚é‚±‚ÆI
rem environment setting, It is not recommended to change.
rem VER v1.15ƒÀ4
set batver=1.15ƒÀ4
set batbuild=Build 131
set batverdev=beta
set hazimeeaster=false
set firststartbat=no
set bootbatnow=yes


rem Here you can change the path to the location where configuration files and other files are placed and loaded, and names.
rem Example : 
rem %HOMEDRIVE%%HOMEPATH% (default)
rem %HOMEDRIVE%%HOMEPATH%\desktop (desktop)
rem O===================================O
set "batchmainpath=%HOMEDRIVE%%HOMEPATH%"
rem O===================================O
rem settings file
set "Settingsfile=ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt"
rem O===================================O
rem First Stuffs file
set "FirstSTFsfile=‰‰ñƒJ[ƒ\ƒ‹.txt"
rem O===================================O
cd /d %batchmainpath%


rem detect user argument
:batbootVerifyerrorhandler
echo %0 | find "%~dp0%~n0%~x0" >nul
if "%1"=="BatBootErrorHandlerArgument1908??" (
    if "%errorlevel%"=="0" (set batbootargumentbad=true)
    if "%errorlevel%"=="1" (set batbootargumentbad=false)
) else (set batbootargumentbad=)
if "%batbootargumentbad%"=="true" (call :BSOD_Errors 5)


:batbootcheckwinver
rem checking windows version
setlocal enabledelayedexpansion
rem check windows 10 1803 or higher
for /f "tokens=6 delims=.] " %%i in ('ver') do set version=%%i
if %version% geq 17134 (set batbootcheckwinversafe=true) else (set batbootcheckwinversafe=false)
if "%batbootcheckwinversafe%"=="true" (goto :batbootcheckwinversafe) else (goto :batbootcheckwinverbad)

:batbootcheckwinverbad
if "%DynamicWinverCheck%"=="true" if "%1"=="dynamic" (exit /b 1)
rem check windows 8.1 or lower
for /f "usebackq delims=" %%a in (`ver`) do set version2=%%a
echo %version2% | find /i "Version 10.0" > nul
if "%errorlevel%"=="0" (set windowsverfilter=Windows 10, ŒÃ‚¢ƒrƒ‹ƒh) else (set "windowsverfilter=ŒÃ‚·‚¬‚Ü‚·IWindows XPH")
echo %version2% | find /i "Version 6.3." > nul
if "%errorlevel%"=="0" (set windowsverfilter=Windows 8.1)
echo %version2% | find /i "Version 6.2." > nul
if "%errorlevel%"=="0" (set windowsverfilter=Windows 8)
echo %version2% | find /i "Version 6.1." > nul
if "%errorlevel%"=="0" (set windowsverfilter=Windows 7)
echo %version2% | find /i "Version 6.0." > nul
if "%errorlevel%"=="0" (set windowsverfilter=Windows Vista)
if "%bypasswinvercheck%"=="true" (goto :batbootcheckwinverbadwarning)
rem winver check failed message
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| Windows ƒo[ƒWƒ‡ƒ“ƒGƒ‰[I
cls
echo ƒJ[ƒ\ƒ‹‘Ö‚¦‚Í‚¨g‚¢‚ÌWindows‚Ìƒo[ƒWƒ‡ƒ“‚ğƒTƒ|[ƒg‚µ‚Ä‚¢‚Ü‚¹‚ñI
echo (%windowsverfilter%)
pause
cls
echo ƒJ[ƒ\ƒ‹‘Ö‚¦‚ÍWindows 10 1803ˆÈ~‚ÌWindows‚ğƒTƒ|[ƒg‚µ‚Ä‚¢‚Ü‚·I
echo (ƒrƒ‹ƒh 17134 ˆÈ~B‚ ‚È‚½‚ª‚¨g‚¢‚ÌWindows‚Íƒrƒ‹ƒh %version% ‚Å‚·^^!)
pause
cls
echo ‚»‚ê‚æ‚è‚àŒÃ‚¢ƒo[ƒWƒ‡ƒ“ (—á‚¦‚Î windows 7, windows 8, 8.1, “™‚Å‚·) ‚ÍƒTƒ|[ƒg‚³‚ê‚Ä‚¢‚Ü‚¹‚ñB
pause
cls
echo ‚¨g‚¢‚ÌWindows‚ğƒAƒbƒvƒf[ƒg‚µ‚Ä‚­‚¾‚³‚¢B
echo ‚à‚µ‚±‚ÌƒƒbƒZ[ƒW‚ªWindows 10 1803ˆÈ~‚ğ—˜—p‚µ‚Ä‚¢‚é‚Ì‚É•\¦‚³‚ê‚Ä‚¢‚éê‡‚ÍAGithub‚Ìissue‚É‚Ä•ñ‚µ‚Ä‚­‚¾‚³‚¢B
pause
call :exit 1


:batbootcheckwinverbadwarning
if "%1"=="BatBootErrorHandlerArgument1908??" if "%batbootargumentbad%"=="false" (goto :batbootcheckwinversafe)
cls
rem ŒxƒƒbƒZ[ƒW (winvercheck‚Éˆá”½‚µ‚Ä‚¢‚éó‘Ô‚Åbyps‚µ‚æ‚¤‚Æ‚µ‚½Û‚Ì)
set selected=
cls
echo.
echo                                    Œx
echo.
echo ‚ ‚È‚½‚ª‚¨g‚¢‚ÌWindows‚Ìƒo[ƒWƒ‡ƒ“ (%windowsverfilter%) ‚ÍƒJ[ƒ\ƒ‹‘Ö‚¦‚É‘Î‰‚µ‚Ä‚¢‚È‚¢‚æ‚¤‚Å‚·I
echo bypasswinvercheck=true‚ğ—˜—p‚µ‚Ä‚¢‚é‚æ‚¤‚Å‚·‚ªA‚±‚Ì‚Ü‚Ü‘±s‚·‚é‚Æ’v–½“I‚È–â‘è‚É‘˜‹ö‚·‚é‰Â”\«‚ª”ñí‚É‚‚¢‚Å‚·B
echo ‰¼‚É‘±s‚µ‚½ê‡A‚»‚ÌŒã‚Éˆø‚«‹N‚±‚³‚ê‚é–â‘è‚É‘Î‚·‚éÓ”C‚ÍƒJ[ƒ\ƒ‹‘Ö‚¦‚ÌŠJ”­Ò‚Å‚ ‚étamago_1908‚Í•‰‚¢‚Ü‚¹‚ñB
echo.
echo ‚»‚ê‚Å‚à‘±s‚µ‚Ü‚·‚©H
set /p selected=Y or N : 
if %selected%==n call :exit 1
if %selected%==y cls & goto :batbootcheckwinversafe
if %selected%== echo what? "Y" or "N".& pause & goto :batbootcheckwinverbadwarning

:batbootcheckwinversafe
setlocal disabledelayedexpansion
if "%DynamicWinverCheck%"=="true" if "%1"=="dynamic" (exit /b 0)
set batbootcheckwinversafe=& set version=& set version2=


:batboot_animationcheck
setlocal enabledelayedexpansion
rem bootloader animation loader. first of all, load theme setting.
if exist %Settingsfile% (
find "wmode=true" %Settingsfile% > nul 
if "!errorlevel!"=="0" (color f0 & set wmodetoggle=true) else (set wmodetoggle=false)
) else (set wmodetoggle=false)

rem check linuxboot
>nul 2>&1 find "s5_rawboot=true" %Settingsfile%
if not "!errorlevel!"=="0" (
    >nul 2>&1 find "s5_linuxboot=true" %Settingsfile%
    if "!errorlevel!"=="0" (
        set linuxboot=true
        if "%batbootargumentbad%"=="false" (echo [%time: =%] ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒGƒ‰[ƒnƒ“ƒhƒ‰[ - by tamago_1908& echo.) else (echo [%time: =%] ƒGƒ‰[ƒnƒ“ƒhƒ‰[‚ğŠJn’†...)
        >nul 2>&1 find "wmode=false" %Settingsfile%
        if "!errorlevel!"=="0" (set linuxishclr2=[0m)
        >nul 2>&1 find "wmode=true" %Settingsfile%
        if "!errorlevel!"=="0" (set linuxishclr2=[107m[30m) else (set linuxishclr2=[0m)
        set linuxishclred=[91m& set linuxishclr=[92m
    ) else (set linuxboot=false)
)

rem check simpleboot
if "%linuxboot%"=="true" if "%batbootargumentbad%"=="false" (echo [%linuxishclr%info%linuxishclr2%] Linux•—‚ÌƒGƒ‰[ƒnƒ“ƒhƒ‰[‚ªŠJn‚µ‚Ü‚µ‚½)
>nul 2>&1 find "rawboot=false" %Settingsfile%
if "!errorlevel!"=="0" (
    >nul 2>&1 find "s5_simpleboot=true" %Settingsfile%
    if "!errorlevel!"=="0" (
        if not "%linuxboot%"=="true" (
            set simpleboot=true
        )
    )
)

rem check rawboot
>nul 2>&1 find "bootanimation=true" %Settingsfile%
if "!errorlevel!"=="0" (
    >nul 2>&1 find "s5_rawboot=true" %Settingsfile%
    if "!errorlevel!"=="0" (
        if not "%linuxboot%"=="true" (
            if not "%simpleboot%"=="true" (
                @echo on
                set rawboot=true
            )
        )
    )
)
setlocal disabledelayedexpansion
if "%linuxboot%"=="true" if "%batbootargumentbad%"=="false" ((echo [%linuxishclr%info%linuxishclr2%] Boot animation‚ÌŠm”F‚ªŠ®—¹‚µ‚Ü‚µ‚½))


rem boot message
if not exist %Settingsfile%  (
    if not exist %FirstSTFsfile% (
        if not "%batbootargumentbad%"=="false" (echo ƒZƒbƒgƒAƒbƒv‚Ì€”õ’†...)
    ) else (title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ŠJn’†...& echo ƒJ[ƒ\ƒ‹‘Ö‚¦‚ğŠJn’†...)
)
if exist %Settingsfile% if not "%linuxboot%"=="true" (if not "%batbootargumentbad%"=="false" (title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ŠJn’†...& echo ƒJ[ƒ\ƒ‹‘Ö‚¦‚ğŠJn’†...)) else (if not "%batbootargumentbad%"=="false" (title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ŠJn’†...))
if not exist %Settingsfile% set firststartbat=yes
if "%1"=="BatBootErrorHandlerArgument1908??" (if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Boot messageH‚»‚ñ‚È‚à‚ÌƒEƒ`‚É‚Í‚È‚¢‚æB))


rem check powershell is available
if "%batbootargumentbad%"=="false" (goto :batbootcheckpowershellsafe)
:batbootcheckpowershell
>nul 2>&1 powershell exit && goto :batbootcheckpowershellsafe
cls
echo powershell‚ÌŠm”F‚É¸”s‚µ‚Ü‚µ‚½I
pause
cls
echo ‚±‚ê‚ª•\¦‚³‚ê‚½‚Æ‚¢‚¤‚±‚Æ‚ÍA‚¨g‚¢‚ÌPC‚Épowershell‚ªƒCƒ“ƒXƒg[ƒ‹‚³‚ê‚Ä‚¢‚È‚¢‰Â”\«‚ª‚‚¢‚Æ‚¢‚¤‚±‚Æ‚Å‚·B
pause
cls
echo ƒJ[ƒ\ƒ‹‘Ö‚¦‚ğ“®ì‚³‚¹‚é‚É‚Ípowershell‚ª•K{‚Å‚·B
echo windows 10 1803ˆÈ~‚Å‚Ípowershell 5.1‚ª•W€‚ÅƒCƒ“ƒXƒg[ƒ‹‚³‚ê‚Ä‚¢‚é‚½‚ßA‹°‚ç‚­ˆÓ}“I‚ÉƒAƒ“ƒCƒ“ƒXƒg[ƒ‹‚³‚ê‚Ä‚¢‚é‚©A—˜—p‚Å‚«‚È‚­‚È‚Á‚Ä‚¢‚é‰Â”\«‚ª‚‚¢‚Å‚µ‚å‚¤B
pause
cls
echo Powershell 5.1‚©A‚»‚êˆÈ~‚ğ•Ê“rƒCƒ“ƒXƒg[ƒ‹‚µ‚½‚Ì‚¿AÄ“x‚µ‚Ä‚­‚¾‚³‚¢B
pause
cls
echo ‚»‚ê‚ğs‚Á‚Ä‚à(‚à‚µ‚­‚Ípowershell‚ªƒCƒ“ƒXƒg[ƒ‹‚³‚ê‚Ä‚¢‚é‚Ì‚É)–â‘è‚ª‘±‚­ê‡‚É‚ÍAgithub‚Ìissue‚É‚Ä•ñ‚µ‚Ä‚­‚¾‚³‚¢B
pause
cls
exit
:batbootcheckpowershellsafe


:batbootVerifyerrorhandlersafe
rem Start Error Handler
if not "%1"=="BatBootErrorHandlerArgument1908??" (cd "%~dp0" & start /b /wait /realtime cmd.exe /c "%~n0%~x0" BatBootErrorHandlerArgument1908?? %* || call :BSOD_Errors 6)
if not "%1"=="BatBootErrorHandlerArgument1908??" (call :BSOD_Errors 0 %errorlevel%
    pause >nul
    echo ‰R‚İ‚½‚¢‚¾‚ëB€‚ñ‚Å‚é‚ñ‚¾‚ºA‚±‚ê‚ÅB
    exit
)
set batbootargumentbad=
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Error_Handler‚ª“®‚¢‚½ :D)


:Arguments_Loader
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Arguments_Loader‚ªŠJn‚µ‚Ü‚µ‚½)
if "%~1"=="" goto :Arguments_Loaderend
if not "%~1"=="BatBootErrorHandlerArgument1908??" (title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ˆø”‚ğŠm”F’†...)
setlocal enabledelayedexpansion
set i=0
for %%a in (%*) do (
  set /a i+=1
  set arg[!i!]=%%a
)

rem ”z—ñ‚Ì—v‘f”‚ğæ“¾
set n=%i%
rem ”z—ñ‚Ì—v‘f‚ğ‡”Ô‚Éˆ—
:Arguments_Loaderbreak
for /l %%i in (1,1,%n%) do (
  rem —áŠOˆ——p‚Ì•Ï”‚Ì‰Šú‰»B‚ ‚Æ‚Åg—p‚µ‚Ü‚·B
  set argmentserror=
  rem Œ»İ‚Ì—v‘f‚ğæ“¾
  set current=!arg[%%i]!
  rem Œ»İ‚Ì—v‘f‚ª‹ó‚Å‚È‚¯‚ê‚Îˆ—
  if not "!current!"=="" (
    rem Œ»İ‚Ì—v‘f‚Æˆê’v‚·‚é—v‘f‚ğ‹ó‚É‚·‚éid•¡”rœj
    for /l %%j in (%%i,1,%n%) do (
      if "!arg[%%j]!"=="!current!" set arg[%%j]=
    )
    rem Œ»İ‚Ì—v‘f‚É‰‚¶‚½ˆ—‚ğs‚¤
    if "!current!"=="BatBootErrorHandlerArgument1908??" (set Arguments_Loaderbreaked=true& goto :Arguments_Loaderbreak)
    set Arguments_Loaderbreaked=false
    if "!current!"=="bypsbootpwsh" (echo byps batbootpowershell‚ğ—LŒø‚É‚µ‚Ü‚µ‚½B& set disableexit=false& set argmentserror=false)
    if "!current!"=="enablesimpleboot" (echo simpleboot‚ğ—LŒø‚É‚µ‚Ü‚µ‚½B& set simpleboot=true& set argmentserror=false)
    if "!current!"=="devmode" (call :developermenu& set argmentserror=false)
    if "!current!"=="recovery" (echo recovery menu‚ğ—LŒø‚É‚µ‚Ü‚µ‚½B& set argmentserror=false& goto :Cursor_Changer_REmenu)
    if "!current!"=="uninstall" (setlocal disabledelayedexpansion & set Uninstall_Shutdown=true& goto :Uninstall)
    if "!current!"=="help" (title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ˆø”‚Ìƒwƒ‹ƒv& call :batstarthelp& set argmentserror=false)
    if "!current!"=="bypsadm" (echo bypsadm‚ğ—LŒø‚É‚µ‚Ü‚µ‚½B& set adminbypass=true& set adminbypass=false& set argmentserror=false)
    if "!current!"=="bypsloadsg" (echo bypsloadsg‚ğ—LŒø‚É‚µ‚Ü‚µ‚½B& set settingbypass=true& set argmentserror=false)
rem —áŠOˆ—
   if "!argmentserror!"=="" (title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ƒJ[ƒ\ƒ‹ˆø” ƒGƒ‰[&echo •s–¾‚Èˆø”‚ªw’è‚³‚ê‚Ü‚µ‚½I^(!current!^) —LŒø‚Èˆø”‚ğw’è‚µ‚Ä‚­‚¾‚³‚¢B ^(‚»‚ê‚©A^"help^"‚ğ—˜—p‚µ‚Ä‚­‚¾‚³‚¢B^)
      )
    )
  )
if %n% geq 0 (
    if not "!Arguments_Loaderbreaked!"=="true" (
        timeout /t 3 /nobreak >nul
    )
)
:Arguments_Loaderend
set argmentserror=& set Arguments_Loaderbreaked=& set arguments=& set n=& set i=
setlocal disabledelayedexpansion
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Arguments_Loader ‚ªŠ®—¹‚µ‚Ü‚µ‚½)

rem Error Hander call
call :batbootErrorHandlerCall
call :BSOD_Errors 1 %errorlevel%

:batbootErrorHandlerCall
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Error_Handler_Call ‚ªŠJn‚µ‚Ü‚µ‚½)
setlocal disabledelayedexpansion
if "%batbootargumentbad%"=="false" (title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ƒJ[ƒ\ƒ‹‘Ö‚¦ €”õ’†...) else if not "%1"=="BatBootErrorHandlerArgument1908??" if "%1"=="dynamic" (exit /b 0)
set batbootcheckwinversafe=& set version=& set version2=
if "%1"=="dynamic" (exit /b)


rem ƒJ[ƒ\ƒ‹‘Ö‚¦ˆ—‚ğÀs
rem –{ˆ— (•Ï”‚ÌƒZƒbƒg‚Æ‚©A‘O’iŠK)
set version=
set bootbatnow=yes
set Powersheller_passed=false
if not exist %Settingsfile% set checkupdatetoggle=false& goto :Powersheller
if exist %Settingsfile% find "CheckUpdate=true" %Settingsfile% > nul
if "%errorlevel%"=="0" (set checkupdatetoggle=true) else (set checkupdatetoggle=false)
if "%disableexit%"=="false" (goto :Powersheller_end)

:Powersheller
cd %~dp0 & set Powersheller=& set Powersheller_passed=false
if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Powersheller‚ªŠJn‚µ‚Ü‚µ‚½...)
if not "%Powersheller%"=="OOBEMusic" (set "batverforpowersheller=%batver:ƒÀ=.b%")
if not "%1"=="BatBootErrorHandlerArgument1908??" (
    if not "%bootbatnow%"=="yes" (
        if "%1"=="CheckUpdate" (set Powersheller=CheckUpdate& set checkupdatetoggle=true) else (set Powersheller=%1& set checkupdatetoggle=)
    )
)

rem startid~powershell ‚Ü‚Å‚ÌƒR[ƒh‚Í‚¸‚ç‚µ‚Ä‚Í‚¢‚¯‚È‚¢@‚»‚êˆÈ‘O‚©‚»‚êˆÈŒã‚È‚çok
:: StartID1908
call :getLineNumber startLine StartID1908 0
goto :Powershellerendcode
:Powershellercodestart
set /a startline=startline+5& set /a endline=endline-3
if "%Powersheller%"=="OOBEMusic" (start /min powershell.exe -noexit -NoProfile -ExecutionPolicy Unrestricted "$s=[System.Management.Automation.ScriptBlock]::create((Get-Content \"%~f0\" -TotalCount $env:endline|Where-Object{$_.readcount -gt $env:startline }) -join \"`n\");&$s" %*&goto :Powersheller_end)
if "%checkupdatetoggle%"=="true" (for /f "delims=" %%a in ('powershell -NoProfile "$s=[System.Management.Automation.ScriptBlock]::create((Get-Content \"%~f0\" -TotalCount $env:endline|Where-Object{$_.readcount -gt $env:startline }) -join \"`n\");&$s" %*') do set Updateinfo=%%a&goto :Powersheller_end) else (powershell -NoProfile -ExecutionPolicy Unrestricted "$s=[System.Management.Automation.ScriptBlock]::create((Get-Content \"%~f0\" -TotalCount $env:endline|Where-Object{$_.readcount -gt $env:startline }) -join \"`n\");&$s" %*&goto :Powersheller_end)


function Disablemax {
# Å‘å‰»ƒ{ƒ^ƒ“‚ğ–³Œø‰»‚·‚éˆ—
$code = @'
using System;
using System.Runtime.InteropServices;

namespace MaximizeButtonToggle {
    // ƒEƒBƒ“ƒhƒEƒXƒ^ƒCƒ‹‚ğ‘€ì‚·‚é‚½‚ß‚ÉWindows API‚ğ—˜—p
    internal static class WinAPI {
        [DllImport("kernel32.dll")] 
        internal static extern IntPtr GetConsoleWindow();  // ƒRƒ“ƒ\[ƒ‹ƒEƒBƒ“ƒhƒE‚Ìƒnƒ“ƒhƒ‹‚ğæ“¾
        [DllImport("user32.dll")] 
        internal static extern bool DrawMenuBar(IntPtr hWnd);  // ƒEƒBƒ“ƒhƒE‚ÌXV
        [DllImport("user32.dll")] 
        internal static extern int GetWindowLong(IntPtr hWnd, int nIndex);  // ƒEƒBƒ“ƒhƒE‚Ì‘®«‚ğæ“¾
        [DllImport("user32.dll")] 
        internal static extern int SetWindowLong(IntPtr hWnd, int nIndex, int dwNewLong);  // ƒEƒBƒ“ƒhƒE‚Ì‘®«‚ğİ’è
        // ƒEƒBƒ“ƒhƒEƒXƒ^ƒCƒ‹‘®«‚Ì’è”
        const int GWL_STYLE = -16, WS_MAXIMIZEBOX = 0x00010000;
        // 'state' ƒpƒ‰ƒ[ƒ^‚ÉŠî‚Ã‚¢‚ÄÅ‘å‰»ƒ{ƒ^ƒ“‚ğ—LŒø‚Ü‚½‚Í–³Œø‚É‚·‚é
        internal static void ChangeMaximizeState(bool state) {
            IntPtr hWnd = GetConsoleWindow();  // Œ»İ‚ÌƒRƒ“ƒ\[ƒ‹ƒEƒBƒ“ƒhƒE ƒnƒ“ƒhƒ‹‚ğæ“¾
            // ƒEƒBƒ“ƒhƒEƒXƒ^ƒCƒ‹‚ğXV‚µ‚ÄÅ‘å‰»ƒ{ƒ^ƒ“‚ğ—LŒø‚Ü‚½‚Í–³Œø‚É‚·‚éB
            SetWindowLong(hWnd, GWL_STYLE, state ? GetWindowLong(hWnd, GWL_STYLE) | WS_MAXIMIZEBOX : GetWindowLong(hWnd, GWL_STYLE) & ~WS_MAXIMIZEBOX);
            DrawMenuBar(hWnd);  // •ÏX‚ğ”½‰f‚·‚é‚½‚ß‚ÉƒEƒBƒ“ƒhƒE‚ğÄ•`‰æ
        }
    }
    // Public method to disable the maximize button
    public static class ButtonStatus { 
        public static void DisableMaximize() {
            WinAPI.ChangeMaximizeState(false); // Å‘å‰»ƒ{ƒ^ƒ“‚ğ–³Œø‚É‚·‚éB—LŒø‚É‚µ‚½‚¢ê‡‚Ítrue‚É•ÏX
        } 
    }
}
'@
# C#ƒR[ƒh‚ğƒRƒ“ƒpƒCƒ‹‚µ‚ÄÅ‘å‰»ƒ{ƒ^ƒ“‚ğ–³Œø‚É‚·‚éB
Add-Type $code
[MaximizeButtonToggle.ButtonStatus]::DisableMaximize()
}



function RefreshCursor {
# ƒJ[ƒ\ƒ‹‚Ìİ’è‚ğXV
Add-Type @"
using System;
using System.Runtime.InteropServices;
public class User32 {
    [DllImport("user32.dll", SetLastError = true)]
    public static extern bool SystemParametersInfo(int uAction, int uParam, IntPtr lpvParam, int fuWinIni);
}
"@
# 0x0057 = Win API‚ğg‚Á‚ÄƒJ[ƒ\ƒ‹‚ğXVB0x02 = •ÏX‚ğ‘—Mi“K—pj
# ƒJ[ƒ\ƒ‹‚ÌÄ“K—p
[User32]::SystemParametersInfo(0x0057, 0, [IntPtr]::Zero, 0x02) | Out-Null
}



function Updater {
# GitHub API‚ÅƒJ[ƒ\ƒ‹‘Ö‚¦‚ÌXV‚ğŠm”FBŠm”F‚·‚é‚¾‚¯B
$repo = "https://api.github.com/repos/tamago1908/Cursor-Changer.bat/releases/latest"
try{$file = (Invoke-RestMethod -Uri $repo -Method Get -Headers @{'Accept'='application/vnd.github.v3+json'}).assets | Where-Object { $_.name -like "Cursor.Changer.*" }
}catch{if($_.Exception.Response.StatusCode.Value__ -eq 403){return "APIErr"}else{return "GNErr"};break}

$fileVersion = $file.name -replace "Cursor\.Changer\.|\.bat", ""
$batVersion = "$env:batverforpowersheller"
if ("$fileVersion" -eq "$batVersion") { return "null" }

if ($file.name -match "^Cursor\.Changer\..*\.bat$") {
    $fileverArray = $fileVersion -split "\."
    $batverArray = $batVersion -split "\."

    # Compare version elements
    function Compare-VersionElement($a, $b) {
        if (($a -as [int]) -and ($b -as [int])) {
            return [math]::Sign($a - $b)
        } elseif ($a -match "^[a-z]+[0-9]*$" -and $b -match "^[a-z]+[0-9]*$") {
            return [string]::Compare($a, $b)
        } elseif ($a -match "^[a-z]+$") { return 1 }
        elseif ($b -match "^[a-z]+$") { return -1 }
        return [string]::Compare($a, $b)
    }

    # Check if version is beta
    function Is-Beta($versionArray) { return $versionArray[-1] -match "^[a-z][0-9]*$" }

    $isFileBeta = Is-Beta $fileverArray
    $isBatBeta = Is-Beta $batverArray

    # Ensure "die" is only returned for stable-to-beta mismatches
    if (-not $isBatBeta -and $isFileBeta) {
        # Check if the beta version is part of the same progression (e.g., 1.15 vs 1.15.b2)
        $fileWithoutBeta = $fileverArray[0..($fileverArray.Length - 2)] -join "."
        if ($fileWithoutBeta -eq $batVersion) {return "die"}
    }

    # Compare version arrays
    for ($i = 0; $i -lt [Math]::Max($fileverArray.Length, $batverArray.Length); $i++) {
        $fileElement = if ($i -lt $fileverArray.Length) { $fileverArray[$i] } else { "0" }
        $batElement = if ($i -lt $batverArray.Length) { $batverArray[$i] } else { "0" }
        $comparisonResult = Compare-VersionElement $fileElement $batElement

        if ($comparisonResult -gt 0) {
            return "batbeta=$isFileBeta,updateavailable=true,updatemyversion=$batVersion,updateversion=$fileVersion"
        } elseif ($comparisonResult -lt 0) { return "die" }
    } ; return "null"
  }
}



function Doupdate {
# github ‚©‚çÅV‚ÌƒR[ƒh‚ğæ“¾‚µA’¼Ú’u‚«Š·‚¦‚éB
$repo = "https://api.github.com/repos/tamago1908/Cursor-Changer.bat/releases/latest"
try{$file = (Invoke-RestMethod -Uri $repo -Method Get -Headers @{'Accept'='application/vnd.github.v3+json'}).assets | Where-Object { $_.name -like "Cursor.Changer.*" }
}catch{if($_.Exception.Response.StatusCode.Value__ -eq 403){Write-Host "[ERROR] Github‚ÌAPIƒŒ[ƒg§ŒÀ‚É“’B‚µ‚½‚æ‚¤‚Å‚·BƒAƒbƒvƒf[ƒg‚ğ•p”É‚ÉŠm”F‚µ‰ß‚¬‚½‚¹‚¢‚©‚à‚µ‚ê‚Ü‚¹‚ñBˆêŠÔ‚Ù‚Ç‘Ò‚Á‚Ä‚©‚çÄ“x‚¨‚µ‚­‚¾‚³‚¢B" -foregroundcolor red}else{Write-Host "[ERROR] ‰½‚ç‚©‚ÌƒGƒ‰[‚ª”­¶‚µ‚Ü‚µ‚½BÄ“x‚·‚©AƒCƒ“ƒ^[ƒlƒbƒgÚ‘±‚ğŠm”F‚µ‚Ä‚­‚¾‚³‚¢B `nƒGƒ‰[“à—e : $_" -foregroundcolor red};break}

$fileVersion = $file.name -replace "Cursor\.Changer\.|\.bat", ""
$batVersion = "$env:batverforpowersheller"
$batName = Get-Item "ƒJ[ƒ\ƒ‹‘Ö‚¦ *.bat"
$downloadFolder = Join-Path $env:USERPROFILE "Downloads"
$downloadFile = Join-Path $downloadFolder $file.name
Invoke-WebRequest -Uri $file.url -OutFile $downloadFile -Headers @{'Accept'='application/octet-stream'}
$newBatName = "Cursor.Changer.$fileVersion.bat"
Move-Item $downloadFile (Join-Path (Split-Path $batName) ("$newBatName")) -Force
Remove-Item "ƒJ[ƒ\ƒ‹‘Ö‚¦ $batVersion.bat" -Force
Write-Host "ƒAƒbƒvƒf[ƒg‚ÍŠ®—¹‚µ‚Ü‚µ‚½B`n"
Start-Sleep 2
Write-Host "Ä‹N“®’†..."
PowerShell -WindowStyle Hidden -Command Exit
Start-process "Cursor.Changer.$fileVersion.bat"
Killwhole
}



function OOBEMusic {
$webClient = New-Object System.Net.WebClient
$memoryStream = New-Object System.IO.MemoryStream

# Helper function to download data with progress reporting
function DownloadDataWithProgress($url, $memoryStream) {
    try {
        $response = $webClient.OpenRead($url)
        $totalBytes = [int]$webClient.ResponseHeaders["Content-Length"]
        $buffer = New-Object byte[] 8192
        $totalRead = 0
        while (($bytesRead = $response.Read($buffer, 0, $buffer.Length)) -gt 0) {
            $memoryStream.Write($buffer, 0, $bytesRead)
            $totalRead += $bytesRead
            [Console]::SetCursorPosition(0, [Console]::CursorTop)
            Write-Host "‰¹Šy‚ğƒ_ƒEƒ“ƒ[ƒh‚µ‚Ä‚¢‚Ü‚·... $([math]::Round(($totalRead / $totalBytes) * 100))% " -NoNewline
        }
        $memoryStream.Position = 0; $response.Close(); Write-Host "`nƒ_ƒEƒ“ƒ[ƒh‚ªŠ®—¹‚µ‚Ü‚µ‚½I"
    } catch {
        # Error handling for download failures
        $errorMsg = if ($_.Exception.Response.StatusCode.Value__ -eq 403) {
            "[ERROR] Github‚ÌAPIƒŒ[ƒg§ŒÀ‚É“’B‚µ‚Ü‚µ‚½BˆêŠÔ’ö‘Ò‚Á‚Ä‚©‚çÄ“x‚¨‚µ‚­‚¾‚³‚¢B"
        } else { "[ERROR] ‰½‚ç‚©‚ÌƒGƒ‰[‚ª”­¶‚µ‚Ü‚µ‚½BÄ“x‚·‚©AƒCƒ“ƒ^[ƒlƒbƒgÚ‘±‚ğŠm”F‚µ‚Ä‚­‚¾‚³‚¢B `nƒGƒ‰[“à—e : $_" }
        Write-Host $errorMsg -ForegroundColor Red
        Write-Host "‰½‚©ƒL[‚ğ‰Ÿ‚µ‚ÄI—¹..."; $host.UI.RawUI.ReadKey() | Out-Null; exit
    }
}

# Download the audio file
DownloadDataWithProgress "https://raw.githubusercontent.com/tamago1908/Cursor-Changer.bat/main/resource/Windows_XP_OOBE_for_Cursor_Changer.wav" $memoryStream

# Define the type for playing audio
Add-Type -TypeDefinition @"
using System;
using System.IO;
using System.Media;
public class AudioPlayer {
    public static SoundPlayer player;
    public static void PlayAudioFromBytes(byte[] data) {
        if (data == null || data.Length == 0) throw new ArgumentException("ƒoƒbƒtƒ@ (ƒ_ƒEƒ“ƒ[ƒhƒf[ƒ^) ‚ÍNULL‚Ü‚½‚Í‹ó‚Å‚ ‚Á‚Ä‚Í‚È‚è‚Ü‚¹‚ñB", "data");
        using (MemoryStream stream = new MemoryStream(data)) {
            player = new SoundPlayer(stream); player.PlayLooping();
        }
    }
    public static void StopAudio() { if (player != null) player.Stop(); }
}
"@

# Play the downloaded audio
try {
    [AudioPlayer]::PlayAudioFromBytes($memoryStream.ToArray())
    cls; Write-Host "‰¹Šy‚ğÄ¶’†... ‚±‚ÌƒEƒBƒ“ƒhƒE‚Í–³‹‚µ‚Ä‚­‚¾‚³‚¢B‰¹Šy‚ğ~‚ß‚½‚¢ê‡‚Í‚±‚ÌPowershellƒEƒBƒ“ƒhƒE‚ğI—¹‚µ‚Ä‰º‚³‚¢B"
} catch {
    Write-Host "[ERROR] ‰¹º‚ÌÄ¶‚É¸”s‚µ‚Ü‚µ‚½B ƒtƒ@ƒCƒ‹‚ª³‚µ‚¢Œ`®‚Å‚ ‚é‚±‚Æ‚ğŠm”F‚µ‚Ä‚­‚¾‚³‚¢B" -ForegroundColor Red
    Write-Host "‰½‚©ƒL[‚ğ‰Ÿ‚µ‚ÄI—¹..."; $host.UI.RawUI.ReadKey() | Out-Null; exit
}

$pid1 = (Get-WmiObject win32_process -filter "processid=$pid").parentprocessid; $pid2 = (Get-WmiObject win32_process -filter "processid=$pid1").parentprocessid
while ($true) {
    Start-Sleep -Seconds 1
    if (-not (Get-Process -pid $pid2 -ErrorAction SilentlyContinue)) {
        [AudioPlayer]::StopAudio()
        exit
    }
  }
}



Function Killwhole {
# Cmd‚ÌPID‚ğæ“¾‚µ‚ÄE‚·B
Write-Host "`nƒVƒƒƒbƒgƒ_ƒEƒ“’†..."
Start-Sleep 1
$pid1 = (Get-WmiObject win32_process -filter "processid=$pid").parentprocessid
$pid2 = (Get-WmiObject win32_process -filter "processid=$pid1").parentprocessid
taskkill /pid $pid1 /pid $pid2 /pid $pid > $null 2>&1
}

Function Changelog {
# Github‚©‚çÅV‚ÌChangelog‚ğæ“¾‚µA‚»‚ê‚ğ®‚¦‚Ä•\¦‚·‚éB
try {$h=Get-Host;$w=$h.UI.RawUI;$s=$w.BufferSize;$r=irm -Uri "https://api.github.com/repos/tamago1908/Cursor-Changer.bat/releases/latest";$s.height=$r.body -split '\r\n' | Measure-Object | %{$_.Count + 22};$w.BufferSize=$s;if($env:wmodetoggle -eq "false"){Write-Host "•ÏX—š—ğ :" -foregroundcolor white}elseif($env:wmodetoggle -eq "true"){Write-Host "•ÏX—š—ğ :" -foregroundcolor black }else{Write-Host "•ÏX—š—ğ :" -foregroundcolor white};$e=[char]27;$clr="$e[7m";$clred="$e[91m";$clrgrn="$e[92m";$clryel="$e[93m";$clrmag="$e[95m";$clrgra="$e[90m";$clrcyan="$e[96m";$c="$e[0m";if($env:wmodetoggle -eq "true"){$clr="$e[100m$e[97m";$c="$e[0m$e[107m$e[30m"};foreach($s in $r.body -split '\r\n'){if($s -match "####"){write-host "$clrcyan$e[1m$($s -replace '(^\#+)|(\#+$)', '')$c" `n -NoNewline}elseif($s -match ">"){write-host "$clred$($s -replace '\>', '')$c" `n -NoNewline}elseif($s -match "###"){write-host "$clryel$e[1m$($s -replace '(^\#+)|(\#+$)', '')$c" `n -NoNewline}elseif($s -match "___"){write-host "$clrgra--------------------------------------------------$c" `n -NoNewline}else{$s=$s -replace "\*{3}(.+?)\*{3}", "$e[3m`$1$c";$s=$s -replace "\*{2}(.+?)\*{2}", "$e[1m`$1$c";$s=$s -replace "^\s*-(\s+)(.*)", "$clred-$c`$1`$2";$s=$s -replace "\*+", "";write-host "$s" `n -NoNewline}};rv e,clr,clred,clrgrn,clryel,clrmag,clrgra,clrcyan,c,s}catch{if($_.Exception.Response.StatusCode.Value__ -eq 403){Write-Host "[ERROR] Github‚ÌAPIƒŒ[ƒg§ŒÀ‚É“’B‚µ‚Ü‚µ‚½BˆêŠÔ’ö‘Ò‚Á‚Ä‚©‚çÄ“x‚¨‚µ‚­‚¾‚³‚¢B" -foregroundcolor red}else{Write-Host "[ERROR] ‰½‚ç‚©‚ÌƒGƒ‰[‚ª”­¶‚µ‚Ü‚µ‚½BÄ“x‚·‚©AƒCƒ“ƒ^[ƒlƒbƒgÚ‘±‚ğŠm”F‚µ‚Ä‚­‚¾‚³‚¢B `nƒGƒ‰[“à—e : $_" -foregroundcolor red};break}
}



if ($env:checkupdatetoggle -eq "true") {Disablemax; Updater} else {Disablemax}
if ($env:Powersheller -eq "RefreshCursor") {RefreshCursor}
if ($env:Powersheller -eq "OOBEMusic") {OOBEMusic}
if ($env:Powersheller -eq "Updater") {Updater}
if ($env:Powersheller -eq "CheckUpdate") {Updater}
if ($env:Powersheller -eq "Doupdate") {Doupdate}
if ($env:Powersheller -eq "Changelog") {Changelog}


:Powershellerendcode
:: EndID1908
call :getLineNumber endLine EndID1908 0
if "%Powersheller_passed%"=="false" (set Powersheller_passed=true& goto :Powershellercodestart) else (goto :Powersheller_end)

:GetLineNumber <resultVar> <uniqueID> [LineOffset]
SETLOCAL
for /F "usebackq tokens=1 delims=:" %%L IN (`findstr /N "%~2" "%~f0"`) DO set /a lineNr=%~3 + %%L
(
ENDLOCAL
 set "%~1=%LineNr%"
 exit /b
)


rem –{ˆ—
:Powersheller_end
set startline=& set endline=& set Powersheller_passed=& set batverforpowersheller=
cd %batchmainpath%
if "%Powersheller%"=="OOBEMusic" (set Powersheller=& exit /b)
if "%bootbatnow%"=="no" if not "%Powersheller%"=="Updater" if not "%Powersheller%"=="CheckUpdate" (set Powersheller=& exit /b)

rem •Ï”‚Ì’l‚ğæ“¾
if not "%checkupdatetoggle%"=="true" (goto :Powersheller_get_updater_variable_end)
rem Powershell‚Ì–ß‚è’l‚ğBatch‚Ì•Ï”‚É•ÏŠ·
if "%updateinfo%"=="null" (goto :Powersheller_get_updater_variable_end)
if "%updateinfo%"=="die" (if not "%Powersheller%"=="CheckUpdate" (set Punish=true) & goto :Powersheller_get_updater_variable_end)
setlocal enabledelayedexpansion
for /f "tokens=1-4 delims=," %%a in ("%updateinfo%") do (
    for /f "tokens=1-2 delims==" %%x in ("%%a") do set "%%x=%%y"& for /f "tokens=1-2 delims==" %%x in ("%%b") do set "%%x=%%y"& for /f "tokens=1-2 delims==" %%x in ("%%c") do set "%%x=%%y"& for /f "tokens=1-2 delims==" %%x in ("%%d") do set "%%x=%%y"
)
setlocal disabledelayedexpansion
set updatemyversion=%batver:ƒÀ=.b%


:Powersheller_get_updater_variable_end
if "%Powersheller%"=="CheckUpdate" (if "%Updateinfo%"=="null" (set Powersheller=& exit /b 1) else if "%Updateinfo%"=="die" (set Powersheller=& exit /b 2) else if "%Updateinfo%"=="APIErr" (set Powersheller=& exit /b 3) else if "%Updateinfo%"=="GNErr" (set Powersheller=& exit /b 4) else (call :UpdateAvailable & set Powersheller=& exit /b 0))
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Powersheller ‚ÍŠ®—¹‚µ‚Ü‚µ‚½...)
set updateinfo=& set checkupdatetoggle=
goto :CursorChangerOOBE

rem ‚¢‚ç‚È‚¢î•ñ‚Ì—…—ñ

rem ###################
rem #    HELLO@WORLD    #  
rem ###################
rem •\¦100%Aƒtƒ‹ƒXƒNƒŠ[ƒ“„§@‚»‚êˆÈŠO‚Í•\¦‚Ì•ÛØ‚È‚µ


rem ‚¿‚È‚İ‚Éî•ñ
rem ‚±‚Ìƒoƒbƒ`ƒtƒ@ƒCƒ‹‚ÌŠJ”­‚ªn‚Ü‚Á‚½‚Ì‚Í2021”N‚Ì10Œ8“ú(‹°‚ç‚­)
rem ŠJ”­‚Ì“®‹@‚ÍAƒJ[ƒ\ƒ‹‚ğ‰Šú‰»‚³‚ê‚½‚Æ‚«‚É‚¢‚¿‚¢‚¿•Ï‚¦‚é‚Ì‚ª‚ß‚ñ‚Ç‚­‚³‚¢‚©‚çƒoƒbƒ`ƒtƒ@ƒCƒ‹‚Å©“®‰»‚µ‚æ‚¤‚Æ‚µ‚½‚©‚çB‚¾‚ª‚»‚Ì‚ ‚Æ‚¢‚ë‚¢‚ë‹@”\‚ª‘‚¦‚Ä‚¢‚Á‚Ä¡‚Ìó‘Ô‚É‚È‚Á‚½‚Ì‚Å‚ ‚éB
rem ƒo[ƒWƒ‡ƒ“2.0.0‚Ü‚Å‚ÍƒJ[ƒ\ƒ‹ƒuƒ‰ƒbƒN‚Æ‚¢‚¤–¼‘O‚¾‚Á‚½
rem ŠJ”­’†Šú‚É‚È‚Á‚ÄƒJ[ƒ\ƒ‹‘Ö‚¦(•)‚É•ÏX‚³‚ê‚½
rem ŠJ”­ŒãŠú‚É‚È‚Á‚ÄƒJ[ƒ\ƒ‹‘Ö‚¦‚Ì‚İ‚É•ÏX‚³‚ê‚½
rem Å‰‚Ìƒo[ƒWƒ‡ƒ“‚ª1.0.1‚¾‚Á‚½
rem –¼‘O‚Ì•ÏX‚ª‚³‚ê‚½ƒo[ƒWƒ‡ƒ“‚Í2.0.0‚Æ2.5.0beta5
rem ƒo[ƒWƒ‡ƒ“2.0.0‚Å‚ÍƒfƒtƒHƒ‹ƒg‚É–ß‚¹‚é‹@”\‚ª’Ç‰Á
rem ƒfƒtƒHƒ‹ƒg‚É–ß‚·‹@”\‚Íƒo[ƒWƒ‡ƒ“1.5.0‚ ‚½‚è‚©‚ç‚Ù‚Ì‚ß‚©‚µ‚Ä‚¢‚½
rem ƒo[ƒWƒ‡ƒ“2.1.x‚©‚çNoFB NonFIxBug‚Æ‚¢‚¤ƒo[ƒWƒ‡ƒ“‚ª’Ç‰Á‚³‚ê‚½‚ª‚·‚®‚Éíœ‚³‚ê‚½
rem ƒJ[ƒ\ƒ‹‘Ö‚¦‚É‚Íƒo[ƒWƒ‡ƒ“ Dev.1‚Æ‚¢‚¤‚à‚Ì‚ª‚ ‚Á‚½
rem ƒo[ƒWƒ‡ƒ“Dev.1‚Íƒo[ƒWƒ‡ƒ“2.4.x‚É‘Š“–
rem ƒo[ƒWƒ‡ƒ“2.4.x‚Ü‚Å‚Í‚à‚Ì‚·‚²‚­ƒo[ƒWƒ‡ƒ“‚Ìã‚è•û‚ª‘‚©‚Á‚½
rem ˆê”ÔŠJ”­‚ÉŠÔ‚ª‚©‚©‚Á‚½‚Ì‚Íƒo[ƒWƒ‡ƒ“1.12‚Å‚ ‚éB (”¼”NŠÔ‚ÌŠJ”­ŠúŠÔ)
rem “à—e‚ª‚®‚¿‚á‚®‚¿‚á‚È‚Ì‚Í‚à‚Æ‚à‚Æl‚ÉŒ©‚¹‚é‚Â‚à‚è‚ª‚È‚©‚Á‚½‚©‚ç‚Å‚ ‚éB
rem ƒJ[ƒ\ƒ‹‘Ö‚¦‚É‚Í2022”N2Œ22“ú2222•ª22•b‚ÉŠ®¬‚µ‚½ƒo[ƒWƒ‡ƒ“‚ª‚ ‚éB‚»‚ê‚ªƒJ[ƒ\ƒ‹‘Ö‚¦1.7a‚¾B

rem ƒo[ƒWƒ‡ƒ“ƒAƒbƒvî•ñ
rem ƒo[ƒWƒ‡ƒ“2.5.0ˆÈ‘O‚Ìƒn[ƒWƒ‡ƒ“—š—ğ‚ÍÁ¸‚µ‚Ä‚¢‚Ü‚·
rem ƒo[ƒWƒ‡ƒ“2.5.0 beta1‚Å‚·‚×‚Ä‚Ì•ÏX‚ğƒfƒtƒHƒ‹ƒg‚É–ß‚·‹@”\‚ª’Ç‰Á
rem ƒo[ƒWƒ‡ƒ“2.5.0 beta5‚©‚ç–¼‘O‚ªƒJ[ƒ\ƒ‹‘Ö‚¦ 1.0beta‚É•ÏX
rem ƒo[ƒWƒ‡ƒ“2.5.0 beta7 (1.0beta2)‚©‚çDogcheck‚Æ‚¢‚¤ƒlƒ^‹@”\‚ª’Ç‰Á‚³‚ê‚½
rem ƒo[ƒWƒ‡ƒ“2.5.0 beta9 (1.0beta4)‚©‚çDogcheck‚ÉƒAƒbƒvƒf[ƒg‚ª“ü‚èA“¯‚¶–¼‘O‚ÌƒeƒLƒXƒgƒtƒ@ƒCƒ‹‚ğì‚é‚¾‚¯‚Å‚Í‰ñ”ğ‚ª‚Å‚«‚È‚¢‚æ‚¤‚É‚È‚Á‚½
rem ƒo[ƒWƒ‡ƒ“1.0(2.5.0 beta10)‚©‚ç³®‚ÉƒJ[ƒ\ƒ‹•Ï‚¦‚ÌªŠ²“I‚È•”•ª‚ªŠ®¬A‚±‚ê‚É”º‚¢ƒJ[ƒ\ƒ‹‘Ö‚¦‚Ìƒo[ƒWƒ‡ƒ“‚Í1.0‚Æ‚È‚Á‚½
rem ƒo[ƒWƒ‡ƒ“1.1 (2.5.0beta11)‚©‚çalldefü‚è‚ÌƒRƒ}ƒ“ƒh‚Ìƒ~ƒX‚É‚æ‚è•ªŠò‚ª‚Å‚«‚Ä‚¢‚È‚©‚Á‚½ƒoƒO‚ª‰ğÁ‚³‚êA‰½‚æ‚è•ªŠò‚²‚Æ‚ÌƒNƒŠƒA‚ª‚È‚­‚È‚èA‚æ‚èƒV[ƒ€ƒŒƒX‚É•ªŠò‚·‚é‚æ‚¤‚É‚È‚Á‚½B
rem ƒo[ƒWƒ‡ƒ“1.2 (2.5.0beta13)‚©‚çƒfƒtƒHƒ‹ƒg‚É–ß‚·A‚à‚µ‚­‚Í•F‚É•ÏX‚·‚éÛ‚Ì•¶š‚ª•ÏX‚³‚ê‚½B
rem ƒo[ƒWƒ‡ƒ“1.3(2.5.0beta14)‚©‚çA‰‰ñ‚Ì•ÏX‚Å‚¢‚¢‚¦‚ğ‚ğ‰Ÿ‚µ‚½‚Æ‚«‚ÉA‰‰ñƒJ[ƒ\ƒ‹•ÏX‚Æ‚¢‚¤‚à‚Ì‚ªíœ‚³‚ê‚é‹@”\‚ª‚¶‚Á‚»‚¤‚³‚êA‚»‚ê‚É‰Á‚¦‚ÄAƒC[ƒXƒ^[ƒGƒbƒO‚É‚¿‚å‚Á‚Æ‚µ‚½V‹@”\‚ª’Ç‰ÁB
rem ƒo[ƒWƒ‡ƒ“1.4(‹Œ2.5.0beta15)‚©‚çA‚Â‚¢‚ÉŠJ”­“–‰‚©‚ç“¯‚¶‚¾‚Á‚½‹@”\‚ğ‘I‘ğ‚·‚é•”•ª‚ª•ÏX‚³‚êA‚»‚ê‚É”º‚¢‹Œƒo[ƒWƒ‡ƒ“•\‹L‚ª‚È‚­‚È‚èA–{“–‚ÌˆÓ–¡‚Å‚Ìver2.5.0‚É‚È‚Á‚½B
REM ƒo[ƒWƒ‡ƒ“1.5‚©‚çA’´‘åŒ^‚¾‚ÆŒ¾‚Á‚Ä‚à‚¢‚¢‚Ù‚Ç‚ÌƒAƒbƒvƒf[ƒg‚ª—ˆ‚½B

rem Ú‚µ‚­Œ¾‚¤‚ÆA‚Ü‚¸İ’èƒƒjƒ…[‚Ì’Ç‰ÁA‚»‚ê‚É”º‚¢ƒJ[ƒ\ƒ‹‚ğ•ÏX‚µ‚½Û‚ÌÄ‹N“®‚ÌŠm”F‚ğŠ®‘S‚ÉOFF‚É‚·‚éİ’èAƒfƒoƒbƒOƒ‚[ƒh‚ÌON/OFF‚ª’Ç‰Á‚³‚ê‚½B
rem ‚»‚µ‚ÄŸ‚ÉAƒzƒƒCƒgƒ‚[ƒh‚Ì’Ç‰ÁBcmdã‚Ìƒe[ƒ}‚ğƒzƒƒCƒgŠî’²‚ÌƒfƒUƒCƒ“‚É•ÏX‚Å‚«A‚µ‚©‚àİ’è‚µ‚½‚±‚Æ‚ğ‹L˜^‚·‚é‹@”\‚à‚ ‚èA‹N“®‚É©“®“I‚ÉƒzƒƒCƒgƒ‚[ƒh‚É‚·‚é‚±‚Æ‚ª‚Å‚«‚é‚Æ‚¢‚¤‹@”\‚à“‹Ú‚µ‚Ä‚¢‚éB
rem ‚»‚µ‚Ä‘½­‚ÌƒoƒOC³AŒëš’Eš‚ğC³‚µ‚½B

rem ƒo[ƒWƒ‡ƒ“1.5a Ä‹N“®‚Ì”»•Ê‚É”º‚¤•¶š•ÏX‚Æƒ_[ƒNƒe[ƒ}‚É–ß‚·Û‚Ì‹@”\‚ğ”p~—\’è‚Ì•¶‚ğ‘}“ü‚µ‚½B
rem ƒo[ƒWƒ‡ƒ“1.6 ¡‰ñ‚ÌƒAƒbƒvƒf[ƒg‚Í’´‘åŒ^‚¾B

rem Ú‚µ‚­Œ¾‚¤‚ÆA‚Ü‚¸‰‰ñ‹N“®‚ÉƒJ[ƒ\ƒ‹‘Ö‚¦‚Ì•¶š‚ª“øF‚É•Ï‰»‚·‚é‚æ‚¤‚È‹@”\‚ª’Ç‰Á‚³‚êA
rem Ÿ‚ÉAÅ‰‚Ì‰æ–Ê‚ÅƒGƒ“ƒ^[ƒL[‚ğ’·‰Ÿ‚µ‚µ‚Ä‚¢‚é‚Æ‚»‚ê‚ğŒŸ’m‚µ‚ÄƒƒbƒZ[ƒW‚ª—¬‚ê‚é‚æ‚¤‚È‹@”\‚ª’Ç‰Á‚³‚êA
rem ‚»‚Ì‚Ü‚½Ÿ‚ÉAƒzƒƒCƒgƒ‚[ƒh‚Ì‰æ–Ê‚ªŠvV‚³‚êAİ’èƒƒjƒ…[‚Æ“¯‚¶‚æ‚¤‚É‚È‚Á‚½B‚»‚ê‚É”º‚Á‚Äƒ_[ƒNƒe[ƒ}‚É–ß‚·Û‚ÌŒÂ•Ê‚Ì‰æ–Ê‚ªÁ¸‚µ‚½B
rem ‚»‚µ‚ÄƒGƒ“ƒ^[ƒL[’·‰Ÿ‚µ‚ğŒŸ’m‚·‚é‹@”\‚Ì’Ç‰Á‚É”º‚Á‚ÄAİ’èƒƒjƒ…[‚Å‚»‚Ì‹@”\‚Ì–³Œø‰»‚ª‚Å‚«‚é‚æ‚¤‚É‚à‚È‚Á‚½B

rem ƒo[ƒWƒ‡ƒ“ 1.6a ƒzƒƒCƒgƒ‚[ƒh‚É•ÏX‚ª‰Á‚¦‚ç‚êAƒ_[ƒNƒ‚[ƒh‚©ƒzƒƒCƒgƒ‚[ƒh‚©‚ğŒŸo‚µA‚»‚ê‚É”º‚¢•¶š‚ğ•Ï‰»‚³‚¹‚é‹@”\‚ª’Ç‰Á‚³‚êA‘½­‚ÌƒoƒOC³‚ªs‚í‚ê‚½B
rem ƒo[ƒWƒ‡ƒ“ 1.6b İ’èƒƒjƒ…[‚ÌO”Ô–ÚAƒfƒoƒbƒOƒ‚[ƒh‚Ì—LŒø–³Œø‰»‚Ìƒƒjƒ…[‚É‚¿‚å‚Á‚Æ‚µ‚½‰ü—Ç‚ª‰Á‚¦‚ç‚ê‚½B
rem ƒo[ƒWƒ‡ƒ“ 1.7 ¡‰ñ‚ÌƒAƒbƒvƒf[ƒg‚Å‚ÍA“d‘ì‹@”\‚ª’Ç‰Á‚³‚êA‚¿‚å‚Á‚Æ‚µ‚½ƒC[ƒXƒ^[ƒGƒbƒO‚ª’Ç‰Á‚³‚ê‚½B‚»‚µ‚ÄAHNY‚Æ‚¢‚¤•¶š‚Í¡‚³‚ç‚¾‚ªíœ‚³‚ê‚½B
rem ƒo[ƒWƒ‡ƒ“ 1.7a ¡‰ñ‚ÌƒAƒbƒvƒf[ƒg‚ÍA‹@”\‘I‘ğ‚Ì‰æ–Ê‚Ì‡”Ô‚ğ‹@”\‚ª‘‚¦‚Ä‚«‚½‚±‚Æ‚É”º‚¢A•ÏX‚µ‚½Balldef‚Íİ’èƒƒjƒ…[‚ÉˆÚs‚µ‚½B
rem ‚»‚µ‚ÄAƒo[ƒWƒ‡ƒ“î•ñ‚É‘½­‚Ì•ÏXA‰½‚à‚µ‚È‚¢‚É‚¿‚å‚Á‚Æ‚µ‚½•ÏX‚ª‰Á‚¦‚ç‚ê‚½B
rem ƒo[ƒWƒ‡ƒ“ 1.8 ¡‰ñ‚ÌƒAƒbƒvƒf[ƒg‚Å‚Íİ’èƒƒjƒ…[‚É‚¿‚å‚Á‚Æ‚µ‚½•ÏX‚ª‰Á‚¦‚ç‚êAİ’è‚Ìà–¾‚ÆŒ»İ‚Ìİ’è‚ª—LŒø‚©–³Œø‚©‚ğƒV[ƒ€ƒŒƒX‚ÉŒ©‚ê‚é‚æ‚¤‚É‚È‚Á‚½B
rem ‚»‚µ‚Ä¡‰ñ‚ÌƒAƒbƒvƒf[ƒg‚Å‚Í2048‚Æ‚¢‚¤ƒQ[ƒ€‚ª“‹Ú—\’è‚¾‚Á‚½‚Ì‚¾‚ªAŠJ”­’†Šú‚ÉƒZ[ƒu‹@”\ŠÖ˜A‚É‹Zp“I‚È§–ñ‚ÆƒoƒO‚ª‚ ‚é‚±‚Æ‚ª”­Šo‚µAŠJ”­‚ª“ïq‚µ‚½‚½‚ßA
rem ‚»‚Ì‹@”\’Ç‰Á‚Í–³ŠúŒÀ‚É‰„Šú‚É‚È‚Á‚½B
rem ƒo[ƒWƒ‡ƒ“1.9 ¡‰ñ‚ÌƒAƒbƒvƒf[ƒg‚ÍAƒJ[ƒ\ƒ‹‘Ö‚¦İ’è‚Ì\•¶‚ğ•ÏX‚µAfalse‚©true‚©‚ğ•ÏX‚·‚é‚¾‚¯‚É‚µ‚½B‚±‚ê‚É‚æ‚è‰½‚ªƒIƒ“‚Å‰½‚ªƒIƒt‚©‚ª‚í‚©‚è‚â‚·‚­‚È‚Á‚½B
rem ‚Ü‚½A¡‰ñ‚ÌƒAƒbƒvƒf[ƒg‚É‚æ‚Á‚ÄA%FirstSTFsfile%‚É‚àdogcheck‚ª’Ç‰Á‚³‚ê‚½‚Ì‚ÅA‚Ü‚Ÿİ’èƒtƒ@ƒCƒ‹‚ğ“r’†‚Åíœ‚µ‚½‚è‚È‚ñ‚Ä‚±‚Æ‚ª‚µ‚É‚­‚­‚È‚Á‚½B

rem ƒo[ƒWƒ‡ƒ“1.10 ¡‰ñ‚ÌƒAƒbƒvƒf[ƒg‚ÍƒJ[ƒ\ƒ‹‘Ö‚¦jãÅ‚àBIG‚ÈƒAƒbƒvƒf[ƒg‚¾B‚Ü‚¸Aİ’èƒƒjƒ…[‚ÆÅ‰‚Ìƒƒjƒ…[‚ÉUI‚ª’Ç‰Á‚³‚êAƒƒjƒ…[‚Ì®—‚ªs‚í‚êAƒzƒƒCƒgƒ‚[ƒh‚Æalldef‚ªˆÚ“®‚µ‚½Balldef‚É‚Í©ŒÈÁ‹‹@”\‚ª’Ç‰Á‚³‚êAƒAƒ“ƒCƒ“ƒXƒg[ƒ‹ƒƒjƒ…[‚ªŒ±“I‹@”\‚Æ‚µ‚ÄV‚½‚ÉÀ‘•‚³‚ê‚½B‚»‚µ‚Ä‰‰ñ‹N“®ƒƒbƒZ[ƒW‚ª•ÏX‚³‚êAŒy‚­ƒAƒjƒ[ƒVƒ‡ƒ“‚·‚é‚æ‚¤‚É‚È‚èAƒƒbƒZ[ƒW‚à•ÏX‚³‚ê‚½B‚»‚µ‚ÄAƒJ[ƒ\ƒ‹‘Ö‚¦‚Ì‰Šú‚Ìƒo[ƒWƒ‡ƒ“‚©‚ç‚ ‚Á‚½ƒJ[ƒ\ƒ‹‚ğ•Ï‚¦‚éƒƒjƒ…[‚ª‚È‚ñ‚Æ“‡‚³‚êA”’F‚Æ•F‚ğ©“®“I‚É”F¯‚µ‚ÄA‘I‘ğ‚µ‚È‚­‚Ä‚à©“®“I‚É•ÏX‚³‚ê‚é‚æ‚¤‚É‚È‚Á‚½B‚»‚µ‚Ä‚¿‚å‚Á‚Æ‚µ‚½‰B‚µ—v‘f‚à’Ç‰Á‚³‚ê‚½B‚Ü‚½Aİ’è‚à©“®“I‚É‹L“ü‚³‚ê‚é‚æ‚¤‚É‚È‚èAƒoƒO‚âŒëš’Eš‚à’¼‚³‚ê‚½B‚»‚êˆÈŠO‚É‚à‚½‚­‚³‚ñ‚Ì•”•ª‚ª•ÏX‚³‚êA‚à‚Í‚â•Ê•¨‚É‚È‚Á‚½B
rem ƒo[ƒWƒ‡ƒ“1.10a ‚¿‚å‚Á‚Æ‚µ‚½C³‚ÆA‹N“®‚Éˆ—’†‚Æ‹N“®’†‚Æ‚¢‚¤ƒƒbƒZ[ƒW‚ª•\¦‚³‚ê‚é‚æ‚¤‚É‚È‚èA‚í‚©‚è‚â‚·‚­‚È‚Á‚½B

rem ƒo[ƒWƒ‡ƒ“1.11 ¡‰ñ‚ÌƒAƒbƒvƒf[ƒg‚ÍAå‚Éİ’è‚Æ‹N“®ŠÖŒW‚Ì“à•”\‘¢‚ª‘å•‚É•Ï‚í‚èAŠÈ’P‚ÉŒ¾‚¤‚Æ¡‚Ü‚Å‚ÍA"‚Æ‚è‚ ‚¦‚¸‘S•”æ‚é"\‘¢‚©‚çA"‚Ù‚µ‚¢‚Æ‚«‚Éæ‚é"\‘¢‚É‚È‚Á‚½‚¨‚©‚°‚ÅA‘S‘Ì“I‚ÈƒŒƒXƒ|ƒ“ƒX‚ªŒüã‚µ‚½B‚»‚ê‚ÆA‚¿‚å‚Á‚Æ‚µ‚½•ÏX‚ª‰Á‚¦‚ç‚ê‚½B(‚¿‚È‚İ‚ÉA‚±‚Ì‹@”\‚ÌÀ‘•‚É‚Í‚Æ‚Ä‚à‹ê˜J‚µ‚½B)
rem ƒo[ƒWƒ‡ƒ“1.11a dogcheck‚ÌAA•ö‚ê‚ÆAİ’è‚Åİ’è‚ğ•ÏX‚µ‚½Œã‚Éreload‚ğ‚·‚é‚Æ‰i‰“‚Éƒ[ƒh‚µ‘±‚¯‚Ä‚µ‚Ü‚¤•s‹ï‡‚ğC³B

rem ƒo[ƒWƒ‡ƒ“1.12
rem ¡‰ñ‚ÌƒAƒbƒvƒf[ƒg‚ÍAƒJ[ƒ\ƒ‹‘Ö‚¦jãÅ‚à‹‘åŠ‚Â‘åŒ^‚ÌƒAƒbƒvƒf[ƒg‚Æ‚¢‚Á‚Ä‚¢‚¢B‚Ü‚¸Aİ’è‚ÌUIA‹N“®’†‚ÌUI‚ª‘å•‚É•ÏX‚³‚ê‚½B‚»‚µ‚ÄAƒƒjƒ…[‰æ–Ê‚Ì“d‘ì‚ÆI—¹‚ª”½“]‚µAdogcheck‚à‘å•‚É•Ï‚í‚èA—lX‚ÈV‹@”\‚ª’Ç‰Á‚³‚êA‚Ù‚Ú‚·‚×‚Ä‚ÌƒoƒO‚ªC³‚³‚êA‰pŒê‚à’Ç‰Á‚³‚êA....‚à‚¤‚Æ‚É‚©‚­AŒ¾‚¢‡‚í‚ç‚¹‚È‚¢‚Ù‚ÇA‘å—Ê‚Ì‹@”\‚ª’Ç‰Á‚³‚ê‚½Bdebug‚Ìİ’è‚ª•ÏX‚³‚êA1.11‚Æ‚ÍŒİŠ·«‚ª”¼•ª¸‚í‚ê‚½B‚Æ‚É‚©‚­‚Æ‚Ä‚à‘å—Ê‚Ì‹@”\‚ª’Ç‰Á‚³‚ê‚½B‚»‚µ‚ÄŠJ”­‚É‚Í”¼”N‚ª‚©‚©‚Á‚½B

rem ƒx[ƒ^”Å‚Ìi’»

rem ver1.6
rem ƒo[ƒWƒ‡ƒ“1.6ƒ¿ 1.6‚Ìƒ¿ƒo[ƒWƒ‡ƒ“Bİ’è‚Ì3”Ô–ÚAƒfƒoƒbƒOƒ‚[ƒh‚Ì—“‚Ì‹@”\‚ª‘‚¦‚½B
rem ƒo[ƒWƒ‡ƒ“1.6ƒÀ1 1.6‚Ìƒx[ƒ^”ÅB¡‚Ü‚ÅŒ‡‚¯‚Ä‚¢‚½İ’è‚Ì2”Ô–Ú‚ªŠ®¬‚µ‚½B
rem ƒo[ƒWƒ‡ƒ“1.6ƒÀ2 1.6‚Ìƒx[ƒ^”Å2Bİ’è‚Ì“ñ”Ô–Ú‚É‚ ‚Á‚½d‘å‚ÈƒoƒO‚ğC³‚µ‚½B(setting3‚Æƒ^ƒCƒvƒ~ƒX‚ÅŠ±Â,adminonoff‚ÆŠÖ”‚ğ“ü—Íƒ~ƒX)
rem ƒo[ƒWƒ‡ƒ“1.6ƒÀ2 ƒo[ƒWƒ‡ƒ“‹K‘¥‚ªƒx[ƒ^”ÅŒÀ‚è•ÏX‚³‚êXV‚µ‚½“ú‚ğ’Ç‰Á‚·‚é‚±‚Æ‚Æ‚È‚Á‚½B
rem ƒo[ƒWƒ‡ƒ“1.6ƒÀ3 1.6‚Ìƒx[ƒ^”Å3B‰‰ñ‹N“®‚ÉƒƒS‚ª“øF‚ÅŒõ‚é‰‰o‚ª’Ç‰Á‚³‚ê‚½B‚¿‚È‚İ‚É‚à‚¤‚·‚®1.6‚ª³®‚ÉŠ®¬‚·‚éB
rem ƒo[ƒWƒ‡ƒ“1.6ƒÀ3 1.6‚Ìƒx[ƒ^”Å‚ÌÅIƒo[ƒWƒ‡ƒ“BO‚Â‚Ù‚Ç‹@”\‚ª’Ç‰Á‚³‚ê‚½B

rem ver1.10
rem ƒo[ƒWƒ‡ƒ“ 1.10ƒÀ1 1.10‚ÌÅ‰‚Ìƒx[ƒ^”Å.BÅ‰‚Ì‰æ–Ê‚Æİ’èƒƒjƒ…[‚ÌUI‚ª’Ç‰Á‚³‚ê‚½B
rem ƒo[ƒWƒ‡ƒ“ 1.10ƒÀ2 1.10‚Ìƒx[ƒ^”Å2B İ’èƒƒjƒ…[‚ÉƒAƒjƒ[ƒVƒ‡ƒ“‚ª’Ç‰Á‚³‚ê‚½B
rem ƒo[ƒWƒ‡ƒ“ 1.10ƒÀ3 1.10‚Ìƒx[ƒ^”Å3B •ÏX‚ª“‡‚³‚êAˆê‚Â‚Ìƒƒjƒ…[‚Å”’FA•F‚É•ÏX‚Å‚«‚é‚æ‚¤‚É‚È‚Á‚½B‚µ‚©‚µ‚±‚ê‚É‚æ‚Á‚Ä•¡c‚ª‚È‚­‚È‚Á‚½B
rem ƒo[ƒWƒ‡ƒ“ 1.10ƒÀ4 1.10‚Ìƒx[ƒ^”Å4B ƒe[ƒ}‚Ì•ÏX‚ªİ’è‚ÉˆÚs‚³‚êA‚»‚ê‚É”º‚¢­‚µƒƒjƒ…[‚ª•Ï‰»‚µ‚½B
rem ƒo[ƒWƒ‡ƒ“ 1.10ƒÀ5 1.10‚Ìƒx[ƒ^”Å5B alldef‚ÉŒ±“I‚¾‚ªƒAƒ“ƒCƒ“ƒXƒg[ƒ‹‹@”\‚ªÀ‘•‚³‚êA‚±‚Ìƒoƒbƒ`ƒtƒ@ƒCƒ‹‚àíœ‚³‚ê‚é‚æ‚¤‚É‚È‚Á‚½B‚»‚µ‚Ä‰‰ñ‹N“®‚ÌƒƒbƒZ[ƒW‚à­‚µ•ÏX‚³‚ê‘S‘Ì“I‚È¿‚ªŒüã‚µ‚½B
rem ƒo[ƒWƒ‡ƒ“ 1.10ƒÀ6 1.10‚Ìƒx[ƒ^”Å6B ‚Ü‚¾–¢Š®¬‚¾‚ª‰‰ñ‹N“®ƒƒbƒZ[ƒW‚ªi‰»‚µ‚½B‚Ü‚½A‚±‚Ìƒo[ƒWƒ‡ƒ“‚Å‚Ítest‚Æ“ü—Í‚·‚é‚Æ‰‰ñ‹N“®ƒƒbƒZ[ƒW‚ª—¬‚ê‚éB(³®”Å‚Å‚Ííœ—\’è)‚»‚µ‚ÄAwindow‚ÌƒTƒCƒY‚ª•ÏX‚³‚ê‚½B
rem ƒo[ƒWƒ‡ƒ“ 1.10ƒÀ7 1.10‚Ìƒx[ƒ^”Å7B ‰‰ñ‹N“®‚ÌƒƒbƒZ[ƒW‚ª‚·‚×‚Ä•ÏX‚³‚êA‚Ü‚½ƒAƒjƒ[ƒVƒ‡ƒ“‚à’Ç‰Á‚³‚ê‚½B‚»‚µ‚Äeasteregg‚Æ‚¢‚¤•¨‚ª’Ç‰Á‚³‚ê‚½.....

rem ver1.12
rem ƒo[ƒWƒ‡ƒ“ 1.12ƒÀ1 Å‰‚Ì1.12‚Ìƒx[ƒ^”ÅB‰½‚à‚µ‚È‚¢ ƒ{ƒ^ƒ“‚ªAI—¹ƒ{ƒ^ƒ“‚Ö‚Æ•Ï‚í‚èA”z’u‚ª“d‘ì‚Æ“ü‚ê‘Ö‚í‚Á‚½B‚»‚µ‚Äİ’è‚ÌŒ‡‘¹‚ğŒŸ’m‚µ‚ÄC•œ‚Å‚«‚é‹@”\‚ª’Ç‰Á‚³‚ê‚½B
rem ƒo[ƒWƒ‡ƒ“ 1.12ƒÀ2 1.12‚Ìƒx[ƒ^”Å2Bƒx[ƒ^1‚ÅÀ‘•‚³‚ê‚½İ’è‚Ì®‡«ƒeƒXƒg‚ÌƒoƒO‚ªŠ®àø‚ÉC³B‚»‚ê‚É‚æ‚èŠ®àø‚É“®ì‚·‚é‚æ‚¤‚É‚È‚Á‚½B‚Ü‚½Aİ’è‚ğ“Ç‚İ‚Ş•”•ª‚ªÅ“K‰»‚³‚ê‚½B‚»‚µ‚Äˆê•”‚ÌƒoƒO‚â•s—v‚È‹@”\‚ªíœ‚³‚ê‚½B
rem ƒo[ƒWƒ‡ƒ“ 1.12ƒÀ3 1.12‚Ìƒx[ƒ^”Å3B‚±‚Ìƒo[ƒWƒ‡ƒ“‚Å‚Í×‚©‚¢•”•ª‚ÌC³‚ªƒƒCƒ“‚ÅAå‚Ésetting dogcheck‚Ì‹@”\Šg’£‚ÆƒoƒOC³AdogcheckŠÖ˜A‚Ì‹@”\‘‹­‚ÆƒoƒOC³‚ªƒƒCƒ“B‰‰ñ‹N“®‚Ì‹@”\§ŒÀ‚Ì’Ç‰Á‚à‚³‚ê‚½B
rem ƒo[ƒWƒ‡ƒ“ 1.12ƒÀ setting ui deb İ’è‚ÌV‚µ‚¢UI‚ÌŠJ”­‚Ì‚½‚ß‚¾‚¯‚Éì¬‚³‚ê‚½“Á•Ê‚Èƒo[ƒWƒ‡ƒ“B
rem ƒo[ƒWƒ‡ƒ“ 1.12ƒÀ4 1.12‚Ìƒx[ƒ^”Å4B‚±‚Ìƒo[ƒWƒ‡ƒ“‚Í‘å—Ê‚Ì‹@”\’Ç‰Á‚ª‚È‚³‚ê‚½Bå‚Éİ’èƒƒjƒ…[‚ÌUI‚ª‘å•‚É•ÏX‚³‚êAİ’è‚ª“ñ‚Â‚ÌƒJƒeƒSƒŠ[‚Å•ª‚¯‚ç‚êA‚æ‚è’¼Š´“I‚É‘€ì‚Å‚«‚é‚æ‚¤‚É‚È‚Á‚½B‚»‚µ‚ÄƒAƒ“ƒCƒ“ƒXƒg[ƒ‹ƒƒjƒ…[‚ài‰»‚µA‹@”\‚ª’Ç‰Á‚³‚ê‚½Bİ’è‚Ìhelp‚à•ÏX‚³‚êAdogcheck‚ài‰»‚µAİ’è‚Ìdebug‚ª‚‘¬‹N“®ifastbootj‚É•ÏX‚³‚êA‹N“®ƒAƒjƒ[ƒVƒ‡ƒ“‚Éˆê‚Âí—Ş‚ª‘‚¦A‚»‚ê‚É”º‚¢‹N“®ƒAƒjƒ[ƒVƒ‡ƒ“‚ğ–³Œø‚É‚Å‚«‚é‚æ‚¤‚É‚È‚èA‚»‚êˆÈŠO‚É‚à—lX‚È•”•ª‚ª•ÏX‚³‚ê‚½B
rem ƒo[ƒWƒ‡ƒ“ 1.12ƒÀ5 1.12ƒÀ5B‚±‚Ìƒo[ƒWƒ‡ƒ“‚Å‚ÍAİ’èƒƒjƒ…[‚Ìİ’è‚ğ“K—p‚·‚éƒƒjƒ…[‚ª‰ü—Ç‚³‚êA‚æ‚è‚í‚©‚è‚â‚·‚­‚È‚èAalldef‚Ì•ªŠò•”•ª‚Ì•s”õ‚ªˆê•”C³‚³‚ê‚½B‚»‚µ‚ÄAwindows‚ÌOSƒo[ƒWƒ‡ƒ“‚ğŒŸ’m‚µAwindows 10 1551ˆÈ‘O‚Å‚Í“®ì•s”\‚É‚È‚Á‚½B‚Ü‚½V‚µ‚¢msgbox‚Ì•\¦•û–@‚ÌƒeƒXƒg‚ªeasteregg‚É“±“ü‚³‚êA‚»‚ê‚É‚Ípowershell‚ªg—p‚³‚ê‚Ä‚¨‚èA‚æ‚èˆÀ‘S‚È\‘¢‚É‚È‚Á‚½B‚»‚êˆÈŠO‚É‚àAfulldebug‚Ì‹@”\‘‹­Adebug—p‚ÌƒŠƒ_ƒCƒŒƒNƒgƒRƒ}ƒ“ƒh‚ª’Ç‰Á‚³‚ê‚½B
rem ƒo[ƒWƒ‡ƒ“ 1.12ƒÀ6 1.12ƒÀ6B‚±‚Ìƒo[ƒWƒ‡ƒ“‚ÌƒAƒbƒvƒf[ƒg‚Í”÷X‚½‚é‚à‚Ì‚ÅA‚»‚±‚Ü‚Å‘å‚«‚È•Ï‰»‚Í‚È‚¢Bå‚ÉƒfƒoƒbƒOƒ‚[ƒhŠÖ˜A‚ªi‰»‚µ‚½Bfulldebug‚Ì‹@”\‚ª‚æ‚è‘‚¦A©—R‚É•Ï”‚ğ•ÏX‚Å‚«‚é‚æ‚¤‚É‚È‚Á‚½B‚»‚µ‚ÄAcmd‚Å‚È‚¢‚Æ‹N“®‚Å‚«‚È‚­‚È‚Á‚½B(‚»‚ÌÛ‚É‚ÍŠJ‚«’¼‚·‹@”\‚à‚ ‚éB)‚»‚µ‚ÄA×‚©‚¢C³‚ª‚³‚ê‚Ä‚¢‚éB
rem ƒo[ƒWƒ‡ƒ“ 1.12ƒÀ7 1.12ƒÀ7B‚±‚Ìƒo[ƒWƒ‡ƒ“‚ÍAå‚É‹N“®‰æ–Ê‚ª•ÏX‚³‚êA‚æ‚èƒOƒ‰ƒtƒBƒJƒ‹‚È•\Œ»‚É‚È‚Á‚½B‚»‚µ‚Ä”Ä—p«‚ª‘‚¦‚Äg‚¢‚â‚·‚­‚È‚Á‚½B‚µ‚©‚µA‚»‚Ì”¼–ÊA‹N“®ŠÔ‚ª”{‘‚µAŒ»ó‚Å‚Í­‚µ•sˆÀ’è‚ÈƒAƒjƒ[ƒVƒ‡ƒ“‚¾B‚µ‚©‚µ‚»‚êˆÈŠO‚É‚àA×‚©‚¢•”•ª‚ÌƒoƒOC³‚âA‹@”\‘‹­‚ªs‚í‚ê‚½Bialldef‚Ì©ŒÈíœ‹@”\‚ÌƒoƒOC³‚È‚Çj
rem ƒo[ƒWƒ‡ƒ“ 1.12ƒÀ7a 1.12ƒÀ7‚Ìƒ}ƒCƒi[ƒAƒbƒvƒf[ƒgB‚±‚Ìƒo[ƒWƒ‡ƒ“‚Å‚ÍA×‚©‚¢•”•ª‚ÌC³‚ªs‚í‚ê‚½BŠÇ—ÒŒ ŒÀ‚Ìİ’è‚ª—LŒø‚ÌÛ‚ÉŒë‚Á‚ÄƒGƒ‰[‚ªo‚Ä‚µ‚Ü‚¤–â‘è‚ÆAfulldebug‚Ì‹@”\‘‹­AV‚µ‚¢‹N“®ƒAƒjƒ[ƒVƒ‡ƒ“‚ÌƒGƒ‰[ˆ—‚ª‰ü‘P‚³‚ê‚½B‚»‚êˆÈŠO‚É‚àŒëš‚ªC³‚³‚ê‚½Bbuild”Ô†‚Í35‚ÉB
rem ƒo[ƒWƒ‡ƒ“ 1.12ƒÀ7b 1.12ƒÀ7a‚Ìƒ}ƒCƒi[ƒAƒbƒvƒf[ƒgB‚±‚Ìƒo[ƒWƒ‡ƒ“‚Å‚ÍAå‚É‹N“®ƒAƒjƒ[ƒVƒ‡ƒ“‚Ì•s‹ï‡‚ªC³‚³‚êA‚æ‚èƒGƒ‰[‚ª‹N‚«‚É‚­‚­‚È‚Á‚½B•Ï”‚Ì‰Šú‰»‚às‚í‚ê‚é‚æ‚¤‚É‚È‚èA‚æ‚èˆÀ’è‚µ‚½B‚»‚µ‚ÄA‹N“®Š®—¹‚Éƒo[‚ªÅŒã‚Ü‚Ås‚­‚æ‚¤‚É‚È‚Á‚½Bbuild”Ô†‚Í35.5‚É•ÏXB
rem ƒo[ƒWƒ‡ƒ“ 1.12ƒÀ7c 1.12ƒÀ7b‚Ìƒ}ƒCƒi[ƒAƒbƒvƒf[ƒgB‚±‚Ìƒo[ƒWƒ‡ƒ“‚Å‚ÍA1.12ƒÀ7b‚ÉŠÜ‚Ü‚ê‚Ä‚¢‚½•Ï”‚Ì‰Šú‰»‚É‚ ‚Á‚½ƒoƒO‚ªC³‚³‚êA‚æ‚èˆÀ’è‚·‚é‚æ‚¤‚É‚È‚Á‚½B‚»‚µ‚Ä‚»‚êˆÈŠO‚É‚àŠÜ‚Ü‚ê‚Ä‚¢‚½ƒoƒO‚àC³‚³‚ê‚½‚Ì‚ÅAå‚É‚±‚Ìƒo[ƒWƒ‡ƒ“‚ÍƒoƒOC³ƒo[ƒWƒ‡ƒ“‚Å‚ ‚éBbuild”Ô†‚Í35.7‚É•ÏXB
rem ƒo[ƒWƒ‡ƒ“ 1.12ƒÀ7d 1.12ƒÀ7c‚Ìƒ}ƒCƒi[ƒAƒbƒvƒf[ƒgB‚±‚Ìƒo[ƒWƒ‡ƒ“‚Å‚ÍAfulldebug‚Ì‹@”\‚ª‘‹­‚³‚êAV‚µ‚­•Ï”‚ğì‚è‚â‚·‚­‚È‚èAíœ‚â•ÏX‚È‚Ç‚à‚µ‚â‚·‚­‚È‚Á‚½B‚»‚µ‚Äeasteregg‚ª‹¥ˆ«‚É‚È‚Á‚½....build”Ô†‚Í35.8‚É•ÏXB
rem ƒo[ƒWƒ‡ƒ“ 1.12ƒÀ8 1.12ƒÀ8B‚±‚Ìƒo[ƒWƒ‡ƒ“‚Å‚ÍAŒ±“I‚ÉAƒEƒBƒ“ƒhƒE‰Eã‚ÌA•Â‚¶‚éƒ{ƒ^ƒ“‚©‚ç‚ÌƒJ[ƒ\ƒ‹‘Ö‚¦‚ÌI—¹‚ª‚Å‚«‚È‚­‚È‚Á‚½B‚±‚ê‚É‚æ‚èA•s³‚ÈI—¹‚ª‚Å‚«‚È‚­‚È‚Á‚½B‚»‚µ‚Ä‚»‚Ì‹@”\À‘•‚É‚Í“Áê‚È•û–@‚ğg—p‚µ‚Ä‚¨‚èA‚æ‚èÀŒ±“I‚ÈˆÓ–¡‡‚¢‚ª‚ ‚éB‚»‚µ‚Ä×‚©‚È•”•ª‚Ì’²®‚ªs‚í‚ê‚½Bbuild”Ô†‚Í36‚É•ÏXB
rem ƒo[ƒWƒ‡ƒ“ 1.12ƒÀ8a 1.12ƒÀ8‚Ìƒ}ƒCƒi[ƒAƒbƒvƒf[ƒgB‚±‚Ìƒo[ƒWƒ‡ƒ“‚Å‚ÍAŒ»İŠJ‚©‚ê‚Ä‚¢‚éconsole‚ÌŒŸo‹@”\‚ª”rœ‚³‚ê‚½B‚Ç‚¤‚â‚çconsole‚ÌŒŸo‚Í•sˆÀ’è‚ÅA‚»‚Ì‚Ìó‹µ‚É‚æ‚Á‚Ä¶‰E‚³‚ê‚é‚©‚çBbuild”Ô†‚Í36.1‚É•ÏXB
rem ƒo[ƒWƒ‡ƒ“ 1.12ƒÀ8b 1.12ƒÀ8a‚Ìƒ}ƒCƒi[ƒAƒbƒvƒf[ƒgB‚±‚Ìƒo[ƒWƒ‡ƒ“‚Å‚ÍAinspect entire command list‚Æ‚¢‚¤ƒRƒ}ƒ“ƒh‚ª’Ç‰Á‚³‚êA‚±‚ÌƒRƒ}ƒ“ƒh‚ğg—p‚·‚é‚ÆƒƒCƒ“ƒƒjƒ…[‚Åg—p‰Â”\‚È‚Ù‚Ú‚·‚×‚Ä‚ÌƒRƒ}ƒ“ƒh‚ğ‰{——‚·‚é‚±‚Æ‚ª‚Å‚«‚éBg—p‚É‚ÍƒpƒXƒ[ƒh‚ª•K—vB‚»‚ê‚É‚ÍŒ±“I‚È‹@”\‚Æ‚µ‚ÄA6F‚ÌF‚Å•\Œ»‚³‚ê‚Ä‚¢‚éB‚»‚êˆÈŠO‚É‚à×‚©‚¢•”•ª‚ªC³‚³‚ê‚½B build”Ô†‚Í37‚É•ÏXB
rem build 38 ƒ}ƒCƒi[ƒAƒbƒvƒf[ƒgBpowershellŒo—R‚Å‚ÌC#•¡”sÀs‚Å”­¶‚µ‚Ä‚¢‚½•ªŠò‚ÌƒoƒO‚ªC³B‚»‚êˆÈŠO‚É‚à×‚©‚ÈƒoƒOC³‚ªs‚í‚ê‚½B
rem build 39 ƒ}ƒCƒi[ƒAƒbƒvƒf[ƒgBV‚µ‚­ˆø”‚Éenablesimpleboot‚ª’Ç‰Á‚³‚ê‚½B«—ˆ“I‚ÉAİ’è‚ÉŠÜ‚ß‚é—\’èB‚»‚ê‚É”º‚Á‚Äiecl‚Æˆø”help‚à•ÏX‚³‚ê‚½B
rem ƒo[ƒWƒ‡ƒ“ 1.12ƒÀ9 1.12‚Ìƒx[ƒ^”Å9B‚±‚Ìƒo[ƒWƒ‡ƒ“‚Å‚ÍA×‚©‚È•s‹ï‡‚ªC³‚³‚ê‚½B‚»‚µ‚ÄAsetting‚Ì“Ç‚İ‚İ•”•ª‚ª•ÏX‚³‚êAgoto‚ğg—p‚µ‚½•û–@‚©‚çcall‚ğg—p‚µ‚½•û–@‚É•ÏX‚³‚êA‚æ‚èˆÀ’è‚·‚é‚æ‚¤‚É‚È‚Á‚½B‚»‚êˆÈŠO‚É‚à×‚©‚¢•”•ª‚Ì•s‹ï‡‚ªC³‚³‚ê‚½B‚¿‚È‚İ‚É‚à‚¤‚·‚®1.12‚ªŠ®¬‚·‚éB
rem build 41 ƒ}ƒCƒi[ƒAƒbƒvƒf[ƒgBI—¹ƒ{ƒ^ƒ“‚ğ–³Œø‰»‚µ‚Ä‚¢‚½‚Ì‚ªAÅ‘å‰»ƒ{ƒ^ƒ“‚Ì–³Œø‰»‚É•ÏX‚³‚ê‚½B
rem ƒo[ƒWƒ‡ƒ“ 1.12ƒÀ10 1.12‚Ìƒx[ƒ^”Å10 ‚±‚Ìƒo[ƒWƒ‡ƒ“‚Å‚ÍA‰pŒê–|–ó‚ª’Ç‰Á‚³‚êA×‚©‚¢ƒoƒO‚ªC³‚³‚ê‚½B‚ ‚Ü‚è‘å‚«‚È•Ï‰»‚Í‚È‚¢B‚»‚µ‚Ä‚±‚ê‚ª1.12ƒÀ‚ÌÅIƒo[ƒWƒ‡ƒ“‚É‚È‚é—\’è‚¾B

rem ver1.13
rem ƒo[ƒWƒ‡ƒ“ 1.13ƒÀ1 Å‰‚Ì1.13‚Ìƒx[ƒ^”ÅB‚±‚Ìƒo[ƒWƒ‡ƒ“‚Å‚ÍA‰pŒê”Å‚Å‚Ì‰p–ó‚ÌC³‚ÆAƒEƒBƒ“ƒhƒEƒY‚Ìƒo[ƒWƒ‡ƒ“‚ğŠm”F‚·‚é‹@\‚ª­‚µ•ÏX‚³‚êA‚Ü‚½‰pŒê”Å‚Å‚Íeasteregg‚ª‰ğ•ú‚³‚ê‚½B‚Ü‚½AƒoƒO‚àC³‚³‚ê‚½B‚Æ‚è‚ ‚¦‚¸Aå‚É‰pŒê”Å‚Å‚ÌƒAƒbƒvƒf[ƒg‚É‚È‚éB
rem ƒo[ƒWƒ‡ƒ“ 1.13ƒÀ2
rem 1.13‚Ìƒx[ƒ^”Å1B‚±‚Ìƒo[ƒWƒ‡ƒ“‚Å‚Íå‚É“ñ‚Â‚ÌV‹@”\‚ª‚ ‚éB‚»‚ê‚ÍAI—¹ƒƒjƒ…[‚ÆV‚µ‚¢ƒo[ƒWƒ‡ƒ“•\¦UI‚¾B‚±‚ê‚É”º‚¢A¡‚Ü‚Å‚Íreload‚ğ‚µ‚È‚¢‚ÆÄ‹N“®‚Å‚«‚È‚©‚Á‚½‚Ì‚ªA‚»‚Ì‚Ü‚Üƒƒjƒ…[‚©‚çÄ‹N“®‚Å‚«‚é‚æ‚¤‚É‚È‚Á‚½B‚Ü‚½A©ŒÈƒAƒbƒvƒf[ƒg‹@”\‚àV‚µ‚­‚È‚Á‚½ƒo[ƒWƒ‡ƒ“•\¦•”•ª‚©‚çƒAƒNƒZƒX‚Å‚«‚é‚æ‚¤‚É‚È‚é—\’èB‚Ü‚½A‘¼‚É‚àƒoƒOC³‚È‚Ç‚ªs‚í‚ê‚½B


rem ¡Œã‚Ì—\’è (roadmap)

rem ƒR[ƒh‚Ì‡”Ô‚ğ•ÏX‚µA“Ç‚İ‚â‚·‚­‚·‚é
rem ‰½‚à‚µ‚È‚¢‚ğI—¹‚Ü‚½‚Í‰½‚©‚µ‚ç‚É•ÏX
rem İ’è‚ÌUI‚ğ‘å•‚É•Ï‚¦‚ÄAƒJƒeƒSƒŠ[‚É•ª‚¯‚éB‚»‚ÌƒJƒeƒSƒŠ[‚Ì’†‚Éİ’è‚ğ“ü‚ê‚é
rem ƒZ[ƒuŠÖŒW‚Ìƒtƒ@ƒCƒ‹‚ğ•Û‘¶‚·‚éƒfƒBƒŒƒNƒgƒŠ‚ğİ’è‚Å•ÏX‚Å‚«‚é‚æ‚¤‚É‚·‚éB
rem %Settingsfile%‚ÉŠÜ‚Ü‚ê‚Ä‚¢‚éİ’è‚ª‘S•”Œ‡‘¹‚µ‚Ä‚¢‚éê‡‚ÍA%Settingsfile%‚ğì¬‚µ‚È‚¨‚·‹@”\B
rem İ’è‚Ì‰Šú‰»iƒAƒ“ƒCƒ“ƒXƒg[ƒ‹ƒƒjƒ…[‚ğ‰Šú‰»‚Æ‚©‚Ì€–Ú‚É‚·‚éj
rem 1.12À‘•

rem ver 1.13 23”NH–¢’è
rem ‰‰ñ‹N“®‚Ì‰Šúİ’è‚Ì’Ç‰Á (İ’è‚ğƒ†[ƒU[”CˆÓ‚ÅƒZƒbƒgAƒe[ƒ}‚È‚Ç‚à)
rem –¢g—pƒR[ƒh‚Ü‚½‚Í–³‘Ê‚È‚à‚Ì‚ğíœ‚µ‚ÄA‚æ‚è‰Â“Ç«‚ğã‚°‚éB
rem 2048‚ÌÀ‘•
rem ’P‘ÌƒAƒbƒvƒf[ƒg‹@”\
rem I—¹ƒƒjƒ…[ (Windows XP•—)
rem ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹ƒƒjƒ…[‚ğŠ®¬‚³‚¹‚é

rem ver 1.14 
rem ‚æ‚è”hè‚ÈƒAƒjƒ[ƒVƒ‡ƒ“‚Æsetx‚ğ—p‚¢‚½‹N“®‰ñ”‚ÌƒJƒEƒ“ƒg‚ÆA‚æ‚è—Ç‚¢“d‘ì

rem ver 1.15 
rem F‚Å‚í‚©‚è‚â‚·‚¢Iƒ`ƒ…[ƒgƒŠƒAƒ‹‚Æ‚æ‚èi‰»‚µ‚½dogcheck (samƒ`ƒFƒbƒN‚Ì‚æ‚¤‚È‹@”\‚ğÀ‘•)

rem ver 1.16 
rem ‚æ‚è—Ç‚¢‰‰ñ‹N“®‚ÌƒƒbƒZ[ƒW‚Æ”hè‚ÈUI

rem ver 1.17 
rem ‚æ‚è‘½‚­‚Ìİ’è‚Æ‚æ‚è—Ç‚¢ˆÀ’è‚µ‚½ƒvƒƒOƒ‰ƒ€

rem ver 1.18 
rem ƒJƒXƒ^ƒ€ƒJ[ƒ\ƒ‹‹@”\

rem ver 1.19 
rem ƒQ[ƒ€‚Ì’Ç‰Á‚ÆƒJ[ƒ\ƒ‹‘Ö‚¦ƒvƒƒOƒ‰ƒ€‘S‘Ì‚ÌƒŠƒtƒ@ƒNƒ^ƒŠƒ“ƒO

rem ver 1.20 (2.0) 
rem .....???

rem –¢’è 
rem ƒ`ƒ…[ƒgƒŠƒAƒ‹‹@”\@‚¤‚Ü‚¢‚±‚Æ‚â‚Á‚ÄA‰‰ñ‹N“®‚É‚Ì‚İ‹N“®‚³‚¹‚é(‚ ‚Î‚æ‚­‚Íreadme‚Ì‘ã‘Ö‚É‚µ‚½‚¢)”‚¤[‚ñBˆêl‚Å‚â‚é‚É‚Í‘å‹K–Í‚·‚¬‚é
rem UI‚Ì•”•ª‚ğwasd‚Ü‚½‚Í12345‚Å‘I‘ğ‚µ‚ÄAe‚Æ‚©‚Å‘I‘ğ‚·‚é‚æ‚¤‚É(İ’èƒƒjƒ…[‚Æ‚©‚àB”‚Ù‚Ú‚Ù‚ÚŠm’è‚ÅÀ‘•‚·‚é‚¯‚ÇA‚½‚¾‚©‚È‚è“ï‚µ‚­‚È‚è‚»‚¤‚¾‚©‚çŒ»“_‚Å‚Í–¢’è
rem ‚·‚×‚Ä‚ÌUI•”•ª‚ğ•ÏX(alldef‚âwmode‚Æ‚©‚à‚·‚×‚Ä‚É‚¨‚¢‚Ä)”‚Ù‚ÚŠm’èA‚½‚¾ƒI[ƒo[ƒz[ƒ‹‚·‚é‚Æ‚¢‚¤‚æ‚è‚ÍŒ»İ‚ÌƒƒCƒ“ƒƒjƒ…[‚É‹ß‚µ‚¢UI‚É‚·‚é‚Æ‚¢‚¤ˆÓ–¡‚¾‚Æv‚¤B
rem fulldebug •Ï”î•ñ‚ğ‚·‚×‚Ä•\¦”‰¼‚¾‚¯‚ÇÀ‘•Ï‚İB
rem ‰Eã‚ç‚Ö‚ñ‚ÉƒŠƒAƒ‹ƒ^ƒCƒ€‚Å•\¦‚³‚ê‚éŒv”–³—B•s‰Â”\‚¾‚ËB‰¼‚ÉÀ‘•‚µ‚Ä‚à‘€ì«‚ª‰üˆ«‚³‚ê‚é‚©‚ç•Ê“r‚»‚êê—p‚Ìbatƒtƒ@ƒCƒ‹‚ª•K—vB
rem í‚É‹N“®ƒAƒjƒ[ƒVƒ‡ƒ“‚ğÄ¶‚³‚¹‚é”À‘•Ï‚İB
rem İ’èƒƒjƒ…[‚Ì‘s‘å‰»AƒIƒvƒVƒ‡ƒ“‚Ìbatƒtƒ@ƒCƒ‹‚Ìg—p”2.00‚Å—\’è‚³‚ê‚Ä‚é‚¯‚Çã‹L‚Ì’Ê‚è‚«‚Â‚¢
rem ‰pŒê‘Î‰@‚µ‚©‚µŒ»À“I‚Å‚Í‚È‚¢
rem ã‚Ì‚ğÀ‘•‚·‚é‚É‚ ‚½‚Á‚ÄAˆê”ÔÀ‘•‚µ‚â‚·‚¢‚Ì‚Í•Ï”‚ğ—p‚¢‚ÄA‚à‚µ•Ï”lang‚ªjp‚Å‚ ‚é‚È‚ç‚ÎAŠÖ”jp1,2,3,4,5,6,7,8...‚É“K“–‚È•¶š‚ğ‘}“ü‚³‚¹‚é‚Æ‚©‚¾‚ë‚¤‚©B
rem ‚µ‚©‚µ‚»‚ê‚ğs‚¨‚¤‚Æ‚·‚é‚Æ¡‚±‚Ìƒoƒbƒ`ˆ—‚ÉŠÜ‚Ü‚ê‚Ä‚¢‚é‘S•¶š‚ğ•Ï”‚Ì–¼‘O‚É‚µ‚È‚¯‚ê‚Î‚¢‚¯‚¸AÀ‘•‚·‚é‚Æ‚µ‚Ä‚àv1.10ˆÈ~‚ÌÀ‘•‚É‚È‚è‚»‚¤‚¾B”....‚Ü‚ŸŠæ’£‚é



:Core_Powershell
if exist %Settingsfile% (find "PlaySound=false" %Settingsfile% > nul) else (exit /b)
if "%1"=="1" (set Core_Powershell_Playsound_Name=Base64ID_Sound_Tada) else if "%1"=="2" (set Core_Powershell_Playsound_Name=Base64ID_Sound_Shutdown)
if not %ErrorLevel%==0 (if %1 geq 1 if %1 leq 2 (start /b /realtime powershell -NoProfile -ExecutionPolicy Bypass -Command "[System.Reflection.Assembly]::LoadWithPartialName('System.Media') > $null; $file=\"%~dp0%~n0%~x0\"; $lines=Get-Content -Path $file -Encoding UTF8; $index=($lines | Select-String -Pattern '%Core_Powershell_Playsound_Name%$').LineNumber; if ($index -and $index -lt $lines.Length) { $b64=$lines[$index].Trim(); try { $bytes=[Convert]::FromBase64String($b64); $stream=New-Object System.IO.MemoryStream; $stream.Write($bytes, 0, $bytes.Length); $stream.Position=0; $player=New-Object System.Media.SoundPlayer; $player.Stream=$stream; $player.PlaySync(); $stream.Close(); $stream.Dispose() } catch { Write-Host \"Base64‚Ì•œŒ³‚©AƒTƒEƒ“ƒh‚ÌÄ¶‚ÅƒGƒ‰[‚ª”­¶‚µ‚Ü‚µ‚½B: $^($_.Exception.Message^)\"; Write-Host \"‰½‚©ƒL[‚ğ‰Ÿ‚µ‚Ä‘±s...\"; $null = $host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown') } } else { Write-Host \"ƒ}[ƒJ[ '%Core_Powershell_Playsound_Name%' ‚ªŒ©‚Â‚©‚ç‚È‚©‚Á‚½‚©Aƒ}[ƒJ[‚ÌŸ‚Ìs‚Éƒf[ƒ^‚ª‚ ‚è‚Ü‚¹‚ñ‚Å‚µ‚½B\" }"))
if "%1"=="3" (powershell -command "$parentProcessId = (Get-CimInstance -Query \"SELECT ParentProcessId FROM Win32_Process WHERE ProcessId = $PID\").ParentProcessId;$processGroup = Get-CimInstance -Query \"SELECT ProcessId FROM Win32_Process WHERE ParentProcessId = $parentProcessId AND Name = 'powershell.exe'\";$processGroup | Where-Object { $_.ProcessId -ne $PID } | ForEach-Object { Stop-Process -Id $_.ProcessId -Force }")
set Core_Powershell_Playsound_Name=
exit /b

rem Base64 Encoded sound data :

:: Base64ID_Sound_Tada
UklGRvJPAABXQVZFZm10IBAAAAABAAEASD8AAEg/AAABAAgATElTVBoAAABJTkZPSVNGVA0AAABMYXZmNjEuMS4xMDAAAGRhdGGrTwAAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAf4B/gH+Af4B/gH9/f39/f4B/f4B/gIF/fn9+f3+AgYB/f359fX+BgX+AgoOCgn99fH19fXx+f317fHt5enx9fHx7enl8gYWEhYeGhoeIhYOCgX9+fYB/enp8enh8gIF9fH1/f4KHhH+AgH18fXt2cnN0eHh7f31/hIOBg4eKh4SCf319hIaBhIZ8eH2DhX98e3l4en56d3t9eHV4gIN8eHp7fYSIhoeLhXx8gYOBfnx8f4KCfHmAhn94e3+Bf35/fXh6gHt7hYV3cnuFhoJ/gH19goB2eIB9eXp9goSAfH+AhImEgouNhHx8fnx3dHBudoWGenuFiYB9gIB/f399e36Hhn6BioZ3c36EhHxzc3aDioWCg4R7dnZ4fH51bXJ8iIiMlJSMf3yBgX56cmtugY2GioqFfXR1eHV1eXZ1d359hJSNhn52fYWIiYN8eoCGfYOHd3R1e3x5gIV+eHuEgXySl4R+dnd7eHVzbGVufnl2ioh7fn6Dh4iLiYJ9gXx4gpeRgIB+gomLhHp5f4F4cHiGemtydXd9gYGCgIB7dYCTn5B9e36BgH16eH2Ce3aEjY6Dcm9vdX6EhISEenF6hoqTiXWAiYeJhHx/gnpyc3R2hYR0cneDi4mXpo94dnyBh5aLdXJ2eHRsbn17cG1+jomQh29wfIuRj5KNfXh4dHiCh3yDmo6Ae3l6d3RxbGp1iY51aXF9eXaInJB5fX19jKKchoOCgn+Ag397dXF0hpyScGRndIOCg4aHiYd6cnR/gXJ3iJiMfH94dHt4b3F7kIx+hoeFfHt+hJeeg3J2go97bW50dnl/dWxoa2xzfJKYeG14jZWSh4KPloh9goaMd3J4hpiop3xrcWxcZXSLi3F1dn96b2NofImGhYSGqJN8d32OjIqDh4JvYGp6jox2iImAgHZoboudiXV5gIpsZ3R5jIiIiZaRem52eIeKcoSNoJx2Y2l7gnuDlJ6fbWdzcYqPgW1udmxfb4GbhGB9jayvkHx7g4yDgI6fp2ZRX26LiH9+lJdyWWhvioZpfYSWk3NkcntyXGqDqNSQdpKXl5GIfoyMcV9wd5OCYXd7jpZpSV5sbmqAlp+rg3R0hZaJeHSDk6WQhoKQfnCJi5yQcGx6dnhwe3Z/o5eBZGl8h3FbbXZiW29wno55npKVpZtpeYt/eYyQoLN0bYOEjIJmZXh4kZ12c5R8YXyEmJVmVHB5a1FfZXOOg4KOtb2of36NhGhogX6ekHGUmJCQj2Fdbk5LdX6YwXp6oJ+pimRqdnVzk3RkmXhdhIqPk2dagZJvWHBvgJOEpX+Ou4dib393bWhueZ6LcqazsaKMeFV1d2l6iKOSUVpreKmDSVhsdHSosnSPdGeKiq2hem+CfnJ1d3mIfVWTcmWtrKianIZuaHOGknR0f2yIfW6KbE9XW2l4lZWCfmmMmpOPjoN1hZOedolzgYuDp4pwZ3iJlYl5dHtrbqGKdoR3dHllWm1uXWyHc4+Aoq51e5OJT3aOmqm1h3F6Yop+cHNzZF13ksa8gXeBYomli35zb15jcXB1hE9cbYF+WXymrYSHjYBzk5KOpnWIgnJ9kpJRVmxwjZ+GqntukGhuh5aAdYCKiptYZodskXl1gnRke499d4qIXHp6rrRha3qJgXaFhGt4XXmKi8CfeoWDeXVqiJKolnWAYXFtWmRoZ2RkcpK4tGh6g4mcgZOpjmJjdYqFlHJnaFeEf2N8p42KiIaGk4xykX6Ng2t7g3lra2JsepRxlJVqeWVneYmEnZyJfpiTd3pxl4VwgYt8aouZgImJXn51gpyDcWJvbH6Je2x6Xmd3dKCcjYaOfnWGio+yoHWMeYR8YGdmZ2B0i4GMtIqCd3KYhomZmn1jZXiAkX1hdWNzcmxxfIxvgp6MhpeAj5GFineCjY18bnR1c4+DeKaVempganeAeIynkH2BcYJ1cYFweIiJeXaLhXyMdnGKipGJhnplcHN7lI9/bF1ze4eTmZKHiH99jomIn4R0gISAa2hmY2FfbomQnJB0hHyEjoeOmpl/b3V6h4ltb3d9f3B8hoSDdHSImpx9dIeLiHNzfoWDd3F7eHyFdn6Qknlpc3p8eXiFj5GReXmJgnx4eX+HiYKJjn2DfHF8go2Ifn98b252en2JhmlqdIGHg4OAg4iJh4uKjod6eoOPgHNxcXFvb3eDmp59dYCJhH+EiYyGenZ2eoR0a3F7h3x4gIh9cXd9iJqPen6BiYF3fYOCfXt9gIKCfIOJjIl4dXl4d3h7fH2MiXt8f4J4d3+ChIOEh359hHp6eoiRgnp8fXR1e3h7i4V3dXyNjIR+gISEgoOIi4J2d3iFjHpxcXR0dHZ5hJaNe3yFioCBiYqEfXt8fYB7cHJ2g4eAgImJeHR7fYGLi4R+eoJ+e39/enh8f4KBfX2DgoWHgHx6e319end+hoaDfX5/fH+AgoeHiIR/gn54dnuIiH55fHp1eHh1fYWBf3t/iIZ/fYGCf4KHi4Z5eXt9h4Z6dnl5eHp8gIiIg4KBhIB/hYWCfXx+foB9dXV2eoKDf4CFf3d8f3+Dh4iEfX6BgH9+e3p8f4GFg32BgYCEhH96e318e3h7f4CCgHyAf36AgoGBhYOAg4F8e3yCg357e359enl6foGAg4OBhYWBf4B/e3+DhYV9eXp9gYJ+e3t8e3t9f4SCfYKDgoKBgoKAfX1/f4CAenl6e4CDgoGCgH18fX6BgoKCf4CBgIB/fHl5fX+Dg31/fn6DhYJ+foB9ent8gH5+f36Bgn+AgoKBgoF/g4F8fH2Ag4B9e3x9enh4fH99gYOChYWBgIGAe32Cg4N+en18foKCgH19fnx9gISAen6DgoCDg4F/fnt8foCAeXZ6fn9/g4WCf39+fHyCgoB/gYWBgIKCf3x6e32Bg4F+en2CgYGBgH59e3l5fHx5eHyFg36BhIOCgoGAgoN+e32Chn99gX97eXp5eXx/gICEjIh8f4SBenqAgX9+fXp2eYB9eX+Bfn19gIJ/f4GAf4aKgX2DhX59gH98e3t5d3uHiIGBgoB/f317enp8e3yCiYB5gIB5eHx+fHx/enZ7h4mChoyGgIGBfnt7fHp5f4mGgISIfnd7f3x6gIJ4cXyIh4KFgXp7fHpzcXR2eHqChYiHhYKBhYeAe319e3uDh4mLhoB6f4iDdXN4eHZ5gn6DioF6dX2DfHR2fH97fYGAj4t6dnaAhn14fH18fIJ8g5qJd3d+iYV5eHp4eH1/eIiVfG5ueIaAeX2Dg3+Ae3aNk3Vvdn6Bd3N3gIKDfniCmZp7dn6Dg3p3e39/f3RxgpeRdXiEhH10cnh9hYJ3eoWQjHZ2gIB6dnuDhoJ0bHeDioR1en58fn+FjZSJd3qKjpCQgH59d3V0dHR1aWN1iYuNkYSDgHl6fICIhXBnbnN0go2DhoyNj46QlIh4eHt5d4eOenBvcXmAh4Z3cXV3d4GZnImCeXV2c3VvZmp0dXeLoJKBfoCJjJWXh32BfXV2hI19eXqAiIWGe25vcWtpcoWEc3V7hoiJin6Dkoh5d36Qhnh6eXl5gnpwd395c3iRqo54dHeAhYl8dHZzaWlugIR0c3mMoayagnt5cG5zfI2AdHJ1f4WEdW97jIZ9fY2SgoF/g359eW9wdXBpbHiVmZeHdoGIhH2Ej4+AenuFi3p0anKAio5+cnNwaG12iIJ4fH2MmZF5cXqEhYuRkI9/f4CEi4V5bnF3dnR5eoqHfISGiouGenZ7e3Bvd4OOfXZuc4uWlo6Ymn5ucneIgnN7eoiYlH5tbW9sbnCLsZmEgoCIg3hxcXR3c2pleoB4fICXs6aGhYqJhIWGiZSGfnRxf4F5bnN/hoVtZHh3a3eNoqWahnRxcW51doWblpiFgo6Ccm11dnJ1d3KKind2cIKNmZqCfXhte4WKjHd2c3SGkIyBf4iHlJh3iYBueYCNlJSLgXVvZWlkb4V0kqiMjX5lbX11a3l7cYmEdX53fYqIpLiWg3F5g46LcYKCeYN8bGVqZV5pi5V9bmZ1gZOZjpCOgnZygXuLjHSSta2GcmFsfndxlp2MjnV+j2hlY1VolpZvgHxwkoNsinx3f3B4iYN7fomMu6hhhYJ9moRtfod1dYV/eIFlZXVwrI5YamhlaXyHg5KIbpSMi4lnaHyWqomLpJmbdIiTiaB+c32Gb1VaZWmPkGCDgYt2WnmLfV9pgY6qmlh/go68n2puf19ke4eHp36NqYCcakdUam2Bl3V6mpVsl4WPkmN3jYhwb3R5f5+YoH92mWpjd4Btb3mJhZWJaYxkipaEbFxuXWuGpK6ydYeIiaxzWmVxdZe3kXKbd26fhpV5VmmAd3FqaHB6imyTYGmQYnCSnHt0coKDnYiCmYuwi4ijgmloaoikspdnh3yXl2VSWlhQZH+KZHladYuYvIRmb4SAkpKGgpWHga+Xo5h0eYd8c3JqboCMdZN0f52DfYZhOVRbeJOwhnx6d6yRfm1mWl10lbOrkGp/dp6mjoZ7dm18gHiCkmmCipSWd25uhn5+gnhzlX1zelF+bW6KnJBjbXFzlaCDpoGJlneEe3BqdomQnp5HX3FomHyJpZ6BdIyZfIZ2WYJ3taFod2tkYniOfnV/T3ZwbJZ+gpCdkF1dgIKihISfcZaOhpZ9X116kIqvvGh/cnuLcomKeWRYY2toj3BzhHarfmCBi31qfJOClZl6o4aBd1lnco2ZdXOJma57kJqHkW9xe25haHqCd558QGRsgGlifn56g4+rpJiLX4GHl7aSfI2IZV+BjXeDYm2Tf31xfoh7fI93Z3yVfFZ6bm94epSVeGBjeYSOt513fpaXeIibiHJzc3hrfHJhe4Gesah7fY9wX3h9eoNmf4+KeVlbXmdwiYBoiKZ5fKakmXt+kpJ6a3OIipWQeGdfjHJQcY2IcHaXp5WTcXJ4hZmPmHN4fVpbgYV9YlBweol7fImDg36Xn3yXn2JxfH93ZoCUlH6Bj4uDnouOeXKsfWWGkXNUWm5ycmZSaWWNlYmjjJaZdW2Dj45md5CboG1nbGppYn2LgbeqbYaaroNng5GKbm1ybHyMY3ljaZRdUm96ZF+Aoa6sg3iFfKeYjqJ/gIZwb32Le1h8iJmPand1dHd7kZCHqHNPYm1+V1t9johzeX59n6GAmHWTr3l6mJltWmJvjI9VV2N4sJ6ipYiOiHN3h5FrWnt5mIFbZWhmW2B9cn6pgH2Prqx2fIyRhXuDe3SOdXiTZoaJY3OZkFpYc3+ioHaAeJOpfYSIaG13bG2HkV9ccHmhi3R4e3x0fZ2Pn6ZwZmuUhlVfd4uNlZyLkqJ2f4tylJF4e417UlRdZolvWGdiiJKBpLCQi4yDgqCOXXFvgJZ1a3V5bmR3mZSelYaBiK6Rc36GiHNqbWl8b1d5f3aOg2driH5ibnKJooSHgpC0oYOSimZtfHaBqop4hXiTl29eandvaH+al4B5e1xzkWpUZnh6bnyIn7KGgJCXkI2RiIiPd11kbIh2YXBwlqaNgqKkc3KLfpKicWVcZYF8YltlbWhteJCZbYufiaSzlH2Llox3cWuIf19pb42LkZiFfIV7al1yjXJ/g4ScmoZ5joJTWG53o5RycHGVppJsY3JzaneGr5lmiIF7j45wZ4KPfnd7kKx9c3mGooyHfnR7fW1fXX5zYHZodYqSjI2nlG2BiJWri4BnZn2CeWFdamp4i5GzgW+Qf4ulq4yBk492bGBveVVcUW6ThYN+gpCRg21ykXRwgoWZnJWGg5qAVGRvna+Vim+IoJl8YmJnY3BzhZ5iY3N0gYqGbXCAdnF8iKeNeIZ6mKqVhXZyfIB/bHuEaoWGgoSKkIqKk3pjeIWlk4ZxWGx3dltLVl5hb3ecq4CDgoqeuLCTmaCIenFzgl5eX2SSrI92eH+LiXdhfnloe3iLj419c4CKYkpdeIiAmoyHmaKYf3Nya214fpiGa2x4iI6imYuJgm9yfI6GZW9re5qzkG5tZWR4d2t0YGt1d4mTmIaDjZWAb4GmmYyYeXB4i3pjYWxwcG19mJGGbnmEkqikoJqLdnFyfF5KTExkgpx7dIqHgIyFhYd1hoWLlJyOdX2IiHRng5dueZOSjpCZfnJuaWZoan56c2tVcXuGjISDgn9+hJKRc3t3eYupuIR0emhkfIeOgICHe4SJmYhxen9/cmOJm3mFh3ttdHtdWFdSWGFvj4+ZjXmUnqSlrK+ch3t5jXtdZGJ1fZOXa3CDdG99hoJofIWEi4ySdmdsa25jVn17aIObqJmgnYaJg3RxbHl8cIduZYScpZiUjX55eX+RcWRqZnuJqKFzbXBZUGSEdl1wcYKXop5/eYiMk4N/nYmAhI6Qg4d+doBxV1higH18k3h1iZaRkaeqkHpufn5VUk1RYHOUknh7fnNyj6mKhJGMkpqcinZ1fIOPfXh8b3V5k52akXpvenppYGp3YW9+YVx1hnh4jpWLgoCWkXx8eIWRnaaXeXh3ZV+Jp4Z4cXWKop19bHF0dH9/iH54eHaLjYBsX19kW05UeoNxi5aLkayumJiqqpV6gJGAgndnZ21/kIpxbmleYouIfoiAiJOgjm1dXWBobW9vbYB/hJusrZiHh4+HamZ8a2yHj4eKlYVxeZGZjnaEi3t3ZW1/iZCZhWppYEdRd3J3c25/mK2XeXR+hpGhpIV8gHSDnKmkjnVta2VQZnlkcYSMeoWclYOHmqOMdnpfY2ZVWGJxg5uLc3VuYoKVmqmXjJCgqpV7fH10boJ6YHyBeoOXpp6EcXZ8cF1vYVpkbnZmd39uX3SXo46Pi4CVkI2TmJGRmoR1hHludmh7hn59h5ich2lkbXN/o35ugXRvc4OGgm9gYGhib3lkb3OMlo6mtaSHiZ6moaiIfn5vZ2VwdoeSfG5yXmZobI2RkIiNlZV7V1NfWGiEYXGKg4GLoKmtnI+SiXV7Z2R+hZeNeX+EcGB1kY+Xj3B/hoqGh4h/g4VsYFtQXU9bdoWRjpGUmINnboGFqqt+h4yOkp2blY91aG9rcHxhZWhsiImDj5uDcX6NjJZ3XGpnaWJsd4KNi3p1cHJ6couZoqOcorC3kWtoZVx7eml7gH99ipCgpYx/f3FyaE1UU1x2emhxf3BvgISMnYWBkp2mo6KXlJWdkXpoZ1tTaXmVm5KGio5zYWxudZCHd3Z6dHB2dIF6aGp2e4dzZ3FteI6bjqGmiIOXpLatgXd1dnNzeXuCfX93aGx1ZW15gY+MiX2JhWlfYFdidXx7eIWCh4yUr6+hmIyIjX56cWlvg4FofYRxdXt5ioB3hY+Zl5mNhoBtcGlUXFVBVWiHoKSWhJKJcnN3gIuJl5SaopOQhYWJeHN6f4h0Z2xocHSQkXuMhGpsb3uIe3drbXN4hnyBgHWGgXB9c3SGiZais6aXo5B4cWpwaXCEcnR8e4B+laagnot/dFhZU09VWndwaIaBdHqBjH18hYihqrKwoa6gipJ9b2BKVmB0hZaki3+KeXV1d3dfcX1udXZ6dm98eHeEhYx5cn1zd3eCoZSMmY+LipGNg5KHe4CDkohzem5tgoB7a2pzdn57hIdvcX5ybmp0b2eAgnl9gYZ+gpmgr7e1pX55d2tnYGp/d3uDd3F3hHJyhIGJk56lkIKEb257d1pCT1lreYCdpY+Mh32BiIt2e5OQiYqTk3+BhX2Jj45zZXV0d3h6jZiHfXRpYWtrVm1+fHt/lJmGgHtrdoyNcHKEiZqWkp+XiIZ+e36Lf2dxfIJ1cYOEeoiMi5mjmGlcYF5eUVFicn6Ae3x9inlpgYuWmqS7tqWikYOLnIVWW2Jmbmx7k5GQi4CBh41kUl1pdGZugnlueXV9j6CLZ3B0f4aBjp+qq5J/e36CZWh+i5SLkJqOhYBpYXSWgmVzcXJ0cn2BeHhrYGZ7iXBweIeQe4COh4qam6Kwuph6e3V5cGVqb3yDcW94gHpldYWOkISIkYmNhnBrfpBmU2NmamlxhY+Um4yKl6yfc2pre4J0gpGIioqAhZKbfGhrb36DhoyKkIpvaWlrXkxaaX2JiZOXkZSCaWuFnIeHkoeCfoSOio2OeHN8i4RwdnqIhnmJkYqMgHJ9kZd4aGdlZl1cY2uBe2h0foJ4cYabrayenJeUnY5/gpWdd3B3bmlncn2DlZiGhYiHc1pZWmpoYXN3eIR+e4eUln5zdHaFlqmon6iOdH1/eGdgcX6OlJOVj5GQeGxzi49sa29oZ2l0dnZ/dGRteIB0cXyAjoiHm6Stp4mAipqahH53c3RzenF3h25kdXt9cnaGiYuHi4d9hINycHiMhm11dG1pbHd6iaCgoKKbj3Vta2x6c3aBgo+Of4KNlol8f3l5fIaMgIuRbGVycGVPVmZ2hYyVjomUiXqAkq6YfIB4cnB7g3+HiHl8hYp9bXp8hpOJkJSSlH9sbnuEdHNzZmRlc3VpfH5iaXyGfH+WnJ2WlJqOi5OGfYCPnoZ9gX53b3h5eouPhoaGgmZbYVtlbGVpbnyGfHmEmIt6iY6TlJWdlIiYkXV6jINfYGt3hYaTmo2NkoaAhI+FbmhoZ11gcG9xeXBxgI15ZHJ5foycpKekpp2IfYeSfH2EfnVteYN3coJ8aXmOc2V1fYeDe4ODen5/eHaEhoCAeIB+cXeAgpGel5Simm5lb3N1cnh2cnyIh3+GnI5+hIuSh3yEhHVyfXhrgnxXVl5ueXiBjo2KjZWWo6OGiYJ3f3Ztd3dyeoJ7g5yDanF9jIiHmJiOj46CcXp3Zm5wentpZ3V0bW59d3qUh3p5g5GQio2Ojo2NiISWh3yJh4qOg32CfHiEjoOOimdTUGJwZmJxa2t5g3yAin2FjZalo5GMkIuDgoyJi4FyZmR2fXuBjZCSkZGJkZF7dHNwbGtmZ2pjYHF7e4Z/dWluiZuXmaWZkZqaj45+dXt5g4yHeHR2dnZ8hYd8d3txcXt3cXR3eH6FgH6Df4B5gImHiIeNkIaDj5SUiYR3Ymh3em9ygXh1hImMiHp/g4mWnpeEe3hydniAfWRnaWFtdnJyf4qQnaSal4yHiH2Egnt6dnd1bHKAiX52hX1wfo2Vk5mcg3+GhoBraGppcnuFhHNubW97g5aHdIF7eICEfXiEiIGOlJCMgYqKhJCMhoaGjImGhIWHb2l0Y1hfZ2hldXxrcX6KhnyJiYuWmZ2bkYqBhY6Sk3NodHFyeHt2dYaLipigoIl3fXRwdW5samtuZ2tueXplcoOAgoqUlpikmYWHjpWDeHxzeYWNkIh/d3B1fIuLb3Z+dXFycWRld3d1f4qOeneGho+SiouMj5CLiISOhnJ9gnZram9ueIh8b3iGinh7gn6MlpOMiYR4cXmEkn5cY2pnanR3c32VmJScp5x9fIJ9hYV5dHV4e3t4eIF1aHV+f3+GkJScoYpwcX19bnRwZ3aEhIKDgnp4gY2YgW13eXd5fXpwdIOCe4eflH2Fi46ZlIF8gYyRi4OBf2lmc3VwZmBhZXJ+cWh6koyDjIaBjZWQjJGTiYCFmJt9bnBsbHJ5eHB3ipGTpK2LcHFsb315amdpcXZxcHlzaHeEiY2KiYuPn6eNeYSJc3iDeniHkY2JjIp7bneLh3Vxbm1ra2xqZmx4dnWLkHd4goiaraOKf4KKjIiOjnNten2Bf3Zsam19h3VuhH5tfoiFhYuNg3uCioN6iY97dGhhYmVxf4SBh5OTnK2ZgoB5dHuJg3Fud4KBfYh5X2hxdX+JjomFiJeafXl+ZGNzd3NzfoeGi5qfjIGKenN5bm9yc3Z1cnF7hIKTkn+DhoeHkqKWgH6FioKJimZca3V6enpyY11ieoiEjH9udoWLhYSOkYiDjpmOlJJ8gYV5bmtsbnFzdoWRnqaQgn52b2t0gnhlZHN6e4iAbm54f3yCjYyEgo2goJWDbGZtfYSBgomMi4uamo+GcmlwdWhhZWprbGtveH+LfnF4iZeVk5qil4J/i4uRjXdlZHiBg4mMgW9ncoCLgmpjZHeJiIF/gYJ7gZKak35zbHWBdXB6enZ0eISQnJeRjYuQg3Nye4OAcHiHjYR3bV1meHl7h46IeXuLmJiCbl9fb3Z2eH2LlJaisa2MeGxic4F2amxtbG14ho+Jgn9zf4+KhIqQmJaJh5GDb29kXWt6fIGIiHlrdYuPf31uX2+Ag4WKiouIhpOkmIeCd3aBhn1wbXBrbX6SjIGJg36Mj35ycnZ3enp/h3p7fG9rdHt+goqQi4SQnYuAhnJndn98fH+ChYyWq6iRiHdkYmhsbWVnbGpugopzc399f5CWjIeMk5aZmpyMe3luY2VwfoiPlZWIeYF/am92Z2Jze3l5fX6Ch5Gai4aGdWt0gYiHfXl5dXmOh3iHj4qLlJOBd32ChYiPhm5wdG5pam95gISEhoKBi392f4BzanJ3d3+HiIyYqqaWmZF5a2xxdHNsaG90hZN+dX6BeXiFjIOAh5GTmJ6CbnNxaGBia3mEi5SclZGGb251d2tndX1+h4uLiJOfjoqUjnhrcHd8gHp3d3iJhW5seIB9g5CQg31/gn+RlHVudXdxa21yfIiMj5GRlH9weIWLe3R5eHh9gYKHnqKQlJuPcl9fZGtuZmhte4t/dXmEh31/iYqGhIyTma2cfHh5dmplanKAjI6UlJuSdGpteXdkYmlrcn2FgoebkoWIjot2bXJ4hoh9enqJjX10dYOGgIWOk5KOjoeOl3ljZnBzbGxvcXyEhICBjoFtaneOiHR1enp/homEkJyUj5Wfl35wbW93cWlteYiDenN2gn96foKEhIeJipuZfGxsdG9pbG9ygY+TkpugjXpweYd2YmZtc36LjImVmpWNio2AbWhreYeCe3mDhXxzaW11dXZ9h5KZmpSVnYpuYmlyb290dHeEkpGOkId7cHGKln9vb3Fzf42MjY2Oj4qSlIR0a2VscGxqdIB/gXt3f4GAgYCAg4yRkJyhk39xdXdzeHtxbHmKjZOVkIx7eIaBal1aXGR2hImLiZaYkpKJeXFucHyFhYSFfX2Cfn9+dnV9hY2Yop6Ykoh6aWVsbGpxdnJwf4qMhXRycGx9kYp6dnJweYuWmoyGjYuQmJWMh3tydHh7f3Vob3N1fHx4fIOCfoaRk4+Gg3htbW5scoKEeXaEj5WMiJGMiIqHdGpsaWh1hZSTiI+SjY2HeXBycXJ6gYqMd3F1c3h4bmNndYGQpK6wn46Dc29wbGdrd3l1fpCemIB5eXqBiIFua3Jtb3+Sn5KIiYWHiIV+fH53bm51iIRubXB1fX96dX6HhYaOm6GUj4R3enl1cHZ/enN3hZKIf4eLj5SPemBdYFpebIGJgo6VlJWRhHZ0eXp7fYaQf3R5fIWIgnNrdYGFkJ+tpJWPe3Bzb2Zia3Nvb3iKj3pvcHKAjY96aW90dHqLnpePkYuKj4+Ig4iJhoF8hIJtZ2Vpc3p6cnOAh4iJj5SHhoJwbG9xbnF+gn59hJKNgYSIj5aak3hqbm5sbn+IgomPjI2PiXpwdHZ7f4KLgHJubXJ3eXBhZXaEjZanqJygloJ7eXJkZG90eH6Ml4qAf3t8gYaAbGVscXV+kZKMlJCHgoF9cnJ6fICFjIt6cW1scXd+eHF4hIuOlJ6Si5aMe3Z5dGpveXp7fomKfoCCho6TlYVtYmJjYWp3dn+QkY6OkYp9e31+g4mNhXp5eXp+gYF1bHB5g4iVnpaYn5eEe3pwY2RnZ2tzgHpyeH2ChIaFfHFucnl/jZSMkJmVjYqLg3l8g4eOlpN+cXBsaWtxdW9wd3+GipKKfH+HgXFxeXVuc3h8gY2ThYKJi4uPlpWMgHRwb3N9eXaDjYuFhIZ+d3l7fISTi3JtbmxrbXFwbHJ6foSQm5SUoaylj4R/cGhqbnJ7iIR4eYOHhIKBfHdyamx0g4uDhY+TjIJ8eG5qbnmHmqiTeHR2dHBzeXd0eH2AiZmbi4aNlY5+enlwa25zd4KNhHp+hYiFhYiFg3lrZGl3enV7hYuJhoeFgoSEhIWUnYd2eH16dXZ4dHV6fHqBkYyDipupo4+DeWpiX2FlcndubnmGi4aBfnp/fHV3g4+Ig4uVmZSPin53d3mAjqOihnZ1dW9sb3FtcHV2dH+Jgnl7hpKQhH91a2pudYCQkIiFh4uMiImLjpSIdnF8gHp2eYGDgYCAeXl+gYCIlYtzZ2psaWlyd3l8fHl5hIqKjJWns6qXinxycG9xeXx1c3d+hIOBfnh5f3lvdIB/fX6Dh4aDgntyc32DhJGalIJ3e3x6e3x3dHh8e4CIiYuIiJGZk4R4bWhqbXSChIKCgYOCf315dX+Hf3V9gXx4c3d9f4OJh3+Bio2PlZWMfHV4dXJ1eXh3e3t6fHp9homQn6egk4FuZmZla25udXp6eXV3f357hIuDfYB+gYSFjJCQk5KFd3qDhoeLkY2AeXl3dnl3cG5ycXFuanWBh4+amIx/cGVnb3eBg4eMjIuIg4aMiYWNjoWEfnd6eXZ4enuEiH92e4WLioWDeGxpam10e3dwcHZ5fHZ4h5OYnqWkopuJe3p8e3Vvdnt4d3Nud4KBgYaCfXlucHh5dXh7gIuQh31/g4V/gYSDg4KCgIWHgXl6fX98cnWAio+Yl42JgG9mbXR3c3eBh4eDenJ5gX9/goWJfm9wd3h1eX6Fj5KHf4WQlZCOiYR7c3ByeXtzbnN5fXdyeIeRmJ6WkJOKd25xeHZwcnd2cG5qanqJjouHiYd4cnqEhYOFh42Xloh+gImHgX19gYB+fH6Ghnlvbm9sY2JugI6VkoSBhntsbHiAenZ+io6Ni4WEj5mThYCEf3Fwd317e35/h4+Mf3qAhoN7dHV2cXNxcXh2amdvenp2eoSSm6WglJeelYeDiIZ3cnV5dXBvaW6Bj4t/f4R6bGpwc3FydnyNmpGBeoGEgHt5f4KChIOIkpCDfoOEdm5xe4SMlIqAhol+cnN8d25we4OBf3pydoeRiX5+emxnbHZ8foSGiZSYjoOFjo+MhoOEgH56cnR7dWppdXl0dXyGjpufj4WIhnx0e4N9c3B0dXFwbGt2i5OIf4WDenh8goKDhIOJlJeMgoSFhIF6e359f39/h42Dc25ybGRmcXp9iIh9fIWHf3qAgHVxdYKJjI+LiI+bm4l/fHBoaXN6fYSIh4yWk4d+f3h0cW1ydXx+dnBzd29ka3R0dX+KjZOiopiWmpWJhYqFenR1eXd3dnJxfIuKfXx7cWxtcGxtdHp+iJGNhIKDfH1/gIKCg4SDhpGWjoWGgXVzeHt2e4iHgIKHhX5/fnVvb3Z3d3h5eXuFkpCDfG9jY21zdn+LkZKXm5SNjomAgYSCfn6BgHp2eXlvam5sa3SDh4SNmZWKh4R8eX9+d3N2d3R0dnl5e4SNiIB+dnN7hoJ8f4eLi42OiIaIfnd+hYJ9fH+DgX+Eg3l1cWppc3x1b3eFhH+DhoSGh3tydHx9f4OKj5CQlZmRhXhrZW10cHJ9jJGTl5SLhn9vaG90cnR4e356dnZzb25tbHB+h4iJlqWjnZuVjY2IfHR3fXl3d3yAf32ChYF4bmZlbnFraXODioiIhYOFgXl5hoqEgYGFi4uLj46Lhn97fIJ/d3J8h4SBg4KChoB0bnJzbmtudn6Ei5GSiHluZmZvc3J1g5Sam5yZlpOLgH2GhH96eX6DgXx3cm5pZmZwfYGAgY2Uj4qHg4OFfW9tdXh3dHmCiImIiYd+dXFvd4GFgoCJkI+LiYWBf314foeFgX1/g4aDfnl1cnJzdXt7eHJxfIOCg4WDg4WCeXh9fn58gouUmZqXj4B2b2lsb3NydYOQmJmWjYR+d25yeHd1cHF3f4F9eHFrbGttdXyDh5Cfo6GfnZeOiH5ycnZ4eXh8hYuLiYh7bGdjYmRqcnV8hYqJhoN9d3t+gIiIhIOBg4uSko2Hf3+GhYN+fHx4fYODgoOCfHl/fXVxbm5sanB/jpKSjX9ycG5sbHJ4d3qFkpqenZWPkY6OjoV8dnJze4OEf3VqaWxtbm91eX2Hjo2Ok5WJf352bmhrc3h9g42Uk5KMeW9ydHNzfoaIiImMi4mEeXZ+g4eFgH9/fn6Eh4N7b2t1gIB2cXR2eoGEgYKGg3l7hIV9dnl+gISLlZiXl4t4cnZ0bGx0eHl7g4yQlY6BfoSKioF0bGpqbnd/gn1xam92dW9ye4SPnKCfoqSZiIKFf3BobHN7gIiPkpORf2pmaWNeZnN8fXx/f4GDe3F2g4qKhoGChIaMk5WXj394f4eAeHh8f4SJhn+Bg3pyd4F9cGprcHZ8hIiIi4h5bHF1b21ye4CAgoeMl56Wj5afnJOFeHJwcXd7gIV6amlydm5pbXR8hpCQj5aUg3Z6f3VpZWl1foiSlZeak390eXlycnmBhIODg4OJhnhyfYaIiIJ9fn+BhoiKintranRzbW1zen6HjIaCiIN1c3+Ggnt7gYWHjJCOj5GIeXN4dG1udX2AgIF/g46Ng4GMkIyEdWpoaXB2eoGDdWtvd3VwcnqEjp2jnJufk4J+hYR6b2ttdH+Lk5WXkoV0bm5nYWVtcnN2eHh/hXxydoOIiYuFgoSKlZuen5R/c3R3c3N4foGEjo+FhYZ6b3F6e3Zzb290fIODgoWBeXFwdHJzeH6ChIiIiZOZlZCUm5iSjH90cXR6fICCeW5qcHJtbHF2e4CMkIyPint0eH57dHFtcHeFk5ebmpKLhoF7cnF0d3l7gYKBh4N5dXqDg4eLg3x+iI+OjYl8bmZmZmRtdXt+hpOSi4mBd3V8hoeFg35+gYqOjIyIgHx4dXNwdXt/gYSHg4SIgXp9hoyHhYN2bWx1e36BfXNubnNzc3uDhoiRnZyYlImBgIWFf3t4cnB3hpGVlo+Hg3lwZmRoampqcnd3en15dnmAhISNkYuIjpmdnJqPgXhycGxtdnyAg42Wk42GenJyeXl0dHJwcXeAgX9+dnR3d3Vxc3uAg4aOk5KSjoaGjJORj5KPg3h5foB/fXVvb3Bva291dXR2hI+OiYB3dHp/e3p8fHd3f4yUmJmTkJCKfHFwc3R1eH6Af397d3mBhICCi46HgoWKiYmGe3JwbWJcY295gIeRmJSOg3t9hoh/fYCCf3+Fi4qIgXh4gH9ybXN9g4OGi4uHgHZyeoeGf4CFhXx1eHx8fHdwcHh5cnN7goSEiJCWlo+FfoWLg3t8f4J+foWKjJCMg4KFeWdiZWpraW5xdHh4dneBh4B+hZOalZOVlpSRioGAgXVnZWx4gIWLk5aTiXx5gX5wamx0eXh5e3l5d3Jve4J2bG54g4iLkpSTkIuCgoyMhoaNl5OJg4B+fXp0dHh0a2hpcHR1eX+FiIR8dXp+enZ3f4aHhoeIi5GVkZKVjHtwbnV4d3h6eXl8e3uAgn56fIeTkouHhISFg316dGthXGFrdH6HjpOXlIyJioZ+d3h+g4WHiIaCgX57fH55cG10foOGioqFgoJ+fHp3dnV6ho2JhIF/fHx6eXdzcnJ0en+BhIeKjZGNiIV/fXx7gIaKjI2LhoWHh4WBf3htaWpramttbm1ze39+ent7f4mVnZuYlY+Njo6JfnVwbW1wdHqCi5CTlpKMgnZxbG1yd3l7fn13dXZ4dXFzcW5zeoGJkZaUj5CSj4R9fH2EjJWXko6Jgn9/f3ZsaWhqbm9ydnt/foCAf3pxbXB1fYSJjJCVk4+OkpOLhYV+eHd1dHV5end3e4OCenh5fYKIjo+NjIiDgoSCc2hkY2drbXB2gYuRl5ubkYN9eXl9f4GCh4yJhIKDgHRyc3Fzd3l8gIiKhoSHioJ1b2xweYGLi4qKhoJ/gn91cG5xeHx7fH+GiImLi4l+d3V2foSKjI2SlpKJhIaCenp5c29raGRmbXFwcnmAfXl6f4eNk5iWlZSRjYuMhntzb3F2eHZ2fIaNlJiWjn91cG9ydXZ0c3h+fXl7fHVucXFwdXuAgYiRlJGOkZGIf3p5f4aPlZORkY2HhIJ4bWZjZ290c3N3fX17fHt0bGtscXuFi42Rm6CdlZKOhICCgHt4dnNwc3h6eHl/gH1+fX6ChomKiYmJh4OBem5oZmRpcHV1dX6Jk5ugnJCDfXl2eX5/fH2EjIyKi4R4dHZ0c3V3dnZ8hIiHiYh/d3JtbHN8hYqLjI6NjY2Cd3JtbHB3fH19g4iJi42GeXJydXmBiY6PkJSXlJKNgHV1dnJtaWdlZWlucXV8fHl9gYOGjJGSkpCPkZCSjn52dXRzdXt/fn2Di5CWmYx8dnRycXFycGxtdX6EiIR4c3R4d3Z4enx/g4mNk5WMg4KAfX2CiY+Sk5OUlpiLdmtnZGRnbXJzc3V5eoGAcGdna3F4gIqRkpacoqWhkIB8f4F9d3V0c3R1eH2EgHd3e359foOIi4mGhYSIhXVmY2dqbG92fX+CiI+YopqJfnx8fn18e3p5fISOmZWFe3p+f3lycG9wdXyAiIyBdW5xcnFzeH+Fi5CVnKGYhndwcG5sbnV7fX+DiZCRg3Rub3R6gIWIiouQlqGkloFycHJxbGhmZmhtcXd+fXZydH6EhomMkJKTk5SXlId4bnB0dnd7gIaJioqPko+FeXV1dHRybmppbHN/ioyEeXZ7gYJ9eHV0eYGIjo6KgXp8goOEg4WJj5ado6GXiXhubGpoZmZqbnJ2e359em9mZ2pweYCEiI6XoKanopWFf318fHd1c3N6goaCfnpybXF2fIGEiImNkJCKgHhvZ2RmaG1xdn+IkJeWkI6Lg359fH2Af3t4eoOMjI6PiIOCgYF9d3JucXqEgnp2cWxrb3R4e3x9g4+copyXkomBenRvbm9wdHqFjIaCg4F6dXNzeH+BgYKMmp2bm5aLfnVua2poZmZseoJ8d3ZzcXN3fYKJjI6SnqOZjYV+eXd0cXJ3foKHkJiViYOEgn13cm5ucHBubXZ9e3qAg4OEgoCBgn96d3yHiIB8end3eXyAhouNjZOippuTjoiEgHlwaWZmZGdwenhxcHN0cm9ubnV/hIeMmJ2am52clYyBeHd4d3R2gIiGgH13cG5vcXZ/homJjpeRg3lzb2xqZ2VncHuCi5iclYyHhYSBfXh2en+Af4OIhoSGioyLiIF6e35+enh+fXVuaWZkZ2tudH2FiYyXoJyVkZCMiIN8dG9wc3N4gYJ/fHt+gH56dnV4foGFjpOUk5STjod+cmhoa2xrcXp9fHt5dXJyc3R5goyRlJ2fl42GgX15d3Jwc3yEiJCVlJCLhYF8dm5nZmpxc3d8end5f4SGh4aBfICEg4CCg396d3Rwb3N4fIKNl5yfpKCYkY6LiIV+dWtlZGVnbG9ub3FydHZ3dXJze4GGjZKQk5ecm5eTi393eHt7fYGEhYKAe3NucHJzd36Gio2NiYN/enNvbWpnaW94gouTk5KRkIuFgX14cnN6gIWLiYWFiI6NiYaCfnyBhIOBfHRtZ2ZjXl5kaXB6hpOeop+alZORioeEf3l0c3N2eXl3d3yBgYCCgHx2dn2EjI6NiomNj4mEf3pybW9wdHd2eXp7fXlycHBydX2GkZqbmZSQjYh/e3h1c3V5f4WMjo+OkY+Ge3NtZmJmb3h+f357fYSHhIGBgH6BhYiKhn95dnVzbmpqb3eAjJmlqqegmJWUjoaCfXVuamdoamloZ2lxd3h3eHh2dXmCio2NjYyPlZWRjYqGgoGChISCgH5/gH14c3FwcXR6gYeJiYaCgX94cG5ubG5yeH6Dh4uNj5OTi4J8d3NyeIOIioyMi42OiYN/fn+BhIeHgXlwamhlYVxbXmNteoqXn6OjnpmVkYqDgoB7eXp8eXV0c3V5f4KCgX57eXuCioqJiYaEhIJ/fHp5eHp9f3t5eHZ4fHx4dHJycnZ+iI2PlJeVko+Kgn19e3h4e359f4WJjI6NiH93bmdmanR5en+DhYaFgX17e3p+hYyNh4OAfHl3cmpmaGtxfo6bnqCkpaOdlo2Cfnp1cG9xbWZkZWhscHR2d3h3d3qBiYmIioyNjIyKh4iHh4mOko2Gg4B9fn56dnRzcXF0fH99foKHiISAenZ2dXJxdHl4d3yCiY6Qj4yJhHx3eICEhIeMkZOQioJ+fn19gYiLg3t2cnBuaGBaWl1ia3mJkZOZoKSjnJKIg4OCfnyAgHh0dHV4fH59fX58enyCi4yIhYSDgX55dHN3enuAiYuEfXh3eXt5c3FydHV4gIeJiIyQlZaRiYSEhYN8eX17eHp+goaJhoF9e3Vua3B2eHl9hIiIhoB6eHp9foSMjIeCgH+AfXVqZmhrc3yJkpSYnqSoppyNgHt5dXBxc25qampscHNyb3B1d3h7hIuKiYiKi4qIgn5/hIiLkpmXkIeAfn9/eXJwcXBydXp6d3l8goeJhXx4eHt6dnd3c3N4fYKIjIqHiImGgX+ChISHio+Qj4uEf31+f3+EhIB8dnJxcW9mXVteZGt2f4SKkZqgpqWbjIOBgoF/gH14eHp7fX9/enZ3fH+Ag4aHhoWDgX57dnFucHd+hoyNioWAenh6eXJubnJ2fIOFg4SHi4+UlpCIg4SHhIOBenZ2eXt8fn98eXl7e3h4dnd7fX+Bg4SCfnp6fYKFh4aFhYN/fX98c2xrbXJ7goWIkJmfoqWiloV6d3h2c29qam1yc3J0c29rbnZ7gIKChYmLi4mIhoJ9fH+Gj5aXlZSSi4N/gHtxamhqb3d5dnN3fICDiYuFfHZ4fIB/eXNyd3t8foOGhYSHi42MhoKDiIqKiYqKiIJ+fn+CgXx6enp1cG5wbmhjYmVrc3Z4fYmUmqClpJmMhIOGh4J6dnh9gH9+f314d3p+hIN/e32ChIF9e3Zyb29zfYeJiIiLiYN7eXp3cm1ucnuCg4GCh4yOkZaWj4aCg4mMhXt1dHV1dHV4eXd3eoCEgHt2d36Af36AgX9+fX+Eh4WBg4eHgnx7fHt3c3F1en1+f4SNlZmcn5uPg3t4e3lybGluc3V0dXRycHB0fIB/fHuAiI2Mi4mFf31+g4uRkpOVmJWLgn16dXBqaGxvcXJydHp/g4eLioJ8eHp/gH14dXd4eXt/g4SEhoqQkIuGgoSKjo2LioaCf31+fnx6d3l7eXRwcHFwbmtpamttcXV9iZKZoKShmZCKiIaEgHt6fH6AgoSBfXt5e318eXV0d32BgX98d3Nzdnp8gIOEiYyLhX99e3h3dXV1d3t+f4KIjZGVmJWQioaFgoF+eHRzcnBzdXV2d3p/gYF+enZ4fIGDhIOAgIGCgoCChIOFiIaBf4B+fH17eXVzdnh6gIiQlZqblo+IgXp1dHRxb3Bxc3Z3dXN0dnd5ent7fYKKj5CPioSBg4SDhYqPj5GSjoiCfXZ0cm9rZ2lscHN4foSHiYiFgX99enl9f3t5eHl7gIKBgoaIiYqLi4iFhoqOjYqEf36Afnh1eHp4d3h3dnd2c3JxbmhlaG1yd3+IkpqfoJ6blo2EgYSEf319f4KFg357e3hzcnN1dHR6gISEgXx4eHh2cnR7goSHioqIhYF9fX55c3F0en6Bh4yRlZWSj42KgXt8gH53c3FxdXd2dHZ7e3p7fX14d3yCh4iFgH6BhIJ/gIWHhIOEhIWFgoGCgHhwbW9yc3h/ho6UlpWTkIl8dnh8eHJubXF3fHp3eHh1cXN5fX6CipKUkYyGg4WEf3yBiYyMi4yLioV9eXh1bGVjaG5zeX2BhIaEgYGDf3l3foKAfHt7foOFgn+DhoSChYqKh4eLj46LhH17fXx4d3p9fHl3eHp9enR0dXBoY2RpbnR7hI2XnZ6dnZuSh4SIiIN+fHt/hIaBe3p2b2ttcnZ4fYSIiIV/eXZ1cG1vdn2ChYiKjY+KhYOCe3Jub3R6gYmOkpWVkIuLiIB6e39+eXV0dHd6enV0d3Zzc3d6fH2BhomJhoB9f4GAf4OHiIaFhIWJi4iFg392bmpqbG91fIKJkZSTkpCLg35+fHdxbm5wdn1+fHp4dHFydnuAho2SlJKOiYSCf3t6fYGFh4mKi42Nh4J9dWxlY2VqcHd+gYSGhoOBf316e4CBgH5+foCEhoOBgIB/gIOFh4mMj5CMiIJ8eXh3eHp8fn18e3x7fX16eHRtZmNkZ2txeoSLk5qdnpyXk46NjIiBfXx8foGFgn55c29ub3BzeYGIioiFgHp0b2xrb3R4fYOJjY+Sk5CMhHpxbm9xdn6Hj5KTlJGNh4F9e3+AfXl4eXl6fHx6dnJvb3F1d3p/hoyMiYWCf3x8fYGGiIiHiImKi4yLiYR8cmtqaWlrcXqCh4yRlJOOioWDg392cG9xcnZ7fn57d3Rzdnh7foWPlpaSj4uFfnl2eHt9foGHi42Oj46KgnhsZmVkZmpye4KFiImHg357en2ChIKBgoSFhoeGg397eXt/goOGipCTkImDfXdzcnR5fX9+fn+Af359fXt2cGhlZWZpb3iCi5GVmpyZlZGPkZGMhH99fn1/gYF8eHNub3BxcnZ9hoyLh4F6cm1rbHB0dnqAh46TlpiVkYuBd3Fvb3F4gIqQk5KRjIV+e3p8fn57ent8fX17d3Jua2tuc3d7gIaOk5GNhoB7enyAhIeJiIiMjo2MioaBfXZwa2hnZ2tzfIOIjI2MiYeGhIOEgXt4d3h5e318enl5eHl6fH+DipGXl5SNgnt4d3Z2eHp8f4WLjo+OiIN+eG9nY2NlbHWAhoqKhoF/fn9+gYeKiIiKioiHhH56eXl4eHt/goeMkpSRioB2cXFzdXh7fHx+gIKBgX96d3d0bmlpam52f4iPlJaTkJGTk5CPkI6JhIKAfXx6dXJzcm9tbnJ1eYCHjIuFfHVxcW9vcXV5foWMk5ial5GOjIV6c3Fxc3mCiY6QjYeAfn57eXp/gX9/gH58eXRtamxubW5zen+GjZSZmZOIgH1+fX6BhYiLjI2PjouEfX19d21oZWZobnV8goeHgoCDhYOChIiIhIF/fn1+e3h6fn57eXp+goaOlZqZkIR8eHZycHF0eHuAhYmNjYeChIN4bGVjZWlxeoGHi4mCgIKEhISIj5COjIuKiIV+d3d3dXJydnyBh4ySlpKGeXNzcW9wcnd7fYCChIWCfHh8fXdxbnBzd36EiY+SjoqKj5COjY+SkIuGgn9+eHFtcHJwbW1vc3Z7gYmPjIF2cnJwb290eoCGjZKWmpiRj5KPhHlzcXN1en+EioqDfHp6eXh5f4SEg4F+fHpzbGprbGprbnR8hY6XoKSdkIR/fn18fYGFiIyNjIyKg318fntyamVmZ2tyd32CgHt4e36Bg4WKjoyJhYOGhX97e319fHt7fYGGjJKZmpGDeXVzcG5ucXN2e3+DiIqHhIWFf3VtaGhqb3R6gYaHhIKFhoiJjJGTkpGNi4qFfXd0cnBubnB1eoKKkJWTiX10cnFwb3FydnuAg4SFgn99gYSBfHd1dXh9gYaMjYmFg4aJi42PkZCNiYN/fXhxbWxtbW5vcHF0e4KKj4uCd3FwcXJ1eHyAhouPkpWVlJWVkYmBeXRyc3Z6foGBfXl4d3d4fYKFhYaDfnx6dXBsa2ppam1yeYSQm6KjnpOIgoKBf35/gIKHiYmIh4OAgYB7dW5oZmdrcHV6e3p2dXZ7fYKJjI2NjYyKiYiFgX9+fXt+f4CBhYuSlpOLgXl0cnBvbm9wc3d7foKFhomKiIB5c25sbG90eX+DhIOFiImJjJGUlJWUkIuHg314dnNua2xucXZ9iI+QjYZ/enh0cXFyc3Z6foGCg4OEiY2Jg397eXd5fYKFiIaDgYKEg4WKj5COjIqEf3t3c3Jyb2xsbnFzdn2EiYmGgHt6d3V1d3t+gISIio2RlJicmpGIgXx3dHR2eHp7end3eXh2d32DhYSFg4B7eXd0dHFsaWpwdnyEjpidnJiTko6HgX5+gICBg4SEhYSDhoiCeHFtbWxrbXF0dXVzdHd3d3d9h4+RkZKQjYuIh4iHgn18foKEhIeLkJCMhoOAeXBram1vb3FzdXh9gYaNjYd9eHd3dXN1eX2AgoKFhoWDg4iSl5eWk4+Lh4OBf3lyamhqbnJ0eoGIi4iHhYF6c25vc3Z5e31/gYaIjJCOh4F+f3+Af4GDhYWDgYB+e3p7g4uPjoyIhIB9enl2cW5rbnJ0d3p9g4iJiIaCfnp1c3Z6fX+Ag4aLkJSYmJWNhoSCgX16eHd4eXh3dHJwb3N8hIeHhYKBf35+enZybm1wdHh8goiQlpmamJONhoB9fX+AgYKCgoOFhoWDfndzcXFycXJzdHV3dnRxcHBzeoWOkpOTkY6PjoyHgoB/f4CDhIWHiY6Qj4yEe3Vva2lqbG1vcXN3fIKEhYWDgX9+f3+Af35/gYODgH18fYCGj5WXlZOPjIyLhX13cWxramxucXZ7goeKiYN9eXVycXN2eX2AgoWJjY2LioeDgoKCg4WGhYSDhIF7d3V1d3yDh4mJhoOBgoF8dXFwb3BzdXh8gIWKjo+Lg3x4dnV2dnh7foGDh4yQj46OjYyKh4SCgH16eHh4dG9sa21yeICEhYWEg4OGhoB7dnNyc3R2en6DipGWmZaPiYWCgH+Af4CBgH+Bg4N/fXx5d3Z1dXZ4eXh3eHh1cXBwc3h+houOkI+NjpGOiISAf3+AgYKFiYyOkZGOhHpybmtqamlqbW9ydXl+gH+BhIaHhoWEhYeFg4KDgn15d3d7gYiNj5CRkI+Pj4mAeHJubGtqa25zeH6FioqEfXh2d3h5ent9gIGDh4uJiYiHhoWEg4OFh4eFhYeEfXZycHF1en5/goOCgYOEgHp1c3NzdHd6f4WKj5OTjoV9d3R1dnV1d3l9f4OIi4qLjY2Mi4iEgYGBf3x7e3Vvamlqb3Z8gIGEh4iKjIqEfXh1dHV0dnh8goiPlZeSi4WBgYODgX58fX18foF/fHt8e3l6eXd3enx9foGBe3Vwbm9zeoCDhoiLjI+RjomFgoCAgYODhYiMj5OTjYJ4cGtqa2xqaWptcXV7fn1+gYaGh4eGhYSHiImKioV+eHR0d3yDiYuNj5CQkI2GfXdybmxtbGxucnmBiYuGgXx4eHp9f358fH2AhIeGg4KFh4eGh4aEhYiLjY6KgXlybmtscHV4eXt+goWFgn16eHd4eXx+f4GFi5OXk4uCfHd1dXd4d3V2eoCFhoWChIeIh4eGg4B/gYSFhH52bmtpaW1zfIGEh4uOj4uFf3t5dnR1dnZ4fIKLk5WSi4aDgX9/gIB+e3t+gH97d3V3ent7fHx9fICFi4yJgHhybmxsb3V8f4KGjI+Oi4eEg4SDg4WFhIOGi5GTj4Z9dnJubG1ub25ucnd7fHx6e4CEhISFhoWGio+SkIuDfXl2dHV5f4aJi4+Qj4qFfnl3dHBubm9wcnh/hYeHg39+fXt6fH5/foCDhYSBfXp8gISFhYeIiYyRlJKOhXx1b2xpaGtvdXl+goOBf3t5e3x+foCCg4OGioyOjouFgH16d3Z4ent8f4KBgH16eXt/gYKBg4KChYmJh4N9d3Jwbmxuc3uCiI2Oi4iEgH19fHl3d3h6fYKIioyOjYmGg397e3x+f4CCgX15dXJxc3Z5enx/g4ePkpGOiYF6c3Bsam1wd36EiYqIhoSCg4SGhYSEhYaIioqHhoWCfXh1cXBvcnR2ent7eXh4dnd5fYCAg4SHi4+Rjo2KhoF8end2eHt/houMiYWCfnt5d3VycHBydXl9f36BhoeFg4B9e3t8gIOGhoN/fXt5eXp9gYKGio+UlpSQjIZ/d3BqZmVmanB5gIF+fHt7enyAgoSEhoeKjIyKhoeIhIB9enl5en2AhYeFgHt5dnV0dXh7fX+BhIiKh4WEgn55dXNyc3d6gIiMioaCgH9+fnx7e3p7fYGGh4aGiYyKhoF9enh5e32BgoB6d3VycXBxdHh8gomQlZaTj4yHgHlybWpqbXF5goeHhIOCg4KEhYSEhYaIiouHgn+Af3x4dHFxc3V4foSFgn57eXZ1c3V4e4CEiI6Qj4yKi4uHg357enp7fYKHh4J9e3l4d3d2dXZ3eHt9gH9/goiKiYWBfXt6e36DhoaCfnt6eHh3eX2BhYqQlJaUkIyJhH10bWdkZWhtdXt+fHt8fYCBgoOEh4mKi42LiISEhYSBfXl4eXyAhYqMioV/e3Zyb21ucnZ6f4SHiIeFhYWEgX58e3p7foKFh4V/fXx8e3t7e31/goWHiIeGhYiKioaBfHh2d3l8fn9+end1c3FwcHN5gIiOkpSUkpCOioaAenJtbG1xdnyBgoGCg4SEg4KBgoWIiYiGgoB9fn58eXRycXR6gYaLjIqGgXx2cW9ucHV8g4iKjIyLjI2LioeEgX58fn+AgX97eHV0c3JzdHZ6foOEhIWEhYeJiYeDf3t5en2AgYKBgIB+e3h2dnd7gYiNjo+Ojo2MiYR/eXNuamptb3J2eXp9gIGBgoOCgoWJjIuKiIaFhISDgHx5eHl+hYmLjIuJhX94cGtoaGtxeH1/gYOFh4mIh4eHhoOBgYKBgIB+fHt5d3V2d3p8gomNjIuLioqJiIWBfXl1dHZ5enl6eXp7eHVycnR4gIeNjo2NjI2NjYqGg396dnR1dnZ4e32AgoOBf39+fn+ChoaDgYB/gIB+fHl2dXV6gYeKi4yLioeAeHFtbG1zeoCBg4WHio6PjYuKiYaCgIB+e3p5d3Ryb2xrbXB1e4OKjY+Pjo+Oi4eDf3t5d3l9fX5+fX6AgH56eHh6foWLjImHhoWGh4WBfXt5dnR0c3JydXp9gYOBfn18fX6BhoiIh4eGh4eGhIF+fHt9gYaHiIiHh4aDe3JsZ2Zpb3V4eXt+g4mOj42Mi4mGhYOBfnx9fHt6d3RxcHJ2fISMkJOUk5KPjIeBfHh0cnJzdHR1dnd4enx6eHl7foOJi4mHhoWHiImHhIKBgH+Af3x6e36AgYGAfHh2dnh6f4CAf4B/gIGBf359fH1/goWGhYaGhYaGg312cm9vdHp8e32AhYmOkpGOioeFg4SBfXl3d3VzcW5qaGhscnyGjZGVlpWTkIyHg355dnZ4eXh5e3x+f4GCgYB+foCEhoWDgYGAf4B/fnx6eXp7fH18fH+BgoF/fXp3dnd6fYCBgoSGiIiJiomIh4SDg4SDgX9/gH+Af315c29rbG9ycnR4foWLj5GRjouHhoaFgX58e3x7eXd1c3JzdnyDiIyPkpSSkIyIhYB7dXFvcG9ub3J2eHyAg4SDgoKDhYWEgoGBgoODhIODgoOEh4iGhIOCg4F+end1dHR0dnd4d3h7fX+AgoSIiomIhoWFg4B+f3+AgYGAfnt5d3l6e3p7f4OHi4yNjYqHhIODgX15dnV0cnBtbG1vc3h+g4eKjpGTk5GPi4iFgHt5eHd3d3h6fH6AgoODg4KBgIGAf359fn19fHp6e3t8gIOGh4WEg4KAfXl4dnZ3d3h6ent+gYSHiYuNj4+NioeFgn98enl6eXp5eHd2dXR0dXZ5fH+DhomLi4qIhYODgoF/fXx7fHt6eXd4ent9f4GDhYiKjY6Ni4mGgn15d3Ryc3J0d3p8fX5/gICBgIGBgIGAgICBg4KDgoKDhIaIiYiGhYSCf316d3Z2dXV1dHV2eHp9gISGiIqKiIeGg4KBf35+fXx9fH1+fX5+fX5/f4GBgoSFhoWEhIKBf39+fHt6enl5eHd4eXt8fX5/gIKEhoiJiomIh4SCgH19fHx9fn9/gH9/fn+Af35+f35+fXx8fX59fn1+f4CCg4WEhYSDg4F/fXt7ent6enp7fX6AgoWHiImIiIaEgoB/f35+fXx7ent6e3t8e3x9fn9/gICCgoODgoOBgYCAgYCBgYCBgIB/fn9+f35/f35/gYKDhIWEg4KBf318enp6e3x9fn19fn5/gICBgIGAgYB/gIGCgYKBgoGCgoOEg4SDgoGAf317enp5eHh5eHp7fH+Bg4SFhIWEgoKBgIGAgH9+f35+f3+AgYGBgIGAgYCBgoGCgYCAfn59fH18fX59fX59fH19fn1+fX5+f4CCg4SFhIWEg4OBgICAf4B/gH9+fn19fn9+f39+fX59fn1+f39/gH+Af4CBgIGBgoKBgYB/fn59fXx9fH1+fn+AgoODhIODgoGBgYB/gH9+fX18fXx9fX5/f4B/gH+Af4CBgICBgH+AgH+AgYGCgoGBgH+Af39+fn9+fX9+f4CBgYCBgH9/fn9+fX5/fn9+fX59fn9/gIGBgH+AgYCBgYCBgoGAgYGAgYCBgYKBgYB/fn19fXx7fHt7fH1+f3+AgYGCgYGAgYCBgIGBgIGAf4B/gIGAgIGAf4B/gH9/gH+Af359fn18fX5/f4CAf35/f35/fn9/fn9/gH+AgIGCgYKCgYKBgIGAgYB/f359fn1+fX5/fn19fn9+f4B/gIGBgH+Af4B/gIGAgIGAf4B/f35/f39+f35/f3+AgYCBgIGAf4B/f4B/gH9/fn1+fX5/fn9+f35/gH+Af4B/gIB/gH+Af4CAgYKAgYB/f4B/fn9+f35/fn9+f35/gH+Af4CAf4B/gH+Af35+fX5+f3+Af4B/gIGAgYCBgICBgH+Af35/gH+Af4B/f35/fn9+f35/fn1+fX5/fn+Af4B/gIB/gIGAgYCBgH+Af4B/gH+Af4B/gH+Af35/fn5/fn1+fX5+f4B/f4B/fn5/gH+Af4B/f4B/gH+AgYCBgIGAgYCBgYB/gH9/fn1+fX5/fn9+f39+f35/gH+Af4B/gH+Af4CAgICAgICAf4B/gH+Af4B/fn9+fn9+f4B/gH+AgH+Af4B/gH9/f35/fn+Af4B/gICAgICAgH+Af4B/gH+Af4CAf4CAf35/gIB/gH9+f39+f35/fn9+f4B/gH+AgYCBgIB/fn9+fn9+fn+AfwA=

:: Base64ID_Sound_Shutdown
UklGRlooAABXQVZFZm10IBAAAAABAAEAqjcAAKo3AAABAAgATElTVBoAAABJTkZPSVNGVA0AAABMYXZmNjEuMS4xMDAAAGRhdGEUKAAAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgH+Af4B/gH+Af4B/f39+f39+f39+f4B/f39/f3+Af39/fn9/f39/f39/foB/fn+Af39/f4B/fn+Af3+Af3+Af39/fn9/f35/f39/f39/gH5/f35/f39/f3+Af35/gH9/gH9+f39+f39+gH9+f39/gH9/f39/f4B+f39/f39/f4B+f39/gH9/f39/f39/f3+Af4B/gH+Af4B/gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAf4B/gH+Af4CAf39/f39/f4B/gH+Af4B/gYJ5eIKBgoN+gnh8en+Dg4h/g3d5e32Cg4qCgnp5eHuEg4uEg3t5eHiCgoqFhH15eHeBgYmFhH55eXeAgYmGhH54eXeAgYiGhH94eXeAgoiHg393eHd/goiIg4B4eXd/goeIhIF4eXV9gYaJhYN5eXV7gIWJhYN7eXZ5f4OIhYV8end5f4KIhYV9e3h5foGIhYV+e3h4foCHhYV+e3h5foCGhIR/fHp4fn+FhISAfHp5fn+EhYSBfXx5fn+EhISBfXx5fX6DhIOCfXx5fX6DhISCfnx5fX6ChISDfn16fH6BhYODfn16fH6BhISDfn16fH6AhIOEf316fH6Ag4OEf317e36AhIKDf318e35/hIODgH18en5/g4ODgH58en5/g4ODgX58en5/g4ODgX58en1/goODgn58en1+goSDgn59e31+gYSDgn5+e31+gYSCgn5+e3x/gYSCg399e3x/gISCg399e3x/gIOCg399e3t/f4ODg4B9fHt+f4ODg4B9fHt+f4ODg4F9fHt+f4ODg4F9fXt+f4KDg4F9fXp+foKDgoF+fXp9foGDgoJ+fXt9foGDgoJ/fXp9foGDgoN+fnt8foCEgoN/fnt8f4CDgoN/fnx8fn+DgoN/fnx7fn+DgoN/fnx7fn+CgoOAfnx7fn+Dg4KAfn17fn+Cg4KBfn17fn+Cg4OBfn17fn+Cg4KCfn17fn+Bg4KCfn17fX+Bg4KCfn17fH6Ag4KCf318fH6Ag4KCf318fH6Ag4KCf358fH6Ag4KDf358fH5/g4ODgH59e35/goKDgX59e35/goODgX59e35/goODgX59e31/gYKCgn59fH1/gYOCgn59fH1+gIOCgn9+fH1/gIKDgn9+fHx+gIKDgoB+fHx+gIKDgoB+fHx+gIKCg4B+fXt+f4KCg4B+fXt+f4GDg4F+fXt+foGDg4F+fXt+foGDgoJ+fnx9f4GDgoJ+fnx9f4GDgoJ/fnx9foCDgoJ/fnx8foCDgoJ/fnx8fn+CgoKAfnx8fn+CgoKAfnx8fn+CgoKAfnx8fn+Cg4KAfn18fn+CgoKAfn18fn+CgoGBfn18fX+Bg4KBfn18fX+Bg4KBfn18fX+Ag4KBf359fX6AgoGBf359fX6Ag4KBf359fX6Ag4KBf359fX5/g4KBgH58fH5/goKBgH59fH5/goKCgH59fH5/goKCgX59fH5/gYKBgX59e35/gYKBgX59fH5/gYKBgX5+fH1/gIKBgX9+fX1+gIGBgX9+fX1+gIGBgn9+fX1+gIGBgn9+fX1+gIGCgYB/fX1+f4GCgYB/fXx+f4GBg4Z3dXmAgoCGhX6BgHV7fnmDhn+FhnqBgXh7gXt9gnyDiIKChXx5e3V7g4CGjISAgnl3fXh8hYGCiIF/g318f3p4gH1+h4WDhoB5fHd2f4CCioeBg3x2fHp6goOBhoR+gn96fnx5fn9+hYaDhYN7enl1fIGCiImDgn93eXt5f4OBhIaAgYF7fX15en99goeFhYV+enp1eX+AhYmGg4N7eHt5e4GBgoaCgYN/fX97eX18foWFhYaCfHx4dn1/gYeHg4N/eXx6en+Bf4SEgIOBfn99eXx9fIKFg4aEfn17dnt/f4WHg4OBent8en+CgIGDf4GCf3+Ae3t+fH+Eg4WFgHx8eHl+foKHhYOCfXt9e32AgICDgYCDgH+AfXp9fHyCg4OGg359enh8foCGhoODf3t9fHt/gX+Cgn+CgX+Bf3t9fXyAg4OFhH99fHd6fn+EhoOCgXx7fHt+gYCBg3+Agn9/gH18fnx+goKEhYF+fXh4fX+ChoWCgn16fHt9gYGAgoB/goF/gX57fXx7gYKEhoR/fnp2fH6AhYaDg397fHx8f4J/gYJ/gIJ/gIB9fH16foODhYaBfX13eX1/goaFgoJ9e317fYGBgIKAf4KAgIJ+e318e4GDhIaEfn56d3x/gIWGg4N/en18fICBf4GBfoGCf4CAe3x8e4CDhIWGgH57dnp+f4OHhIOBe3t9fH6CgICCf4CCgICBfXp9e32DhIWGgn19eHh8foKGhYKCfnt9fHyAgX+BgH+CgoCBfnt8e3uBhIOGhH99end7foCFhoODgHt8fXt+gn+Agn+BgoCAgHt7fXp/g4OGhoB9e3d4fX+DhoSDgnx7fXx9gX9/gn9/g4GAgX16fHt8goSFh4N+fXl3fH+BhoaCg396fHx7f4F+gYF+goKAgYB6e3x6gISEh4Z/fXt2eX5/hIiEgoF7e3x7foKAf4J/gYKBgYF8en16jnNzfoSOfHuDfXWCjH53hX1uf4h3gZaDeY2DbXaEeHeGfXmJj4KEj4N1enVocoR+gpqVg4mHb3B7b22DhXuLlImGjoNzdXVoboSEg5aZhYOHcWt5dXCEin+GkIV/h4F0d3tycYOFgY2Tgn6Gdm18fHSBin6Ai4V+iIh7eXx0bnyBfIeUiYKKf3F5fHF3hHx8i4uFjI5/eXlvZ3F9fYeYlImOhXBxdmtugYB+jpGJi4+AdXZvaG9+gIiXlYmIhXFtd3FwgoZ+iY+Eg4qBd3p3b3N/f4GOkYWDh3hxfXpzgYZ5f4qBgIqIfoB/c3B5enmGj4iFjIJ3fn1xeIJ2eYiFg46Pg4F+cWxyeHqEkI+KjYV2d3lvc4F9fIqLhYyNgHx7cWxze36HkZGJh4Jzcnh0dYSFfoiLgYOIfnp+eHJ4f36Di4uEgoN4dn57eIOFe4CFfX+JhX+FgHV3e3l7hYiFhoiAe399dnuBeHmEgoCLjYODgXNvdXV4hIyLi4uEeXh5cnR/fXuHiYSKjIF9fXNtdHp8hpCPioiCdXN4dXaDhX+HioCCiH96f3lyeH9+g4uKhYOAeHZ8fHqDhn1/hH18h4V+hYJ2dnx5eoWIhYaIgHt/fnd7gXh4g4F/i46DhIN0b3V1d4SMi4uMhHl5eXJ0f316h4qDi46BfX9ybXV6e4eQjoqJgXVzd3R2g4V/h4uBgoh+eX95cXmAfYONiYSFgHd2fHt6g4d9f4V9fIeEfYWCdnd9eHqFh4OHh397f313fIF5eIOBf4uNgoSEdG92c3WEjIuNjoR6enhxdH58e4iKhIqOgX1/cWt1eXmHko6Mi4F1dHVydYKFgYmLgYKJfnh/eHB4gHyDj4qGh4B2dnp4eoSGf4KGfXyGg3uDgnV4f3h6h4eDiId9e398eH6CenqDgX6JjIOEhXZwd3Vzg4uIjI6FfHx5cnR9fHuFiYSKj4R+gHVrc3l3hJGNjI2Dd3V1cnR/g4CHjISDiYF4fnlvdn98go6Lh4eBdnZ6d3iChoCBhoB8hYR8goN2dn96eoeHgoeGfnx/fHh8gXt6g4F+iIyDg4V3cHh2c4GKh4yPhX19eXF0e3p6hYmFi4+EfYB0aXN5doSRjY2PhHh2dG9zfoGBiY2GhImAdnx4bnZ/fIORjIaJgXV1eXV4goWBhIiBfYSDeoCCdXeAe3qIiIGHh3x7f3t4foF7fIKBf4eLg4OFd3B4dnKCi4aMkIR8fnhxdXt5e4WIhYuPhH2AdGlyeHOKqX5xjHhzgXtpb4aPg4ONko+CbHCAc1lrioqCi5mgl3txgoNoYXOGgXl7hYmEfYSXlHd2iIh2d3t/fXNoeop/cIedloODioyCd3KBf2RZdIJ3eZCdpJuHho99YmZ4dGRpfY2Oh4iWm4VseYp8cYCJiHxsa3x6aG+RnJCLlpiOe3Bwd2VRYYGBfY+kpp2HfYaBY191f21od4aHgoKQnpd9fpGIb256e3NoZniHe3eSqJiGipOLe25weHJYV3OBc3ycq6edj5CRdVZgcWZWZH2LjIuVpqSHc4WMdWl7hHxvZWp6dGV5naKTlqSjj3lsbmlTRV18e3iXsK6hkoqPgmNeeHljYHWAfXh/kaCVgoqfjnN1gnhpX2ByfW1xlaiWi5aekn90eHtsU1Vyd2h3nKmkn5eXlXZcaXdhUmZ/hIKFlaSegniMj3Jsg4p6bmdveWxdep+cjZmqpI56cnRoTkZjfHVzmLOtnpaRj35fYHt3XWJ7g3t4gpegkIGQn4pueId5Yl5kc3VocpuolI+hopB8dXt6Yk9ac3JmeaGsoJygnZJ1Ym52XE5pgH56hZmlm4WEk41xboiKdGdscXVnX36el4yerqGKfHx4ZkxMZXVqc5u0qJybmI14YGd9c1pmgIJ1doeZmYqDkpqCbn+Md2Fja3FwZnWboo2Po5+Ienl8d2FSYHRvZH2iqJyboJuMcWJydltSboB8eoeZopeDhZGJb3CJi3Vrb3FxZV97nZWLoa+gin16d2VLTGZzanWcsqabnJeMd2BpfnJbaYF/cnSFlZWHhZachHGCjXdhY2pta2V2mp+MkqagiHx8fnVfU2JzamOAoqOYnKGbinBndnVZVXKAdnaHmZ+Qg4mUhW92jYhwbHRzbWJkgJmPiaSwmoiEgXhjTVFpb2Z4oK+hm6CaiXRkbnxsW2+FfXF5jJWRhomYl4B2iI50YWdwa2Zqe5mdjZernoN7gH5wXVhoc2hmhqOflZ6mmoVyb3lyV1l0fHF1i52dkYqRk4BueYyCa215dGhjbISWjIunr5SEiIR0X1BXaWhieqGsnZ2nnIVxaHB2Z1tyhnhufpCSjIeMmZF7eYqKb2JscGZhaX6WmI2crpuAfoJ5alxaaXFlaImhm5SgpZWBc3B4cFlceHttdYyWl5CJkZaBb3yLgG1tdnNpYmmCkouMpq6XiIiDdGFRVWdoYnmeqJ6dpJyIc2dudmhccYZ7cH2Lj42EiJeVf3uMjHNlaW5oYmR3lJmPnK6ghX+AeGxbVWdzaGqKoZyWnKCWg3FvenNdXXd9cHOGk5aQh5CYhXF+i35sa3FybGNrhZSKjKSrlYaHg3djUldqamN3mqWdm6CdjHZqcXdoXG2BfHF7i5KOhYiVk4B7iot2ZWdvbGJlepOWjpiroYZ9gHxuXVdpdGlqhp6ak5ifmIVzcnx1X150fHBxgpKXjYeSmYZ0fYqAb2pwdW1jaoWSi4yhqpeGg4N5ZVRZbGxjdpeim5mcnI53a3R7bWBugXxxd4aPjISGl5eCe4qMeGlnbW5lY3aRlo2Vp6CLf399dGNZZ3ZsZ3+XmJSVm5qMd3N9eWRfcXtzcX6OlI6FjZmMd3yLhHNrb3RvZGZ+kIyKnamcioOCfGtWV2xuZXOSoJuWmpuPemxzfXFibYB9c3WCjIyDg5SYhXyJjXxrZ21vZ2JzjpSMkqShjYF/f3ZjWWZ1bWh/l5iTlJmYi3dxfntmYHN8c3F8jJSOhIyYjHh8iYNzbHB1cWZof5CKiJikmomEhH5tWltrbWVwjp2al5mbkX1udHxxY2t9fHN1go6OhISTl4V7h41+bmhsbmdjdI6UjZOkoI2Afn53ZVpodW5pfpWXkpOYmY14c398Z2JxeXNweoqUj4eOmY14e4iDdG1udXJnZ32PioiXpJqKg4J/cV1ba3BmbouamZaXmJSBb3N9dGZsfH11dH2JjIaCjpiUkpiPbVJTYGheVWaHlpadpp+NgX6Agntqa3dwZXWSnp2am5qHaWN0eGpmcW9jYGp8kJqXlJmQfHmJko+EfH12Y2F+mJeWoaGOe3JwbmpgW2NkXGJ5kZ+gmZmXgW14jYp9go2Gd3V/jZSSj5SRfXJ2enduYVtfWk5dgZWUmKekj4CBiImCeHyBdnCAk52in5aSh3Bib3hrX2ZqX1lhdoqQjZKajXyBjo+NiYB+fnNtgJqfmZ2hlIByc3hvXFReW09YdImTmZmXkIN1eoiLgn6GiH13gZWemJKXkn1weH53bGReXFZRXnmLkJWbm5GCf4iNg3Z5gXlygZehoZ2YkYNwaG90bGNiY2BcX3KIkIqLlpCAgY+VjoaBgXxxcYWZnpqamI1+cm9zb1xRWV1VWXOLlJaWl5SGe4KQj4aDhoV/fYSTnpiNjIx9bm93dmteWltWUF96i46SmZqSi4qOlI6BfIKAeYCVoqCWjouAbGVtcmhfYGFeXWNyg4yJh46Oh4eSm5mPhYODe3WFmJuXlpOJfHJucGxeVFZZVlxugpCSjo2OhnuBkpWMiYyLhoOJlZyXjYuIfHJzd3ZtYFdYV1JZc4WJipCUj4eGjZSMgYCEgoCKmaSlnZGLg3NobXRsYV5fX1xfboCGgIGJiICEkJaWjoSChIB9i52hnJeVjoJ1cnZyYlVYW1ZbboGJjIiGiIJ7f4yQioWGiYiFipmim4+OjoB1d3t5b2NcW1lVX3WDh4iJi4mEgYmRi358hIN/iZqkpJuTjoV2b3R3b2VgX2BgYm+BiIJ/h4eAgYyUkomBgYN+foybnZmVkouCeHR3dmdYWV5dYHCCiouFhIeBfIKOkIqFg4SFhYqVnZiNiYmBeXh9fHNlXF5eW2N3hIaGiImIhYWMkIuAfIGBgIiWn6GYjYqFd292eXFoZGNiY2Zxf4SAfoOFgoSMkpOMgoCEf32KmZuXlJKMhHp3eXRnXV5fXWNwfoiJhIOGgnuAjY+IhYaHh4aKlpyWjYuJgXt7fXt0aGBgX1tic4CDhIaJiYWEi4+Jfn2CgoGKlp2el4+MhnpzeHlzamRkZWRmcH6BfX2DhIGEi5GRioGBg4CAi5eZlpGPjIV9eXx3aV9gYV9jcHyFhYKChYN/goqMh4ODhYeHipSalIuJiYN8fYB9dWpiY2JfZnR+gIKEh4mHhoqOiH57gIKCiZObm5SNioV7d3p6dGtmZWdoanN9gH58gISDhIuQj4mBf4KBgIqTlJGOi4mFf318eW5jYWNkaHJ9hIWAf4OCgISLi4eEgoOGh4mPlI+IhYWBfX6AfnhuZWVmZWl1fn+AgoSGh4eKjYiAfX6AgoePlpaRioeFfXd6e3VvaWhqbG50fYB9e36BgoWLj4+KgoCCgICHj5GPjImJhX98fHhuZWRlZ2tzfIOFgoCDg4CDiYqIhIKEh4eIj5OPiIWEgX59fn13bmZmaGdrdX2AgYGEh4eGio2JgHx/gYKHjpWVkImHhX55eXl0bmloa21vdX2BfHt/goKEio6OiYKAgoKCiI+QjouJiIaAfXx4bmVkZmlsdH2Dg4B/goSBg4iJhYKBg4eIiI6RjYeEhIOAfn99d21maGppbHZ9foCAg4eHhoiMiH98f4GDiI2Sko2HhYV/e3t6dW9sam1wcnZ8fnt6fYCDhomMjIiCf4KDg4eNjYuJh4eGg399eHBpZmlscHV9gYF/foGDgoSIioaDgYOGh4eLj4uGg4SDgYB/fnlxamlsbW92fH+AgIKFh4aIioeBfX+BhIeLkJCMhoSEgHx7e3hybmxvcXJ2e358en6ChYaJjIyIgX+Bg4KFi42LiYiIh4J+fXpya2psbnF1fIGBf36ChIOEh4iGgoGDhoeHio2KhYSFhIKAf355cGtrbm5wdnx+f4CChoeFhomGgH5/goSHiY6OioWFhoJ9fXx4cm5ucHJzdXt+e3t/g4WGiIuKhoB+goKChYqMioiGh4eDfn16cmtrbW9zdnuAgH5+goSDhIiIhYKAgoWGhYiLiYSDhISDgn99eXFsbW9wcnd8fn5/gYaHhoeIhYB/gIGFhoiLi4iFg4WCf358eHRwbnF0dHZ7fXx8foGEhoeJiIWBf4GDgoSIiYiGhYaGg39+e3VvbW9xdHd7foB+foCCgoOGh4WCgIKEhYSHiYeEg4SDg4KAfnpzb29xcnN3fH1+f4GFhoWGh4SAfn+Bg4WHioqIhISFgoB+fHl1cnBzdXZ3e318e36BhIWGh4iFgYCCgoKEhoiGhYSFhYN/fXx2cW9wc3V3e35/fn+Cg4SEhYaFgYCBhIWEhYeGg4KDhIOBf316dXFxc3R1eHx+fn+BhIaGhYaEgH+AgYOEhYiIhoODhIKAfn16d3NydHZ2d3t9fX1/goWGhYaHhICAgYGCg4WHhoSDhIWCf358d3NxcnR2eHt+f35+gIKEhYWGhYKBgYSEg4WGhYOCgoODgn9+e3ZycXJ0dXd6fn9/gYSGhYWGhYKAgIGDhYaHiIaDg4OCgH59e3h1c3N1dXd6fH19foGDhoWGh4WCgIGBgoOEhoeGhIWFg4B+fHhzcXBydXZ5fYB/f4GCg4SEhYWEgoGDhYSEhoaFg4KDhIKAf3x3c3FxcnN2en5/gICDhYaFhoWDgH+Bg4SFh4mIhYSDgoB+fXx4dHFyc3V2eX1+fX6BhIaFh4iHg4CBgYKDhYeHhoWEhYSAfn15c29ucHN1eH2AgH+Ag4SEhIaGhIGBg4SEhYeIhoOCg4OBgH58d3Jvb3FydXp+f3+Bg4WGhYaGhIB/gIOFhYiKiIWDg4OBf318eHNwcXJ0dnh9fn1+gYSFhoeIh4OAgIOEhIaIiYaEg4SEgX58eXNvbnBzdnl9f39+f4GEhYSGh4SCgoSGhoaIiIWDgoOEg4B+fHdwbm9xcnV6fn9/f4KFhoSFhoSAgIGDhYeIi4mGg4KCgX9+fXp1cXBydHV4fX9+foCDhYWFh4eCf3+AgoOFh4qHhYSFhIF+fXp1cHBxdHZ4foGBf3+BgoODhYaEgICChISEh4mHhIOEg4J/fn55cm9wcXN1en+BgIGDhYSDhIWDfn2AgoSFiIyLh4SEhIF+fHx5dHBxc3R1eH6Af36Ag4SFhYaGgn5+gYKChImKiIWFhoWBfn57dG5ucHJ1eH6CgX6Ag4ODg4SFg39/goSDhIiKh4SDhISCgYB/eXFubnBxdHl/gYCBg4aEg4WFgn58f4OEhYmMi4aEhIOBf359enNvcHJzdHh+f319gIOFhIWIh4J/f4KDhIaJi4iFhIaFgYB/e3RvbW9xc3d9gX9+f4KDgoOFhoN/f4KEhIWJioeDg4SEg4GCgHlyb3BwcHR6foB/f4OFhIOFhYJ9fH6CgoWIjIqGg4SEgYB/gHx2cnJzcnV5foB+foCDg4OFiIaBfn+AgIGFiImHhYWGhYGBgX12cG9wcnR4foKAfoCCgoGDhYaCf3+BgoKFiImGg4OFhIOCg4F6c3BxcXF0e3+AfoCDhYOEhoaCfXx/gIKEh4qKhYOFhIGBgYB8dXFyc3J0eX5/fn6Ag4OEhoeGgH1+gICBhYiJh4SFhoSCgoF9dnBvcHFzeH6Bf36AgoKDhIaGgn5+gYKDhYiIhoOCg4SDhIOBenNvb3BxdXp+f36Ag4OEhYeGgn59f4GDhYmKh4SCg4KBgYKBfXdycnJzdXl8fXx9f4KDhYiJh4F+fn9/goWIiYeEhYaDgoOCfXdyb3BydXl+gH9+gIGAgYOEhIJ/f4CAgYSGh4WDgoODg4SFgn13c3JxcnV6fYCAgYOEg4WFhIF9e3x+gYOIiomGg4OCgYGCgX56dnR1dHZ6fX59fX+Cg4SGh4SBfXt8fYCDhYeHhoWGhIWEgX15dHFyc3Z6foCBgICBgYKDhIOBf31+f4KFhoeGg4KDgoOEhIF9d3NxcnN2en5/gIGDhIWGhYOBfXt7fYCEh4iJh4SCg4KCgYB8eXZzc3V3enx+fn6AgoOGiIaEgX57fH+AhIaHhoWEhISEg4F+enRxcXN2en1/gIB/gIKEhYWEgoB9fX+ChIWGhYOBgYODhIOAfXhycXJ0d3p9f4B/gIKFh4WEgn98e32BhIeHiIaDgYGDgoKBfXl1cnF1eHl7fn99foGDhYeGhYN/e3x/gYKGh4aGg4KEhIOBf3x2c3N0d3p8f4KCf4CDg4KEg4B/fHt/goOEhoaDgYKDhISDgX56dXJ0dXZ6fX+BgIGDhYSDhIJ+e3t9gIOEhoeGg4KEhIKBgX57d3R0d3h5fH5/fn+Ag4SFhIWDfnt8f4CBg4WGhYOEhoWDgoB8d3NydHZ5fH+CgYCBg4SDgoOCf3x8f4GChIaFhIOCg4SDgoF/e3ZzdHV2eHt/gH+BhIaFhISDgHt6e36AgoWIh4WDhISDgH9+fHZzdHd4eXx/gH9+gISFhIWFg398fH6AgIKFhoSCg4aFg4KBfnlzcnR2d3p+gIB/gYKEhIKDg4B9fX+BgYOGh4WCgYODgoKCgXx3dHR1dnh6fX9+foOEhYSFhIF9eXt+f4GFh4iGhISFg4GBf3x4dXZ4eXp8f4GAfn+BgoGDg4J/fHx+f4CChIWEg4OFhYSDgoB7dnR1dnd7foGCgICDg4KBgoB9enp8foCChIeGg4KEg4OCg4J+eXZ3eHd5fH+Af4CBg4KDgoN/e3l7fX+Ag4aHhYOEhYWDg4J+eXZ1d3h6fICBgH+AgoGAgYCAfnp7f4CAgoWFhIOChYaEg4SCfHd1d3Z3en2BgoCAhISCgYKBfXp5fH6Ag4WIh4OCg4SDg4KBfnh1dnh4eX2AgYCAgYKDgoGCf3t5e31/gYSHiIWDhIWEgoOBf3p2dXZ3eXyAgoB/gIGAgYKBgH16e31/gYSHiIWDgoKDhIODgX13dXR1d3p+gIGAgIGCgYKCgH57eXt+gYSHiYiFgoOCgoOEgn96d3Z1dnp9gIF/gIGAgYGBgX56eXl6fYKEh4iGhYSEg4OEgn98eXZ2eHp9f4GBf3+AgIGBgH99eXh6e3+ChYeHhoOEhYSFhIF9eXd3dnl8foGCgYCBgH+AgH59enh5fH6BhYeGhoSDhISFg4OAe3h3d3h7fX+BgoCAgoGCgoF9end2eXyAg4eJh4WGhoSEg4F/fHh1d3l6foGCgYB/gIGBgoGAfXh3eXp+goSHiIeFhoeFhIOBfHd1dXZ6fYCDg4KBgYKBgoB9e3l2d3t/goaIiIeFhIOEg4KDgHt3dnd3en1+gYKAgIODgoKBfXl1dHd7gISIi4qIhoWEg4OBf3x4dXd5e32AgYB/fn+AgoOCgX55dnh6fYGFh4mIhoaHhoaEgX55dnR2eHt9goOCgIGBgH9+fnx5dnZ5fH+EiIiHhYSFhIWEhIN+end3eHl8f4GCgICCg4KBf316dXN1eX2BhoqLiYaHhYSDgoF+enZ4ent9gIKDgH5/f4CBgH99eHZ3eXx/goaJiIeHiIeGhYOAe3d0dnh6fYGEg4GBgoGAfnx8eHR1eHt+g4eJiIeHhoeGg4KBfHl3eHh6fH6CgoB/goKAf4B+eXZ0dXp9gIWJiYmIiYiGhIKAfnp2d3p6e3+CgYGAgIGAf39/fHd1dnd7f4KGiYmHiImHhoSDf3t4d3h5en2BgoCAf4CAf39+fHl2dHh7foKGiImHhoeIh4WEgn55eHh4en1/gYJ/foCAf4B/fXl3dXZ6fYCEiIiGhoiHhoaFgoB8eHh6e32AgYGAfn6BgH5/fnt3dHZ4e36ChYaGhYaIhoWGhIF/e3p7fH5/gYGAfn+Af4B/fnx4dXV3eHuBhIWGhYWGh4aGhYN/fHt8fH1/gYGAf3+Af35/f316eHV3eXp+gYOEhYaHh4aHhoOBfnx7fHt+gYGAgYB/gH9+f316d3Z3eXt+gYOEhYSFh4aGh4WBf3x8fXx+gIB/fX5/gIB/gH57eHZ2eXl7gIODhIWGh4eGhYWCfn59fn5+gIF/f359f39+gIB9enh3d3l6foGCg4SFh4aHh4eEgn99fH18foF/fn9+fn9+f399eXd2d3h6foGDhISDhIaFhoiGg4F/fX1+foCAfn19fn9+f4F/fHp3dnd5e4CCgoOFhISFhYaGhIKAf31+f4GBf35+fX1+foCAfXt6d3d4enx/gICChIOEhYeHhYOCf35+foGCgYCBgH5/fn9/fnt5eHd3eX1/gIGBgoKDgoSGhYOCgX5+f4CBgoB+gH99foCAf317eXd2d3p+gH+Cg4KDhISFhYOBgH9+foCCgoGBgH5+fX5/gH17fHl3eXp8f39/goOCg4WGhYSDgn9+fX+Bg4GBgoB+fX5+f317e3p4eHt+gICBgYKCgYKFhoSDhIJ/fn+AgYB/gIB+fX+Af317enl3d3l8gIGAgoSBgYOEhISDgoOAfn+Cg4F/gIB+fX1+gH98e3t4dnl7fn+BgIKCgYKEhYWDgoJ/fX6AgoOBgIF/fHx+fn19e3x6eHh8fn+AgIKBf4CDhYaFg4SCfn6AgIGCgICBf31/gH99e3p5d3h6foCAgYKCf3+Cg4OEg4KCgX+Ag4GAgIGAfn5/gYB/fXt7eHZ5fH1+f4CBgoGBhISDgoOCf36AgoOEg4GCgHx+f39+fXx7enl5fH59fn+Af3+BgoSFhIODgX5+gYGBgoKBgX9+f4B/fHx7eXh5fH5/gH+AgH5+gYOCg4OCgoGAgYOCgYCAf31+f4CBf319fHl3en19f4B/gIGAgYOEgoKCgYB/gIKDgoKBgX99fn9/fn18fHx6en1+fX5/gH+AgIOEg4ODgoF/f4GCgYCBgIF/fX9/fnx9fHt6en1+gH9/gYB+f4GDgoODgoKAfoCCgX+BgYB/fn+Af358fXx6eXx+f3+AgYGAf4GDg4KCg4GAf4CCgoGAgYB/fH2Afn1+fn19enp9f35+gICAf4CCg4OCgoOCf3+BgoGBgoGBf31/gH18fn18e3p8fn9+f4CAfn6AgoKBgoOCgX+AgoGAgIGAf31+gIB+fX19e3p7fn5+gICBgH6AgoKAgYKBgH+AgoOBgICBgH59f399fX59fXt7fn99fn+Af36AgYOCgYGCgn9/gIKBgIGBgH9+f4B/fX5+fXt7fH5/f4CBgH99gIGAgIGCgYB/gIKCgIGCgH59fn+Af35/fnx7fH5/fn+BgIB/gIGBgICBgH9+f4CCgYGCgYB+fn9/fn5/f318fX9/fn+AgH9/f4CCgYGCgYB+f4CAf4CBgIB/foCAf35/fn17fH1+gICBgoF/foCAf4CBgIB/foCBgYCBgH9+fn9/gH9/gH59e31+f36AgYCAf4CBgYCAgX9+f3+AgYCBgoGAfn5/f31+f359fH1/f39/gIB/fn+AgYCAgoGAf3+AgX+AgIGAf3+AgH9/fn99fHx+f35/gICAf35/gH9+f4B/gH+AgYB/gIB/gH+Af4B/f39+fn1+f39+f4B/gH+Af4B/gH+Af35/gH+Af4B/gICAgIB/fn9+f39+f39/f39/f39/gIB/gH+Af4B/gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA


rem ############################################################################################################################


:CursorChangerOOBE
if not "%bootbatnow%"=="true" (
if "%linuxboot%"=="true" (
echo.&echo [%linuxishclr%info%linuxishclr2%] ‰Šúˆ—‚ªŠ®—¹‚µ‚Ü‚µ‚½I&echo.
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] SAB_Manager ŒÄ‚Ño‚µ’†&echo.)
)
)
rem Detects whether this is the first start
if exist %Settingsfile% set firststartbat=no& set bootbatnow=yes& goto :batstart
if not exist %Settingsfile% (
if exist %FirstSTFsfile% goto :settingloads
)
if not defined dummy (echo [38;2;5;5;5myou know what i HATE? that's [3mbepis[0m[38;2;5;5;5m.)
if not defined dummy (echo [38;2;5;5;5mTHE TASTE, the smell, the texture... hey.... your [3mdrooling[0m[38;2;5;5;5m......)
pathping 127.0.0.1 -n -q 1 -p 100 1>nul
setlocal enabledelayedexpansion
title ƒJ[ƒ\ƒ‹‘Ö‚¦‚Ö‚æ‚¤‚±‚»
cls


:CursorChangerOOBE_Animation
setlocal enabledelayedexpansion
rem Play CursorChangerOOBE_Animations that appear slowly
if not defined dummy (set /p nothing=[?25l<nul)
set /a count+=10
set clresc=%count%;%count%;%count%
set "show=[2;24H[38;2;%clresc%mƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ‚Ö‚æ‚¤‚±‚» [0m"
echo.
echo %show%
rem call background_menu to drew bg
call :Background_menu 1
if "%count%" == "200" (pathping 127.0.0.1 -n -q 1 -p 250 1>nul & set count=& goto :CursorChangerOOBE_Animation2) else (
    pathping 127.0.0.1 -n -q 1 -p 100 1>nul
)
goto :CursorChangerOOBE_Animation

:CursorChangerOOBE_Animation2
rem Play CursorChangerOOBE_Animations that appear slowly but more darker
set /a count+=10
set clresc=%count%;%count%;%count%
set "show2=[5;26H[38;2;%clresc%m[‰½‚©ƒL[‚ğ‰Ÿ‚µ‚Än‚ß‚é] [0m"
echo.
echo %show%
echo.& echo.
echo %show2%
if "%count%" == "120" (
    set clresc=& pause >nul& echo.& echo %show%& pathping 127.0.0.1 -n -q 1 -p 250 1>nul
    set count=200& set count2=120& set clresc=204;204;204
    goto :CursorChangerOOBE_Animation3
) else (
    pathping 127.0.0.1 -n -q 1 -p 100 1>nul
    goto :CursorChangerOOBE_Animation2
)

:CursorChangerOOBE_Animation3
rem live together, die together.
set /a count-=10& set /a count2-=6
set clresc=%count2%;%count2%;%count2%
set "show2=[5;26H[38;2;%clresc%m[‰½‚©ƒL[‚ğ‰Ÿ‚µ‚Än‚ß‚é] [0m"
echo.
echo %show%
echo.& echo.
echo %show2%
rem call background_menu to drew bg
call :Background_menu 1
if !count2! leq 12 (
    if !count! leq 20 (pathping 127.0.0.1 -n -q 1 -p 250 1>nul& set count=& set count2=0& set clresc=200;200;200& set clrmove=22& goto :CursorChangerOOBE_Animation4)
) else (
    pathping 127.0.0.1 -n -q 1 -p 500 1>nul
    goto :CursorChangerOOBE_Animation3
)

:CursorChangerOOBE_Animation4
echo %show%
rem Play CursorChangerOOBE_Animations that move left
set "show=[2;%clrmove%H[38;2;%clresc%mƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ‚Ö‚æ‚¤‚±‚»   [0m"
set /a clrmove-=1
if %clrmove% equ 1 (
    goto :CursorChangerOOBE_Animation5
) else (
    pathping 127.0.0.1 -n -q 1 -p 100 1>nul
    goto :CursorChangerOOBE_Animation4
)

:CursorChangerOOBE_Animation5
rem WOW IT CHANGED INTO SETUP!!!!!!!!!
pathping 127.0.0.1 -n -q 1 -p 500 1>nul & cls
set "show=[38;2;%clresc%m  ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒZƒbƒgƒAƒbƒv [0m"
echo.
echo %show%
pathping 127.0.0.1 -n -q 1 -p 500 1>nul
set show=& set show2=& set clresc=& set clrmove=& set count2=& set count=
setlocal disabledelayedexpansion
goto :CursorChangerOOBEdev


:Header_Drawer
rem Drawing Header of OOBE
rem Set the color of Header
if "%2"=="true" (set /p nothing=[107m[30m<nul& for /l %%i in (0,1,5) do (set /p nothing=[%%i;0H[0K<nul)) else if "%2"=="false" (set /p nothing=%clr2%<nul& for /l %%i in (0,1,5) do (set /p nothing=[%%i;0H[0K<nul)) else if "%oobetheme%"=="white" (set /p nothing=[107m[30m<nul) else (set /p nothing=%clr2%<nul)
rem Clear Texts
if not defined dummy (for /l %%i in (5,1,21) do (set /p nothing=[%%i;0H[0K<nul))
if not defined dummy (set /p nothing=[0;0H<nul)
echo.& echo   ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒZƒbƒgƒAƒbƒv& echo ====================================O
if "%1"=="1" (set /p nothing=ƒZƒbƒgƒAƒbƒv‚Ìi’» : 1/5 ^(’ˆÓ–€‚ÌŠm”F^)<nul& title ƒJ[ƒ\ƒ‹‘Ö‚¦‚ÌƒZƒbƒgƒAƒbƒv ^| i’» : 1/5
) else if "%1"=="2" (set /p nothing=ƒZƒbƒgƒAƒbƒv‚Ìi’» : 2/5 ^(î•ñ‚ÌŠm”F^)<nul& title ƒJ[ƒ\ƒ‹‘Ö‚¦‚ÌƒZƒbƒgƒAƒbƒv  ^| i’» : 2/5
) else if "%1"=="3" (set /p nothing=ƒZƒbƒgƒAƒbƒv‚Ìi’» : 3/5 ^(ƒJ[ƒ\ƒ‹‘Ö‚¦‚Ìƒe[ƒ}‚Ìİ’è^)<nul& title ƒJ[ƒ\ƒ‹‘Ö‚¦‚ÌƒZƒbƒgƒAƒbƒv  ^| i’» : 3/5
) else if "%1"=="4" (set /p nothing=ƒZƒbƒgƒAƒbƒv‚Ìi’» : 4/5 ^(İ’è‚ÌƒJƒXƒ^ƒ}ƒCƒY^)<nul& title ƒJ[ƒ\ƒ‹‘Ö‚¦‚ÌƒZƒbƒgƒAƒbƒv  ^| i’» : 4/5
) else if "%1"=="5" (set /p nothing=ƒZƒbƒgƒAƒbƒv‚Ìi’» : 5/5 ^(ƒZƒbƒgƒAƒbƒvŠ®—¹^)<nul& title ƒJ[ƒ\ƒ‹‘Ö‚¦‚ÌƒZƒbƒgƒAƒbƒv  ^| i’» : 5/5)
if not "%1"=="0" (if not defined dummy (set /p nothing=[0K<nul) & echo.)
exit /b

:Underbar_Drawer
rem Drawing Underbar of OOBE
rem I didn't know ESC[0K is so useful
if not defined dummy (set /p nothing=[22;0H<nul)
if "%1"=="0" (set /p nothing=%clr2%%clrwhi%[0K%moveline%%clrwhi%<nul& exit /b
) else if "%1"=="1" (set /p nothing=%clrwhi%[0K     Y=‘±s     S=ƒXƒLƒbƒv     B=‘Şo     %moveline%%clrwhi%<nul& exit /b
) else if "%1"=="2" (set /p nothing=%clr2%%clrwhi%[0K     Y=ƒXƒLƒbƒv     N,B=ƒXƒLƒbƒv‚µ‚È‚¢     %moveline%%clrwhi%<nul& exit /b
) else if "%1"=="3" (set /p nothing=%clr2%%clrwhi%[0K     Y=‘±s     N=‚¢‚¢‚¦     %moveline%%clrwhi%<nul& exit /b
) else if "%1"=="4" (set /p nothing=%clr2%%clrwhi%[0K     Y=‚Í‚¢     N=‚¢‚¢‚¦     %moveline%%clrwhi%<nul& exit /b
) else if "%1"=="5" (set /p nothing=%clr2%%clrwhi%[0K     Y=‘±s     [22;78H1/3%moveline%%clrwhi%<nul& exit /b
) else if "%1"=="6" (set /p nothing=%clr2%%clrwhi%[0K     Y=‘±s     [22;78H2/3%moveline%%clrwhi%<nul& exit /b
) else if "%1"=="7" (set /p nothing=%clr2%%clrwhi%[0K     Y=‘±s     [22;78H3/3%moveline%%clrwhi%<nul& exit /b
) else if "%1"=="8" (set /p nothing=%clr2%%clrwhi%[0K     A,1=¶‚ÉˆÚ“®     D,2=‰E‚ÉˆÚ“®     B=‘Şo     %moveline%%clrwhi%<nul& exit /b
) else if "%1"=="9" (set /p nothing=%clr2%%clrwhi%[0K     A,1=¶‚ÉˆÚ“®     D,2=‰E‚ÉˆÚ“®     Y,E=Œˆ’è     B=‘Şo     %moveline%%clrwhi%<nul& exit /b
) else if "%1"=="10" (set /p nothing=%clr2%%clrwhi%[0K     Y,E=Œˆ’è     B,N=‘Şo     %moveline%%clrwhi%<nul& exit /b
) else if "%1"=="11" (set /p nothing=%clr2%%clrwhi%[0K     W,S ‚Ü‚½‚Í 1~5=ˆÚ“®     Y=Ø‚è‘Ö‚¦     N,B=”jŠü     %moveline%%clrwhi%<nul& exit /b
) else if "%1"=="12" (set /p nothing=%clr2%%clrwhi%[0K     Y,E=‘Şo     %moveline%%clrwhi%<nul& exit /b)
exit /b

:OOBE_EndLine
if not defined dummy (set /p nothing=[22;0H<nul& exit /b)


:CursorChangerOOBEdev
rem Now, it's the beginning of a fucking trashy long goofy ahh idiot code.
title ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒZƒbƒgƒAƒbƒv
if not defined dummy (set clr=[3m[97m&set clrhigh=[7m&set clrhighend=[0m&set clrwhi=[48;5;250m[30m&set clr2=[0m&set clrgra=[90m)
if not defined dummy (set moveline=[22;0H)
if not defined dummy (set /p nothing=[?25l<nul)
mode con: cols=80 lines=22
call :Underbar_Drawer 1 & call :Header_Drawer 0
echo.
echo     %clr% ƒZƒbƒgƒAƒbƒv‚Ö‚æ‚¤‚±‚»B%clr2%
echo.
echo     ƒJ[ƒ\ƒ‹‘Ö‚¦‚Ì‰‰ñ‹N“®‚ÆƒZƒbƒgƒAƒbƒv‚Ö‚æ‚¤‚±‚»B
echo     ‚±‚ÌƒZƒbƒgƒAƒbƒv‚ÍƒJ[ƒ\ƒ‹‘Ö‚¦‚ğ‚¨g‚¢‚Ì
echo     ƒRƒ“ƒsƒ…[ƒ^[‚ÅÀs‚Å‚«‚éó‘Ô‚É‚·‚é‚½‚ß‚ÌƒZƒbƒgƒAƒbƒv‚Å‚·B
echo.
echo.
echo        ^E   ¡‚·‚®ƒZƒbƒgƒAƒbƒv‚·‚éê‡‚ÍAYƒL[‚ğ‰Ÿ‚µ‚Ä‚­‚¾‚³‚¢B
echo.
echo        ^E   ƒZƒbƒgƒAƒbƒv‚ğƒXƒLƒbƒv‚µ‚Ä¡‚·‚®—˜—p‚·‚éê‡‚ÍA
echo             SƒL[‚ğ‰Ÿ‚µ‚Ä‚­‚¾‚³‚¢B(İ’è‚Í‚·‚×‚ÄŠù’è’l‚Éİ’è‚³‚ê‚Ü‚·B)
echo.
echo        ^E   ƒZƒbƒgƒAƒbƒv‚ğ‚¹‚¸‚ÉI—¹‚·‚éê‡‚ÍABƒL[‚ğ‰Ÿ‚µ‚Ä‚­‚¾‚³‚¢B
call :OOBE_EndLine
choice /c YSB /n >nul
if %ErrorLevel%==1 call :OOBEmainblank & goto :OOBEmain
if %ErrorLevel%==2 goto :OOBESkip
if %ErrorLevel%==3 call :OOBEmainshutdown& timeout /t 1 /nobreak >nul&call :exit 

:OOBESkip
call :Underbar_Drawer 2 & call :Header_Drawer 0
echo.
echo.
echo          ƒZƒbƒgƒAƒbƒv‚ğƒXƒLƒbƒv
echo.
echo          ‚à‚µƒZƒbƒgƒAƒbƒv¡ƒXƒLƒbƒv‚·‚é‚ÆA‚·‚×‚Ä‚Ìİ’è‚Ì’l‚Æ
echo          ƒe[ƒ}‚ÍŠù’è’l‚Éİ’è‚³‚ê‚Ü‚·B
echo          ‚Ü‚½Ad—v‚È‹K’è–€‚â’ˆÓA–ÆÓ–€‚ğ“Ç‚İ“¦‚·‚±‚Æ‚É‚È‚è‚Ü‚·B
echo          –ÆÓ–€‚ÉŠÖ‚µ‚Ä‚ÍAƒXƒLƒbƒv‚µ‚Ä‚à“¯ˆÓ‚µ‚½‚±‚Æ‚É‚È‚è‚Ü‚·B
echo.
echo          ‚»‚ê‚Å‚à‚æ‚ë‚µ‚¢‚Å‚·‚©H
echo.
echo          (Y=‚Í‚¢BƒZƒbƒgƒAƒbƒv‚Æ‚©–Ê“|‚­‚³‚¢B)
echo          (N=‚¢‚¢‚¦BƒZƒbƒgƒAƒbƒv‚µ‚½‚¢‚Å‚·I)
call :OOBE_EndLine
choice /c YNB /n >nul
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&set oobetheme=dark&set OOBEsetting1toggle=false&set OOBEsetting2toggle=false&set OOBEsetting3toggle=false&set OOBEsetting4toggle=true&set OOBEsetting5toggle=true&set YourName=%Username%& goto :OOBEmain8
if %ErrorLevel%==2 goto :CursorChangerOOBEdev
if %ErrorLevel%==3 goto :CursorChangerOOBEdev

:OOBEmain
curl -silent http://www.msftconnecttest.com/connecttest.txt | find "Microsoft Connect Test" >nul
if "%errorlevel%"=="1" (call :OOBEmainblank & timeout /t 1 /nobreak >nul & goto :OOBEmain2)
curl -silent http://www.msftncsi.com/ncsi.txt | find "Microsoft NCSI" >nul
if "%errorlevel%"=="1" (call :OOBEmainblank & timeout /t 1 /nobreak >nul & goto :OOBEmain2)
ping -n 1 google.com >nul
if "%errorlevel%"=="1" (call :OOBEmainblank & timeout /t 1 /nobreak >nul & goto :OOBEmain2)
call :Underbar_Drawer 3 & call :Header_Drawer 0 
echo.
echo.
echo          Windows XP‚ÌOOBE BGM‚ğ•·‚«‚È‚ª‚çƒZƒbƒgƒAƒbƒv‚µ‚Ü‚·‚©H
echo.
echo          •·‚«‚½‚¢‚È‚çAYƒL[‚ğ‰Ÿ‚µ‚Ä‚­‚¾‚³‚¢B
echo          •·‚«‚½‚­‚È‚¢‚È‚çANƒL[‚ğ‰Ÿ‚µ‚Ä‚­‚¾‚³‚¢B
echo.
echo.
echo          %clrgra%(Y‚ğ‰Ÿ‚·‚Æ–ñ15MB’ö“x‚Ìƒ_ƒEƒ“ƒ[ƒh‚ª”­¶‚µ‚Ü‚·B)%clr2%
call :OOBE_EndLine
choice /c YN /n >nul
if %ErrorLevel%==1 goto :OOBEmainmusic
if %ErrorLevel%==2 call :OOBEmainblank&timeout /t 1 /nobreak >nul&goto :OOBEmain2


:OOBEmainmusic
call :Underbar_Drawer 0 & call :Header_Drawer 0
echo.
echo.
echo          ‰¹Šy‚Ìƒ_ƒ“ƒ[ƒh‚ğ€”õ‚µ‚Ä‚¢‚Ü‚·...‚µ‚Î‚ç‚­‚¨‘Ò‚¿‚­‚¾‚³‚¢B
call :OOBE_EndLine
call :Powersheller OOBEMusic
goto :OOBEmainmusicmessage2

:OOBEmainblank
call :Underbar_Drawer 0 & call :Header_Drawer 0
echo.
echo.
call :OOBE_EndLine
exit /b


:OOBEmainshutdown
call :Underbar_Drawer 0 & call :Header_Drawer 0
echo.
echo.
echo          ƒVƒƒƒbƒgƒ_ƒEƒ“’†...
call :OOBE_EndLine
exit /b


:OOBEmainmusicmessage2
set batchpath=
call :Underbar_Drawer 0 & call :Header_Drawer 0
echo.
echo.
echo          Š®—¹B
echo.
echo          ‰¹Šy‚ªÄ¶‚³‚ê‚é‚Ü‚Å‚É‘½­ŠÔ‚ª‚©‚©‚éê‡‚ª‚ ‚è‚Ü‚·B
echo          ‰¹Šy‚ğ’â~‚µ‚½‚¢‚Æ‚«‚ÍAÅ¬‰»‚³‚ê‚Ä‚¢‚épowershell‚ğ’â~‚µ‚Ä‚­‚¾‚³‚¢B
echo.
echo          ‰¹Šy‚ª‚¢‚Â‚Ü‚Å‚½‚Á‚Ä‚àÄ¶‚³‚ê‚È‚¢ê‡AˆÈ‰º‚Ì–€‚ğŠm”F‚µ‚Ä‚­‚¾‚³‚¢B
echo.
echo          ƒAƒ“ƒ`ƒEƒBƒ‹ƒXƒ\ƒtƒg‚ğŠm”F‚·‚é
echo          Github‚ª—LŒø‚©‚Ç‚¤‚©Šm”F‚·‚é
echo          Github‚ÌAPIƒŒ[ƒg§ŒÀ‚É“’B‚µ‚Ä‚¢‚È‚¢‚©‚Ç‚¤‚©
echo          Powershell‚ª—˜—p‰Â”\‚©‚Ç‚¤‚©
echo.
echo          (5•bŒã‚ÉƒZƒbƒgƒAƒbƒv‚ğ‘±s‚µ‚Ü‚·)
call :OOBE_EndLine
timeout /t 5 /nobreak >nul
call :OOBEmainblank
timeout /t 1 /nobreak >nul
goto :OOBEmain2


:OOBEmain2
call :Underbar_Drawer 5 & call :Header_Drawer 1
echo.
echo.
echo          ƒJ[ƒ\ƒ‹‘Ö‚¦‚Í“ñ‚Â‚Ìƒtƒ@ƒCƒ‹‚ğ¶¬‚µ‚Ü‚·B
echo          %Settingsfile%‚Æ%FirstSTFsfile%‚Ì“ñ‚Â‚Å‚·B
echo.
echo          %Settingsfile%‚ÍƒJ[ƒ\ƒ‹‘Ö‚¦‚Ìİ’è‚ğ•Û‘¶‚µ‚Ä‚¢‚Ü‚·B
echo          ‚±‚Ìƒtƒ@ƒCƒ‹‚Í”ñí‚Éd—v‚Èƒtƒ@ƒCƒ‹‚Å‚·B
echo.
echo          %FirstSTFsfile%‚ÍƒJ[ƒ\ƒ‹‚ğ•ÏX‚µ‚½‚©‚Ç‚¤‚©‚Ì”»’è‚É—˜—p‚µ‚Ä‚¢‚Ü‚·B
echo          ‚±‚ê‚à‚Ü‚½d—v‚Èƒtƒ@ƒCƒ‹‚Å‚·B
echo.
echo          ‚à‚µƒ†[ƒU[(%USERNAME%A‚ ‚È‚½‚Å‚·)‚ª‚±‚ê‚ç‚Ìƒtƒ@ƒCƒ‹‚ğíœ‚·‚é‚ÆA
echo          ‚±‚ÌƒJ[ƒ\ƒ‹‘Ö‚¦‚Í³í‚É“®ì‚µ‚È‚­‚È‚éê‡‚ª‚ ‚è‚Ü‚·B
echo          ‚Å‚·‚©‚çA‚±‚ê‚ç‚Ìƒtƒ@ƒCƒ‹‚ğâ‘Î‚Éíœ‚µ‚È‚¢‚Å‚­‚¾‚³‚¢Bâ‘Î‚ÉB
echo.
echo          (Y ƒL[‚Å‘±s)
echo.
choice /c Y /n >nul
if %ErrorLevel%==1 goto :OOBEmain3


:OOBEmain3
call :Underbar_Drawer 6 & call :Header_Drawer 1
echo.
echo.
echo          ‚±‚ÌƒJ[ƒ\ƒ‹‘Ö‚¦‚ÌŠJ”­Ò‚Å‚ ‚étamago_1908‚ÍA
echo          ‚±‚ÌƒJ[ƒ\ƒ‹‘Ö‚¦‚É‚æ‚Á‚Ä”­¶‚µ‚½‚¢‚©‚È‚é‘¹¸E‘¹ŠQ‚É‘Î‚µ‚ÄA
echo          ‚¢‚©‚È‚éÓ”C‚ğ•‰‚í‚È‚¢‚à‚Ì‚Æ‚µ‚Ü‚·B
echo.
echo          Œ¾‚¢Š·‚¦‚ê‚ÎA‚±‚ÌƒJ[ƒ\ƒ‹‘Ö‚¦‚ğÀs‚µ‚½‚±‚Æ‚É‚æ‚éÓ”C‚É‚Â‚¢‚Ä‚ÍA
echo          ‚·‚×‚ÄƒJ[ƒ\ƒ‹‘Ö‚¦‚ğÀs‚µ‚½–{l‚É‹A‘®‚µ‚Ü‚·B
echo.
echo          ‚½‚¾‚µAtamago_1908‚Í‚±‚ÌƒJ[ƒ\ƒ‹‘Ö‚¦‚É‘¶İ‚·‚éƒoƒO‚â–â‘è
echo          ‚É‘Î‚·‚é‘Î‰‚âC³AƒTƒ|[ƒg‚È‚Ç‚Ís‚¤‚±‚Æ‚Æ‚µ‚Ü‚·B
echo          ƒTƒ|[ƒgŠúŠÔ‚É‚Â‚¢‚Ä‚Ígithub‚ğ‰{——‚µ‚Ä‚­‚¾‚³‚¢ (‰pŒê)
echo          ‚Ü‚½AˆÈã‚Ì–ÆÓ–€‚Í‚·‚×‚ÄƒJ[ƒ\ƒ‹‘Ö‚¦‚ÌGithub‚É‚ ‚éAReadme
echo          ‚Æ“¯‚¶ˆÓ–¡‚ğ‚¿‚Ü‚·B•K—v‚É‰‚¶‚ÄŠm”F‚µ‚Ä‚­‚¾‚³‚¢B
echo.
echo          (Y ƒL[‚Å‘±s)
echo.
choice /c Y /n >nul
if %ErrorLevel%==1 goto :OOBEmain4


:OOBEmain4
call :Underbar_Drawer 7 & call :Header_Drawer 1
echo.
echo.
echo          ‚±‚ÌƒJ[ƒ\ƒ‹‘Ö‚¦‚Íwindows 10 1803ˆÈ~‚Å‚Ì“®ì‚ğ„§‚µ‚Ä‚¢‚Ü‚·B
echo          ‚»‚êˆÈ‰º‚Ìƒo[ƒWƒ‡ƒ“‚ÌWindows‚Å‚Ì“®ì‚ÍƒTƒ|[ƒg‚µ‚Ä‚¢‚Ü‚¹‚ñB
echo          ‚Ü‚½APowershell 5.1ˆÈ~‚Ìƒo[ƒWƒ‡ƒ“‚ª„§‚³‚ê‚Ä‚¢‚Ü‚·B
echo.
echo          ƒCƒ“ƒ^[ƒlƒbƒgÚ‘±‚Í•K{‚Å‚Í‚ ‚è‚Ü‚¹‚ñ‚ªA‚ ‚Á‚½‚Ù‚¤‚ª—Ç‚¢‚Å‚·B
echo          (ƒAƒbƒvƒf[ƒg‚Ìƒ`ƒFƒbƒN“™‚É—˜—p‚µ‚Ü‚·)
echo.
echo          ‚Ü‚½A‚¨g‚¢‚ÌPC‚Ì«”\‚Í‚Å‚«‚é‚¾‚¯‘‚¢•û‚ª—Ç‚¢‚Å‚·B
echo          ‹°‚ë‚µ‚­‘¬‚¢CPU‚â‚Ì‚ë‚Á‚¿‚¢CPU‚Å‚ÍAƒAƒjƒ[ƒVƒ‡ƒ“
echo          ‚âˆ—‚É‰e‹¿‚ğ‹y‚Ú‚·‰Â”\«‚ª‚ ‚è‚Ü‚·B
echo.
echo          (Y ƒL[‚Å‘±s)
call :OOBE_EndLine
choice /c Y /n >nul
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul


:OOBEmain5
call :Underbar_Drawer 4 & call :Header_Drawer 2
echo.
echo.
echo          Œ»İAƒJ[ƒ\ƒ‹‘Ö‚¦‚Í“ú–{Œê”Å‚ªƒCƒ“ƒXƒg[ƒ‹‚³‚ê‚Ä‚¢‚Ü‚·B
echo          ‚±‚ê‚Å‚¢‚¢‚Å‚·‚©H
echo.
echo.
echo          (Y=‚Í‚¢B³‚µ‚¢BŒ¾‚¤‚Ü‚Å‚à‚È‚¢B)
echo          (N=‚¢‚¢‚¦B‚É‚Ù‚ñ‚²‚ª‚í‚©‚è‚Ü‚¹‚ñ)
call :OOBE_EndLine
choice /c YN /n >nul
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto :OOBEmain5_1
if %ErrorLevel%==2 goto :OOBEmain5ifno


:OOBEmain5ifno
call :Underbar_Drawer 4 & call :Header_Drawer 2
echo.
echo.
echo          \‚µ–ó‚ ‚è‚Ü‚¹‚ñ‚ªAŒ»İƒJ[ƒ\ƒ‹‘Ö‚¦‚Í‰pŒê‚Æ“ú–{Œê
echo          ˆÈŠO‚ÌŒ¾Œê‚ğƒTƒ|[ƒg‚µ‚Ä‚¢‚Ü‚¹‚ñB
echo.
echo          ‚à‚µƒJ[ƒ\ƒ‹‘Ö‚¦‚ğã‹L‚Ì“ñ‚ÂˆÈŠO‚ÌŒ¾Œê‚Å—˜—p‚µ‚½‚¢ê‡‚É‚ÍA
echo          ƒAƒbƒvƒf[ƒg‚ğ‘Ò‚Â‚©A‚ ‚«‚ç‚ß‚é•K—v‚ª‚ ‚è‚Ü‚·B
echo          ‚»‚ê‚Å‚à‚È‚¨ƒZƒbƒgƒAƒbƒv‚ğ‘±‚¯‚Ü‚·‚©H
echo.
echo.
echo          (Y=‚Í‚¢BƒZƒbƒgƒAƒbƒv‚ğ‘±‚¯‚Ü‚·B)
echo          (N=‚¢‚¢‚¦B‚â‚Á‚Ï‚èƒZƒbƒgƒAƒbƒv‚ğ‚â‚ß‚Ü‚·B)
call :OOBE_EndLine
choice /c YN /n >nul
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto :OOBEmain5_1
if %ErrorLevel%==2 call :OOBEmainshutdown & timeout /t 1 /nobreak >nul&call :exit 0


:OOBEmain5_1
call :Underbar_Drawer 4 & call :Header_Drawer 2
echo.
echo.
echo          ƒJ[ƒ\ƒ‹‘Ö‚¦‚ª‚ ‚È‚½‚Ì–‚ğ‰½‚ÆŒÄ‚ñ‚Å—~‚µ‚¢‚©‚ğ“ü—Í‚Å‚«‚Ü‚·B
echo          ƒfƒtƒHƒ‹ƒg‚Å‚ÍAƒJ[ƒ\ƒ‹‘Ö‚¦‚Í‚ ‚È‚½‚Ì‚±‚Æ‚ğ"%USERNAME%"‚ÆŒÄ‚Ñ‚Ü‚·B
echo          •ÏX‚µ‚Ü‚·‚©H
echo.
echo.
echo          (Y=‚Í‚¢A•ÏX‚µ‚Ü‚·B)
echo          (N=‚¢‚¢‚¦A‚»‚Ì‚Ü‚Ü‚ÅB)
call :OOBE_EndLine
choice /c YN /n >nul
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto :OOBEmain5_2
if %ErrorLevel%==2 call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto :OOBEmain6


:OOBEmain5_2
set YourName=
call :Underbar_Drawer 0 & call :Header_Drawer 2
echo.
echo.
echo          ‚Å‚ÍAˆÈ‰º‚É‚È‚ñ‚ÆŒÄ‚Î‚ê‚½‚¢‚©‚ğ“ü—Í‚µ‚Ä‚­‚¾‚³‚¢B
echo.
echo.
echo          “ü—Í—“ :
call :OOBE_EndLine
if not defined dummy (set /p YourName=%clr2%[10;18H[?25h& set /p nothing=[?25l<nul)
if %ErrorLevel%==2 goto :OOBEmain5_2c


:OOBEmain5_2c
if not defined Yourname goto :OOBEmain5_2c_error
call :OOBEmain5_2c_Easteregg
if "%errorlevel%"=="1" (goto :OOBEmain5_2) else if "%errorlevel%"=="2" (cls & mode con: cols=75 lines=25 & title ƒJ[ƒ\ƒ‹‘Ö‚¦& goto :CursorChangerOOBE)
call :Underbar_Drawer 4 & call :Header_Drawer 2
echo.
echo.
echo          "%YourName%"‚Æ“ü—Í‚µ‚Ü‚µ‚½B
echo          ‚±‚ê‚Å‚¢‚¢‚Å‚·‚©H
echo.
echo.
echo          (Y=‚Í‚¢I)
echo          (N=‚¢‚¢‚¦)
call :OOBE_EndLine
choice /c YN /n >nul
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto :OOBEmain6
if %ErrorLevel%==2 goto :OOBEmain5_2


:OOBEmain5_2c_error
call :Underbar_Drawer 0 & call :Header_Drawer 2
echo.
echo.
echo          ‚ ‚È‚½‚Ì–¼‘O‚É‚Í•K‚¸‰½‚©‚ğ“ü—Í‚µ‚Ä‚­‚¾‚³‚¢B
echo          –¼‘O‚È‚µ‚Å‘±s‚·‚é‚±‚Æ‚Í‚Å‚«‚Ü‚¹‚ñI
echo.
echo.
echo          (‰½‚©ƒL[‚ğ‰Ÿ‚µ‚Ä‘±s...)
call :OOBE_EndLine
pause >nul
goto :OOBEmain5_2


:OOBEmain5_2c_Easteregg
if "%YourName%"=="tamago_1908" (set "OOBEmain5_2c_Easteregg_TextTemp=‚»‚ê–l‚Ì–¼‘OIIIII ^>:("
) else if "%YourName%"=="Kinito" (set "OOBEmain5_2c_Easteregg_TextTemp=–l‚Ìe—FB"
) else if "%YourName%"=="Boykisser" (set "OOBEmain5_2c_Easteregg_TextTemp=ƒPƒ‚ƒmIH"
) else if "%YourName%"=="Sigma" (set "OOBEmain5_2c_Easteregg_TextTemp=‚¾‚ßB"
) else if "%YourName%"=="Cake" (set "OOBEmain5_2c_Easteregg_TextTemp=ƒP[ƒL‚Í‰R‚¾"
) else if "%YourName%"=="Hello_World" (set "OOBEmain5_2c_Easteregg_TextTemp='Hello_World' is not recognized as an internal or external command,[8;10Hoperable program or batch file."
) else if "%YourName%"=="Shivter" (set "OOBEmain5_2c_Easteregg_TextTemp=‚â‚ß‚Ä‚­‚ê"
) else if "%YourName%"=="sambubo" (set "OOBEmain5_2c_Easteregg_TextTemp=‚«‚Á‚Æâ‚µ‚¢‚ñ‚¾‚ËB‚í‚©‚Á‚Ä‚é‚æ"
) else if "%YourName%"=="AAAAAA" (set "OOBEmain5_2c_Easteregg_TextTemp=‚»‚ñ‚È‚É–¼‘O‚ğŒˆ‚ß‚é‚Ì‚ª–Ê“|H"
) else if "%YourName%"=="Sans" (set "OOBEmain5_2c_Easteregg_TextTemp=‚¾‚ß‚¾‚ºB"
) else if "%YourName%"=="egg" (exit /b 2) else (exit /b 0)
call :Underbar_Drawer 0 & call :Header_Drawer 2
echo.
echo.
echo          %OOBEmain5_2c_Easteregg_TextTemp%
echo.
echo.
echo          (‰½‚©ƒL[‚ğ‰Ÿ‚µ‚Ä‘±s...)
call :OOBE_EndLine
pause >nul
set OOBEmain5_2c_Easteregg_TextTemp=
exit /b 1


:OOBEmain6
call :Underbar_Drawer 4 & call :Header_Drawer 3
echo.
echo.
echo          ƒJ[ƒ\ƒ‹‘Ö‚¦‚Í©—R‚Éƒ_[ƒNƒe[ƒ}‚©Aƒ‰ƒCƒgƒe[ƒ}
echo          ‚ğ‘I‘ğ‚µAİ’è‚·‚é‚±‚Æ‚ª‚Å‚«‚Ü‚·B
echo          ‘I‘ğ‚µ‚Ü‚·‚©H
echo.
echo          (‘I‘ğ‚µ‚È‚©‚Á‚½ê‡AƒfƒtƒHƒ‹ƒg‚Ìƒ_[ƒNƒe[ƒ}‚ª“K—p‚³‚ê‚Ü‚·B)
echo.
echo.
echo          (Y=‚Í‚¢Bƒe[ƒ}‚ğ‘I‘ğ‚µ‚½‚¢‚Å‚·)
echo          (N=‚¢‚¢‚¦Bƒe[ƒ}‚È‚ñ‚¼’m‚é‚©I)
call :OOBE_EndLine
choice /c YN /n >nul
if %ErrorLevel%==1 goto :OOBEmain6theme1
if %ErrorLevel%==2 call :OOBEmainblank & timeout /t 1 /nobreak >nul&set oobetheme=dark&goto :OOBEmain7


:OOBEmain6theme1
if "%OOBEundiscard%"=="true" (call :OOBEmainblank & timeout /t 1 /nobreak >nul&set oobetheme=dark&set OOBEundiscard=&goto :OOBEmain7)
call :Underbar_Drawer 8 & call :Header_Drawer 3
echo.
echo.
echo          O============O    O============O
echo          Iƒ_[ƒNƒe[ƒ}I    Iƒ‰ƒCƒgƒe[ƒ}I
echo          O============O    O============O
echo.
echo.
echo    ^E   ‰½‚à‘I‘ğ‚³‚ê‚Ä‚¢‚Ü‚¹‚ñBA,D‚Ü‚½‚Í1,2‚Å‘I‘ğ‚µ‚Ä‚­‚¾‚³‚¢B
echo.
echo          (A,D‚Ü‚½‚Í1,2‚Å‘I‘ğ‚µAY‚Ü‚½‚ÍE‚ÅŒˆ’è‚µ‚Ü‚·B)
echo          (B ƒL[‚Åƒe[ƒ}‚Ì‘I‘ğ‚ğ”jŠü‚µ‚Ü‚·B)
call :OOBE_EndLine
choice /c AD12YB /n >nul
if %ErrorLevel%==1 goto :OOBEmain6theme2
if %ErrorLevel%==2 goto :OOBEmain6theme2
if %ErrorLevel%==3 goto :OOBEmain6theme2
if %ErrorLevel%==4 goto :OOBEmain6theme3
if %ErrorLevel%==5 goto :OOBEmain6theme2
if %ErrorLevel%==6 call :OOBEmain6themeifback&goto :OOBEmain6theme1


:OOBEmain6theme2
if "%OOBEundiscard%"=="true" (call :OOBEmainblank & timeout /t 1 /nobreak >nul&set oobetheme=dark&set OOBEundiscard=&goto :OOBEmain7)
if defined clrhigh (set clrhigh=[7m&set clrhighend=[0m)
call :Underbar_Drawer 9 & call :Header_Drawer 3 false
echo.
echo.
echo          O============O    O============O
echo          I%clrhigh%ƒ_[ƒNƒe[ƒ}%clrhighend%I    Iƒ‰ƒCƒgƒe[ƒ}I
echo          O============O    O============O
echo.
echo.
echo     ^E   Å‚àŒ´‰“I‚ÅA‚‹MŠ‚ÂŠ‚‚Ìƒe[ƒ}B
echo     ^E   ‚»‚µ‚ÄƒJ[ƒ\ƒ‹‘Ö‚¦‚ÉÅ‚àÅ“K‰»‚³‚ê‚Ä‚¢‚éB
echo     ^E   Šî–{“I‚É‚Í‚±‚ê‚ª„§‚³‚ê‚Ä‚¢‚éB
echo.
echo          (A,D‚Ü‚½‚Í1,2‚Å‘I‘ğ‚µAY‚Ü‚½‚ÍE‚ÅŒˆ’è‚µ‚Ü‚·B)
echo          (B ƒL[‚Åƒe[ƒ}‚Ì‘I‘ğ‚ğ”jŠü‚µ‚Ü‚·B)
call :OOBE_EndLine
choice /c AD12BYE /n >nul
if %ErrorLevel%==1 goto :OOBEmain6theme2
if %ErrorLevel%==2 goto :OOBEmain6theme3
if %ErrorLevel%==3 goto :OOBEmain6theme2
if %ErrorLevel%==4 goto :OOBEmain6theme3
if %ErrorLevel%==5 call :OOBEmain6themeifback&goto :OOBEmain6theme2
if %ErrorLevel%==6 goto :OOBEmain6theme2confirm
if %ErrorLevel%==7 goto :OOBEmain6theme2confirm


:OOBEmain6theme3
if "%OOBEundiscard%"=="true" (call :Header_Drawer 3 false & call :OOBEmainblank & timeout /t 1 /nobreak >nul&set oobetheme=dark&set OOBEundiscard=&goto :OOBEmain7)
if defined clrhigh (set clrhigh=[100m[97m&set clrhighend=[0m[107m[30m)
call :Underbar_Drawer 9 & call :Header_Drawer 3 true
echo.
echo.
echo          O============O    O============O
echo          Iƒ_[ƒNƒe[ƒ}I    I%clrhigh%ƒ‰ƒCƒgƒe[ƒ}%clrhighend%I
echo          O============O    O============O
echo.
echo.
echo     ^E   ‚±‚Ìƒe[ƒ}‚ÍãY—í‚©‚Â_X‚µ‚¢•µˆÍ‹C‚ª‚ ‚éB
echo     ^E   ƒ_[ƒNƒe[ƒ}‚æ‚èˆ³“|“I‚É–¾‚é‚­•\¦‚³‚êAƒnƒCƒRƒ“ƒgƒ‰ƒXƒgB
echo     ^E   ‚²‚­ˆê•”‚Ì‹@”\‚ªƒ‰ƒCƒgƒe[ƒ}‚É‘Î‰‚µ‚Ä‚¢‚È‚¢ê‡‚ª‚ ‚éB
echo     ^E   ‚æ‚è–¾‚é‚­Œ©‚½‚¢l‚É‚¨‚·‚·‚ß
echo.
echo          (A,D‚Ü‚½‚Í1,2‚Å‘I‘ğ‚µAY‚Ü‚½‚ÍE‚ÅŒˆ’è‚µ‚Ü‚·B)
echo          (B ƒL[‚Åƒe[ƒ}‚Ì‘I‘ğ‚ğ”jŠü‚µ‚Ü‚·B)
call :OOBE_EndLine
choice /c AD12BYE /n >nul
if %ErrorLevel%==1 goto :OOBEmain6theme2
if %ErrorLevel%==2 goto :OOBEmain6theme3
if %ErrorLevel%==3 goto :OOBEmain6theme2
if %ErrorLevel%==4 goto :OOBEmain6theme3
if %ErrorLevel%==5 call :OOBEmain6themeifback true&goto :OOBEmain6theme3
if %ErrorLevel%==6 goto :OOBEmain6theme3confirm
if %ErrorLevel%==7 goto :OOBEmain6theme3confirm


:OOBEmain6theme2confirm
call :Underbar_Drawer 10 & call :Header_Drawer 3 false
echo.
echo.
echo          O============O    O============O
echo          I%clrhigh%ƒ_[ƒNƒe[ƒ}%clrhighend%I    Iƒ‰ƒCƒgƒe[ƒ}I
echo          O============O    O============O
echo.
echo     ^E   ‚±‚Ìƒe[ƒ}‚Å–{“–‚É‚æ‚ë‚µ‚¢‚Å‚·‚©H
echo           (ƒqƒ“ƒg : ƒe[ƒ}‚ÍŒã‚©‚çİ’è‚Å•ÏX‚Å‚«‚Ü‚·)
echo.
echo.
echo          (Y=‚Í‚¢I‚±‚Ìƒe[ƒ}‚ª‹C‚É“ü‚è‚Ü‚µ‚½)
echo          (N=‚ñ‚È‚í‚¯‚ ‚é‚©‚¢ƒ{ƒP)
call :OOBE_EndLine
choice /c BNYE /n >nul
if %ErrorLevel%==1 goto :OOBEmain6theme2
if %ErrorLevel%==2 goto :OOBEmain6theme2
if %ErrorLevel%==3 call :OOBEmainblank & timeout /t 1 /nobreak >nul&set oobetheme=dark&goto :OOBEmain7
if %ErrorLevel%==4 call :OOBEmainblank & timeout /t 1 /nobreak >nul&set oobetheme=dark&goto :OOBEmain7



:OOBEmain6theme3confirm
call :Underbar_Drawer 10 & call :Header_Drawer 3 true
echo.
echo.
echo          O============O    O============O
echo          Iƒ_[ƒNƒe[ƒ}I    I%clrhigh%ƒ‰ƒCƒgƒe[ƒ}%clrhighend%I
echo          O============O    O============O
echo.
echo     ^E   –{“–‚É‚±‚Ìƒe[ƒ}‚Å‚æ‚ë‚µ‚¢‚Å‚·‚©H
echo           (ƒqƒ“ƒg : ƒe[ƒ}‚ÍŒã‚©‚çİ’è‚Å•ÏX‚Å‚«‚Ü‚·)
echo.
echo.
echo          (Y=‚Í‚¢I‚±‚Ìƒe[ƒ}‚ª‹C‚É“ü‚è‚Ü‚µ‚½)
echo          (N=‚ñ‚È‚í‚¯‚ ‚é‚©‚¢ƒ{ƒP)
call :OOBE_EndLine
choice /c BNYE /n >nul
if %ErrorLevel%==1 goto :OOBEmain6theme3
if %ErrorLevel%==2 goto :OOBEmain6theme3
if %ErrorLevel%==3 set oobetheme=white&call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto :OOBEmain7
if %ErrorLevel%==4 set oobetheme=white&call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto :OOBEmain7


:OOBEmain6themeifback
call :Underbar_Drawer 4 & if "%1"=="true" (call :Header_Drawer 3 true) else (call :Header_Drawer 3 false)
echo.
echo.
echo          –{“–‚Éƒe[ƒ}‚Ì‘I‘ğ‚ğ”jŠü‚µ‚Ü‚·‚©H
echo          (”jŠü‚µ‚½ê‡AŠù’è’l‚Ìƒe[ƒ}‚Éİ’è‚³‚ê‚Ü‚·B)
echo.
echo.
echo          (Y=‚Í‚¢B”jŠü‚µ‚Ü‚·B)
echo          (N=‚¢‚¢‚¦Bƒe[ƒ}‚ğ‘I‘ğ‚µ‚Ü‚·)
call :OOBE_EndLine
choice /c YN /n >nul
if %ErrorLevel%==1 set OOBEundiscard=true&exit /b
if %ErrorLevel%==2 exit /b


:OOBEmain7
call :Underbar_Drawer 4 & call :Header_Drawer 4
echo.
echo.
echo          ƒJ[ƒ\ƒ‹‘Ö‚¦‚Íİ’è‚ğƒJƒXƒ^ƒ}ƒCƒY‚Å‚«‚Ü‚·B
echo          ƒJƒXƒ^ƒ}ƒCƒY‚µ‚Ü‚·‚©H
echo.
echo          (‚µ‚È‚©‚Á‚½ê‡Aİ’è‚ÍŠù’è’l‚Éİ’è‚³‚ê‚Ü‚·B)
echo.
echo.
echo          (Y=‚Í‚¢I)
echo          (N=‚¢‚¢‚¦B‚ß‚ñ‚Ç‚­‚³‚¢‚¾‚¯‚Å‚·B)
call :OOBE_EndLine
choice /c YN /n >nul
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto :OOBEmain7CustomizeSettings
if %ErrorLevel%==2 call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto :OOBEmain8


:OOBEmain7CustomizeSettingsdiscard
call :Underbar_Drawer 4 & call :Header_Drawer 4
echo.
echo.
echo          –{“–‚Éİ’è‚ÌƒJƒXƒ^ƒ}ƒCƒY‚ğ”jŠü‚µ‚Ü‚·‚©H
echo.
echo          (”jŠü‚µ‚½ê‡A‚·‚×‚Ä‚Ìİ’è‚ÍŠù’è’l‚Éİ’è‚³‚ê‚Ü‚·)
echo.
echo          (Y=‚Í‚¢I”jŠü‚µ‚Ü‚·II)
echo          (N=‚¢‚¢‚¦IƒJƒXƒ^ƒ}ƒCƒY‚µ‚½‚¢‚Å‚·I)
call :OOBE_EndLine
choice /c YN /n >nul
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&set OOBEsetting1toggle=true&set OOBEsetting2toggle=false&set OOBEsetting3toggle=false&set OOBEsetting4toggle=true&set OOBEsetting5toggle=true&goto :OOBEmain8
if %ErrorLevel%==2 goto :OOBEmain7CustomizeSettings1

:OOBEmain7CustomizeSettings
if "%oobetheme%"=="white" (set OOBEsettingclr=[100m[97m&set OOBEsettingclr2=[0m[107m[30m)
if "%oobetheme%"=="dark" (set OOBEsettingclr=[7m&set OOBEsettingclr2=[0m)
set OOBEsetting1toggle=false&set OOBEsetting2toggle=false&set OOBEsetting3toggle=false&set OOBEsetting4toggle=false&set OOBEsetting5toggle=false
call :Underbar_Drawer 11 & call :Header_Drawer 4
echo.
echo.
echo          O================================O   İ’è‚ÌƒJƒXƒ^ƒ}ƒCƒY
echo          I 1 ‹N“®‚ÉƒJ[ƒ\ƒ‹‘Ö‚¦‚Å‹N“®   I
echo          O================================O   ‰½‚à‘I‘ğ‚³‚ê‚Ä‚¢‚Ü‚¹‚ñB
echo          I 2 ‹N“®‚ÌƒAƒhƒ~ƒ“             I
echo          O================================O   W ‚Ü‚½‚Í SA1‚©‚ç5‚Å‘I‘ğ‚µA
echo          I 3 ‹N“®‚ÉXVŠm”F             I   Y ‚ÅØ‚è‘Ö‚¦A N ‚Ü‚½‚Í B‚Å
echo          O================================O   ”jŠü‚µ‚Ü‚·B
echo          I 4 ‰¹Šy‚ÌÄ¶‚ğ‹–‰Â             I   OK ‚ÉˆÚ“®‚µ‚½‚Ì‚¿AY
echo          O================================O   ‚ÅŠm’è‚µ‚Ü‚·B
echo          I 5 ‹N“®‚ÌƒAƒjƒ[ƒVƒ‡ƒ“       I   
echo          O================================O
echo                       I  OK  I
echo                       O======O
echo.
echo.
choice /c WS12345YNB6 /n >nul
if %ErrorLevel%==1 goto :OOBEmain7CustomizeSettings1
if %ErrorLevel%==2 goto :OOBEmain7CustomizeSettings1
if %ErrorLevel%==3 goto :OOBEmain7CustomizeSettings1
if %ErrorLevel%==4 goto :OOBEmain7CustomizeSettings2
if %ErrorLevel%==5 goto :OOBEmain7CustomizeSettings3
if %ErrorLevel%==6 goto :OOBEmain7CustomizeSettings4
if %ErrorLevel%==7 goto :OOBEmain7CustomizeSettings5
if %ErrorLevel%==8 goto :OOBEmain7CustomizeSettings1
if %ErrorLevel%==9 goto :OOBEmain7CustomizeSettingsdiscard
if %ErrorLevel%==10 goto :OOBEmain7CustomizeSettingsdiscard
if %ErrorLevel%==11 goto :OOBEmain7CustomizeSettingsOK

:OOBEmain7CustomizeSettings1
if "%OOBEsetting1toggle%"=="true" (set OOBEsettingclr=[46m) else if "%OOBEsetting1toggle%"=="false" (
if "%oobetheme%"=="white" (set OOBEsettingclr=[100m[97m&set OOBEsettingclr2=[0m[107m[30m)
if "%oobetheme%"=="dark" (set OOBEsettingclr=[7m&set OOBEsettingclr2=[0m)
)
call :Underbar_Drawer 11 & call :Header_Drawer 4
echo.
echo.
echo          O================================O   İ’è‚ÌƒJƒXƒ^ƒ}ƒCƒY
echo          I%OOBEsettingclr% 1 ‹N“®‚ÉƒJ[ƒ\ƒ‹‘Ö‚¦‚Å‹N“®   %OOBEsettingclr2%I
echo          O================================O   ƒJ[ƒ\ƒ‹‘Ö‚¦‚Ì‹N“®Œã‚ÉA
echo          I%OOBEsetting2clr% 2 ‹N“®‚ÌƒAƒhƒ~ƒ“             %OOBEsetting2clr2%I   ƒJ[ƒ\ƒ‹‘Ö‚¦‚É‘JˆÚ
echo          O================================O   ‚·‚é‚©‚ğØ‚è‘Ö‚¦‚Ü‚·B
echo          I%OOBEsetting3clr% 3 ‹N“®‚ÉXVŠm”F             %OOBEsetting3clr2%I   —LŒø‚É‚·‚é‚ÆAƒJ[ƒ\ƒ‹‚ğ‚·‚®‚É
echo          O================================O   •ÏX‚Å‚«‚Ü‚·B
echo          I%OOBEsetting4clr% 4 ‰¹Šy‚ÌÄ¶‚ğ‹–‰Â             %OOBEsetting4clr2%I
echo          O================================O   %clrgra%–³Œø‚É‚·‚é‚Ì‚ğ„§%OOBEsettingclr2%
echo          I%OOBEsetting5clr% 5 ‹N“®‚ÌƒAƒjƒ[ƒVƒ‡ƒ“       %OOBEsetting5clr2%I
echo          O================================O
echo                       I  OK  I
echo                       O======O
echo.
echo.
choice /c WS12345YNB6 /n >nul
if "%oobetheme%"=="white" (set OOBEsettingclr=[100m[97m&set OOBEsettingclr2=[0m[107m[30m)
if "%oobetheme%"=="dark" (set OOBEsettingclr=[7m&set OOBEsettingclr2=[0m)
if %ErrorLevel%==1 goto :OOBEmain7CustomizeSettings1
if %ErrorLevel%==2 goto :OOBEmain7CustomizeSettings2
if %ErrorLevel%==3 goto :OOBEmain7CustomizeSettings1
if %ErrorLevel%==4 goto :OOBEmain7CustomizeSettings2
if %ErrorLevel%==5 goto :OOBEmain7CustomizeSettings3
if %ErrorLevel%==6 goto :OOBEmain7CustomizeSettings4
if %ErrorLevel%==7 goto :OOBEmain7CustomizeSettings5
if %ErrorLevel%==8 call :OOBEsettingstoggle 1&goto :OOBEmain7CustomizeSettings1
if %ErrorLevel%==9 goto :OOBEmain7CustomizeSettingsdiscard
if %ErrorLevel%==10 goto :OOBEmain7CustomizeSettingsdiscard
if %ErrorLevel%==11 goto :OOBEmain7CustomizeSettingsOK

:OOBEmain7CustomizeSettings2
if "%OOBEsetting2toggle%"=="true" (set OOBEsettingclr=[46m) else if "%OOBEsetting2toggle%"=="false" (
if "%oobetheme%"=="white" (set OOBEsettingclr=[100m[97m&set OOBEsettingclr2=[0m[107m[30m)
if "%oobetheme%"=="dark" (set OOBEsettingclr=[7m&set OOBEsettingclr2=[0m)
)
call :Underbar_Drawer 11 & call :Header_Drawer 4
echo.
echo.
echo          O================================O   İ’è‚ÌƒJƒXƒ^ƒ}ƒCƒY
echo          I%OOBEsetting1clr% 1 ‹N“®‚ÉƒJ[ƒ\ƒ‹‘Ö‚¦‚Å‹N“®   %OOBEsetting1clr2%I
echo          O================================O   ƒJ[ƒ\ƒ‹‘Ö‚¦‚Ì‹N“®‚ÉŠÇ—Ò
echo          I%OOBEsettingclr% 2 ‹N“®‚ÌƒAƒhƒ~ƒ“             %OOBEsettingclr2%I   Œ ŒÀ‚Ìæ“¾‚ğ‚İ‚Ü‚·BŠî–{“I‚É
echo          O================================O   ƒJ[ƒ\ƒ‹‚Ì•ÏX‚É–â‘è‚ª”­¶‚µ‚½
echo          I%OOBEsetting3clr% 3 ‹N“®‚ÉXVŠm”F             %OOBEsetting3clr2%I   Û‚É—LŒø‚É‚·‚é‚×‚«‚Å‚·B—LŒø‚É‚·‚é
echo          O================================O   ‚ÆA‹N“®‚ª‘‚­‚È‚éê‡‚ª‚ ‚è‚Ü‚·B
echo          I%OOBEsetting4clr% 4 ‰¹Šy‚ÌÄ¶‚ğ‹–‰Â             %OOBEsetting4clr2%I   
echo          O================================O   %clrgra%–³Œø‚É‚·‚é‚Ì‚ğ„§%OOBEsettingclr2%
echo          I%OOBEsetting5clr% 5 ‹N“®‚ÌƒAƒjƒ[ƒVƒ‡ƒ“       %OOBEsetting5clr2%I
echo          O================================O
echo                       I  OK  I
echo                       O======O
echo.
echo.
choice /c WS12345YNB6 /n >nul
if "%oobetheme%"=="white" (set OOBEsettingclr=[100m[97m&set OOBEsettingclr2=[0m[107m[30m)
if "%oobetheme%"=="dark" (set OOBEsettingclr=[7m&set OOBEsettingclr2=[0m)
if %ErrorLevel%==1 goto :OOBEmain7CustomizeSettings1
if %ErrorLevel%==2 goto :OOBEmain7CustomizeSettings3
if %ErrorLevel%==3 goto :OOBEmain7CustomizeSettings1
if %ErrorLevel%==4 goto :OOBEmain7CustomizeSettings2
if %ErrorLevel%==5 goto :OOBEmain7CustomizeSettings3
if %ErrorLevel%==6 goto :OOBEmain7CustomizeSettings4
if %ErrorLevel%==7 goto :OOBEmain7CustomizeSettings5
if %ErrorLevel%==8 call :OOBEsettingstoggle 2&goto :OOBEmain7CustomizeSettings2
if %ErrorLevel%==9 goto :OOBEmain7CustomizeSettingsdiscard
if %ErrorLevel%==10 goto :OOBEmain7CustomizeSettingsdiscard
if %ErrorLevel%==11 goto :OOBEmain7CustomizeSettingsOK

:OOBEmain7CustomizeSettings3
if "%OOBEsetting3toggle%"=="true" (set OOBEsettingclr=[46m) else if "%OOBEsetting3toggle%"=="false" (
if "%oobetheme%"=="white" (set OOBEsettingclr=[100m[97m&set OOBEsettingclr2=[0m[107m[30m)
if "%oobetheme%"=="dark" (set OOBEsettingclr=[7m&set OOBEsettingclr2=[0m)
)
call :Underbar_Drawer 11 & call :Header_Drawer 4
echo.
echo.
echo          O================================O   İ’è‚ÌƒJƒXƒ^ƒ}ƒCƒY
echo          I%OOBEsetting1clr% 1 ‹N“®‚ÉƒJ[ƒ\ƒ‹‘Ö‚¦‚Å‹N“®   %OOBEsetting1clr2%I
echo          O================================O   ƒJ[ƒ\ƒ‹‘Ö‚¦‚Ì‹N“®‚ÉƒAƒbƒvƒf[ƒg
echo          I%OOBEsetting2clr% 2 ‹N“®‚ÌƒAƒhƒ~ƒ“             %OOBEsetting2clr2%I   ‚ÌŠm”F‚ğs‚¤‚©‚Ç‚¤‚©‚ğ
echo          O================================O   Ø‚è‘Ö‚¦‚ç‚ê‚Ü‚·BƒAƒbƒvƒf[ƒg
echo          I%OOBEsettingclr% 3 ‹N“®‚ÉXVŠm”F             %OOBEsettingclr2%I   ‚ª—˜—p‰Â”\‚ÈÛ‚É‚ÍA
echo          O================================O   ‚»‚Ì‚Ü‚Ü“K—p‚·‚é‚±‚Æ‚ª‚Å‚«‚Ü‚·B
echo          I%OOBEsetting4clr% 4 ‰¹Šy‚ÌÄ¶‚ğ‹–‰Â             %OOBEsetting4clr2%I
echo          O================================O   %clrgra%–³Œø‚É‚·‚é‚Ì‚ğ„§%OOBEsettingclr2%
echo          I%OOBEsetting5clr% 5 ‹N“®‚ÌƒAƒjƒ[ƒVƒ‡ƒ“       %OOBEsetting5clr2%I
echo          O================================O
echo                       I  OK  I
echo                       O======O
echo.
echo.
choice /c WS12345YNB6 /n >nul
if "%oobetheme%"=="white" (set OOBEsettingclr=[100m[97m&set OOBEsettingclr2=[0m[107m[30m)
if "%oobetheme%"=="dark" (set OOBEsettingclr=[7m&set OOBEsettingclr2=[0m)
if %ErrorLevel%==1 goto :OOBEmain7CustomizeSettings2
if %ErrorLevel%==2 goto :OOBEmain7CustomizeSettings4
if %ErrorLevel%==3 goto :OOBEmain7CustomizeSettings1
if %ErrorLevel%==4 goto :OOBEmain7CustomizeSettings2
if %ErrorLevel%==5 goto :OOBEmain7CustomizeSettings3
if %ErrorLevel%==6 goto :OOBEmain7CustomizeSettings4
if %ErrorLevel%==7 goto :OOBEmain7CustomizeSettings5
if %ErrorLevel%==8 call :OOBEsettingstoggle 3&goto :OOBEmain7CustomizeSettings3
if %ErrorLevel%==9 goto :OOBEmain7CustomizeSettingsdiscard
if %ErrorLevel%==10 goto :OOBEmain7CustomizeSettingsdiscard
if %ErrorLevel%==11 goto :OOBEmain7CustomizeSettingsOK

:OOBEmain7CustomizeSettings4
if "%OOBEsetting4toggle%"=="true" (set OOBEsettingclr=[46m) else if "%OOBEsetting4toggle%"=="false" (
if "%oobetheme%"=="white" (set OOBEsettingclr=[100m[97m&set OOBEsettingclr2=[0m[107m[30m)
if "%oobetheme%"=="dark" (set OOBEsettingclr=[7m&set OOBEsettingclr2=[0m)
)
call :Underbar_Drawer 11 & call :Header_Drawer 4
echo.
echo.
echo          O================================O   İ’è‚ÌƒJƒXƒ^ƒ}ƒCƒY
echo          I%OOBEsetting1clr% 1 ‹N“®‚ÉƒJ[ƒ\ƒ‹‘Ö‚¦‚Å‹N“®   %OOBEsetting1clr2%I
echo          O================================O   ‹N“®“™‚ÌÛ‚É‰¹‚ğ
echo          I%OOBEsetting2clr% 2 ‹N“®‚ÌƒAƒhƒ~ƒ“             %OOBEsetting2clr2%I   Ä¶‚·‚é‚©‚ğƒJ[ƒ\ƒ‹‘Ö‚¦‚É
echo          O================================O   ‹–‰Â‚·‚é‚©‚ğØ‚è‘Ö‚¦‚Ü‚·B
echo          I%OOBEsetting3clr% 3 ‹N“®‚ÉXVŠm”F             %OOBEsetting3clr2%I   ‚±‚Ìİ’è‚ª—LŒø‚¾‚ÆA
echo          O================================O   ‹N“®“™‚Å‰¹‚ªÄ¶‚³‚ê‚Ü‚·B
echo          I%OOBEsettingclr% 4 ‰¹Šy‚ÌÄ¶‚ğ‹–‰Â             %OOBEsettingclr2%I
echo          O================================O   %clrgra%—LŒø‚É‚·‚é‚Ì‚ğ„§%OOBEsettingclr2%
echo          I%OOBEsetting5clr% 5 ‹N“®‚ÌƒAƒjƒ[ƒVƒ‡ƒ“       %OOBEsetting5clr2%I
echo          O================================O
echo                       I  OK  I
echo                       O======O
echo.
echo.
choice /c WS12345YNB6 /n >nul
if "%oobetheme%"=="white" (set OOBEsettingclr=[100m[97m&set OOBEsettingclr2=[0m[107m[30m)
if "%oobetheme%"=="dark" (set OOBEsettingclr=[7m&set OOBEsettingclr2=[0m)
if %ErrorLevel%==1 goto :OOBEmain7CustomizeSettings3
if %ErrorLevel%==2 goto :OOBEmain7CustomizeSettings5
if %ErrorLevel%==3 goto :OOBEmain7CustomizeSettings1
if %ErrorLevel%==4 goto :OOBEmain7CustomizeSettings2
if %ErrorLevel%==5 goto :OOBEmain7CustomizeSettings3
if %ErrorLevel%==6 goto :OOBEmain7CustomizeSettings4
if %ErrorLevel%==7 goto :OOBEmain7CustomizeSettings5
if %ErrorLevel%==8 call :OOBEsettingstoggle 4&goto :OOBEmain7CustomizeSettings4
if %ErrorLevel%==9 goto :OOBEmain7CustomizeSettingsdiscard
if %ErrorLevel%==10 goto :OOBEmain7CustomizeSettingsdiscard
if %ErrorLevel%==11 goto :OOBEmain7CustomizeSettingsOK

:OOBEmain7CustomizeSettings5
if "%OOBEsetting5toggle%"=="true" (set OOBEsettingclr=[46m) else if "%OOBEsetting5toggle%"=="false" (
if "%oobetheme%"=="white" (set OOBEsettingclr=[100m[97m&set OOBEsettingclr2=[0m[107m[30m)
if "%oobetheme%"=="dark" (set OOBEsettingclr=[7m&set OOBEsettingclr2=[0m)
)
call :Underbar_Drawer 11 & call :Header_Drawer 4
echo.
echo.
echo          O================================O   İ’è‚ÌƒJƒXƒ^ƒ}ƒCƒY
echo          I%OOBEsetting1clr% 1 ‹N“®‚ÉƒJ[ƒ\ƒ‹‘Ö‚¦‚Å‹N“®   %OOBEsetting1clr2%I
echo          O================================O   ƒJ[ƒ\ƒ‹‘Ö‚¦‚Ì‹N“®‚Ì“Ç‚İ‚İ
echo          I%OOBEsetting2clr% 2 ‹N“®‚ÌƒAƒhƒ~ƒ“             %OOBEsetting2clr2%I   ‚ªI—¹‚µ‚½Û‚Ì‹N“®ƒAƒjƒ[ƒVƒ‡ƒ“
echo          O================================O   ‚ğØ‚è‘Ö‚¦‚ê‚Ü‚·B–³Œø‚¾‚Æ
echo          I%OOBEsetting3clr% 3 ‹N“®‚ÉXVŠm”F             %OOBEsetting3clr2%I   ƒ[ƒh‚ªI‚í‚Á‚½‚ç‘¦À‚É
echo          O================================O   ƒƒjƒ…[‚É‘JˆÚ‚µ‚Ü‚·B
echo          I%OOBEsetting4clr% 4 ‰¹Šy‚ÌÄ¶‚ğ‹–‰Â             %OOBEsetting4clr2%I
echo          O================================O   %clrgra%—LŒø‚É‚·‚é‚Ì‚ğ„§%OOBEsettingclr2%
echo          I%OOBEsettingclr% 5 ‹N“®‚ÌƒAƒjƒ[ƒVƒ‡ƒ“       %OOBEsettingclr2%I
echo          O================================O
echo                       I  OK  I
echo                       O======O
echo.
echo.
choice /c WS12345YNB6 /n >nul
if "%oobetheme%"=="white" (set OOBEsettingclr=[100m[97m&set OOBEsettingclr2=[0m[107m[30m)
if "%oobetheme%"=="dark" (set OOBEsettingclr=[7m&set OOBEsettingclr2=[0m)
if %ErrorLevel%==1 goto :OOBEmain7CustomizeSettings4
if %ErrorLevel%==2 goto :OOBEmain7CustomizeSettingsOK
if %ErrorLevel%==3 goto :OOBEmain7CustomizeSettings1
if %ErrorLevel%==4 goto :OOBEmain7CustomizeSettings2
if %ErrorLevel%==5 goto :OOBEmain7CustomizeSettings3
if %ErrorLevel%==6 goto :OOBEmain7CustomizeSettings4
if %ErrorLevel%==7 goto :OOBEmain7CustomizeSettings5
if %ErrorLevel%==8 call :OOBEsettingstoggle 5&goto :OOBEmain7CustomizeSettings5
if %ErrorLevel%==9 goto :OOBEmain7CustomizeSettingsdiscard
if %ErrorLevel%==10 goto :OOBEmain7CustomizeSettingsdiscard
if %ErrorLevel%==11 goto :OOBEmain7CustomizeSettingsOK

:OOBEmain7CustomizeSettingsOK
call :Underbar_Drawer 11 & call :Header_Drawer 4
echo.
echo.
echo          O================================O   İ’è‚ÌƒJƒXƒ^ƒ}ƒCƒY
echo          I%OOBEsetting1clr% 1 ‹N“®‚ÉƒJ[ƒ\ƒ‹‘Ö‚¦‚Å‹N“®   %OOBEsetting1clr2%I
echo          O================================O   İ’è‚ÌŠm”F
echo          I%OOBEsetting2clr% 2 ‹N“®‚ÌƒAƒhƒ~ƒ“             %OOBEsetting2clr2%I
echo          O================================O   ‚¿‚È‚İ‚ÉAÅ’á‚Å‚àˆê‚Â‚Ìİ’è‚ğ
echo          I%OOBEsetting3clr% 3 ‹N“®‚ÉXVŠm”F             %OOBEsetting3clr2%I   —LŒø‚É‚·‚é‚Ì‚ğ„§‚µ‚Ä‚¢‚Ü‚·B
echo          O================================O   ‚·‚×‚Ä‚Ìİ’è‚ÍŒã‚©‚ç•ÏX‚Å‚«‚Ü‚·B
echo          I%OOBEsetting4clr% 4 ‰¹Šy‚ÌÄ¶‚ğ‹–‰Â             %OOBEsetting4clr2%I   
echo          O================================O   %clrgra%(İ’èƒƒjƒ…[‚Å•ÏX‰Â”\)%OOBEsettingclr2%
echo          I%OOBEsetting5clr% 5 ‹N“®‚ÌƒAƒjƒ[ƒVƒ‡ƒ“       %OOBEsetting5clr2%I
echo          O================================O
echo                       I%OOBEsettingclr%  OK  %OOBEsettingclr2%I
echo                       O======O
echo.
echo.
choice /c WS12345YNB6 /n >nul
if "%oobetheme%"=="white" (set OOBEsettingclr=[100m[97m&set OOBEsettingclr2=[0m[107m[30m)
if "%oobetheme%"=="dark" (set OOBEsettingclr=[7m&set OOBEsettingclr2=[0m)
if %ErrorLevel%==1 goto :OOBEmain7CustomizeSettings5
if %ErrorLevel%==2 goto :OOBEmain7CustomizeSettingsOK
if %ErrorLevel%==3 goto :OOBEmain7CustomizeSettings1
if %ErrorLevel%==4 goto :OOBEmain7CustomizeSettings2
if %ErrorLevel%==5 goto :OOBEmain7CustomizeSettings3
if %ErrorLevel%==6 goto :OOBEmain7CustomizeSettings4
if %ErrorLevel%==7 goto :OOBEmain7CustomizeSettings5
if %ErrorLevel%==8 goto :OOBEmain7CustomizeSettingsOKconfirm
if %ErrorLevel%==9 goto :OOBEmain7CustomizeSettingsdiscard
if %ErrorLevel%==10 goto :OOBEmain7CustomizeSettingsdiscard
if %ErrorLevel%==11 goto :OOBEmain7CustomizeSettingsOK

:OOBEsettingstoggle
rem wtf?? goofy ahh if statements. well uh i mean, i dont know how to use "for" commands. so... u know, it cant be helped. fuckkkk
if "%1"=="1" (
    if "%OOBEsetting1toggle%"=="false" (
    if "%oobetheme%"=="white" (set OOBEsetting1clr=[100m[97m&set OOBEsetting1clr2=[0m[107m[30m)
    if "%oobetheme%"=="dark" (set OOBEsetting1clr=[7m&set OOBEsetting1clr2=[0m)
    set OOBEsetting1toggle=true
    ) else if "%OOBEsetting1toggle%"=="true" (
    if "%oobetheme%"=="white" (set OOBEsetting1clr=&set OOBEsetting1clr2=)
    if "%oobetheme%"=="dark" (set OOBEsetting1clr=&set OOBEsetting1clr2=)
        set OOBEsetting1toggle=false
    ) else set OOBEsetting1toggle=true
)
if "%1"=="2" (
    if "%OOBEsetting2toggle%"=="false" (
    if "%oobetheme%"=="white" (set OOBEsetting2clr=[100m[97m&set OOBEsetting2clr2=[0m[107m[30m)
    if "%oobetheme%"=="dark" (set OOBEsetting2clr=[7m&set OOBEsetting2clr2=[0m)
    set OOBEsetting2toggle=true
    ) else if "%OOBEsetting2toggle%"=="true" (
    if "%oobetheme%"=="white" (set OOBEsetting2clr=&set OOBEsetting2clr2=)
    if "%oobetheme%"=="dark" (set OOBEsetting2clr=&set OOBEsetting2clr2=)
        set OOBEsetting2toggle=false
    ) else set OOBEsetting2toggle=true
)
if "%1"=="3" (
    if "%OOBEsetting3toggle%"=="false" (
    if "%oobetheme%"=="white" (set OOBEsetting3clr=[100m[97m&set OOBEsetting3clr2=[0m[107m[30m)
    if "%oobetheme%"=="dark" (set OOBEsetting3clr=[7m&set OOBEsetting3clr2=[0m)
    set OOBEsetting3toggle=true
    ) else if "%OOBEsetting3toggle%"=="true" (
    if "%oobetheme%"=="white" (set OOBEsetting3clr=&set OOBEsetting3clr2=)
    if "%oobetheme%"=="dark" (set OOBEsetting3clr=&set OOBEsetting3clr2=)
        set OOBEsetting3toggle=false
    ) else set OOBEsetting3toggle=true
)
if "%1"=="4" (
    if "%OOBEsetting4toggle%"=="false" (
    if "%oobetheme%"=="white" (set OOBEsetting4clr=[100m[97m&set OOBEsetting4clr2=[0m[107m[30m)
    if "%oobetheme%"=="dark" (set OOBEsetting4clr=[7m&set OOBEsetting4clr2=[0m)
    set OOBEsetting4toggle=true
    ) else if "%OOBEsetting4toggle%"=="true" (
    if "%oobetheme%"=="white" (set OOBEsetting4clr=&set OOBEsetting4clr2=)
    if "%oobetheme%"=="dark" (set OOBEsetting4clr=&set OOBEsetting4clr2=)
        set OOBEsetting4toggle=false
    ) else set OOBEsetting4toggle=true
)
if "%1"=="5" (
    if "%OOBEsetting5toggle%"=="false" (
    if "%oobetheme%"=="white" (set OOBEsetting5clr=[100m[97m&set OOBEsetting5clr2=[0m[107m[30m)
    if "%oobetheme%"=="dark" (set OOBEsetting5clr=[7m&set OOBEsetting5clr2=[0m)
    set OOBEsetting5toggle=true
    ) else if "%OOBEsetting5toggle%"=="true" (
    if "%oobetheme%"=="white" (set OOBEsetting5clr=&set OOBEsetting5clr2=)
    if "%oobetheme%"=="dark" (set OOBEsetting5clr=&set OOBEsetting5clr2=)
        set OOBEsetting5toggle=false
    ) else set OOBEsetting5toggle=true
)
exit /b

:OOBEmain7CustomizeSettingsOKconfirm
call :Underbar_Drawer 4 & call :Header_Drawer 4
echo.
echo.
echo          İ’è‚ÌƒJƒXƒ^ƒ}ƒCƒY :
echo.
echo          1 •ÏXŒã‚ÌÄ‹N“®‚ÌŠm”F        : %OOBEsetting1toggle% %clrgra%(false‚ª„§)%OOBEsettingclr2%
echo          2 ‹N“®‚ÌƒAƒhƒ~ƒ“            : %OOBEsetting2toggle% %clrgra%(false‚ª„§)%OOBEsettingclr2%
echo          3 ‹N“®‚ÉXVŠm”F            : %OOBEsetting3toggle% %clrgra%(false‚ª„§)%OOBEsettingclr2%
echo          4 ‰¹Šy‚ÌÄ¶‚ğ‹–‰Â        : %OOBEsetting4toggle% %clrgra%(true‚ª„§)%OOBEsettingclr2%
echo          5 ‹N“®‚ÌƒAƒjƒ[ƒVƒ‡ƒ“      : %OOBEsetting5toggle% %clrgra%(true‚ª„§)%OOBEsettingclr2%
echo.
echo          ‘±s‚·‚é‚ÆA‚±‚ê‚ç‚Ìİ’è‚ª‚·‚×‚Äİ’èƒtƒ@ƒCƒ‹‚É‘‚«‚Ü‚ê‚Ü‚·B
echo          ‚æ‚ë‚µ‚¢‚Å‚·‚©H %clrgra%(İ’èƒtƒ@ƒCƒ‹‚Í "%batchmainpath%"‚É‚ ‚è‚Ü‚·B) %OOBEsettingclr2%
echo.
echo          (Y=‚Í‚¢)
echo          (N=‚¢‚¢‚¦B‚â‚Á‚Ï‚è•ÏX‚µ‚½‚¢‚Å‚·B)
echo.
echo.
choice /c YN /n >nul
if %ErrorLevel%==1 if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto :OOBEmain8
if %ErrorLevel%==2 goto :OOBEmain7CustomizeSettings1

:OOBEmain8
if "%oobetheme%"=="white" (color f0) else (color 07)
rem setting written, well, wtf is this?? so many goofy ahh if statement. hell no NOT AGAIN!!!!!!!!!!!!
if not exist %Settingsfile% (
    type nul > %Settingsfile%
    echo nodogcheckfor1234567890qwertyuiop >> %Settingsfile% 

    if defined YourName (
        echo YourName=%YourName% >> %Settingsfile%
    ) else if not defined YourName (echo YourName=%USERNAME% >> %Settingsfile%)

    if "%OOBEsetting1toggle%"=="false" (
        echo BootAsCC=false >> %Settingsfile%
    ) else if "%OOBEsetting1toggle%"=="true" (
        echo BootAsCC=true >> %Settingsfile%
    ) else (echo BootAsCC=false >> %Settingsfile%)

    if "%OOBEsetting2toggle%"=="false" (
        echo admin=false >> %Settingsfile%
    ) else if "%OOBEsetting2toggle%"=="true" (
        echo admin=true >> %Settingsfile%
    ) else (echo admin=false >> %Settingsfile%)

    if "%OOBEsetting3toggle%"=="false" (
        echo CheckUpdate=false >> %Settingsfile%
    ) else if "%OOBEsetting3toggle%"=="true" (
        echo CheckUpdate=true >> %Settingsfile%
    ) else (echo CheckUpdate=false >> %Settingsfile%)

    if "%OOBEsetting4toggle%"=="false" (
        echo PlaySound=false >> %Settingsfile%
    ) else if "%OOBEsetting4toggle%"=="true" (
        echo PlaySound=true >> %Settingsfile%
    ) else (echo PlaySound=true >> %Settingsfile%)

    if "%OOBEsetting5toggle%"=="false" (
        echo bootanimation=false >> %Settingsfile%
    ) else if "%OOBEsetting5toggle%"=="true" (
        echo bootanimation=true >> %Settingsfile%
    ) else (echo bootanimation=true >> %Settingsfile%)

    echo s5_linuxboot=false >> %Settingsfile%
    echo s5_simpleboot=false >> %Settingsfile%
    echo s5_rawboot=false >> %Settingsfile%
    echo HazimeBg=true >> %Settingsfile%
    
    if "%OOBEtheme%"=="dark" (
        echo wmode=false >> %Settingsfile%
        set wmodetoggle=false
    ) else if "%OOBEtheme%"=="white" (
        echo wmode=true >> %Settingsfile%
        set wmodetoggle=true
    ) else (echo wmode=false >> %Settingsfile%&set wmodetoggle=false)


if not exist %FirstSTFsfile% (
type nul > %FirstSTFsfile%
echo nodogcheckforfastboot >> %FirstSTFsfile%
)
)
call :Underbar_Drawer 12 & call :Header_Drawer 5
echo.
echo.
echo          ƒZƒbƒgƒAƒbƒv‚ÍŠ®—¹‚µ‚Ü‚µ‚½B
echo.
echo          ÅŒã‚ÉAƒJ[ƒ\ƒ‹‘Ö‚¦‚É‘Î‚µ‚Ä‰½‚©ƒGƒ‰[‚â–â‘èA’ñˆÄ‚ª‚ ‚éê‡‚É‚ÍA
echo          Github‚Åissue‚ğì¬‚µ‚ÄAŠJ”­Ò‚É•ñ‚µ‚Ä‚­‚¾‚³‚¢B
echo.
echo          ƒJ[ƒ\ƒ‹‘Ö‚¦‚Í‚Ü‚¾ŠJ”­“r’†‚ÅA–¢Š®¬‚Å‚·B
echo          ‚»‚ê‚¾‚¯‚Í—‰ğ‚µ‚Ä‚­‚¾‚³‚¢B
echo.
echo          (Y ‚Ü‚½‚Í E ƒL[‚Åƒƒjƒ…[‚ÉˆÚ“®)
call :OOBE_EndLine
choice /c YE /n >nul
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul & call :OOBEinitialization & set bootbatnow=yes& goto :batstart
if %ErrorLevel%==2 call :OOBEmainblank & timeout /t 1 /nobreak >nul & call :OOBEinitialization & set bootbatnow=yes& goto :batstart

:OOBEinitialization
mode con: cols=75 lines=25
if "%oobetheme%"=="white" (color f0) else (color 07)
if not defined dummy (set /p nothing=[0;0H[?25h<nul)
set clrgra=& set clrhigh=& set clrhighend=& set clrwhi=& set moveline=
set oobetheme=
set OOBEsetting1toggle=& set OOBEsetting2toggle=& set OOBEsetting3toggle=& set OOBEsetting4toggle=& set OOBEsetting5toggle=
set OOBEsetting1clr=& set OOBEsetting2clr=& set OOBEsetting3clr=& set OOBEsetting4clr=& set OOBEsetting5clr=
set OOBEsetting1clr2=& set OOBEsetting2clr2=& set OOBEsetting3clr2=& set OOBEsetting4clr2=& set OOBEsetting5clr2=
set OOBEsettingclr=& set OOBEsettingclr2=
set clr1=& set clresc=& set clrmove=& set clr2=& set clr=
set boottime1=%time%
call :Core_Powershell 3
exit /b



:Cursor_Changer_REmenu
cls
mode con: cols=75 lines=25
rem recovery menu for ƒJ[ƒ\ƒ‹‘Ö‚¦, and recovery console
set DynamicWinverCheck=true& call :batbootcheckwinver dynamic & set DynamicWinverCheck=
if "%errorlevel%"=="1" (goto :batbootcheckwinverbad)
if not defined dummy (set clr=[7m&set clrgra=[90m&set clr2=[0m)
if "%wmodetoggle%"=="false" (set clr=[7m&set clrgra=[90m&set clr2=[0m)
if "%wmodetoggle%"=="true" (set clr=[100m[97m&set clrgra=[107m[38;2;140;140;140m&set clr2=[90m[107m[30m)
if not defined dummy (set /p nothing=[?25l<nul)
set bootbatnow=no& set rmsel=0&
set Remenu_Redraw=true
echo ƒŠƒJƒoƒŠ[ƒƒjƒ…[‚ğ“Ç‚İ‚ñ‚Å‚¢‚Ü‚·B ‚µ‚Î‚ç‚­‚¨‘Ò‚¿‚­‚¾‚³‚¢...& timeout /t 1 /nobreak >nul
cls
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ƒŠƒJƒoƒŠ[ƒƒjƒ…[
setlocal enabledelayedexpansion

:Cursor_Changer_REmenu_main_loop
if not defined dummy (set /p nothing=[H[2K<nul)
for /l %%i in (1,1,512) do ( if not defined dummy (set /p nothing=[?25l[H<nul)
rem Draw menu
echo                     ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒŠƒJƒoƒŠ[ƒƒjƒ…[              
echo.
echo                            !rmcb1!        Ä‹N“®        %clr2%
echo                            !rmcb2!     İ’è‚Ì‰Šú‰»     %clr2%
echo                            !rmcb3! ƒŠƒJƒoƒŠ[ƒRƒ“ƒ\[ƒ‹ %clr2%
echo                            !rmcb4!         ‘Şo         %clr2%
echo.
echo.
echo.
echo.
echo                     %clrgra%1~4 ‚© WS ‚Å ‘I‘ğA E ‚© Y ‚Å Œˆ’è%clr2%
for /l %%i in (8,1,9) do (set /p nothing=[%%i;7H[2K<nul)
if !rmsel!==0 (set /p nothing=[8;22H Œ»İ‚Í‰½‚à‘I‘ğ‚³‚ê‚Ä‚¢‚Ü‚¹‚ñB<nul)
if !rmsel!==1 (set /p nothing=[8;25H ƒJ[ƒ\ƒ‹‘Ö‚¦‚ğÄ‹N“®‚µ‚Ü‚·B[9;22H ^(Šî–{“I‚É‚Í‚±‚ê‚ª‚¨‚·‚·‚ß‚Å‚·B^)<nul)
if !rmsel!==2 (set /p nothing=[8;28H İ’è‚ğ‰Šú‰»‚µ‚Ü‚·B[9;23H ^(‘S‚Ä‚Ìİ’è‚ğ‰Šú‰»‚µ‚Ü‚·B^)<nul)
if !rmsel!==3 (set /p nothing=[8;21H ƒŠƒJƒoƒŠ[ƒRƒ“ƒ\[ƒ‹‚ÉˆÚ“®‚µ‚Ü‚·B[9;17H ^(ƒfƒoƒbƒO–Ú“I‚ÌƒRƒ}ƒ“ƒh‚ğ—˜—p‚Å‚«‚Ü‚·B^)<nul)
if !rmsel!==4 (set /p nothing=[8;26H ƒƒjƒ…[‚©‚ç‘Şo‚µ‚Ü‚·B[9;29H ^(ƒVƒƒƒbƒgƒ_ƒEƒ“^)<nul)

rem Ask for input, and process the move inputs
choice /c 1234WSYE /n >nul
set rmsel_Temp=!rmsel!
if !Errorlevel! geq 1 if !Errorlevel! leq 4 (set rmsel=!Errorlevel!)
if !rmsel!==0 (set rmsel=1& set rmcb1=%clr%) else (
if !ErrorLevel!==5 (if not !rmsel!==1 (set /a rmsel-=1) else (set rmsel=4))
if !ErrorLevel!==6 (if not !rmsel!==4 (set /a rmsel+=1) else (set rmsel=1))
if !Errorlevel! geq 7 if !Errorlevel! leq 8 (call :Cursor_Changer_REmenu_Core)
for /l %%i in (1,1,4) do (set rmcb%%i=) & set rmcb!rmsel!=%clr%))
if not defined dummy (set /p nothing=[0;0HLag spike :3<nul& goto :Cursor_Changer_REmenu_loop)

:Cursor_Changer_REmenu_Core
rem Process select
if !rmsel!==1 (call :Cursor_Changer_REmenu_Exit & call :PowerScreen reboot)
if !rmsel!==2 (call :Cursor_Changer_REWipe)
if !rmsel!==3 (call :Cursor_Changer_REConsole)
if !rmsel!==4 (call :Cursor_Changer_REmenu_Exit & call :PowerScreen)
cls & exit /b

:Cursor_Changer_REmenu_Exit
setlocal disabledelayedexpansion
rem initialize variables
set runningfromfulldebug=& set FromREConsole=& set Remenuexit=&
for /l %%i in (1,1,4) do (set rmcb%%i=) & set rmcb!rmsel!=%clr%
exit /b


:Cursor_Changer_REWipe
cls
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ƒŠƒJƒoƒŠ[ƒƒjƒ…[
echo                     ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒŠƒJƒoƒŠ[ƒƒjƒ…[                 
echo.
echo.  
echo                       İ’è‚Ì‰Šú‰» (ƒfƒtƒHƒ‹ƒg’l‚É–ß‚·) 
echo                            –{“–‚ÉÀs‚µ‚Ü‚·‚©H
echo.
echo.
echo                              Y‚ÅÀsAN‚Å–ß‚é
echo.
choice /c YN /n 
if %ErrorLevel%==1 (call :Wipealldeta & goto :Cursor_Changer_REWipeYippeee)
if %ErrorLevel%==2 (set rmsel=2& exit /b)

:Cursor_Changer_REWipeYippeee
cls
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ƒŠƒJƒoƒŠ[ƒƒjƒ…[
echo                     ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒŠƒJƒoƒŠ[ƒƒjƒ…[                 
echo.
echo.  
echo                               İ’è‚Ì‰Šú‰»‚Í
echo                             ³í‚ÉŠ®—¹‚µ‚Ü‚µ‚½B
echo.
echo.
echo.
echo.
timeout /t 3 /nobreak >nul
set rmsel=2& exit /b


:Cursor_Changer_REConsole
cls
mode con: cols=75 lines=25
set selected=
set FromREConsole=true
set bootbatnow=no
if not defined dummy (set /p nothing=[?25h<nul)
echo ƒŠƒJƒoƒŠ[ƒRƒ“ƒ\[ƒ‹‚ğ“Ç‚İ‚ñ‚Å‚¢‚Ü‚·...
timeout /t 2 /nobreak >nul
cls
:Cursor_Changer_REConsolemain
if not defined dummy (set /p nothing=[?25h<nul)
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ƒŠƒJƒoƒŠ[ƒRƒ“ƒ\[ƒ‹
echo tamago_1908 ƒJ[ƒ\ƒ‹‘Ö‚¦ [Version %batver%]
echo Hi, %USERNAME%. welcome. by the way, All rights reserved to tamago_1908
echo.
echo.
echo.
echo.
echo.
echo.
echo. 
echo.
echo.
echo.
echo                                                ‚±‚ñ‚É‚¿‚ÍI
echo                                   Às‚µ‚½‚¢ƒRƒ}ƒ“ƒh‚ğ“ü—Í‚µ‚Ä‚­‚¾‚³‚¢B
echo                                            "help" ‚Æ“ü—Í‚·‚ê‚Î
echo                                       ‘SƒRƒ}ƒ“ƒhƒŠƒXƒg‚ğQÆ‚Å‚«‚Ü‚·B
echo                                ƒfƒoƒbƒO–Ú“I‚ÌƒRƒ}ƒ“ƒh‚ğ‚·‚×‚Ä—˜—p‰Â”\‚Å‚·B
echo                                     (restoresetting ‚Åİ’è‚Ì‰Šú‰»)
echo.
echo.
echo.
echo.
echo.
echo.
:Cursor_Changer_REConsoleask
set selected=
SET /P selected=Cns ^>
if "%selected%"=="help" (goto :allcommands)
if "%selected%"=="exit" (set FromREConsole=& set rmsel=3& exit /b)
if "%selected%"=="uninstallnow1" (goto :Uninstall1)
if "%selected%"=="playdefboot" (cls&goto :firstboot)
if "%selected%"=="debugyesnow" (goto :kurogo)
if "%selected%"=="fulldebug" (goto :fulldebug)
if "%selected%"=="getadmin" (goto :batstartadm)
if "%selected%"=="restoresetting" (
call :Wipealldeta
echo Š®—¹B‰½‚©ƒL[‚ğ‰Ÿ‚µ‚Ä‘±s...
pause >nul
)
if "%selected%"=="uninstalldeletebat" (echo delete bat, confirm to type something...&pause&goto :uninstalldeletefinish5)
if "%selected%"=="windowsfiltertest" (goto :batbootcheckwinverbad)
if "%selected%"=="funanimationdeb" (goto :batbootanimationfun)
if "%selected%"=="openie" (goto :openiedev)
if "%selected%"=="setenter" (echo.&set /p PlaySound=pls type:&goto :hazimeboot) else (set selected= &echo —LŒø‚ÈƒRƒ}ƒ“ƒh‚ğ“ü—Í‚µ‚Ä‚­‚¾‚³‚¢B&goto :Cursor_Changer_REConsoleask)


rem O========================================= OOBE and Receovery Code Ended =================================================O


:Wipealldeta
rem Wipe Setting file
echo nodogcheckfor1234567890qwertyuiop > %Settingsfile%
echo YourName=%USERNAME% >> %Settingsfile%
echo BootAsCC=false >> %Settingsfile%
echo admin=false >> %Settingsfile%
echo CheckUpdate=false >> %Settingsfile%
echo PlaySound=true >> %Settingsfile%
echo bootanimation=true >> %Settingsfile%
echo s5_linuxboot=false >> %Settingsfile%
echo s5_simpleboot=false >> %Settingsfile%
echo s5_rawboot=false >> %Settingsfile%
echo HazimeBg=true >> %Settingsfile%
echo wmode=false >> %Settingsfile%
exit /b


rem Detects settings related to prompts for administrative privileges,
:batstart
if "%linuxboot%"=="false" (mode con: cols=75 lines=25)
if "%settingbypass%"=="true" (goto :hazimemenuskipboot)
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] ŠÇ—ÒŒ ŒÀ‚ªŠm”F‚³‚ê‚Ü‚µ‚½) else (cls)
rem ŠÇ—ÒŒ ŒÀİ’è‚ÌŒŸ’m
find "admin=true" %Settingsfile% > nul
if "%adminbypass%"=="true" (goto :gotadmin)
if "%errorlevel%"=="0" (goto :batstartadm) else (
call :SAB_Manager 0
goto :hazime
)


:batstartadm
if not "%linuxboot%"=="true" (cls)
rem ŠÇ—ÒŒ ŒÀ‚Ìæ“¾
if not "%linuxboot%"=="true" (echo copyright.ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% by tamago_1908)
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    goto :UACPrompt
) else ( goto :gotAdmin )
:UACPrompt
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] ŠÇ—ÒŒ ŒÀ‚ğ—v‹’†...)
powershell -NoProfile -Command "Start-Process '%~dp0%~n0%~x0' -Verb RunAs" >nul && PowerShell -WindowStyle Hidden -Command Exit && call :exit 0
echo.
if "%linuxboot%"=="true" (echo [%linuxishclred%ERROR%linuxishclr2%] ŠÇ—ÒŒ ŒÀ‚Ì—v‹‚ª‹‘”Û‚³‚ê‚Ü‚µ‚½ & echo.) else (
echo ŠÇ—ÒŒ ŒÀ‚Ì—v‹‚ª‹‘”Û‚³‚ê‚Ü‚µ‚½B
echo ^(ƒqƒ“ƒg: ŠÇ—ÒŒ ŒÀ‚Ì—v‹‚Íİ’è‚Å–³Œø‚É‚Å‚«‚Ü‚·B^)
)
timeout /t 2 /nobreak >nul
:gotAdmin
if not "%linuxboot%"=="true" (cls)
pushd "%CD%"
goto :hazime



:hazime
if "%uninstallentered%"=="true" (
set uninstallno2clr=
set uninstallno2clr2=
set uninstallclr=
set uninstallclr2=
set uninstallentered=
)
if "%settingbypass%"=="true" (goto :hazimemenuskipboot)
rem İ’è‚Æ‚»‚Ì‘¼‚Ìƒ[ƒh
rem ‰½‚ğ“Ç‚İ‚İA“Ç‚İ‚ñ‚¾Œã‚Ç‚±‚Égoto‚µ‚½‚¢‚©‚ğ•Ï”‚É‘ã“ü•K—v set wantload=setting1 set whatloadgoto=hazime “™ hazimeŠÖŒW‚Ìê‡‚Í‚»‚êƒIƒ“ƒŠ[
rem ƒJ[ƒ\ƒ‹‚ÌF‚ÉŠÖ‚µ‚Ä‚ÍƒƒCƒ“‚Ì•ÏX•”•ª‚É‚ÍÀ‘•‚µ‚Ä‚¢‚Ü‚¹‚ñB•ÏX‚µ‚Ä‚©‚çhazime‚É–ß‚Á‚Ä—ˆ‚ê‚é‚æ‚¤‚ÉİŒv‚µ‚Ä‚È‚¢‚Ì‚ÅB
rem İ’è‚ğ’Ç‰Á‚·‚éê‡‚ÍŠî–{ƒRƒsƒy‚Å‘åä•vB‚½‚¾Aƒƒjƒ…[‚ÌŒ©‚½–Ú‚Æ‚©‚É‚©‚©‚í‚é‚à‚Ì‚Å‚ÍƒR[ƒh‚ğ’Ç‰Á‚µ‚È‚¢‚Æ‚¢‚¯‚È‚¢‚©‚à
:settingloads
cd /d %batchmainpath%
if not exist %Settingsfile% (
cls
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| İ’èƒGƒ‰[
echo İ’èƒtƒ@ƒCƒ‹‚ª‘¶İ‚µ‚Ü‚¹‚ñB
pause
echo ‹°‚ç‚­A‰‰ñ‹N“®‚ğ‚µ‚½Û‚É‚»‚Ì‚Ü‚ÜƒJ[ƒ\ƒ‹‘Ö‚¦‚ğ•Â‚¶‚Ä‚©‚çÄ‹N“®‚µ‚Ä‚µ‚Ü‚Á‚½‚Ì‚ªŒ´ˆö‚Å‚µ‚å‚¤B‚»‚ê‚©AŒÌˆÓ‚Éİ’èƒtƒ@ƒCƒ‹‚ğÁ‹‚µ‚½‚©...­‚È‚­‚Æ‚àAİ’èƒtƒ@ƒCƒ‹‚ª‘¶İ‚µ‚È‚¢‚Ì‚Í–À‚Å‚·B
pause
cls
echo İ’èƒtƒ@ƒCƒ‹‚ğÄ¶¬‚µ‚Ü‚·B‚¢‚Ü‚Ü‚Å‚Ìİ’è‚Í‚·‚×‚Äíœ‚³‚ê‚Ü‚·B
pause
cls
call :Wipealldeta
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ...
echo Ä¶¬‚ªŠ®—¹‚µ‚Ü‚µ‚½B
pause
echo •ÏX‚ğ“K—p‚·‚é‚½‚ßAƒJ[ƒ\ƒ‹‘Ö‚¦‚ğÄ‹N“®‚µ‚Ä‚­‚¾‚³‚¢B
pause
call :exit 1 
)
if not exist %FirstSTFsfile% (
type nul > %FirstSTFsfile%
echo nodogcheckforfastboot >> %FirstSTFsfile%
)


rem uh oh
call :RandomDecisioner 32768
if "%errorlevel%"=="1" (title & color 04
    if not defined dummy (echo [0;0H)
    for /l %%i in (0,1,1000) do (set /p nothing= ‚·‚®‚É‚¯‚¹ <nul)
timeout 2 /nobreak >nul & call :exit)
set die=& set die2=


if "%bootbatnow%"=="no" (goto :whatload) else (goto :setting1load)
:setting1load
set allsettingerror=0
find "BootAsCC=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting1onoff=—LŒø
if %ErrorLevel%==1 goto :setting1load2
if "%bootbatnow%"=="yes" (
if "%linuxboot%"=="true" if not "%bootbatnow%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Setting1 ‚Í "true" ‚Æ‚µ‚Ä“Ç‚İ‚Ü‚ê‚Ü‚µ‚½)
call :SAB_Manager 1
goto :setting2load
)
goto :whatloadgoto


:setting2load
find "admin=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting2onoff=—LŒø
if %ErrorLevel%==1 goto :setting2load2
if "%bootbatnow%"=="yes" (
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Setting2 ‚Í "true" ‚Æ‚µ‚Ä“Ç‚İ‚Ü‚ê‚Ü‚µ‚½)
call :SAB_Manager 2
goto :setting3load
) 
goto :whatloadgoto

:setting3load
find "CheckUpdate=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting3onoff=—LŒø
if %ErrorLevel%==1 goto :setting3load2
if "%bootbatnow%"=="yes" (
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Setting3 ‚Í "true" ‚Æ‚µ‚Ä“Ç‚İ‚Ü‚ê‚Ü‚µ‚½)
call :SAB_Manager 3
goto :setting4load
) 
goto :whatloadgoto

:setting4load
find "PlaySound=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting4onoff=—LŒø
if %ErrorLevel%==1 goto :setting4load2
if "%bootbatnow%"=="yes" (
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Setting4 ‚Í "true" ‚Æ‚µ‚Ä“Ç‚İ‚Ü‚ê‚Ü‚µ‚½)
call :SAB_Manager 4
goto :setting5load
) 
goto :whatloadgoto

:setting5load
find "bootanimation=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting5onoff=—LŒø
if %ErrorLevel%==1 goto :setting5load2
if "%bootbatnow%"=="yes" (
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Setting5 ‚Í "true" ‚Æ‚µ‚Ä“Ç‚İ‚Ü‚ê‚Ü‚µ‚½)
call :SAB_Manager 5
goto :setting5_s1load
) 
goto :whatloadgoto


:setting5_s1load
find "s5_linuxboot=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting5_s1onoff=—LŒø
if %ErrorLevel%==1 goto :setting5_s1load2
if "%bootbatnow%"=="yes" (
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Setting5_1 ‚Í "true" ‚Æ‚µ‚Ä“Ç‚İ‚Ü‚ê‚Ü‚µ‚½)
call :SAB_Manager 5
goto :setting5_s2load
) 
goto :whatloadgoto

:setting5_s2load
find "s5_simpleboot=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting5_s2onoff=—LŒø
if %ErrorLevel%==1 goto :setting5_s2load2
if "%bootbatnow%"=="yes" (
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Setting5_2 ‚Í "true" ‚Æ‚µ‚Ä“Ç‚İ‚Ü‚ê‚Ü‚µ‚½)
call :SAB_Manager 5
goto :setting5_s3load
) 
goto :whatloadgoto

:setting5_s3load
find "s5_rawboot=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting5_s3onoff=—LŒø
if %ErrorLevel%==1 goto :setting5_s3load2
if "%bootbatnow%"=="yes" (
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Setting5_3 ‚Í "true" ‚Æ‚µ‚Ä“Ç‚İ‚Ü‚ê‚Ü‚µ‚½)
call :SAB_Manager 5
goto :setting6load
) 
goto :whatloadgoto

:setting6load
find "HazimeBg=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting6onoff=—LŒø
if %ErrorLevel%==1 goto :setting6load2
if "%bootbatnow%"=="yes" (
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Setting6 ‚Í "true" ‚Æ‚µ‚Ä“Ç‚İ‚Ü‚ê‚Ü‚µ‚½)
call :SAB_Manager 6
goto :wmodeload
) 
goto :whatloadgoto


:wmodeload
find "wmode=true" %Settingsfile% > nul
if "%ErrorLevel%"=="0" (set wmodeonoff=ƒ_[ƒNƒe[ƒ}‚É•ÏX  &set wmodetoggle=true)
if "%ErrorLevel%"=="1" (goto :wmodeload2)
if "%bootbatnow%"=="yes" (
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Wmode ‚Í "true" ‚Æ‚µ‚Ä“Ç‚İ‚Ü‚ê‚Ü‚µ‚½)
call :SAB_Manager 6
goto :loads
) 
goto :whatloadgoto

:allsettingtest
rem İ’è‚ÌŒ‡‘¹‚ğŒŸØ
:setting1load2
find "BootAsCC=false" %Settingsfile% > nul
if %ErrorLevel%==0 (set setting1onoff=–³Œø& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting1 ‚Í "false" ‚Æ‚µ‚Ä“Ç‚İ‚Ü‚ê‚Ü‚µ‚½)) else if %ErrorLevel%==1 set setting1onoff=null&set /a allsettingerror=allsettingerror+1& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclred%ERROR%linuxishclr2%] Setting1 ‚Í”j‘¹‚µ‚Ä‚¢‚Ü‚·B"null" ‚Æ‚µ‚Ä“Ç‚İ‚Ü‚ê‚Ü‚µ‚½)
if "%bootbatnow%"=="yes" (call :SAB_Manager 1)
if "%bootbatnow%"=="yes" (goto :setting2load) else (goto :whatloadgoto)

:setting2load2
find "admin=false" %Settingsfile% > nul
if %ErrorLevel%==0 (set setting2onoff=–³Œø& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting2 ‚Í "false" ‚Æ‚µ‚Ä“Ç‚İ‚Ü‚ê‚Ü‚µ‚½)) else if %ErrorLevel%==1 set setting2onoff=null&set /a allsettingerror=allsettingerror+1& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclred%ERROR%linuxishclr2%] Setting2 ‚Í”j‘¹‚µ‚Ä‚¢‚Ü‚·B"null" ‚Æ‚µ‚Ä“Ç‚İ‚Ü‚ê‚Ü‚µ‚½)
if "%bootbatnow%"=="yes" (call :SAB_Manager 2)
if "%bootbatnow%"=="yes" (goto :setting3load) else (goto :whatloadgoto)

:setting3load2
find "CheckUpdate=false" %Settingsfile% > nul
if %ErrorLevel%==0 (set setting3onoff=–³Œø& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting3 ‚Í "false" ‚Æ‚µ‚Ä“Ç‚İ‚Ü‚ê‚Ü‚µ‚½)) else if %ErrorLevel%==1 set setting3onoff=null&set /a allsettingerror=allsettingerror+1& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclred%ERROR%linuxishclr2%] Setting3 ‚Í”j‘¹‚µ‚Ä‚¢‚Ü‚·B"null" ‚Æ‚µ‚Ä“Ç‚İ‚Ü‚ê‚Ü‚µ‚½)
if "%bootbatnow%"=="yes" (call :SAB_Manager 3)
if "%bootbatnow%"=="yes" (goto :setting4load) else (goto :whatloadgoto)

:setting4load2
find "PlaySound=false" %Settingsfile% > nul
if %ErrorLevel%==0 (set setting4onoff=–³Œø& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting4 ‚Í "false" ‚Æ‚µ‚Ä“Ç‚İ‚Ü‚ê‚Ü‚µ‚½)) else if %ErrorLevel%==1 set setting4onoff=null&set /a allsettingerror=allsettingerror+1& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclred%ERROR%linuxishclr2%] Setting4 ‚Í”j‘¹‚µ‚Ä‚¢‚Ü‚·B"null" ‚Æ‚µ‚Ä“Ç‚İ‚Ü‚ê‚Ü‚µ‚½)
if "%bootbatnow%"=="yes" (call :SAB_Manager 4)
if "%bootbatnow%"=="yes" (goto :setting5load) else (goto :whatloadgoto)

:setting5load2
find "bootanimation=false" %Settingsfile% > nul
if %ErrorLevel%==0 (set setting5onoff=–³Œø& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting5 ‚Í "false" ‚Æ‚µ‚Ä“Ç‚İ‚Ü‚ê‚Ü‚µ‚½)) else if %ErrorLevel%==1 set setting5onoff=null&set /a allsettingerror=allsettingerror+1& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclred%ERROR%linuxishclr2%] Setting5 ‚Í”j‘¹‚µ‚Ä‚¢‚Ü‚·B"null" ‚Æ‚µ‚Ä“Ç‚İ‚Ü‚ê‚Ü‚µ‚½)
if "%bootbatnow%"=="yes" (call :SAB_Manager 5)
if "%bootbatnow%"=="yes" (goto :setting5_s1load) else (goto :whatloadgoto)

:setting5_s1load2
find "s5_linuxboot=false" %Settingsfile% > nul
if %ErrorLevel%==0 (set setting5_s1onoff=–³Œø& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting5_1 ‚Í "false" ‚Æ‚µ‚Ä“Ç‚İ‚Ü‚ê‚Ü‚µ‚½)) else if %ErrorLevel%==1 set setting5_s1onoff=null&set /a allsettingerror=allsettingerror+1& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclred%ERROR%linuxishclr2%] Setting5_1 ‚Í”j‘¹‚µ‚Ä‚¢‚Ü‚·B"null" ‚Æ‚µ‚Ä“Ç‚İ‚Ü‚ê‚Ü‚µ‚½)
if "%bootbatnow%"=="yes" (call :SAB_Manager 5)
if "%bootbatnow%"=="yes" (goto :setting5_s2load) else (goto :whatloadgoto)

:setting5_s2load2
find "s5_simpleboot=false" %Settingsfile% > nul
if %ErrorLevel%==0 (set setting5_s2onoff=–³Œø& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting5_2 ‚Í "false" ‚Æ‚µ‚Ä“Ç‚İ‚Ü‚ê‚Ü‚µ‚½)) else if %ErrorLevel%==1 set setting5_s2onoff=null&set /a allsettingerror=allsettingerror+1& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclred%ERROR%linuxishclr2%] Setting5_2 ‚Í”j‘¹‚µ‚Ä‚¢‚Ü‚·B"null" ‚Æ‚µ‚Ä“Ç‚İ‚Ü‚ê‚Ü‚µ‚½)
if "%bootbatnow%"=="yes" (call :SAB_Manager 5)
if "%bootbatnow%"=="yes" (goto :setting5_s3load) else (goto :whatloadgoto)

:setting5_s3load2
find "s5_rawboot=false" %Settingsfile% > nul
if %ErrorLevel%==0 (set setting5_s3onoff=–³Œø& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting5_3 ‚Í "false" ‚Æ‚µ‚Ä“Ç‚İ‚Ü‚ê‚Ü‚µ‚½)) else if %ErrorLevel%==1 set setting5_s3onoff=null&set /a allsettingerror=allsettingerror+1& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclred%ERROR%linuxishclr2%] Setting5_3 ‚Í”j‘¹‚µ‚Ä‚¢‚Ü‚·B"null" ‚Æ‚µ‚Ä“Ç‚İ‚Ü‚ê‚Ü‚µ‚½)
if "%bootbatnow%"=="yes" (call :SAB_Manager 5)
if "%bootbatnow%"=="yes" (goto :setting6load) else (goto :whatloadgoto)

:setting6load2
find "HazimeBg=false" %Settingsfile% > nul
if %ErrorLevel%==0 (set setting6onoff=–³Œø& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting6 ‚Í "false" ‚Æ‚µ‚Ä“Ç‚İ‚Ü‚ê‚Ü‚µ‚½)) else if %ErrorLevel%==1 set setting6onoff=null&set /a allsettingerror=allsettingerror+1& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclred%ERROR%linuxishclr2%] Setting6 ‚Í”j‘¹‚µ‚Ä‚¢‚Ü‚·B"null" ‚Æ‚µ‚Ä“Ç‚İ‚Ü‚ê‚Ü‚µ‚½)
if "%bootbatnow%"=="yes" (call :SAB_Manager 6)
if "%bootbatnow%"=="yes" (goto :wmodeload) else (goto :whatloadgoto)

:wmodeload2
find "wmode=false" %Settingsfile% > nul
if "%ErrorLevel%"=="0" (set wmodeonoff=ƒzƒƒCƒgƒe[ƒ}‚É•ÏX& set wmodetoggle=false& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Wmode Loaded ‚Í "false" ‚Æ‚µ‚Ä“Ç‚İ‚Ü‚ê‚Ü‚µ‚½)) else if "%ErrorLevel%"=="1" (set wmodeonoff=  null  ƒe[ƒ}‚É•ÏX&set wmodetoggle=false&set /a allsettingerror=allsettingerror+1& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclred%ERROR%linuxishclr2%] Wmode ‚Í”j‘¹‚µ‚Ä‚¢‚Ü‚·B"null" ‚Æ‚µ‚Ä“Ç‚İ‚Ü‚ê‚Ü‚µ‚½))
if "%bootbatnow%"=="yes" (call :SAB_Manager 6)
if "%bootbatnow%"=="yes" (goto :loads) else (goto :whatloadgoto)

:loads
rem load your name
for /f "tokens=2 delims==" %%a in ('type %Settingsfile% ^| findstr /r "YourName=."') do (
    set YourName=%%a
)
set "YourName=%YourName: =%"
if defined YourName (
    if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo.& echo [%linuxishclr%Info%linuxishclr2%] ‚±‚ñ‚É‚¿‚ÍA%YourName%I)
) else if not defined YourName (
    set "YourName=%USERNAME%"
    if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo.& echo [%linuxishclred%ERROR%linuxishclr2%] Your Name ‚Í‘¶İ‚µ‚Ü‚¹‚ñB‹M—l’N‚¾I)
)
call :SAB_Manager 7

:firststarttest
rem detect %FirstSTFsfile%
setlocal enabledelayedexpansion
if exist %FirstSTFsfile% (
find "nodogcheckforfastboot" %FirstSTFsfile% > nul
if "!ErrorLevel!"=="1" (
set FirstCursorisEdited=true
    )
)
setlocal disabledelayedexpansion
if "%bootbatnow%"=="no" (echo ˆ—’†...) else (
if "%linuxboot%"=="true" (echo.&echo [%linuxishclr%info%linuxishclr2%] %FirstSTFsfile% ‚Í“Ç‚İ‚Ü‚ê‚Ü‚µ‚½)
call :SAB_Manager 8
goto :cursorcolorload
)
if "%whatloadgoto%"=="hazime" (goto :hazimemenu)
goto :cursorcolorload

:cursorcolorload
reg query "HKEY_CURRENT_USER\Control Panel\Cursors" /v "" | find "Windows •" >nul
if "%ErrorLevel%"=="0" (set cursorcolor=”’)
if "%ErrorLevel%"=="1" (set cursorcolor=”’)
if "%bootbatnow%"=="no" (echo ˆ—’†...) else (
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Cursor Color ‚Í“Ç‚İ‚Ü‚ê‚Ü‚µ‚½)
call :SAB_Manager 9
goto :hazimecursorcolor2
)
if "%whatloadgoto%"=="hazime" (goto :hazimemenu)

:hazimecursorcolor2
reg query "HKEY_CURRENT_USER\Control Panel\Cursors" /v "" | find "Windows •W€" >nul
if "%ErrorLevel%"=="0" (set cursorcolor=•)
if "%bootbatnow%"=="no" (echo ˆ—’†...) else (
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] ƒƒjƒ…[ŠÖ˜A‚Í‚·‚×‚Ä“Ç‚İ‚Ü‚ê‚Ü‚µ‚½)
call :SAB_Manager 10
goto :SAB_Manager_initializeVaribale
)
if "%whatloadgoto%"=="hazime" (goto :hazimemenu)
goto :hazimemenu



:SAB_Manager
if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] SAB_Manager Às’†...)
rem ƒu[ƒgƒAƒjƒ[ƒVƒ‡ƒ“B
rem ‰º‚Í“Ç‚İ‚İ‚ÌƒeƒLƒXƒg•ªŠòB
if "%bootbatnow%"=="no" (cls & title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| İ’è ˆ—’†... & echo ˆ—’†... & goto :whatload) else (title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ‹N“®’†...)
if "%simpleboot%"=="true" (cls & echo ‹N“®’†...& exit /b)
if "%wmodetoggle%"=="false" (set loadscrnprgsclr=[7m&set loadscrnprgsclrgra=[48;5;244m&set loadscrnprgsclr2=[0m&set back_to_the_firstline=[18;0H&set back_to_the_loadline=[23;12H)
if "%wmodetoggle%"=="true" (set loadscrnprgsclr=[47m[97m&set loadscrnprgsclrgra=[48;5;244m&set loadscrnprgsclr2=[0m[107m[30m&set back_to_the_firstline=[18;0H&set back_to_the_loadline=[23;12H) else (set loadscrnprgsclr=[7m&set loadscrnprgsclrgra=[48;5;244m&set loadscrnprgsclr2=[0m&set back_to_the_firstline=[18;0H&set back_to_the_loadline=[23;12H)
if not defined dummy if not "%linuxboot%"=="true" (set /p nothing=[?25l<nul)
if defined linuxboot if "%linuxboot%"=="true" (exit /b)

rem “Ç‚İ‚İƒo[‚ÌUI (˜g) •`Ê
if not defined SAB_Manager_Drewed (set SAB_Manager_Drewed=true& set batloadprgsDrewrn=12& set batloadprgsDrew=0) else if defined SAB_Manager_Drewed (goto :SAB_Manager_Main_Bar)
set /p nothing=%back_to_the_loadline%%loadscrnprgsclr2%<nul
echo %back_to_the_firstline%
if "%wmodetoggle%"=="true" (set welcomelineclr=[38;2;135;135;135m& set welcomelineclr2=[30m) else (set welcomelineclr=[38;2;120;120;120m& set welcomelineclr2=[39m)
if "%wmodetoggle%"=="true" (for /l %%i in (24,1,30) do (set /p nothing=[%%i;0H[48;2;230;230;230m[2K[24;0H<nul)) else (for /l %%i in (24,1,30) do (set /p nothing=[%%i;0H[48;2;20;20;20m[2K[24;0H<nul))
echo %welcomelineclr%O=========================================================================O%welcomelineclr2%
echo.
echo                       ƒJ[ƒ\ƒ‹‘Ö‚¦‚ğ“Ç‚İ‚ñ‚Å‚¢‚Ü‚·...
echo           O=====================================================O
echo           I                                                     I
echo           O=====================================================O
set /p nothing=%back_to_the_loadline%%loadscrnprgsclrgra%                                                     %loadscrnprgsclr2%<nul
:SAB_Manager_Main_Bar
rem ÀÛ‚Ìprogressƒo[–{‘Ì‚Ì•`Ê
set /p nothing=%back_to_the_loadline%<nul
if %1 lss 6 (set /a batloadprgsDrew=%batloadprgsDrew%+4) else (set /a batloadprgsDrew=%batloadprgsDrew%+5)
for /l %%i in (%batloadprgsDrewrn%,1,%batloadprgsDrew%) do (
    set batloadprgsDrewrn=%%i& set /p nothing=[23;%%iH%loadscrnprgsclr% %loadscrnprgsclr2%<nul
    if "%1"=="10" (set /p nothing=%loadscrnprgsclr%   %loadscrnprgsclr2%<nul& exit /b)
)
exit /b

:SAB_Manager_initializeVaribale
set batloadprgsDrewrn=& set batloadprgsDrew=
set loadscrnprgsclr=&set loadscrnprgsclr2=&set loadscrnprgsclrgra=
set batloadprgsdelete=&set back_to_the_firstline=&set back_to_the_loadline=
set SAB_Manager_Drewed=
set welcomelineclr=& set welcomelineclr2=
goto :hazimemenu



:whatload
rem ‚±‚±‚Ìˆ—A‚¢‚é‚©‚È‚ŸH•’Ê‚Ésetting‚Ì’l‚ª—~‚µ‚¢‚¾‚¯‚È‚çsetting1load‚Æ‚©‚Égoto‚µ‚½‚¤‚¦‚Ås‚«æ‚ğwhatloadgoto‚É‘ã“ü‚·‚ê‚Î“®‚­‚Æv‚¤‚ñ‚¾‚¯‚Ç....
if "%wantload%"=="setting1" (goto :setting1load) 
if "%wantload%"=="setting2" (goto :setting2load)
if "%wantload%"=="setting3" (goto :setting3load)
if "%wantload%"=="setting4" (goto :setting4load)
if "%wantload%"=="setting5" (goto :setting5load)
if "%wantload%"=="setting5_1" (goto :setting5_s1load)
if "%wantload%"=="setting5_2" (goto :setting5_s2load)
if "%wantload%"=="setting5_3" (goto :setting5_s3load)
if "%wantload%"=="setting6" (goto :setting6load)
if "%wantload%"=="wmode" (goto :wmodeload)
if "%wantload%"=="syokaihazime" (goto :syokaihazimeload)
if "%wantload%"=="cursorcolor" (goto :cursorcolorload)
if "%wantload%"=="" (goto :hazimemenu)
call :BSOD_Errors 2
pause
exit

:whatloadgoto
set wantload=
exit /b


:batbootanimation
rem Calculate Boot time
set boottime2=%time%
for /f "tokens=1-3 delims=:., " %%i in ("%boottime1%") do (set /a seconds1=^(1%%i%%100*3600^)+^(1%%j%%100*60^)+^(1%%k%%100^)-366100)
for /f "tokens=1-3 delims=:., " %%i in ("%boottime2%") do (set /a seconds2=^(1%%i%%100*3600^)+^(1%%j%%100*60^)+^(1%%k%%100^)-366100)
set /a BootTime=seconds2-seconds1
set seconds1=& set seconds2=& set boottime1=& set boottime2=
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          set ??????=‚±‚±‚Å‰½‚ğ‚µ‚Ä‚¢‚é‚ñ‚¾H ‚±‚±‚É‚¢‚é‚ñ‚¾‚ëH%username%.
if "%settingbypass%"=="true" (goto :hazimemenuskipboot)
rem ‚æ‚Á‚µ‚á[[[[[[[[[IIIIIIIIIIIIIIIIIIIII
if "%linuxboot%"=="true" (setlocal enabledelayedexpansion & set /a yay=%random%*17/32767& set yayshow=[
for /l %%i in (0,1,!yay!) do (set yayshow=!yayshow![)
setlocal disabledelayedexpansion)

if "%linuxboot%"=="true" (echo.&echo [%linuxishclr%info%linuxishclr2%] ‹N“®Š®—¹! ‚æ‚Á‚µ‚á[%yayshow% :D& echo [%linuxishclr%info%linuxishclr2%] ^(‹N“®ŠÔ : %BootTime% •b^)& title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ‚æ‚Á‚µ‚á[%yayshow%& set yay=& set yayshow=& timeout /t 2 /nobreak >nul& cls) else (cls)
if "%rawboot%"=="true" (echo off)
if "%firststartbat%"=="yes" (goto :batbootanimationbypassfun)
if "%setting5onoff%"=="–³Œø" (call :Core_Powershell 1 & goto :checksum)
rem ƒu[ƒgƒAƒjƒ[ƒVƒ‡ƒ“‚ğÄ¶B64•ª‚Ì1‚ÌŠm—¦‚Ü‚½‚Í512•ª‚Ì1‚ÌŠm—¦‚Å•Êƒo[ƒWƒ‡ƒ“‚ªÄ¶‚³‚ê‚éBramdom‚Ìd—l(H)‚É‚æ‚Á‚Ä“ñ‰ñ˜A‘±‚Årandom‚ğ‚µ‚È‚¢‚Æ‚¢‚¯‚È‚¢B
if not defined dummy (set /p nothing=[?25l<nul)
call :RandomDecisioner 64
if "%errorlevel%"=="1" (goto :batbootanimationfun)
call :RandomDecisioner 256
if "%errorlevel%"=="1" (call :BSOD_Errors THERE_IS_NO_PROBLEMS & cls & goto :checksum)
call :RandomDecisioner 512
if "%errorlevel%"=="1" (goto :batbootanimationscary)
:batbootanimationbypassfun
call :Core_Powershell 1
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ‚æ‚¤‚±‚»
if "%wmodetoggle%"=="true" (set welcomelineclr=[38;2;135;135;135m& set welcomelineclr2=[0m[107m[30m& set welcomelineclr3=[30m) else (set welcomelineclr=[38;2;120;120;120m& set welcomelineclr2=[0m& set welcomelineclr3=[39m)
if "%wmodetoggle%"=="true" (for /l %%i in (0,1,3) do (set /p nothing=[%%i;0H[48;2;230;230;230m                                                                           [0;0H<nul)) else (for /l %%i in (0,1,3) do (set /p nothing=[%%i;0H[48;2;20;20;20m                                                                           [0;0H<nul))
echo.
if not defined dummy (echo [30CƒJ[ƒ\ƒ‹‘Ö‚¦%batver%)
echo.
echo %welcomelineclr%O=========================================================================O%welcomelineclr2%
echo.
echo.
echo.
echo.
echo :::::'########:::::'###::::'########:
echo ::::: ##.... ##:::'## ##:::... ##..::
echo ::::: ##:::: ##::'##:. ##::::: ##::::
echo ::::: ########::'##:::. ##:::: ##::::
echo ::::: ##.... ##: #########:::: ##::::            ‚æ‚¤‚±‚»
echo '###: ##:::: ##: ##.... ##:::: ##::::
echo  ###: ########:: ##:::: ##:::: ##::::
echo ...::........:::..:::::..:::::..:::::
echo  For Windows 10-11
echo.
echo.
echo.
echo.
if "%wmodetoggle%"=="true" (for /l %%i in (22,1,25) do (set /p nothing=[%%i;0H[48;2;230;230;230m                                                                           [22;0H<nul)) else (for /l %%i in (22,1,25) do (set /p nothing=[%%i;0H[48;2;20;20;20m                                                                           [22;0H<nul))
echo %welcomelineclr%O=========================================================================O%welcomelineclr3%
echo.
if not defined dummy (echo [23C2021-2024 tamago_1908 %batbuild%)
set welcomelineclr=& set welcomelineclr2=& set welcomelineclr3=
timeout /t 2 /nobreak >nul
cls
rem İ’è‚ÌŒ‡‘¹‚ğŠm”F
goto :checksum

:batbootanimationfun
call :Core_Powershell 1
set bootegg=
set bootegg2=
mode con: cols=85 lines=29
if "%wmodetoggle%"=="false" (set c=[7m&set c2=[0m)
if "%wmodetoggle%"=="true" (set c=[100m[97m&set c2=[0m[107m[30m)
if "%wmodetoggle%"=="true" (set welcomelineclr=[38;2;135;135;135m& set welcomelineclr2=[0m[107m[30m& set welcomelineclr3=[30m) else (set welcomelineclr=[38;2;120;120;120m& set welcomelineclr2=[0m& set welcomelineclr3=[39m)
if not defined dummy (set /p nothing=[?25l<nul)
cls
:batbootanimationfun_a
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ‚³‚·‚ªƒJ[ƒ\ƒ‹‘Ö‚¦I‰´‚½‚¿‚É‚Å‚«‚È‚¢‚±‚Æ‚ğ•½‘R‚Æ‚â‚Á‚Ä‚Ì‚¯‚éƒbI‚»‚±‚É‚µ‚Ñ‚ê‚é“²‚ê‚é‚£‚ÁI
echo                                  %c% %c2%                %c% %c2%                                 
echo                                %c%   %c2%                 %c%  %c2%                               
echo                             %c%    %c2%                     %c%   %c2%                            
echo                 %c%             %c2%                           %c%             %c2%               
echo                              %c% %c2%                         %c%  %c2%               %c% %c2%           
echo        %c%   %c2%   %c%                     %c2%                 %c%            %c2%  %c%      %c2%             
echo           %c%  %c2%         %c%     %c2%                                 %c%     %c2%       %c%    %c2%         
echo          %c%   %c2% %c%                  %c2%                 %c%                         %c2%           
echo                        %c%         %c2%                 %c% %c2%   %c%    %c2%                  %c%  %c2%       
echo              %c%          %c2%       %c%     %c2%               %c%   %c2%      %c%        %c2%        %c%  %c2%       
echo                             %c%   %c2%                     %c%    %c2%                 %c%        %c2%   
echo       %c%             %c2%                                                     %c%     %c2%  %c%    %c2% 
echo        %c%    %c2%                                                           %c%     %c2%         
echo           %c%       %c2%                                              %c%    %c2%  %c%     %c2%          
echo               %c%                                                    %c2%  %c%      %c2%          
echo                  %c%  %c2%  %c%                                    %c2%      %c%       %c2%              
echo                  %c%  %c2%     %c% %c2%    %c% %c2%     %c% %c2%       %c% %c2%      %c% %c2%       %c%             %c2%             
echo                   %c%                                      %c2% %c%             %c2%              
echo    %c%      %c2%    %c%                                          %c2%     %c%       %c2%                
echo    %c%    %c2%  %c%  %c2%  %c%    %c%                         %c2%       %c% %c2%      %c%         %c2%                   
echo       %c% %c2%    %c%     %c2%   %c%  %c2%    %c%  %c2%       %c%  %c2%     %c%  %c2%      %c%   %c2%    %c%     %c2%                       
echo       %c%    %c2%       %c%          %c%  %c2%      %c%  %c2%     %c%              %c2%                            
echo       %c%    %c2%           %c%                            %c2%                                   
echo        %c%    %c2%                   %c%         %c2%                                             
echo           %c%   %c2%                                                                       
if "%wmodetoggle%"=="true" (for /l %%i in (26,1,29) do (set /p nothing=[%%i;0H[48;2;230;230;230m                                                                                     [26;0H<nul)) else (for /l %%i in (26,1,29) do (set /p nothing=[%%i;0H[48;2;20;20;20m                                                                                     [26;0H<nul))
echo %welcomelineclr%O===================================================================================O%welcomelineclr3%
echo.
echo                         ƒJ[ƒ\ƒ‹‘Ö‚¦%batver% ‚æ‚¤‚±‚» 2021-2024 
timeout /t 3 /nobreak >nul
mode con: cols=75 lines=25
set c=& set c2=& set funanimationclr=& set welcomelineclr=& set welcomelineclr2=& set welcomelineclr3=
goto :checksum


:batbootanimationscary
rem no comment about this
if not defined dummy (set /p nothing=[?25l<nul)
find "wmode=true" %Settingsfile% >nul
if "%errorlevel%"=="0" (color f0&set funanimationclr=f0) else (set funanimationclr=07)
set bootegg=
set bootegg2=
cls
title
mode con: cols=75 lines=25
color 04
set "batbootanimationscaryihatevscaf=("
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                     : %batbootanimationscaryihatevscaf%
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
timeout /t 2 /nobreak >nul
PowerShell -WindowStyle hidden -Command Exit
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"•‚¯‚Ä\", '', 'OK', 'Error');Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"•‚¯‚Ä\", '', 'OK', 'None')"
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"•‚¯‚Ü‚·‚©B\", '', [System.Windows.Forms.MessageBoxButtons]::'Yesno', 'None');exit $result;"
if "%errorlevel%"=="6" (goto :batbootanimationscaryif1)
if "%errorlevel%"=="7" (goto :batbootanimationscaryif2)
call :exit 0
:batbootanimationscaryif1
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"‚æ‚Á‚µ‚á[ :)\", '', 'OK', 'none')"
color %funanimationclr%
if not defined dummy (set /p nothing=[?25h<nul)
cls
PowerShell -WindowStyle normal -Command Exit
set batbootanimationscaryihatevscaf=
goto :checksum
:batbootanimationscaryif2
cls
taskkill /f /im explorer.exe >nul
PowerShell -WindowStyle normal -Command Exit
for /l %%i in (1,1,2500) do set /p "nothing=  :(  "<nul
PowerShell -WindowStyle hidden -Command Exit
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"•‚¯‚Ä‚Ù‚µ‚©‚Á‚½‚¾‚¯‚È‚Ì‚É :%batbootanimationscaryihatevscaf%\", '', 'OK', 'information')"
start explorer.exe
call :exit 0



:checksum
cls
if "%wmodetoggle%"=="true" (color f0) else (color 07)
if not defined dummy (set /p nothing=[?25h<nul)
if %allsettingerror% gtr 0 if %allsettingerror% lss 10 (set "allsettingerrorshow= %allsettingerror% ") else (set "allsettingerrorshow= %allsettingerror%")
if %allsettingerror% gtr 0 (
    if not defined dummy (set clrgra=[90m&set clr2=[0m)
    if "%wmodetoggle%"=="false" (set clrgra=[90m&set clr2=[0m)
    if "%wmodetoggle%"=="true" (set clrgra=[107m[38;2;140;140;140m&set clr2=[90m[107m[30m)
)
if %allsettingerror% gtr 0 (
    title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| İ’è‚Ì”j‘¹
    mode con: cols=60 lines=29
    echo.
    echo                      İ’è‚ª”j‘¹‚µ‚Ä‚¢‚Ü‚·I           
    echo.
    echo   O======================================================O
    echo   I                                                      I
    echo   I                        ƒGƒ‰[!                       I
    echo   I                                                      I
    echo   I       İ’è‚ª %allsettingerrorshow% ŒÂ”j‘¹‚µ‚Ä‚¢‚é‚©A‘¶İ‚µ‚Ü‚¹‚ñB    I
    echo   I        İ’èƒtƒ@ƒCƒ‹‚ğ•ÏX‚µ‚½‚©AˆÚ“®‚µ‚Ä‚¢‚È‚¢      I
    echo   I                  –‚ğŠm”F‚µ‚Ä‚­‚¾‚³‚¢B              I
    echo   I                                                      I
    echo   I    ƒJ[ƒ\ƒ‹‘Ö‚¦‚ÌXVŒã‚É‚±‚ÌƒƒbƒZ[ƒW‚ª•\¦‚³‚ê‚½  I
    echo   I      ê‡AV‚µ‚¢İ’è‚ª’Ç‰Á‚³‚ê‚½‰Â”\«‚ª‚‚¢‚Å‚·    I
    echo   I                                                      I
    echo   I        ‚»‚Ìê‡Aİ’è‚ğC•œ‚·‚é‚©A”j‘¹‚µ‚Ä‚¢‚é      I
    echo   I            ‰ÓŠ‚ğè“®‚Å•ÏX‚·‚é‚±‚Æ‚É‚æ‚Á‚Ä          I
    echo   I                      C•œ‚Å‚«‚Ü‚·B                  I
    echo   I                                                      I
    echo   I  C•œ‚·‚éÛ‚É‚ÍAİ’è‚És‚«A”j‘¹‚µ‚Ä‚¢‚éŒÂŠ ^(Null^) I
    echo   I      ‚ğØ‚è‘Ö‚¦‚Ä‚­‚¾‚³‚¢B‚»‚¤‚·‚é‚ÆA©“®“I‚É      I
    echo   I                 ”j‘¹ŒÂŠ‚ªC•œ‚³‚ê‚Ü‚·B             I
    echo   I       C•œ‚ÌÛ‚É‚ÍAƒfƒtƒHƒ‹ƒg‚Ì’l‚Éİ’è‚Í•ÏX       I
    echo   I                        ‚³‚ê‚Ü‚·B                    I
    echo   I                                                      I
    echo   I                 %clrgra%‰½‚©ƒL[‚ğ‰Ÿ‚µ‚Ä‘±s...%clr2%              I
    echo   I                                                      I
    echo   O======================================================O
    echo.
    pause >nul
)
if %allsettingerror% gtr 5 (goto :fixallsetting) else (
    if %boottime% geq 15 if %boottime% leq 999 (call :Hazime_Boottime_WarningMSG)
    if "%Setting1onoff%"=="—LŒø" (goto :cursorchange) else (goto :hazimemenu))
echo.
:fixallsetting
rem ©“®C•œ
timeout /t 2 /nobreak >nul
mode con: cols=75 lines=25
echo.
SET /P selected=©“®C•œ‚ğ—˜—p‚Å‚«‚Ü‚·B©“®C•œ‚ğÀs‚·‚é‚Æ‚»‚ê‚Ü‚Å‚Ìİ’è‚ª‚·‚×‚Ä‰Šú‰»‚³‚êAƒfƒtƒHƒ‹ƒg‚Ìİ’è‚ÉƒŠƒZƒbƒg‚³‚ê‚Ü‚·B‘±s‚µ‚Ü‚·‚©H(yes‚Ü‚½‚Íno):
if "%selected%"=="yes" (
call :Wipealldeta
echo.
echo C•œ‚ªŠ®—¹‚µ‚Ü‚µ‚½B
pause
echo Ä‹N“®’†...
call :Rebootbatch
)
if "%selected%"=="y" (
call :Wipealldeta
echo.
echo C•œ‚ªŠ®—¹‚µ‚Ü‚µ‚½B
pause
echo Ä‹N“®’†...
call :Rebootbatch
)
if "%selected%"=="no" (hazimemenuskipboot)
if "%selected%"=="n" (hazimemenuskipboot)

goto :hazimemenu


rem ƒƒjƒ…[‚Ì¶¬‚Ì€”õ
:hazimemenu
if "%bootbatnow%"=="no" (goto :hazimemenuskipboot)
if "%bootbatnow%"=="yes" (set bootbatnow=no& goto :batbootanimation)
:hazimemenuskipboot
cls
mode con: cols=75 lines=25
if not defined dummy (set clr2=[0m& set ccmmul=[4m)
if "%wmodetoggle%"=="true" (set clr2=[0m[107m[30m& set ccmmul=) else (set ccmmul=)
if "%runningfromfulldebug%"=="true" (set runningfromfulldebug=& exit /b)
if "%FromREConsole%"=="true" (cls & goto :Cursor_Changer_REConsolemain)
if "%hazimeeaster%"=="true" (set hazimebuild=%batbuild%)
if not defined dummy (set /p nothing=[?25h<nul)
if "%batverdev%"=="dev" (set hazimemenubuild=Dev)
if "%Punish%"=="true" (call :DEATHEASTEREGG)
set clrhelp=& set clrhelp2=
set settinghelptoggle=false
set wantload=
rem ƒƒjƒ…[‚Ì•`Ê
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ƒƒCƒ“ƒƒjƒ…[
:hazimemenudraw
rem ˆÃ‚­‚·‚é
if not "%1"=="DarkDarkerYetDarker" (cls & call :background_menu) else (set /p nothing=[0;0H%clrgra%<nul)
rem center = 37 (75). •¶š‚ğ’†‰›‚Éİ’u‚·‚éê‡‚Í“ñ•ª‚Ìˆêcols‚Ì’l‚©‚ç’†‰›‚Éİ’u‚µ‚½‚¢•¶š‚ÌA•¶š”‚Ì”¼•ª‚ğˆø‚¢‚½”‚Ì‹ó”’‚ğ‘}“ü‚·‚ê‚Î‚æ‚¢
echo                              ƒJ[ƒ\ƒ‹‘Ö‚¦%batver%  %hazimebuild%
echo.
echo   O=====================================================================O
echo   I     1 ƒJ[ƒ\ƒ‹‘Ö‚¦          2 ƒAƒvƒŠƒP[ƒVƒ‡ƒ“           3 I—¹     I
echo   I                                                                     I
echo   I                   4 ƒo[ƒWƒ‡ƒ“î•ñ          5 İ’è                  I
echo   O=====================================================================O
echo.
rem Œ³‚ÌF‚É–ß‚·
if "%1"=="DarkDarkerYetDarker" (for /l %%i in (8,1,19) do (set /p nothing=[%%i;0H[2K<nul)
    call :background_menu 2
    if "%wmodetoggle%"=="true" (set /p nothing=[0m[107m[30m<nul) else (set /p nothing=[0m<nul)
    exit /b
) else (call :hazimeMessages)
if "%errorlevel%"=="2" (goto :hazimemenuskipboot) else if "%errorlevel%"=="1" (cls & set Updateavailable=& goto :hazimemenudraw) else if "%errorlevel%"=="0" (goto :hazimemenudrawend)
:hazimemenudrawend
set selected=
rem ask select
echo            Às‚µ‚½‚¢”š‚Ü‚½‚ÍƒAƒ‹ƒtƒ@ƒxƒbƒg‚ğ“ü—Í‚µ‚Ä‚­‚¾‚³‚¢B
if "%FirstCursorisEdited%"=="true" (set /p "selected=[13;37H") else if "%hazimemenuMessageshowed%"=="true" (set /p selected=[13;37H) else if not defined hazimemenuMessageshowed (set /p selected=[11;37H)
echo.& if "%selected%"=="" (goto :hatenahazime) else (echo %selected% ‚ª‘I‘ğ‚³‚ê‚Ü‚µ‚½B)
set hatenaita=0


rem ‘I‘ğ‚Ì•ªŠò
if "%selected%"=="1" (goto :cursorchange)
if "%selected%"=="a" (goto :cursorchange)
if "%selected%"=="2" (goto :Appmenu)
if "%selected%"=="b" (goto :Appmenu)
if "%selected%"=="3" (goto :exitmenu)
if "%selected%"=="c" (goto :exitmenu)
if "%selected%"=="4" (goto :batver)
if "%selected%"=="d" (goto :batver)
if "%selected%"=="5" (goto :setting)
if "%selected%"=="e" (goto :setting)

rem ƒC[ƒXƒ^[ƒGƒbƒO
if "%selected%"=="egg1" (call :BSOD_Errors 4)
if "%selected%"=="egg2" (goto :Dogcheck)
if "%selected%"=="wwssdadaba" (set hatenaita=0&goto :littleeasteregg)
if "%selected%"=="tamago1908" (echo :P&pause&goto :hazime)
if "%selected%"=="himazinnoob1908" (echo :D&pause&goto :hazime)
if "%selected%"=="mskg1908" (echo xD&pause&goto :hazime)
if "%selected%"=="1908" (goto :1908hell)
if "%selected%"=="helloworld" (call :Hello_World& goto :hazimemenu)
if "%selected%"=="„‚Í–°‚¢‚Å‚·" (echo ‰´‚à‚¾I&pause& goto :hazime)

rem ƒfƒoƒbƒO—pƒRƒ}ƒ“ƒh‚ÌQÆ
if "%selected%"=="help" (goto :allcommands)

rem ƒfƒoƒbƒO—p
if "%selected%"=="halloween" (if "%setting7_1onoff%"=="true" (set setting7_1onoff=false) else (set setting7_1onoff=true)) & goto :hazime

if "%selected%"=="crashtest" (exit /b)
if "%selected%"=="checkmem" (call :checkmem& goto :hazimemenu)
if "%selected%"=="boottime" (echo.& echo ‹N“®ŠÔ : %BootTime% •b& echo.& pause & goto :hazimemenu)
if "%selected%"=="uninstallnow1" (call :UninstallMenu)
if "%selected%"=="playdefboot" (cls&goto :CursorChangerOOBE_Animation)
if "%selected%"=="debugyesnow" (goto :kurogo)
if "%selected%"=="reload" (cls&set bootbatnow=yes&set boottime1=%time%&goto :batstart)
if "%selected%"=="fulldebug" (goto :fulldebug)
if "%selected%"=="labellist" (call :AllLabelList& goto :hazime)
if "%selected%"=="getadmin" (goto :batstartadm)
if "%selected%"=="bypassfirstboot" (set firststartbat=no&call :Wipealldeta)
if "%selected%"=="uninstalldeletebat" (echo delete bat, confirm to type something...&pause&set Uninstall_way=1&cls&goto :UninstallExecution)
if "%selected%"=="windowsfiltertest" (goto :batbootcheckwinverbad)
if "%selected%"=="funanimationdeb" (goto :batbootanimationfun)
if "%selected%"=="openie" (goto :openiedev)
if "%selected%"=="setenter" (echo.&set /p hatenaita=pls type:&goto :hazime)

rem FUCK YOU!!!!!!
if "%selected%"=="fucku" (echo fuck you too&pause&goto :hazime)
if "%selected%"=="fuckyou" (echo fuck you too&pause&goto :hazime)
if "%selected%"=="fucu" (echo fuck you too&pause&goto :hazime)
if "%selected%"=="fucyou" (echo fuck you too&pause&goto :hazime)

rem Power Commands
if "%selected%"=="exit" (goto :exitmenu)
if "%selected%"=="shutdown" (call :PowerScreen)
if "%selected%"=="reboot" (echo.& echo Ä‹N“®‚µ‚Ä‚¢‚Ü‚·...& call :rebootbatch)
if "%selected%"=="counttestdeb" (set hatenaita=0&goto :stupidtest) else echo. &echo –³Œø‚Èi‚à‚µ‚­‚Íg—p•s‰Â‚Èj‘I‘ğ‚Å‚·I—LŒø‚È“ü—Í‚ğ‚µ‚Ä‚­‚¾‚³‚¢B&pause&goto :hazimemenudraw

rem ‰½‚à“ü—Í‚µ‚È‚©‚Á‚½ê‡‚Ì‹AŠÒˆ—
:hatenahazime
echo ?
echo.
pause
echo ‚·‚İ‚Ü‚¹‚ñB‰½‚©“ü—Í‚µ‚Ä‚­‚ê‚Ü‚¹‚ñ‚©H
echo.
pause

rem ’·‰Ÿ‚µ‚ğŒŸ’m‚·‚é‚½‚ß‚Ì‹@\
set /a hatenaita=hatenaita+1
if %hatenaita% gtr 20  (goto :hatenaokotest1)
goto :hazime

:hatenaokotest1
if not %hatenaita% gtr 50 (goto :hatenaoko1)
if %hatenaita% gtr 50 (goto :hatenaokotest2)

:hatenaokotest2
if not %hatenaita% gtr 100 (goto :hatenaoko2)
if %hatenaita% gtr 100 (goto :hatenaokotest3)

:hatenaokotest3
if not %hatenaita% gtr 130 (goto :hatenaoko3)
if %hatenaita% gtr 130 (goto :hatenaokotest4)

:hatenaokotest4
if not %hatenaita% gtr 200 (goto :hatenaoko4)
if %hatenaita% gtr 200 (goto :hatenaokotest5)

:hatenaokotest5
if not %hatenaita% gtr 250 (goto :hatenaoko5)
if %hatenaita% gtr 250 (goto :hatenaoko6)

rem ’·‰Ÿ‚µ‚ÌŒxƒƒbƒZ[ƒWW
:hatenaoko1
if %hatenaita% gtr 21 (goto :hazime)
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"...‰½‚µ‚Ä‚é‚Ì...H\", '...', 'OK', 'none');exit $result;"
goto :hazime

:hatenaoko2
if %hatenaita% gtr 51 (goto :hazime)
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"...‚È‚ñ‚Å‰½‚à“ü—Í‚¹‚¸‚ÉƒGƒ“ƒ^[‰Ÿ‚µ‘±‚¯‚Ä‚é‚ÌIH...‚à‚µ‚©‚µ‚Ä...\", '>:/', 'OK', 'none');exit $result;"
goto :hazime

:hatenaoko3
if %hatenaita% gtr 101 (goto :hazime)
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"‚Ó‚Â‚¤‚»‚±‚Ü‚Å‰½‚à‘Å‚½‚¸‚ÉƒGƒ“ƒ^[‰Ÿ‚³‚È‚¢‚¾‚ëIII‚¢‚¢‰ÁŒ¸‚É‚µ‚ëIII\", '>:(', 'OK', 'none');exit $result;"
goto :hazime

:hatenaoko4
if %hatenaita% gtr 131 (goto :hazime)
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"‚³‚·‚ª‚É‚»‚ë‚»‚ë‚â‚ß‚Ä‚­‚ê\", '...', 'OK', 'none');exit $result;"
goto :hazime

:hatenaoko5
if %hatenaita% gtr 201 (goto :hazime)
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"‚±‚êˆÈã‚â‚Á‚½‚çŒã‰÷‚³‚¹‚Ü‚·B200‰ñ‚à...\", 'ÅŒã‚ÌŒx', 'OK', 'Warning');exit $result;"
goto :hazime

:hatenaoko6
if %hatenaita% gtr 251 (goto :hazime)
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"...\", '...', 'OK', 'Error');exit $result;"
shutdown /r /t 5 /c "Œã‰÷‚·‚é‚ª‚æ‚¢B"
taskkill /im cmd.exe
goto :reboot


:hazimeMessages
rem Display messages. FirstCursorisEdited message, and updateavailable message
Call :hazimeMessagesTimecheck & set tcmrand=& set tcmrand2=
if "%errorlevel%"=="2" (set hazimemenuMessageshowed=true& exit /b 2)
if not "%errorlevel%"=="1" (if "%FirstCursorisEdited%"=="true" (echo [22CŠÈ’P‚É  ‚©‚«‚©‚¦‚ç‚ê‚½  ‚Å‚µ‚åH&echo.)) else (echo.& set hazimemenuMessageshowed=true)
if "%Updateavailable%"=="true" (call :UpdateAvailable& exit /b 1)
exit /b 0

:hazimeMessagesTimecheck
rem Display messages for specific dates
if "%timecheckmessageshowed%"=="true" (set hazimemenuMessageshowed=& exit /b 0) else (set timecheckmessageshowed=true)
if "%date:~0,4%"=="1999" (echo [25CƒE[ƒp[ƒ‹[ƒp[‚Í‚Ç‚±H& exit /b 1)
if "%date:~5%"=="01/01" (echo [22C–¾‚¯‚Ü‚µ‚Ä‚¨‚ß‚Å‚Æ‚¤‚²‚´‚¢‚Ü‚·B& exit /b 1)
if "%date:~5%"=="04/01" (echo [15CƒJ[ƒ\ƒ‹‘Ö‚¦‚ğ—˜—p‚µ‚½‚¯‚ê‚Î5000’›‰~•¥‚¢‚ÈI& exit /b 1)
if "%date:~5%"=="10/01" (echo [30C‚¨‚Î‚¯‚¾‚¼[I& exit /b 1)
if "%date:~5%"=="10/31" (echo [28Cƒnƒbƒs[ƒnƒƒEƒBƒ“I& exit /b 1)
if "%date:~5%"=="12/25" (echo [28CƒƒŠ[ƒNƒŠƒXƒ}ƒXI& exit /b 1)
if "%date:~5%"=="12/31" (echo [13C‚¢‚ë‚¢‚ë‚ ‚Á‚½‚¯‚Ç  ‚¶‚Ô‚ñ‚Í  ‚â‚Á‚Ï‚è  ‚¶‚Ô‚ñ‚¾B& exit /b 1)
rem you're bit lucky if you see this. 
call :RandomDecisioner 24
if "%errorlevel%"=="1" (set tcmrand=0& set /a tcmrand=%random%*21/32767& set /a tcmrand=%random%*21/32767)
if defined tcmrand ( rem ƒƒbƒZ[ƒW‚ÌƒŠƒXƒg
    if "%tcmrand%"=="0" (echo [29C‚·‚×‚Ä‚ª–³ˆÓ–¡‚¾) else if "%tcmrand%"=="1" (echo [14C’N‚ª‚±‚ÌƒƒbƒZ[ƒW‚ğÀÛ‚É“Ç‚ñ‚Å‚¢‚é‚ñ‚¾‚ë‚¤H) else if "%tcmrand%"=="2" (echo [22C’N‚à‚±‚Ìƒoƒbƒ`‚ğ‹C‚É‚µ‚Ä‚¢‚È‚¢B) else if "%tcmrand%"=="3" (echo [22C–l‚ğƒAƒ“ƒCƒ“ƒXƒg[ƒ‹‚µ‚È‚¢‚Å) else if "%tcmrand%"=="4" (echo [31CƒP[ƒL‚Í‰R‚¾) else if "%tcmrand%"=="5" (echo [28C‚ ‚È‚½‚Í–{“–‚É%YourName%H) else if "%tcmrand%"=="6" (echo [15CŒN’B‚Ìƒoƒbƒ`ƒtƒ@ƒCƒ‹‚ÍA‘S‚Ä„‚ª‚¢‚½‚¾‚¢‚½B) else if "%tcmrand%"=="7" (echo [30CHello world :D) else if "%tcmrand%"=="8" (echo [27CDebios‚ğ‚µ‚Ä‚İ‚æ‚¤) else if "%tcmrand%"=="9" (echo [24CShivtanium OS‚ğ‚µ‚Ä‚İ‚æ‚¤) else if "%tcmrand%"=="10" (set /p nothing=[24C<nul& call :RainbowDrawer ‚È‚ñ‚Ä‘f“G‚È“ú‚È‚ñ‚¾II :D& echo.) else if "%tcmrand%"=="11" (echo [32CƒhƒJ[ƒ“I) else if "%tcmrand%"=="12" (echo [27CˆÃ‚­ ˆÃ‚­ ‚³‚ç‚ÉˆÃ‚­) else if "%tcmrand%"=="13" (echo [29C‚±‚±‚Í‚Ç‚±...H) else if "%tcmrand%"=="14" (echo [30C‘OŒü‚«‚Èâ–]I) else if "%tcmrand%"=="15" (echo [27CƒEƒUƒCŒ¢‚ÍQ‚Ä‚¢‚é...) else if "%tcmrand%"=="16" (echo [29Cƒ}ƒtƒBƒ“ƒ^ƒCƒ€I) else if "%tcmrand%"=="17" (echo [24CƒJ[ƒ\ƒ‹‘Ö‚¦‚Í100%%ƒ^ƒ}ƒS»I) else if "%tcmrand%"=="18" (echo [30C–l‚Æˆê‚É‚¢‚Ä...) else if "%tcmrand%"=="19" (echo [33C‚¦‚Ö‚ÖI) else if "%tcmrand%"=="20" (call :hazimemenuMessagesTimecheckEASTEREGG & exit /b 2)
    exit /b 1
) else (exit /b 0)

:hazimemenuMessagesTimecheckEASTEREGG
rem small test easter egg.
set name=& set namecount=
cls
color 04
title 
:hazimemenuMessagesTimecheckEASTEREGG_ASK
cls
if not defined dummy (echo [19CÅ‚àÅ‚‚Èƒoƒbƒ`ƒtƒ@ƒCƒ‹‚Ì–¼‘O‚Í‰½H)
set name=
if "%namecount%" gtr "2" start /min powershell -WindowStyle Hidden -Command "& {Add-Type -AssemblyName System.Windows.Forms; Start-Sleep -Milliseconds 100; $welcomeText = \"ƒJ[ƒ\ƒ‹‘Ö‚¦\"; foreach ($char in $welcomeText.ToCharArray()) {[System.Windows.Forms.SendKeys]::SendWait($char); Start-Sleep -Milliseconds 125}; Start-Sleep -Milliseconds 500; [System.Windows.Forms.SendKeys]::SendWait('{ENTER}'); exit}"
rem where is my location?
rem powershell -Command "& { Add-Type -AssemblyName System.Windows.Forms; Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class KeyboardHelper { [DllImport(\"user32.dll\", SetLastError = true)] public static extern void keybd_event(byte bVk, byte bScan, uint dwFlags, UIntPtr dwExtraInfo); public const byte VK_LWIN = 0x5B; public const byte VK_S = 0x53; public const uint KEYEVENTF_KEYUP = 0x0002; public static void SendWinS() { keybd_event(VK_LWIN, 0, 0, UIntPtr.Zero); keybd_event(VK_S, 0, 0, UIntPtr.Zero); keybd_event(VK_S, 0, KEYEVENTF_KEYUP, UIntPtr.Zero); keybd_event(VK_LWIN, 0, KEYEVENTF_KEYUP, UIntPtr.Zero); } }'; Start-Sleep -Milliseconds 500; [KeyboardHelper]::SendWinS(); Start-Sleep -Milliseconds 250; $welcomeText = 'Where is my location?'; foreach ($char in $welcomeText.ToCharArray()) { [System.Windows.Forms.SendKeys]::SendWait($char); Start-Sleep -Milliseconds 50; }; Start-Sleep -Milliseconds 3500; [System.Windows.Forms.SendKeys]::SendWait('{ESC}') }"
if not defined dummy (set /p "name=[30C")
if not "%name%"=="ƒJ[ƒ\ƒ‹‘Ö‚¦" (set /a namecount=namecount+1) else (goto :hazimemenuMessagesTimecheckEASTEREGG_RIGHT)
if "%namecount%"=="1" (echo [29Cc”OA•s³‰ğI)
if "%namecount%"=="2" (echo [34Cˆá‚¤) else if %namecount% gtr 2 (echo [35C...)
pathping 127.0.0.1 -n -q 1 -p 500 1>nul
goto :hazimemenuMessagesTimecheckEASTEREGG_ASK
:hazimemenuMessagesTimecheckEASTEREGG_RIGHT
if not defined dummy (echo [31C‚»‚Ì’Ê‚èI)
if "%wmodetoggle%"=="true" (color f0) else (color 07)
timeout /t 2 /nobreak >nul
set name=& set namecount=
exit /b


:background_menu
rem Honestly, I have no idea HOW this is working. (I'm bad at math)
if "%setting6onoff%"=="–³Œø" (exit /b)
if not defined dummy (set /p nothing=[?25l<nul)
setlocal enabledelayedexpansion
rem argument 1 is for OOBE. give 0~200 (every 10) value. don't work with halloween theme. argument 2 is for ovarlay background.
rem initialize variable
set thml=26& set thml2=25& set thmldrewb=12& set thmldred=134
if "%wmodetoggle%"=="true" (if not defined dummy (set thmclr2=[107m[30m& set thmldrewb=255& set thmldred=155)
) else (if not defined dummy (set thmclr2=[0m))
if not "%1"=="2" (if "%wmodetoggle%"=="true" (set thmlfor=194,9,243) else (set thmlfor=61,-9,12) & rem < Define normal base color
) else (if "%wmodetoggle%"=="true" (set thmlfor=216,5,243) else (set thmlfor=39,-5,12)) & rem < Define overlay base color

rem Drew bg. thml means theme line. "thmldrew=%%i" is define the base line color 
for /l %%i in (!thmlfor!) do (set /a thml2-=1& set /a thml-=1 & rem < Line position (26-1)
if "%setting7_1onoff%"=="true" (set /a thmldrew=%%i-6& if not "%wmodetoggle%"=="true" (set /a thmldrew-=1) & rem < Halloween theme. normal drew or overlay drew.
    if not "%1"=="2" (if not "%wmodetoggle%"=="true" (set /a thmldred-=21) else (set /a thmldred+=11)) else ( rem < Gradation calc (Normal)
        if not "%wmodetoggle%"=="true" (set /a thmldred-=21& set /a thmldrew-=4) else (set /a thmldred+=16& set /a thmldrew+=16)) & rem < Gradation calc (Overlay)
    if !thmldrew! lss 12 (set thmldrew=12) & if !thmldred! lss 12 (set thmldred=18) & rem < Value correction
    if not "%1"=="2" (if !thmldred! gtr 220 (set /a thmldred=230)) else if !thmldred! geq 245 (set thmldred=242& set thmldrew=242& set thmldrewb=242) & rem < Value correction
) else ( rem < Main drawer
    if "%1"=="1" (set /a thmldrew=^(%%i-57^)+^(!count!*^(61-12^)^)/170 & if !thmldrew! lss 12 (set thmldrew=12)) else (set thmldrew=%%i)) & rem < Gradation calc, and Value correction. if argument is not 1, use raw value.
    if not "%setting7_1onoff%"=="true" (set thmclr=[48;2;!thmldrew!;!thmldrew!;!thmldrew!m) else (set thmclr=[48;2;!thmldred!;!thmldrew!;!thmldrewb!m) & rem < Main drew. Normal drew or Halloween drew (same color or r, g, b.)
    if not defined dummy (echo [!thml2!A) & for /l %%a in (1,1,3) do (set /p nothing=[!thml!d!thmclr!                         !thmclr2!<nul) & rem < Draw lines
)

rem delete variables
set thml=& set thml2=& set thmclr=& set thmldrew=& set thmldrewb=& set thmldred=& set thmlfor=
if not "%1"=="1" if not "%1"=="2" (set /p nothing=[?25h<nul)
if not defined dummy (set /p nothing=[0;0H<nul)
setlocal disabledelayedexpansion
exit /b



:checkmem
setlocal enabledelayedexpansion
rem stores the output of the set command as a string at a time
set "nl=??"& set length=0& set /a crlf_count=0
for /f "delims=" %%i in ('set') do (set "output=!output!%%i%nl%")
for /l %%a in (0,1,8192) do (if "!output:~%%a,1!"=="" (set /a length=%%a& goto :checkmem_count_done))
:checkmem_count_done
rem Consider CRLF line breaks (2 bytes)
for /l %%j in (0,1,!length!) do (if "!output:~%%j,1!"=="%nl%" (set /a crlf_count+=1))
rem 1KB = 1024Bytes
set /a total_length=length+crlf_count
set /a memWholeKB=total_length/1024
set /a memFractionKB=(total_length %% 1024)*100/1024
echo.
echo ƒƒ‚ƒŠg—p—Ê (ŠTZ) : %memWholeKB%.%memFractionKB% KB (%total_length% ƒoƒCƒg)
echo.
pause
set output=& set nl=& set length=& set crlf_count=& set total_length=& set memWholeKB=& set memFractionKB=
setlocal disabledelayedexpansion
exit /b


:RandomDecisioner
if "%1"=="" (echo ‚¨‘O‚Ì‹ê˜J‚ğ‚¸‚Á‚ÆŒ©‚Ä‚¢‚½‚¼B–{“–‚É‚æ‚­Šæ’£‚Á‚Ä‚È‚©‚Á‚½‚ÈH& exit /b 666)
set value1=0& set value2=0
set /a value1=%random%*(%1+1)/32767& set /a value2=%random%*(%1+1)/32767
if %value1% equ %value2% (set value1=& set value2=& exit /b 1) else (set value1=& set value2=& exit /b 0)


:RainbowDrawer
set "text=%*" & setlocal enabledelayedexpansion
if "%~1"=="" (echo ˆø”‚Í‚Ç‚±IH& pause & exit /b 1)
if "%wmodetoggle%"=="true" (set rbclr=[107m[30m) else (set rbclr=[0m)
rem Calculate string length
set "length=0" & if not defined rbphase set "rbphase=0" & if not defined rbdark set "rbdark=0"
for /l %%i in (0,1,128) do (set "char=!text:~%%i,1!" & if not "!char!"=="" (set /a length+=1))

rem Process string
for /l %%i in (0,1,%length%) do (set "char=!text:~%%i,1!" & if not "!char!"=="" (set /p =[?25l<nul) else (set /p =[?25h<nul)
    set /a ratio=%%i*360/%length%+^(rbphase*360/100^) & if !ratio! geq 360 (set /a ratio-=360) & rem <- Initialize RGB values
    set /a r=0, g=0, b=0& set /a section=!ratio!/60
    if !section! equ 0 (set /a r=255, g=!ratio!*255/60 & rem <- RGB color calculation
    ) else if !section! equ 1 (set /a r=255-^(!ratio!-60^)*255/60, g=255) else if !section! equ 2 (set /a g=255, b=^(!ratio!-120^)*255/60
    ) else if !section! equ 3 (set /a g=255-^(!ratio!-180^)*255/60, b=255) else if !section! equ 4 (set /a r=^(!ratio!-240^)*255/60, b=255
    ) else (set /a r=255, b=255-^(!ratio!-300^)*255/60)
    if %rbdark% gtr 0 (for %%a in (r,g,b) do (set /a "value=!%%a!-rbdark" & if !value! lss 12 (set "%%a=12") else (set "%%a=!value!")))
    set /p nothing=[38;2;!r!;!g!;!b!m!char!%rbclr%<nul& rem ^ Ensure RGB values are within bounds and apply dark adjustment, And show
)
setlocal disabledelayedexpansion
set text=& set length=& set rbphase=& set i=& set char=& set ratio=& set r=& set g=& set b=& set section=& set value=& set rbclr=& exit /b


:Hazime_Boottime_WarningMSG
rem GUI type 3
rem Preparing of Menu and Variables
if not defined dummy (set clr=[7m&set clrgra=[90m&set clryel=[93m&set clrwhi=[97m&set clr2=[0m)
if "%wmodetoggle%"=="false" (set clr=[7m&set clrgra=[90m&set clryel=[93m&set clrwhi=[97m&set clr2=[0m)
if "%wmodetoggle%"=="true" (set clr=[100m[97m&set clrgra=[107m[38;2;140;140;140m&set clryel=[93m&set clrwhi=[30m&set clr2=[90m[107m[30m)
rem Draw Update Available UI
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ‹N“®ŠÔ‚ÌŒx
if %boottime% leq 10 (set "BoottimeTEMP=%boottime% ") else (set BoottimeTEMP=%boottime%)
if not defined dummy (set /p nothing=[?25l%clr2%<nul& call :hazimemenudraw DarkDarkerYetDarker)
if not defined dummy (
echo [5;11H O===================================================O 
echo [6;11H I                                                   I 
echo [7;11H I                       %clrwhi%!Œx!%clr2%                      I 
echo [8;11H I                                                   I 
echo [9;11H I  ƒJ[ƒ\ƒ‹‘Ö‚¦‚ª‹N“®‚·‚é‚Ü‚Å‚ÌŠÔ‚ª’·‚¢‚æ‚¤‚Å‚·I I 
echo [10;11H I          ƒJ[ƒ\ƒ‹‘Ö‚¦‚Í•½‹Ï‚µ‚Ä–ñ3`5•b‚Å         I
echo [11;11H I          ‹N“®‚µ‚Ü‚·‚ªA‚ ‚È‚½‚ÌŠÂ‹«‚Ìê‡A       I
echo [12;11H I          ‹N“®‚·‚é‚Ì‚É–ñ%BoottimeTEMP%•b‚©‚©‚Á‚Ä‚¢‚Ü‚·!        I
echo [13;11H I                                                   I
echo [14;11H I    ˆÈ‰º‚Ì“_‚ğŠm”F‚µ‚Ä‚­‚¾‚³‚¢ :                   I
echo [15;11H I                                                   I
echo [16;11H I   %clryel%E%clr2%   ‚¨g‚¢‚ÌƒRƒ“ƒsƒ…[ƒ^[‚Ì«”\               I
echo [17;11H I   %clryel%E%clr2%   ƒAƒ“ƒ`ƒEƒCƒ‹ƒXƒ\ƒtƒgƒEƒFƒA‚ÌŠm”F           I
echo [18;11H I   %clryel%E%clr2%   Powershell‚Ì‹N“®‚ÉŠÔ‚ª                   I
echo [19;11H I        ‚©‚©‚è‚·‚¬‚Ä‚¢‚È‚¢‚©                       I
echo [20;12HI                                                   I
echo [21;12HI              %clrgra%^(‰½‚©ƒL[‚ğ‰Ÿ‚µ‚Ä‘±s...^)%clr2%            I
echo [22;12HI                                                   I
echo [23;12HO===================================================O
)
pause >nul
if not defined dummy (set /p nothing=[?25h<nul)
cls & set clryel=& set clrwhi=& set BoottimeTEMP=& exit /b


:exitmenu
rem GUI type 3
rem Preparing of Menu and Variables
rem Smart Processing!!!! DO NOT CARE ABOUT SO MANY OF IF STATEMENTS. PLS
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| I—¹ƒƒjƒ…[ 
set exitmenucurrent=0
if not defined dummy (set clr=[7m&set clred=[41m&set clrgrn=[42m&set clrcyan=[46m&set clrgra=[90m&set clr2=[0m)
if "%wmodetoggle%"=="false" (set clr=[7m&set clred=[41m&set clrgrn=[42m&set clrgra=[90m&set clrcyan=[46m&set clr2=[0m)
if "%wmodetoggle%"=="true" (set clr=[100m[97m&set clred=[41m&set clrgrn=[42m&set clrgra=[107m[38;2;140;140;140m&set clrcyan=[46m&set clr2=[0m[90m[107m[30m)
if not defined dummy (set ccmmul=[4m)
if not defined dummy (set /p nothing=[?25l<nul)

:exitmenu_main
rem Main Exit Menu
if "%exitmenuexit%"=="true" (set exitmenucurrent=& call :exitmenu_exit & goto :hazimemenu)
if not defined exitmenuboot (call :hazimemenudraw DarkDarkerYetDarker & set exitmenuboot=true)
rem I'm doing this because when I use ANSI ESC sequences in Virtual Studio Code, the parentheses are colored incorrectly and I don't like that
call :exitmenu_draw
if not defined dummy (
echo [3;22H O====================O 
echo [4;22H I ƒJ[ƒ\ƒ‹‘Ö‚¦‚ÌI—¹ I 
echo [5;22H O==========O====%ccmmul%===%clr2%===O===========O 
echo [6;22H I%emb1%     ^|    %clr2%I%emb2%   /   \  %clr2%I%emb3%           %clr2%I 
echo [7;22H I%emb1%   / ^| \  %clr2%I%emb2%  V    È %clr2%I%emb3%  ^-^-^-^-^-^-^>  %clr2%I 
echo [8;22H I%emb1%   \___/  %clr2%I%emb2%   \___/  %clr2%I%emb3%           %clr2%I 
echo [9;22H O==========O==========O===========O 
echo [10;22H I[10;57HI 
echo [11;22H O=================================O 
echo [12;20H%clrgra%1~3 ‚© A,D ‚ÅˆÚ“®AY,E ‚Å ‘I‘ğAB ‚Å ‘Şo%clr2%
)
choice /c 123adyeb /n >nul
rem Processing of each move
if %Errorlevel%==8 (set exitmenuexit=true& goto :exitmenu_main)
if %Errorlevel% geq 1 if %Errorlevel% leq 3 (set exitmenucurrent=%Errorlevel%)
if %exitmenucurrent%==0 (set exitmenucurrent=1& set emb1=%clred%& goto :exitmenu_main)
if %ErrorLevel%==4 (if not %exitmenucurrent%==1 (set /a exitmenucurrent-=1))
if %ErrorLevel%==5 (if not %exitmenucurrent%==3 (set /a exitmenucurrent+=1))
if %Errorlevel% geq 6 if %Errorlevel% leq 7 (call :exitmenuselect_core)
for /l %%i in (1,1,3) do (set emb%%i=)
goto :exitmenu_main

:exitmenuselect_core
rem Processing of Confirm key, like Y and E.
if "%Exitmenucurrent%"=="1c" (call :exitmenu_exit & call :PowerScreen)
if "%Exitmenucurrent%"=="2c" (call :exitmenu_exit & call :PowerScreen reboot)
if %Exitmenucurrent% geq 1 if %Exitmenucurrent% leq 2 (set exitmenucurrent=%exitmenucurrent%c& exit /b)
if "%Exitmenucurrent%"=="3" (set exitmenuexit=true& exit /b)
exit /b

:exitmenu_draw
rem Draw text messages
for /l %%i in (56,-1,24) do (set /p nothing=[10;%%iH <nul)
if "%Exitmenucurrent%"=="0" (echo [10;24H ‰½‚à‘I‘ğ‚³‚ê‚Ä‚¢‚Ü‚¹‚ñB)
if "%Exitmenucurrent%"=="1" (echo [10;24H ƒJ[ƒ\ƒ‹‘Ö‚¦‚ğI—¹‚µ‚Ü‚·B& set emb1=%clred%)
if "%Exitmenucurrent%"=="2" (echo [10;24H ƒJ[ƒ\ƒ‹‘Ö‚¦‚ğÄ‹N“®‚µ‚Ü‚·B& set emb2=%clrgrn%)
if "%Exitmenucurrent%"=="3" (echo [10;24H ƒƒCƒ“ƒƒjƒ…[‚É–ß‚è‚Ü‚·B& set emb3=%clrcyan%)
if "%Exitmenucurrent%"=="1c" (echo [10;24H –{“–‚É‚æ‚ë‚µ‚¢‚Å‚·‚©H) & if not "%wmodetoggle%"=="true" (set emb1=[48;2;156;21;32m) else (set emb1=[48;2;156;21;32m)
if "%Exitmenucurrent%"=="2c" (echo [10;24H –{“–‚É‚æ‚ë‚µ‚¢‚Å‚·‚©H) & if not "%wmodetoggle%"=="true" (set emb2=[48;2;22;119;19m) else (set emb2=[48;2;22;119;19m)
exit /b

:exitmenu_exit
rem initialize of variable
set exitmenuexit=& set exitmenuboot=& set clred=& set clrgrn=& set clrcyan=& set clrgra=& set ccmmul=
for /l %%i in (1,1,3) do (set emb%%i=)
if not defined dummy (set /p nothing=[?25h<nul)
exit /b



:PowerScreen
call :Core_Powershell 2
if not defined dummy (set /p nothing=[?25l<nul)
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ƒAƒŠ[ƒ”ƒFƒfƒ‹ƒ`
cls
if "%wmodetoggle%"=="true" (set welcomelineclr=[38;2;135;135;135m& set welcomelineclr2=[0m[107m[30m& set welcomelineclr3=[30m) else (set welcomelineclr=[38;2;120;120;120m& set welcomelineclr2=[0m& set welcomelineclr3=[39m)
if "%wmodetoggle%"=="true" (for /l %%i in (0,1,3) do (set /p nothing=[%%i;0H[48;2;230;230;230m[2K[0;0H<nul)) else (for /l %%i in (0,1,3) do (set /p nothing=[%%i;0H[48;2;20;20;20m[2K[0;0H<nul))
echo.
if not defined dummy (echo [30CƒJ[ƒ\ƒ‹‘Ö‚¦%batver%)
echo.
echo %welcomelineclr%O=========================================================================O%welcomelineclr2%
echo.
echo.
echo.
echo.
echo. 
echo.
echo.
echo.
if not defined dummy (if not "%1"=="reboot" (echo %welcomelineclr2%[13;43H[2KƒVƒƒƒbƒgƒ_ƒEƒ“’†...%welcomelineclr3%) else (if not defined dummy (echo %welcomelineclr2%[13;46H[2KÄ‹N“®’†...%welcomelineclr3%)))
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
if "%wmodetoggle%"=="true" (for /l %%i in (22,1,25) do (set /p nothing=[%%i;0H[48;2;230;230;230m[2K[22;0H<nul)) else (for /l %%i in (22,1,25) do (set /p nothing=[%%i;0H[48;2;20;20;20m[2K[22;0H<nul))
echo %welcomelineclr%O=========================================================================O%welcomelineclr3%
echo.
if not defined dummy (echo [23C2021-2024 tamago_1908 %batbuild%)
timeout /t 2 /nobreak >nul
if not "%1"=="reboot" if not defined dummy (set /p nothing=%welcomelineclr2%[13;37H[2KƒJ[ƒ\ƒ‹‘Ö‚¦‚ğI—¹‚µ‚Ä‚¢‚Ü‚·...%welcomelineclr3%<nul)
call :exitmenuexit
if not "%1"=="reboot" (call :exit 0) else (call :rebootbatch)

:exitmenuexit
set clrcyan=& set clrgra=& set clred=& set clrgrn=& set clryel=& set clrmag=
set welcomelineclr=& set welcomelineclr2=& set welcomelineclr3=& exit /b



:UpdateAvailable
rem GUI type 3
rem Preparing of Menu and Variables
if not defined dummy (set clr=[7m&set clrgra=[90m&set clryel=[93m&set clrwhi=[97m&set clr2=[0m)
if "%wmodetoggle%"=="false" (set clr=[7m&set clrgra=[90m&set clryel=[93m&set clrwhi=[97m&set clr2=[0m)
if "%wmodetoggle%"=="true" (set clr=[100m[97m&set clrgra=[107m[38;2;140;140;140m&set clryel=[93m&set clrwhi=[30m&set clr2=[90m[107m[30m)
set UAsel=0
:UpdateAvailable_main
rem Draw Update Available UI
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ƒAƒbƒvƒf[ƒg‚ª—˜—p‰Â”\‚Å‚·I
if not defined dummy (set /p nothing=[?25l%clr2%<nul)
if not defined UAboot (call :hazimemenudraw DarkDarkerYetDarker & set UAboot=true)
if "%UAexit%"=="true" (goto :UpdateAvailable_exit)
if not "%UAsel%"=="3" (set UAselPre=%UAsel%)
if not defined dummy (
echo [5;16H O=========================================O 
echo [6;16H I                                         I 
echo [7;16H I       ƒAƒbƒvƒf[ƒg‚ª—˜—p‰Â”\‚Å‚·I      I 
echo [8;16H I                                         I 
echo [9;16H I[9;35H%clryel%-----^>%clr2%[9;59HI 
echo [10;16H I           %clrgra%^(Œ»İ^)     ^(XVŒã^)%clr2%           I 
echo [11;16H I                                         I 
echo [12;16H I          ƒAƒbƒvƒf[ƒg‚µ‚Ü‚·‚©H         I 
echo [13;16H I[13;59HI 
echo [14;16H I                                         I 
echo [15;16H I    O=============O    O============O    I 
echo [16;16H I    I%UAcb1%     ‚Í‚¢    %clr2%I    I%UAcb2%   ‚¢‚¢‚¦   %clr2%I    I 
echo [17;16H I    O=============O    O============O    I 
echo [18;16H I            O================O           I 
echo [19;16H I            I%UAcb3% •ÏX—š—ğ‚ğŒ©‚é %clr2%I           I 
echo [20;17HI            O================O           I
echo [21;17HI                                         I
echo [22;17HI  %clrgra%ˆÚ“®: WASD ‚© 1~3 ‘I‘ğ: Y,E ‘Şo: B,N%clr2%  I
echo [23;17HO=========================================O
call :UpdateAvailable_VersionDraw
)
choice /c 123WASDYEBN /n >nul
rem Processing of each move
if %Errorlevel%==10 (set UAexit=true) else if %Errorlevel%==11 (set UAexit=true)
if %Errorlevel% geq 1 if %Errorlevel% leq 3 (set UAsel=%Errorlevel%)
if %UAsel%==0 (set UAsel=1& set UAcb1=%clr%& goto :UpdateAvailable_main)
if %ErrorLevel%==4 (if %UAsel%==3 (if "%UAselPre%"=="1" (set UAsel=1) else if "%UAselPre%"=="2" (set UAsel=2)))
if %ErrorLevel%==5 (if not %UAsel%==3 (set UAsel=1))
if %ErrorLevel%==6 (if not %UAsel%==3 (set UAsel=3))
if %ErrorLevel%==7 (if not %UAsel%==3 (set UAsel=2))
if %Errorlevel% geq 8 if %Errorlevel% leq 9 (call :UpdateAvailable_Core)
set UAcb1=& set UAcb2=& set UAcb3=& set UAcb%UAsel%=%clr%& goto :UpdateAvailable_main

:UpdateAvailable_Core
rem Processing of Confirm key, like Y and E.
set /p nothing=%clr2%<nul
if %UAsel%==1 (cls & echo XV’†...& call :Powersheller Doupdate)
if %UAsel%==2 (set UAexit=true& exit /b)
if %UAsel%==3 (cls & echo •ÏX—š—ğ‚ğ“Ç‚İ‚ñ‚Å‚¢‚Ü‚·...& echo. & call :Powersheller Changelog& pause & set UAboot=& mode con: cols=75 lines=25 & exit /b)

:UpdateAvailable_VersionDraw
rem Detect version
set /p nothing=%clr2%<nul
if "%batbeta%"=="True" (set /p nothing=[13;19H %clrgra%ƒx[ƒ^”Å‚È‚Ì‚Å•sˆÀ’è‚È‰Â”\«‚ª‚ ‚è‚Ü‚·%clr2%<nul)
if not defined updatemyversion (set /p nothing=[9;30H%clrwhi%Null%clr2%<nul)
if not defined updateversion (set /p nothing=[9;42H%clrwhi%Null%clr2%<nul& exit /b)
rem Calculete version length
setlocal enabledelayedexpansion
for /l %%i in (0,1,10) do (set "char=!updatemyversion:~%%i,1!" & if not "!char!"=="" (set /a length+=1))
setlocal disabledelayedexpansion
rem Show version text
set /a showlen=34-length
if not defined dummy (set /p nothing=[9;%showlen%H%clrwhi%%updatemyversion%%clr2%<nul)
if not defined dummy (set /p nothing=[9;42H%clrwhi%%updateversion%%clr2%<nul)
set length=& set showlen=
exit /b

:UpdateAvailable_exit
rem initialize of variable
set UAexit=& set UAboot=& set UAsel=& set UAPre=& set UAcb1=& set UAcb2=& set UAcb3=& set clrgra=& set clryel=
set batbeta=& set updateavailable=& set updatemyversion=& set updateversion=
set checkupdatetoggle=false
if not defined dummy (set /p nothing=[?25h<nul)
exit /b




rem Depiction of the settings menu
:setting
cls
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| İ’è
cd /d %batchmainpath%
if not exist %Settingsfile% (goto :dogcheck)
rem ccg=current category, csl=current select
if not defined dummy (set clr=[7m&set clrgra=[90m&set clr2=[0m)
if "%wmodetoggle%"=="false" (set clr=[7m&set clrgra=[90m&set clr2=[0m)
if "%wmodetoggle%"=="true" (set clr=[100m[97m&set clrgra=[90m&set clr2=[0m[107m[30m)
set STG_CCG=0& set STG_CCG_Temp=1 & rem < Temp‚Ì’l‚Í‰Šú‚É‚ÍŒ³‚Ì’l‚ÆˆÙ‚È‚Á‚Ä‚¢‚È‚¢‚Æ‚¢‚¯‚È‚¢B‚»‚¤‚¶‚á‚È‚¢‚ÆƒoƒO‚éB
set STG_CSL=0& set STG_CSL_Temp=1
set STG_Section=1
set Settingexit=false
set settinghelptoggle=false
setlocal enabledelayedexpansion

:Setting_Main
rem GUI type 4 (SUPER FAST!!! WOAH!!! YIPPEE!!! :D)
rem But it's a spaghetti code :(
if not defined dummy (set /p nothing=[0;0H[2K<nul)
for /l %%i in (1,1,512) do if "!Settingexit!" neq "true" (
if not "%SettingDebug%"=="true" (title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| İ’è) else (title EL: !errorlevel! CCG: !STG_CCG! CSL: !STG_CSL! SCT: !STG_Section! LoopCT: %%i ^| CCG_Temp: !STG_CCG_Temp! CSL_Temp: !STG_CSL_Temp!)
rem Main Screen draw
if "!STG_CSL!"=="true" (call :Setting_Main_Drawer redraw) else (call :Setting_Main_Drawer)
if !STG_CCG! neq !STG_CCG_Temp! (call :Setting_Main_CUI) else (set /p nothing=[22;0H<nul)
rem Ask
choice /c 12345WASDBYE /n >nul
call :Setting_Main_Core !Errorlevel!
)
if "!Settingexit!" neq "true" (set /p nothing=[0;0HLag spike :3<nul& goto :Setting_Main) else (setlocal disabledelayedexpansion & call :Setting_Exit & goto :Hazimemenu)

:Setting_Main_CUI
if not defined "%clrgrabg%" (if "%wmodetoggle%"=="true" (set clrgrabg=[48;2;215;215;215m) else (set clrgrabg=[48;2;40;40;40m))
if not defined dummy (set /p nothing=[?25l[0;0H<nul& set SCB_1=& set SCB_2=& set SCB_3=& set SCB_%STG_CCG%=%clr%)
if not defined dummy (
echo.
Echo                                 İ’èƒƒjƒ…[
echo.
echo O========================O                  O======O
echo I      ƒJƒeƒSƒŠ[        I                  I İ’è I
echo O========================O==================O======O======================O
echo I%SCB_1%                        %clr2%I [48CI
echo I%SCB_1%  ƒJ[ƒ\ƒ‹‘Ö‚¦  ‹@”\Œn  %clr2%I [48CI
echo I%SCB_1%                        %clr2%I [48CI
echo I========================I [48CI
echo I%clrgrabg%                        %clr2%I [48CI
echo I========================I [48CI
Echo I%SCB_2%                        %clr2%I [48CI
echo I%SCB_2% ƒJ[ƒ\ƒ‹‘Ö‚¦  Œ©‚½–ÚŒn %clr2%I [48CI
echo I%SCB_2%                        %clr2%I [48CI
echo O========================O==O=====================O==========O============O
echo I%SCB_Help%      ƒwƒ‹ƒvƒ‚[ƒh      %clr2%I  I ˆÚ“® : W A S D ”š I –ß‚é : B I Œˆ’è : Y E I
echo O========================O  O=====================O==========O============O
echo [2B[12C %clrgra%‘I‘ğ‚µ‚½‚¢İ’è‚ğwasd‚©”šƒL[‚Å‘I‘ğ‚µ‚Ä‚­‚¾‚³‚¢...%clr2%
)
exit /b


:Setting_Main_Core
set STG_CSL_Temp=%STG_CSL%& set STG_CCG_Temp=%STG_CCG%
if "%STG_CSL_Temp%"=="true" (set STG_CSL_Temp=1)
rem initial value move, 1~3 = move, else set Category to 1
if "%STG_CSL%"=="0" (
    if "%1"=="10" (set Settingexit=true& exit /b)
    if "%STG_CCG%"=="0" (if %1 geq 1 if %1 leq 3 (set STG_CCG=%1) else (set STG_CCG=1) & set STG_CSL=0& exit /b)
) else (if "%1"=="10" (if "%STG_CSL%"=="true" (set STG_CSL=0& exit /b) else if not "%STG_Section%"=="2" (if %STG_CSL% geq 1 if %STG_CSL% leq 5 (set STG_CSL=true& exit /b)) else (set STG_Section=1& set STG_CSL=1& call :Setting_Main_Drawer redraw & exit /b))) & rem < return to previous point

rem Process 1~3, WS categoly movements
if "%STG_CCG%"=="1" (set MaxSTG=5) else if "%STG_CCG%"=="2" if "%STG_Section%"=="1" (set MaxSTG=3) else (set MaxSTG=4) & rem < Max setting buttons
if not "%STG_CSL%"=="0" ( if %1 leq %MaxSTG% (set STG_CSL=%1) & rem < number current move
    if "%STG_CSL%"=="true" if not %1 geq 10 if %1 leq 11 (set STG_CSL=0& if %1==6 (if not %STG_CCG%==1 (set /a STG_CCG-=1)) else if %1==8 (if not %STG_CCG%==3 (set /a STG_CCG+=1)) else (if %1 geq 1 if %1 leq 3 (set STG_CCG=%1))) & rem < Move while viewing inside of category
    if not %STG_CCG%==3 (
        if not "%STG_CSL%"=="true" (
            if %1==6 (if not %STG_CSL%==1 set /a STG_CSL-=1) else if %1==8 (if not %STG_CSL%==%MaxSTG% set /a STG_CSL+=1)) & rem < W,S Inside category move
            if %1==9 (if "%STG_CSL%"=="true" (set STG_CSL=1) else if "%STG_Section%"=="1" if "%STG_CCG%"=="2" (if %STG_CSL% equ 1 set STG_Section=2& call :Setting_Main_Drawer redraw & exit /b)) else (if %1==7 (if not "%STG_Section%"=="2" (set STG_CSL=true) else (set STG_Section=1& set STG_CSL=1& call :Setting_Main_Drawer redraw & exit /b)))) & rem < 9=A, =return, 7=D, =get inside of category
    ) else ( if %1 leq 3 (set STG_CCG=%1) else ( rem < number category move
        if %1==6 (if not %STG_CCG%==1 (set /a STG_CCG-=1)) else if %1==8 (if not %STG_CCG%==3 (set /a STG_CCG+=1)) & rem < W,S category move
        if not %STG_CCG%==3 (if %1==9 (set STG_CSL=true)) & rem < D=show inside of category
    ) 
)

rem Y,E process
if %1 geq 11 if %1 leq 12 (
    if not "%STG_CSL%"=="true" (if %STG_CSL% geq 1 if %STG_CSL% leq 5 (if "%STG_CCG%"=="2" (if %STG_CSL% equ 1 (set /p nothing=[?25l<nul)) else (set /p nothing=[?25h<nul)
        if "%STG_CCG%"=="1" (if not "%STG_CSL%"=="5" (call :SettingApplyer %STG_CSL%) else (setlocal disabledelayedexpansion & call :Uninstall & setlocal enabledelayedexpansion))
        if "%STG_CCG%"=="2" (if not "%STG_Section%"=="2" (if "%STG_CSL%"=="1" (set STG_Section=2& call :Setting_Main_Drawer redraw & exit /b) else if "%STG_CSL%"=="2" (call :SettingApplyer 6) else if "%STG_CSL%"=="3" (call :SettingApplyer wmode)) else (
            if "%STG_CSL%"=="1" (call :SettingApplyer 5) else if "%STG_CSL%"=="2" (if not "%simpleboot%"=="true" if not "%rawboot%"=="true" if not "%setting5onoff%"=="false" call :SettingApplyer 5_1) else if "%STG_CSL%"=="3" (if not "%linuxboot%"=="true" if not "%rawboot%"=="true" call :SettingApplyer 5_2) else if "%STG_CSL%"=="4" (if not "%simpleboot%"=="true" if not "%linuxboot%"=="true" if not "%setting5onoff%"=="false" call :SettingApplyer 5_3) & rem < Process select (with settings block)
        ))
        cls & call :Setting_Main_CUI & call :Setting_Main_Drawer redraw & exit /b & rem < Redraw entire screen
    )) else (set STG_CSL=1) & rem < Y,E=get inside of category
    if not "%STG_CSL%"=="true" (
        if %STG_CCG% geq 1 if %STG_CCG% leq 2 (set STG_CSL=true) & rem < Category Select
        if "%STG_CCG%"=="3" (if not "%settinghelptoggle%"=="true" (set settinghelptoggle=true) else (set settinghelptoggle=false)) & rem < Help mode select
    )
)
exit /b

:Setting_Main_Drawer
if "%1"=="redraw" (set ForTemp=1,1,5) else (if %STG_CSL% leq %STG_CSL_Temp% (set ForTemp=%STG_CSL_Temp%,-1,%STG_CSL%) else if %STG_CSL% geq %STG_CSL_Temp% (set ForTemp=%STG_CSL_Temp%,1,%STG_CSL%)) & rem < Skip drawing unupdated button
if "%STG_CCG%"=="1" (set ForTemp_button=14) else if "%STG_CCG%"=="2" (if "%STG_Section%"=="2" (set ForTemp_button=14) else (set ForTemp_button=10))
if "%STG_CSL%"=="0" (for /l %%i in (15,-1,7) do (set /p nothing=[%%i;27H                                                <nul)) else if "%STG_CSL%"=="true" (for /l %%i in (15,-1,7) do (set /p nothing=[%%i;27H                                                <nul)) else if "%1"=="redraw" (for /l %%i in (15,-1,7) do (set /p nothing=[%%i;27H                                                <nul)) & rem < Clear texts
for /l %%i in (1,1,5) do (set STG_B%%i=) & if %STG_CSL% geq 1 if %STG_CSL% leq 5 (set STG_B%STG_CSL%=%clr%) & rem < Update Button highlight
if "%STG_CSL%"=="0" ( rem < Draw description
    if "%STG_CCG%"=="0" (set /p nothing=[8;28H ƒJƒeƒSƒŠ[‚ª‘I‘ğ‚³‚ê‚Ä‚¢‚Ü‚¹‚ñB[9;28H ƒJƒeƒSƒŠ[‚ğ‘I‘ğ‚µ‚Ä‚­‚¾‚³‚¢B[14;28H %clrgra%[W,S] ‚© [1~3] ‚ÅƒJƒeƒSƒŠ[‚ğ‘I‘ğ...%clr2%<nul)
    if "%STG_CCG%"=="1" (set /p nothing=[8;28H ƒJ[ƒ\ƒ‹‘Ö‚¦‚Ì‹@”\‚ÉŠÖ‚·‚éİ’è‚Å‚·B<nul)
    if "%STG_CCG%"=="2" (set /p nothing=[8;28H ƒJ[ƒ\ƒ‹‘Ö‚¦‚ÌŒ©‚½–Ú‚ÉŠÖ‚·‚éİ’è‚Å‚·B[9;28H %clrgra%^(ƒe[ƒ}“™^)%clr2%<nul)
    if "%STG_CCG%"=="3" (set /p nothing=[8;28H ƒwƒ‹ƒvƒ‚[ƒh‚Å‚·B‚±‚Ì‹@”\‚ğ‘I‘ğ‚µ‚½ŒãA[9;28H ŠT—v‚ğŒ©‚½‚¢İ’è‚ğ‘I‘ğ‚·‚é‚ÆA[10;28H ‚»‚Ìİ’è‚ÌŠT—v‚ğŒ©‚é‚±‚Æ‚ª‚Å‚«‚Ü‚·B[12;28H ƒwƒ‹ƒvƒ‚[ƒh‚ğ–³Œø‚É‚µ‚½‚¢ê‡‚ÍA[13;28H Ä“x‚±‚Ì‹@”\‚ğ‘I‘ğ‚µ‚Ä‚­‚¾‚³‚¢B[15;28H %clrgra%ƒwƒ‹ƒvƒ‚[ƒh‚Í%settinghelptoggle%‚Å‚·%clr2%<nul
    if "%settinghelptoggle%"=="true" (set SCB_Help=[46m& set /p nothing=[17;0HI[46m      ƒwƒ‹ƒvƒ‚[ƒh      %clr2%I<nul) else (set SCB_Help=%clr%& set /p nothing=[17;0HI%clr%      ƒwƒ‹ƒvƒ‚[ƒh      %clr2%I<nul& set SCB_3=) & rem < Help mode toggle
    ) else (if "%settinghelptoggle%"=="true" (set SCB_Help=%clr%) else (set SCB_Help=))
) else (if "%1"=="redraw" (for /l %%i in (8,2,%ForTemp_button%) do (set /p nothing=[%%i;64HO==========<nul))
    if "%STG_CCG%"=="1" ( rem < Draw Category 1 buttons
        for /l %%i in (%ForTemp%) do (
            if "%%i"=="1" (set /p nothing=[7;27H 1 %STG_B1%‹N“®‚ÉƒJ[ƒ\ƒ‹‘Ö‚¦‚Å‹N“®%clr2%<nul
            ) else (if "%%i"=="2" (set /p nothing=[9;27H 2 %STG_B2%‹N“®‚ÌƒAƒhƒ~ƒ“%clr2%<nul
            ) else (if "%%i"=="3" (set /p nothing=[11;27H 3 %STG_B3%‹N“®‚ÉXVŠm”F%clr2%<nul
            ) else (if "%%i"=="4" (set /p nothing=[13;27H 4 %STG_B4%‰¹Šy‚ÌÄ¶‚ğ‹–‰Â%clr2%<nul
            ) else (if "%%i"=="5" (set /p nothing=[15;27H 5 %STG_B5%‰Šú‰»‚Ü‚½‚ÍƒAƒ“ƒCƒ“ƒXƒg[ƒ‹%clr2%<nul)
            set /p nothing=[7;64HI  %setting1onoff%<nul& set /p nothing=[9;64HI  %setting2onoff%<nul& set /p nothing=[11;64HI  %setting3onoff%<nul& set /p nothing=[13;64HI  %setting4onoff%<nul
        )))))
    ) else if "%STG_CCG%"=="2" ( rem < Draw Category 2 buttons
    if not "%STG_Section%"=="2" (
        set /p nothing=[4;56H[0K[5;56H[0K<nul
        for /l %%i in (%ForTemp%) do (
            if "%%i"=="1" (set /p nothing=[7;27H 1 %STG_B1%‹N“®‚ÌƒAƒjƒ[ƒVƒ‡ƒ“‚Ìİ’è%clr2%<nul
            ) else (if "%%i"=="2" (set /p nothing=[9;27H 2 %STG_B2%ƒƒCƒ“ƒƒjƒ…[‚É”wŒi‚ğ•\¦%clr2%<nul
            ) else (if "%%i"=="3" (set /p nothing=[11;27H 3 %STG_B3%%wmodeonoff%%clr2%<nul)
            set /p nothing=[7;64HI    ^>   <nul& set /p nothing=[9;64HI  %setting6onoff%<nul
        ))))
    if "%STG_Section%"=="2" (
        set /p nothing=[4;56HO==================O[5;56HI İ’è5/...        I<nul
        for /l %%i in (%ForTemp%) do (
            call :Setting_Main_STGSection_2_Grayout
            if "%%i"=="1" (set /p nothing=[7;27H !STG_B1_gray!1 !STG_B1!‹N“®ƒAƒjƒ[ƒVƒ‡ƒ“%clr2%<nul
            ) else (if "%%i"=="2" (set /p nothing=[9;27H !STG_B2_gray!2 !STG_B2!ƒŠƒiƒbƒNƒX•—‹N“®ƒAƒjƒ[ƒVƒ‡ƒ“%clr2%<nul
            ) else (if "%%i"=="3" (set /p nothing=[11;27H !STG_B3_gray!3 !STG_B3!ƒVƒ“ƒvƒ‹‚È‹N“®ƒAƒjƒ[ƒVƒ‡ƒ“%clr2%<nul
            ) else (if "%%i"=="4" (set /p nothing=[13;27H !STG_B4_gray!4 !STG_B4!¶‚Ì‹N“®ƒAƒjƒ[ƒVƒ‡ƒ“%clr2%<nul)
            set /p nothing=[7;64HI  %setting5onoff%<nul& set /p nothing=[9;64HI  %setting5_s1onoff%<nul& set /p nothing=[11;64HI  %setting5_s2onoff%<nul& set /p nothing=[13;64HI  %setting5_s3onoff%<nul
        )))) & for /l %%a in (1,1,4) do (set STG_B%%a_gray=))
    )
)
set ForTemp=& set ForTemp_button=& exit /b


:Setting_Main_STGSection_2_Grayout
rem Gray out settings to match setting5 related setting values
for /l %%a in (1,1,4) do (set STG_B%%a_gray=)
if "%linuxboot%"=="true" (
    if "%wmodetoggle%"=="true" (
    set STG_B3_gray=[107m[38;2;140;140;140m& set STG_B4_gray=[107m[38;2;140;140;140m
    ) else (set STG_B3_gray=[0m[90m& set STG_B4_gray=[0m[90m)
    exit /b
)
if "%simpleboot%"=="true" (
    if "%wmodetoggle%"=="true" (
    set STG_B2_gray=[107m[38;2;140;140;140m& set STG_B4_gray=[107m[38;2;140;140;140m
    ) else (set STG_B2_gray=[0m[90m& set STG_B4_gray=[0m[90m)
    exit /b
) 
if "%rawboot%"=="true" (
    if "%wmodetoggle%"=="true" (
    set STG_B2_gray=[107m[38;2;140;140;140m& set STG_B3_gray=[107m[38;2;140;140;140m
    ) else (set STG_B2_gray=[0m[90m& set STG_B3_gray=[0m[90m)
    exit /b
)
if "%setting5onoff%"=="–³Œø" (
    if "%wmodetoggle%"=="true" (
    set STG_B2_gray=[107m[38;2;140;140;140m& set STG_B4_gray=[107m[38;2;140;140;140m
    ) else (set STG_B2_gray=[0m[90m& set STG_B4_gray=[0m[90m)
    exit /b
)
exit /b


:Setting_Exit
rem delete variables
set STG_CCG=& set STG_CSL=& set STG_CCG_Temp=& set STG_CSL_Temp=& set MaxSTG=& set Settingexit=& set SCB_Help=& set settinghelptoggle=
for /l %%i in (1,1,3) do (set SCB_%%i=)
exit /b



:Settingapplyer
rem Setting applyer
rem Setting lists 
if not "%1"=="" (set "SGApplyer_SettingNum=%1") else (echo SettingApplyer : ˆø”‚ğw’è‚µ‚Ä‚­‚¾‚³‚¢I& pause & exit /b 1)
if "%SGApplyer_SettingNum%"=="1" (set "SGApplyer_Applytext=‹N“®‚ÉƒJ[ƒ\ƒ‹‘Ö‚¦‚Å‹N“®" & set "SGApplyer_Settingname=BootAsCC")
if "%SGApplyer_SettingNum%"=="2" (set "SGApplyer_Applytext=‹N“®‚ÉŠÇ—ÒŒ ŒÀ‚ğ—v‹" & set "SGApplyer_Settingname=admin")
if "%SGApplyer_SettingNum%"=="3" (set "SGApplyer_Applytext=‹N“®‚ÉXVŠm”F" & set "SGApplyer_Settingname=CheckUpdate")
if "%SGApplyer_SettingNum%"=="4" (set "SGApplyer_Applytext=‰¹Šy‚ÌÄ¶‚ğ‹–‰Â" & set "SGApplyer_Settingname=PlaySound")
if "%SGApplyer_SettingNum%"=="5" (set "SGApplyer_Applytext=‹N“®ƒAƒjƒ[ƒVƒ‡ƒ“" & set "SGApplyer_Settingname=bootanimation")
if "%SGApplyer_SettingNum%"=="5_1" (set "SGApplyer_Applytext=ƒŠƒiƒbƒNƒX•—‹N“®ƒAƒjƒ[ƒVƒ‡ƒ“" & set "SGApplyer_Settingname=s5_linuxboot")
if "%SGApplyer_SettingNum%"=="5_2" (set "SGApplyer_Applytext=ƒVƒ“ƒvƒ‹‹N“®ƒAƒjƒ[ƒVƒ‡ƒ“" & set "SGApplyer_Settingname=s5_simpleboot")
if "%SGApplyer_SettingNum%"=="5_3" (set "SGApplyer_Applytext=¶‹N“®ƒAƒjƒ[ƒVƒ‡ƒ“" & set "SGApplyer_Settingname=s5_rawboot")
if "%SGApplyer_SettingNum%"=="6" (set "SGApplyer_Applytext=ƒƒCƒ“ƒƒjƒ…[‚É”wŒi‚ğ•\¦" & set "SGApplyer_Settingname=HazimeBg")
if "%SGApplyer_SettingNum%"=="wmode" (set "SGApplyer_Applytext=‚±‚ÌƒƒbƒZ[ƒW‚ªŒ©‚ê‚é‚Ì‚Í‚¨‚©‚µ‚¢‚æ" & set "SGApplyer_Settingname=wmode")
goto :SettingApplyer_Main


:SettingApplyer_Main
rem Detect settings and decide toggle text (like "enable" and "disable")
if "%SGApplyer_Settingname%"=="" (echo SettingApplyer : ˆø” "%SGApplyer_SettingNum%" ‚Í–¢’è‹`‚Ìİ’è‚Ü‚½‚Íˆø”‚Å‚·I& pause & exit /b 1)
if "%settinghelptoggle%"=="true" (if not "%SGApplyer_SettingNum%"=="wmode" (goto :setting%1help) else if "%SGApplyer_SettingNum%"=="wmode" (goto :wmodehelp))
find "%SGApplyer_Settingname%=false" %Settingsfile% > nul
if not "%SGApplyer_SettingNum%"=="wmode" (
    if %ErrorLevel%==0 set "SGApplyer_ToggleText=—LŒø" & goto :SettingApplyer_Ask
    if %ErrorLevel%==1 set "SGApplyer_ToggleText=C•œ‚µA³í‚Èó‘Ô" & goto :SettingApplyer_DetectTrue
) else (
    if %ErrorLevel%==0 set "SGApplyer_ToggleText=ƒzƒƒCƒgƒe[ƒ}" & goto :SettingApplyer_Ask
    if %ErrorLevel%==1 set "SGApplyer_ToggleText=ƒfƒtƒHƒ‹ƒg‚Ìƒe[ƒ}" & goto :SettingApplyer_DetectTrue
)
:SettingApplyer_DetectTrue
find "%SGApplyer_Settingname%=true" %Settingsfile% > nul
if not "%SGApplyer_SettingNum%"=="wmode" (
if %ErrorLevel%==0 set "SGApplyer_ToggleText=–³Œø"
) else (if %ErrorLevel%==0 set "SGApplyer_ToggleText=ƒ_[ƒNƒe[ƒ}" & goto :SettingApplyer_Ask)


:SettingApplyer_Ask
rem ask enbale / disable setting or not
cls
set selected=
if not "%SGApplyer_SettingNum%"=="wmode" (echo %SGApplyer_Applytext%‚ğ%SGApplyer_ToggleText%‚É‚µ‚Ü‚·‚©H
) else (echo ƒJ[ƒ\ƒ‹‘Ö‚¦‚Ìƒe[ƒ}‚ğ%SGApplyer_ToggleText%‚É‚µ‚Ü‚·‚©?)
echo ^(Y=Yes N=No B=–ß‚é^)
SET /P selected= :
echo %selected% ‚ª‘I‘ğ‚³‚ê‚Ü‚µ‚½B
if "%selected%"=="yes" (goto :SettingApplyer_Apply)
if "%selected%"=="y" (goto :SettingApplyer_Apply)
if "%selected%"=="no" (goto :SettingApplyer_Sad)
if "%selected%"=="n" (goto :SettingApplyer_Sad)
if "%selected%"=="back" (goto :SettingApplyer_Sad)
if "%selected%"=="b" (goto :SettingApplyer_Sad)
goto :SettingApplyer_Ask


:SettingApplyer_Apply
rem main applyer
echo.& echo İ’è‚ğ“K—p’†...
find "%SGApplyer_Settingname%=false" %Settingsfile% > nul
if %ErrorLevel%==1 goto :SettingApplyer_Apply_DetectTrue
if %ErrorLevel%==0 goto :SettingApplyer_Apply_FalseToTrue

:SettingApplyer_Apply_DetectTrue
rem detect true or false
find "%SGApplyer_Settingname%=true" %Settingsfile% > nul
if %ErrorLevel%==1 (
    rem default setting value list
    if "%SGApplyer_Settingname%"=="BootAsCC" (echo BootAsCC=false >> %Settingsfile%)
    if "%SGApplyer_Settingname%"=="admin" (echo admin=false >> %Settingsfile%)
    if "%SGApplyer_Settingname%"=="CheckUpdate" (echo CheckUpdate=false >> %Settingsfile%)
    if "%SGApplyer_Settingname%"=="PlaySound" (echo PlaySound=true >> %Settingsfile%)
    if "%SGApplyer_Settingname%"=="bootanimation" (echo bootanimation=true >> %Settingsfile%)
    if "%SGApplyer_Settingname%"=="s5_linuxboot" (echo s5_linuxboot=false >> %Settingsfile%)
    if "%SGApplyer_Settingname%"=="s5_simpleboot" (echo s5_simpleboot=false >> %Settingsfile%)
    if "%SGApplyer_Settingname%"=="s5_rawboot" (echo s5_rawboot=false >> %Settingsfile%)
    if "%SGApplyer_Settingname%"=="HazimeBg" (echo HazimeBg=true >> %Settingsfile%)
    if "%SGApplyer_Settingname%"=="wmode" (echo wmode=false >> %Settingsfile%)
    goto :SettingApplyer_Apply_Complete
)
if %ErrorLevel%==0 goto :SettingApplyer_Apply_TrueToFalse

:SettingApplyer_Apply_TrueToFalse
rem change the setting true to false
powershell "(gc %Settingsfile%) -replace '%SGApplyer_Settingname%=true','%SGApplyer_Settingname%=false' | sc %Settingsfile%"
if "%SGApplyer_Settingname%"=="s5_linuxboot" (set linuxboot=false) & if "%SGApplyer_Settingname%"=="s5_simpleboot" (set simpleboot=false) & if "%SGApplyer_Settingname%"=="s5_rawboot" (set rawboot=false)
if "%SGApplyer_Settingname%"=="wmode" (set wmodetoggle=false)
goto :SettingApplyer_Apply_Complete

:SettingApplyer_Apply_FalseToTrue
rem change the setting to false to true
powershell "(gc %Settingsfile%) -replace '%SGApplyer_Settingname%=false','%SGApplyer_Settingname%=true' | sc %Settingsfile%"
if "%SGApplyer_Settingname%"=="s5_linuxboot" (set linuxboot=true) & if "%SGApplyer_Settingname%"=="s5_simpleboot" (set simpleboot=false) & if "%SGApplyer_Settingname%"=="s5_rawboot" (set rawboot=false)
if "%SGApplyer_Settingname%"=="wmode" (set wmodetoggle=true)
goto :SettingApplyer_Apply_Complete


:SettingApplyer_Apply_Complete
call :SettingApplyer_Theme_Apply
rem Yaaay it changed
cls
Echo ³í‚É“K—p‚³‚ê‚Ü‚µ‚½B
Pause
if "%SGApplyer_SettingNum%"=="wmode" (set "wantload=wmode") else (set "wantload=setting%SGApplyer_SettingNum%")
call :SAB_Manager
call :SettingApplyer_Exit
exit /b 0

:SettingApplyer_Sad
rem nooo you didn't change the setting :(
cls
echo İ’è‚Í•ÏX‚³‚ê‚Ü‚¹‚ñ‚Å‚µ‚½B
timeout /t 1 /nobreak >nul
call :SettingApplyer_Exit
exit /b 1


:SettingApplyer_Theme_Apply
rem theme and boot animation color set
if "%linuxboot%"=="true" (
if "%wmodetoggle%"=="true" (set linuxishclr2=[107m[30m) else (set linuxishclr2=[0m)
set linuxishclred=[91m& set linuxishclr=[92m
) else (set linuxishclred=& set linuxishclr=& set linuxishclr2=)
if "%wmodetoggle%"=="false" (set clr=[7m&set clr2=[0m& color 07)
if "%wmodetoggle%"=="true" (set clr=[100m[97m&set clr2=[0m[107m[30m& color f0) else (color 07)
exit /b

:SettingApplyer_Exit
rem delete the variables
set SGApplyer_SettingNum=& set SGApplyer_Settingname=& set SGApplyer_ToggleText=
exit /b



rem İ’è‚Ìƒwƒ‹ƒv
:setting1help
cls
echo ‚±‚Ìİ’è‚ÍA‹N“®Œã‚ÉƒJ[ƒ\ƒ‹‘Ö‚¦ (ƒƒCƒ“ƒƒjƒ…[‚Å1‚Ì€–Ú‚É‚ ‚é‹@”\) ‚É‘JˆÚ‚·‚é‚©‚ğØ‚è‘Ö‚¦‚Ü‚·B
echo ‚±‚ê‚ğ—LŒø‚É‚·‚é‚ÆA‹N“®’¼Œã‚ÉƒƒCƒ“ƒƒjƒ…[‚É‘JˆÚ‚·‚é‘ã‚í‚è‚ÉƒJ[ƒ\ƒ‹‘Ö‚¦‚É‘JˆÚ‚·‚é‚Ì‚ÅA‘f‘‚­ƒJ[ƒ\ƒ‹‚ğ•ÏX‚Å‚«‚Ü‚·B
echo ‚±‚Ìİ’è‚ÍƒfƒtƒHƒ‹ƒg‚Å‚Í–³Œø‚Å‚·B
pause
exit /b

:setting2help
cls
echo ‚±‚Ìİ’è‚ÍAŠÇ—ÒŒ ŒÀ‚ÅƒJ[ƒ\ƒ‹‘Ö‚¦‚ğÀs‚·‚é‚±‚Æ‚É‚æ‚Á‚ÄAƒJ[ƒ\ƒ‹‚ğ•ÏX‚·‚éÛ‚ÉƒGƒ‰[‚ª‹N‚«‚È‚¢‚æ‚¤‚É‚·‚é‚½‚ß‚É‚ ‚è‚Ü‚·B
echo ‚à‚µ‰¼‚ÉAƒJ[ƒ\ƒ‹‚ğ•ÏX‚·‚éÛ‚ÉƒGƒ‰[‚à‚µ‚­‚Í•ÏX‚Å‚«‚È‚©‚Á‚½ê‡‚Ì‚İ‚É‚±‚Ìİ’è‚ğ—LŒø‚É‚·‚é‚±‚Æ‚ğ„§‚µ‚Ü‚·B
echo ‚±‚Ìİ’è‚ğ—LŒø‚É‚·‚é‚±‚Æ‚É‚æ‚Á‚Ä‹N“®ŠÔ‚ª’Zk‚³‚ê‚éê‡‚ª‚ ‚è‚Ü‚·B
echo ‚±‚Ìİ’è‚ÍƒfƒtƒHƒ‹ƒg‚Å‚Í–³Œø‚Å‚·B
pause
exit /b

:setting3help
cls
echo ‚±‚Ì‹@”\‚ÍƒJ[ƒ\ƒ‹‘Ö‚¦‚Ì‹N“®‚ÉXV‚ğŠm”F‚·‚é‚©”Û‚©‚Ìİ’è‚Å‚·B
echo ‚±‚Ì‹@”\‚ğ—LŒø‚É‚·‚é‚ÆA–ˆ‹N“®‚ÉƒAƒbƒvƒf[ƒg‚ÌŠm”F‚ªs‚í‚ê‚Ü‚·B
echo ƒAƒbƒvƒf[ƒg‚ª—˜—p‰Â”\‚È‚ç“K—p‚·‚é‚±‚Æ‚ª‚Å‚«‚Ü‚·B
echo ‚¨g‚¢‚ÌƒCƒ“ƒ^[ƒlƒbƒg‚âŠÂ‹«‚Ì‘¬“x‚É‚æ‚Á‚Ä‚Í‹N“®ŠÔ‚ª’x‚­‚È‚é‰Â”\«‚ª‚ ‚è‚Ü‚·B
echo ˆêŠÔ‚É‚¾‚¢‚½‚¢50‰ñˆÈã˜A‘±‚µ‚Ä‹N“®‚·‚é‚ÆAgithub‚ÌAPIƒŒ[ƒg§ŒÀ‚É“’B‚·‚é‰Â”\«‚ª‚ ‚è‚Ü‚·B(‘‡“I‚É3~4‰ñ‚Ù‚ÇAPI‚ğ—˜—p‚·‚é‚½‚ßA‚•‰‰×)
echo ‚±‚Ìİ’è‚ÍƒfƒtƒHƒ‹ƒg‚Å‚Í–³Œø‚Å‚·B
pause
exit /b

:setting4help
cls
echo ‚±‚Ìİ’è‚ÍƒJ[ƒ\ƒ‹‘Ö‚¦‚ÉƒTƒEƒ“ƒh‚ğÄ¶‚³‚¹‚é‚©‚ğ‹–‰Â‚·‚é‚©‚Ìİ’è‚Å‚·B
echo ‚±‚Ìİ’è‚ª—LŒø‚¾‚ÆA—á‚¦‚Î‹N“®“™‚Å‰¹‚ªÄ”w‚³‚ê‚é‚æ‚¤‚É‚È‚è‚Ü‚·B
echo ‚»‚ÌÛ‚ÉÄ¶‚³‚ê‚é‰¹‚ÍƒJ[ƒ\ƒ‹‘Ö‚¦‚ª‹N“®‚µ‚½Powershell‚ªƒoƒbƒOƒOƒ‰ƒEƒ“ƒh‚©‚çÄ¶‚µ‚Ä‚¢‚é•¨‚Å‚·B
echo ‚±‚Ìİ’è‚ÍƒfƒtƒHƒ‹ƒg‚Å‚Í—LŒø‚Å‚·B
pause
exit /b

:setting5help
cls
echo ‚±‚Ìİ’è‚ÍA‹N“®‚É•K‚¸–ˆ‰ñ—¬‚ê‚éƒu[ƒgƒAƒjƒ[ƒVƒ‡ƒ“A‚¢‚í‚Î‹N“®‰æ–Ê‚ğ–³Œø‚É‚µ”ñ•\¦‚É‚·‚éİ’è‚Å‚·B
echo ‚±‚Ìİ’è‚ğ–³Œø‚É‚·‚é‚±‚Æ‚É‚æ‚Á‚ÄA‹N“®ŠÔ‚Ì’Zk‚â‚¤‚Á‚Æ‚¤‚µ‚³‚ÌŒyŒ¸‚É‚Â‚È‚ª‚è‚Ü‚·B
echo ‚±‚Ìİ’è‚ÍƒfƒtƒHƒ‹ƒg‚Å‚Í—LŒø‚Å‚·B
pause
exit /b

:setting5_1help
cls
echo ‚±‚Ìİ’è‚ÍƒŠƒiƒbƒNƒX•—‚Ì‹N“®ƒAƒjƒ[ƒVƒ‡ƒ“‚ğÄ¶‚·‚é‚æ‚¤‚É‚·‚éİ’è‚Å‚·B
echo ‹N“®’†‚È‚Ì‚ª‚í‚©‚è‚â‚·‚­AŒ©‚½–Ú‚ª—Ç‚¢‚Å‚·B‚Ü‚½A‹N“®’†‚ÉƒGƒ‰[‚ª”­¶‚µ‚½Û‚ÉAƒGƒ‰[‚ª”­¶‚µ‚½ŒÂŠ‚ª‚í‚©‚è‚â‚·‚­‚È‚é‚±‚Æ‚ª‚ ‚è‚Ü‚·B
echo ‚±‚Ìİ’è‚Ísimpleboot‚¨‚æ‚Ñrawboot‚Æ•¹—p‚Å‚«‚Ü‚¹‚ñB
echo ‚±‚Ìİ’è‚Í•W€‚Å‚Ífalse‚Å‚·B
pause
exit /b

:setting5_2help
cls
echo ‚±‚Ìİ’è‚Í‹N“®‚É"‹N“®’†..."‚Æ‚¢‚¤ƒeƒLƒXƒg‚Ì‚İ‚Å‹N“®‚³‚¹‚é‚æ‚¤‚É‚·‚éİ’è‚Å‚·B
echo ‚‘¬‚©‚Â•ª‚©‚è‚â‚·‚­AƒVƒ“ƒvƒ‹‚Å‚·B‚½‚¾‚µ‚Â‚Ü‚ç‚È‚­Œ©‚¦‚é‰Â”\«‚ª‚ ‚èƒ}ƒXB
echo ‚±‚Ìİ’è‚Ílinuxboot‚¨‚æ‚Ñrawboot‚Æ•¹—p‚Å‚«‚Ü‚¹‚ñB
echo ‚±‚Ìİ’è‚Í•W€‚Å‚Ífalse‚Å‚·B
pause
exit /b

:setting5_3help
cls
echo ‚±‚Ìİ’è‚Í‹N“®‚Éecho on‚Ìó‘Ô‚Å‹N“®‚·‚é‚æ‚¤‚É‚·‚éİ’è‚Å‚·B
echo ƒVƒ“ƒvƒ‹‚Å‚í‚©‚è‚â‚·‚­AŒ»İ‰½‚ªÀs‚³‚ê‚Ä‚¢‚é‚©‚ªˆê–Ú‚Å‚í‚©‚è‚Ü‚·B‚Ü‚½AƒnƒbƒJ[‹C•ª‚É‚à‚È‚ê‚Ü‚·B
echo ‚±‚Ìİ’è‚Ílinuxboot‚¨‚æ‚Ñsimpleboot‚Æ•¹—p‚Å‚«‚Ü‚¹‚ñB
echo ‚±‚Ìİ’è‚Í•W€‚Å‚Ífalse‚Å‚·B
pause
exit /b

:setting6help
cls
echo ‚±‚Ìİ’è‚ÍƒƒCƒ“ƒƒjƒ…[‚Å”wŒi‚ğ—LŒø‚É‚·‚é‚©‚Ç‚¤‚©‚ğ
echo İ’è‚Å‚«‚Ü‚·B‚±‚ê‚ğ—LŒø‚É‚·‚é‚ÆA‚æ‚è—Ç‚¢Œ©‚½–Ú‚É‚È‚è‚Ü‚·B
echo ‚½‚¾‚µAƒRƒ“ƒsƒ…[ƒ^[‚Ì«”\‚É‚æ‚Á‚Ä‚ÍƒƒCƒ“ƒƒjƒ…[‚ÌƒŒƒXƒ|ƒ“ƒX‚ªˆ«‚­‚È‚é‰Â”\«‚ª‚ ‚è‚Ü‚·B
echo ‚±‚Ìİ’è‚ÍƒfƒtƒHƒ‹ƒg‚Åtrue‚Å‚·B
pause
exit /b

:wmodehelp
cls
echo ‚±‚ê‚ÍCMD‚Ì‰æ–Ê‚ğ”’F‚Ü‚½‚Í•F‚É•Ï‚¦‚é•¨‚Å‚·B
echo ‚±‚ê‚ğg—p‚·‚é‚ÆA—á‚¦‚Î‰æ–Ê‚ÍƒzƒƒCƒgƒe[ƒ}‚Å“ˆê‚³‚¹‚½‚èA‚Ü‚½‚»‚Ì‚Ù‚¤‚ªD‚«‚Æ‚¢‚¤l‚É‚à‘Î‰‚Å‚«‚é‚æ‚¤‚É‚È‚è‚Ü‚·B
echo •W€‚Å‚Í•F‚Å‚·‚ªA”’F‚É‚µ‚½ŒãA¡Œã‹N“®‚µ‚½‚Æ‚«‚É©“®“I‚É‰æ–Ê‚ª”’F‚É‚È‚é‚æ‚¤‚É‚È‚è‚Ü‚·B
echo ‚Ü‚½A‚¿‚å‚Á‚Æ‚µ‚½— ˜b‚Å‚·‚ª‚±‚Ìİ’è‚ÍA1.10ˆÈ‘O‚Ü‚Å‚Íƒz[ƒ€‘¤‚Éİ’u‚³‚ê‚Ä‚¢‚Ü‚µ‚½B‚Ü‚½A‚±‚Ì‹@”\‚Íİ’è‚Ì“à•”\‘¢‚Ì‚à‚Æ‚É‚È‚Á‚Ä‚¢‚Ü‚·B
echo •W€‚Å‚Íƒ_[ƒNƒe[ƒ}‚Å‚·B
pause
exit /b
 
:uninstallhelp
cls
echo ‚±‚ê‚ÍƒAƒ“ƒCƒ“ƒXƒg[ƒ‹ƒƒjƒ…[‚Å‚·B‚±‚Ìƒƒjƒ…[‚ÍƒJ[ƒ\ƒ‹‘Ö‚¦‚ÌƒAƒ“ƒCƒ“ƒXƒg[ƒ‹‚ğs‚¢‚Ü‚·B
echo ‚±‚Ìƒƒjƒ…[‚É‚Íİ’èƒtƒ@ƒCƒ‹iİ’è‚ª‹L˜^‚³‚ê‚Ä‚¢‚éƒeƒLƒXƒgƒtƒ@ƒCƒ‹j‚ÌƒpƒX‚ğ•\¦‚·‚é‹@”\Aİ’è‚ğ‰Šú‰»(ƒfƒtƒHƒ‹ƒg‚É)‚·‚é‹@”\‚ªŠÜ‚Ü‚ê‚Ä‚¢‚Ü‚·B
echo ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹‚ğÀs‚·‚éê‡AƒJ[ƒ\ƒ‹‘Ö‚¦–{‘Ì‚ªíœ‚³‚êAi”CˆÓjƒJ[ƒ\ƒ‹‚àƒfƒtƒHƒ‹ƒg‚Éíœ‚³‚ê‚Ü‚·Bi”CˆÓjİ’èA‰‰ñ‹N“®‚ğŒŸ’m‚·‚é‚½‚ß‚Ìƒtƒ@ƒCƒ‹‚àŠ®‘S‚Éíœ‚³‚ê‚Ü‚·B
echo Às‚·‚éÛ‚Í‚­‚ê‚®‚ê‚à©ŒÈÓ”C‚ÅÀs‚µ‚Ä‚­‚¾‚³‚¢B
pause
exit /b




:batver
set batvercurrent=0
if "%batverdev%"=="dev" (set batverdevshow=ŠJ”­”Å)
if "%batverdev%"=="beta" (set batverdevshow=ƒx[ƒ^”Å)
if "%batverdev%"=="stable" (set batverdevshow=ˆÀ’è”Å)
if not defined dummy (set /p nothing=[?25l<nul)
if not defined dummy (set clr=[7m&set clrgra=[90m&set clr2=[0m)
if "%wmodetoggle%"=="false" (set clr=[7m&set clrgra=[90m&set clr2=[0m)
if "%wmodetoggle%"=="true" (set clr=[100m[97m&set clrgra=[107m[38;2;140;140;140m&set clr2=[90m[107m[30m)

:batver_main
rem GUI type 3
rem Main Bat Version Menu
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ƒo[ƒWƒ‡ƒ“î•ñ
if "%batverexit%"=="true" (set batvercurrent=& call :batver_exit & goto :hazimemenu)
if not defined batverboot (call :hazimemenudraw DarkDarkerYetDarker & set batverboot=true)
rem I'm doing this because when I use ANSI ESC sequences in Virtual Studio Code, the parentheses are colored incorrectly and I don't like that
if not defined dummy (echo [9;42H %batver% ^(%batverdevshow%^))
if not defined dummy (echo [10;42H %batbuild:~6%)
if "%batvercurrent%"=="0" (echo [18;29H %clrgra%‰½‚à‘I‘ğ‚³‚ê‚Ä‚¢‚Ü‚¹‚ñ...%clr2%) else (set /p nothing=[18;0H[2K<nul)
if not defined dummy (
echo [6;12H O=================================================O 
echo [7;12H I             ƒJ[ƒ\ƒ‹‘Ö‚¦  ƒo[ƒWƒ‡ƒ“            I 
echo [8;12H I                                                 I 
echo [9;12H I          Œ»İ‚Ìƒo[ƒWƒ‡ƒ“ :[9;63HI 
echo [10;12H I          Œ»İ‚Ìƒrƒ‹ƒh     :[10;63HI 
echo [11;12H I                                                 I 
echo [12;12H I    O====================O         O========O    I 
echo [13;12H I    I%bvb1% ƒAƒbƒvƒf[ƒg‚ÌŠm”F %clr2%I         I%bvb2% •Â‚¶‚é %clr2%I    I 
echo [14;12H I    O====================O         O========O    I 
echo [15;12H I                                                 I 
echo [16;12H O=================================================O 
echo [17;20H %clrgra%1~2‚©A,D‚Å“®‚©‚µAY,E‚ÅŒˆ’èAB‚ÅI—¹%clr2%
)
choice /c 12adyeb /n >nul
if %Errorlevel%==7 (set batverexit=true& goto :batver_main)
if %Errorlevel% geq 1 if %Errorlevel% leq 2 (set batvercurrent=%Errorlevel%)
if %batvercurrent%==0 (set batvercurrent=1& set bvb1=%clr%& goto :batver_main)
if %ErrorLevel%==3 (if not %batvercurrent%==1 (set /a batvercurrent-=1))
if %ErrorLevel%==4 (if not %batvercurrent%==2 (set /a batvercurrent+=1))
if %Errorlevel% geq 5 if %Errorlevel% leq 6 (call :batverselect_core)
set bvb1=& set bvb2=& set bvb%batvercurrent%=%clr%
goto :batver_main

:batverselect_core
rem Processing of Confirm key, like Y and E.
if "%batvercurrent%"=="1" (call :batverupdate & set batverboot=& exit /b)
if "%batvercurrent%"=="2" (set batverexit=true& exit /b)
exit /b

:batver_exit
rem initialize of variable
set batverexit=& set bvb1=& set bvb2=& set batverboot=& set batverdevshow=& set clrgra=
if not defined dummy (set /p nothing=[?25h<nul)
exit /b


:batverupdate
rem Update process
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ƒAƒbƒvƒf[ƒ^[
for /l %%i in (7,1,15) do (set /p nothing=[%%i;14H                                                 <nul)
if not defined dummy (set /p nothing=[8;15H ƒAƒbƒvƒf[ƒg‚ğŠm”F’†...<nul)
call :Powersheller CheckUpdate
set TempErrorlevel=%errorlevel%
rem Update messages
if "%TempErrorlevel%"=="0" (set /p nothing=[?25l<nul& set TempErrorlevel=& exit /b)
if not defined dummy (for /l %%i in (7,1,15) do (set /p nothing=[%%i;14H                                                 <nul))
if not "%TempErrorlevel%"=="0" if not "%TempErrorlevel%"=="1" (set /p nothing=[8;15H [91mƒAƒbƒvƒf[ƒ^[‚ÅƒGƒ‰[‚ª”­¶‚µ‚Ü‚µ‚½I%clr2%[13;15H %clrgra%^(‰½‚©ƒL[‚ğ‰Ÿ‚µ‚Ä‘±s..^)%clr2%<nul)
if "%TempErrorlevel%"=="1" (
if not defined dummy (set /p nothing=[8;15H ‚·‚Å‚ÉÅVƒo[ƒWƒ‡ƒ“‚Å‚·I[9;15H ƒAƒbƒvƒf[ƒg‚Ì•K—v‚Í‚ ‚è‚Ü‚¹‚ñB[11;15H %clrgra%^(‰½‚©ƒL[‚ğ‰Ÿ‚µ‚Ä‘±s...^)%clr2%<nul)
pause >nul
) else if "%TempErrorlevel%"=="2" (
if not defined dummy (set /p nothing=[10;15H ƒJ[ƒ\ƒ‹‘Ö‚¦‚ÍŒ»İÅV‚Ì•¨‚æ‚è‚àV‚µ‚¢‚Å‚·I[11;15H è“®‚Åƒo[ƒWƒ‡ƒ“‚ğ•ÏX‚µ‚½‚ÈH ^>:/<nul)
pause >nul
) else if "%TempErrorlevel%"=="3" (
if not defined dummy (set /p nothing=[10;15H Github‚ÌAPIƒŒ[ƒg§ŒÀ‚É“’B‚µ‚Ü‚µ‚½I[11;15H ˆêŠÔ’ö‘Ò‚Á‚Ä‚©‚çÄ“x‚¨‚µ‚­‚¾‚³‚¢B[13;15H %clrgra%^(‰½‚©ƒL[‚ğ‰Ÿ‚µ‚Ä‘±s...^)%clr2%<nul)
pause >nul
) else if "%TempErrorlevel%"=="4" (
if not defined dummy (set /p nothing=[10;15H ‰½‚ç‚©‚Ì–â‘è‚ª”­¶‚µ‚Ü‚µ‚½B[11;15H ƒCƒ“ƒ^[ƒlƒbƒgÚ‘±‚ğŠm”F‚µ‚ÄÄ“x‚¨‚µ‚­‚¾‚³‚¢B[13;15H %clrgra%^(‰½‚©ƒL[‚ğ‰Ÿ‚µ‚Ä‘±s...^)%clr2%<nul)
pause >nul
)
if not defined dummy (set /p nothing=[?25l<nul)
set TempErrorlevel=& exit /b



:Appmenu
cls
rem initialize variable
mode con: cols=67 lines=20
if not defined dummy (set clr=[7m&set clrgra=[90m&set clr2=[0m)
if "%wmodetoggle%"=="false" (set clr=[7m&set clrgra=[90m&set clr2=[0m)
if "%wmodetoggle%"=="true" (set clr=[100m[97m&set clrgra=[107m[38;2;140;140;140m&set clr2=[90m[107m[30m)
if not defined dummy (set /p nothing=[?25l<nul)
set Appmenucurrent=0

:Appmenu_main
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ƒAƒvƒŠƒP[ƒVƒ‡ƒ“ƒƒjƒ…[ (Œ±“I)
if "%Appmenuexit%"=="true" (call :Appmenu_exit& goto :hazimemenu)
if "%Appmenucurrent%"=="0" (echo [7;38H ‰½‚à‘I‘ğ‚³‚ê‚Ä‚¢‚Ü‚¹‚ñ) else (for /l %%i in (6,1,10) do (echo [%%i;38H                        ))
if "%Appmenucurrent%"=="1" (echo [7;42H ƒVƒ“ƒvƒ‹‚È“d‘ì& echo [8;41H ƒoƒJ‚Å‚àg‚¦‚Ü‚·B)
if "%Appmenucurrent%"=="2" (echo [7;44H 2048 ƒQ[ƒ€B& echo [8;44H –³ŒÀ‚ÉŠy‚µ‚¢& echo [9;44H Å‹­‚ÌƒQ[ƒ€B& echo [10;42H %clrgra%‚¿‚å‚Á‚Æ’x‚¢‚©‚à%clr2%)
if "%Appmenucurrent%"=="3" (echo [7;41H Internet Explorer& echo [8;43H IE‚ğŠJ‚«‚Ü‚·B)
if not defined dummy (set /p nothing=[0;0H<nul)
if not defined dummmy (
echo.
echo                        ƒAƒvƒŠƒP[ƒVƒ‡ƒ“ƒƒjƒ…[                
echo.
echo      O==============================O========================O     
echo      I                              I          î•ñ          I
echo      I   1 : %amb1%ƒVƒ“ƒvƒ‹“d‘ì%clr2%           I[6;62HI
echo      I                              I[7;62HI
echo      I   2 : %amb2%2048 ƒQ[ƒ€%clr2%            I[8;62HI
echo      I                              I[9;62HI
echo      I   3 : %amb3%Internet Explorer 11%clr2%   I[10;62HI
echo      I                              I[11;62HI
echo      O==============================O========================O
echo      I   ‘€ì•û–@ :                                          I
echo      I   W,S ‚© 1~3 ‚ÅˆÚ“®AY ‚© E ‚Å‹N“®‚µ‚Ü‚·              I
echo      I   N ‚© B ‚ÅI—¹                                       I
echo      O=======================================================O
echo.
echo             %clrgra%Às‚µ‚½‚¢ƒAƒvƒŠƒP[ƒVƒ‡ƒ“‚ğ‘I‘ğ‚µ‚Ä‚­‚¾‚³‚¢B%clr2%
echo.
)
choice /c 123wsyebn /n >nul
if %Errorlevel%==8 (set Appmenuexit=true& goto :Appmenu_main)
if %Errorlevel% geq 1 if %Errorlevel% leq 3 (set Appmenucurrent=%Errorlevel%)
if %Appmenucurrent%==0 (set Appmenucurrent=1& set amb1=%clr%& goto :Appmenu_main)
if %ErrorLevel%==4 (if not %Appmenucurrent%==1 (set /a Appmenucurrent-=1))
if %ErrorLevel%==5 (if not %Appmenucurrent%==3 (set /a Appmenucurrent+=1))
if %Errorlevel% geq 6 if %Errorlevel% leq 7 (call :Appmenuselect_core)
set amb1=& set amb2=& set amb3=& set amb%Appmenucurrent%=%clr%
goto :Appmenu_main

:Appmenuselect_core
rem Processing of Confirm key, like Y and E.
if "%Appmenucurrent%"=="0" (set Appmenucurrent=1& exit /b)
if "%Appmenucurrent%"=="1" (call :Startcal)
if "%Appmenucurrent%"=="2" (call :2048_game)
if "%Appmenucurrent%"=="3" (call :Openie)
rem I know it works the same way as cls when mode con is changed, but well... whatever.
mode con: cols=67 lines=20 & cls
exit /b

:Appmenu_exit
rem initialize of variable
set Appmenucurrent=& set Appmenuexit=& set amb1=& set amb2=& set amb3=& set Appmenuboot=& set clrgra=
if not defined dummy (set /p nothing=[?25h<nul)
exit /b



:startcal
rem “d‘ì
set q=0
set number1=0
set number2=0
set number3=0
cls
echo 2147483647‚ÌŒvZ‚Ü‚Å(intŒ^‚ÌãŒÀ d—lã‚±‚ê‚æ‚èã‚ÌŒvZ‚Í•s‰Â)
echo.
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ƒJ[ƒ\ƒ‹“d‘ì

rem ƒVƒ“ƒvƒ‹ƒ‚[ƒh
:simplemodecal
set q=0
set number1=0
set number2=0
set number3=0

echo ®‚ğ“ü—Í‚µ‚ÄŒvZ‚·‚éê‡‚Í3‚Æ“ü—Í‚µ‚Ä‚­‚¾‚³‚¢B
echo.
echo –ß‚éê‡‚Íback‚Æ“ü—Í‚µ‚Ä‚­‚¾‚³‚¢B
echo.
echo + or -
echo ‘«‚µZ‚È‚ç1Aˆø‚«Z‚È‚ç2‚ğ‘I‘ğ‚µ‚Ä‚­‚¾‚³‚¢B
set /p q=
rem “d‘ì‚Ì•ªŠò
if "%q%"=="back" (exit /b)
if "%q%"=="b" (exit /b)
if "%q%"=="1" (set whatnumber=‘«‚³‚ê‚é‘¤&goto :startcal2)
if "%q%"=="2" (set whatnumber=ˆø‚©‚ê‚é‘¤&goto :startcal2) 
if "%q%"=="3" (goto :advancemodecal) else (
echo –³Œø‚È‘I‘ğ‚Å‚·&pause&goto :startcal)

:startcal2
echo.
set /p number1=%whatnumber%‚ğ“ü—Í :
if "%q%"=="1" (goto :pcal)
if "%q%"=="2" (goto :mcal)

:pcal
set /p number3=‘«‚·‘¤‚ğ“ü—Í :
set /a number1=number1+number3
echo Œ‹‰Ê : %number1%
pause
cls
goto :simplemodecal

:mcal
set /p number3=ˆø‚­‘¤‚ğ“ü—Í :
set /a number1=number1-number3
echo Œ‹‰Ê : %number1%
pause
cls
goto :simplemodecal

rem ƒAƒhƒoƒ“ƒXƒ‚[ƒh
:advancemodecal

:loopcal
cls
echo I‚í‚éê‡‚Íback‚Æ“ü—Í‚µ‚Ä‚­‚¾‚³‚¢B
SET /P formula="ŒvZ‚·‚é®‚ğ“ü—Í‚µ‚Ä‚­‚¾‚³‚¢."
SET /A result=%formula%
if "%formula%"=="back" goto :startcal
echo Œ‹‰ÊF%Result%
pause
goto :loopcal


:openie
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ƒCƒ“ƒ^[ƒlƒbƒgƒGƒNƒXƒvƒ[ƒ‰[‚ğŠJ‚­
cls
echo ƒCƒ“ƒ^[ƒlƒbƒgƒGƒNƒXƒvƒ[ƒ‰[‚ğŠJ‚¢‚Ä‚¢‚Ü‚·...
powershell -command "$ie = New-Object -ComObject InternetExplorer.Application; $ie.Visible = $true"
pathping 127.0.0.1 -n -q 1 -p 500 1>nul
exit /b


:2048_game
setlocal enabledelayedexpansion
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| 2048 ƒQ[ƒ€
mode con: cols=33 lines=31
set bestscore=0
:2048_startgame
set /a score=0,winstate=0&for /l %%g in (0,1,15)do set board[%%g]=0
set /a moves=0,h=0&for /l %%g in (0,1,15)do if !board[%%g]!==0 set /a h+=1
if %h%==16 call :2048_tilespawn&call :2048_tilespawn
:2048_startloop
if %score% gtr %bestscore% set bestscore=%score%
call :2048_drawboard 0&choice /c wasdbn /n /m ""
echo ˆ—’†...
if %errorlevel%==1 call :2048_youwin&call :2048_youwin&call :2048_youwin&call :2048_compress&call :2048_merge&call :2048_compress&call :2048_compress&call :2048_youwin
if %errorlevel%==2 call :2048_compress&call :2048_merge&call :2048_compress&call :2048_compress
if %errorlevel%==3 call :2048_youwin&call :2048_compress&call :2048_merge&call :2048_compress&call :2048_compress&call :2048_youwin&call :2048_youwin&call :2048_youwin
if %errorlevel%==4 call :2048_youwin&call :2048_youwin&call :2048_compress&call :2048_merge&call :2048_compress&call :2048_compress&call :2048_youwin&call :2048_youwin
if %errorlevel%==5 goto :2048_end
if %errorlevel%==6 (set /a score=0,winstate=0&set moves=0&for /l %%g in (0,1,15)do set board[%%g]=0
call :2048_tilespawn&call :2048_tilespawn&goto :2048_startloop)
set /a boardchanged=0,tiles=0&for /l %%g in (0,1,15)do (if !board[%%g]! neq !tmpboard[%%g]! set boardchanged=1
if !board[%%g]! neq 0 set /a tiles+=1
if !board[%%g]!==2048 if %winstate%==0 set winstate=1)
if %boardchanged%==1 set /a boardfull=1&for /l %%g in (0,1,15)do if !board[%%g]!==0 set boardfull=0
if %boardchanged%==1 if %boardfull%==1 goto :2048_youlost
if %boardchanged%==1 call :2048_tilespawn&set /a moves+=1
if %winstate%==1 goto :2048_youwin
set /a youlost=0,v=0
:2048_1
set /a v+=1
set /a w=%v%%%4,x=%v%/4,y=%v%-1,z=%v%-4
if %tiles%==15 (if %w% neq 0 if !board[%v%]! equ !board[%y%]! set youlost=1
if %x% neq 0 if !board[%v%]! equ !board[%z%]! set youlost=1)
if %tiles%==15 if %v% neq 15 goto :2048_1
if %tiles%==15 if %boardchanged%==1 if %youlost%==0 goto :2048_youlost
goto :2048_startloop
:2048_tilespawn
set /a randtile=%random%%%16
if !board[%randtile%]! gtr 0 goto :2048_tilespawn
set /a board[%randtile%]=%random%%%10/9*2+2&exit /b
:2048_compress
set x=-1
:2048_2
set /a w=0,x+=1,y=-1&for /l %%g in (0,1,3) do set tmparray[%%g]=0
:2048_3
set /a y+=1&set /a z=%x%*4+!y!
if !board[%z%]! neq 0 set /a tmparray[%w%]=!board[%z%]!&set /a w+=1
if %y% neq 3 goto :2048_3
for /l %%g in (0,1,3)do set /a z=%x%*4+%%g&set /a board[!z!]=!tmparray[%%g]!
if %x% neq 3 goto :2048_2
exit /b
:2048_merge
set x=-1
:2048_4
set /a x+=1,y=-1
:2048_5
set /a y+=1&set /a w=%x%*4+!y!&set /a z=!w!+1
if !board[%w%]!==!board[%z%]! set /a board[%w%]*=2,score+=!board[%w%]!*2&set board[%z%]=0
if %y% neq 2 goto :2048_5
if %x% neq 3 goto :2048_4
exit /b
:2048_youwin
set i=12
for /l %%g in (0,1,15)do set /a tmparray[%%g]=board[!i!],i-=4&if !i! lss 0 set /a i+=17
for /l %%g in (0,1,15)do set /a board[%%g]=!tmparray[%%g]!
exit /b
:2048_youwin
set winstate=2&call :2048_drawboard 1&call &choice /c cnx /n /m ""
if %errorlevel%==1 goto :2048_startloop
if %errorlevel%==2 goto :2048_startgame
if %errorlevel%==3 exit /b
:2048_youlost
call :2048_drawboard 2&for /l %%g in (0,1,15)do set board[%%g]=0
set /a score=0,winstate=0&call &choice /c nx /n /m ""
if %errorlevel%==1 goto :2048_startgame
if %errorlevel%==2 exit /b
:2048_drawboard
for /l %%g in (0,1,15)do (set "board2[%%g]=      !board[%%g]!"&if !board[%%g]!==0 set "board2[%%g]=      "
if %moves% gtr 0 if %%g==%randtile% set board2[%%g]=   + !board[%%g]!
set board2[%%g]=!board2[%%g]:~-6!)

:2048_drawboard
for /l %%g in (0,1,15)do (set "board2[%%g]=      !board[%%g]!"&if !board[%%g]!==0 set "board2[%%g]=      "
if %moves% gtr 0 if %%g==%randtile% set board2[%%g]=   + !board[%%g]!
set board2[%%g]=!board2[%%g]:~-6!)
cls&echo   ___     ___    _  _      ___&echo  ^|__ ?   / _ ?  ^| ^|^| ^|    / _ ?&echo     ) ^| ^| ^| ^| ^| ^| ^|^| ^|_  ^| (_) ^|&echo    / /  ^| ^| ^| ^| ^|__   _^|  ^> _ ^<&echo   / /_  ^| ^|_^| ^|    ^| ^|   ^| (_) ^|&echo  ^|____^|  ?___/     ^|_^|    ?___/&echo(&echo        ƒ^ƒCƒ‹‚ğ‘«‚µ‡‚í‚¹‚ÄA  &echo   @2048‚Ìƒ^ƒCƒ‹‚ğì‚è‚Ü‚µ‚å‚¤^^!&echo(&if %1==0 echo     (N‚ÅV‚µ‚¢ƒQ[ƒ€‚ğŠJn)&echo            (B‚ÅI—¹)&&echo(
if %1==1 echo             ‚ ‚È‚½‚ÌŸ‚¿I&echo C‚ğ‰Ÿ‚µ‚Ä‘±s‚·‚é‚©A N‚ÅƒŠƒZƒbƒg‚µ‚Ü‚µ‚å‚¤B
if %1==2 echo            Game Over!&echo        N‚ğ‰Ÿ‚µ‚ÄƒŠƒZƒbƒg...
echo   ƒXƒRƒA: %score%&echo   Å‚‹L˜^: %bestscore%&echo   O======O======O======O======O&echo   I%board2[0]%I%board2[1]%I%board2[2]%I%board2[3]%I&echo   O======O======O======O======O&echo   I%board2[4]%I%board2[5]%I%board2[6]%I%board2[7]%I&echo   O======O======O======O======O&echo   I%board2[8]%I%board2[9]%I%board2[10]%I%board2[11]%I&echo   O======O======O======O======O&echo   I%board2[12]%I%board2[13]%I%board2[14]%I%board2[15]%I&echo   O======O======O======O======O&echo ƒvƒŒƒC•û–@: WASDƒL[‚ğg‚Á‚Äƒ^ƒCƒ‹‚ğ“®‚©‚µ‚Ü‚·B“¯‚¶”š‚Ì2‚Â‚Ìƒ^ƒCƒ‹‚ªƒ^ƒbƒ`‚·‚é‚ÆA1‚Â‚É“‡‚³‚ê‚Ü‚·&exit /b
exit /b
:2048_end
cls
echo 2048‚ğI—¹‚µ‚Ä‚¢‚Ü‚·...
set score=,bestscore=,winstate=,board=,moves=,h=,randtile=,boardchanged=,tiles=,2048_youlost=,v=,w=,x=,y=,z=,tmparray=,i=,board2=,
setlocal disabledelayedexpansion
exit /b





:cursorchange
cls
rem GUI type 1
rem initialize variable
mode con: cols=75 lines=20
if not defined dummy (set clr=[7m&set clrgra=[90m&set clr2=[0m)
if "%wmodetoggle%"=="false" (set clr=[7m&set clrgra=[90m&set clr2=[0m)
if "%wmodetoggle%"=="true" (set clr=[100m[97m&set clrgra=[107m[38;2;140;140;140m&set clr2=[90m[107m[30m)
if not defined dummy (set /p nothing=[?25l<nul)
set cursorchangecurrent=0

:cursorchange_loop
rem main menu of cursor change
title ƒJ[ƒ\ƒ‹‘Ö‚¦
if "%cursorchangeexit%"=="true" (set cursorchangecurrent=& call :cursorchange_exit& goto :hazimemenu)
if "%cursorchangeexit%"=="true1y" (call :cursorchange_main_cfm)
if "%cursorchangeexit%"=="true2" (call :cursorchange_main_backup & set cursorchangeexit= & goto :cursorchange_loop)
call :cursorchange_Drew
if not defined dummy (set /p nothing=[0;0H<nul)
if "%cursorchangecurrent%"=="0" (call :cursorchange_Drew boot)
if not "%cursorchangeexit%"=="true1" (
echo                              ƒJ[ƒ\ƒ‹‘Ö‚¦%batver%
echo.
echo           O================================O=====================O
echo           I            ƒƒjƒ…[            I         î•ñ        I
echo           I                                I[5;66HI
echo           I   %ccm1%1 ƒJ[ƒ\ƒ‹‚ğ%cursorcolor%F‚É•Ï‚¦‚é %ccm1e%    I[6;66HI
echo           I                                I[7;66HI
echo           I   %ccm2%2 ƒJ[ƒ\ƒ‹‚ÌƒoƒbƒNƒAƒbƒv%ccm2e%     I[8;66HI
echo           I                                I[9;66HI
echo           O================================O=====================O
echo.
echo.
echo               1~2 ‚© W,S ‚Å‘I‘ğ‚µAY,E‚ÅŒˆ’èA B,N‚ÅI—¹‚µ‚Ü‚·B
echo.
)
choice /c 12wsyebn /n >nul
if %ErrorLevel%==1 if not "%cursorchangeexit%"=="true1" (set cursorchangecurrent=1)
if %ErrorLevel%==2 if not "%cursorchangeexit%"=="true1" (set cursorchangecurrent=2)
if %ErrorLevel%==3 call :cursorchange_main w
if %ErrorLevel%==4 call :cursorchange_main s
if %ErrorLevel%==5 call :cursorchange_main y
if %ErrorLevel%==6 call :cursorchange_main e
if %ErrorLevel%==7 call :cursorchange_main b
if %ErrorLevel%==8 call :cursorchange_main n
goto :cursorchange_loop


:cursorchange_main
rem Processing of each move
if "%cursorchangeexit%"=="true1" (
if "%1"=="y" (set cursorchangeexit=true1y)
if "%1"=="e" (set cursorchangeexit=true1y)
if "%1"=="b" (call :cursorchange_clear& set cursorchangeexit=)
if "%1"=="n" (call :cursorchange_clear& set cursorchangeexit=)
exit /b
)

if "%1"=="w" (
    set cursorchangecurrent=1
    exit /b
) else if "%1"=="s" (
    if "%cursorchangecurrent%"=="0" (set cursorchangecurrent=1& exit /b)
    set cursorchangecurrent=2
    exit /b
)

if "%1"=="y" (
if "%cursorchangecurrent%"=="1" (set cursorchangeexit=true1)
if "%cursorchangecurrent%"=="2" (set cursorchangeexit=true2) else (set cursorchangecurrent=1)
exit /b
) else if "%1"=="e" (
if "%cursorchangecurrent%"=="1" (set cursorchangeexit=true1)
if "%cursorchangecurrent%"=="2" (set cursorchangeexit=true2) else (set cursorchangecurrent=1)
exit /b
)

if "%1"=="b" (
set cursorchangeexit=true
exit /b
) else if "%1"=="n" (
set cursorchangeexit=true
exit /b
)

exit /b

:cursorchange_Drew
rem drawer of Text and Colors.

if not defined dummy (for /l %%i in (5,1,7) do (set /p nothing=[%%i;46H                   <nul))
if "%1"=="boot" (
    set /p nothing=[6;46H ‘I‘ğ‚µ‚Ä‚­‚¾‚³‚¢B[0;0H<nul
    exit /b
)
if "%cursorchangecurrent%"=="0" (
    echo [6;46H ‘I‘ğ‚µ‚Ä‚­‚¾‚³‚¢B
    exit /b
)

if "%cursorchangecurrent%"=="1" (
    if "%cursorchangeexit%"=="true1" (
        rem confirm messages
        call :cursorchange_clear
        set /p nothing=[5;13H –{“–‚ÉƒJ[ƒ\ƒ‹‚ğ%cursorcolor%F‚É•ÏX‚µ‚Ü‚·‚©H<nul& set /p nothing=[8;13H %clrgra%^(Y,E ‚Ü‚½‚Í B,N^)%clr2%<nul
        exit /b
    )
    if not "%cursorchangeexit%"=="true1y" (
    echo [6;48H %cursorcolor%F‚ÌƒJ[ƒ\ƒ‹
    echo [7;49H ‚É•ÏX‚µ‚Ü‚·B
    set ccm2=& set ccm2e=& set ccm1=%clr%& set ccm1e=%clr2%
    exit /b
    )
)
if "%cursorchangecurrent%"=="2" (
    if "%cursorchangeexit%"=="true2" (exit /b)
    echo [6;47H ƒJ[ƒ\ƒ‹‚Ìİ’è‚ğ
    echo [7;46H ƒoƒbƒNƒAƒbƒv‚µ‚Ü‚·
    set ccm1=& set ccm1e=& set ccm2=%clr%& set ccm2e=%clr2%
    exit /b
)
exit /b

:cursorchange_clear
rem clear box
if not defined dummy (
    set /p nothing=[3;44H=<nul
    set /p nothing=[10;44H=<nul
)
for /l %%i in (4,1,9) do (set /p nothing=[%%i;12H                                                     <nul)
exit /B

:cursorchange_exit
rem initialize of variable
set cursorchangeexit=& set cursorchangecurrent=& set ccm1=& set ccm1e=& set ccm2=& set ccm2e=& set clrgra=
if not defined dummy (set /p nothing=[?25h<nul)
exit /b



:cursorchange_main_cfm
find "CursorChanged" %FirstSTFsfile% > nul
if "%errorlevel%"=="0" (goto :cursorchange_main_cfm_apply)

:cursorchange_main_cfm_FirstWarning
call :cursorchange_clear
if not defined dummy (
    set /p nothing=[5;13H %clrgra%^(Å‰‚Ì•ÏX‚Ì‚İ^)%clr2%<nul
)
timeout /t 2 /nobreak >nul
call :cursorchange_clear
if not defined dummy (
    set /p nothing=[5;13H ‚±‚Ì‹@”\‚Í‚¨g‚¢‚ÌWindows‚ÌƒJ[ƒ\ƒ‹‚ğ•ÏX‚µ‚Ü‚·B <nul
    set /p nothing=[6;13H •ÏX‚µ‚½‚­‚È‚¢ê‡‚ÍA‚±‚Ì“_‚Å–ß‚Á‚Ä‚­‚¾‚³‚¢B <nul
    set /p nothing=[8;13H %clrgra%‰½‚©ƒL[‚ğ‰Ÿ‚µ‚Ä‘±s...%clr2%<nul
    pause >nul
)
call :cursorchange_clear
if not defined dummy (
    set /p nothing=[5;13H ŠJ”­Ò‚Å‚ ‚étamago_1908‚ÍAƒJ[ƒ\ƒ‹‚ğ•ÏX‚µ‚½<nul
    set /p nothing=[6;13H –‚É‹Nˆö‚·‚é‘S‚Ä‚Ì–â‘è‚É‘Î‚µ‚ÄÓ”C‚ğ•‰‚¢‚Ü‚¹‚ñB <nul
    set /p nothing=[8;13H %clrgra%‰½‚©ƒL[‚ğ‰Ÿ‚µ‚Ä‘±s...%clr2%<nul
    pause >nul
)
call :cursorchange_clear
if not defined dummy (
    set /p nothing=[5;13H –{“–‚É‘±s‚µ‚Ü‚·‚©H<nul
    set /p nothing=[8;13H %clrgra%^(Y ‚Ü‚½‚Í N^)%clr2%<nul
)
choice /c YN /n >nul
if "%errorlevel%"=="1" (
    find "nodogcheckforfastboot" %FirstSTFsfile% > nul
    if "%errorlevel%"=="1" (
    echo nodogcheckforfastboot > %FirstSTFsfile%
    echo CursorChanged >> %FirstSTFsfile%
    ) else echo CursorChanged >> %FirstSTFsfile%
    goto :cursorchange_main_cfm_apply
)
if "%ErrorLevel%"=="2" (set cursorchangeexit=&goto :cursorchange_loop)


:cursorchange_main_cfm_apply
call :cursorchange_clear
:defgotest
rem determine black or white by the name of the cursor
reg query "HKEY_CURRENT_USER\Control Panel\Cursors" /v "" | find "Windows •W€" >nul
if "%ErrorLevel%"=="0" (goto :darkgo)
if "%ErrorLevel%"=="1" (goto :darkgotest)

:darkgotest
reg query "HKEY_CURRENT_USER\Control Panel\Cursors" /v "" | find "Windows •" >nul
if "%ErrorLevel%"=="0" (goto :defgo)
if "%ErrorLevel%"=="1" (goto :defgo)
call :exit 0


:Progress_bar_drawer
if "%wmodetoggle%"=="true" (set pbdclr=[47m[97m) else (set pbdclr=[7m)
rem startline(x),current,endline,y,background(0 or 1)
rem progress bar bg
if "%5"=="1" (for /l %%i in (%1,1,%3) do (set /p nothing=[%4;%%iH[48;5;244m <nul))
rem progress bar fg
for /l %%i in (%1,1,%2) do (set /p nothing=[%4;%%iH%pbdclr% <nul) & set pbdclr=
exit /b


rem Change cursor color to white
:defgo
set a=13
if "%wmodetoggle%"=="true" (color f0) else (color 07)
if not defined dummy (set /p nothing=[5;13H %clrgra%‰½‚©ƒL[‚ğ‰Ÿ‚µ‚Ä“K—p...%clr2%<nul& pause >nul)
if not defined dummy (call :cursorchange_clear& set /p nothing=[5;13H “K—p’†... %clrgra%^(ƒJ[ƒ\ƒ‹‘Ö‚¦‚ğ•Â‚¶‚È‚¢‚Å‚­‚¾‚³‚¢I^)%clr2%<nul)
call :Progress_bar_drawer 14 %a% 63 8 1
timeout /t 1 /nobreak >nul
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /ve /f /d "Windows •W€" >nul
call :Progress_bar_drawer 14 %a% 63 8 0& set /a a+=2
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v ContactVisualization /t REG_DWORD /f /d "0x00000001" >nul
call :Progress_bar_drawer 14 %a% 63 8 0& set /a a+=2
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v CursorBaseSize /t REG_DWORD /f /d "0x00000020" >nul
call :Progress_bar_drawer 14 %a% 63 8 0& set /a a+=2
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v GestureVisualization /t REG_DWORD /f /d "0x0000001f" >nul
call :Progress_bar_drawer 14 %a% 63 8 0& set /a a+=2
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v "Scheme Source" /t REG_DWORD /f /d "0x0000002" >nul
call :Progress_bar_drawer 14 %a% 63 8 0& set /a a+=2
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v AppStarting /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\aero_working.ani >nul
call :Progress_bar_drawer 14 %a% 63 8 0& set /a a+=2
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v Arrow /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\aero_arrow.cur >nul
call :Progress_bar_drawer 14 %a% 63 8 0& set /a a+=2
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v Crosshair /t REG_EXPAND_SZ /f /d "" >nul
call :Progress_bar_drawer 14 %a% 63 8 0& set /a a+=2
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v Hand /t REG_SZ /f /d "%SystemRoot%\cursors\aero_link.cur" >nul
call :Progress_bar_drawer 14 %a% 63 8 0& set /a a+=2
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v Help /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\aero_helpsel.cur >nul
call :Progress_bar_drawer 14 %a% 63 8 0& set /a a+=2
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v IBeam /t REG_EXPAND_SZ /f /d "" >nul
call :Progress_bar_drawer 14 %a% 63 8 0& set /a a+=2
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v No /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\aero_unavail.cur >nul
call :Progress_bar_drawer 14 %a% 63 8 0& set /a a+=2
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v NWPen /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\aero_pen.cur >nul
call :Progress_bar_drawer 14 %a% 63 8 0& set /a a+=2
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v Person /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\aero_person.cur >nul
call :Progress_bar_drawer 14 %a% 63 8 0& set /a a+=2
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v Pin /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\aero_pin.cur >nul
call :Progress_bar_drawer 14 %a% 63 8 0& set /a a+=3
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v SizeAll /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\aero_move.cur >nul
call :Progress_bar_drawer 14 %a% 63 8 0& set /a a+=3
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v SizeNESW /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\aero_nesw.cur >nul
call :Progress_bar_drawer 14 %a% 63 8 0& set /a a+=3
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v SizeNS /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\aero_ns.cur >nul
call :Progress_bar_drawer 14 %a% 63 8 0& set /a a+=3
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v SizeNWSE /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\aero_nwse.cur >nul
call :Progress_bar_drawer 14 %a% 63 8 0& set /a a+=3
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v SizeWE /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\aero_ew.cur >nul
call :Progress_bar_drawer 14 %a% 63 8 0& set /a a+=3
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v UpArrow /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\aero_up.cur >nul
call :Progress_bar_drawer 14 %a% 63 8 0& set /a a+=4
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v Wait /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\aero_busy.ani >nul
call :Progress_bar_drawer 14 %a% 63 8 0
timeout /t 1 /nobreak >nul
if "%wmodetoggle%"=="true" (color f0) else (color 07)
if not defined dummy (call :cursorchange_clear& set /p nothing=[5;13H ƒJ[ƒ\ƒ‹‚ğXV’†...<nul)
call :Powersheller RefreshCursor & set a=
if not defined dummy (call :cursorchange_clear& set /p nothing=[5;13H ƒJ[ƒ\ƒ‹‚ÌF‚ğ”’F‚É•ÏX‚µ‚Ü‚µ‚½B<nul& timeout /t 3 /nobreak >nul)
goto :cursorchange_afterchange



rem Change the cursor color to black.
:darkgo
set a=13
if "%wmodetoggle%"=="true" (color f0) else (color 07)
if not defined dummy (set /p nothing=[5;13H %clrgra%‰½‚©ƒL[‚ğ‰Ÿ‚µ‚Ä“K—p...%clr2%<nul& pause >nul)
if not defined dummy (call :cursorchange_clear& set /p nothing=[5;13H “K—p’†... %clrgra%^(ƒJ[ƒ\ƒ‹‘Ö‚¦‚ğ•Â‚¶‚È‚¢‚Å‚­‚¾‚³‚¢I^)%clr2%<nul)
call :Progress_bar_drawer 14 %a% 63 8 1
timeout /t 1 /nobreak >nul
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /ve /f /d "Windows •" >nul
call :Progress_bar_drawer 14 %a% 63 8 0& set /a a+=2
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v ContactVisualization /t REG_DWORD /f /d "0x00000001" >nul
call :Progress_bar_drawer 14 %a% 63 8 0& set /a a+=2
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v CursorBaseSize /t REG_DWORD /f /d "0x00000020" >nul
call :Progress_bar_drawer 14 %a% 63 8 0& set /a a+=2
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v GestureVisualization /t REG_DWORD /f /d "0x0000001f" >nul
call :Progress_bar_drawer 14 %a% 63 8 0& set /a a+=2
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v "Scheme Source" /t REG_DWORD /f /d "0x0000000" >nul
call :Progress_bar_drawer 14 %a% 63 8 0& set /a a+=2
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v AppStarting /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\wait_r.cur >nul
call :Progress_bar_drawer 14 %a% 63 8 0& set /a a+=2
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v Arrow /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\arrow_r.cur >nul
call :Progress_bar_drawer 14 %a% 63 8 0& set /a a+=2
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v Crosshair /t REG_EXPAND_SZ /f /d "%SystemRoot%\cursors\cross_r.cur" >nul
call :Progress_bar_drawer 14 %a% 63 8 0& set /a a+=2
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v Hand /t REG_SZ /f /d "" >nul
call :Progress_bar_drawer 14 %a% 63 8 0& set /a a+=2
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v Help /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\help_r.cur >nul
call :Progress_bar_drawer 14 %a% 63 8 0& set /a a+=2
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v IBeam /t REG_EXPAND_SZ /f /d "%SystemRoot%\cursors\beam_r.cur" >nul
call :Progress_bar_drawer 14 %a% 63 8 0& set /a a+=2
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v No /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\no_r.cur >nul
call :Progress_bar_drawer 14 %a% 63 8 0& set /a a+=2
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v NWPen /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\pen_r.cur >nul
call :Progress_bar_drawer 14 %a% 63 8 0& set /a a+=2
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v Person /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\person_r.cur >nul
call :Progress_bar_drawer 14 %a% 63 8 0& set /a a+=2
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v Pin /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\pin_r.cur >nul
call :Progress_bar_drawer 14 %a% 63 8 0& set /a a+=3
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v SizeAll /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\move_r.cur >nul
call :Progress_bar_drawer 14 %a% 63 8 0& set /a a+=3
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v SizeNESW /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\size1_r.cur >nul
call :Progress_bar_drawer 14 %a% 63 8 0& set /a a+=3
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v SizeNS /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\size4_r.cur >nul
call :Progress_bar_drawer 14 %a% 63 8 0& set /a a+=3
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v SizeNWSE /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\size2_r.cur >nul
call :Progress_bar_drawer 14 %a% 63 8 0& set /a a+=3
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v SizeWE /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\size3_r.cur >nul
call :Progress_bar_drawer 14 %a% 63 8 0& set /a a+=3
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v UpArrow /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\up_r.cur >nul
call :Progress_bar_drawer 14 %a% 63 8 0& set /a a+=4
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v Wait /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\busy_r.cur >nul
call :Progress_bar_drawer 14 %a% 63 8 0
timeout /t 1 /nobreak >nul
if "%wmodetoggle%"=="true" (color f0) else (color 07)
if not defined dummy (call :cursorchange_clear& set /p nothing=[5;13H ƒJ[ƒ\ƒ‹‚ğXV’†...<nul)
call :Powersheller RefreshCursor & set a=
if not defined dummy (call :cursorchange_clear& set /p nothing=[5;13H ƒJ[ƒ\ƒ‹‚ÌF‚ğ•F‚É•ÏX‚µ‚Ü‚µ‚½B<nul& timeout /t 3 /nobreak >nul)
goto :cursorchange_afterchange


:cursorchange_afterchange
rem Determining whether or not to play reboot message depending on settings
reg query "HKEY_CURRENT_USER\Control Panel\Cursors" /v "" | find "Windows •" >nul
if "%ErrorLevel%"=="0" (set cursorcolor=”’)
if "%ErrorLevel%"=="1" (set cursorcolor=”’)
reg query "HKEY_CURRENT_USER\Control Panel\Cursors" /v "" | find "Windows •W€" >nul
if "%ErrorLevel%"=="0" (set cursorcolor=•)
set cursorchangeexit=& exit /b


:cursorchange_main_backup
call :cursorchange_clear
setlocal enabledelayedexpansion
if not defined dummy (set clr=[7m&set clrgra=[90m&set clrwhi=[97m&set clr2=[0m)
if "%wmodetoggle%"=="false" (set clr=[7m&set clrgra=[90m&set clrwhi=[97m&set clr2=[0m)
if "%wmodetoggle%"=="true" (set clr=[100m[97m&set clrgra=[107m[38;2;140;140;140m&set clrwhi=[30m&set clr2=[90m[107m[30m)
set backupmenucurrent=0& set backedupcount=0
cd %batchmainpath%
for /f "usebackq tokens=1,* delims==" %%A in ("%FirstSTFsfile%") do (
    if "%%A"=="CursorValue_Default" (set /a backedupcount+=1) else (
        for /f "tokens=2,* delims=_" %%D in ("%%A") do (set /a backedupcount+=1)
    )
)

:cursorchange_main_backup_loop
rem GUI Type 3.5
title ƒJ[ƒ\ƒ‹ƒoƒbƒNƒAƒbƒv (Œ±“I)
for /l %%i in (1,1,512) do ( if not "!cursorbackupexit!"=="true" (
if !backedupcount! lss 2 (echo [12;21H ƒJ[ƒ\ƒ‹‚ÍƒoƒbƒNƒAƒbƒv‚³‚ê‚Ä‚¢‚Ü‚¹‚ñB<nul) else (echo [12;21H ƒJ[ƒ\ƒ‹‚ÍƒoƒbƒNƒAƒbƒv‚³‚ê‚Ä‚¢‚Ü‚·I)
if not defined dummy (set /p nothing=[?25l[H<nul)
if not defined dummy (
if not "!backupmenucurrent!"=="2" (if !backedupcount! lss 2 (set bumb2=%clrgra%))
echo                              ƒJ[ƒ\ƒ‹‘Ö‚¦%batver%
echo.
echo           O=======================O==============================O
echo           I                       I            î•ñ              I
echo           I   !bumb1!1 : •Û‘¶/•œŒ³    !clr2!   I[30CI
echo           I                       I[30CI
echo           I   !bumb2!2 : •Û‘¶‚ğíœ   !clr2!   I[30CI
echo           I                       I[30CI
echo           I   !bumb3!3 : ‘Şo         !clr2!   I[30CI
echo           I                       I[30CI
echo           O=======================O==============================O
echo           I[54CI
echo           O======================================================O
echo.
echo.
if "%wmodetoggle%"=="false" (set clrgra=[90m) & if "%wmodetoggle%"=="true" (set clrgra=[107m[38;2;140;140;140m)
echo                   %clrgra%1~3 ‚© W,S ‚Å‘I‘ğAY,E ‚ÅŒˆ’èAB,N ‚Å‘Şo%clr2%
echo.
)
for /l %%i in (5,1,10) do (echo [%%i;36H                              )
if "!backupmenucurrent!"=="0" (echo [6;39H ‰½‚à‘I‘ğ‚³‚ê‚Ä‚¢‚Ü‚¹‚ñB& echo [7;42H ‘I‘ğ‚µ‚Ä‚­‚¾‚³‚¢B& echo [9;38H %clrgra%[W,S] ‚Ü‚½‚Í [1~3] ‚Å‘I‘ğ%clr2%)
if "!backupmenucurrent!"=="1" (echo [6;38H ƒJ[ƒ\ƒ‹‚ÌƒŒƒWƒXƒgƒŠƒL[& echo [7;39H ‚ğƒoƒbƒNƒAƒbƒv‚Å‚«‚Ü‚·)
if "!backupmenucurrent!"=="2" (echo [6;38H ƒJ[ƒ\ƒ‹‚ÌƒoƒbƒNƒAƒbƒv‚ğ& echo [7;44H íœ‚Å‚«‚Ü‚·& if !backedupcount! lss 2 (set /p nothing=[9;39H %clrgra%ƒoƒbƒNƒAƒbƒv‚ª•K—v‚Å‚·%clr2%<nul))
if "!backupmenucurrent!"=="3" (echo [6;39H ‰½‚à‚¹‚¸‚É‚±‚Ìƒƒjƒ…[& echo [7;43H ‚©‚ç‘Şo‚µ‚Ü‚·)

choice /c 123wsyebn /n >nul
if !Errorlevel!==8 (set cursorbackupexit=true)
if !Errorlevel! geq 1 if !Errorlevel! leq 3 (set backupmenucurrent=!Errorlevel!)
if !backupmenucurrent!==0 (set backupmenucurrent=1& set bumb1=%clr%) else (
if !ErrorLevel!==4 (if not !backupmenucurrent!==1 (set /a backupmenucurrent-=1))
if !ErrorLevel!==5 (if not !backupmenucurrent!==3 (set /a backupmenucurrent+=1))
if !Errorlevel! geq 6 if !Errorlevel! leq 7 (call :cursorchange_main_backup_Core)
for /l %%i in (1,1,4) do (set bumb%%i=)
if "!backupmenucurrent!"=="2" (if !backedupcount! lss 2 (if "%wmodetoggle%"=="true" (set bumb2=%clr%[107m[48;2;180;180;180m) else (set bumb2=%clr%%clrgra%)) else (set bumb2=%clr%)) else (set bumb!backupmenucurrent!=%clr%)
)))
if "%cursorbackupexit%"=="true" (setlocal disabledelayedexpansion & call :cursorchange_main_backup_exit & cls & exit /b) else (set /p nothing=[0;0HLag spike :3<nul& goto :Cursor_Changer_REmenu_loop)

:cursorchange_main_backup_Core
rem Processing of Confirm key, like Y and E.
if "!backupmenucurrent!"=="0" (set backupmenucurrent=1& exit /b)
if "!backupmenucurrent!"=="1" (call :Cursor_Backupper)
if "!backupmenucurrent!"=="2" ( if !backedupcount! lss 2 (exit /b)
    for /l %%i in (4,1,12) do (set /p nothing=[%%i;12H                                                      <nul)
    set /p nothing=[3;35H=[11;11HI[11;66HI<nul
    echo [5;13H –{“–‚ÉŒ»İ‚ÌƒoƒbƒNƒAƒbƒv‚ğíœ‚µ‚Ü‚·‚©H<nul
    echo [7;13H %clrgra%^(Y ‚Ü‚½‚Í N^)%clr2%<nul
    choice /c YNB /n >nul
    if !ErrorLevel!==1 (
        for /l %%i in (4,1,12) do (set /p nothing=[%%i;12H                                                      <nul)
        echo [5;13H ƒoƒbƒNƒAƒbƒv‚ğíœ‚µ‚Ä‚¢‚Ü‚·...<nul
        set backedupcount=0 & call :Cursor_Buckupper_Delete
        for /l %%i in (4,1,12) do (set /p nothing=[%%i;12H                                                      <nul)
        echo [5;13H íœ‚³‚ê‚Ü‚µ‚½I<nul
        timeout /t 2 /nobreak >nul
        exit /b
        ) else (exit /b)
    )
if "!backupmenucurrent!"=="3" (set cursorbackupexit=true& exit /b)
exit /b


:cursorchange_main_backup_exit
for /l %%i in (1,1,4) do (set bumb%%i=)
set backupmenucurrent=& set cursorbackupexit=& set backedupcount=
cls & exit /b




:Cursor_Backupper
set REGISTRY_KEY="HKEY_CURRENT_USER\Control Panel\Cursors"
for /l %%i in (4,1,12) do (set /p nothing=[%%i;12H                                                      <nul)
if not defined dummy (
set /p nothing=[3;35H=[11;11HI[11;66HI<nul
echo [5;13H ˆÈ‰º‚©‚ç‘I‘ğ‚µ‚Ä‚­‚¾‚³‚¢ :
echo [7;13H 1 : ƒJ[ƒ\ƒ‹‚ğƒoƒbƒNƒAƒbƒv & if "%backedupcount%" geq "2" (echo [7;42H%clrgra%^(Šù‘¶‚Ìƒf[ƒ^‚Éã‘‚«^)%clr2%<nul)
echo [9;13H 2 : ƒoƒbƒNƒAƒbƒv‚ğ“Ç‚İ‚Ş
echo [11;13H %clrgra%[1~2] ‚Å‘I‘ğAB ‚ÅƒLƒƒƒ“ƒZƒ‹%clr2%
)
choice /c 12bn /n >nul
if %ErrorLevel%==1 (goto :Cursor_Backupper_Save)
if %ErrorLevel%==2 (goto :Cursor_Backupper_Restore)
if %Errorlevel% geq 3 if %Errorlevel% leq 4 (set REGISTRY_KEY= & exit /b)
exit /b

:Cursor_Backupper_Save
rem Initialize the output file if it exists
for /l %%i in (4,1,12) do (set /p nothing=[%%i;12H                                                      <nul)
if not defined dummy (echo [5;13H "%FirstSTFsfile%"‚ÉƒoƒbƒNƒAƒbƒv‚µ‚Ä‚¢‚Ü‚·...)
if exist "%FirstSTFsfile%" (call :Cursor_Buckupper_Delete)
set count=0
rem Loop through the registry keys and save them to the output file
for /f "tokens=1,*" %%A in ('reg query %REGISTRY_KEY% 2^>nul ^| findstr /V "HKEY_CURRENT_USER\\Control Panel\\Cursors"') do (
    set "FullName=%%A" & set "TypeAndValue=%%B"
    if not "!TypeAndValue!"=="" if not "!FullName!"=="Control" ( set /a Count+=1 & rem < Count loop
        set "FullName=!FullName: =_!"
        rem Parse the type and value from the registry key
        for /f "tokens=1,2,*" %%X in ("!TypeAndValue!") do (
            set "FirstToken=%%X" & set "SecondToken=%%Y" & set "RemainingTokens=%%Z"
            if "!FirstToken:~0,4!"=="REG_" ( set "Type=!FirstToken!" & set "Value=!SecondToken! !RemainingTokens!"
            ) else ( set "FullName=!FullName!_!FirstToken!" & set "Type=!SecondToken!" & set "Value=!RemainingTokens!")
        )

        rem Clean up the value string
        set "Value=!Value:~0!" & set "Value=!Value:"='!"
        if "!Value:~0,1!"=="""" (set "Value=!Value:~1,-1!")
        if "!Value:~-1!"==" " set "Value=!Value:~0,-1!"

        rem Save as CursorValue_Default if Type is REG_SZ
        if "!Type!"=="REG_SZ" ( echo CursorValue_Default="!Value!" >> "%FirstSTFsfile%"
        ) else ( if not "!FullName!"=="CursorValue_Default" (
                echo CursorValue_!Count!_!FullName!="!Type!","!Value!" >> "%FirstSTFsfile%"
            )
        )
    )
)
for /l %%i in (4,1,12) do (set /p nothing=[%%i;12H                                                      <nul)
if not defined dummy (echo [5;13H "%FirstSTFsfile%"‚ÉƒoƒbƒNƒAƒbƒv‚³‚ê‚Ü‚µ‚½B)
if not defined dummy (echo [7;13H %clrgra%^(‰½‚©ƒL[‚ğ‰Ÿ‚µ‚Ä‘±s...^)%clr2%& pause >nul)
set backedupcount=%count%
call :Cursor_Backupper_Exit & exit /b

:Cursor_Backupper_Restore
rem Check if there are at least 2 values to restore
if not "%1"=="Dynamic" (
if %backedupcount% lss 2 (
    for /l %%i in (4,1,12) do (set /p nothing=[%%i;12H                                                      <nul)
    if not defined dummy (echo [5;13H “Ç‚İ‚Ş‚É‚ÍÅ’á‚Å‚à2‚Â‚ÌƒoƒbƒNƒAƒbƒvƒf[ƒ^‚ª•K—v‚Å‚·I)
    if not defined dummy (echo [7;13H %clrgra%^(‰½‚©ƒL[‚ğ‰Ÿ‚µ‚Ä‘±s...^)%clr2%& pause >nul)
    call :Cursor_Backupper_Exit & exit /b
)
)

rem Restore the registry keys from the output file
if not "%1"=="Dynamic" (
for /l %%i in (4,1,12) do (set /p nothing=[%%i;12H                                                      <nul)
if not defined dummy (echo [5;13H "%FirstSTFsfile%"‚©‚çƒJ[ƒ\ƒ‹‚ğ“Ç‚İ‚ñ‚Å‚¢‚Ü‚·...)
)
for /f "usebackq tokens=1,* delims==" %%A in ("%FirstSTFsfile%") do (
    set "line=%%B" & set "line=!line:'="!"
    rem Parse the type and value from the output file
    for /f "tokens=1,2 delims=," %%B in ("!line!") do (
        set "Type=%%B" & set "Value=%%C"
        set "Type=!Type:~1,-1!" & set "Value=!Value:~1,-1!"
        if "!Value!"=="""" (set "Value=") else (set "Value=!Value:~0,-1!")

        rem Add the registry key back to the registry
        if "%%A"=="CursorValue_Default" ( set "Type=!Type:"=!"
            reg add %REGISTRY_KEY% /ve /f /d "!Type!" >nul 2>&1
        ) else (
            for /f "tokens=2,* delims=_" %%D in ("%%A") do (
                set "Name=%%E" & set "Name=!Name:_= !"
                if "!Type!"=="REG_DWORD" ( set "Value=!Value: =!"
                    reg add %REGISTRY_KEY% /v "!Name!" /t !Type! /f /d !Value! >nul 2>&1
                ) else ( reg add %REGISTRY_KEY% /v "!Name!" /t !Type! /f /d "!Value!" >nul 2>&1)
            )
        )
    )
)
if not "%1"=="Dynamic" (
for /l %%i in (4,1,12) do (set /p nothing=[%%i;12H                                                      <nul)
if not defined dummy (echo [5;13H ƒJ[ƒ\ƒ‹‚ğXV’†...<nul)
call :Powersheller RefreshCursor
for /l %%i in (4,1,12) do (set /p nothing=[%%i;12H                                                      <nul)
if not defined dummy (echo [5;13H “Ç‚İ‚İ‚É¬Œ÷‚µ‚Ü‚µ‚½B)
if not defined dummy (echo [7;13H %clrgra%^(‰½‚©ƒL[‚ğ‰Ÿ‚µ‚Ä‘±s...^)%clr2%& pause >nul)
)
call :Cursor_Backupper_Exit & exit /b


:Cursor_Buckupper_Delete
powershell -command "(Get-Content -Path '%FirstSTFsfile%' | Where-Object {$_ -notmatch '^CursorValue_(Default|\d+_.+)=.+$'}) | Set-Content -Path '%FirstSTFsfile%'"
exit /b

:Cursor_Backupper_Exit
rem Clear all the variables used
set FullName=& set TypeAndValue=& set FirstToken=& set SecondToken=& set RemainingTokens=& set Type=& set Value=& set line=& set Name=& set Count=
setlocal disabledelayedexpansion
exit /b



:Dogcheck
rem dogcheck, respect tobyfox and dog
if "%wmodetoggle%"=="false" (set c=[7m&set c2=[0m)
if "%wmodetoggle%"=="true" (set c=[100m[97m&set c2=[0m[107m[30m)
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| Dogcheck 
mode con: cols=87 lines=9
echo '########:::'#######:::'######:::::::'######::'##::::'##:'########::'######::'##:::'##:
echo ##.... ##:'##.... ##:'##... ##:::::'##... ##: ##:::: ##: ##.....::'##... ##: ##::'##:::
echo ##:::: ##: ##:::: ##: ##:::..:::::: ##:::..:: ##:::: ##: ##::::::: ##:::..:: ##:'##::::
echo ##:::: ##: ##:::: ##: ##::'####:::: ##::::::: #########: ######::: ##::::::: #####:::::
echo ##:::: ##: ##:::: ##: ##::: ##::::: ##::::::: ##.... ##: ##...:::: ##::::::: ##. ##::::
echo ##:::: ##: ##:::: ##: ##::: ##::::: ##::: ##: ##:::: ##: ##::::::: ##::: ##: ##:. ##:::
echo ########::. #######::. ######::::::. ######:: ##:::: ##: ########:. ######:: ##::. ##::
echo ........::::.......::::......::::::::......:::..:::::..::........:::......:::..::::..::
start https://www.youtube.com/watch?v=kO77pZFJp1o
timeout /t 2 /nobreak >nul
cls
mode con: cols=85 lines=24
set dogcheckcount=0
:dogcheckanimation0f
set /a dogcheckcount=dogcheckcount+1
if %dogcheckcount% gtr 5 if %dogcheckcount% lss 7 (title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| Dogcheck respect tobyfox)
if %dogcheckcount% gtr 8 (title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| Dogcheck)
if %dogcheckcount% gtr 30 if %dogcheckcount% lss 32 (title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| dogrune chapter 1)
if %dogcheckcount% gtr 33 (title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| Dogcheck)
echo.
echo.
echo                     %c%                              %c2%
echo              %c%                                            %c2%
echo           %c%                                                         %c2%
echo           %c%         %c2%   %c%       %c2%   %c%                                   %c2%
echo        %c%            %c2%   %c%       %c2%   %c%                                      %c2%
echo        %c%            %c2%   %c%          %c2%   %c%                                   %c2%
echo        %c%            %c2%   %c%    %c2%         %c%          %c2%   %c%                      %c2%
echo        %c%                   %c2%         %c%          %c2%   %c%                      %c2%
echo     %c%               %c2%   %c%    %c2%   %c%   %c2%   %c%          %c2%      %c%                   %c2%
echo        %c%            %c2%   %c%    %c2%   %c%   %c2%   %c%          %c2%      %c%                   %c2%
echo        %c%            %c2%   %c%          %c2%   %c%             %c2%   %c%                   %c2%
echo           %c%                   %c2%   %c%          %c2%         %c%                         %c2%
echo           %c%                   %c2%   %c%          %c2%         %c%                         %c2%
echo        %c%                                         %c2%   %c%                %c2%      %c%            %c2%
echo.
echo.
timeout /t 1 /nobreak >nul
cls
goto :dogcheckanimation1f

:dogcheckanimation1f
echo.
echo.
echo.
echo              %c%                                            %c2%
echo           %c%                                                         %c2%
echo           %c%         %c2%   %c%       %c2%   %c%                                   %c2%
echo        %c%            %c2%   %c%       %c2%   %c%                                      %c2%
echo        %c%            %c2%   %c%          %c2%   %c%                                   %c2%
echo        %c%            %c2%   %c%    %c2%         %c%             %c2%   %c%                   %c2%
echo        %c%                   %c2%         %c%             %c2%   %c%                   %c2%
echo     %c%               %c2%   %c%    %c2%   %c%   %c2%   %c%             %c2%      %c%                %c2%      %c%   %c2%
echo        %c%            %c2%   %c%    %c2%   %c%   %c2%   %c%             %c2%      %c%                %c2%      %c%   %c2%
echo        %c%            %c2%   %c%          %c2%   %c%                   %c%                %c2%      %c%   %c2%
echo           %c%                   %c2%   %c%             %c2%         %c%                      %c2%
echo           %c%                   %c2%   %c%             %c2%         %c%                      %c2%
echo        %c%                                            %c2%   %c%             %c2%
echo.
echo.
timeout /t 1 /nobreak >nul
cls
goto :dogcheckanimation0f
call :exit 0



:Uninstall
if "%settinghelptoggle%"=="true" (goto :uninstallhelp)
cd /d %batchmainpath% 
find "nodogcheckfor1234567890qwertyuiop" %Settingsfile% >nul
cls
if exist %Settingsfile% call :UninstallMenu & exit /b
if not exist %Settingsfile% goto :Dogcheck
exit /b

:UninstallMenu
cls
mode con: cols=75 lines=22
rem GUI type 3
rem Preparing of Menu and Variables
if not defined dummy (set clr=[7m&set clrgra=[90m&set clrwhi=[97m&set clr2=[0m)
if "%wmodetoggle%"=="false" (set clr=[7m&set clrgra=[90m&set clrwhi=[97m&set clr2=[0m)
if "%wmodetoggle%"=="true" (set clr=[100m[97m&set clrgra=[107m[38;2;140;140;140m&set clrwhi=[30m&set clr2=[90m[107m[30m)
set UMsel=0
:UninstallMenu_main
rem Draw Update Available UI
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹ƒƒjƒ…[
if not defined dummy (set /p nothing=[0;0H[?25l%clr2%<nul)
if "%UMexit%"=="true" (goto :UninstallMenu_exit)
echo.
echo                          ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹ƒƒjƒ…[
echo                       O=============================O
call :UninstallMenu_Textdraw
echo                   O======================================O
echo                   I%UMcb1%    ƒJ[ƒ\ƒ‹‘Ö‚¦‚ÌƒAƒ“ƒCƒ“ƒXƒg[ƒ‹    %clr2%I
echo                   O======================================O
echo                   I%UMcb2%     ƒJ[ƒ\ƒ‹‘Ö‚¦‚Ìƒtƒ@ƒCƒ‹‚ÌŠÇ—     %clr2%I
echo                   O======================================O
echo                   I%UMcb3%   ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹ƒƒjƒ…[‚©‚ç‘Şo   %clr2%I
echo                   O======================================O
echo.
echo        %clrgra%W,S ‚Ü‚½‚Í 1~3 ‚Å ˆÚ“®A Y ‚Ü‚½‚Í E ‚Å‘I‘ğA B ‚Ü‚½‚Í N ‚Å‘Şo%clr2%
choice /c 123WSYEBN /n >nul
rem Processing of each move
if %Errorlevel%==8 (set UMexit=true) else if %Errorlevel%==9 (set UMexit=true)
if %Errorlevel% geq 1 if %Errorlevel% leq 3 (set UMsel=%Errorlevel%)
if %UMsel%==0 (set UMsel=1& set UMcb1=%clr%& goto :UninstallMenu_main)
if %ErrorLevel%==4 (if not %UMsel%==1 (set /a UMsel-=1))
if %ErrorLevel%==5 (if not %UMsel%==3 (set /a UMsel+=1))
if %Errorlevel% geq 6 if %Errorlevel% leq 7 (call :UninstallMenu_Core)
set UMcb1=& set UMcb2=& set UMcb3=& set UMcb%UMsel%=%clr%& goto :UninstallMenu_main

:UninstallMenu_Core
rem Processing of Confirm key, like Y and E.
set /p nothing=%clr2%<nul
if %UMsel%==1 (call :UninstallMenu_Uninstall & cls & exit /b)
if %UMsel%==2 (call :UninstallMenu_Management & cls & exit /b)
if %UMsel%==3 (set UMexit=true& exit /b)

:UninstallMenu_exit
rem initialize of variable
set UMexit=& set UMsel=& set UMcb1=& set UMcb2=& set UMcb3=
if not defined dummy (set /p nothing=[?25h<nul)
cls
mode con: cols=75 lines=25
if "%Uninstall_Shutdown%"=="true" (set Uninstall_Shutdown=& call :exit 1) else (exit /b)

:UninstallMenu_Textdraw
rem Drew texts
for /l %%i in (6,1,12) do (set /p nothing=[%%i;0H[0K<nul)
if not defined dummy (set /p nothing=[6;0H<nul)
if "%UMsel%"=="0" (
echo                     %clrwhi%ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹ƒƒjƒ…[‚Ö‚æ‚¤‚±‚»B%clr2%
echo.
echo        ‚±‚Ìƒƒjƒ…[‚Å‚ÍƒAƒ“ƒCƒ“ƒXƒg[ƒ‹ŠÖ˜A‚Ì‹@”\‚ÉƒAƒNƒZƒX‚Å‚«‚Ü‚·B
echo                      g—p‚µ‚½‚¢‹@”\‚ğ‘I‘ğ‚µ‚Ä‚­‚¾‚³‚¢B
echo.
echo             %clrgra%Œ»İ‚Í‰½‚à‘I‘ğ‚³‚ê‚Ä‚¢‚Ü‚¹‚ñB‰½‚©‘I‘ğ‚µ‚Ä‚­‚¾‚³‚¢B%clr2%
) else if "%UMsel%"=="1" (
echo                         %clrwhi%ƒJ[ƒ\ƒ‹‘Ö‚¦‚ÌƒAƒ“ƒCƒ“ƒXƒg[ƒ‹%clr2%
echo.
echo  ‚±‚Ì‹@”\‚Å‚Í‚±‚Ìƒoƒbƒ`ƒtƒ@ƒCƒ‹ ^(ƒJ[ƒ\ƒ‹‘Ö‚¦^) ‚ğƒAƒ“ƒCƒ“ƒXƒg[ƒ‹‚Å‚«‚Ü‚·B
echo                ‚¢‚­‚Â‚©‚ÌƒIƒvƒVƒ‡ƒ“‚à‚±‚Ì‹@”\‚Å—˜—p‰Â”\‚Å‚·B
) else if "%UMsel%"=="2" (
echo                         %clrwhi%ƒJ[ƒ\ƒ‹‘Ö‚¦‚Ìƒtƒ@ƒCƒ‹‚ÌŠÇ—%clr2%
echo.
echo           ‚±‚Ì‹@”\‚Å‚ÍƒJ[ƒ\ƒ‹‘Ö‚¦‚Ìİ’èƒtƒ@ƒCƒ‹‚È‚Ç‚ğŠÇ—‚Å‚«‚Ü‚·B
echo              —á‚Æ‚µ‚Ä%Settingsfile%‚âA%FirstSTFsfile%‚Å‚·B
) else if "%UMsel%"=="3" (
echo                      %clrwhi%ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹ƒƒjƒ…[‚©‚ç‘Şo%clr2%
echo.
echo             ‰½‚à‚¹‚¸‚ÉƒAƒ“ƒCƒ“ƒXƒg[ƒ‹ƒƒjƒ…[‚©‚ç‘Şo‚µ‚Ü‚·B
)
if not defined dummy (set /p nothing=[13;0H<nul)
exit /b

:UninstallMenu_Management
cls
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ƒtƒ@ƒCƒ‹‚ÌŠÇ—
echo ƒJ[ƒ\ƒ‹‘Ö‚¦‚Ìƒtƒ@ƒCƒ‹‚ÌŠÇ—
echo.
echo ‚±‚Ì‹@”\‚Å‚ÍAƒJ[ƒ\ƒ‹‘Ö‚¦‚Ìƒtƒ@ƒCƒ‹‚ğ‰{——‚µ‚½‚èŠJ‚­‚±‚Æ‚ª‚Å‚«‚Ü‚·B
echo ˆÈ‰º‚Ì‹@”\‚©‚ç‘I‘ğ‚µ‚Ä‚­‚¾‚³‚¢B
echo.
echo 1 : %Settingsfile%‚ğƒƒ‚’ ‚ÅŠJ‚­
echo 2 : %FirstSTFsfile%‚ğƒƒ‚’ ‚ÅŠJ‚­
echo 3 : ƒtƒ@ƒCƒ‹‚ğ‚ª’u‚©‚ê‚Ä‚¢‚éêŠ‚ğƒGƒNƒXƒvƒ[ƒ‰[‚ÅŠJ‚­
echo 4 : İ’èƒtƒ@ƒCƒ‹‚ğ‰Šú‰»‚·‚é
echo 5 : ‚±‚Ì‹@”\‚©‚ç‘Şo‚·‚é
echo.
set /p selected=“ü—Í :
if "%selected%"=="1" (call :UninstallMenu_Management_OpenSetting_inNotepad)
if "%selected%"=="2" (call :UninstallMenu_Management_OpenFSTFSF_inNotepad)
if "%selected%"=="3" (call :UninstallMenu_Management_OpenSetting)
if "%selected%"=="4" (call :UninstallMenu_Management_InitializeSetting)
if "%selected%"=="5" (exit /b)
if "%selected%"=="b" (exit /b)
if "%selected%"=="n" (exit /b)
goto :UninstallMenu_Management

:UninstallMenu_Management_OpenSetting_inNotepad
cls
echo İ’èƒtƒ@ƒCƒ‹‚ğŠJ‚¢‚Ä‚¢‚Ü‚·...
start notepad.exe %Settingsfile%
timeout /t 1 /nobreak >nul
exit /b

:UninstallMenu_Management_OpenFSTFSF_inNotepad
cls
echo FistSTFs ƒtƒ@ƒCƒ‹‚ğŠJ‚¢‚Ä‚¢‚Ü‚·...
start notepad.exe %FirstSTFsfile%
timeout /t 1 /nobreak >nul
exit /b

:UninstallMenu_Management_OpenSetting
cls
echo ƒtƒ@ƒCƒ‹‚ª’u‚©‚ê‚Ä‚¢‚éƒpƒX‚ğŠJ‚¢‚Ä‚¢‚Ü‚·...
start explorer %batchmainpath%
timeout /t 2 /nobreak >nul
exit /b


:UninstallMenu_Management_InitializeSetting
cls
echo ‚±‚Ì‹@”\‚Å‚Íİ’è‚ğ‰Šú‰»‚µ‚Ü‚·B (İ’è‚Ì’l‚ğƒfƒtƒHƒ‹ƒg‚Ì’l‚É–ß‚·)
echo ‚ ‚È‚½‚ª¡‚Ü‚Åİ’è‚µ‚½•¨‚Í‚·‚×‚Ä‰Šú‰»‚³‚êAŒ³‚Ì’l‚É–ß‚è‚Ü‚·B
echo –{“–‚É‰Šú‰»‚µ‚Ü‚·‚©H (Y ‚Ü‚½‚Í N)
choice /c yn /n /m ""
if %ErrorLevel%==1 goto :UninstallMenu_Management_InitializeSetting_ask
if %ErrorLevel%==2 goto :UninstallMenu_Management_InitializeSetting_ask_no
cls
goto :UninstallMenu_Management_InitializeSetting

:UninstallMenu_Management_InitializeSetting_ask
echo –{“–‚É‚æ‚ë‚µ‚¢‚Å‚·‚©H (Y ‚Ü‚½‚Í N)
choice /c yn /n /m ""
if %ErrorLevel%==1 goto :UninstallMenu_Management_InitializeSetting_ask_yes
if %ErrorLevel%==2 goto :UninstallMenu_Management_InitializeSetting_ask_no
cls
goto :UninstallMenu_Management_InitializeSetting_ask

:UninstallMenu_Management_InitializeSetting_ask_yes
echo İ’è‚ğ‰Šú‰»‚µ‚Ü‚·B’l‚Í‚·‚×‚ÄƒfƒtƒHƒ‹ƒg‚Ì’l‚É‚È‚è‚Ü‚·B
echo ƒLƒƒƒ“ƒZƒ‹‚µ‚½‚¢ê‡‚ÍA‚±‚Ì“_‚ÅƒJ[ƒ\ƒ‹‘Ö‚¦‚ğI—¹‚µ‚Ä‚­‚¾‚³‚¢B
pause
cls
call :Wipealldeta
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| İ’è‚Ì‰Šú‰»‚ªŠ®—¹‚µ‚Ü‚µ‚½
echo ‰Šú‰»‚ªŠ®—¹‚µ‚Ü‚µ‚½B•ÏX‚ğ”½‰f‚·‚é‚½‚ßAƒJ[ƒ\ƒ‹‘Ö‚¦‚ğÄ‹N“®‚µ‚Ü‚·B‰½‚©ƒL[‚ğ‰Ÿ‚µ‚ÄÄ‹N“®...
pause >nul
set UMexit=& set UMsel=& set UMcb1=& set UMcb2=& set UMcb3=& set clrgra=& set Uninstall_Shutdown=
call :rebootbatch
exit /b

:UninstallMenu_Management_InitializeSetting_ask_no
cls
echo İ’è‚Í‰Šú‰»‚³‚ê‚Ü‚¹‚ñ‚Å‚µ‚½B
pause
exit /b


:UninstallMenu_Uninstall
cls
mode con: cols=72 lines=21
rem GUI type 3
rem Preparing of Menu and Variables
if not defined dummy (set clr=[7m&set clrgra=[90m&set clrwhi=[97m&set clr2=[0m)
if "%wmodetoggle%"=="false" (set clr=[7m&set clrgra=[90m&set clrwhi=[97m&set clr2=[0m)
if "%wmodetoggle%"=="true" (set clr=[100m[97m&set clrgra=[107m[38;2;140;140;140m&set clrwhi=[30m&set clr2=[90m[107m[30m)
set UMUsel=0& set backedupcount=0
for /f "usebackq tokens=1,* delims==" %%A in ("%FirstSTFsfile%") do (
    if "%%A"=="CursorValue_Default" (set /a backedupcount+=1) else (
        for /f "tokens=2,* delims=_" %%D in ("%%A") do (set /a backedupcount+=1)
    )
)

:UninstallMenu_Uninstall_main
rem Draw Update Available UI
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ƒJ[ƒ\ƒ‹‘Ö‚¦‚ÌƒAƒ“ƒCƒ“ƒXƒg[ƒ‹
if not defined dummy (set /p nothing=[0;0H[?25l%clr2%<nul)
if "%UMUexit%"=="true" (goto :UninstallMenu_Uninstall_exit)
if not %backedupcount% geq 2 (if defined UMUcb2 (if "%wmodetoggle%"=="true" (set clrgra=[107m[48;2;180;180;180m) else (set clrgra=[90m))) else (set clrgra=)
echo.
echo                       ƒJ[ƒ\ƒ‹‘Ö‚¦‚ÌƒAƒ“ƒCƒ“ƒXƒg[ƒ‹
echo.
echo.          O==================================================O
echo           I                                                  I
echo           I          ƒJ[ƒ\ƒ‹‘Ö‚¦‚ÌƒAƒ“ƒCƒ“ƒXƒg[ƒ‰[        I
echo           I                                                  I
if not defined dummy (echo           I[50CI)
if not defined dummy (echo           I[50CI)
echo           I                                                  I
echo           I   O==========================================O   I
echo           I   I%UMUcb1%           ’Êí‚ÌƒAƒ“ƒCƒ“ƒXƒg[ƒ‹         %clr2%I   I
echo           I   O==========================================O   I
echo           I   I%UMUcb2%%clrgra%  ƒAƒCƒ“ƒCƒ“ƒXƒg[ƒ‹•ƒJ[ƒ\ƒ‹‚ğ•œŒ³‚·‚é  %clr2%I   I
echo           I   O==========================================O   I
echo           I                                                  I
echo           O==================================================O
echo.
if not defined dummy (set clrgra=[90m) & if "%wmodetoggle%"=="false" (set clrgra=[90m) & if "%wmodetoggle%"=="true" (set clrgra=[107m[38;2;140;140;140m)
echo      %clrgra%W,S ‚Ü‚½‚Í 1~2 ‚Å ˆÚ“®A Y ‚Ü‚½‚Í E ‚Å‘I‘ğA B ‚Ü‚½‚Í N ‚Å‘Şo%clr2%
echo.
call :UninstallMenu_Uninstall_Textdraw
choice /c 12WSYEBN /n >nul
rem Processing of each move
if %Errorlevel%==7 (set UMUexit=true) else if %Errorlevel%==8 (set UMUexit=true)
if %Errorlevel% geq 1 if %Errorlevel% leq 2 (set UMUsel=%Errorlevel%)
if %UMUsel%==0 (set UMUsel=1& set UMUcb1=%clr%& goto :UninstallMenu_Uninstall_main)
if %ErrorLevel%==3 (if %UMUsel%==2 (set UMUsel=1))
if %ErrorLevel%==4 (if %UMUsel%==1 (set UMUsel=2))
if %Errorlevel% geq 5 if %Errorlevel% leq 6 (call :UninstallMenu_Uninstall_Core)
set UMUcb1=& set UMUcb2=& set UMUcb%UMUsel%=%clr%& goto :UninstallMenu_Uninstall_main

:UninstallMenu_Uninstall_Core
rem Processing of Confirm key, like Y and E.
set /p nothing=%clr2%<nul
if %UMUsel%==1 (call :UninstallMenu_Uninstall_Confirm 1 & cls & exit /b)
if %UMUsel%==2 (call :UninstallMenu_Uninstall_Confirm 2 & cls & exit /b)

:UninstallMenu_Uninstall_exit
rem initialize of variable
set UMUexit=& set UMUsel=& set UMUcb1=& set UMUcb2=
mode con: cols=75 lines=22
exit /b

:UninstallMenu_Uninstall_Textdraw
for /l %%i in (8,1,9) do (set /p nothing=[%%i;12H                                                  <nul)
if %UMUsel%==0 (set /p nothing=[8;12H‚Ç‚Ì‚æ‚¤‚ÉƒAƒ“ƒCƒ“ƒXƒg[ƒ‹‚·‚é‚©‚ğ‘I‘ğ‚µ‚Ä‚­‚¾‚³‚¢[9;23HB ‚Ü‚½‚Í N ‚ÅƒLƒƒƒ“ƒZƒ‹‚µ‚Ü‚·B<nul)
if %UMUsel%==1 (set /p nothing=[8;20HƒJ[ƒ\ƒ‹‘Ö‚¦‚ğƒAƒ“ƒCƒ“ƒXƒg[ƒ‹‚µ‚Ü‚·B[9;23Hİ’èƒtƒ@ƒCƒ‹“™‚Æ©g‚ğÁ‚µ‚Ü‚·B<nul)
if %UMUsel%==2 (set /p nothing=[8;22HƒJ[ƒ\ƒ‹‘Ö‚¦‚ğƒAƒ“ƒCƒ“ƒXƒg[ƒ‹‚µA[9;20HƒoƒbƒNƒAƒbƒv‚©‚çƒJ[ƒ\ƒ‹‚ğ•œŒ³‚µ‚Ü‚·B<nul)
if not defined dummy (set /p nothing=[22;0H<nul)
exit /b

:UninstallMenu_Uninstall_isCursorSaved
if %backedupcount% geq 2 (exit /b 0)
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ‚±‚Ì‹@”\‚ÍÀ‘•‚³‚ê‚Ä‚¢‚Ü‚¹‚ñI
echo.
echo                       ƒJ[ƒ\ƒ‹‘Ö‚¦‚ÌƒAƒ“ƒCƒ“ƒXƒg[ƒ‹ 
echo.
echo         O======================================================O     
echo         I                                                      I
echo         I         ƒJ[ƒ\ƒ‹‚ªƒoƒbƒNƒAƒbƒv‚³‚ê‚Ä‚¢‚Ü‚¹‚ñI       I
echo         I                                                      I
echo         I       ‚±‚Ì‹@”\‚ğg‚¤‚É‚ÍƒoƒbƒNƒAƒbƒv‚ª•K—v‚Å‚·B     I
echo         I    ƒoƒbƒNƒAƒbƒv‚·‚é‚©A‘¼‚Ì‹@”\‚ğ—˜—p‚µ‚Ä‚­‚¾‚³‚¢B  I
echo         I                                                      I
echo         I               %clrgra%(‰½‚©ƒL[‚ğ‰Ÿ‚µ‚Ä‘Şo...)%clr2%              I
echo         I                                                      I
echo         O======================================================O
echo.
pause >nul
exit /b 1


:UninstallMenu_Uninstall_Confirm
cls
mode con: cols=72 lines=21
if "%1"=="2" (call :UninstallMenu_Uninstall_isCursorSaved)
if not "%errorlevel%"=="1" (set Uninstall_way=%1) else (exit /b)
rem GUI type 3
rem Preparing of Menu and Variables
if not defined dummy (set clr=[7m&set clrgra=[90m&set clrwhi=[97m&set clred=[91m&set clr2=[0m)
if "%wmodetoggle%"=="false" (set clr=[7m&set clrgra=[90m&set clrwhi=[97m&set clred=[91m&set clr2=[0m)
if "%wmodetoggle%"=="true" (set clr=[100m[97m&set clrgra=[107m[38;2;140;140;140m&set clrwhi=[30m&set clred=[91m&set clr2=[90m[107m[30m)
set UOCsel=0
:UninstallMenu_Uninstall_Confirm_main
rem Draw Update Available UI
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹‚ÌŠm”F
if not defined dummy (set /p nothing=[0;0H[?25l%clr2%<nul)
if "%UOCexit%"=="true" (goto :UninstallMenu_Uninstall_Confirm_exit)
if not "%UOCsel%"=="0" if not "%UOCsel%"=="1" (set UOCcb2=[48;2;214;174;174m[30m)
echo.
echo                       ƒJ[ƒ\ƒ‹‘Ö‚¦‚ÌƒAƒ“ƒCƒ“ƒXƒg[ƒ‹ 
echo.
echo         O======================================================O     
echo         I                                                      I
echo         I                 ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹‚ÌŠm”F               I
echo         I                                                      I
call :UninstallMenu_Uninstall_Confirm_DrawText
echo         I                                                      I
echo         I             O========O           %clred%O======O%clr2%            I
echo         I             I%UOCcb1% ‚¢‚¢‚¦ %clr2%I           %clred%I%clr2%%UOCcb2% ‚Í‚¢ %clr2%%clred%I%clr2%            I
echo         I             O========O           %clred%O======O%clr2%            I
echo         I                                                      I
echo         O======================================================O
echo.
echo      %clrgra%A,D ‚Ü‚½‚Í 1~2 ‚Å ˆÚ“®A Y ‚Ü‚½‚Í E ‚Å‘I‘ğA B ‚Ü‚½‚Í N ‚Å‘Şo%clr2%
choice /c 12ADYEBN /n >nul
rem Processing of each move
if %Errorlevel%==7 (if %UOCsel%==3 (set UOCsel=2) else (set UOCexit=true)) else if %Errorlevel%==8 (if %UOCsel%==3 (set UOCsel=2) else (set UOCexit=true))
if %Errorlevel% geq 1 if %Errorlevel% leq 2 (set UOCsel=%Errorlevel%)
if %UOCsel%==0 (set UOCsel=1& set UOCcb1=%clr%& goto :UninstallMenu_Uninstall_Confirm_main)
if %ErrorLevel%==3 (if %UOCsel%==1 (set UOCsel=1) else if %UOCsel%==2 (set UOCsel=1) else (set UOCsel=1))
if %ErrorLevel%==4 (if %UOCsel%==1 (set UOCsel=2) else if %UOCsel%==2 (set UOCsel=2) else (set UOCsel=2))
if %Errorlevel% geq 5 if %Errorlevel% leq 6 (call :UninstallMenu_Uninstall_Confirm_Core)
if not "%UOCsel%"=="2true" (set UOCcb1=& set UOCcb2=& set UOCcb%UOCsel%=%clr%) & goto :UninstallMenu_Uninstall_Confirm_main

:UninstallMenu_Uninstall_Confirm_Core
rem Processing of Confirm key, like Y and E.
set /p nothing=%clr2%<nul
if %UOCsel%==1 (set UOCexit=true)
if %UOCsel%==2 (set UOCsel=3) else if %UOCsel%==3 (goto :UninstallExecution)
exit /b

:UninstallMenu_Uninstall_Confirm_exit
rem initialize of variable
set UOCexit=& set UOCsel=& set UOCcb1=& set UOCcb2=& set clred=& set Uninstall_way=
exit /b

:UninstallMenu_Uninstall_Confirm_DrawText
if not "%UOCsel%"=="3" ( 
echo         I     –{“–‚ÉƒJ[ƒ\ƒ‹‘Ö‚¦‚ğƒAƒ“ƒCƒ“ƒXƒg[ƒ‹‚µ‚Ü‚·‚©H   I
echo         I    ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹‚µ‚½ê‡AÄ“xƒJ[ƒ\ƒ‹‘Ö‚¦‚ğ—˜—p  I
echo         I        ‚·‚é‚É‚ÍÄƒCƒ“ƒXƒg[ƒ‹‚ª•K—v‚É‚È‚è‚Ü‚·B      I
exit /b
) else if "%UOCsel%"=="3" (
echo         I                 %clrwhi%–{“–‚É‚æ‚ë‚µ‚¢‚Å‚·‚©H%clr2%               I
echo         I                                                      I
echo         I                                                      I
exit /b
)


:UninstallExecution
cls
echo.
echo                        ƒJ[ƒ\ƒ‹‘Ö‚¦‚ÌƒAƒ“ƒCƒ“ƒXƒg[ƒ‹ 
echo.
echo          O======================================================O     
echo          I                                                      I
echo          I   %clrgra%‰½‚©ƒL[‚ğ‰Ÿ‚µ‚ÄƒAƒ“ƒCƒ“ƒXƒg[ƒ‹...%clr2%                I
echo          I                                                      I
echo          I                                                      I
echo          I                                                      I
echo          O======================================================O
pause >nul
for /l %%i in (5,1,9) do (set /p nothing=[%%i;11H                                                      <nul)
if not defined dummy (set /p nothing=[6;13H ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹’†... [8;13H%clrgra%^(ƒJ[ƒ\ƒ‹‘Ö‚¦‚ğ•Â‚¶‚È‚¢‚Å‚­‚¾‚³‚¢I^)%clr2%<nul)
timeout /t 1 /nobreak >nul

rem ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹ƒƒjƒ…[‚Ì—áŠOˆ— ‰‰ñƒJ[ƒ\ƒ‹‚ª‚È‚¢ê‡‚ÌB‚¾‚¯‚Çç’·‚¾‚©‚ç‰ü‘P‚µ‚½‚¢B
rem —áŠOˆ—‚ğ‚à‚¤‚¿‚å‚Á‚Æ‘‚â‚µ‚½‚¢B—á‚¦‚ÎA’†g‚ğ‰ü‘¢‚µ‚È‚¢ŒÀ‚èâ‘Î‚É‚ ‚è‚¦‚È‚¢ó‘Ô‚É‚È‚Á‚½ê‡‚ÉAgoto‚µ‚Ä•Ï”‚Å•ªŠò‚µ‚ÄƒƒbƒZ[ƒW‚ğ•ÏX‚·‚é‚İ‚½‚¢‚É‚µ‚ÄB
cd /d %batchmainpath%
if not exist %FirstSTFsfile% if exist %Settingsfile% set erroruninstallwhatdelete=%FirstSTFsfile%& call :BSOD_Errors 3
if exist %FirstSTFsfile% if not exist %Settingsfile% set erroruninstallwhatdelete=%Settingsfile%& call :BSOD_Errors 3
if not exist %FirstSTFsfile% if not exist %Settingsfile% set "erroruninstallwhatdelete=%FirstSTFsfile%‚ÆA%Settingsfile%A‚»‚Ì—¼•û"& call :BSOD_Errors 3
goto :uninstallnow


:BSOD_Errors
if not defined dummy (set bsod_errors_clrforsad=[44m[7m&set bsod_errors_clrforsad2=[0m[48;2;0;61;146m[97m)
for /f "tokens=6 delims=.] " %%i in ('ver') do set bsodwinver=%%i
set runningfromfulldebug=& set FromREConsole=

rem message indication
timeout /t 1 /nobreak >nul
cls
if "%1"=="" (goto :BSOD_Errors_Error) else if "%1"=="BatBootErrorHandlerArgument1908??" (goto :BSOD_Errors_Error)
if "%2"=="" (set bsoderrorlevel=Undefined) else (set bsoderrorlevel=%2)
if "%1"=="THERE_IS_NO_PROBLEMS" (goto :BSOD_Errors_NOERRORS)
set DynamicWinverCheck=true& call :batbootcheckwinver dynamic & set DynamicWinverCheck=
if "%errorlevel%"=="1" (call :BSOD_Errors_OG %1) else (set /p nothing=[?25l<nul)
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ƒuƒ‹[ƒXƒNƒŠ[ƒ“I
mode con: cols=97 lines=25
rundll32 user32.dll,MessageBeep || echo 
if not defined dummy (set /p nothing=[97m[48;2;0;61;146m[2J<nul)
echo.
echo.
call :bsod_errors_RANDOMFACEHAHA
echo.
echo.
echo          ƒJ[ƒ\ƒ‹‘Ö‚¦‚ªƒNƒ‰ƒbƒVƒ…‚µ‚Ü‚µ‚½I
echo.
echo          ‚±‚Ì‰æ–Ê‚Í‰½‚ç‚©‚Ì——R‚ÅƒJ[ƒ\ƒ‹‘Ö‚¦‚ªƒNƒ‰ƒbƒVƒ…‚µ‚½Û‚É•\¦‚³‚ê‚Ü‚·B
echo          ƒTƒ|[ƒg‚ğ“¾‚éÛ‚É‚ÍˆÈ‰º‚Ìî•ñ‚ª–ğ‚É—§‚Â‚©‚à‚µ‚ê‚Ü‚¹‚ñ :
echo.
echo          ƒJ[ƒ\ƒ‹‘Ö‚¦ ƒo[ƒWƒ‡ƒ“ : %batver% (%batbuild%)
echo          Windows ƒrƒ‹ƒh”Ô†      : %bsodwinver%
echo          ƒGƒ‰[ID                : %1
echo          ƒGƒ‰[ƒŒƒxƒ‹            : %bsoderrorlevel%
echo.
echo          ‚±‚Ì‰æ–Ê‚É‚Â‚¢‚Ä‚ÌÚ×î•ñ‚ğ“¾‚éÛ‚É‚ÍˆÈ‰º‚ÌƒŠƒ“ƒN‚ÉƒAƒNƒZƒX‚µ‚Ä‚­‚¾‚³‚¢ (‰pŒê) :
echo.
echo          https://github.com/tamago1908/Cursor-Changer.bat/wiki/BSOD-Crash-(Error-Screen)
echo.

if %1 geq 0 if %1 leq 6 (goto :BSOD_Errors%1message) else (goto :BSOD_Errors_Error)


:BSOD_Errors0message
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"•s–¾Š‚Âd‘å‚ÈƒGƒ‰[‚ª”­¶‚µ‚Ü‚µ‚½I\", 'd‘å‚ÈƒGƒ‰[', 'OK', 'Warning');Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"ƒGƒ‰[‚ÌŠT—v : •s–¾Š‚Âd‘å‚ÈƒGƒ‰[‚ª”­¶‚µ‚Ü‚µ‚½B ƒGƒ‰[ID : 0\", 'ƒGƒ‰[', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"–w‚Ç‚Ìê‡A‚±‚ÌƒGƒ‰[‚ÍŠJ”­Ò‚É‚æ‚éd‘å‚Èƒ~ƒX‚ªŒ´ˆö‚Å‚·B(\•¶ƒGƒ‰[‚È‚Ç)\", 'ƒGƒ‰[', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"‚¨g‚¢‚ÌŠÂ‹«AƒAƒ“ƒ`ƒEƒBƒ‹ƒXƒ\ƒtƒgƒEƒFƒA“™‚ğŠm”FŒãAÄ“xƒGƒ‰[‚ª”­¶‚µ‚½ŒÂŠ‚Å‚â‚è’¼‚µ‚Ä‚­‚¾‚³‚¢B\", '‚Ç‚¤‚·‚ê‚Î‚¢‚¢H?', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"‚»‚ê‚Å‚àƒGƒ‰[‚ªŒp‘±‚·‚éê‡AGithub‚Ìissue‚É‚Ä•ñ‚µ‚Ä‚­‚¾‚³‚¢B\", 'ƒGƒ‰[', 'OK', 'None')"
goto :BSOD_ErrorsRorR

:BSOD_Errors1message
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"d‘å‚ÈƒGƒ‰[‚ª”­¶‚µ‚Ü‚µ‚½I\", 'd‘å‚ÈƒGƒ‰[', 'OK', 'Warning');Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"ƒGƒ‰[‚ÌŠT—v : d‘å‚ÈƒGƒ‰[‚ª”­¶‚µ‚Ü‚µ‚½B ƒGƒ‰[ID : 1\", 'Error', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"‚±‚ÌƒGƒ‰[‚Í—\Šú‚³‚ê‚Ä‚¢‚È‚¢Exit /b‚âA•s³‚ÈƒTƒuƒ‹[ƒ`ƒ“A‚à‚µ‚­‚Í‘¶İ‚µ‚Ä‚¢‚È‚¢ƒ‰ƒxƒ‹‚Ö‚ÌgotoAcall‚Å”­¶‚µ‚Ü‚·B\", 'Error', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"‚¨g‚¢‚ÌŠÂ‹«AƒAƒ“ƒ`ƒEƒBƒ‹ƒXƒ\ƒtƒgƒEƒFƒA“™‚ğŠm”FŒãAÄ“xƒGƒ‰[‚ª”­¶‚µ‚½ŒÂŠ‚Å‚â‚è’¼‚µ‚Ä‚­‚¾‚³‚¢B\", '‚Ç‚¤‚·‚ê‚Î‚¢‚¢H?', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"‚»‚ê‚Å‚àƒGƒ‰[‚ªŒp‘±‚·‚éê‡AGithub‚Ìissue‚É‚Ä•ñ‚µ‚Ä‚­‚¾‚³‚¢B\", 'ƒGƒ‰[', 'OK', 'None')"
goto :BSOD_ErrorsRorR

:BSOD_Errors2message
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"SAB_Manager‚ÅƒGƒ‰[‚ª”­¶‚µ‚Ü‚µ‚½I\", 'ƒGƒ‰[', 'OK', 'Warning');Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"ƒGƒ‰[‚ÌŠT—v : SAB_Manager‚ª“Ç‚İ‚Ü‚ê‚éÛ‚É•K—v‚Èwantload‚Ì’l‚ª—\Šú‚¹‚Ê’l‚Å‚µ‚½B%wantload% ƒGƒ‰[ID : 2\", 'Error', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"‚±‚ÌƒGƒ‰[‚Í”ñí‚É’¿‚µ‚¢‚Å‚·B‚½‚¾‚µAƒfƒoƒbƒO—p“r‚Ì‹@”\‚ğg—p‚µ‚½Û‚É”­¶‚·‚é‚±‚Æ‚ª‚ ‚è‚Ü‚·B\", 'Error', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"‚¨g‚¢‚ÌŠÂ‹«AƒAƒ“ƒ`ƒEƒBƒ‹ƒXƒ\ƒtƒgƒEƒFƒA“™‚ğŠm”FŒãAÄ“xƒGƒ‰[‚ª”­¶‚µ‚½ŒÂŠ‚Å‚â‚è’¼‚µ‚Ä‚­‚¾‚³‚¢B\", '‚Ç‚¤‚·‚ê‚Î‚¢‚¢H?', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"‚»‚ê‚Å‚àƒGƒ‰[‚ªŒp‘±‚·‚éê‡AGithub‚Ìissue‚É‚Ä•ñ‚µ‚Ä‚­‚¾‚³‚¢B\", 'ƒGƒ‰[', 'OK', 'None')"
goto :BSOD_ErrorsRorR

:BSOD_Errors3message
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹’†‚ÉƒGƒ‰[‚ª”­¶‚µ‚Ü‚µ‚½I\", 'ƒGƒ‰[', 'OK', 'Warning');Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"ƒGƒ‰[‚ÌŠT—v : ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹‚ÌÛ‚É‘¶İ‚µ‚Ä‚¢‚é‚×‚«ƒtƒ@ƒCƒ‹‚ª‘¶İ‚µ‚Ü‚¹‚ñ‚Å‚µ‚½I ƒGƒ‰[ID : 3\", 'Error', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"‚¨g‚¢‚ÌŠÂ‹«AƒAƒ“ƒ`ƒEƒBƒ‹ƒXƒ\ƒtƒgƒEƒFƒA“™‚ğŠm”FŒãAÄ“xƒGƒ‰[‚ª”­¶‚µ‚½ŒÂŠ‚Å‚â‚è’¼‚µ‚Ä‚­‚¾‚³‚¢B\", '‚Ç‚¤‚·‚ê‚Î‚¢‚¢H?', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"‚»‚ê‚Å‚àƒGƒ‰[‚ªŒp‘±‚·‚éê‡AGithub‚Ìissue‚É‚Ä•ñ‚µ‚Ä‚­‚¾‚³‚¢B\", 'ƒGƒ‰[', 'OK', 'None')"


:BSOD_Errors3message3message
cls
color 04
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"...‚Ü‚ŸAÀÛ‚É‚Í%erroruninstallwhatdelete%‚ğ‚ ‚È‚½‚ªíœ‚µ‚½‚Ì‚ªŒ´ˆö‚Å‚µ‚å‚¤‚ª... (‚à‚µ‚»‚¤‚È‚ç ‚Í‚¢ ‚ğA‚»‚¤‚Å‚È‚¢‚È‚ç ‚¢‚¢‚¦ ‚ğ‰Ÿ‚µ‚Ä‚­‚¾‚³‚¢)\", '', [System.Windows.Forms.MessageBoxButtons]::'Yesno', 'Question');exit $result;"
if "%errorlevel%"=="6" (goto :BSOD_Errors3message3messageok)
if "%errorlevel%"=="7" (goto :BSOD_Errors3message3messageno)
goto :BSOD_Errors3message3message

:BSOD_Errors3message3messageok
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"‚â‚Á‚Ï‚è‚Ë....\", '', 'OK', 'Error')
goto :BSOD_ErrorsRorR

:BSOD_Errors3message3messageno
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"‚¦‚Á........ –{“–‚É...H‚ÜA‚Ü‚ŸA‚à‚µ‰½‚à‚µ‚Ä‚¢‚È‚¢‚Ì‚É‚±‚ÌƒGƒ‰[‚ª”­¶‚µ‚½ê‡‚ÍA‚¨g‚¢‚ÌŠÂ‹«AƒAƒ“ƒ`ƒEƒBƒ‹ƒXƒ\ƒtƒgƒEƒFƒA“™‚ğŠm”FŒãAÄ“xƒGƒ‰[‚ª”­¶‚µ‚½ŒÂŠ‚Å‚â‚è’¼‚µ‚Ä‚­‚¾‚³‚¢B\", '', 'OK', 'Error');Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"‚»‚ê‚Å‚àƒGƒ‰[‚ªŒp‘±‚·‚éê‡AGithub‚Ìissue‚É‚Ä•ñ‚µ‚Ä‚­‚¾‚³‚¢B\", '', 'OK', 'ƒGƒ‰[')"
goto :BSOD_ErrorsRorR


:BSOD_Errors4message
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"‚¤‚í‚Ÿ‚ ‚ ‚ ‚ ‚ ‚ ‚ ‚ ‚ ‚ ‚ ‚ ‚ ‚ ‚ ‚ ‚ ‚ ‚ ‚ ‚ ‚ ‚ ‚ ‚ ‚ ‚ IIII\", '‚­‚­‚Ÿ‚—‚¹‚„‚’‚†‚”‚‡‚™‚Ó‚¶‚±‚Œ‚', 'OK', 'Warning');Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"ƒGƒ‰[‚ÌŠT—v : ƒeƒƒF‚Í‚à‚¤‚¨‚µ‚Ü‚¢‚¾‚Ÿ‚ ‚Ÿ‚Á‚Ÿ‚Ÿ‚Ÿ‚ÁIIIIIIII‚P‚P ƒGƒ‰[ID : 9999999\", 'Error', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"‚±‚ÌƒGƒ‰[‚ÍƒeƒƒF‚ª‚à‚¤‚¨‚µ‚Ü‚¢‚¾‚Æ‚¢‚¤‚±‚Æ‚ğ‹³‚¦‚Ä‚ñ‚¾‚æIIIIIIIIIII\", '‚»‚Ì’Ê‚è', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"ƒeƒƒF‚É‚Å‚«‚é–‚Í‰½‚à‚Ë‚¥I‚­‚½‚Î‚è‚ÈI\", '‚Ç‚¤‚·‚ê‚Î‚¢‚¢H?', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"‚­‚½‚Î‚êIIIIIII\", '‚­‚½‚Î‚êIIIIIIIIIIIIII', 'OK', 'None')"
goto :BSOD_ErrorsRorR

:BSOD_Errors5message
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"d‘å‚Èˆø”‚ÌƒGƒ‰[‚ª”­¶‚µ‚Ü‚µ‚½I\", 'd‘å‚ÈƒGƒ‰[', 'OK', 'Warning');Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"ƒGƒ‰[‚ÌŠT—v : Batch‚Å—\–ñÏ‚İ‚Ìˆø”‚ªƒ†[ƒU[ˆø”‚Æ‚µ‚Äg—p‚³‚ê‚Ü‚µ‚½I ƒGƒ‰[ID : 5\", 'ƒGƒ‰[', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"‚±‚ÌƒGƒ‰[‚Íƒ†[ƒU[ (‚±‚Ìê‡‚ ‚È‚½)‚ªAbatch‚Å—\–ñÏ‚İ‚Ìˆø”‚ğAcmd“™‚Å’¼Úw’è‚µ‚ÄÀs‚µ‚½Û‚É”­¶‚µ‚Ü‚·B\", 'ƒGƒ‰[', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"—\–ñÏ‚İ‚Ìˆø”‚ğw’è‚µ‚ÄÀs‚µ‚È‚¢‚Å‚­‚¾‚³‚¢B\", '‚Ç‚¤‚·‚ê‚Î‚¢‚¢H?', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"‚»‚ê‚Å‚àƒGƒ‰[‚ªŒp‘±‚·‚éê‡AGithub‚Ìissue‚É‚Ä•ñ‚µ‚Ä‚­‚¾‚³‚¢B\", 'ƒGƒ‰[', 'OK', 'None')"
goto :BSOD_ErrorsRorR

:BSOD_Errors6message
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"d‘å‚ÈƒGƒ‰[‚ªErrorHandler‚Å”­¶‚µ‚Ü‚µ‚½I\", 'CRITICAL ERROR', 'OK', 'Warning');Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"ƒGƒ‰[‚ÌŠT—v : ErrorHandler‚Åd‘å‚ÈƒGƒ‰[‚ª”­¶‚µ‚Ü‚µ‚½I ƒGƒ‰[ID : 6\", 'ƒGƒ‰[', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"‚±‚ÌƒGƒ‰[‚Í—lX‚È——R‚Å”­¶‚·‚é‰Â”\«‚ª‚ ‚è‚Ü‚·B—á‚¦‚ÎA³‚µ‚­‚È‚¢ƒJ[ƒ\ƒ‹‘Ö‚¦‚Ì–¼‘OACtrl+C‚Ìg—pA•s“KØ‚È•û–@‚Å‚Ì‹N“®“™‚Å‚·B\", 'ƒGƒ‰[', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"ƒJ[ƒ\ƒ‹‘Ö‚¦‚ğÄƒCƒ“ƒXƒg[ƒ‹‚µ‚½‚èApowershell‚â‚±‚Ìbatch‚Ì–¼‘O‚ğŠm”F‚µ‚½‚èAƒfƒXƒNƒgƒbƒv‚É‚¨‚¢‚Ä‚©‚çbatch‚ğ‹N“®‚·‚é‚È‚Ç‚ğ‚µ‚Ä‚­‚¾‚³‚¢B\", '‚Ç‚¤‚·‚ê‚Î‚¢‚¢H', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"‚»‚ê‚Å‚àƒGƒ‰[‚ªŒp‘±‚·‚éê‡AGithub‚Ìissue‚É‚Ä•ñ‚µ‚Ä‚­‚¾‚³‚¢B\", 'ƒGƒ‰[', 'OK', 'None')"
goto :BSOD_ErrorsRorR


:BSOD_Errors_Error
cls
echo BSOD_Errors‚ª•s“KØ‚È•û–@‚Åcall‚³‚ê‚Ü‚µ‚½I
pause
if not defined dummy (set /p nothing=[?25h<nul)
if "%wmodetoggle%"=="true" (color f0) else (color 07)
exit /b


:BSOD_ErrorsRorR
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"[‚Í‚¢] ‚ğ‰Ÿ‚µ‚ÄÄ‹N“®A[‚¢‚¢‚¦] ‚ğ‰Ÿ‚µ‚ÄƒŠƒJƒoƒŠ[ƒƒjƒ…[‚ÅÄ‹N“®‚µ‚Ü‚·B\", '‚Ç‚¿‚ç‚©‚ğ‘I‘ğ‚µ‚Ä‚­‚¾‚³‚¢...', [System.Windows.Forms.MessageBoxButtons]::'Yesno', 'Question');exit $result;"
set bsod_errors_clrforsad=& set bsod_errors_clrforsad2=& set bsodwinver=& set bsoderrorlevel= & set bootegg=& set bootegg2=
if "%errorlevel%"=="6" (if not defined dummy (set /p nothing=[?25h<nul) & call :rebootbatch)
if "%errorlevel%"=="7" (if not defined dummy (set /p nothing=[?25h<nul) & call :rebootbatch 1)
echo Oh hi. How are you holding up? Because I'm a POTATO!
pause & exit


:bsod_errors_RANDOMFACEHAHA
call :RandomDecisioner 16
if "%errorlevel%"=="1" (goto :bsod_errors_RANDOMFACEHAHA2)
call :RandomDecisioner 128
if "%errorlevel%"=="1" (goto :bsod_errors_RANDOMFACEHAHA3)
rem :)
if not defined dummy (echo [17C%bsod_errors_clrforsad%  %bsod_errors_clrforsad2%& echo [09C%bsod_errors_clrforsad%  %bsod_errors_clrforsad2%[4a%bsod_errors_clrforsad%  %bsod_errors_clrforsad2%& echo [15C%bsod_errors_clrforsad%  %bsod_errors_clrforsad2%& echo [09C%bsod_errors_clrforsad%  %bsod_errors_clrforsad2%[4a%bsod_errors_clrforsad%  %bsod_errors_clrforsad2%& echo [17C%bsod_errors_clrforsad%  %bsod_errors_clrforsad2%)
exit /b
:bsod_errors_RANDOMFACEHAHA2
rem :(
if not defined dummy (echo [13C%bsod_errors_clrforsad%  %bsod_errors_clrforsad2%& echo [09C%bsod_errors_clrforsad%  %bsod_errors_clrforsad2%[4a%bsod_errors_clrforsad%  %bsod_errors_clrforsad2%& echo [15C%bsod_errors_clrforsad%  %bsod_errors_clrforsad2%& echo [09C%bsod_errors_clrforsad%  %bsod_errors_clrforsad2%[4a%bsod_errors_clrforsad%  %bsod_errors_clrforsad2%& echo [13C%bsod_errors_clrforsad%  %bsod_errors_clrforsad2%)
exit /b
:bsod_errors_RANDOMFACEHAHA3
echo.
echo.
echo.
echo.
echo                                     ¡‚·‚®ˆÈ‰º‚ÌƒŠƒ“ƒN‚ğŠJ‚¯...
echo   https://github.com/tamago1908/Cursor-Changer.bat/blob/main/resource/it's just qr.png?raw=true
echo.
echo.
echo.
echo.
exit /b



:BSOD_Errors_OG
rem Alternative version of BSOD displayed when Windows version is not supported
rundll32 user32.dll,MessageBeep || echo 
color 07
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ƒuƒ‹[ƒXƒNƒŠ[ƒ“I
echo.
echo [ERROR] ƒJ[ƒ\ƒ‹‘Ö‚¦‚ªƒNƒ‰ƒbƒVƒ…‚µ‚Ü‚µ‚½I
echo.
echo ƒGƒ‰[“à—e : 
echo.
echo ƒJ[ƒ\ƒ‹‘Ö‚¦ ƒo[ƒWƒ‡ƒ“ : %batver% (%batbuild%)
echo Windows ƒrƒ‹ƒh”Ô†      : %bsodwinver%
echo ƒGƒ‰[ID                : %1
echo ƒGƒ‰[ƒŒƒxƒ‹            : %bsoderrorlevel%
echo.
echo ƒJ[ƒ\ƒ‹‘Ö‚¦‚ªƒTƒ|[ƒg‚µ‚Ä‚¢‚È‚¢ƒo[ƒWƒ‡ƒ“‚Ì
echo Windows‚ğ—˜—p‚µ‚Ä‚¢‚é‚æ‚¤‚Å‚·I
echo ‚±‚ÌƒNƒ‰ƒbƒVƒ…‚Í‚»‚ê‚ªŒ´ˆö‚Å
echo ”­¶‚µ‚Ä‚¢‚é‰Â”\«‚ª”ñí‚É‚‚¢‚Å‚·B
echo ƒNƒ‰ƒbƒVƒ…‚ğ”ğ‚¯‚é‚½‚ß‚É‚ÍAƒTƒ|[ƒg‚³‚ê‚Ä‚¢‚é
echo ƒo[ƒWƒ‡ƒ“‚ÌWindows‚ğ—˜—p‚µ‚Ä‚­‚¾‚³‚¢B
echo.
echo ‰½‚©ƒL[‚ğ‰Ÿ‚µ‚ÄI—¹...
echo.
pause >nul
if "%wmodetoggle%"=="true" (color f0) else (color 07)
call :exit 1


:BSOD_Errors_NOERRORS
mode con: cols=97 lines=25
rundll32 user32.dll,MessageBeep || echo 
if not defined dummy (set /p nothing=[97m[48;2;0;61;146m[2J<nul)
rem Your ƒJ[ƒ\ƒ‹‘Ö‚¦ is running perfectly fine :)
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ƒuƒ‹[ƒXƒNƒŠ[ƒ“‚ÆƒGƒ‰[  ‚Ç‚±‚És‚Á‚½H
echo.
echo.
call :bsod_errors_RANDOMFACEHAHA2
echo.
echo.
echo          ‚æ‚Á‚µ‚á[I ƒJ[ƒ\ƒ‹‘Ö‚¦‚ª‚¿‚á‚ñ‚Æ“®‚¢‚Ä‚éI
echo.
echo          ‚±‚Ì‰æ–Ê‚Í‰½‚ç‚©‚Ì——R‚ÅƒJ[ƒ\ƒ‹‘Ö‚¦‚ª³í‚É“®ì‚µ‚Ä‚¢‚éÛ‚É•\¦‚³‚ê‚Ü‚·B
echo          ³í‚É“®ì‚µ‚Ä‚¢‚é‚±‚Æ‚ğ’m‚éÛ‚É‚ÍˆÈ‰º‚Ìî•ñ‚ª–ğ‚É—§‚Â‚©‚à‚µ‚ê‚Ü‚¹‚ñ :
echo.
echo          ƒJ[ƒ\ƒ‹‘Ö‚¦ ƒo[ƒWƒ‡ƒ“ : ‚È‚É‚»‚ê‚¨‚¢‚µ‚¢‚Ì
echo          Windows ƒrƒ‹ƒh”Ô†      : ‚Ê‚é‚Û
echo          ƒGƒ‰[ID                : %1
echo          ƒGƒ‰[ƒŒƒxƒ‹            : ‚í‚Ÿ[
echo.
echo          ‚±‚Ì‰æ–Ê‚É‚Â‚¢‚Ä‚ÌÚ×î•ñ‚ğ“¾‚éÛ‚É‚ÍˆÈ‰º‚ÌƒŠƒ“ƒN‚ÉƒAƒNƒZƒX‚µ‚Ä‚­‚¾‚³‚¢ (‰pŒê) :
echo.
echo          https://www.youtube.com/watch?v=dQw4w9WgXcQ
echo.
echo          ‰½‚©ƒL[‚ğ‰Ÿ‚µ‚Ä‘±s...
pause >nul
if "%wmodetoggle%"=="true" (color f0) else (color 07)
exit /b



rem ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹ƒƒjƒ…[‚Ì‘I‘ğ‚Ì”»•Ê
:uninstallnow
if "%Uninstall_way%"=="1" (goto :uninstallnowsettingdel)
if "%Uninstall_way%"=="2" (goto :uninstallnowchangeit)
for /l %%i in (5,1,9) do (set /p nothing=[%%i;11H                                                      <nul)
if not defined dummy (set /p nothing=[6;13H Error! unexpected argument value. ^(%1^)<nul)
pause >nul
call :exit 0

rem Branching according to uninstall menu selection
:uninstallnowsettingdel
del %FirstSTFsfile%
del %Settingsfile%
goto :uninstallnowfinish

:uninstallnowchangeit
del %Settingsfile%
call :Cursor_Backupper_Restore Dynamic
del %FirstSTFsfile%
call :Powersheller RefreshCursor

:uninstallnowfinish
powershell -command "$pid1 = Get-WmiObject win32_process -filter processid=$pid | ForEach-Object{$_.parentprocessid;}";$pid2 = "Get-WmiObject win32_process -filter processid=$pid1 | ForEach-Object{$_.parentprocessid;}";exit $pid2"
set PID=%Errorlevel%
rem Message after uninstallation is complete
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ‚³‚æ‚¤‚È‚ç
for /l %%i in (5,1,9) do (set /p nothing=[%%i;11H                                                      <nul)
if not defined dummy (set /p nothing=[6;13H ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹Š®—¹I[8;13H %clrgra%^(‰½‚©ƒL[‚ğ‰Ÿ‚µ‚Ä‘±s...^)%clr2%<nul)
pause >nul
for /l %%i in (5,1,9) do (set /p nothing=[%%i;11H                                                      <nul)
if not defined dummy (set /p nothing=[6;13H ‚³‚æ‚¤‚È‚çA %YourName%![8;13H %clrgra%^(‰½‚©ƒL[‚ğ‰Ÿ‚µ‚Ä‘±s...^)%clr2%<nul)
pause >nul
rem Get own path, delete own
>nul 2>&1 del "%~dp0%~n0%~x0" & taskkill /pid %PID% >nul & exit



:DEATHEASTEREGG
rem :(
set "Hazimebuild=[0;26H‚È‚ñ‚Å‚±‚ñ‚È‚±‚Æ‚µ‚½‚ÌH"
exit /B


:1908hell
rem ƒeƒXƒg‹@”\‚ÆƒC[ƒXƒ^[ƒGƒbƒO
cls
set eggloop=0
:loop1908
set /a eggrandom=%random%*5/32767
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| %eggloop%

if "%eggrandom%"=="0" (echo 1908 :D)
if "%eggrandom%"=="1" (echo 1908 :P)
if "%eggrandom%"=="2" (echo 1908 xD)
if "%eggrandom%"=="3" (echo 1908 :C)
if "%eggrandom%"=="4" (echo 1908 :O)
set /a eggloop=eggloop+1
if %eggloop% gtr 1908 (pause&echo 1 9 0 8 :D :D :D :D :D :D&pause&goto :hazime)
goto :loop1908

:developermenu
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| developer menu
echo axolotl is my best friend
pause
exit /b

:Hello_World
rem Hello world!! Yippeeeee :D
cls
for /l %%i in (1,1,1000) do (
    title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| Hello world!! ^(%%i / 1000^)
    set /p nothing=Hello world!! <nul
    pathping 127.0.0.1 -n -q 1 -p 0 1>nul
)
echo.& echo HELLO WORLD!!! (‰½‚©ƒL[‚ğ‰Ÿ‚µ‚Ä–ß‚é...)
exit /b


:AllLabelList
cls
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ‘Sƒ‰ƒxƒ‹ƒŠƒXƒg
echo ‘Sƒ‰ƒxƒ‹ƒŠƒXƒg :
set count=0
powershell -command "&{$h=Get-Host;$w=$h.UI.RawUI;$s=$w.BufferSize;$s.height=1000;$w.BufferSize=$s;}"
for /f "tokens=1 delims=:" %%a in ('findstr /r "^:[a-zA-Z0-9_]*" "%~dp0%~n0%~x0"') do (echo :%%a& set /a count+=1)
echo.& echo ƒ‰ƒxƒ‹‚Ì” : %count%& pause
set count=
exit /b


:batstarthelp
set DynamicWinverCheck=true& call :batbootcheckwinver dynamic & set DynamicWinverCheck=
if "%errorlevel%"=="1" (goto :batbootcheckwinverbad)
set batargmentonly=true
if not defined dummy (
set clr=[7m&set clred=[91m&set clrgrn=[92m&set clryel=[93m&set clrmag=[95m&set clrgra=[90m&set clrcyan=[96m&set clr2=[0m
if "%wmodetoggle%"=="false" (set clr=[7m&set clred=[91m&set clrgrn=[92m&set clryel=[93m&set clrmag=[95m&set clrgra=[90m&set clrcyan=[96m&set clr2=[0m)
if "%wmodetoggle%"=="true" (set clr=[100m[97m&set clred=[91m&set clrgrn=[92m&set clryel=[93m&set clrmag=[95m&set clrgra=[90m&set clrcyan=[96m&set clr2=[0m[107m[30m)
)
goto :acbatargmentsonly


:allcommands
cls
rem initialize variables
set selected=
if "%allcommandlock%"=="true" (goto :hazimemenu) else if "%allcommandlock%"=="false" (goto :allcommandsmain)
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ƒpƒXƒR[ƒh‚ğ“ü—Í‚µ‚Ä‚­‚¾‚³‚¢ (ƒqƒ“ƒg : ŠJ”­Ò‚Ì–¼‘O)
setlocal enabledelayedexpansion
if not defined dummy (set /p nothing=[?25l<nul)
mode con: cols=75 lines=25
set "input=" & set len=0
:allcommandslockloop
rem drew UI
if "%wmodetoggle%"=="true" (echo [97m)
if not defined dummy (
echo [10;25H[44m„¡„Ÿ„Ÿ„Ÿ  ƒpƒXƒR[ƒh “ü—Í „Ÿ„Ÿ„Ÿ„¢ [0m
echo [11;25H[44m„                         „  [0m
echo [12;25H[44m„  „«[0m                    „«[44m „  [0m
echo [13;25H[44m„                         „  [0m
echo [14;25H[44m„¤„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„£ [0m
echo [15;25H[44m   B=íœ  Y=Œˆ’è  E=–ß‚é  [0m
)
if "%input%" neq "" (if %len% equ 19 (echo [12;29H%input%) else (echo [12;29H%input%[5m_[0m))
if not defined input (echo [12;29H[5m_[0m)
if not defined dummy (echo [0;0H)
if "%wmodetoggle%"=="true" (echo [107;30m)
choice /c:0123456789bye /n >nul
set num=%errorlevel%
rem Check inputs
if %num% neq 0 set /a num=num-1
if %num%==10 if "%input%" neq "" set input=%input:~0,-1%&set /a len=len-1
if %num%==11 if "%input%"=="1908" (echo [17;30HCorrect passcode.&timeout /t 2 /nobreak >nul&echo [?25h&set invisiblecursor=&setlocal disabledelayedexpansion&set input=&set len=&set allcommandlock=false&goto :allcommandsmain) else (echo [17;10HWrong password. You need restart the batch to try again.&timeout /t 3 /nobreak >nul&set input=&set len=0&set allcommandlock=true&setlocal disabledelayedexpansion&goto :hazimemenu)
if %num%==12 (setlocal disabledelayedexpansion&echo [?25h&set invisiblecursor=&set input=&set len=& goto :hazimemenu)
if %num% lss 10 if not defined input (set "input=%num%"&set "len=1") else if !len! gtr 18 (goto :allcommandslockloop) else set input=%input%%num%&set /a len=len+1
goto :allcommandslockloop

:allcommandsmain
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ƒRƒ}ƒ“ƒhƒŠƒXƒg
cls
rem dumbass code, wtf hell no who make it fr (damn its me but)!!!!! ITS ABSOLUTE TRASH!!!! THATS IS SO HARD TO READ
rem so many set uhhh
rem STOP SPAMMING SET AUHAUAHAUAHAUHAUAHAHAHAUAHUAHUUAUHHUHUHUHUHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHh&SET IHHHHGISJGIE
if not defined dummy (set clr=[7m&set clred=[91m&set clrgrn=[92m&set clryel=[93m&set clrmag=[95m&set clrcyan=[96m&set clrgra=[90m&set clr2=[0m)
if "%wmodetoggle%"=="false" (set clr=[7m&set clred=[91m&set clrgrn=[92m&set clryel=[93m&set clrmag=[95m&set clrgra=[90m&set clrcyan=[96m&set clr2=[0m)
if "%wmodetoggle%"=="true" (set clr=[100m[97m&set clred=[91m&set clrgrn=[92m&set clryel=[93m&set clrmag=[95m&set clrgra=[38;2;140;140;140m&set clrcyan=[96m&set clr2=[0m[107m[30m)
if not defined dummy (set /p nothing=[?25l<nul)
cls
echo [Loading Command list...]
powershell -command "&{$h=Get-Host;$w=$h.UI.RawUI;$s=$w.BufferSize;$s.height=64;$w.BufferSize=$s;}"
cls
echo %clr%::%clr2%                      [Entire list of menu commands]      %clrgra%6colors test%clr2%
echo                  (You can use all of them in the main menu.)
echo.
echo            ^<%clred%Debbuging purposes commands%clr2%^>
echo.
rem OMG Ctrl+V spam!!!! poop coding sdafoaf2oirvn210rvn2983rvn3828723rv!!!!!!!
echo          %clryel%E%clr2% help %clrgra%(displays all available commands.)%clr2%
echo.
echo           %clrcyan%-%clr2% fulldebug         %clrgra%(enter variable management mode.)%clr2%
echo           %clrcyan%-%clr2% getadmin          %clrgra%(trying get admin permission.)%clr2%
echo           %clrcyan%-%clr2% checkmem          %clrgra%(show memory usage. not accurate.)%clr2%
echo           %clrcyan%-%clr2% boottime          %clrgra%(show boot time.)%clr2%
echo           %clrcyan%-%clr2% labellist         %clrgra%(show all labels in this batch.)%clr2%
echo           %clrcyan%-%clr2% bypassfirstboot   %clrgra%(bypassing first boot constraints.)%clr2%
echo           %clrcyan%-%clr2% setenter          %clrgra%(wets the enter count in main menu.)%clr2%
echo           %clrcyan%-%clr2% playdefboot       %clrgra%(playing first start animation.)%clr2%
echo           %clrcyan%-%clr2% crashtest         %clrgra%(will happen Intentionally crashes.)%clr2%
echo           %clrcyan%-%clr2% reload            %clrgra%(reloading settings.) %clr2%
echo           %clrcyan%-%clr2% openie            %clrgra%(trying open internet explorer.)%clr2%
echo           %clrcyan%-%clr2% counttestdeb      %clrgra%(enter the count test mode.)%clr2%
echo           %clrcyan%-%clr2% uninstallnow1     %clrgra%(forced to enter uninstall.)%clr2%
echo           %clrcyan%-%clr2% funanimationdeb   %clrgra%(play rare boot animation.)%clr2%
echo           %clrcyan%-%clr2% windowsfiltertest %clrgra%(play bad win ver Warning.)%clr2%
echo           %clrcyan%-%clr2% reboot            %clrgra%(reboot this batch.)%clr2%
echo           %clrcyan%-%clr2% shutdown          %clrgra%(shutdown this bach.)%clr2%
echo.
echo            ^<%clrgrn%Easter egg purposes commands%clr2%^>
echo.
echo           %clrcyan%-%clr2% egg1             %clrgra%(play error message in uninstall.)%clr2%
echo           %clrcyan%-%clr2% egg2             %clrgra%(play dogcheck error, inspired toby fox.)%clr2%
echo           %clrcyan%-%clr2% wwssdadaba       %clrgra%(secret message and show build number.)%clr2%
echo           %clrcyan%-%clr2% tamago1908       %clrgra%(show goofy message.)%clr2%
echo           %clrcyan%-%clr2% himazionnoob1908 %clrgra%(show goofy message.)%clr2%
echo           %clrcyan%-%clr2% mskg1908         %clrgra%(show goofy message.)%clr2%
echo           %clrcyan%-%clr2% 1908             %clrgra%(show looped goofy message.)%clr2%
echo           %clrcyan%-%clr2% helloworld       %clrgra%(show hello world.)%clr2%
echo.
echo            ^<%clryel%Bad commands%clr2%^>
echo.
echo           %clrcyan%-%clr2% fuckyou %clrgra%(it will say fuck you too.)%clr2%
echo           %clrcyan%-%clr2% fucku   %clrgra%(it will say fuck you too.)%clr2%
echo           %clrcyan%-%clr2% fucu    %clrgra%(it will say fuck you too.)%clr2%
echo           %clrcyan%-%clr2% fucyou  %clrgra%(it will say fuck you too.)%clr2%
echo.
echo            ^<%clrmag%Miscellaneous Commands%clr2%^>
:acbatargmentsonly
echo.
echo                     %clred%[%clr2%Bat argument commands%clred%]%clr2%
echo.
echo            %clrcyan%-%clr2% help              %clrgra%(show available arguments.)%clr2%
echo            %clrcyan%-%clr2% enablesimpleboot  %clrgra%(boot up with Simple txt.)%clr2%
echo            %clrcyan%-%clr2% recovery          %clrgra%(boot up with recovery menu.)%clr2%
echo            %clrcyan%-%clr2% uninstall         %clrgra%(boot up with Uninstaller.)%clr2%
echo            %clrcyan%-%clr2% bypsbootpwsh      %clrgra%(bypass the powershell when boot.)%clr2%
echo            %clrcyan%-%clr2% bypsloadsg        %clrgra%(bypass the loading of settings.)%clr2%
echo            %clrcyan%-%clr2% bypsadm           %clrgra%(bypass the getting admin.)%clr2%
if "%batargmentonly%"=="true" (echo.&echo.&goto :allcommandswait)
echo.
echo                     %clrgrn%[%clr2%Fulldebug commands%clrgrn%]%clr2%
echo.
echo            %clrcyan%-%clr2% goto %clrgra%(goto for labels that exist.)%clr2%
echo            %clrcyan%-%clr2% set  %clrgra%(create new variable.)%clr2%
echo            %clrcyan%-%clr2% run  %clrgra%(run cmd commands.)%clr2%
echo            %clrcyan%-%clr2% help %clrgra%(show commands available in fulldebug.)%clr2%
echo.
echo.
:allcommandswait
set /p nothing=%clred%^/^/%clr2%[Type something to back to menu...]                           %clrgra%%batver%%clr2% <nul&pause >nul
set clrcyan=& set clrgra=& set clred=& set clrgrn=& set clryel=& set clrmag=
if "%batargmentonly%"=="true" (set batargmentonly=& if exist %Settingsfile% (if not "%linuxboot%"=="true" (cls &echo ‚µ‚Î‚ç‚­‚¨‘Ò‚¿‚­‚¾‚³‚¢... 2/2& exit /b) else (exit /b)) else (echo ƒZƒbƒgƒAƒbƒv‚ğ€”õ’†... 2/2& exit /b))
goto :hazimemenu


:fulldebug
setlocal disabledelayedexpansion
set selected=
if defined fulldebug (goto :fulldebugmain)
cls
echo.
echo                                   !Œx!
echo.
echo ‚±‚Ì‹@”\‚ÍŠJ”­ÒŒü‚¯‚Éì¬‚³‚ê‚½‚à‚Ì‚Å‚·B‚Å‚·‚Ì‚ÅAŠJ”­ÒˆÈŠO‚Ìl‚ª—˜—p‚µ‚½ê‡A‰½‚ç‚©‚ÌƒoƒO‚â–â‘è‚ğˆø‚«‹N‚±‚·‰Â”\«‚ª‚ ‚è‚Ü‚·B
echo ‚»‚ê‚Å‚à‚±‚Ì‹@”\‚ğg—p‚µ‚½‚¢ê‡‚É‚ÍA"y"‚ğ“ü—Í‚µ‚Ä‰º‚³‚¢B
echo –ß‚é‚©AƒLƒƒƒ“ƒZƒ‹‚µ‚½‚¢ê‡‚É‚ÍA"n"‚ğ“ü—Í‚µ‚Ä‚­‚¾‚³‚¢B
echo ˆê“xy‚ğ“ü—Í‚µ‚½ê‡A‚±‚Ìbatch‚ğ’¼ÚÄ‹N“®‚·‚é‚©A•Ï”"fulldebug"‚ğíœ‚µ‚È‚¢ŒÀ‚è‚±‚ÌƒƒbƒZ[ƒW‚ÍÄ“x•\¦‚³‚ê‚È‚­‚È‚è‚Ü‚·B
set /p selected=Y or N : 
if %selected%==n goto :hazimemenu
if %selected%==y set fulldebug=true
if %selected%== echo what? "Y" or "N".&pause&goto :fulldebug

:fulldebugmain
set fulldebugsetvariable=
set fulldebugvariableapply=
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ^(ƒfƒoƒbƒO—p^) ƒJ[ƒ\ƒ‹•Ï”
echo.
echo fulldebug ‚ğ‹N“®‚µ‚Ä‚¢‚Ü‚·...
powershell -command "&{$h=Get-Host;$w=$h.UI.RawUI;$s=$w.BufferSize;$s.height=150;$w.BufferSize=$s;}"
cls
:fulldebugtypevariable
set fulldebugsetvariable=
set fulldebugvariableapply=
set
set /p fulldebugsetvariable=•ÏX‚·‚éƒ‰ƒxƒ‹‚ğw’è‚µ‚Ä‚­‚¾‚³‚¢B :
if "%fulldebugsetvariable%"=="back" (goto :hazimemenu)
if "%fulldebugsetvariable%"=="exit" (goto :hazimemenu)
if "%fulldebugsetvariable%"=="help" (echo goto&echo set&echo run&echo help&echo back&pause&cls&set fulldebugsetvariable=&goto :fulldebugtypevariable)
if "%fulldebugsetvariable%"=="goto" (goto :fulldebuggoto)
if "%fulldebugsetvariable%"=="set" (goto :fulldebugsetnew)
if "%fulldebugsetvariable%"=="run" (goto :fulldebugrun)
if "%fulldebugsetvariable%"=="" (cls&goto :fulldebugtypevariable)
if not defined %fulldebugsetvariable% (echo •Ï” %fulldebugsetvariable% ‚Í‘¶İ‚µ‚Ü‚¹‚ñBV‚½‚Éì¬‚·‚é‚©A‘¶İ‚·‚é•¨‚ğw’è‚µ‚Ä‰º‚³‚¢B&pause&cls&goto :fulldebugtypevariable)
set /p fulldebugvariableapply=%fulldebugsetvariable%^=
if "%fulldebugvariableapply%"=="back" (goto :fulldebugerrorsetnew1)
if "%fulldebugvariableapply%"=="" (goto :fulldebugerrorsetvariable1)
set %fulldebugsetvariable%=%fulldebugvariableapply%
echo %fulldebugsetvariable%^=%fulldebugvariableapply% chenged.
pause
cls
goto :fulldebugtypevariable

:fulldebuggoto
set fulldebugsetvariable=
set /p fulldebugsetvariable=‚Ç‚±‚Égoto‚µ‚Ü‚·‚©H:
if "%fulldebugsetvariable%"=="back" (goto :fulldebugtypevariable)
if "%fulldebugsetvariable%"=="exit" (goto :fulldebugtypevariable)
if "%fulldebugsetvariable%"=="" (cls&goto :fulldebuggoto)
set runningfromfulldebug=true
call :%fulldebugsetvariable%
if %errorlevel%==0 (
  set runningfromfulldebug=
  goto :fulldebuggoto
     )
    if %runningfromfulldebug%==true (
  if %errorlevel%==1 (
echo ‘¶İ‚µ‚È‚¢ƒ‰ƒxƒ‹‚ªw’è‚³‚ê‚Ü‚µ‚½B
echo ^(‚à‚µ‚­‚ÍA–w‚Çˆ—‚ª‘¶İ‚µ‚È‚¢ƒ‰ƒxƒ‹‚Égoto‚µ‚½‚©...^). 
echo ‘¶İ‚·‚éƒ‰ƒxƒ‹‚ğw’è‚µ‚Ä‚­‚¾‚³‚¢B
pause
  )
 )
cls
goto :fulldebuggoto


:fulldebugsetnew
cls
set fulldebugsetvariable=
set fulldebugvariableapply=
set /p fulldebugsetvariable=ì¬‚µ‚½‚¢•Ï”–¼‚ğ“ü—Í‚µ‚Ä‚­‚¾‚³‚¢B  :
if defined %fulldebugsetvariable% (echo %fulldebugsetvariable% ‚Æ‚¢‚¤•Ï”‚Í‚·‚Å‚É‘¶İ‚µ‚Ä‚¢‚Ü‚·B‘¶İ‚µ‚È‚¢ƒ‰ƒxƒ‹‚ğw’è‚µ‚Ä‚­‚¾‚³‚¢B &pause&cls&goto :fulldebugsetnew)
if "%fulldebugsetvariable%"=="back" (goto :fulldebugtypevariable)
if "%fulldebugsetvariable%"=="" (echo ‰½‚©“ü—Í‚µ‚Ä‚­‚¾‚³‚¢B&pause&cls&goto :fulldebugsetnew)
:fulldebugsetnewenter
set /p fulldebugvariableapply=%fulldebugsetvariable%^=
if "%fulldebugvariableapply%"=="" (echo ‹ó‚Ì’l‚Å‚Í•Ï”‚ğì¬‚Å‚«‚Ü‚¹‚ñB &pause&cls&goto :fulldebugsetnewenter)
if "%fulldebugvariableapply%"=="back" (goto :fulldebugerrorsetnew1)
set %fulldebugsetvariable%=%fulldebugvariableapply%
echo •Ï” %fulldebugsetvariable% ‚ÍA %fulldebugvariableapply% ‚Æ‚¢‚¤’l‚Åì¬‚³‚ê‚Ü‚µ‚½B(%fulldebugsetvariable%^=%fulldebugvariableapply%).
pause
cls
goto :fulldebugtypevariable

:fulldebugerrorsetnew1
set /p fulldebugsetvariableerrornew=‘Şo‚·‚é‚©A‚»‚Ì’l‚Å•Ï”‚ğì¬‚µ‚Ü‚·‚©H (1 or 2) : 
if "%fulldebugsetvariableerrornew%"=="1" (goto :fulldebugtypevariable)
if "%fulldebugsetvariableerrornew%"=="2" (goto :fulldebugerrorsetnew1if)
:fulldebugerrorsetnew1if
set %fulldebugsetvariable%=back
echo •Ï” %fulldebugsetvariable% ‚ÍA %fulldebugvariableapply% ‚Æ‚¢‚¤’l‚Åì¬‚³‚ê‚Ü‚µ‚½B (%fulldebugsetvariable%^=%fulldebugvariableapply%).
pause
cls
goto :fulldebugtypevariable


:fulldebugerrorsetvariable1
set /p fulldebugsetvariableerrorif=–{“–‚É•Ï” %fulldebugsetvariable%‚ğíœ‚µ‚Ü‚·‚©H (y or n)
if "%fulldebugsetvariableerrorif%"=="y" (
set %fulldebugsetvariable%=
echo •Ï” %fulldebugsetvariable% ‚Ííœ‚³‚ê‚Ü‚µ‚½B
pause
cls
goto :fulldebugtypevariable
)
if "%fulldebugsetvariableerrorif%"=="n" (goto :fulldebug)


:fulldebugrun
cls
set fulldebugrun=
set /p fulldebugrun=Às‚µ‚½‚¢ƒRƒ}ƒ“ƒh‚ğ“ü—Í‚µ‚Ä‚­‚¾‚³‚¢B :
if "%fulldebugrun%"=="" (echo ‰½‚©‚ ‚È‚½‚ªÀs‚µ‚½‚¢ƒRƒ}ƒ“ƒh‚ğ“ü—Í‚µ‚Ä‚­‚¾‚³‚¢B ^(—á‚¦‚Î "echo" “™^)& pause & goto :fulldebugrun)
if "%fulldebugrun%"=="back" (set fulldebugrun=& goto :fulldebugtypevariable)
if "%fulldebugrun%"=="b" (set fulldebugrun=& goto :fulldebugtypevariable)
%fulldebugrun% || echo ‚»‚ÌƒRƒ}ƒ“ƒh‚ÅƒGƒ‰[‚ª”­¶‚µ‚½‚©A‚à‚µ‚­‚Í–³Œø‚ÈƒRƒ}ƒ“ƒh‚Ì‚æ‚¤‚Å‚·B
echo.
pause
set fulldebugrun=
goto :fulldebugtypevariable


:littleeasteregg
if "%hazimeeaster%"=="true" (goto :hazimemenu)
cls&pause&echo hello! this is easteregg!&pause&cls&title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ‰B‚µ‹@”\‚ÅƒƒCƒ“ƒƒjƒ…[‚Æƒo[ƒWƒ‡ƒ“î•ñ‚Ì•”•ª‚Åƒrƒ‹ƒhƒiƒ“ƒo[‚ª•\¦‚³‚ê‚é‚æ‚¤‚É‚È‚Á‚½&echo and bye!&pause&cls&set hazimeeaster=true&goto :hazime




:Rebootbatch
PowerShell -WindowStyle Hidden -Command Exit
if "%1"=="1" (start "ƒJ[ƒ\ƒ‹‘Ö‚¦" conhost.exe cmd.exe /c ^"%~dp0%~n0%~x0^" recovery& call :exit 0) else (start "ƒJ[ƒ\ƒ‹‘Ö‚¦" conhost.exe cmd.exe /c ^"%~dp0%~n0%~x0^"& call :exit 0)

:exit
if "%1"=="1" (echo ƒVƒƒƒbƒgƒ_ƒEƒ“’†...)
if "%1"=="2" (call :PowerScreen)
powershell -command "$pid1 = Get-WmiObject win32_process -filter processid=$pid | ForEach-Object{$_.parentprocessid;}";$pid2 = "Get-WmiObject win32_process -filter processid=$pid1 | ForEach-Object{$_.parentprocessid;}";exit $pid2"
>nul 2>&1 taskkill /pid %errorlevel% >nul
exit
:reboot


rem [‚ ‚È‚½‚Í‚º‚ñ‚Ô‚ÌƒR[ƒh‚ğ‚æ‚ñ‚¾]
rem ...
rem * ƒLƒ~  ‚æ‚Á‚Û‚Ç  ƒqƒ}‚È‚ñ‚¾‚ËB