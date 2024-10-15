@echo off
setlocal
mode con: | find "75" >nul && mode con: | find "25" >nul
if "%errorlevel%"=="1" (mode con: cols=75 lines=25& set boottime1=%time%)
if "%batbootargumentbad%"=="false" (title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| €”õ’†...) else if not "%1"=="BatBootErrorHandlerArgument1908" (title ƒJ[ƒ\ƒ‹‘Ö‚¦)
if not defined dummy (set /p nothing=[?25h<nul)

rem Cursor Changer by tamago_1908
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



rem Œv‰æ     : rem customƒe[ƒ}‹@”\ (ˆêƒJƒ‰[) ‚ğÀ‘•‚·‚é (1.15?)
rem ã ‹ï‘Ì“I‚É‚ÍColor_Applyer‚ğÀ‘•‚µ‚ÄAæ‚Éfor•ª‚Å‹ó”’‚ğ—˜—p‚µ‚Ä•¶šF‚È‚Ç‚ğw’èAŒã‚É•`Ê‚³‚ê‚éGUI‚âƒnƒCƒ‰ƒCƒg‚Í]—ˆ‚Ì•û–@‚ÅÅ“K‰»‚·‚éB
rem ‚à‚¤­‚µŒ«‚¢•û–@‚Åİ’èƒtƒ@ƒCƒ‹‚È‚Ç‚Ì‰ü•Ï‚ğŒŸ’m‚·‚é  (1.15?)
rem "Uninstall"‚ğˆø”‚Å—˜—p‚µ‚ÄƒAƒ“ƒCƒ“ƒXƒg[ƒ‰[‚Å‹N“®‚Å‚«‚é‚æ‚¤‚É‚·‚éB‚±‚ê‚ÌÀ‘•‚ÍƒAƒ“ƒCƒ“ƒXƒg[ƒ‰[‚ÌƒI[ƒo[ƒz[ƒ‹‚ÉÀ‘•‚·‚éB
rem Œ»İÀ‘•‚³‚ê‚Ä‚¢‚éyoutubeŠÖ˜A‚Ìˆ—‚ğ‚·‚×‚Äíœ‚µ‚ÄAdogcheck‚Æstartup rickroll‚ğpowershell‚Ì‰¹ŠyÄ¶‚É’u‚«Š·‚¦‚éB (1.15?)
rem ã‚É”º‚¢A‚æ‚èƒJƒeƒSƒiƒ‰ƒCƒY‚³‚ê‚½İ’èGUI‚ğÀ‘•‚·‚éB (1.15?)
rem ƒAƒbƒvƒf[ƒg—˜—p‰Â”\‚Ì‰ü—ÇAƒƒOƒCƒ“ƒƒjƒ…[‚ÌÀ‘• (1.15?)
rem setting‚ğ“K—p‚·‚é•”•ª‚ğ‰ü—Ç‚·‚é (1.15?)
rem version check‚ÌƒoƒCƒpƒX‚Ìd•û‚ğ•Ï‚¦‚éB‚»‚ê‚É”º‚¢‚»‚ê‚çü•Ó‚Ìˆ—‚à•Ï‚¦‚é (1.15?)
rem ã‚ª‚Å‚«‚ê‚ÎApowershell‘O‚Éwinver check‚ğ”z’u‚Å‚«‚é‰Â”\«‚ª‚ ‚é



rem Make sure to fill in the build number and version! Also, don't forget to put it in the archive!
rem environment setting, It is not recommended to change.
rem VER v1.14b
set batver=1.14b
set batbuild=Build 91
set batverdev=stable
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


rem detect user argument and echo first boot message
if "%1"=="BatBootErrorHandlerArgument1908" (goto :batbootVerifyerrorhandler)
:batbootVerifyerrorhandler
echo %0 | find "%homedrive%" >nul
if "%errorlevel%"=="0" if "%1"=="BatBootErrorHandlerArgument1908" (set batbootargumentbad=true) else (set batbootargumentbad=)
if "%errorlevel%"=="1" (set batbootargumentbad=false)
if "%batbootargumentbad%"=="true" (call :BSOD_Errors 5)


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
        if "%batbootargumentbad%"=="false" (echo [%time: =%] ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒu[ƒgƒ[ƒ_[ - by tamago_1908& echo.) else (echo [%time: =%] ƒu[ƒgƒ[ƒ_[‚ğŠJn’†...)
        >nul 2>&1 find "wmode=false" %Settingsfile%
        if "!errorlevel!"=="0" (set linuxishclr2=[0m)
        >nul 2>&1 find "wmode=true" %Settingsfile%
        if "!errorlevel!"=="0" (set linuxishclr2=[107m[30m) else (set linuxishclr2=[0m)
        set linuxishclred=[91m& set linuxishclr=[92m
    ) else (set linuxboot=false)
)

rem check simpleboot
if "%linuxboot%"=="true" if "%batbootargumentbad%"=="false" (echo [%linuxishclr%info%linuxishclr2%] Linux-ish Boot Loader is just now started.)
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
if "%linuxboot%"=="true" if "%batbootargumentbad%"=="false" ((echo [%linuxishclr%info%linuxishclr2%] Bootanimation Checked...))



rem boot message
if not exist %Settingsfile%  (
    if not exist %FirstSTFsfile% (
        if not "%batbootargumentbad%"=="false" (echo ƒZƒbƒgƒAƒbƒv‚Ì€”õ’†... 1/2)
    ) else (title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ‚µ‚Î‚ç‚­‚¨‘Ò‚¿‚­‚¾‚³‚¢...& echo ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| €”õ’†... 1/2)
)
if exist %Settingsfile% if not "%linuxboot%"=="true" (if not "%batbootargumentbad%"=="false" (title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| €”õ’†...& echo ‚µ‚Î‚ç‚­‚¨‘Ò‚¿‚­‚¾‚³‚¢... 1/2)) else (if not "%batbootargumentbad%"=="false" (title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| €”õ’†...))
rem chenge the boot message if it is the first time, or if a value is defined in batbotpowershell, or at boot up
if not exist %Settingsfile% set firststartbat=yes
if "%batbootargumentbad%"=="false" (
if not "%linuxboot%"=="true" (
if not "%firststartbat%"=="yes" (
if "%bootbatnow%"=="yes" (cls & echo ‚µ‚Î‚ç‚­‚¨‘Ò‚¿‚­‚¾‚³‚¢... 2/2)
) else (
    if not defined Powersheller (
        if not exist %FirstSTFsfile% (
        cls & echo ƒZƒbƒgƒAƒbƒv‚Ì€”õ’†... 2/2
        ) else (cls & echo ‚µ‚Î‚ç‚­‚¨‘Ò‚¿‚­‚¾‚³‚¢... 2/2)
    )
)
)
)
if "%linuxboot%"=="true" if "%batbootargumentbad%"=="false" ((echo [%linuxishclr%info%linuxishclr2%] Boot Message IS NO MORE WORKING...))



:batbootVerifyerrorhandlersafe
rem Processing User Arguments
setlocal enabledelayedexpansion
set "arguments="
for %%i in (%*) do (
    set "arguments=!arguments! %%i"
)
if not "%~1"=="" (set "arguments=%arguments:~1%")
setlocal disabledelayedexpansion
rem Start Error Handler
if not "%1"=="BatBootErrorHandlerArgument1908" (powershell -command "try {$process = Start-Process \"$env:%~dp0%~n0%~x0\" -ArgumentList \"BatBootErrorHandlerArgument1908 ${env:arguments}\" -NoNewWindow -Wait -PassThru; exit $process.ExitCode} catch {exit 1}")
if not "%1"=="BatBootErrorHandlerArgument1908" (if "%errorlevel%"=="1" (call :BSOD_Errors 6) else (call :BSOD_Errors 0 %errorlevel%)
    pause >nul
    echo ‰R‚İ‚½‚¢‚¾‚ëB€‚ñ‚Å‚é‚ñ‚¾‚ºA‚±‚ê‚ÅB
    exit
)
set batbootargumentbad=
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Error_Handler is Working! :D)


:Arguments_Loader
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Arguments_Loader is Started...)
if "%~1"=="" goto :Arguments_Loaderend
if not "%~1"=="BatBootErrorHandlerArgument1908" (title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| Cursor Changer argment checking...)
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
    if "!current!"=="BatBootErrorHandlerArgument1908" (set Arguments_Loaderbreaked=true& goto :Arguments_Loaderbreak)
    set Arguments_Loaderbreaked=false
    if "!current!"=="bypsbootpwsh" (echo byps batbootpowershell‚ğ—LŒø‚É‚µ‚Ü‚µ‚½B& set disableexit=false& set argmentserror=false)
    if "!current!"=="enablesimpleboot" (echo simpleboot‚ğ—LŒø‚É‚µ‚Ü‚µ‚½B& set simpleboot=true& set argmentserror=false)
    if "!current!"=="devmode" (call :developermenu& set argmentserror=false)
    if "!current!"=="recovery" (echo recovery menu‚ğ—LŒø‚É‚µ‚Ü‚µ‚½B& set argmentserror=false& goto :Cursor_Changer_REmenu)
    if "!current!"=="help" (title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ˆø”‚Ìƒwƒ‹ƒv& call :batstarthelp& set argmentserror=false)
    if "!current!"=="bypsvck" (echo bypsvck‚ğ—LŒø‚É‚µ‚Ü‚µ‚½B& set bypasswinvercheck=true& set argmentserror=false)
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
set n=
set argmentserror=
set Arguments_Loaderbreaked=
set arguments=
setlocal disabledelayedexpansion
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Arguments_Loader is done.)

call :batbootErrorHandlerCall
call :BSOD_Errors 1 %errorlevel%

:batbootErrorHandlerCall
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Error_Handler_Call is Started.)



:batbootcheckwinver
rem checking windows version
setlocal enabledelayedexpansion
if "%1"=="BatBootErrorHandlerArgument1908" if not "%1"=="dynamic" (
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Checking Windows Version...)
)
rem check windows 10 1803 or higher
for /f "tokens=6 delims=. " %%i in ('ver') do set version=%%i
if %version% gtr 17134 (set batbootcheckwinversafe=true) else (set batbootcheckwinversafe=false)
if "%batbootcheckwinversafe%"=="true" (goto :batbootcheckwinversafe) else (goto :batbootcheckwinverbad)


:batbootcheckwinverbad
if "%batbootargumentbad%"=="false" (title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| €”õ’†...) else if not "%1"=="BatBootErrorHandlerArgument1908" if "%1"=="dynamic" (exit /b 1)
if "%bypasswinvercheck%"=="true" (goto :batbootcheckwinverbadwarning)
rem check windows 8.1 or lower
for /f "usebackq delims=" %%a in (`ver`) do set version2=%%a
echo %version2% | find /i "Version 10.0" > nul
if "%errorlevel%"=="0" (set windowsverfilter=windows 10, ŒÃ‚¢ƒrƒ‹ƒh) else (set "windowsverfilter=ŒÃ‚·‚¬‚Ü‚·IWindows XPH")
echo %version2% | find /i "Version 6.3." > nul
if "%errorlevel%"=="0" (set windowsverfilter=windows 8.1)
echo %version2% | find /i "Version 6.2." > nul
if "%errorlevel%"=="0" (set windowsverfilter=windows 8)
echo %version2% | find /i "Version 6.1." > nul
if "%errorlevel%"=="0" (set windowsverfilter=windows7)
echo %version2% | find /i "Version 6.0." > nul
if "%errorlevel%"=="0" (set windowsverfilter=windows vista)
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
cls
rem ŒxƒƒbƒZ[ƒW (winvercheck‚Éˆá”½‚µ‚Ä‚¢‚éó‘Ô‚Åbyps‚µ‚æ‚¤‚Æ‚µ‚½Û‚Ì)
set selected=
cls
echo.
echo                                    Œx
echo.
echo ‚ ‚È‚½‚ª‚¨g‚¢‚ÌWindows‚Ìƒo[ƒWƒ‡ƒ“ (%windowsverfilter%)‚ÍƒJ[ƒ\ƒ‹‘Ö‚¦‚É‘Î‰‚µ‚Ä‚¢‚È‚¢‚æ‚¤‚Å‚·I
echo ˆø”‚Åbypsvck‚ğ—˜—p‚µ‚Ä‚¢‚é‚æ‚¤‚Å‚·‚ªA‚±‚Ì‚Ü‚Ü‘±s‚·‚é‚Æ’v–½“I‚È–â‘è‚É‘˜‹ö‚·‚é‰Â”\«‚ª”ñí‚É‚‚¢‚Å‚·B
echo ‰¼‚É‘±s‚µ‚½ê‡A‚»‚ÌŒã‚Éˆø‚«‹N‚±‚³‚ê‚é–â‘è‚É‘Î‚·‚éÓ”C‚ÍƒJ[ƒ\ƒ‹‘Ö‚¦‚ÌŠJ”­Ò‚Å‚ ‚étamago_1908‚Í•‰‚¢‚Ü‚¹‚ñB
echo.
echo ‚»‚ê‚Å‚à‘±s‚µ‚Ü‚·‚©H
set /p selected=Y or N : 
if %selected%==n exit 1
if %selected%==y goto :batbootcheckwinversafe
if %selected%== echo what? "Y" or "N".& pause & goto :batbootcheckwinverbadwarning


:batbootcheckwinversafe
setlocal disabledelayedexpansion
if "%batbootargumentbad%"=="false" (title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| Cursor Changer Preparing...) else if not "%1"=="BatBootErrorHandlerArgument1908" if "%1"=="dynamic" (exit /b 0)
set batbootcheckwinversafe=& set version=& set version2=
if "%1"=="dynamic" (exit /b)
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] WinverCheck is done.)


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
if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Powersheller is started...)
set Powersheller_passed=false
if not "%Powersheller%"=="OOBEMusic" (
    if "batverdev"=="beta" (
    set "batverforpowersheller=%batver:ƒÀ=.b%"
) else (set "batverforpowersheller=%batver%")
)

rem startid~powershell ‚Ü‚Å‚ÌƒR[ƒh‚Í‚¸‚ç‚µ‚Ä‚Í‚¢‚¯‚È‚¢@‚»‚êˆÈ‘O‚©‚»‚êˆÈŒã‚È‚çok
:: StartID1908
call :getLineNumber startLine StartID1908 0
goto :Powershellerendcode
:Powershellercodestart
set /a startline=startline+5& set /a endline=endline-3
if "%Powersheller%"=="OOBEMusic" (start /min powershell.exe  -noexit -NoProfile -ExecutionPolicy Unrestricted "$s=[System.Management.Automation.ScriptBlock]::create((Get-Content \"%~f0\" -TotalCount $env:endline|Where-Object{$_.readcount -gt $env:startline }) -join \"`n\");&$s" %*&goto :Powersheller_end)
if "%checkupdatetoggle%"=="true" (for /f "delims=" %%a in ('powershell -NoProfile "$s=[System.Management.Automation.ScriptBlock]::create((Get-Content \"%~f0\" -TotalCount $env:endline|Where-Object{$_.readcount -gt $env:startline }) -join \"`n\");&$s" %*') do set Updateinfo=%%a&goto :Powersheller_end) else (powershell -NoProfile -ExecutionPolicy Unrestricted "$s=[System.Management.Automation.ScriptBlock]::create((Get-Content \"%~f0\" -TotalCount $env:endline|Where-Object{$_.readcount -gt $env:startline }) -join \"`n\");&$s" %*&goto :Powersheller_end)


# Define the function to disable the maximize button
function Disablemax {
#Calling user32.dll methods for Windows and Menus
$code = @'
using System;
using System.Runtime.InteropServices;

namespace CloseButtonToggle {

// Function Declaration

 internal static class WinAPI {
   [DllImport("kernel32.dll")]
   internal static extern IntPtr GetConsoleWindow();

   [DllImport("user32.dll")]
   [return: MarshalAs(UnmanagedType.Bool)]
   internal static extern bool DeleteMenu(IntPtr hMenu,
                          uint uPosition, uint uFlags);

   [DllImport("user32.dll")]
   [return: MarshalAs(UnmanagedType.Bool)]
   internal static extern bool EnableMenuItem(IntPtr hMenu,
                          uint uIDEnableItem, uint uEnable);

   [DllImport("user32.dll")]
   [return: MarshalAs(UnmanagedType.Bool)]
   internal static extern bool DrawMenuBar(IntPtr hWnd);

   [DllImport("user32.dll")]
   internal static extern IntPtr GetSystemMenu(IntPtr hWnd,
              [MarshalAs(UnmanagedType.Bool)]bool bRevert);

   [DllImport("user32.dll")]
   internal static extern int GetWindowLong(IntPtr hWnd, int nIndex);

   [DllImport("user32.dll")]
   internal static extern int SetWindowLong(IntPtr hWnd, int nIndex, int dwNewLong);

// End of Declaration

// Set required arguments
   const int GWL_STYLE = -16;
   const int WS_MAXIMIZEBOX = 0x00010000;

   const uint SC_MAXIMIZE = 0xF030; 
   const uint MF_BYCOMMAND = 0;

// Main Processing
internal static void ChangeCurrentState(bool state) {
     IntPtr hWnd = GetConsoleWindow();
     int style = GetWindowLong(hWnd, GWL_STYLE);
     if (state) {
       style |= WS_MAXIMIZEBOX; // enable maximize button
     } else {
       style &= ~WS_MAXIMIZEBOX; // disable mixmize button
     }
     SetWindowLong(hWnd, GWL_STYLE, style);
     DrawMenuBar(hWnd);
   }
 }
//  Confirmation of change
 public static class Status {
   public static void Disable() {
     WinAPI.ChangeCurrentState(false); // Change to 'true' if you want to turn it enable
   }
 }
} 
'@

Add-Type $code
[CloseButtonToggle.Status]::Disable()
}


function RefreshCursor {
Add-Type @"
using System;
using System.Runtime.InteropServices;
public class User32 {
    [DllImport("user32.dll", SetLastError = true)]
    public static extern bool SystemParametersInfo(int uAction, int uParam, IntPtr lpvParam, int fuWinIni);
}
"@

# SPI_SETCURSORS = 0x0057 (Refresh Cursor, using winapi)
$SPI_SETCURSORS = 0x0057
$SPIF_SENDCHANGE = 0x02

# ƒJ[ƒ\ƒ‹İ’è‚ğÄ“K—p
[User32]::SystemParametersInfo($SPI_SETCURSORS, 0, [IntPtr]::Zero, $SPIF_SENDCHANGE) | Out-Null
}



function Updater {
    # Check for updates of Cursor Changer with GitHub API, But won't do update. Just check.
    $repo = "https://api.github.com/repos/tamago1908/Cursor-Changer.bat/releases/latest"
    try{$file = (Invoke-RestMethod -Uri $repo -Method Get -Headers @{'Accept'='application/vnd.github.v3+json'}).assets | Where-Object { $_.name -like "Cursor.Changer.*" }
    }catch{if($_.Exception.Response.StatusCode.Value__ -eq 403){Write-Host "[ERROR] github‚ÌAPIƒŒ[ƒg§ŒÀ‚É“’B‚µ‚Ü‚µ‚½B‚±‚ê‚ªˆÓ–¡‚·‚é‚Ì‚Í—v‚·‚é‚ÉAˆêŠÔˆÈ“à‚É‘å—Ê‚ÉƒAƒbƒvƒf[ƒg‚ğŠm”F‚µ‰ß‚¬A‚Æ‚¢‚¤‚±‚Æ‚Å‚·BˆêŠÔ‚Ù‚ÇŠÔ‚ğ’u‚¢‚½‚Ì‚¿AÄ“xƒAƒbƒvƒf[ƒg‚ğŠm”F‚µ‚Ä‚­‚¾‚³‚¢B" -foregroundcolor red}else{Write-Host "[ERROR] ‰½‚ç‚©‚ÌƒGƒ‰[‚ª”­¶‚µ‚Ü‚µ‚½BƒCƒ“ƒ^[ƒlƒbƒgÚ‘±‚ğŠm”F‚·‚é‚©Agithub‚ÌƒT[ƒo[‚ª—‚¿‚Ä‚¢‚È‚¢‚©‚ğŠm”F‚µ‚½‚Ì‚¿AÄ“x‚µ‚Ä‚­‚¾‚³‚¢B`nƒGƒ‰[ƒƒO : $_" -foregroundcolor red};break}


    $fileVersion = $file.name -replace "Cursor\.Changer\.|\.bat", ""
    $batVersion = "$env:batverforpowersheller"
    $batName = Get-Item "ƒJ[ƒ\ƒ‹‘Ö‚¦ *.bat"

    if ("$fileVersion" -eq "$batVersion") { return "null" }

    if ($file.name -match "^Cursor\.Changer\..*\.bat$") {
        $fileverArray = $fileVersion -split "\."
        $batverArray = $batVersion -split "\."

        # Function to classify and compare version elements
        function Compare-VersionElement {
            param($a, $b)

            $isANumber = $a -as [int]
            $isBNumber = $b -as [int]

            if ($isANumber -and $isBNumber) {
                return [math]::Sign($isANumber - $isBNumber)
            } elseif ($a -match "^[a-z]+[0-9]*$" -and $b -match "^[a-z]+[0-9]*$") {
                return [math]::Sign([string]::Compare($a, $b))
            } elseif ($a -match "^[a-z]+$" -and $isBNumber) {
                return 1
            } elseif ($isANumber -and $b -match "^[a-z]+$") {
                return -1
            } else {
                return [string]::Compare($a, $b)
            }
        }

        # Function to check if version is beta
        function Is-Beta($versionArray) { return ($versionArray[-1] -match "^[a-z][0-9]*$") }

        $isFileBeta = Is-Beta($fileverArray)
        $isBatBeta = Is-Beta($batverArray)

        # Compare version arrays
        for ($i = 0; $i -lt [Math]::Max($fileverArray.Length, $batverArray.Length); $i++) {
            $fileElement = if ($i -lt $fileverArray.Length) { $fileverArray[$i] } else { "0" }
            $batElement = if ($i -lt $batverArray.Length) { $batverArray[$i] } else { "0" }
            $comparisonResult = Compare-VersionElement $fileElement $batElement

            if ($comparisonResult -gt 0) {
                return "batbeta=$isFileBeta,updateavailable=true,updatemyversion=$batVersion,updateversion=$fileVersion"
            } elseif ($comparisonResult -lt 0) { return "die" }
            if ($i -eq [Math]::Max($fileverArray.Length, $batverArray.Length)) { return "null" }
        }
    }
}


function Fullupdater {
    Write-Host "ƒAƒbƒvƒf[ƒg‚ğŠm”F’†...`n"
    # check the update of Cursor Changer with github api, and Update it.
    $repo = "https://api.github.com/repos/tamago1908/Cursor-Changer.bat/releases/latest"
    try{$file = (Invoke-RestMethod -Uri $repo -Method Get -Headers @{'Accept'='application/vnd.github.v3+json'}).assets | Where-Object { $_.name -like "Cursor.Changer.*" }
    }catch{if($_.Exception.Response.StatusCode.Value__ -eq 403){Write-Host "[ERROR] You have exceeded the GitHub API rate limit. This may be because you have checked for updates too frequently. Please wait for an hour and try again." -foregroundcolor red}else{Write-Host "[ERROR] Oops, something went wrong. You can try again later. or check the internet connection. `nError log : $_" -foregroundcolor red};break}


    $fileVersion = $file.name -replace "Cursor\.Changer\.|\.bat", ""
    $batVersion = "$env:batverforpowersheller"
    $batName = Get-Item "ƒJ[ƒ\ƒ‹‘Ö‚¦ *.bat"

    if ($file.name -match "^Cursor\.Changer\..*\.bat$") {
        $fileverArray = $fileVersion -split "\."
        $batverArray = $batVersion -split "\."

        # Function to classify and compare version elements
        function Compare-VersionElement {
            param($a, $b)

            $isANumber = $a -as [int]
            $isBNumber = $b -as [int]

            if ($isANumber -and $isBNumber) {
                return [math]::Sign($isANumber - $isBNumber)
            } elseif ($a -match "^[a-z]+[0-9]*$" -and $b -match "^[a-z]+[0-9]*$") {
                return [math]::Sign([string]::Compare($a, $b))
            } elseif ($a -match "^[a-z]+$" -and $isBNumber) {
                return 1
            } elseif ($isANumber -and $b -match "^[a-z]+$") {
                return -1
            } else {
                return [string]::Compare($a, $b)
            }
        }

        # Function to check if version is beta
        function Is-Beta($versionArray) { return ($versionArray[-1] -match "^[a-z][0-9]*$") }

        $isFileBeta = Is-Beta($fileverArray)
        $isBatBeta = Is-Beta($batverArray)

        # Compare version arrays
        for ($i = 0; $i -lt [Math]::Max($fileverArray.Length, $batverArray.Length); $i++) {
            $fileElement = if ($i -lt $fileverArray.Length) { $fileverArray[$i] } else { "0" }
            $batElement = if ($i -lt $batverArray.Length) { $batverArray[$i] } else { "0" }
            $comparisonResult = Compare-VersionElement $fileElement $batElement

            if ($comparisonResult -gt 0) {
                Write-Host "ƒAƒbƒvƒf[ƒg‚ª—˜—p‰Â”\‚Å‚·BŒ»İ‚Ìƒo[ƒWƒ‡ƒ“‚ÍA `"$($batVersion)`"‚ÅAƒAƒbƒvƒf[ƒg‚³‚ê‚½ƒo[ƒWƒ‡ƒ“‚Í `"$($fileVersion)`"‚Å‚·B`n"
                Start-Sleep 1
                Changelog
                Start-Sleep 2

                if ($isFileBeta) { Write-Host "[TIP] ‚±‚ÌƒAƒbƒvƒf[ƒg‚Íƒx[ƒ^”Å‚Å‚·B‚È‚Ì‚ÅAˆê•”•sˆÀ’è‚È•”•ª‚ª‚ ‚é‰Â”\«‚ª‚ ‚è‚Ü‚·B`n" -ForeGroundColor DarkGray}

                $answer = Read-Host "ƒAƒbƒvƒf[ƒg‚µ‚Ü‚·‚©H®AƒAƒbƒvƒf[ƒg‚ğƒCƒ“ƒXƒg[ƒ‹‚·‚é‚Æ‹­§“I‚É‰pŒê”Å‚Ö‚Æ•ÏX‚³‚ê‚Ü‚·B (y or n)"
                if ($answer -eq "y") {
                    $downloadFile = Join-Path (Join-Path $env:USERPROFILE "Downloads") $file.name
                    Invoke-WebRequest -Uri $file.url -OutFile $downloadFile -Headers @{'Accept'='application/octet-stream'}
                    Move-Item $downloadFile (Join-Path (Split-Path $batName) "Cursor.Changer.$fileVersion.bat") -Force
                    Remove-Item "ƒJ[ƒ\ƒ‹‘Ö‚¦ $batVersion.bat" -Force
                    Write-Host "ƒAƒbƒvƒf[ƒg‚ÍŠ®—¹‚µ‚Ü‚µ‚½B`n"
                    Start-Sleep 2
                    Write-Host "Ä‹N“®’†..."
                    PowerShell -WindowStyle Hidden -Command Exit
                    Start-process "ƒJ[ƒ\ƒ‹‘Ö‚¦ $fileVersion.bat"
                    Killwhole
                } else {
                    Write-Host "ƒAƒbƒvƒf[ƒg‚ÍƒLƒƒƒ“ƒZƒ‹‚³‚ê‚Ü‚µ‚½B`n"
                    Start-Sleep 2
                    return
                }
            } elseif ($comparisonResult -lt 0) {
                Write-Host "[ERROR] ‚ ‚È‚½‚Ìƒo[ƒWƒ‡ƒ“ ($($batVersion)) ‚ÍAƒAƒbƒvƒf[ƒgƒtƒ@ƒCƒ‹‚æ‚è‚àæs ($($fileVersion)) ‚µ‚Ä‚¢‚Ü‚·I(‹°‚ç‚­A‚ ‚È‚½‚ÍƒJ[ƒ\ƒ‹‘Ö‚¦‚Ìƒo[ƒWƒ‡ƒ“‚ğŒÌˆÓ‚É•Ï‚¦‚½‚Ì‚Å‚µ‚å‚¤...)`n" -ForegroundColor Red
                Start-Sleep 2
                return
            }
        }

        if ($i -eq [Math]::Max($fileverArray.Length, $batverArray.Length)) {
            Write-Host "‚·‚Å‚ÉÅVƒo[ƒWƒ‡ƒ“‚Å‚·I (`"$($batVersion)`") ƒAƒbƒvƒf[ƒg‚Í•K—v‚ ‚è‚Ü‚¹‚ñB`n"
            Start-Sleep 2
        }
    }
}


function Doupdate {
    $repo = "https://api.github.com/repos/tamago1908/Cursor-Changer.bat/releases/latest"
    try{$file = (Invoke-RestMethod -Uri $repo -Method Get -Headers @{'Accept'='application/vnd.github.v3+json'}).assets | Where-Object { $_.name -like "Cursor.Changer.*" }
    }catch{if($_.Exception.Response.StatusCode.Value__ -eq 403){Write-Host "[ERROR] github‚ÌAPIƒŒ[ƒg§ŒÀ‚É“’B‚µ‚Ü‚µ‚½B‚±‚ê‚ªˆÓ–¡‚·‚é‚Ì‚Í—v‚·‚é‚ÉAˆêŠÔˆÈ“à‚É‘å—Ê‚ÉƒAƒbƒvƒf[ƒg‚ğŠm”F‚µ‰ß‚¬A‚Æ‚¢‚¤‚±‚Æ‚Å‚·BˆêŠÔ‚Ù‚ÇŠÔ‚ğ’u‚¢‚½‚Ì‚¿AÄ“xƒAƒbƒvƒf[ƒg‚ğŠm”F‚µ‚Ä‚­‚¾‚³‚¢B" -foregroundcolor red}else{Write-Host "[ERROR] ‰½‚ç‚©‚ÌƒGƒ‰[‚ª”­¶‚µ‚Ü‚µ‚½BƒCƒ“ƒ^[ƒlƒbƒgÚ‘±‚ğŠm”F‚·‚é‚©Agithub‚ÌƒT[ƒo[‚ª—‚¿‚Ä‚¢‚È‚¢‚©‚ğŠm”F‚µ‚½‚Ì‚¿AÄ“x‚µ‚Ä‚­‚¾‚³‚¢B`nƒGƒ‰[ƒƒO : $_" -foregroundcolor red};break}
    $fileVersion = $file.name -replace "Cursor.Changer\.|\.bat", ""
    $batVersion = "$env:batverforpowersheller"
    $batName = Get-Item "ƒJ[ƒ\ƒ‹‘Ö‚¦ *.bat"
    $downloadFolder = Join-Path $env:USERPROFILE "Downloads"
    $downloadFile = Join-Path $downloadFolder $file.name
    Invoke-WebRequest -Uri $file.url -OutFile $downloadFile -Headers @{'Accept'='application/octet-stream'}
    $newBatName = "ƒJ[ƒ\ƒ‹‘Ö‚¦ $fileVersion.bat"
    Move-Item $downloadFile (Join-Path (Split-Path $batName) ("$newBatName")) -Force
    Remove-Item "ƒJ[ƒ\ƒ‹‘Ö‚¦ $fileVersion.bat" -Force
    Write-Host "ƒAƒbƒvƒf[ƒg‚ÍŠ®—¹‚µ‚Ü‚µ‚½B`n"
    Start-Sleep 2
    Write-Host "Ä‹N“®’†..."
    PowerShell -WindowStyle Hidden -Command Exit
    Start-process "Cursor.Changer.$fileVersion.bat"
    Killwhole
}



function OOBEMusic {
# Create a new WebClient instance
$webClient = New-Object System.Net.WebClient

# Prepare a memory stream to hold the downloaded data
$memoryStream = New-Object System.IO.MemoryStream

# Helper function to download data with progress reporting
function DownloadDataWithProgress($url, $memoryStream) {
    try {
        $response = $webClient.OpenRead($url)
        $totalBytes = [int]$webClient.ResponseHeaders["Content-Length"]
        $buffer = New-Object byte[] 8192
        $bytesRead = 0
        $totalRead = 0

        while (($bytesRead = $response.Read($buffer, 0, $buffer.Length)) -gt 0) {
            $memoryStream.Write($buffer, 0, $bytesRead)
            $totalRead += $bytesRead
            $progress = [math]::Round(($totalRead / $totalBytes) * 100)
            [Console]::SetCursorPosition(0, [Console]::CursorTop)
            Write-Host "‰¹Šy‚ğƒ_ƒEƒ“ƒ[ƒh’†... $progress% " -NoNewline
        }

        $memoryStream.Position = 0
        $response.Close()
        Write-Host "`nƒ_ƒEƒ“ƒ[ƒh¬Œ÷I    ‚½‚Ô‚ñ....."
    } catch {
        $errorMsg = if ($_.Exception.Response.StatusCode.Value__ -eq 403) {
            "[ERROR] github‚ÌAPIƒŒ[ƒgƒŠƒ~ƒbƒg‚É“’B‚µ‚Ü‚µ‚½I‚±‚ê‚ªˆÓ–¡‚·‚é‚Ì‚Í—v‚·‚é‚É‚ ‚È‚½‚Í‰¹Šy‚ğÄ¶‚µ‰ß‚¬‚½‚Æ‚¢‚¤‚±‚Æ‚Å‚·B‰¹Šy‚È‚µ‚Å‘±s‚·‚é‚©AˆêŠÔ‚Ù‚ÇŒã‚É‚à‚¤ˆê“x‚â‚è’¼‚µ‚Ä‚­‚¾‚³‚¢B"
        } else {
            "[ERROR] ‰½‚ç‚©‚ÌƒGƒ‰[‚ª”­¶‚µ‚Ü‚µ‚½BƒCƒ“ƒ^[ƒlƒbƒgÚ‘±‚ğŠm”F‚·‚é‚©Agithub‚ÌƒT[ƒo[‚ª—‚¿‚Ä‚¢‚È‚¢‚©‚ğŠm”F‚µ‚½‚Ì‚¿AÄ“x‚µ‚Ä‚­‚¾‚³‚¢B`nƒGƒ‰[ƒƒO : $_"
        }
        Write-Host $errorMsg -ForegroundColor Red
        Write-Host "‰½‚©ƒL[‚ğ‰Ÿ‚µ‚ÄI—¹..."
        $host.UI.RawUI.ReadKey() | Out-Null
        exit
    }
}

# Download data with progress reporting
DownloadDataWithProgress "https://raw.githubusercontent.com/tamago1908/Cursor-Changer.bat/main/resource/Windows_XP_OOBE_for_Cursor_Changer.wav" $memoryStream

# Define the type for playing audio
Add-Type -TypeDefinition @"
using System;
using System.IO;
using System.Media;

namespace ConsoleApp
{
    public class Program
    {
        public static SoundPlayer player;
        
        public static void PlayAudioFromBytes(byte[] data)
        {
            if (data == null || data.Length == 0)
            {
                throw new ArgumentException("Buffer cannot be null or empty.", "data");
            }
            using (MemoryStream stream = new MemoryStream(data))
            {
                player = new SoundPlayer(stream);
                player.PlayLooping(); 
            }
        }

        public static void StopAudio()
        {
            if (player != null)
            {
                player.Stop();
            }
        }
    }
}
"@

# Play the downloaded audio
try {
    [ConsoleApp.Program]::PlayAudioFromBytes($memoryStream.ToArray())
    cls
    Write-Host "‰¹Šy‚ğÄ¶‚µ‚Ä‚¢‚Ü‚·B`n‰¹Šy‚ğ~‚ß‚½‚¢ê‡A‚±‚ÌpowershellƒEƒBƒ“ƒhƒE‚ğI—¹‚µ‚Ä‚­‚¾‚³‚¢B"
} catch {
    Write-Host "[ERROR] ‰¹Šy‚ÌÄ¶‚É¸”s‚µ‚Ü‚µ‚½Bƒtƒ@ƒCƒ‹‚ª³‚µ‚¢‚©A‹ó‚Å‚È‚¢‚©‚ğŠm”F‚µ‚Ä‚­‚¾‚³‚¢B" -ForegroundColor Red
    Write-Host "‰½‚©ƒL[‚ğ‰Ÿ‚µ‚ÄI—¹..."
    $host.UI.RawUI.ReadKey() | Out-Null
    exit
}

# Monitor cmd.exe process
$pid1 = (Get-WmiObject win32_process -filter "processid=$pid").parentprocessid; $pid2 = (Get-WmiObject win32_process -filter "processid=$pid1").parentprocessid
while ($true) {
    Start-Sleep -Seconds 1
    if (-not (Get-Process -pid $pid2 -ErrorAction SilentlyContinue)) {
        [ConsoleApp.Program]::StopAudio()
        exit
    }
  }
}


Function Killwhole {
    Write-Host "`nƒVƒƒƒbƒgƒ_ƒEƒ“’†..."
    Start-Sleep 1
    $pid1 = (Get-WmiObject win32_process -filter "processid=$pid").parentprocessid
    $pid2 = (Get-WmiObject win32_process -filter "processid=$pid1").parentprocessid
    taskkill /pid $pid1 /pid $pid2 /pid $pid > $null 2>&1
}

Function Changelog {
    $h=Get-Host;$w=$h.UI.RawUI;$s=$w.BufferSize;$s.height=(irm -Uri "https://api.github.com/repos/tamago1908/Cursor-Changer.bat/releases/latest").body -split '\r\n' | Measure-Object | %{$_.Count + 22};$w.BufferSize=$s;
    try{if($env:wmodetoggle -eq "false"){Write-Host "ƒ`ƒFƒ“ƒWƒƒO :" -foregroundcolor white}elseif($env:wmodetoggle -eq "true"){Write-Host "Change Log :" -foregroundcolor black }else{Write-Host "Change Log :" -foregroundcolor white};$e=[char]27;$clr="$e[7m";$clred="$e[91m";$clrgrn="$e[92m";$clryel="$e[93m";$clrmag="$e[95m";$clrgra="$e[90m";$clrcyan="$e[96m";$c="$e[0m";if($env:wmodetoggle -eq "true"){$clr="$e[100m$e[97m";$c="$e[0m$e[107m$e[30m"};foreach($s in (irm -Uri "https://api.github.com/repos/tamago1908/Cursor-Changer.bat/releases/latest").body -split '\r\n'){if($s -match "####"){write-host "$clrcyan$e[1m$($s -replace '(^\#+)|(\#+$)', '')$c" `n -NoNewline}elseif($s -match ">"){write-host "$clred$($s -replace '\>', '')$c" `n -NoNewline}elseif($s -match "###"){write-host "$clryel$e[1m$($s -replace '(^\#+)|(\#+$)', '')$c" `n -NoNewline}elseif($s -match "___"){write-host "$clrgra--------------------------------------------------$c" `n -NoNewline}else{$s=$s -replace "\*{3}(.+?)\*{3}", "$e[3m;1m`$1$c";$s=$s -replace "\*{2}(.+?)\*{2}", "$e[1m`$1$c";$s=$s -replace "^\s*-(\s+)(.*)", "$clred-$c`$1`$2";$s=$s -replace "\*+", "";write-host "$s" `n -NoNewline}};rv e,clr,clred,clrgrn,clryel,clrmag,clrgra,clrcyan,c,s}catch{if($_.Exception.Response.StatusCode.Value__ -eq 403){Write-Host "[ERROR] github‚ÌAPIƒŒ[ƒgƒŠƒ~ƒbƒg‚É“’B‚µ‚Ü‚µ‚½I‚±‚ê‚ªˆÓ–¡‚·‚é‚Ì‚Í—v‚·‚é‚É‚ ‚È‚½‚Í‰¹Šy‚ğÄ¶‚µ‰ß‚¬‚½‚Æ‚¢‚¤‚±‚Æ‚Å‚·B‰¹Šy‚È‚µ‚Å‘±s‚·‚é‚©AˆêŠÔ‚Ù‚ÇŒã‚É‚à‚¤ˆê“x‚â‚è’¼‚µ‚Ä‚­‚¾‚³‚¢B" -foregroundcolor red}else{Write-Host "[ERROR] ‰½‚ç‚©‚ÌƒGƒ‰[‚ª”­¶‚µ‚Ü‚µ‚½BƒCƒ“ƒ^[ƒlƒbƒgÚ‘±‚ğŠm”F‚·‚é‚©Agithub‚ÌƒT[ƒo[‚ª—‚¿‚Ä‚¢‚È‚¢‚©‚ğŠm”F‚µ‚½‚Ì‚¿AÄ“x‚µ‚Ä‚­‚¾‚³‚¢B`nƒGƒ‰[ƒƒO : $_" -foregroundcolor red};break}
}


if ($env:checkupdatetoggle -eq "true") {Disablemax; Updater} else {Disablemax}
if ($env:Powersheller -eq "RefreshCursor") {RefreshCursor}
if ($env:Powersheller -eq "Fullupdater") {Fullupdater}
if ($env:Powersheller -eq "OOBEMusic") {OOBEMusic}
if ($env:Powersheller -eq "Updater") {Updater}
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
if "%bootbatnow%"=="no" (set Powersheller=& exit /b)
if "%Powersheller%"=="OOBEMusic" (set Powersheller=& exit /b)
set Powersheller=

rem get updater variable
if "%checkupdatetoggle%"=="true" (goto :Powersheller_get_updater_variable) else (goto :Powersheller_get_updater_variable_end)

:Powersheller_get_updater_variable
rem powershell‚Ì–ß‚è’l‚ğbatch‚Ì•Ï”‚É•ÏŠ·
setlocal enabledelayedexpansion
if "%updateinfo%"=="null" (goto :Powersheller_get_updater_variable_end)
if "%updateinfo%"=="die" (set Punish=true& goto :Powersheller_get_updater_variable_end)
for /f "tokens=1-4 delims=," %%a in ("%updateinfo%") do (
  for /f "tokens=1-2 delims==" %%x in ("%%a") do set "%%x=%%y"& for /f "tokens=1-2 delims==" %%x in ("%%b") do set "%%x=%%y"& for /f "tokens=1-2 delims==" %%x in ("%%c") do set "%%x=%%y"& for /f "tokens=1-2 delims==" %%x in ("%%d") do set "%%x=%%y"
)
setlocal disabledelayedexpansion
set updatemyversion=%batver:ƒÀ=.b%

:Powersheller_get_updater_variable_end
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Powersheller is Ended...)
set updateinfo=
set checkupdatetoggle=
cd /d %batchmainpath%

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

rem ƒo[ƒWƒ‡ƒ“1.10 ¡‰ñ‚ÌƒAƒbƒvƒf[ƒg‚ÍƒJ[ƒ\ƒ‹‘Ö‚¦jãÅ‚àBIG‚ÈƒAƒbƒvƒf[ƒg‚¾B‚Ü‚¸Aİ’èƒƒjƒ…[‚ÆÅ‰‚Ìƒƒjƒ…[‚ÉUI‚ª’Ç‰Á‚³‚êAƒƒjƒ…[‚Ì®—‚ªs‚í‚êAƒzƒƒCƒgƒ‚[ƒh‚ÆAlldef‚ªˆÚ“®‚µ‚½BAlldef‚É‚Í©ŒÈÁ‹‹@”\‚ª’Ç‰Á‚³‚êAƒAƒ“ƒCƒ“ƒXƒg[ƒ‹ƒƒjƒ…[‚ªŒ±“I‹@”\‚Æ‚µ‚ÄV‚½‚ÉÀ‘•‚³‚ê‚½B‚»‚µ‚Ä‰‰ñ‹N“®ƒƒbƒZ[ƒW‚ª•ÏX‚³‚êAŒy‚­ƒAƒjƒ[ƒVƒ‡ƒ“‚·‚é‚æ‚¤‚É‚È‚èAƒƒbƒZ[ƒW‚à•ÏX‚³‚ê‚½B‚»‚µ‚ÄAƒJ[ƒ\ƒ‹‘Ö‚¦‚Ì‰Šú‚Ìƒo[ƒWƒ‡ƒ“‚©‚ç‚ ‚Á‚½ƒJ[ƒ\ƒ‹‚ğ•Ï‚¦‚éƒƒjƒ…[‚ª‚È‚ñ‚Æ“‡‚³‚êA”’F‚Æ•F‚ğ©“®“I‚É”F¯‚µ‚ÄA‘I‘ğ‚µ‚È‚­‚Ä‚à©“®“I‚É•ÏX‚³‚ê‚é‚æ‚¤‚É‚È‚Á‚½B‚»‚µ‚Ä‚¿‚å‚Á‚Æ‚µ‚½‰B‚µ—v‘f‚à’Ç‰Á‚³‚ê‚½B‚Ü‚½Aİ’è‚à©“®“I‚É‹L“ü‚³‚ê‚é‚æ‚¤‚É‚È‚èAƒoƒO‚âŒëš’Eš‚à’¼‚³‚ê‚½B‚»‚êˆÈŠO‚É‚à‚½‚­‚³‚ñ‚Ì•”•ª‚ª•ÏX‚³‚êA‚à‚Í‚â•Ê•¨‚É‚È‚Á‚½B
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

rem ############################################################################################################################

:CursorChangerOOBE
if not "%bootbatnow%"=="true" (
if "%linuxboot%"=="true" (
echo.&echo [%linuxishclr%info%linuxishclr2%] Initial Process ended!&echo.
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] SAB_Manager Calling...&echo.)
)
)
rem Detects whether this is the first start
if exist %Settingsfile% set firststartbat=no& set bootbatnow=yes& goto :batstart
if not exist %Settingsfile% (
if exist %FirstSTFsfile% goto :settingloads
)
if not defined dummy (echo [38;2;5;5;5myou know what i HATE? that's [3mbepis[0m[38;2;5;5;5m.)
if not defined dummy (echo [38;2;5;5;5mTHE TASTE, the smell, the texture... hey.... your [3mdrooling[0m[38;2;5;5;5m......)
ping -n 1 -w 500 localhost >nul
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
if "%count%" == "200" (ping -n 2 -w 500 localhost >nul& set count=& goto :CursorChangerOOBE_Animation2) else (
    ping -n 0 -w 500 localhost >nul
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
    set clresc=& pause >nul& echo.& echo %show%& ping -n 1 -w 500 localhost >nul
    set count=200& set count2=120& set clresc=204;204;204
    goto :CursorChangerOOBE_Animation3
) else (
    ping -n 1 -w 500 localhost >nul & goto :CursorChangerOOBE_Animation2
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
    if !count! leq 20 (ping -n 1 -w 500 localhost >nul& set count=& set count2=0& set clresc=200;200;200& set clrmove=22& goto :CursorChangerOOBE_Animation4)
) else (
    ping -n 0 -w 500 localhost >nul & goto :CursorChangerOOBE_Animation3
)

:CursorChangerOOBE_Animation4
echo %show%
rem Play CursorChangerOOBE_Animations that move left
set "show=[2;%clrmove%H[38;2;%clresc%mƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ‚Ö‚æ‚¤‚±‚»   [0m"
set /a clrmove-=1
if %clrmove% equ 1 (
    goto :CursorChangerOOBE_Animation5
) else (
    ping -n 0 -w 500 localhost >nul & goto :CursorChangerOOBE_Animation4
)

:CursorChangerOOBE_Animation5
rem WOW IT CHANGED INTO SETUP!!!!!!!!!
ping -n 2 -w 500 localhost >nul & cls
set "show=[38;2;%clresc%m  ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒZƒbƒgƒAƒbƒv [0m"
echo.
echo %show%
ping -n 2 -w 500 localhost >nul
set show=& set show2=& set clresc=& set clrmove=& set count2=& set count=
setlocal disabledelayedexpansion


:CursorChangerOOBEdev
rem Now, it's the beginning of a fucking trashy long goofy ahh idiot code.
title ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒZƒbƒgƒAƒbƒv
if not defined dummy (set clr=[3m[97m&set clrhigh=[7m&set clrhighend=[0m&set clrwhi=[48;5;250m[30m&set clr2=[0m&set clrgra=[90m)
if not defined dummy (set moveline=[22;0H) else (set moveline=[22;0H)
if not defined dummy (set /p nothing=[?25l<nul)
mode con: cols=80 lines=22
echo.
echo   ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒZƒbƒgƒAƒbƒv
echo ====================================O
echo.
echo     %clr% ƒZƒbƒgƒAƒbƒv‚Ö‚æ‚¤‚±‚»B%clr2%
echo.
echo     ƒJ[ƒ\ƒ‹‘Ö‚¦‚Ì‰‰ñ‹N“®‚ÆƒZƒbƒgƒAƒbƒv‚Ö‚æ‚¤‚±‚»B
echo     ‚±‚ÌƒZƒbƒgƒAƒbƒv‚ÍƒJ[ƒ\ƒ‹‘Ö‚¦‚ğ‚¨g‚¢‚Ì
echo     ƒRƒ“ƒsƒ…[ƒ^[‚ÅÀs‚Å‚«‚éó‘Ô‚É‚·‚é‚½‚ß‚ÌƒZƒbƒgƒAƒbƒv‚Å‚·B
echo.
echo.
echo          ^E     ¡‚·‚®ƒZƒbƒgƒAƒbƒv‚·‚éê‡‚ÍAEƒL[‚ğ‰Ÿ‚µ‚Ä‚­‚¾‚³‚¢B
echo.
echo          ^E     ƒZƒbƒgƒAƒbƒv‚ğƒXƒLƒbƒv‚µ‚Ä¡‚·‚®—˜—p‚·‚éê‡‚ÍA
echo                 SƒL[‚ğ‰Ÿ‚µ‚Ä‚­‚¾‚³‚¢B(İ’è‚Í‚·‚×‚ÄŠù’è’l‚Éİ’è‚³‚ê‚Ü‚·B)
echo.
echo          ^E     ƒZƒbƒgƒAƒbƒv‚ğ‚¹‚¸‚ÉI—¹‚·‚éê‡‚ÍABƒL[‚ğ‰Ÿ‚µ‚Ä‚­‚¾‚³‚¢B
echo.
echo.
echo.
echo.
set /p nothing=%clrwhi%     E=‘±s     S=ƒXƒLƒbƒv     B=‘Şo                                           %moveline%%clrwhi% <nul& choice /c ESB /n >nul
if %ErrorLevel%==1 goto :OOBEmain
if %ErrorLevel%==2 goto :OOBESkip
if %ErrorLevel%==3 call :OOBEmainshutdown& timeout /t 1 /nobreak >nul&call :exit 

:OOBESkip
color 07
cls
echo.
echo   ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒZƒbƒgƒAƒbƒv
echo ====================================O
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
echo.
echo.
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     Y=ƒXƒLƒbƒv     N,B=ƒXƒLƒbƒv‚µ‚È‚¢                                          %moveline%%clrwhi% <nul& choice /c YNB /n >nul
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&set oobetheme=dark&set OOBEsetting1toggle=false&set OOBEsetting2toggle=false&set OOBEsetting3toggle=false&set OOBEsetting4toggle=true&set OOBEsetting5toggle=true&set YourName=%Username%& goto :OOBEmain8
if %ErrorLevel%==2 color 07&cls&goto :CursorChangerOOBEdev
if %ErrorLevel%==3 color 07&cls&goto :CursorChangerOOBEdev

:OOBEmain
curl -silent http://www.msftconnecttest.com/connecttest.txt | find "Microsoft Connect Test" >nul
if "%errorlevel%"=="1" (call :OOBEmainblank & timeout /t 1 /nobreak >nul & goto :OOBEmain2)
curl -silent http://www.msftncsi.com/ncsi.txt | find "Microsoft NCSI" >nul
if "%errorlevel%"=="1" (call :OOBEmainblank & timeout /t 1 /nobreak >nul & goto :OOBEmain2)
ping -n 1 google.com >nul
if "%errorlevel%"=="1" (call :OOBEmainblank & timeout /t 1 /nobreak >nul & goto :OOBEmain2)
color 07
cls
echo.
echo   ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒZƒbƒgƒAƒbƒv
echo ====================================O
echo.
echo.
echo          Windows XP‚ÌOOBE BGM‚ğ•·‚«‚È‚ª‚çƒZƒbƒgƒAƒbƒv‚µ‚Ü‚·‚©H
echo.
echo          •·‚«‚½‚¢‚È‚çAYƒL[‚ğ‰Ÿ‚µ‚Ä‚­‚¾‚³‚¢B
echo          •·‚«‚½‚­‚È‚¢‚È‚çANƒL[‚ğ‰Ÿ‚µ‚Ä‚­‚¾‚³‚¢B
echo.
echo.
echo          %clrgra%(Y‚ğ‰Ÿ‚·‚Æ–ñ15MB’ö“x‚Ìƒ_ƒEƒ“ƒ[ƒh‚ª”­¶‚µ‚Ü‚·B)%clr2%
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     Y=‘±s     N=‚¢‚¢‚¦                                                        %moveline%%clrwhi% <nul& choice /c YN /n >nul
if %ErrorLevel%==1 goto :OOBEmainmusic
if %ErrorLevel%==2 call :OOBEmainblank&timeout /t 1 /nobreak >nul&goto :OOBEmain2


:OOBEmainmusic
call :OOBEmainmusicmessage
set Powersheller=OOBEMusic&call :Powersheller
goto :OOBEmainmusicmessage2

:OOBEmainmusicmessage
color 07
cls
echo.
echo   ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒZƒbƒgƒAƒbƒv
echo ====================================O
echo.
echo.
echo          ‰¹Šy‚Ìƒ_ƒ“ƒ[ƒh‚ğ€”õ‚µ‚Ä‚¢‚Ü‚·...‚µ‚Î‚ç‚­‚¨‘Ò‚¿‚­‚¾‚³‚¢B
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
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%                                                                                %moveline%%clrwhi% <nul
exit /b

:OOBEmainblank
if "%oobetheme%"=="white" (color f0) else (color 07)
cls
echo.
echo   ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒZƒbƒgƒAƒbƒv
echo ====================================O
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
echo.
echo.
echo.
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%                                                                                %moveline%%clrwhi% <nul
exit /b


:OOBEmainshutdown
if "%oobetheme%"=="white" (color f0) else (color 07)
cls
echo.
echo   Cursor Changer %batver% Setup
echo ================================O
echo.
echo.
echo          ƒVƒƒƒbƒgƒ_ƒEƒ“’†...
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
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%                                                                                %moveline%%clrwhi% <nul
exit /b


:OOBEmainmusicmessage2
set batchpath=
color 07
cls
echo.
echo   ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒZƒbƒgƒAƒbƒv
echo ====================================O
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
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%                                                                                %moveline%%clrwhi% <nul
timeout /t 5 /nobreak >nul
call :OOBEmainblank
timeout /t 1 /nobreak >nul
goto :OOBEmain2


:OOBEmain2
color 07
cls
echo.
echo   ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒZƒbƒgƒAƒbƒv
echo ====================================O
echo ƒZƒbƒgƒAƒbƒvi’» : 1/5 (’ˆÓ–€‚ÌŠm”F)
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
set /p nothing=%clr2%%clrwhi%     Y=‘±s                                                                  1/3%moveline%%clrwhi% <nul&choice /c Y /n >nul
if %ErrorLevel%==1 goto :OOBEmain3


:OOBEmain3
color 07
cls
echo.
echo   ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒZƒbƒgƒAƒbƒv
echo ====================================O
echo ƒZƒbƒgƒAƒbƒvi’» : 1/5 (’ˆÓ–€‚ÌŠm”F)
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
set /p nothing=%clr2%%clrwhi%     Y=‘±s                                                                  2/3%moveline%%clrwhi% <nul&choice /c Y /n >nul
if %ErrorLevel%==1 goto :OOBEmain4


:OOBEmain4
color 07
cls
echo.
echo   ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒZƒbƒgƒAƒbƒv
echo ====================================O
echo ƒZƒbƒgƒAƒbƒvi’» : 1/5 (’ˆÓ–€‚ÌŠm”F)
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
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     Y=‘±s                                                                  3/3%moveline%%clrwhi% <nul&choice /c Y /n >nul
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul


:OOBEmain5
color 07
cls
echo.
echo   ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒZƒbƒgƒAƒbƒv
echo ====================================O
echo ƒZƒbƒgƒAƒbƒvi’» : 2/5 (î•ñ‚ÌŠm”F)
echo.
echo.
echo          Œ»İAƒJ[ƒ\ƒ‹‘Ö‚¦‚Í“ú–{Œê”Å‚ªƒCƒ“ƒXƒg[ƒ‹‚³‚ê‚Ä‚¢‚Ü‚·B
echo          ‚±‚ê‚Å‚¢‚¢‚Å‚·‚©H
echo.
echo.
echo          (Y=‚Í‚¢B³‚µ‚¢BŒ¾‚¤‚Ü‚Å‚à‚È‚¢B)
echo          (N=‚¢‚¢‚¦B‚É‚Ù‚ñ‚²‚ª‚í‚©‚è‚Ü‚¹‚ñ)
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     Y=‘±s     N=‚¢‚¢‚¦                                                        %moveline%%clrwhi% <nul&choice /c YN /n >nul
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto :OOBEmain5_1
if %ErrorLevel%==2 goto :OOBEmain5ifno


:OOBEmain5ifno
color 07
cls
echo.
echo   ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒZƒbƒgƒAƒbƒv
echo ====================================O
echo ƒZƒbƒgƒAƒbƒvi’» : 2/5 (î•ñ‚ÌŠm”F)
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
echo.
echo.
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     Y=‘±s     N=‚¢‚¢‚¦                                                        %moveline%%clrwhi% <nul&choice /c YN /n >nul
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto :OOBEmain5_1
if %ErrorLevel%==2 call :OOBEmainshutdown & timeout /t 1 /nobreak >nul&call :exit 


:OOBEmain5_1
color 07
cls
echo.
echo   ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒZƒbƒgƒAƒbƒv
echo ====================================O
echo ƒZƒbƒgƒAƒbƒvi’» : 2/5 (î•ñ‚ÌŠm”F)
echo.
echo.
echo          ƒJ[ƒ\ƒ‹‘Ö‚¦‚ª‚ ‚È‚½‚Ì–‚ğ‰½‚ÆŒÄ‚ñ‚Å—~‚µ‚¢‚©‚ğ“ü—Í‚Å‚«‚Ü‚·B
echo          ƒfƒtƒHƒ‹ƒg‚Å‚ÍAƒJ[ƒ\ƒ‹‘Ö‚¦‚Í‚ ‚È‚½‚Ì‚±‚Æ‚ğ"%USERNAME%"‚ÆŒÄ‚Ñ‚Ü‚·B
echo          •ÏX‚µ‚Ü‚·‚©H
echo.
echo.
echo          (Y=‚Í‚¢A•ÏX‚µ‚Ü‚·B)
echo          (N=‚¢‚¢‚¦A‚»‚Ì‚Ü‚Ü‚ÅB)
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     Y=‚Í‚¢     N=‚¢‚¢‚¦                                                        %moveline%%clrwhi% <nul&choice /c YN /n >nul
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto :OOBEmain5_2
if %ErrorLevel%==2 call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto :OOBEmain6


:OOBEmain5_2
set YourName=
color 07
cls
echo.
echo   ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒZƒbƒgƒAƒbƒv
echo ====================================O
echo ƒZƒbƒgƒAƒbƒvi’» : 2/5 (î•ñ‚ÌŠm”F)
echo.
echo.
echo          ‚Å‚ÍAˆÈ‰º‚É‚È‚ñ‚ÆŒÄ‚Î‚ê‚½‚¢‚©‚ğ“ü—Í‚µ‚Ä‚­‚¾‚³‚¢B
echo.
echo.
echo          “ü—Í—“ :
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
if not defined dummy (
set /p nothing=%clr2%%clrwhi%                                                                                %moveline%%clrwhi% <nul&set /p YourName=%clr2%[10;18H
)
if %ErrorLevel%==2 goto :OOBEmain5_2c


:OOBEmain5_2c
if not defined Yourname goto :OOBEmain5_2c_error
color 07
cls
echo.
echo   ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒZƒbƒgƒAƒbƒv
echo ====================================O
echo ƒZƒbƒgƒAƒbƒvi’» : 2/5 (î•ñ‚ÌŠm”F)
echo.
echo.
echo          "%YourName%"‚Æ“ü—Í‚µ‚Ü‚µ‚½B
echo          ‚±‚ê‚Å‚¢‚¢‚Å‚·‚©H
echo.
echo.
echo          (Y=‚Í‚¢I)
echo          (N=‚¢‚¢‚¦)
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     Y=‚Í‚¢     N=‚¢‚¢‚¦                                                        %moveline%%clrwhi% <nul&choice /c YN /n >nul
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto :OOBEmain6
if %ErrorLevel%==2 goto :OOBEmain5_2


:OOBEmain5_2c_error
color 07
cls
echo.
echo   ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒZƒbƒgƒAƒbƒv
echo ====================================O
echo ƒZƒbƒgƒAƒbƒvi’» : 2/5 (î•ñ‚ÌŠm”F)
echo.
echo.
echo          ‚ ‚È‚½‚Ì–¼‘O‚É‚Í•K‚¸‰½‚©‚ğ“ü—Í‚µ‚Ä‚­‚¾‚³‚¢B
echo          –¼‘O‚È‚µ‚Å‘±s‚·‚é‚±‚Æ‚Í‚Å‚«‚Ü‚¹‚ñI
echo.
echo.
echo          (‰½‚©ƒL[‚ğ‰Ÿ‚µ‚Ä‘±s...)
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
set /p nothing=%clr2%%clrwhi%                                                                                %moveline%%clrwhi% <nul&pause >nul
goto :OOBEmain5_2



:OOBEmain6
color 07
cls
echo.
echo   ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒZƒbƒgƒAƒbƒv
echo ====================================O
echo ƒZƒbƒgƒAƒbƒvi’» : 3/5 (ƒJ[ƒ\ƒ‹‘Ö‚¦‚Ìƒe[ƒ}‚Ìİ’è)
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
echo.
echo.
echo.
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     Y=‘±s     N=‚¢‚¢‚¦                                                        %moveline%%clrwhi% <nul&choice /c YN /n >nul
if %ErrorLevel%==1 goto :OOBEmain6theme1
if %ErrorLevel%==2 call :OOBEmainblank & timeout /t 1 /nobreak >nul&set oobetheme=dark&goto :OOBEmain7


:OOBEmain6theme1
if "%OOBEundiscard%"=="true" (call :OOBEmainblank & timeout /t 1 /nobreak >nul&set oobetheme=dark&set OOBEundiscard=&goto :OOBEmain7)
color 07
cls
echo.
echo   ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒZƒbƒgƒAƒbƒv
echo ====================================O
echo ƒZƒbƒgƒAƒbƒvi’» : 3/5 (ƒJ[ƒ\ƒ‹‘Ö‚¦‚Ìƒe[ƒ}‚Ìİ’è)
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
echo.
echo.
echo.
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     A,1=¶‚É“®‚©‚·     D,2=‰E‚É“®‚©‚·     B=‘Şo                               %moveline%%clrwhi% <nul&choice /c AD12B /n >nul
if %ErrorLevel%==1 goto :OOBEmain6theme2
if %ErrorLevel%==2 goto :OOBEmain6theme2
if %ErrorLevel%==3 goto :OOBEmain6theme2
if %ErrorLevel%==4 goto :OOBEmain6theme3
if %ErrorLevel%==5 call :OOBEmain6themeifback&goto :OOBEmain6theme1


:OOBEmain6theme2
if "%OOBEundiscard%"=="true" (call :OOBEmainblank & timeout /t 1 /nobreak >nul&set oobetheme=dark&set OOBEundiscard=&goto :OOBEmain7)
if defined clrhigh (set clrhigh=[7m&set clrhighend=[0m)
color 07
cls
echo.
echo   ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒZƒbƒgƒAƒbƒv
echo ====================================O
echo ƒZƒbƒgƒAƒbƒvi’» : 3/5 (ƒJ[ƒ\ƒ‹‘Ö‚¦‚Ìƒe[ƒ}‚Ìİ’è)
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
echo.
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     A,1=¶‚É“®‚©‚·     D,2=‰E‚É“®‚©‚·     Y,E=Œˆ’è     B=‘Şo                  %moveline%%clrwhi% <nul&choice /c AD12BYE /n >nul
if %ErrorLevel%==1 goto :OOBEmain6theme2
if %ErrorLevel%==2 goto :OOBEmain6theme3
if %ErrorLevel%==3 goto :OOBEmain6theme2
if %ErrorLevel%==4 goto :OOBEmain6theme3
if %ErrorLevel%==5 call :OOBEmain6themeifback&goto :OOBEmain6theme2
if %ErrorLevel%==6 goto :OOBEmain6theme2confirm
if %ErrorLevel%==7 goto :OOBEmain6theme2confirm


:OOBEmain6theme3
if "%OOBEundiscard%"=="true" (call :OOBEmainblank & timeout /t 1 /nobreak >nul&set oobetheme=dark&set OOBEundiscard=&goto :OOBEmain7)
if defined clrhigh (set clrhigh=[100m[97m&set clrhighend=[0m[107m[30m)
color f0
cls
echo.
echo   ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒZƒbƒgƒAƒbƒv
echo ====================================O
echo ƒZƒbƒgƒAƒbƒvi’» : 3/5 (ƒJ[ƒ\ƒ‹‘Ö‚¦‚Ìƒe[ƒ}‚Ìİ’è)
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
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     A,1=¶‚É“®‚©‚·     D,2=‰E‚É“®‚©‚·     Y,E=‘±s     B=‘Şo                  %moveline%%clrwhi% <nul&choice /c AD12BYE /n >nul
if %ErrorLevel%==1 goto :OOBEmain6theme2
if %ErrorLevel%==2 goto :OOBEmain6theme3
if %ErrorLevel%==3 goto :OOBEmain6theme2
if %ErrorLevel%==4 goto :OOBEmain6theme3
if %ErrorLevel%==5 call :OOBEmain6themeifback&goto :OOBEmain6theme3
if %ErrorLevel%==6 goto :OOBEmain6theme3confirm
if %ErrorLevel%==7 goto :OOBEmain6theme3confirm


:OOBEmain6theme2confirm
color 07
cls
echo.
echo   ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒZƒbƒgƒAƒbƒv
echo ====================================O
echo ƒZƒbƒgƒAƒbƒvi’» : 3/5 (ƒJ[ƒ\ƒ‹‘Ö‚¦‚Ìƒe[ƒ}‚Ìİ’è)
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
echo.
echo.
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     Y,E=‘±s     B,N=I—¹                                                      %moveline%%clrwhi% <nul&choice /c BNYE /n >nul
if %ErrorLevel%==1 goto :OOBEmain6theme2
if %ErrorLevel%==2 goto :OOBEmain6theme2
if %ErrorLevel%==3 call :OOBEmainblank & timeout /t 1 /nobreak >nul&set oobetheme=dark&goto :OOBEmain7
if %ErrorLevel%==4 call :OOBEmainblank & timeout /t 1 /nobreak >nul&set oobetheme=dark&goto :OOBEmain7



:OOBEmain6theme3confirm
color f0
cls
echo.
echo   ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒZƒbƒgƒAƒbƒv
echo ====================================O
echo ƒZƒbƒgƒAƒbƒvi’» : 3/5 (ƒJ[ƒ\ƒ‹‘Ö‚¦‚Ìƒe[ƒ}‚Ìİ’è)
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
echo.
echo.
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     Y,E=‘±s     B,N=I—¹                                                      %moveline%%clrwhi% <nul&choice /c BNYE /n >nul
if %ErrorLevel%==1 goto :OOBEmain6theme3
if %ErrorLevel%==2 goto :OOBEmain6theme3
if %ErrorLevel%==3 set oobetheme=white&call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto :OOBEmain7
if %ErrorLevel%==4 set oobetheme=white&call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto :OOBEmain7


:OOBEmain6themeifback
if "%oobetheme%"=="white" (color f0) else (color 07)
cls
echo.
echo   ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒZƒbƒgƒAƒbƒv
echo ====================================O
echo ƒZƒbƒgƒAƒbƒvi’» : 3/5 (ƒJ[ƒ\ƒ‹‘Ö‚¦‚Ìƒe[ƒ}‚Ìİ’è)
echo.
echo.
echo          –{“–‚Éƒe[ƒ}‚Ì‘I‘ğ‚ğ”jŠü‚µ‚Ü‚·‚©H
echo          (”jŠü‚µ‚½ê‡AŠù’è’l‚Ìƒe[ƒ}‚Éİ’è‚³‚ê‚Ü‚·B)
echo.
echo.
echo          (Y=‚Í‚¢B”jŠü‚µ‚Ü‚·B)
echo          (N=‚¢‚¢‚¦Bƒe[ƒ}‚ğ‘I‘ğ‚µ‚Ü‚·)
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     Y=‚Í‚¢     N=‚¢‚¢‚¦                                                        %moveline%%clrwhi% <nul&choice /c YN /n >nul
if %ErrorLevel%==1 set OOBEundiscard=true&exit /b
if %ErrorLevel%==2 exit /b

:OOBEmain7
if "%oobetheme%"=="white" (color f0) else (color 07)
cls
echo.
echo   ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒZƒbƒgƒAƒbƒv
echo ====================================O
echo ƒZƒbƒgƒAƒbƒvi’» : 4/5 (İ’è‚ÌƒJƒXƒ^ƒ}ƒCƒY)
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
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     Y=‘±s     N=‚¢‚¢‚¦                                                        %moveline%%clrwhi% <nul&choice /c YN /n >nul
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto :OOBEmain7CustomizeSettings
if %ErrorLevel%==2 call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto :OOBEmain8

:OOBEmain7CustomizeSettingsdiscard
if "%oobetheme%"=="white" (color f0) else (color 07)
cls
echo.
echo   ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒZƒbƒgƒAƒbƒv
echo ====================================O
echo ƒZƒbƒgƒAƒbƒvi’» : 4/5 (İ’è‚ÌƒJƒXƒ^ƒ}ƒCƒY)
echo.
echo.
echo          –{“–‚Éİ’è‚ÌƒJƒXƒ^ƒ}ƒCƒY‚ğ”jŠü‚µ‚Ü‚·‚©H
echo.
echo          (”jŠü‚µ‚½ê‡A‚·‚×‚Ä‚Ìİ’è‚ÍŠù’è’l‚Éİ’è‚³‚ê‚Ü‚·)
echo.
echo          (Y=‚Í‚¢I”jŠü‚µ‚Ü‚·II)
echo          (N=‚¢‚¢‚¦IƒJƒXƒ^ƒ}ƒCƒY‚µ‚½‚¢‚Å‚·I)
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     Y=‚Í‚¢     N=‚¢‚¢‚¦                                                        %moveline%%clrwhi% <nul&choice /c YN /n >nul
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&set OOBEsetting1toggle=true&set OOBEsetting2toggle=false&set OOBEsetting3toggle=false&set OOBEsetting4toggle=true&set OOBEsetting5toggle=true&goto :OOBEmain8
if %ErrorLevel%==2 goto :OOBEmain7CustomizeSettings1

:OOBEmain7CustomizeSettings
if "%oobetheme%"=="white" (set OOBEsettingclr=[100m[97m&set OOBEsettingclr2=[0m[107m[30m)
if "%oobetheme%"=="dark" (set OOBEsettingclr=[7m&set OOBEsettingclr2=[0m)
set OOBEsetting1toggle=false&set OOBEsetting2toggle=false&set OOBEsetting3toggle=false&set OOBEsetting4toggle=false&set OOBEsetting5toggle=false
if "%oobetheme%"=="white" (color f0) else (color 07)
cls
echo.
echo   ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒZƒbƒgƒAƒbƒv
echo ====================================O
echo ƒZƒbƒgƒAƒbƒvi’» : 4/5 (İ’è‚ÌƒJƒXƒ^ƒ}ƒCƒY)
echo.
echo.
echo          O================================O   İ’è‚ÌƒJƒXƒ^ƒ}ƒCƒY
echo          I 1 ‹N“®‚ÉƒJ[ƒ\ƒ‹‘Ö‚¦‚Å‹N“®   I
echo          O================================O   ‰½‚à‘I‘ğ‚³‚ê‚Ä‚¢‚Ü‚¹‚ñB
echo          I 2 ‹N“®‚ÌƒAƒhƒ~ƒ“             I
echo          O================================O   W ‚Ü‚½‚Í SA1‚©‚ç5‚Å‘I‘ğ‚µA
echo          I 3 ‹N“®‚ÉXVŠm”F             I   Y ‚ÅØ‚è‘Ö‚¦A N ‚Ü‚½‚Í B‚Å
echo          O================================O   ”jŠü‚µ‚Ü‚·B
echo          I 4 Enter‚Ì’·‰Ÿ‚µ‚ğŒŸ’m‚·‚é‹@”\  I   OK ‚ÉˆÚ“®‚µ‚½‚Ì‚¿AY
echo          O================================O   ‚ÅŠm’è‚µ‚Ü‚·B
echo          I 5 ‹N“®‚ÌƒAƒjƒ[ƒVƒ‡ƒ“       I   
echo          O================================O
echo                       I  OK  I
echo                       O======O
echo.
echo.
set /p nothing=%clr2%%clrwhi%     W,S ‚à‚µ‚­‚Í 1~5=“®‚©‚·     Y=Ø‚è‘Ö‚¦     N,B=”jŠü                        %moveline%%clrwhi% <nul&choice /c WS12345YNB6 /n >nul
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
if "%oobetheme%"=="white" (color f0) else (color 07)
cls
if "%OOBEsetting1toggle%"=="true" (set OOBEsettingclr=[46m) else if "%OOBEsetting1toggle%"=="false" (
if "%oobetheme%"=="white" (set OOBEsettingclr=[100m[97m&set OOBEsettingclr2=[0m[107m[30m)
if "%oobetheme%"=="dark" (set OOBEsettingclr=[7m&set OOBEsettingclr2=[0m)
)
echo.
echo   ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒZƒbƒgƒAƒbƒv
echo ====================================O
echo ƒZƒbƒgƒAƒbƒvi’» : 4/5 (İ’è‚ÌƒJƒXƒ^ƒ}ƒCƒY)
echo.
echo.
echo          O================================O   İ’è‚ÌƒJƒXƒ^ƒ}ƒCƒY
echo          I%OOBEsettingclr% 1 ‹N“®‚ÉƒJ[ƒ\ƒ‹‘Ö‚¦‚Å‹N“®   %OOBEsettingclr2%I
echo          O================================O   ƒJ[ƒ\ƒ‹‘Ö‚¦‚Ì‹N“®Œã‚ÉA
echo          I%OOBEsetting2clr% 2 ‹N“®‚ÌƒAƒhƒ~ƒ“             %OOBEsetting2clr2%I   ƒJ[ƒ\ƒ‹‘Ö‚¦‚É‘JˆÚ
echo          O================================O   ‚·‚é‚©‚ğØ‚è‘Ö‚¦‚Ü‚·B
echo          I%OOBEsetting3clr% 3 ‹N“®‚ÉXVŠm”F             %OOBEsetting3clr2%I   —LŒø‚É‚·‚é‚ÆAƒJ[ƒ\ƒ‹‚ğ‚·‚®‚É
echo          O================================O   •ÏX‚Å‚«‚Ü‚·B
echo          I%OOBEsetting4clr% 4 Enter‚Ì’·‰Ÿ‚µ‚ğŒŸ’m‚·‚é‹@”\  %OOBEsetting4clr2%I
echo          O================================O   %clrgra%–³Œø‚É‚·‚é‚Ì‚ğ„§%OOBEsettingclr2%
echo          I%OOBEsetting5clr% 5 ‹N“®‚ÌƒAƒjƒ[ƒVƒ‡ƒ“       %OOBEsetting5clr2%I
echo          O================================O
echo                       I  OK  I
echo                       O======O
echo.
echo.
set /p nothing=%clr2%%clrwhi%     W,S ‚à‚µ‚­‚Í 1~5=“®‚©‚·     Y=Ø‚è‘Ö‚¦     N,B=”jŠü                        %moveline%%clrwhi% <nul&choice /c WS12345YNB6 /n >nul
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
if "%oobetheme%"=="white" (color f0) else (color 07)
cls
if "%OOBEsetting2toggle%"=="true" (set OOBEsettingclr=[46m) else if "%OOBEsetting2toggle%"=="false" (
if "%oobetheme%"=="white" (set OOBEsettingclr=[100m[97m&set OOBEsettingclr2=[0m[107m[30m)
if "%oobetheme%"=="dark" (set OOBEsettingclr=[7m&set OOBEsettingclr2=[0m)
)
echo.
echo   ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒZƒbƒgƒAƒbƒv
echo ====================================O
echo ƒZƒbƒgƒAƒbƒvi’» : 4/5 (İ’è‚ÌƒJƒXƒ^ƒ}ƒCƒY)
echo.
echo.
echo          O================================O   İ’è‚ÌƒJƒXƒ^ƒ}ƒCƒY
echo          I%OOBEsetting1clr% 1 ‹N“®‚ÉƒJ[ƒ\ƒ‹‘Ö‚¦‚Å‹N“®   %OOBEsetting1clr2%I
echo          O================================O   ƒJ[ƒ\ƒ‹‘Ö‚¦‚Ì‹N“®‚ÉŠÇ—Ò
echo          I%OOBEsettingclr% 2 ‹N“®‚ÌƒAƒhƒ~ƒ“             %OOBEsettingclr2%I   Œ ŒÀ‚Ìæ“¾‚ğ‚İ‚Ü‚·BŠî–{“I‚É
echo          O================================O   ƒJ[ƒ\ƒ‹‚Ì•ÏX‚É–â‘è‚ª”­¶‚µ‚½
echo          I%OOBEsetting3clr% 3 ‹N“®‚ÉXVŠm”F             %OOBEsetting3clr2%I   Û‚É—LŒø‚É‚·‚é‚×‚«‚Å‚·B—LŒø‚É‚·‚é
echo          O================================O   ‚ÆA‹N“®‚ª‘‚­‚È‚éê‡‚ª‚ ‚è‚Ü‚·B
echo          I%OOBEsetting4clr% 4 Enter‚Ì’·‰Ÿ‚µ‚ğŒŸ’m‚·‚é‹@”\  %OOBEsetting4clr2%I   
echo          O================================O   %clrgra%–³Œø‚É‚·‚é‚Ì‚ğ„§%OOBEsettingclr2%
echo          I%OOBEsetting5clr% 5 ‹N“®‚ÌƒAƒjƒ[ƒVƒ‡ƒ“       %OOBEsetting5clr2%I
echo          O================================O
echo                       I  OK  I
echo                       O======O
echo.
echo.
set /p nothing=%clr2%%clrwhi%     W,S ‚à‚µ‚­‚Í 1~5=“®‚©‚·     Y=Ø‚è‘Ö‚¦     N,B=”jŠü                        %moveline%%clrwhi% <nul&choice /c WS12345YNB6 /n >nul
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
if "%oobetheme%"=="white" (color f0) else (color 07)
cls
if "%OOBEsetting3toggle%"=="true" (set OOBEsettingclr=[46m) else if "%OOBEsetting3toggle%"=="false" (
if "%oobetheme%"=="white" (set OOBEsettingclr=[100m[97m&set OOBEsettingclr2=[0m[107m[30m)
if "%oobetheme%"=="dark" (set OOBEsettingclr=[7m&set OOBEsettingclr2=[0m)
)
echo.
echo   ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒZƒbƒgƒAƒbƒv
echo ====================================O
echo ƒZƒbƒgƒAƒbƒvi’» : 4/5 (İ’è‚ÌƒJƒXƒ^ƒ}ƒCƒY)
echo.
echo.
echo          O================================O   İ’è‚ÌƒJƒXƒ^ƒ}ƒCƒY
echo          I%OOBEsetting1clr% 1 ‹N“®‚ÉƒJ[ƒ\ƒ‹‘Ö‚¦‚Å‹N“®   %OOBEsetting1clr2%I
echo          O================================O   ƒJ[ƒ\ƒ‹‘Ö‚¦‚Ì‹N“®‚ÉƒAƒbƒvƒf[ƒg
echo          I%OOBEsetting2clr% 2 ‹N“®‚ÌƒAƒhƒ~ƒ“             %OOBEsetting2clr2%I   ‚ÌŠm”F‚ğs‚¤‚©‚Ç‚¤‚©‚ğ
echo          O================================O   Ø‚è‘Ö‚¦‚ç‚ê‚Ü‚·BƒAƒbƒvƒf[ƒg
echo          I%OOBEsettingclr% 3 ‹N“®‚ÉXVŠm”F             %OOBEsettingclr2%I   ‚ª—˜—p‰Â”\‚ÈÛ‚É‚ÍA
echo          O================================O   ‚»‚Ì‚Ü‚Ü“K—p‚·‚é‚±‚Æ‚ª‚Å‚«‚Ü‚·B
echo          I%OOBEsetting4clr% 4 Enter‚Ì’·‰Ÿ‚µ‚ğŒŸ’m‚·‚é‹@”\  %OOBEsetting4clr2%I
echo          O================================O   %clrgra%–³Œø‚É‚·‚é‚Ì‚ğ„§%OOBEsettingclr2%
echo          I%OOBEsetting5clr% 5 ‹N“®‚ÌƒAƒjƒ[ƒVƒ‡ƒ“       %OOBEsetting5clr2%I
echo          O================================O
echo                       I  OK  I
echo                       O======O
echo.
echo.
set /p nothing=%clr2%%clrwhi%     W,S ‚à‚µ‚­‚Í 1~5=“®‚©‚·     Y=Ø‚è‘Ö‚¦     N,B=”jŠü                        %moveline%%clrwhi% <nul&choice /c WS12345YNB6 /n >nul
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
if "%oobetheme%"=="white" (color f0) else (color 07)
cls
if "%OOBEsetting4toggle%"=="true" (set OOBEsettingclr=[46m) else if "%OOBEsetting4toggle%"=="false" (
if "%oobetheme%"=="white" (set OOBEsettingclr=[100m[97m&set OOBEsettingclr2=[0m[107m[30m)
if "%oobetheme%"=="dark" (set OOBEsettingclr=[7m&set OOBEsettingclr2=[0m)
)
echo.
echo   ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒZƒbƒgƒAƒbƒv
echo ====================================O
echo ƒZƒbƒgƒAƒbƒvi’» : 4/5 (İ’è‚ÌƒJƒXƒ^ƒ}ƒCƒY)
echo.
echo.
echo          O================================O   İ’è‚ÌƒJƒXƒ^ƒ}ƒCƒY
echo          I%OOBEsetting1clr% 1 ‹N“®‚ÉƒJ[ƒ\ƒ‹‘Ö‚¦‚Å‹N“®   %OOBEsetting1clr2%I
echo          O================================O   ƒJ[ƒ\ƒ‹‘Ö‚¦‚ÌƒƒCƒ“ƒƒjƒ…[‚ÅA
echo          I%OOBEsetting2clr% 2 ‹N“®‚ÌƒAƒhƒ~ƒ“             %OOBEsetting2clr2%I   Enter‚ª’·‰Ÿ‚µ‚³‚ê‚Ä‚¢‚é‚©‚Ç‚¤‚©
echo          O================================O   ‚ğŒŸ’m‚·‚é‹@”\‚ğØ‚è‘Ö‚¦‚ç‚ê‚Ü‚·B
echo          I%OOBEsetting3clr% 3 ‹N“®‚ÉXVŠm”F             %OOBEsetting3clr2%I   ‚¿‚È‚İ‚ÉA‚±‚Ì‹@”\‚É‚ÍˆÓ–¡‚ª
echo          O================================O   ‚È‚¢‰Â”\«‚ª‚‚¢‚Å‚·B
echo          I%OOBEsettingclr% 4 Enter‚Ì’·‰Ÿ‚µ‚ğŒŸ’m‚·‚é‹@”\  %OOBEsettingclr2%I
echo          O================================O   %clrgra%—LŒø‚É‚·‚é‚Ì‚ğ„§%OOBEsettingclr2%
echo          I%OOBEsetting5clr% 5 ‹N“®‚ÌƒAƒjƒ[ƒVƒ‡ƒ“       %OOBEsetting5clr2%I
echo          O================================O
echo                       I  OK  I
echo                       O======O
echo.
echo.
set /p nothing=%clr2%%clrwhi%     W,S ‚à‚µ‚­‚Í 1~5=“®‚©‚·     Y=Ø‚è‘Ö‚¦     N,B=”jŠü                        %moveline%%clrwhi% <nul&choice /c WS12345YNB6 /n >nul
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
if "%oobetheme%"=="white" (color f0) else (color 07)
cls
if "%OOBEsetting5toggle%"=="true" (set OOBEsettingclr=[46m) else if "%OOBEsetting5toggle%"=="false" (
if "%oobetheme%"=="white" (set OOBEsettingclr=[100m[97m&set OOBEsettingclr2=[0m[107m[30m)
if "%oobetheme%"=="dark" (set OOBEsettingclr=[7m&set OOBEsettingclr2=[0m)
)
echo.
echo   ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒZƒbƒgƒAƒbƒv
echo ====================================O
echo ƒZƒbƒgƒAƒbƒvi’» : 4/5 (İ’è‚ÌƒJƒXƒ^ƒ}ƒCƒY)
echo.
echo.
echo          O================================O   İ’è‚ÌƒJƒXƒ^ƒ}ƒCƒY
echo          I%OOBEsetting1clr% 1 ‹N“®‚ÉƒJ[ƒ\ƒ‹‘Ö‚¦‚Å‹N“®   %OOBEsetting1clr2%I
echo          O================================O   ƒJ[ƒ\ƒ‹‘Ö‚¦‚Ì‹N“®‚Ì“Ç‚İ‚İ
echo          I%OOBEsetting2clr% 2 ‹N“®‚ÌƒAƒhƒ~ƒ“             %OOBEsetting2clr2%I   ‚ªI—¹‚µ‚½Û‚Ì‹N“®ƒAƒjƒ[ƒVƒ‡ƒ“
echo          O================================O   ‚ğØ‚è‘Ö‚¦‚ê‚Ü‚·B–³Œø‚¾‚Æ
echo          I%OOBEsetting3clr% 3 ‹N“®‚ÉXVŠm”F             %OOBEsetting3clr2%I   ƒ[ƒh‚ªI‚í‚Á‚½‚ç‘¦À‚É
echo          O================================O   ƒƒjƒ…[‚É‘JˆÚ‚µ‚Ü‚·B
echo          I%OOBEsetting4clr% 4 Enter‚Ì’·‰Ÿ‚µ‚ğŒŸ’m‚·‚é‹@”\  %OOBEsetting4clr2%I
echo          O================================O   %clrgra%—LŒø‚É‚·‚é‚Ì‚ğ„§%OOBEsettingclr2%
echo          I%OOBEsettingclr% 5 ‹N“®‚ÌƒAƒjƒ[ƒVƒ‡ƒ“       %OOBEsettingclr2%I
echo          O================================O
echo                       I  OK  I
echo                       O======O
echo.
echo.
set /p nothing=%clr2%%clrwhi%     W,S ‚à‚µ‚­‚Í 1~5=“®‚©‚·     Y=Ø‚è‘Ö‚¦     N,B=”jŠü                        %moveline%%clrwhi% <nul&choice /c WS12345YNB6 /n >nul
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
if "%oobetheme%"=="white" (color f0) else (color 07)
cls
echo.
echo   ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒZƒbƒgƒAƒbƒv
echo ====================================O
echo ƒZƒbƒgƒAƒbƒvi’» : 4/5 (İ’è‚ÌƒJƒXƒ^ƒ}ƒCƒY)
echo.
echo.
echo          O================================O   İ’è‚ÌƒJƒXƒ^ƒ}ƒCƒY
echo          I%OOBEsetting1clr% 1 ‹N“®‚ÉƒJ[ƒ\ƒ‹‘Ö‚¦‚Å‹N“®   %OOBEsetting1clr2%I
echo          O================================O   İ’è‚ÌŠm”F
echo          I%OOBEsetting2clr% 2 ‹N“®‚ÌƒAƒhƒ~ƒ“             %OOBEsetting2clr2%I
echo          O================================O   ‚¿‚È‚İ‚ÉAÅ’á‚Å‚àˆê‚Â‚Ìİ’è‚ğ
echo          I%OOBEsetting3clr% 3 ‹N“®‚ÉXVŠm”F             %OOBEsetting3clr2%I   —LŒø‚É‚·‚é‚Ì‚ğ„§‚µ‚Ä‚¢‚Ü‚·B
echo          O================================O   ‚·‚×‚Ä‚Ìİ’è‚ÍŒã‚©‚ç•ÏX‚Å‚«‚Ü‚·B
echo          I%OOBEsetting4clr% 4 Enter‚Ì’·‰Ÿ‚µ‚ğŒŸ’m‚·‚é‹@”\  %OOBEsetting4clr2%I   
echo          O================================O   %clrgra%(İ’èƒƒjƒ…[‚Å•ÏX‰Â”\)%OOBEsettingclr2%
echo          I%OOBEsetting5clr% 5 ‹N“®‚ÌƒAƒjƒ[ƒVƒ‡ƒ“       %OOBEsetting5clr2%I
echo          O================================O
echo                       I%OOBEsettingclr%  OK  %OOBEsettingclr2%I
echo                       O======O
echo.
echo.
set /p nothing=%clr2%%clrwhi%     W,S ‚à‚µ‚­‚Í 1~5=“®‚©‚·     Y=Ø‚è‘Ö‚¦     N,B=”jŠü                        %moveline%%clrwhi% <nul&choice /c WS12345YNB6 /n >nul
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
if "%oobetheme%"=="white" (color f0) else (color 07)
cls
echo.
echo   ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒZƒbƒgƒAƒbƒv
echo ====================================O
echo ƒZƒbƒgƒAƒbƒvi’» : 4/5 (İ’è‚ÌƒJƒXƒ^ƒ}ƒCƒY)
echo.
echo.
echo          İ’è‚ÌƒJƒXƒ^ƒ}ƒCƒY :
echo.
echo          1 •ÏXŒã‚ÌÄ‹N“®‚ÌŠm”F        : %OOBEsetting1toggle% %clrgra%(false‚ª„§)%OOBEsettingclr2%
echo          2 ‹N“®‚ÌƒAƒhƒ~ƒ“            : %OOBEsetting2toggle% %clrgra%(false‚ª„§)%OOBEsettingclr2%
echo          3 ‹N“®‚ÉXVŠm”F            : %OOBEsetting3toggle% %clrgra%(false‚ª„§)%OOBEsettingclr2%
echo          4 Enter‚Ì’·‰Ÿ‚µ‚ğŒŸ’m‚·‚é‹@”\ : %OOBEsetting4toggle% %clrgra%(true‚ª„§)%OOBEsettingclr2%
echo          5 ‹N“®‚ÌƒAƒjƒ[ƒVƒ‡ƒ“      : %OOBEsetting5toggle% %clrgra%(true‚ª„§)%OOBEsettingclr2%
echo.
echo          ‘±s‚·‚é‚ÆA‚±‚ê‚ç‚Ìİ’è‚ª‚·‚×‚Äİ’èƒtƒ@ƒCƒ‹‚É‘‚«‚Ü‚ê‚Ü‚·B
echo          ‚æ‚ë‚µ‚¢‚Å‚·‚©H %clrgra%(İ’èƒtƒ@ƒCƒ‹‚Í "%batchmainpath%"‚É‚ ‚è‚Ü‚·B) %OOBEsettingclr2%
echo.
echo          (Y=‚Í‚¢)
echo          (N=‚¢‚¢‚¦B‚â‚Á‚Ï‚è•ÏX‚µ‚½‚¢‚Å‚·B)
echo.
echo.
set /p nothing=%clr2%%clrwhi%     Y=‚Í‚¢     N=‚¢‚¢‚¦                                                        %moveline%%clrwhi% <nul&choice /c YN /n >nul
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
    ) else if not defined (echo YourName=%USERNAME% >> %Settingsfile%)

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
        echo hatenakeikoku=false >> %Settingsfile%
    ) else if "%OOBEsetting4toggle%"=="true" (
        echo hatenakeikoku=true >> %Settingsfile%
    ) else (echo hatenakeikoku=true >> %Settingsfile%)

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
cls
echo.
echo   ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒZƒbƒgƒAƒbƒv
echo ====================================O
echo ƒZƒbƒgƒAƒbƒvi’» : 5/5 (ƒZƒbƒgƒAƒbƒvŠ®—¹)
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
echo.
echo.
echo.
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     Y,E=‘Şo                                                                   %moveline%%clrwhi% <nul&choice /c YE /n >nul
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&call :OOBEinitialization &set bootbatnow=yes&goto :batstart
if %ErrorLevel%==2 call :OOBEmainblank & timeout /t 1 /nobreak >nul&call :OOBEinitialization &set bootbatnow=yes&goto :batstart

:OOBEinitialization
if "%oobetheme%"=="white" (color f0) else (color 07) & cls
if not defined dummy (set /p nothing=[?25h<nul)
set clrgra=& set clrhigh=& set clrhighend=& set clrwhi=& set moveline=
set oobetheme=
set OOBEsetting1toggle=& set OOBEsetting2toggle=& set OOBEsetting3toggle=& set OOBEsetting4toggle=& set OOBEsetting5toggle=
set OOBEsetting1clr=& set OOBEsetting2clr=& set OOBEsetting3clr=& set OOBEsetting4clr=& set OOBEsetting5clr=
set OOBEsetting1clr2=& set OOBEsetting2clr2=& set OOBEsetting3clr2=& set OOBEsetting4clr2=& set OOBEsetting5clr2=
set OOBEsettingclr=& set OOBEsettingclr2=
set clr1=& set clresc=& set clrmove=& set clr2=&set clr=
2>nul taskkill /im powershell.exe >nul
mode con: cols=75 lines=25
exit /b



:Cursor_Changer_REmenu
cls
mode con: cols=75 lines=25
color 07
rem recovery menu for Cursor Changer, and recovery console
call :batbootcheckwinver dynamic
if "%errorlevel%"=="1" (goto :batbootcheckwinverbad)
if defined bootbatnow (set clr=[7m&set clr2=[0m) else (set clr=[7m&set clr2=[0m)
if not defined dummy (set /p nothing=[?25l<nul)
set bootbatnow=no& set rmsel=0
echo ƒŠƒJƒoƒŠ[ƒƒjƒ…[‚ğ“Ç‚İ‚ñ‚Å‚¢‚Ü‚·B ‚µ‚Î‚ç‚­‚¨‘Ò‚¿‚­‚¾‚³‚¢...& timeout /t 1 /nobreak >nul
:Cursor_Changer_REmenu_main
cls
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ƒŠƒJƒoƒŠ[ƒƒjƒ…[
:Cursor_Changer_REmenu_main_loop
if not defined dummy (set /p nothing=[?25l<nul)
if not defined dummy (set /p nothing=[H<nul)
for /l %%i in (9,1,10) do (set /p nothing=[%%i;7H                                                            [H<nul)
if %rmsel%==0 (set /p nothing=[9;22H Œ»İ‚Í‰½‚à‘I‘ğ‚³‚ê‚Ä‚¢‚Ü‚¹‚ñB[H<nul)
if %rmsel%==1 (set /p nothing=[9;25H ƒJ[ƒ\ƒ‹‘Ö‚¦‚ğÄ‹N“®‚µ‚Ü‚·B[10;22H ^(Šî–{“I‚É‚Í‚±‚ê‚ª‚¨‚·‚·‚ß‚Å‚·B^)[H<nul)
if %rmsel%==2 (set /p nothing=[9;28H İ’è‚ğ‰Šú‰»‚µ‚Ü‚·B[10;23H ^(‘S‚Ä‚Ìİ’è‚ğ‰Šú‰»‚µ‚Ü‚·B^)[H<nul)
if %rmsel%==3 (set /p nothing=[9;21H ƒŠƒJƒoƒŠ[ƒRƒ“ƒ\[ƒ‹‚ÉˆÚ“®‚µ‚Ü‚·B[10;17H ^(ƒfƒoƒbƒO–Ú“I‚ÌƒRƒ}ƒ“ƒh‚ğ—˜—p‚Å‚«‚Ü‚·B^)[H<nul)
if %rmsel%==4 (set /p nothing=[9;26H ƒƒjƒ…[‚©‚ç‘Şo‚µ‚Ü‚·B[10;29H ^(ƒVƒƒƒbƒgƒ_ƒEƒ“^)[H<nul)
echo                     ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒŠƒJƒoƒŠ[ƒƒjƒ…[              
echo.
echo                            %rmcb1%        Ä‹N“®        %clr2%
echo                            %rmcb2%     İ’è‚Ì‰Šú‰»     %clr2%
echo                            %rmcb3% ƒŠƒJƒoƒŠ[ƒRƒ“ƒ\[ƒ‹ %clr2%
echo                            %rmcb4%         ‘Şo         %clr2%
echo.
echo                     1~4 ‚© WS ‚Å ‘I‘ğA E ‚© Y ‚Å Œˆ’è
echo.
echo.
choice /c 1234WSYE /n >nul
if %ErrorLevel%==1 (set rmsel=1& set rmcb1=!clr!& set rmcb2=& set rmcb3=& set rmcb4=)
if %ErrorLevel%==2 (set rmsel=2& set rmcb2=!clr!& set rmcb1=& set rmcb3=& set rmcb4=)
if %ErrorLevel%==3 (set rmsel=3& set rmcb3=!clr!& set rmcb1=& set rmcb2=& set rmcb4=)
if %ErrorLevel%==4 (set rmsel=4& set rmcb4=!clr!& set rmcb3=& set rmcb2=& set rmcb1=)
if %ErrorLevel%==5 (
    if %rmsel%==0 (set rmsel=1& set rmcb1=!clr!& set rmcb2=& set rmcb3=& set rmcb4=)
    if %rmsel%==1 (set rmsel=1& set rmcb1=!clr!& set rmcb2=& set rmcb3=& set rmcb4=)
    if %rmsel%==2 (set rmsel=1& set rmcb1=!clr!& set rmcb2=& set rmcb3=& set rmcb4=)
    if %rmsel%==3 (set rmsel=2& set rmcb2=!clr!& set rmcb1=& set rmcb3=& set rmcb4=)
    if %rmsel%==4 (set rmsel=3& set rmcb3=!clr!& set rmcb1=& set rmcb2=& set rmcb4=)
)
if %ErrorLevel%==6 (
    if %rmsel%==0 (set rmsel=1& set rmcb1=!clr!& set rmcb2=& set rmcb3=& set rmcb4=)
    if %rmsel%==1 (set rmsel=2& set rmcb2=!clr!& set rmcb1=& set rmcb3=& set rmcb4=)
    if %rmsel%==2 (set rmsel=3& set rmcb3=!clr!& set rmcb1=& set rmcb2=& set rmcb4=)
    if %rmsel%==3 (set rmsel=4& set rmcb4=!clr!& set rmcb1=& set rmcb2=& set rmcb3=)
    if %rmsel%==4 (set rmsel=4& set rmcb4=!clr!& set rmcb1=& set rmcb2=& set rmcb3=)
)
if %ErrorLevel%==7 (goto :Cursor_Changer_REmenu_main_Core)
if %ErrorLevel%==8 (goto :Cursor_Changer_REmenu_main_Core)
goto :Cursor_Changer_REmenu_main_loop

:Cursor_Changer_REmenu_main_Core
if %rmsel%==0 (set rmsel=1& set rmcb1=!clr!& set rmcb2=& set rmcb3=& set rmcb4=)
if %rmsel%==1 (set runningfromfulldebug=& set FromREConsole=& call :rebootbatch)
if %rmsel%==2 (goto :Cursor_Changer_REWipe)
if %rmsel%==3 (call :Cursor_Changer_REConsole& cls & goto :Cursor_Changer_REmenu_main_loop)
if %rmsel%==4 (goto :batshutdown)

:Cursor_Changer_REWipe
cls
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ƒŠƒJƒoƒŠ[ƒƒjƒ…[
echo                     ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒŠƒJƒoƒŠ[ƒƒjƒ…[                 
echo.
echo.  
echo                     İ’è‚Ì‰Šú‰» (ƒfƒtƒHƒ‹ƒg’l‚É–ß‚·) 
echo                          –{“–‚ÉÀs‚µ‚Ü‚·‚©H
echo.
echo.
echo                           Y‚ÅÀsAN‚Å–ß‚é
echo.
choice /c YN /n 
if %ErrorLevel%==1 (
call :Wipealldeta
goto :Cursor_Changer_REWipeYippeee
)
if %ErrorLevel%==2 set rmsel=2& goto :Cursor_Changer_REmenu_main

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
set rmsel=2& goto :Cursor_Changer_REmenu_main


:Cursor_Changer_REConsole
cls
set selected=
set FromREConsole=true
mode con: cols=75 lines=25
color 07
set bootbatnow=no
if not defined dummy (set clr=[7m&set clr2=[0m) else (set clr=[7m&set clr2=[0m)
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
if "%selected%"=="alldefnow1" (goto :AllDefult1)
if "%selected%"=="playdefboot" (set hatenakeikoku=0&cls&goto :firstboot)
if "%selected%"=="debugyesnow" (goto :kurogo)
if "%selected%"=="fulldebug" (goto :fulldebug)
if "%selected%"=="getadmin" (goto :batstartadm)
if "%selected%"=="restoresetting" (
call :Wipealldeta
echo Š®—¹B‰½‚©ƒL[‚ğ‰Ÿ‚µ‚Ä‘±s...
pause >nul
)
if "%selected%"=="alldefdeletebat" (set hatenakeikoku=0&echo delete bat, confirm to type something...&pause&goto :alldefdeletefinish5)
if "%selected%"=="windowsfiltertest" (goto :batbootcheckwinverbad)
if "%selected%"=="funanimationdeb" (goto :batbootanimationfun)
if "%selected%"=="openie" (goto :openiedev)
if "%selected%"=="setenter" (echo.&set /p hatenakeikoku=pls type:&goto :hazimeboot) else (set selected= &echo —LŒø‚ÈƒRƒ}ƒ“ƒh‚ğ“ü—Í‚µ‚Ä‚­‚¾‚³‚¢B&goto :Cursor_Changer_REConsoleask)


rem O========================================= OOBE and Receovery Code Ended =================================================O


:Wipealldeta
rem Wipe Setting file
echo nodogcheckfor1234567890qwertyuiop > %Settingsfile%
echo YourName=%USERNAME% >> %Settingsfile%
echo BootAsCC=false >> %Settingsfile%
echo admin=false >> %Settingsfile%
echo CheckUpdate=false >> %Settingsfile%
echo hatenakeikoku=true >> %Settingsfile%
echo bootanimation=true >> %Settingsfile%
echo s5_linuxboot=false >> %Settingsfile%
echo s5_simpleboot=false >> %Settingsfile%
echo s5_rawboot=false >> %Settingsfile%
echo HazimeBg=true >> %Settingsfile%
echo wmode=false >> %Settingsfile%
exit /b


rem Detects settings related to prompts for administrative privileges,
:batstart
if "%linuxboot%"=="false" (mode con: cols=75 lines=25)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   & set ??????=‚±‚±‚Å‰½‚ğ‚µ‚Ä‚¢‚é‚ñ‚¾H ‚±‚±‚É‚¢‚é‚ñ‚¾‚ëH%username%.
if "%settingbypass%"=="true" (goto :hazimemenuskipboot)
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] admin checked.) else (cls)
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
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Requesting Administrative privileges...)
powershell -NoProfile -Command "Start-Process '%~dp0%~n0%~x0' -Verb RunAs" >nul && PowerShell -WindowStyle Hidden -Command Exit && call :exit 0
echo.
if "%linuxboot%"=="true" (echo [%linuxishclred%ERROR%linuxishclr2%] Request for administrative privileges denied. & echo.) else (
echo ŠÇ—ÒŒ ŒÀ‚Ì—v‹‚ª‹‘”Û‚³‚ê‚Ü‚µ‚½B
echo ^(ƒqƒ“ƒg: ŠÇ—ÒŒ ŒÀ‚Ì—v‹‚Íİ’è‚Å–³Œø‚É‚Å‚«‚Ü‚·B^)
)
timeout /t 2 /nobreak >nul
:gotAdmin
if not "%linuxboot%"=="true" (cls)
pushd "%CD%"
goto :hazime



:hazime
if "%alldefentered%"=="true" (
set alldefno2clr=
set alldefno2clr2=
set alldefclr=
set alldefclr2=
set alldefentered=
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
set Die=%random%& set Die2=%random%
if "%Die%"=="%Die2%" (title & color 04
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
if "%linuxboot%"=="true" if not "%bootbatnow%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Setting1 Loaded as "true")
call :SAB_Manager 1
goto :setting2load
)
goto :whatloadgoto


:setting2load
find "admin=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting2onoff=—LŒø
if %ErrorLevel%==1 goto :setting2load2
if "%bootbatnow%"=="yes" (
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Setting2 Loaded as "true")
call :SAB_Manager 2
goto :setting3load
) 
goto :whatloadgoto

:setting3load
find "CheckUpdate=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting3onoff=—LŒø
if %ErrorLevel%==1 goto :setting3load2
if "%bootbatnow%"=="yes" (
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Setting3 Loaded as "true")
call :SAB_Manager 3
goto :setting4load
) 
goto :whatloadgoto

:setting4load
find "hatenakeikoku=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting4onoff=—LŒø
if %ErrorLevel%==1 goto :setting4load2
if "%bootbatnow%"=="yes" (
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Setting4 Loaded as "true")
call :SAB_Manager 4
goto :setting5load
) 
goto :whatloadgoto

:setting5load
find "bootanimation=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting5onoff=—LŒø
if %ErrorLevel%==1 goto :setting5load2
if "%bootbatnow%"=="yes" (
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Setting5 Loaded as "true")
call :SAB_Manager 5
goto :setting5_s1load
) 
goto :whatloadgoto


:setting5_s1load
find "s5_linuxboot=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting5_s1onoff=—LŒø
if %ErrorLevel%==1 goto :setting5_s1load2
if "%bootbatnow%"=="yes" (
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Setting5_1 Loaded as "true")
call :SAB_Manager 5
goto :setting5_s2load
) 
goto :whatloadgoto

:setting5_s2load
find "s5_simpleboot=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting5_s2onoff=—LŒø
if %ErrorLevel%==1 goto :setting5_s2load2
if "%bootbatnow%"=="yes" (
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Setting5_2 Loaded as "true")
call :SAB_Manager 5
goto :setting5_s3load
) 
goto :whatloadgoto

:setting5_s3load
find "s5_rawboot=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting5_s3onoff=—LŒø
if %ErrorLevel%==1 goto :setting5_s3load2
if "%bootbatnow%"=="yes" (
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Setting5_3 Loaded as "true")
call :SAB_Manager 5
goto :setting6load
) 
goto :whatloadgoto

:setting6load
find "HazimeBg=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting6onoff=—LŒø
if %ErrorLevel%==1 goto :setting6load2
if "%bootbatnow%"=="yes" (
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Setting6 Loaded as "true")
call :SAB_Manager 6
goto :wmodeload
) 
goto :whatloadgoto


:wmodeload
find "wmode=true" %Settingsfile% > nul
if "%ErrorLevel%"=="0" (set wmodeonoff=ƒ_[ƒNƒe[ƒ}‚É•ÏX  &set wmodetoggle=true)
if "%ErrorLevel%"=="1" (goto :wmodeload2)
if "%bootbatnow%"=="yes" (
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Wmode Loaded as "true")
call :SAB_Manager 6
goto :loads
) 
goto :whatloadgoto

:allsettingtest
rem İ’è‚ÌŒ‡‘¹‚ğŒŸØ
:setting1load2
find "BootAsCC=false" %Settingsfile% > nul
if %ErrorLevel%==0 (set setting1onoff=–³Œø& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting1 Loaded as "false")) else if %ErrorLevel%==1 set setting1onoff=null&set /a allsettingerror=allsettingerror+1& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclred%ERROR%linuxishclr2%] Setting1 is corrupted. Loaded as "null")
if "%bootbatnow%"=="yes" (call :SAB_Manager 1)
if "%bootbatnow%"=="yes" (goto :setting2load) else (goto :whatloadgoto)

:setting2load2
find "admin=false" %Settingsfile% > nul
if %ErrorLevel%==0 (set setting2onoff=–³Œø& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting2 Loaded as "false")) else if %ErrorLevel%==1 set setting2onoff=null&set /a allsettingerror=allsettingerror+1& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclred%ERROR%linuxishclr2%] Setting2 is corrupted. Loaded as "null")
if "%bootbatnow%"=="yes" (call :SAB_Manager 2)
if "%bootbatnow%"=="yes" (goto :setting3load) else (goto :whatloadgoto)

:setting3load2
find "CheckUpdate=false" %Settingsfile% > nul
if %ErrorLevel%==0 (set setting3onoff=–³Œø& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting3 Loaded as "false")) else if %ErrorLevel%==1 set setting3onoff=null&set /a allsettingerror=allsettingerror+1& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclred%ERROR%linuxishclr2%] Setting3 is corrupted. Loaded as "null")
if "%bootbatnow%"=="yes" (call :SAB_Manager 3)
if "%bootbatnow%"=="yes" (goto :setting4load) else (goto :whatloadgoto)

:setting4load2
find "hatenakeikoku=false" %Settingsfile% > nul
if %ErrorLevel%==0 (set setting4onoff=–³Œø& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting4 Loaded as "false")) else if %ErrorLevel%==1 set setting4onoff=null&set /a allsettingerror=allsettingerror+1& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclred%ERROR%linuxishclr2%] Setting4 is corrupted. Loaded as "null")
if "%bootbatnow%"=="yes" (call :SAB_Manager 4)
if "%bootbatnow%"=="yes" (goto :setting5load) else (goto :whatloadgoto)

:setting5load2
find "bootanimation=false" %Settingsfile% > nul
if %ErrorLevel%==0 (set setting5onoff=–³Œø& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting5 Loaded as "false")) else if %ErrorLevel%==1 set setting5onoff=null&set /a allsettingerror=allsettingerror+1& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclred%ERROR%linuxishclr2%] Setting5 is corrupted. Loaded as "null")
if "%bootbatnow%"=="yes" (call :SAB_Manager 5)
if "%bootbatnow%"=="yes" (goto :setting5_s1load) else (goto :whatloadgoto)

:setting5_s1load2
find "s5_linuxboot=false" %Settingsfile% > nul
if %ErrorLevel%==0 (set setting5_s1onoff=–³Œø& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting5_1 Loaded as "false")) else if %ErrorLevel%==1 set setting5_s1onoff=null&set /a allsettingerror=allsettingerror+1& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclred%ERROR%linuxishclr2%] Setting5_1 is corrupted. Loaded as "null")
if "%bootbatnow%"=="yes" (call :SAB_Manager 5)
if "%bootbatnow%"=="yes" (goto :setting5_s2load) else (goto :whatloadgoto)

:setting5_s2load2
find "s5_simpleboot=false" %Settingsfile% > nul
if %ErrorLevel%==0 (set setting5_s2onoff=–³Œø& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting5_2 Loaded as "false")) else if %ErrorLevel%==1 set setting5_s2onoff=null&set /a allsettingerror=allsettingerror+1& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclred%ERROR%linuxishclr2%] Setting5_2 is corrupted. Loaded as "null")
if "%bootbatnow%"=="yes" (call :SAB_Manager 5)
if "%bootbatnow%"=="yes" (goto :setting5_s3load) else (goto :whatloadgoto)

:setting5_s3load2
find "s5_rawboot=false" %Settingsfile% > nul
if %ErrorLevel%==0 (set setting5_s3onoff=–³Œø& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting5_3 Loaded as "false")) else if %ErrorLevel%==1 set setting5_s3onoff=null&set /a allsettingerror=allsettingerror+1& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclred%ERROR%linuxishclr2%] Setting5_3 is corrupted. Loaded as "null")
if "%bootbatnow%"=="yes" (call :SAB_Manager 5)
if "%bootbatnow%"=="yes" (goto :setting6load) else (goto :whatloadgoto)

:setting6load2
find "HazimeBg=false" %Settingsfile% > nul
if %ErrorLevel%==0 (set setting6onoff=–³Œø& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting6 Loaded as "false")) else if %ErrorLevel%==1 set setting6onoff=null&set /a allsettingerror=allsettingerror+1& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclred%ERROR%linuxishclr2%] Setting6 is corrupted. Loaded as "null")
if "%bootbatnow%"=="yes" (call :SAB_Manager 6)
if "%bootbatnow%"=="yes" (goto :wmodeload) else (goto :whatloadgoto)

:wmodeload2
find "wmode=false" %Settingsfile% > nul
if "%ErrorLevel%"=="0" (set wmodeonoff=ƒzƒƒCƒgƒe[ƒ}‚É•ÏX& set wmodetoggle=false& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Wmode Loaded as "false")) else if "%ErrorLevel%"=="1" (set wmodeonoff=  null  ƒe[ƒ}‚É•ÏX&set wmodetoggle=false&set /a allsettingerror=allsettingerror+1& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclred%ERROR%linuxishclr2%] Wmode is corrupted. Loaded as "null"))
if "%bootbatnow%"=="yes" (call :SAB_Manager 6)
if "%bootbatnow%"=="yes" (goto :loads) else (goto :whatloadgoto)

:loads
rem load your name
for /f "tokens=2 delims==" %%a in ('type %Settingsfile% ^| findstr /r "YourName=."') do (
    set YourName=%%a
)
if defined YourName (
    if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo.& echo [%linuxishclr%Info%linuxishclr2%] Hello %YourName%!)
) else if not defined YourName (
    set YourName=%USERNAME%
    if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo.& echo [%linuxishclred%ERROR%linuxishclr2%] Your Name is does not exist. Who are you?)
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
if "%linuxboot%"=="true" (echo.&echo [%linuxishclr%info%linuxishclr2%] %FirstSTFsfile% is Loaded.)
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
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Cursor Color is Loaded.)
call :SAB_Manager 10
goto :hazimecursorcolor2
)
if "%whatloadgoto%"=="hazime" (goto :hazimemenu)

:hazimecursorcolor2
reg query "HKEY_CURRENT_USER\Control Panel\Cursors" /v "" | find "Windows •W€" >nul
if "%ErrorLevel%"=="0" (set cursorcolor=•)
if "%bootbatnow%"=="no" (echo ˆ—’†...) else (
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Menu stuff All Loaded.)
call :SAB_Manager 10
goto :SAB_Manager_initializeVaribale
)
if "%whatloadgoto%"=="hazime" (goto :hazimemenu)
goto :hazimemenu



:SAB_Manager
if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] SAB_Manager Running...)
rem ƒu[ƒgƒAƒjƒ[ƒVƒ‡ƒ“B
rem ‰º‚Í“Ç‚İ‚İ‚ÌƒeƒLƒXƒg•ªŠòB
if "%bootbatnow%"=="no" (cls & title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| İ’è ˆ—’†... & echo ˆ—’†... & goto :whatload) else (title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ‹N“®’†...)
if "%simpleboot%"=="true" (cls & echo ‹N“®’†...& exit /b)
if "%wmodetoggle%"=="false" (set loadscrnprgsclr=[7m&set loadscrnprgsclrgra=[48;5;244m&set loadscrnprgsclr2=[0m&set back_to_the_firstline=[18;0H&set back_to_the_loadline=[23;12H)
if "%wmodetoggle%"=="true" (set loadscrnprgsclr=[47m[97m&set loadscrnprgsclrgra=[48;5;244m&set loadscrnprgsclr2=[0m[107m[30m&set back_to_the_firstline=[18;0H&set back_to_the_loadline=[23;12H) else (set loadscrnprgsclr=[7m&set loadscrnprgsclrgra=[48;5;244m&set loadscrnprgsclr2=[0m&set back_to_the_firstline=[18;0H&set back_to_the_loadline=[23;12H)
if not defined dummy if not "%linuxboot%"=="true" (set /p nothing=[?25l<nul)
if defined linuxboot if "%linuxboot%"=="true" (exit /b)

rem “Ç‚İ‚İƒo[‚ÌUI (˜g) •`Ê
if not defined SAB_Manager_Drewed (set SAB_Manager_Drewed=true& set batloadprgsDrewrn=12) else if defined SAB_Manager_Drewed (goto :SAB_Manager_Main_Bar)
set /p nothing=%back_to_the_loadline%%loadscrnprgsclr2%<nul
echo %back_to_the_firstline%
echo O=========================================================================O
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

if "%settingbypass%"=="true" (goto :hazimemenuskipboot)
rem ‚æ‚Á‚µ‚á[[[[[[[[[IIIIIIIIIIIIIIIIIIIII
if "%linuxboot%"=="true" (setlocal enabledelayedexpansion & set /a yay=%random%*17/32767& set yayshow=[
for /l %%i in (0,1,!yay!) do (set yayshow=!yayshow![)
setlocal disabledelayedexpansion)

if "%linuxboot%"=="true" (echo.&echo [%linuxishclr%info%linuxishclr2%] ‹N“®Š®—¹! ‚æ‚Á‚µ‚á[%yayshow% :D& echo [%linuxishclr%info%linuxishclr2%] ^(‹N“®ŠÔ : %BootTime% •b^)& title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ‚æ‚Á‚µ‚á[%yayshow%& set yay=& set yayshow=& timeout /t 2 /nobreak >nul& cls) else (cls)
if "%rawboot%"=="true" (echo off)
if "%firststartbat%"=="yes" (goto :batbootanimationbypassfun)
if "%setting5onoff%"=="–³Œø" (goto :checksum)
rem ƒu[ƒgƒAƒjƒ[ƒVƒ‡ƒ“‚ğÄ¶B64•ª‚Ì1‚ÌŠm—¦‚Ü‚½‚Í512•ª‚Ì1‚ÌŠm—¦‚Å•Êƒo[ƒWƒ‡ƒ“‚ªÄ¶‚³‚ê‚éBramdom‚Ìd—l(H)‚É‚æ‚Á‚Ä“ñ‰ñ˜A‘±‚Årandom‚ğ‚µ‚È‚¢‚Æ‚¢‚¯‚È‚¢B
if not defined dummy (set /p nothing=[?25l<nul)
set /a bootegg=%random%*65/32767
set /a bootegg2=%random%*65/32767
if "%bootegg%"=="%bootegg2%" (goto :batbootanimationfun)
set /a bootegg=%random%*257/32767
set /a bootegg2=%random%*257/32767
if "%bootegg%"=="%bootegg2%" (call :BSOD_Errors THERE_IS_NO_PROBLEMS)
set /a bootegg=%random%*513/32767
set /a bootegg2=%random%*513/32767
if "%bootegg%"=="%bootegg2%" (goto :batbootanimationscary)
set bootegg=
set bootegg2=
:batbootanimationbypassfun
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ‚æ‚¤‚±‚»
if "%wmodetoggle%"=="true" (set welcomelineclr=[38;2;135;135;135m& set welcomelineclr2=[0m[107m[30m& set welcomelineclr3=[30m) else (set welcomelineclr=[38;2;120;120;120m& set welcomelineclr2=[0m& set welcomelineclr3=[39m)
if "%wmodetoggle%"=="true" (for /l %%i in (0,1,3) do (set /p nothing=[%%i;0H[48;2;230;230;230m                                                                           [0;0H<nul)) else (for /l %%i in (0,1,3) do (set /p nothing=[%%i;0H[48;2;20;20;20m                                                                           [0;0H<nul))
echo.
if not defined dummy (echo [30aƒJ[ƒ\ƒ‹‘Ö‚¦%batver%)
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
if not defined dummy (echo [23a2021-2024 tamago_1908 %batbuild%)
set welcomelineclr=& set welcomelineclr2=& set welcomelineclr3=
timeout /t 2 /nobreak >nul
cls
rem İ’è‚ÌŒ‡‘¹‚ğŠm”F
goto :checksum

:batbootanimationfun
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
if "%wmodetoggle%"=="true" (color f0) else (color 07)
if not defined dummy (set /p nothing=[?25h<nul)
if %allsettingerror% gtr 0 if %allsettingerror% lss 10 (set "allsettingerrorshow= %allsettingerror%") else (set "allsettingerrorshow=  %allsettingerror%")
if %allsettingerror% gtr 0 (
    if not defined dummy (set clrgra=[90m&set clr2=[0m)
    if "%wmodetoggle%"=="false" (set clrgra=[90m&set clr2=[0m)
    if "%wmodetoggle%"=="true" (set clrgra=[0m[107m&set clr2=[90m[107m[30m)
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
    echo   I       İ’è‚ª %allsettingerrorshow% ŒÂ”j‘¹‚µ‚Ä‚¢‚é‚©A‘¶İ‚µ‚Ü‚¹‚ñB     I
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
set allsettingerrorshow=&set clrgra=&set clr2= 
if %allsettingerror% gtr 5 (goto :fixallsetting) else (if "%Setting1onoff%"=="—LŒø" (goto :cursorchange) else (goto :hazimemenu))
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
call :exit 1
)
if "%selected%"=="y" (
call :Wipealldeta
echo.
echo C•œ‚ªŠ®—¹‚µ‚Ü‚µ‚½B
pause
call :exit 1
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
:hazimemenudrew
cls
if not "%MenuRedrew%"=="true" (call :background_menu)
rem center = 37 (75). •¶š‚ğ’†‰›‚Éİ’u‚·‚éê‡‚Í“ñ•ª‚Ìˆêcols‚Ì’l‚©‚ç’†‰›‚Éİ’u‚µ‚½‚¢•¶š‚ÌA•¶š”‚Ì”¼•ª‚ğˆø‚¢‚½”‚Ì‹ó”’‚ğ‘}“ü‚·‚ê‚Î‚æ‚¢
echo                              ƒJ[ƒ\ƒ‹‘Ö‚¦%batver%  %hazimebuild%
echo.
echo   O=====================================================================O
echo   I     1 ƒJ[ƒ\ƒ‹‘Ö‚¦          2 ƒAƒvƒŠƒP[ƒVƒ‡ƒ“           3 I—¹     I
echo   I                                                                     I
echo   I                   4 ƒo[ƒWƒ‡ƒ“î•ñ          5 İ’è                  I
echo   O=====================================================================O
echo.
if "%MenuRedrew%"=="true" (set MenuRedrew=& exit /b) else (call :hazimeMessages)
if "%errorlevel%"=="1" (cls&set Updateavailable=& goto :hazimemenudrew) else if "%errorlevel%"=="0" (goto :hazimemenudrewend)
:hazimemenudrewend
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
if "%selected%"=="egg1" (color 1f&call :BSOD_Errors 4)
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
if "%selected%"=="crashtest" (exit /b)
if "%selected%"=="checkmem" (call :checkmem& goto :hazimemenu)
if "%selected%"=="boottime" (echo.& echo ‹N“®ŠÔ : %BootTime% •b& echo.& pause & goto :hazimemenu)
if "%selected%"=="alldefnow1" (goto :AllDefult1)
if "%selected%"=="playdefboot" (cls&goto :CursorChangerOOBE_Animation)
if "%selected%"=="debugyesnow" (goto :kurogo)
if "%selected%"=="reload" (cls&set bootbatnow=yes&goto :batstart)
if "%selected%"=="fulldebug" (goto :fulldebug)
if "%selected%"=="getadmin" (goto :batstartadm)
if "%selected%"=="bypassfirstboot" (set firststartbat=no&call :Wipealldeta)
if "%selected%"=="alldefdeletebat" (echo delete bat, confirm to type something...&pause&goto :alldefdeletefinish5)
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
if "%selected%"=="shutdown" (goto :batshutdown)
if "%selected%"=="reboot" (echo.& echo Ä‹N“®‚µ‚Ä‚¢‚Ü‚·...& call :rebootbatch)
if "%selected%"=="counttestdeb" (set hatenaita=0&goto :stupidtest) else echo. &echo –³Œø‚Èi‚à‚µ‚­‚Íg—p•s‰Â‚Èj‘I‘ğ‚Å‚·I—LŒø‚È“ü—Í‚ğ‚µ‚Ä‚­‚¾‚³‚¢B&pause&goto :hazimemenudrew

rem ‰½‚à“ü—Í‚µ‚È‚©‚Á‚½ê‡‚Ì‹AŠÒˆ—
:hatenahazime
echo ?
echo.
pause
echo ‚·‚İ‚Ü‚¹‚ñB‰½‚©“ü—Í‚µ‚Ä‚­‚ê‚Ü‚¹‚ñ‚©H
echo.
pause
if "%hatenakeikoku%"=="–³Œø" (goto :hazimemenu)

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
Call :hazimeMessagesTimecheck & set tcmrand=&set tcmrand2=
if not "%errorlevel%"=="1" (
if "%FirstCursorisEdited%"=="true" (echo [22aŠÈ’P‚É  ‚©‚«‚©‚¦‚ç‚ê‚½  ‚Å‚µ‚åH&echo.)
) else (set hazimemenuMessageshowed=true)
if "%Updateavailable%"=="true" (
    title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| XV‚ª—˜—p‰Â”\ ^(Œ±“I^)
  setlocal enabledelayedexpansion
    if "%batbeta%"=="True" (set batbetamessage=^(ƒqƒ“ƒg : ‚±‚Ìƒo[ƒWƒ‡ƒ“‚Íƒx[ƒ^”Å‚Å‚·BƒoƒO‚â–â‘è‚ª‚ ‚é‰Â”\«‚ª‚ ‚è‚Ü‚·B ^))
  echo ƒAƒbƒvƒf[ƒg‚ª—˜—p‰Â”\‚Å‚·I ^(%updatemyversion% to %updateversion%^)
  echo ƒAƒbƒvƒf[ƒg‚µ‚Ü‚·‚©H^(ƒAƒbƒvƒf[ƒg‚·‚é‚Æ‰pŒê”Å‚Ö‹­§“I‚É•ÏX‚³‚ê‚Ü‚·^) !batbetamessage!
  set batbetamessage=
  SET /P updateselected=^(Y ‚Ü‚½‚Í N^) :
  if "!updateselected!"=="y" (set updateselected=&set updateavailable=&echo.&echo ƒAƒbƒvƒf[ƒg’†...‚µ‚Î‚ç‚­‚¨‘Ò‚¿‚­‚¾‚³‚¢B&cd %~dp0&set Powersheller=Doupdate&call :Powersheller&cd %batchmainpath%&echo ƒAƒbƒvƒf[ƒg‚É¬Œ÷‚µ‚Ü‚µ‚½B&pause&exit)
if "!updateselected!"=="n" (set updateselected=&set updateavailable=&echo.&echo ƒAƒbƒvƒf[ƒg‚ÍƒLƒƒƒ“ƒZƒ‹‚³‚ê‚Ü‚µ‚½B‹N“®‚ÉƒAƒbƒvƒf[ƒg‚ğŠm”F‚·‚é‹@”\‚Íİ’è‚©‚ç–³Œø‚É‚Å‚«‚Ü‚·B&pause&set checkupdatetoggle=false&cls&exit /b 1)
setlocal disabledelayedexpansion
)
exit /b 0

:hazimeMessagesTimecheck
rem Display messages for specific dates
if "%timecheckmessageshowed%"=="true" (set hazimemenuMessageshowed=& exit /b 0) else (set timecheckmessageshowed=true)
if "%date:~0,4%"=="1999" (echo [25aƒE[ƒp[ƒ‹[ƒp[‚Í‚Ç‚±H& echo.& exit /b 1)
if "%date:~5%"=="01/01" (echo [22a–¾‚¯‚Ü‚µ‚Ä‚¨‚ß‚Å‚Æ‚¤‚²‚´‚¢‚Ü‚·B& echo.& exit /b 1)
if "%date:~5%"=="04/01" (echo [15aƒJ[ƒ\ƒ‹‘Ö‚¦‚ğ—˜—p‚µ‚½‚¯‚ê‚Î5000’›‰~•¥‚¢‚ÈI& echo.& exit /b 1)
if "%date:~5%"=="10/31" (echo [27aƒnƒbƒs[ƒnƒƒEƒBƒ“I& echo.& exit /b 1)
if "%date:~5%"=="12/25" (echo [28aƒƒŠ[ƒNƒŠƒXƒ}ƒXI& echo.& exit /b 1)
if "%date:~5%"=="12/31" (echo [13a‚¢‚ë‚¢‚ë‚ ‚Á‚½‚¯‚Ç  ‚¶‚Ô‚ñ‚Í  ‚â‚Á‚Ï‚è  ‚¶‚Ô‚ñ‚¾B& echo.& exit /b 1)
set tcmrand=0& set tcmrand2=0
set /a tcmrand=%random%*33/32767& set /a tcmrand2=%random%*33/32767
setlocal enabledelayedexpansion
rem you're bit lucky if you see this.
if "!tcmrand!"=="!tcmrand2!" (
set tcmrand=0
set /a tcmrand=%random%*11/32767& set /a tcmrand=%random%*11/32767
if "!tcmrand!"=="0" (echo [29a‚·‚×‚Ä‚ª–³ˆÓ–¡‚¾&echo.& exit /b 1) else if "!tcmrand!"=="1" (echo [14a’N‚ª‚±‚ÌƒƒbƒZ[ƒW‚ğÀÛ‚É“Ç‚ñ‚Å‚¢‚é‚ñ‚¾‚ë‚¤H& echo.& exit /b 1) else if "!tcmrand!"=="2" (echo [22a’N‚à‚±‚Ìƒoƒbƒ`‚ğ‹C‚É‚µ‚Ä‚¢‚È‚¢B& echo.& exit /b 1) else if "!tcmrand!"=="3" (echo [22a–l‚ğƒAƒ“ƒCƒ“ƒXƒg[ƒ‹‚µ‚È‚¢‚Å& echo.& exit /b 1) else if "!tcmrand!"=="4" (echo [31aƒP[ƒL‚Í‰R‚¾& echo.& exit /b 1) else if "!tcmrand!"=="5" (echo [28a‚ ‚È‚½‚Í–{“–‚É%YourName%H& echo.& exit /b 1) else if "!tcmrand!"=="6" (echo [15aŒN’B‚Ìƒoƒbƒ`ƒtƒ@ƒCƒ‹‚ÍA‘S‚Ä„‚ª‚¢‚½‚¾‚¢‚½B& echo.& exit /b 1) else if "!tcmrand!"=="7" (echo [30aHello world :D& echo.& exit /b 1) else if "!tcmrand!"=="8" (echo [27aDebios‚ğ‚µ‚Ä‚İ‚æ‚¤& echo.& exit /b 1) else if "!tcmrand!"=="9" (echo [24aShivtanium OS‚ğ‚µ‚Ä‚İ‚æ‚¤& echo.& exit /b 1) else if "!tcmrand!"=="10" (goto :hazimemenuMessagesTimecheckEASTEREGG)
)
setlocal disabledelayedexpansion
exit /b 0

:hazimemenuMessagesTimecheckEASTEREGG
rem small test easter egg.
set name=& set namecount=
cls
color 04
title 
:hazimemenuMessagesTimecheckEASTEREGG_ASK
cls
if not defined dummy (echo [19aÅ‚àÅ‚‚Èƒoƒbƒ`ƒtƒ@ƒCƒ‹‚Ì–¼‘O‚Í‰½H)
set name=
if "%namecount%" gtr "2" start /min powershell -WindowStyle Hidden -Command "& {Add-Type -AssemblyName System.Windows.Forms; Start-Sleep -Milliseconds 100; $welcomeText = \"ƒJ[ƒ\ƒ‹‘Ö‚¦\"; foreach ($char in $welcomeText.ToCharArray()) {[System.Windows.Forms.SendKeys]::SendWait($char); Start-Sleep -Milliseconds 125}; Start-Sleep -Milliseconds 500; [System.Windows.Forms.SendKeys]::SendWait('{ENTER}'); exit}"
rem where is my location?
rem powershell -Command "& { Add-Type -AssemblyName System.Windows.Forms; Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class KeyboardHelper { [DllImport(\"user32.dll\", SetLastError = true)] public static extern void keybd_event(byte bVk, byte bScan, uint dwFlags, UIntPtr dwExtraInfo); public const byte VK_LWIN = 0x5B; public const byte VK_S = 0x53; public const uint KEYEVENTF_KEYUP = 0x0002; public static void SendWinS() { keybd_event(VK_LWIN, 0, 0, UIntPtr.Zero); keybd_event(VK_S, 0, 0, UIntPtr.Zero); keybd_event(VK_S, 0, KEYEVENTF_KEYUP, UIntPtr.Zero); keybd_event(VK_LWIN, 0, KEYEVENTF_KEYUP, UIntPtr.Zero); } }'; Start-Sleep -Milliseconds 500; [KeyboardHelper]::SendWinS(); Start-Sleep -Milliseconds 250; $welcomeText = 'Where is my location?'; foreach ($char in $welcomeText.ToCharArray()) { [System.Windows.Forms.SendKeys]::SendWait($char); Start-Sleep -Milliseconds 50; }; Start-Sleep -Milliseconds 3500; [System.Windows.Forms.SendKeys]::SendWait('{ESC}') }"
if not defined dummy (set /p "name=[30a")
if not "%name%"=="ƒJ[ƒ\ƒ‹‘Ö‚¦" (set /a namecount=namecount+1) else (goto :hazimemenuMessagesTimecheckEASTEREGG_RIGHT)
if "%namecount%"=="1" (echo [29ac”OA•s³‰ğI)
if "%namecount%"=="2" (echo [34aˆá‚¤) else if %namecount% gtr 2 (echo [35a...)
ping -n 2 -w 500 localhost >nul
goto :hazimemenuMessagesTimecheckEASTEREGG_ASK
:hazimemenuMessagesTimecheckEASTEREGG_RIGHT
if not defined dummy (echo [31a‚»‚Ì’Ê‚èI)
if "%wmodetoggle%"=="true" (color f0) else (color 07)
timeout /t 2 /nobreak >nul
set name=& set namecount=
goto :hazimemenu


:background_menu
rem Honestly, I have no idea HOW this is working.
if "%setting7onoff%"=="–³Œø" (exit /b)
if not defined dummy (set /p nothing=[?25l<nul)
setlocal enabledelayedexpansion
rem argument 1 is for OOBE. give 0~200 (every 10) value.
rem initialize variable
if "%wmodetoggle%"=="true" (
    if not defined dummy (set thmclr2=[107m[30m)
    set thml=26& set thml2=25
) else (if not defined dummy (set thmclr2=[0m))
if "%wmodetoggle%"=="true" (set thmlfor=194,9,243) else (set thmlfor=61,-9,12)
rem Drew bg. thml means theme line.
for /l %%i in (!thmlfor!) do (
    rem I think there is a simpler way to do this without having to bother with the calculations, but... well, it's working anyway.
    if "%wmodetoggle%"=="true" (set /a thml2-=1& set /a thml-=1) else (set /a thml=19+%%i/10& set /a thml2=thml-1)
    if "%1"=="1" (set /a thmldrew=^(%%i-57^)+^(!count!*^(61-12^)^)/170) else (set thmldrew=%%i)
    rem                                  ª      and      ª Difference is must be 4. 170 is (100/) + 61+12. maybe.
    if "%1"=="1" (if !thmldrew! lss 12 (set thmldrew=12))
    set thmclr=[48;2;!thmldrew!;!thmldrew!;!thmldrew!m
    for /l %%a in (1,1,3) do (set /p nothing=[!thml!d!thmclr!                         !thmclr2!<nul)
    echo [!thml2!d
)
rem delete variables
set thml=& set thml2=& set thmclr=& set thmldrew=& set thmlfor=
if not "%1"=="1" (setlocal disabledelayedexpansion & set /p nothing=[?25h<nul)
if not defined dummy (set /p nothing=[0;0H<nul)
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


:exitmenu
rem Preparing of Menu and Variables
rem Smart Processing!!!! DO NOT CARE ABOUT SO MANY OF IF STATEMENTS. PLS
cls
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| I—¹ 
set exitmenucurrent=0& call :exitmenu_exit
if not defined dummy (set clr=[7m&set clred=[41m&set clrgrn=[42m&set clrcyan=[46m&set clrgra=[90m&set clr2=[0m)
if "%wmodetoggle%"=="false" (set clr=[7m&set clred=[41m&set clrgrn=[42m&set clrgra=[90m&set clrcyan=[46m&set clr2=[0m)
if "%wmodetoggle%"=="true" (set clr=[100m[97m&set clred=[41m&set clrgrn=[42m&set clrgra=[0m[107m&set clrcyan=[46m&set clr2=[0m[90m[107m[30m)
if not defined dummy (set /p nothing=[?25l<nul)

:exitmenu_main
rem Main Exit Menu
if "%exitmenuexit%"=="true" (set exitmenucurrent=& call :exitmenu_exit & goto :hazime)
if not defined exitmenuboot (set MenuRedrew=true& set /p nothing=%clrgra%<nul & call :hazimemenudrew & echo %clr2% & set exitmenuboot=true)
call :exitmenu_Core_Drew
if not defined dummuy (set ccmmul=[4m)
if not defined dummy (
echo.
echo.
echo [3;22H O====================O 
echo [4;22H I ƒJ[ƒ\ƒ‹‘Ö‚¦‚ÌI—¹ I 
echo [5;22H O==========O====%ccmmul%===%clr2%===O===========O 
echo [6;22H I%emb%     ^|    %clr2%I%emb2%   /   \  %clr2%I%emb3%           %clr2%I 
echo [7;22H I%emb%   / ^| \  %clr2%I%emb2%  V    È %clr2%I%emb3%  ^-^-^-^-^-^-^>  %clr2%I 
echo [8;22H I%emb%   \___/  %clr2%I%emb2%   \___/  %clr2%I%emb3%           %clr2%I 
echo [9;22H O==========O==========O===========O 
echo [10;22H I[10;57HI 
echo [11;22H O=================================O 
echo [12;20H%clrgra%1~3A‚à‚µ‚­‚ÍA,D‚ÅˆÚ“®AY,E‚ÅŒˆ’èAB‚ÅI—¹%clr2%
)
choice /c 123adyeb /n >nul
if %ErrorLevel%==1 set exitmenucurrent=1& goto :exitmenu_main
if %ErrorLevel%==2 set exitmenucurrent=2& goto :exitmenu_main
if %ErrorLevel%==3 set exitmenucurrent=3& goto :exitmenu_main
if %ErrorLevel%==4 call :exitmenu_Core a
if %ErrorLevel%==5 call :exitmenu_Core d
if %ErrorLevel%==6 call :exitmenu_Core y
if %ErrorLevel%==7 call :exitmenu_Core e
if %ErrorLevel%==8 call :exitmenu_Core b
goto :exitmenu_main


:exitmenu_Core
rem Processing of each move
if "%1"=="1c" (set exitmenucurrent=1& exit /b)
if "%1"=="2c" (set exitmenucurrent=2& exit /b)
if "%1"=="a" (set /a exitmenucurrent-=1
    if "%Exitmenucurrent%"=="1c" (set exitmenucurrent=1)
    if "%Exitmenucurrent%"=="2c" (set exitmenucurrent=1)
    if "%exitmenucurrent%"=="0" (set exitmenucurrent=1)
    if "%exitmenucurrent%"=="1" (set exitmenucurrent=1)
    exit /b
)
if "%1"=="d" (set /a exitmenucurrent+=1
    if "%exitmenucurrent%"=="3" (set exitmenucurrent=3)
    exit /b
)
if "%1"=="b" (
    if "%Exitmenucurrent%"=="1c" (set exitmenucurrent=1)
    if "%Exitmenucurrent%"=="2c" (set exitmenucurrent=2) else (set exitmenuexit=true)
    exit /b
)
if "%1"=="y" (
    call :exitmenuselect_core
    if "%exitmenucurrent%"=="3" (set exitmenuexit=true)
    exit /b
)
if "%1"=="e" (
    call :exitmenuselect_core
    if "%exitmenucurrent%"=="3" (set exitmenuexit=true)
    exit /b
)


:exitmenuselect_core
rem Processing of Confirm key, like Y and E.
if "%Exitmenucurrent%"=="0" (set exitmenucurrent=1& exit /b)
if "%Exitmenucurrent%"=="1" (set exitmenucurrent=1c& exit /b)
if "%Exitmenucurrent%"=="2" (set exitmenucurrent=2c& exit /b)
if "%Exitmenucurrent%"=="1c" (set exitmenucurrent=1& goto :batshutdown)
if "%Exitmenucurrent%"=="2c" (call :exitmenuexit &call :rebootbatch)
exit /b

:exitmenu_Core_Drew
rem drawer of Text and Colors.
if not defined dummy (echo [10;24H                                 )
if "%Exitmenucurrent%"=="0" (echo [10;24H ‰½‚à‘I‘ğ‚³‚ê‚Ä‚¢‚Ü‚¹‚ñB& exit /b)
if "%Exitmenucurrent%"=="1" (echo [10;24H ƒVƒƒƒbƒgƒ_ƒEƒ“& set emb=%clred%& set emb2=& set emb3=& exit /b)
if "%Exitmenucurrent%"=="2" (echo [10;24H Ä‹N“®& set emb2=%clrgrn%& set emb=& set emb3=& exit /b)
if "%Exitmenucurrent%"=="3" (echo [10;24H –ß‚é& set emb3=%clrcyan%& set emb2=& set emb=& exit /b)
if "%Exitmenucurrent%"=="1c" (echo [10;24H –{“–‚ÉƒVƒƒƒbƒgƒ_ƒEƒ“‚µ‚Ü‚·‚©H& exit /b)
if "%Exitmenucurrent%"=="2c" (echo [10;24H –{“–‚ÉÄ‹N“®‚µ‚Ü‚·‚©H& exit /b)
exit /b

:exitmenu_exit
rem initialize of variable
set exitmenuexit=& set emb=& set emb2=& set emb3=& set exitmenuboot=& set clred=& set clrgrn=& set clrcyan=& set clrgra=
if not defined dummy (set /p nothing=[?25h<nul)
exit /b


:batshutdown
if not defined dummy (set /p nothing=[?25l<nul)
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ƒAƒŠ[ƒ”ƒFƒfƒ‹ƒ`
cls
if "%wmodetoggle%"=="true" (set welcomelineclr=[38;2;135;135;135m& set welcomelineclr2=[0m[107m[30m& set welcomelineclr3=[30m) else (set welcomelineclr=[38;2;120;120;120m& set welcomelineclr2=[0m& set welcomelineclr3=[39m)
if "%wmodetoggle%"=="true" (for /l %%i in (0,1,3) do (set /p nothing=[%%i;0H[48;2;230;230;230m                                                                           [0;0H<nul)) else (for /l %%i in (0,1,3) do (set /p nothing=[%%i;0H[48;2;20;20;20m                                                                           [0;0H<nul))
echo.
if not defined dummy (echo [30aƒJ[ƒ\ƒ‹‘Ö‚¦%batver%)
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
echo                                                ‚³‚æ‚¤‚È‚ç
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
if "%wmodetoggle%"=="true" (for /l %%i in (22,1,25) do (set /p nothing=[%%i;0H[48;2;230;230;230m                                                                           [22;0H<nul)) else (for /l %%i in (22,1,25) do (set /p nothing=[%%i;0H[48;2;20;20;20m                                                                           [22;0H<nul))
echo %welcomelineclr%O=========================================================================O%welcomelineclr3%
echo.
if not defined dummy (echo [23a2021-2024 tamago_1908 %batbuild%)
set welcomelineclr=& set welcomelineclr2=& set welcomelineclr3=
call :exitmenuexit
timeout /t 3 /nobreak >nul
call :exit 0

:exitmenuexit
set clrcyan=& set clrgra=& set clred=& set clrgrn=& set clryel=& set clrmag=& exit /b




rem İ’èƒƒjƒ…[‚Ì•`Ê
:setting
set wantload=
set settinghelptoggle=false
if not defined dummy (set clr=[7m&set clr2=[0m)
if "%wmodetoggle%"=="false" (set clr=[7m&set clr2=[0m)
if "%wmodetoggle%"=="true" (set clr=[100m[97m&set clr2=[0m[107m[30m)
rem İ’èƒtƒ@ƒCƒ‹‚ª‘¶İ‚·‚é‚©‚ğŒŸ’m
cd /d %batchmainpath%
rem êŠ OS‚ª“ü‚Á‚½ƒhƒ‰ƒCƒu:\Users\ƒ†[ƒU[–¼
rem (—á ƒ†[ƒU[‚Ì–¼‘O‚ªtest‚¾‚Á‚½ê‡‚ÆAOS‚ª“ü‚Á‚½êŠ‚ªCƒhƒ‰ƒCƒu‚¾‚Á‚½ê‡‚¾‚Æ C:\Users\Test)
if not exist %Settingsfile% (goto :dogcheck)
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| İ’è 
set selected=
if not defined "%clrgra%" (set clrgra=[90m)
Cls
echo.
Echo                                 İ’èƒƒjƒ…[
echo. 
echo O========================O                  O======O
echo I      ƒJƒeƒSƒŠ[        I                  I İ’è I
echo O========================O==================O======O======================O
echo I                        I                                                I
echo I  ƒJ[ƒ\ƒ‹‘Ö‚¦  ‹@”\Œn  I  ƒJƒeƒSƒŠ[‚ª‘I‘ğ‚³‚ê‚Ä‚¢‚Ü‚¹‚ñB              I
echo I                        I                                                I
echo I========================I                                                I
echo I  ƒJƒeƒSƒŠ[  ã‚©‰º‚©  I                                                I
echo I========================I                                                I
Echo I                        I  %clrgra%[W S] ‚© [1 2] ‚Ç‚¿‚ç‚©‚ğ‰Ÿ‚µ‚ÄƒJƒeƒSƒŠ[‚ğ%clr2%   I
echo I ƒJ[ƒ\ƒ‹‘Ö‚¦  Œ©‚½–ÚŒn I  %clrgra%‘I‘ğ‚µ‚Ä‚­‚¾‚³‚¢B%clr2%                            I
echo I                        I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ƒwƒ‹ƒvƒ‚[ƒh      %clrhelp2%I  I ˆÚ“® : W A S D ”š I –ß‚é : B I Œˆ’è : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12wsdbye3 /n /m "•ÏX‚·‚é‚à‚Ì‚ğ”š‚Åw’è–”‚Íwasd‚ÅˆÚ“®‚µ‚Äw’è‚µ‚Ä‚­‚¾‚³‚¢"
set clrgra=
if %ErrorLevel%==1 goto :settingcategory1
if %ErrorLevel%==2 goto :settingcategory2
if %ErrorLevel%==3 goto :settingcategory1
if %ErrorLevel%==4 goto :settingcategory1
if %ErrorLevel%==5 goto :settingcategory1
if %ErrorLevel%==6 goto :hazime
if %ErrorLevel%==7 goto :settingcategory1
if %ErrorLevel%==8 goto :settingcategory1
if %ErrorLevel%==9 goto :settingcategoryhelpmode

:settingcategory1
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| İ’è 
set selected=
Cls
echo.
Echo                                 İ’èƒƒjƒ…[
echo. 
echo O========================O                  O======O
echo I      ƒJƒeƒSƒŠ[        I                  I İ’è I
echo O========================O==================O======O======================O
echo I%clr%                        %clr2%I                                                I
echo I%clr%  ƒJ[ƒ\ƒ‹‘Ö‚¦  ‹@”\Œn  %clr2%I  ƒJ[ƒ\ƒ‹‘Ö‚¦‚Ì‹@”\‚ÉŠÖ‚·‚éİ’è‚Å‚·B          I
echo I%clr%                        %clr2%I                                                I
echo I========================I                                                I
echo I  ƒJƒeƒSƒŠ[  ã‚©‰º‚©  I                                                I
echo I========================I                                                I
Echo I                        I                                                I
echo I ƒJ[ƒ\ƒ‹‘Ö‚¦  Œ©‚½–ÚŒn I                                                I
echo I                        I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ƒwƒ‹ƒvƒ‚[ƒh      %clrhelp2%I  I ˆÚ“® : W A S D ”š I –ß‚é : B I Œˆ’è : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12wsdbye3 /n /m "•ÏX‚·‚é‚à‚Ì‚ğ”š‚Åw’è–”‚Íwasd‚ÅˆÚ“®‚µ‚Äw’è‚µ‚Ä‚­‚¾‚³‚¢"
if %ErrorLevel%==1 goto :settingcategory1
if %ErrorLevel%==2 goto :settingcategory2
if %ErrorLevel%==3 goto :settingcategory1
if %ErrorLevel%==4 goto :settingcategory2
if %ErrorLevel%==5 goto :settingcategory1int
if %ErrorLevel%==6 goto :hazime
if %ErrorLevel%==7 goto :settingcategory1int
if %ErrorLevel%==8 goto :settingcategory1int
if %ErrorLevel%==9 goto :settingcategoryhelpmode

:settingcategory2
rem İ’èƒtƒ@ƒCƒ‹‚ª‘¶İ‚·‚é‚©‚ğŒŸ’m
cd /d %batchmainpath%
rem êŠ OS‚ª“ü‚Á‚½ƒhƒ‰ƒCƒu:\Users\ƒ†[ƒU[–¼
rem (—á ƒ†[ƒU[‚Ì–¼‘O‚ªtest‚¾‚Á‚½ê‡‚ÆAOS‚ª“ü‚Á‚½êŠ‚ªCƒhƒ‰ƒCƒu‚¾‚Á‚½ê‡‚¾‚Æ C:\Users\Test)
if not exist %Settingsfile% (goto :dogcheck)
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| İ’è 
set selected=
if not defined "%clrgra%" (set clrgra=[90m)
Cls
echo.
Echo                                 İ’èƒƒjƒ…[
echo. 
echo O========================O                  O======O
echo I      ƒJƒeƒSƒŠ[        I                  I İ’è I
echo O========================O==================O======O======================O
echo I                        I                                                I
echo I  ƒJ[ƒ\ƒ‹‘Ö‚¦  ‹@”\Œn  I  ƒJ[ƒ\ƒ‹‘Ö‚¦‚ÌŒ©‚½–Ú‚ÉŠÖ‚·‚éİ’è‚Å‚·B        I
echo I                        I %clrgra%iƒe[ƒ}‚È‚Çj%clr2%                                 I
echo I========================I                                                I
echo I  ƒJƒeƒSƒŠ[  ã‚©‰º‚©  I                                                I
echo I========================I                                                I
Echo I%clr%                        %clr2%I                                                I
echo I%clr% ƒJ[ƒ\ƒ‹‘Ö‚¦  Œ©‚½–ÚŒn %clr2%I                                                I
echo I%clr%                        %clr2%I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ƒwƒ‹ƒvƒ‚[ƒh      %clrhelp2%I  I ˆÚ“® : W A S D ”š I –ß‚é : B I Œˆ’è : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12wsdbye3 /n /m "•ÏX‚·‚é‚à‚Ì‚ğ”š‚Åw’è–”‚Íwasd‚ÅˆÚ“®‚µ‚Äw’è‚µ‚Ä‚­‚¾‚³‚¢"
set clrgra=
if %ErrorLevel%==1 goto :settingcategory1
if %ErrorLevel%==2 goto :settingcategory2
if %ErrorLevel%==3 goto :settingcategory1
if %ErrorLevel%==4 goto :settingcategoryhelpmode
if %ErrorLevel%==5 goto :settingcategory2int
if %ErrorLevel%==6 goto :hazime
if %ErrorLevel%==7 goto :settingcategory2int
if %ErrorLevel%==8 goto :settingcategory2int
if %ErrorLevel%==9 goto :settingcategoryhelpmode

rem ƒJƒeƒSƒŠ[“à•”

:settingcategory1int
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| İ’è 
set selected=
Cls
echo.
Echo                                 İ’èƒƒjƒ…[
echo. 
echo O========================O                  O======O
echo I      ƒJƒeƒSƒŠ[        I                  I İ’è I
echo O========================O==================O======O===========O==========O
echo I%clr%                        %clr2%I 1 ‹N“®‚ÉƒJ[ƒ\ƒ‹‘Ö‚¦‚Å‹N“®        I   %setting1onoff%   I
echo I%clr%  ƒJ[ƒ\ƒ‹‘Ö‚¦  ‹@”\Œn  %clr2%I                                     O==========O
echo I%clr%                        %clr2%I 2 ‹N“®‚ÌƒAƒhƒ~ƒ“                  I   %setting2onoff%   I
echo I========================I                                     O==========O
echo I  ƒJƒeƒSƒŠ[  ã‚©‰º‚©  I 3 ‹N“®‚ÉXVŠm”F                  I   %setting3onoff%   I
echo I========================I                                     O==========O
Echo I                        I 4 Enter‚Ì’·‰Ÿ‚µ‚ğŒŸ’m‚·‚é‹@”\       I   %setting4onoff%   I
echo I ƒJ[ƒ\ƒ‹‘Ö‚¦  Œ©‚½–ÚŒn I                                     O==========O
echo I                        I 5 ‰Šú‰»‚Ü‚½‚ÍƒAƒ“ƒCƒ“ƒXƒg[ƒ‹                 I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ƒwƒ‹ƒvƒ‚[ƒh      %clrhelp2%I  I ˆÚ“® : W A S D ”š I –ß‚é : B I Œˆ’è : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12wsdbye3 /n /m "•ÏX‚·‚é‚à‚Ì‚ğ”š‚Åw’è–”‚Íwasd‚ÅˆÚ“®‚µ‚Äw’è‚µ‚Ä‚­‚¾‚³‚¢"
if %ErrorLevel%==1 goto :settingcategory1
if %ErrorLevel%==2 goto :settingcategory2
if %ErrorLevel%==3 goto :settingcategory1
if %ErrorLevel%==4 goto :settingcategory2
if %ErrorLevel%==5 goto :settingcategory1intsetting1
if %ErrorLevel%==6 goto :settingcategory1
if %ErrorLevel%==7 goto :settingcategory1intsetting1
if %ErrorLevel%==8 goto :settingcategory1intsetting1
if %ErrorLevel%==9 goto :settingcategoryhelpmode

:settingcategory1intsetting1
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| İ’è 
set selected=
Cls
echo.
Echo                                 İ’èƒƒjƒ…[
echo. 
echo O========================O                  O======O
echo I      ƒJƒeƒSƒŠ[        I                  I İ’è I
echo O========================O==================O======O===========O==========O
echo I%clr%                        %clr2%I %clr%1 ‹N“®‚ÉƒJ[ƒ\ƒ‹‘Ö‚¦‚Å‹N“®%clr2%        I   %setting1onoff%   I
echo I%clr%  ƒJ[ƒ\ƒ‹‘Ö‚¦  ‹@”\Œn  %clr2%I                                     O==========O
echo I%clr%                        %clr2%I 2 ‹N“®‚ÌƒAƒhƒ~ƒ“                  I   %setting2onoff%   I
echo I========================I                                     O==========O
echo I  ƒJƒeƒSƒŠ[  ã‚©‰º‚©  I 3 ‹N“®‚ÉXVŠm”F                  I   %setting3onoff%   I
echo I========================I                                     O==========O
Echo I                        I 4 Enter‚Ì’·‰Ÿ‚µ‚ğŒŸ’m‚·‚é‹@”\       I   %setting4onoff%   I
echo I ƒJ[ƒ\ƒ‹‘Ö‚¦  Œ©‚½–ÚŒn I                                     O==========O
echo I                        I 5 ‰Šú‰»‚Ü‚½‚ÍƒAƒ“ƒCƒ“ƒXƒg[ƒ‹                 I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ƒwƒ‹ƒvƒ‚[ƒh      %clrhelp2%I  I ˆÚ“® : W A S D ”š I –ß‚é : B I Œˆ’è : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12345wsabye /n /m "•ÏX‚·‚é‚à‚Ì‚ğ”š‚Åw’è–”‚Íwasd‚ÅˆÚ“®‚µ‚Äw’è‚µ‚Ä‚­‚¾‚³‚¢"
if %ErrorLevel%==1 goto :settingcategory1intsetting1
if %ErrorLevel%==2 goto :settingcategory1intsetting2
if %ErrorLevel%==3 goto :settingcategory1intsetting3
if %ErrorLevel%==4 goto :settingcategory1intsetting4
if %ErrorLevel%==5 goto :settingcategory1intsetting5
if %ErrorLevel%==6 goto :settingcategory1intsetting1
if %ErrorLevel%==7 goto :settingcategory1intsetting2
if %ErrorLevel%==8 goto :settingcategory1int
if %ErrorLevel%==9 goto :settingcategory1int
if %ErrorLevel%==10 goto :setting1
if %ErrorLevel%==11 goto :setting1

:settingcategory1intsetting2
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| İ’è 
set selected=
Cls
echo.
Echo                                 İ’èƒƒjƒ…[
echo. 
echo O========================O                  O======O
echo I      ƒJƒeƒSƒŠ[        I                  I İ’è I
echo O========================O==================O======O===========O==========O
echo I%clr%                        %clr2%I 1 ‹N“®‚ÉƒJ[ƒ\ƒ‹‘Ö‚¦‚Å‹N“®        I   %setting1onoff%   I
echo I%clr%  ƒJ[ƒ\ƒ‹‘Ö‚¦  ‹@”\Œn  %clr2%I                                     O==========O
echo I%clr%                        %clr2%I %clr%2 ‹N“®‚ÌƒAƒhƒ~ƒ“%clr2%                  I   %setting2onoff%   I
echo I========================I                                     O==========O
echo I  ƒJƒeƒSƒŠ[  ã‚©‰º‚©  I 3 ‹N“®‚ÉXVŠm”F                  I   %setting3onoff%   I
echo I========================I                                     O==========O
Echo I                        I 4 Enter‚Ì’·‰Ÿ‚µ‚ğŒŸ’m‚·‚é‹@”\       I   %setting4onoff%   I
echo I ƒJ[ƒ\ƒ‹‘Ö‚¦  Œ©‚½–ÚŒn I                                     O==========O
echo I                        I 5 ‰Šú‰»‚Ü‚½‚ÍƒAƒ“ƒCƒ“ƒXƒg[ƒ‹                 I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ƒwƒ‹ƒvƒ‚[ƒh      %clrhelp2%I  I ˆÚ“® : W A S D ”š I –ß‚é : B I Œˆ’è : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12345wsabye /n /m "•ÏX‚·‚é‚à‚Ì‚ğ”š‚Åw’è–”‚Íwasd‚ÅˆÚ“®‚µ‚Äw’è‚µ‚Ä‚­‚¾‚³‚¢"
if %ErrorLevel%==1 goto :settingcategory1intsetting1
if %ErrorLevel%==2 goto :settingcategory1intsetting2
if %ErrorLevel%==3 goto :settingcategory1intsetting3
if %ErrorLevel%==4 goto :settingcategory1intsetting4
if %ErrorLevel%==5 goto :settingcategory1intsetting5
if %ErrorLevel%==6 goto :settingcategory1intsetting1
if %ErrorLevel%==7 goto :settingcategory1intsetting3
if %ErrorLevel%==8 goto :settingcategory1int
if %ErrorLevel%==9 goto :settingcategory1int
if %ErrorLevel%==10 goto :setting2
if %ErrorLevel%==11 goto :setting2


:settingcategory1intsetting3
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| İ’è 
set selected=
Cls
echo.
Echo                                 İ’èƒƒjƒ…[
echo. 
echo O========================O                  O======O
echo I      ƒJƒeƒSƒŠ[        I                  I İ’è I
echo O========================O==================O======O===========O==========O
echo I%clr%                        %clr2%I 1 ‹N“®‚ÉƒJ[ƒ\ƒ‹‘Ö‚¦‚Å‹N“®        I   %setting1onoff%   I
echo I%clr%  ƒJ[ƒ\ƒ‹‘Ö‚¦  ‹@”\Œn  %clr2%I                                     O==========O
echo I%clr%                        %clr2%I 2 ‹N“®‚ÌƒAƒhƒ~ƒ“                  I   %setting2onoff%   I
echo I========================I                                     O==========O
echo I  ƒJƒeƒSƒŠ[  ã‚©‰º‚©  I %clr%3 ‹N“®‚ÉXVŠm”F%clr2%                  I   %setting3onoff%   I
echo I========================I                                     O==========O
Echo I                        I 4 Enter‚Ì’·‰Ÿ‚µ‚ğŒŸ’m‚·‚é‹@”\       I   %setting4onoff%   I
echo I ƒJ[ƒ\ƒ‹‘Ö‚¦  Œ©‚½–ÚŒn I                                     O==========O
echo I                        I 5 ‰Šú‰»‚Ü‚½‚ÍƒAƒ“ƒCƒ“ƒXƒg[ƒ‹                 I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ƒwƒ‹ƒvƒ‚[ƒh      %clrhelp2%I  I ˆÚ“® : W A S D ”š I –ß‚é : B I Œˆ’è : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12345wsabye /n /m "•ÏX‚·‚é‚à‚Ì‚ğ”š‚Åw’è–”‚Íwasd‚ÅˆÚ“®‚µ‚Äw’è‚µ‚Ä‚­‚¾‚³‚¢"
if %ErrorLevel%==1 goto :settingcategory1intsetting1
if %ErrorLevel%==2 goto :settingcategory1intsetting2
if %ErrorLevel%==3 goto :settingcategory1intsetting3
if %ErrorLevel%==4 goto :settingcategory1intsetting4
if %ErrorLevel%==5 goto :settingcategory1intsetting5
if %ErrorLevel%==6 goto :settingcategory1intsetting2
if %ErrorLevel%==7 goto :settingcategory1intsetting4
if %ErrorLevel%==8 goto :settingcategory1int
if %ErrorLevel%==9 goto :settingcategory1int
if %ErrorLevel%==10 goto :setting3
if %ErrorLevel%==11 goto :setting3


:settingcategory1intsetting4
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| İ’è 
set selected=
Cls
echo.
Echo                                 İ’èƒƒjƒ…[
echo. 
echo O========================O                  O======O
echo I      ƒJƒeƒSƒŠ[        I                  I İ’è I
echo O========================O==================O======O===========O==========O
echo I%clr%                        %clr2%I 1 ‹N“®‚ÉƒJ[ƒ\ƒ‹‘Ö‚¦‚Å‹N“®        I   %setting1onoff%   I
echo I%clr%  ƒJ[ƒ\ƒ‹‘Ö‚¦  ‹@”\Œn  %clr2%I                                     O==========O
echo I%clr%                        %clr2%I 2 ‹N“®‚ÌƒAƒhƒ~ƒ“                  I   %setting2onoff%   I
echo I========================I                                     O==========O
echo I  ƒJƒeƒSƒŠ[  ã‚©‰º‚©  I 3 ‹N“®‚ÉXVŠm”F                  I   %setting3onoff%   I
echo I========================I                                     O==========O
Echo I                        I %clr%4 Enter‚Ì’·‰Ÿ‚µ‚ğŒŸ’m‚·‚é‹@”\%clr2%       I   %setting4onoff%   I
echo I ƒJ[ƒ\ƒ‹‘Ö‚¦  Œ©‚½–ÚŒn I                                     O==========O
echo I                        I 5 ‰Šú‰»‚Ü‚½‚ÍƒAƒ“ƒCƒ“ƒXƒg[ƒ‹                 I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ƒwƒ‹ƒvƒ‚[ƒh      %clrhelp2%I  I ˆÚ“® : W A S D ”š I –ß‚é : B I Œˆ’è : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12345wsabye /n /m "•ÏX‚·‚é‚à‚Ì‚ğ”š‚Åw’è–”‚Íwasd‚ÅˆÚ“®‚µ‚Äw’è‚µ‚Ä‚­‚¾‚³‚¢"
if %ErrorLevel%==1 goto :settingcategory1intsetting1
if %ErrorLevel%==2 goto :settingcategory1intsetting2
if %ErrorLevel%==3 goto :settingcategory1intsetting3
if %ErrorLevel%==4 goto :settingcategory1intsetting4
if %ErrorLevel%==5 goto :settingcategory1intsetting5
if %ErrorLevel%==6 goto :settingcategory1intsetting3
if %ErrorLevel%==7 goto :settingcategory1intsetting5
if %ErrorLevel%==8 goto :settingcategory1int
if %ErrorLevel%==9 goto :settingcategory1int
if %ErrorLevel%==10 goto :setting4
if %ErrorLevel%==11 goto :setting4


:settingcategory1intsetting5
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| İ’è 
set selected=
Cls
echo.
Echo                                 İ’èƒƒjƒ…[
echo. 
echo O========================O                  O======O
echo I      ƒJƒeƒSƒŠ[        I                  I İ’è I
echo O========================O==================O======O===========O==========O
echo I%clr%                        %clr2%I 1 ‹N“®‚ÉƒJ[ƒ\ƒ‹‘Ö‚¦‚Å‹N“®        I   %setting1onoff%   I
echo I%clr%  ƒJ[ƒ\ƒ‹‘Ö‚¦  ‹@”\Œn  %clr2%I                                     O==========O
echo I%clr%                        %clr2%I 2 ‹N“®‚ÌƒAƒhƒ~ƒ“                  I   %setting2onoff%   I
echo I========================I                                     O==========O
echo I  ƒJƒeƒSƒŠ[  ã‚©‰º‚©  I 3 ‹N“®‚ÉXVŠm”F                  I   %setting3onoff%   I
echo I========================I                                     O==========O
Echo I                        I 4 Enter‚Ì’·‰Ÿ‚µ‚ğŒŸ’m‚·‚é‹@”\       I   %setting4onoff%   I
echo I ƒJ[ƒ\ƒ‹‘Ö‚¦  Œ©‚½–ÚŒn I                                     O==========O
echo I                        I %clr%5 ‰Šú‰»‚Ü‚½‚ÍƒAƒ“ƒCƒ“ƒXƒg[ƒ‹%clr2%                 I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ƒwƒ‹ƒvƒ‚[ƒh      %clrhelp2%I  I ˆÚ“® : W A S D ”š I –ß‚é : B I Œˆ’è : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12345wsabye /n /m "•ÏX‚·‚é‚à‚Ì‚ğ”š‚Åw’è–”‚Íwasd‚ÅˆÚ“®‚µ‚Äw’è‚µ‚Ä‚­‚¾‚³‚¢"
if %ErrorLevel%==1 goto :settingcategory1intsetting1
if %ErrorLevel%==2 goto :settingcategory1intsetting2
if %ErrorLevel%==3 goto :settingcategory1intsetting3
if %ErrorLevel%==4 goto :settingcategory1intsetting4
if %ErrorLevel%==5 goto :settingcategory1intsetting5
if %ErrorLevel%==6 goto :settingcategory1intsetting4
if %ErrorLevel%==7 goto :settingcategory1intsetting5
if %ErrorLevel%==8 goto :settingcategory1int
if %ErrorLevel%==9 goto :settingcategory1int
if %ErrorLevel%==10 goto :AllDefult
if %ErrorLevel%==11 goto :AllDefult

:settingcategory2int
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| İ’è 
set selected=
Cls
echo.
Echo                                 İ’èƒƒjƒ…[
echo. 
echo O========================O                  O======O
echo I      ƒJƒeƒSƒŠ[        I                  I İ’è I
echo O========================O==================O======O======================O
echo I                        I 1 ‹N“®‚ÌƒAƒjƒ[ƒVƒ‡ƒ“‚Ìİ’è      I     ^>    I
echo I  ƒJ[ƒ\ƒ‹‘Ö‚¦  ‹@”\Œn  I                                     O==========O
echo I                        I 2 ƒƒCƒ“ƒƒjƒ…[‚É”wŒi‚ğ•\¦        I   %setting6onoff%   I
echo I========================I                                     O==========O
echo I  ƒJƒeƒSƒŠ[  ã‚©‰º‚©  I 3 %wmodeonoff%                         I
echo I========================I                                                I
Echo I%clr%                        %clr2%I                                                I
echo I%clr% ƒJ[ƒ\ƒ‹‘Ö‚¦  Œ©‚½–ÚŒn %clr2%I                                                I
echo I%clr%                        %clr2%I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ƒwƒ‹ƒvƒ‚[ƒh      %clrhelp2%I  I ˆÚ“® : W A S D ”š I –ß‚é : B I Œˆ’è : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12wsdbye3 /n /m "•ÏX‚·‚é‚à‚Ì‚ğ”š‚Åw’è–”‚Íwasd‚ÅˆÚ“®‚µ‚Äw’è‚µ‚Ä‚­‚¾‚³‚¢"
if %ErrorLevel%==1 goto :settingcategory2intsetting1
if %ErrorLevel%==2 goto :settingcategory2intsetting2
if %ErrorLevel%==3 goto :settingcategory1
if %ErrorLevel%==4 goto :settingcategoryhelpmode
if %ErrorLevel%==5 goto :settingcategory2intsetting1
if %ErrorLevel%==6 goto :settingcategory2
if %ErrorLevel%==7 goto :settingcategory2intsetting1
if %ErrorLevel%==8 goto :settingcategory2intsetting1
if %ErrorLevel%==9 goto :settingcategoryhelpmode

:settingcategory2intsetting1
set sc2s5s1lock=&set sc2s5s2lock=&set sc2s5s3lock=&set sc2s5s1lock2=&set sc2s5s2lock2=&set sc2s5s3lock2=&set setting5_stg_whereyou=
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| İ’è 
set selected=
Cls
echo.
Echo                                 İ’èƒƒjƒ…[  
echo. 
echo O========================O                  O======O
echo I      ƒJƒeƒSƒŠ[        I                  I İ’è I
echo O========================O==================O======O======================O
echo I                        I %clr%1 ‹N“®‚ÌƒAƒjƒ[ƒVƒ‡ƒ“‚Ìİ’è%clr2%      I     ^>    I
echo I  ƒJ[ƒ\ƒ‹‘Ö‚¦  ‹@”\Œn  I                                     O==========O
echo I                        I 2 ƒƒCƒ“ƒƒjƒ…[‚É”wŒi‚ğ•\¦        I   %setting6onoff%   I
echo I========================I                                     O==========O
echo I  ƒJƒeƒSƒŠ[  ã‚©‰º‚©  I 3 %wmodeonoff%                         I
echo I========================I                                                I
Echo I%clr%                        %clr2%I                                                I
echo I%clr% ƒJ[ƒ\ƒ‹‘Ö‚¦  Œ©‚½–ÚŒn %clr2%I                                                I
echo I%clr%                        %clr2%I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ƒwƒ‹ƒvƒ‚[ƒh      %clrhelp2%I  I ˆÚ“® : W A S D ”š I –ß‚é : B I Œˆ’è : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12wsabyed3 /n /m "•ÏX‚·‚é‚à‚Ì‚ğ”š‚Åw’è–”‚Íwasd‚ÅˆÚ“®‚µ‚Äw’è‚µ‚Ä‚­‚¾‚³‚¢"
if %ErrorLevel%==1 goto :settingcategory2intsetting1
if %ErrorLevel%==2 goto :settingcategory2intsetting2
if %ErrorLevel%==3 goto :settingcategory2intsetting1
if %ErrorLevel%==4 goto :settingcategory2intsetting2
if %ErrorLevel%==5 goto :settingcategory2int
if %ErrorLevel%==6 goto :settingcategory2int
if %ErrorLevel%==7 goto :settingcategory2intsetting5_stg0
if %ErrorLevel%==8 goto :settingcategory2intsetting5_stg0
if %ErrorLevel%==9 goto :settingcategory2intsetting5_stg0
if %ErrorLevel%==10 goto :settingcategory2intsetting3

:settingcategory2intsetting2
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| İ’è 
set selected=
Cls
echo.
Echo                                 İ’èƒƒjƒ…[
echo. 
echo O========================O                  O======O
echo I      ƒJƒeƒSƒŠ[        I                  I İ’è I
echo O========================O==================O======O======================O
echo I                        I 1 ‹N“®‚ÌƒAƒjƒ[ƒVƒ‡ƒ“‚Ìİ’è      I     ^>    I
echo I  ƒJ[ƒ\ƒ‹‘Ö‚¦  ‹@”\Œn  I                                     O==========O
echo I                        I %clr%2 ƒƒCƒ“ƒƒjƒ…[‚É”wŒi‚ğ•\¦%clr2%        I   %setting6onoff%   I
echo I========================I                                     O==========O
echo I  ƒJƒeƒSƒŠ[  ã‚©‰º‚©  I 3 %wmodeonoff%                         I
echo I========================I                                                I
Echo I%clr%                        %clr2%I                                                I
echo I%clr% ƒJ[ƒ\ƒ‹‘Ö‚¦  Œ©‚½–ÚŒn %clr2%I                                                I
echo I%clr%                        %clr2%I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ƒwƒ‹ƒvƒ‚[ƒh      %clrhelp2%I  I ˆÚ“® : W A S D ”š I –ß‚é : B I Œˆ’è : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12wsabye3 /n /m "•ÏX‚·‚é‚à‚Ì‚ğ”š‚Åw’è–”‚Íwasd‚ÅˆÚ“®‚µ‚Äw’è‚µ‚Ä‚­‚¾‚³‚¢"
if %ErrorLevel%==1 goto :settingcategory2intsetting1
if %ErrorLevel%==2 goto :settingcategory2intsetting2
if %ErrorLevel%==3 goto :settingcategory2intsetting1
if %ErrorLevel%==4 goto :settingcategory2intsetting3
if %ErrorLevel%==5 goto :settingcategory2int
if %ErrorLevel%==6 goto :settingcategory2int
if %ErrorLevel%==7 goto :setting6
if %ErrorLevel%==8 goto :setting6
if %ErrorLevel%==9 goto :settingcategory2intsetting3

:settingcategory2intsetting3
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| İ’è 
set selected=
Cls
echo.
Echo                                 İ’èƒƒjƒ…[
echo. 
echo O========================O                  O======O
echo I      ƒJƒeƒSƒŠ[        I                  I İ’è I
echo O========================O==================O======O======================O
echo I                        I 1 ‹N“®‚ÌƒAƒjƒ[ƒVƒ‡ƒ“‚Ìİ’è      I     ^>    I
echo I  ƒJ[ƒ\ƒ‹‘Ö‚¦  ‹@”\Œn  I                                     O==========O
echo I                        I 2 ƒƒCƒ“ƒƒjƒ…[‚É”wŒi‚ğ•\¦        I   %setting6onoff%   I
echo I========================I                                     O==========O
echo I  ƒJƒeƒSƒŠ[  ã‚©‰º‚©  I %clr%3 %wmodeonoff%%clr2%                         I
echo I========================I                                                I
Echo I%clr%                        %clr2%I                                                I
echo I%clr% ƒJ[ƒ\ƒ‹‘Ö‚¦  Œ©‚½–ÚŒn %clr2%I                                                I
echo I%clr%                        %clr2%I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ƒwƒ‹ƒvƒ‚[ƒh      %clrhelp2%I  I ˆÚ“® : W A S D ”š I –ß‚é : B I Œˆ’è : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12wsabye3 /n /m "•ÏX‚·‚é‚à‚Ì‚ğ”š‚Åw’è–”‚Íwasd‚ÅˆÚ“®‚µ‚Äw’è‚µ‚Ä‚­‚¾‚³‚¢"
if %ErrorLevel%==1 goto :settingcategory2intsetting1
if %ErrorLevel%==2 goto :settingcategory2intsetting2
if %ErrorLevel%==3 goto :settingcategory2intsetting2
if %ErrorLevel%==4 goto :settingcategory2intsetting3
if %ErrorLevel%==5 goto :settingcategory2int
if %ErrorLevel%==6 goto :settingcategory2int
if %ErrorLevel%==7 goto :wmode
if %ErrorLevel%==8 goto :wmode
if %ErrorLevel%==9 goto :settingcategory2intsetting3



:settingcategory2intsetting5_stg0
set setting5_stg_whereyou=stg0
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| İ’è 
call :settingcategory2intsetting5blockcheck
set selected=
Cls
echo.
Echo                                 İ’èƒƒjƒ…[
echo. 
echo O========================O                  O======O O====================O
echo I      ƒJƒeƒSƒŠ[        I                  I İ’è I I İ’è5/...          I
echo O========================O==================O======O=O====================O
echo I                        I %clr%1 ‹N“®ƒAƒjƒ[ƒVƒ‡ƒ“%clr2%                I   %setting5onoff%   I
echo I  ƒJ[ƒ\ƒ‹‘Ö‚¦  ‹@”\Œn  I                                     O==========O
echo I                        I %sc2s5s1lock%2 ƒŠƒiƒbƒNƒX•—‹N“®ƒAƒjƒ[ƒVƒ‡ƒ“%sc2s5s1lock2%    I   %setting5_s1onoff%   I
echo I========================I                                     O==========O
echo I  ƒJƒeƒSƒŠ[  ã‚©‰º‚©  I %sc2s5s2lock%3 ƒVƒ“ƒvƒ‹‚È‹N“®ƒAƒjƒ[ƒVƒ‡ƒ“%sc2s5s2lock2%      I   %setting5_s2onoff%   I
echo I========================I                                     O==========O
Echo I%clr%                        %clr2%I %sc2s5s3lock%4 ¶‚Ì‹N“®ƒAƒjƒ[ƒVƒ‡ƒ“%sc2s5s3lock2%            I   %setting5_s3onoff%   I
echo I%clr% ƒJ[ƒ\ƒ‹‘Ö‚¦  Œ©‚½–ÚŒn %clr2%I                                     O==========O
echo I%clr%                        %clr2%I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ƒwƒ‹ƒvƒ‚[ƒh      %clrhelp2%I  I ˆÚ“® : W A S D ”š I –ß‚é : B I Œˆ’è : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 123wsabye4 /n /m "•ÏX‚·‚é‚à‚Ì‚ğ”š‚Åw’è–”‚Íwasd‚ÅˆÚ“®‚µ‚Äw’è‚µ‚Ä‚­‚¾‚³‚¢"
if %ErrorLevel%==1 goto :settingcategory2intsetting5_stg0
if %ErrorLevel%==2 goto :settingcategory2intsetting5_stg1
if %ErrorLevel%==3 goto :settingcategory2intsetting5_stg2
if %ErrorLevel%==4 goto :settingcategory2intsetting5_stg0
if %ErrorLevel%==5 goto :settingcategory2intsetting5_stg1
if %ErrorLevel%==6 goto :settingcategory2intsetting1
if %ErrorLevel%==7 goto :settingcategory2intsetting1
if %ErrorLevel%==8 goto :setting5
if %ErrorLevel%==9 goto :setting5
if %ErrorLevel%==10 goto :settingcategory2intsetting5_stg3


:settingcategory2intsetting5_stg1
if "%setting5onoff%"=="–³Œø" if "%linuxboot%"=="false" if "%setting5_stg_whereyou%"=="stg1" (goto :settingcategory2intsetting5_stg0)
if "%setting5onoff%"=="–³Œø" if "%setting5_stg_whereyou%"=="stg2" (goto :settingcategory2intsetting5_stg0) else if "%linuxboot%"=="false" if "%setting5onoff%"=="–³Œø" if "%setting5_stg_whereyou%"=="stg0" (goto :settingcategory2intsetting5_stg2)
if "%simpleboot%"=="true" if "%setting5_stg_whereyou%"=="stg0" (goto :settingcategory2intsetting5_stg2) else if "%setting5_stg_whereyou%"=="stg2" (goto :settingcategory2intsetting5_stg0)
if "%rawboot%"=="true" if "%setting5_stg_whereyou%"=="stg3" (goto :settingcategory2intsetting5_stg3) else if "%setting5_stg_whereyou%"=="stg0" (goto :settingcategory2intsetting5_stg3)
set setting5_stg_whereyou=stg1
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| İ’è  
call :settingcategory2intsetting5blockcheck
set selected=
Cls
echo.
Echo                                 İ’èƒƒjƒ…[
echo. 
echo O========================O                  O======O O====================O
echo I      ƒJƒeƒSƒŠ[        I                  I İ’è I I İ’è5/...          I
echo O========================O==================O======O=O====================O
echo I                        I 1 ‹N“®ƒAƒjƒ[ƒVƒ‡ƒ“                I   %setting5onoff%   I
echo I  ƒJ[ƒ\ƒ‹‘Ö‚¦  ‹@”\Œn  I                                     O==========O
echo I                        I %clr%2 ƒŠƒiƒbƒNƒX•—‹N“®ƒAƒjƒ[ƒVƒ‡ƒ“%clr2%    I   %setting5_s1onoff%   I
echo I========================I                                     O==========O
echo I  ƒJƒeƒSƒŠ[  ã‚©‰º‚©  I %sc2s5s2lock%3 ƒVƒ“ƒvƒ‹‚È‹N“®ƒAƒjƒ[ƒVƒ‡ƒ“%sc2s5s2lock2%      I   %setting5_s2onoff%   I
echo I========================I                                     O==========O
Echo I%clr%                        %clr2%I %sc2s5s3lock%4 ¶‚Ì‹N“®ƒAƒjƒ[ƒVƒ‡ƒ“%sc2s5s3lock2%            I   %setting5_s3onoff%   I
echo I%clr% ƒJ[ƒ\ƒ‹‘Ö‚¦  Œ©‚½–ÚŒn %clr2%I                                     O==========O
echo I%clr%                        %clr2%I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ƒwƒ‹ƒvƒ‚[ƒh      %clrhelp2%I  I ˆÚ“® : W A S D ”š I –ß‚é : B I Œˆ’è : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 123wsabye4 /n /m "•ÏX‚·‚é‚à‚Ì‚ğ”š‚Åw’è–”‚Íwasd‚ÅˆÚ“®‚µ‚Äw’è‚µ‚Ä‚­‚¾‚³‚¢"
if %ErrorLevel%==1 goto :settingcategory2intsetting5_stg0
if %ErrorLevel%==2 goto :settingcategory2intsetting5_stg1
if %ErrorLevel%==3 goto :settingcategory2intsetting5_stg2
if %ErrorLevel%==4 goto :settingcategory2intsetting5_stg0
if %ErrorLevel%==5 goto :settingcategory2intsetting5_stg2
if %ErrorLevel%==6 goto :settingcategory2intsetting1
if %ErrorLevel%==7 goto :settingcategory2intsetting1
if %ErrorLevel%==8 goto :setting5_1
if %ErrorLevel%==9 goto :setting5_1
if %ErrorLevel%==10 goto :settingcategory2intsetting5_stg3


:settingcategory2intsetting5_stg2
if "%linuxboot%"=="true" if "%setting5_stg_whereyou%"=="stg1" (goto :settingcategory2intsetting5_stg1) else if "%setting5_stg_whereyou%"=="stg0" (goto :settingcategory2intsetting5_stg0)
if "%rawboot%"=="true" if "%setting5_stg_whereyou%"=="stg3" (goto :settingcategory2intsetting5_stg0) else if "%setting5_stg_whereyou%"=="stg0" (goto :settingcategory2intsetting5_stg3)
set setting5_stg_whereyou=stg2
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| İ’è 
call :settingcategory2intsetting5blockcheck
set selected=
Cls
echo.
Echo                                 İ’èƒƒjƒ…[
echo. 
echo O========================O                  O======O O====================O
echo I      ƒJƒeƒSƒŠ[        I                  I İ’è I I İ’è5/...          I
echo O========================O==================O======O=O====================O
echo I                        I 1 ‹N“®ƒAƒjƒ[ƒVƒ‡ƒ“                I   %setting5onoff%   I
echo I  ƒJ[ƒ\ƒ‹‘Ö‚¦  ‹@”\Œn  I                                     O==========O
echo I                        I %sc2s5s1lock%2 ƒŠƒiƒbƒNƒX•—‹N“®ƒAƒjƒ[ƒVƒ‡ƒ“%sc2s5s1lock2%    I   %setting5_s1onoff%   I
echo I========================I                                     O==========O
echo I  ƒJƒeƒSƒŠ[  ã‚©‰º‚©  I %clr%3 ƒVƒ“ƒvƒ‹‚È‹N“®ƒAƒjƒ[ƒVƒ‡ƒ“%clr2%      I   %setting5_s2onoff%   I
echo I========================I                                     O==========O
Echo I%clr%                        %clr2%I %sc2s5s3lock%4 ¶‚Ì‹N“®ƒAƒjƒ[ƒVƒ‡ƒ“%sc2s5s3lock2%            I   %setting5_s3onoff%   I
echo I%clr% ƒJ[ƒ\ƒ‹‘Ö‚¦  Œ©‚½–ÚŒn %clr2%I                                     O==========O
echo I%clr%                        %clr2%I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ƒwƒ‹ƒvƒ‚[ƒh      %clrhelp2%I  I ˆÚ“® : W A S D ”š I –ß‚é : B I Œˆ’è : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 123wsabye4 /n /m "•ÏX‚·‚é‚à‚Ì‚ğ”š‚Åw’è–”‚Íwasd‚ÅˆÚ“®‚µ‚Äw’è‚µ‚Ä‚­‚¾‚³‚¢"
if %ErrorLevel%==1 goto :settingcategory2intsetting5_stg0
if %ErrorLevel%==2 goto :settingcategory2intsetting5_stg1
if %ErrorLevel%==3 goto :settingcategory2intsetting5_stg2
if %ErrorLevel%==4 goto :settingcategory2intsetting5_stg1
if %ErrorLevel%==5 goto :settingcategory2intsetting5_stg3
if %ErrorLevel%==6 goto :settingcategory2intsetting1
if %ErrorLevel%==7 goto :settingcategory2intsetting1
if %ErrorLevel%==8 goto :setting5_2
if %ErrorLevel%==9 goto :setting5_2
if %ErrorLevel%==10 goto :settingcategory2intsetting5_stg3

:settingcategory2intsetting5_stg3
if "%setting5onoff%"=="–³Œø" if "%setting5_stg_whereyou%"=="stg0" (goto :settingcategory2intsetting5_stg0) else if "%setting5_stg_whereyou%"=="stg2" (goto :settingcategory2intsetting5_stg2)
if "%linuxboot%"=="true" if "%setting5_stg_whereyou%"=="stg1" (goto :settingcategory2intsetting5_stg1)  else if "%setting5_stg_whereyou%"=="stg0" (goto :settingcategory2intsetting5_stg0)
if "%simpleboot%"=="true" if "%setting5_stg_whereyou%"=="stg2" (goto :settingcategory2intsetting5_stg2) else if "%setting5_stg_whereyou%"=="stg0" (goto :settingcategory2intsetting5_stg0)
set setting5_stg_whereyou=stg3
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| İ’è 
call :settingcategory2intsetting5blockcheck
set selected=
Cls
echo.
Echo                                 İ’èƒƒjƒ…[
echo. 
echo O========================O                  O======O O====================O
echo I      ƒJƒeƒSƒŠ[        I                  I İ’è I I İ’è5/...          I
echo O========================O==================O======O=O====================O
echo I                        I 1 ‹N“®ƒAƒjƒ[ƒVƒ‡ƒ“                I   %setting5onoff%   I
echo I  ƒJ[ƒ\ƒ‹‘Ö‚¦  ‹@”\Œn  I                                     O==========O
echo I                        I %sc2s5s1lock%2 ƒŠƒiƒbƒNƒX•—‹N“®ƒAƒjƒ[ƒVƒ‡ƒ“%sc2s5s1lock2%    I   %setting5_s1onoff%   I
echo I========================I                                     O==========O
echo I  ƒJƒeƒSƒŠ[  ã‚©‰º‚©  I %sc2s5s2lock%3 ƒVƒ“ƒvƒ‹‚È‹N“®ƒAƒjƒ[ƒVƒ‡ƒ“%sc2s5s2lock2%      I   %setting5_s2onoff%   I
echo I========================I                                     O==========O
Echo I%clr%                        %clr2%I %clr%4 ¶‚Ì‹N“®ƒAƒjƒ[ƒVƒ‡ƒ“%clr2%            I   %setting5_s3onoff%   I
echo I%clr% ƒJ[ƒ\ƒ‹‘Ö‚¦  Œ©‚½–ÚŒn %clr2%I                                     O==========O
echo I%clr%                        %clr2%I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ƒwƒ‹ƒvƒ‚[ƒh      %clrhelp2%I  I ˆÚ“® : W A S D ”š I –ß‚é : B I Œˆ’è : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 123wsabye4 /n /m "•ÏX‚·‚é‚à‚Ì‚ğ”š‚Åw’è–”‚Íwasd‚ÅˆÚ“®‚µ‚Äw’è‚µ‚Ä‚­‚¾‚³‚¢"
if %ErrorLevel%==1 goto :settingcategory2intsetting5_stg0
if %ErrorLevel%==2 goto :settingcategory2intsetting5_stg1
if %ErrorLevel%==3 goto :settingcategory2intsetting5_stg2
if %ErrorLevel%==4 goto :settingcategory2intsetting5_stg2
if %ErrorLevel%==5 goto :settingcategory2intsetting5_stg3
if %ErrorLevel%==6 goto :settingcategory2intsetting1
if %ErrorLevel%==7 goto :settingcategory2intsetting1
if %ErrorLevel%==8 goto :setting5_3
if %ErrorLevel%==9 goto :setting5_3
if %ErrorLevel%==10 goto :settingcategory2intsetting5_stg3

:settingcategory2intsetting5blockcheck
set sc2s5s1lock=&set sc2s5s1lock2=&set sc2s5s2lock=&set sc2s5s2lock2=&set sc2s5s3lock=&set sc2s5s3lock2=&
if "%linuxboot%"=="true" (
    if "%wmodetoggle%"=="true" (
    set sc2s5s2lock=[0m[107m&set sc2s5s2lock2=[0m[107m[30m
    set sc2s5s3lock=[0m[107m&set sc2s5s3lock2=[0m[107m[30m
    ) else (
    set sc2s5s2lock=[0m[90m&set sc2s5s2lock2=[0m
    set sc2s5s3lock=[0m[90m&set sc2s5s3lock2=[0m
    )
    if "%setting5onoff%"=="–³Œø" (
    if "%wmodetoggle%"=="true" (
    set sc2s5s2lock=[0m[107m&set sc2s5s2lock2=[0m[107m[30m
    set sc2s5s3lock=[0m[107m&set sc2s5s3lock2=[0m[107m[30m
    ) else (
    set sc2s5s2lock=[0m[90m&set sc2s5s2lock2=[0m
    set sc2s5s3lock=[0m[90m&set sc2s5s3lock2=[0m
    )
    exit /b
  )
)
if "%simpleboot%"=="true" (
    if "%wmodetoggle%"=="true" (
    set sc2s5s1lock=[0m[107m&set sc2s5s1lock2=[0m[107m[30m
    set sc2s5s3lock=[0m[107m&set sc2s5s3lock2=[0m[107m[30m
    ) else (
    set sc2s5s1lock=[0m[90m&set sc2s5s1lock2=[0m
    set sc2s5s3lock=[0m[90m&set sc2s5s3lock2=[0m
    )
) 
if "%rawboot%"=="true" (
    if "%wmodetoggle%"=="true" (
    set sc2s5s1lock=[0m[107m&set sc2s5s1lock2=[0m[107m[30m
    set sc2s5s2lock=[0m[107m&set sc2s5s2lock2=[0m[107m[30m
    ) else (
    set sc2s5s1lock=[0m[90m&set sc2s5s1lock2=[0m
    set sc2s5s2lock=[0m[90m&set sc2s5s2lock2=[0m
    )
)
if "%setting5onoff%"=="–³Œø" (
    if "%wmodetoggle%"=="true" (
    set sc2s5s1lock=[0m[107m&set sc2s5s1lock2=[0m[107m[30m
    set sc2s5s3lock=[0m[107m&set sc2s5s3lock2=[0m[107m[30m
    ) else (
    set sc2s5s1lock=[0m[90m&set sc2s5s1lock2=[0m
    set sc2s5s3lock=[0m[90m&set sc2s5s3lock2=[0m
    )
)
exit /b



:settingcategoryhelpmode
rem ƒƒ‚ ‚±‚±‚Ì•ªŠò‚Ìtrue‚Ì‚Æ‚±‚ë‚ÉAclr‚ÌF‚ğ•Ï‚¦‚éˆ—‚ğ’Ç‰Á‚µ‚½‚¢Bchoice‚Ì’¼Œã‚É•ªŠò‚Å‚à‚Æ‚É–ß‚·ˆ—‚à’Ç‰Á‚µ‚Ä
if "%settinghelptoggle%"=="true" (set settinghelp=—LŒø)
if "%settinghelptoggle%"=="false" (set settinghelp=–³Œø)
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| İ’è 
set selected=
if not defined "%clrgra%" (set clrgra=[90m)
if "%settinghelptoggle%"=="true" (set clr=[46m)
Cls
echo.
Echo                                 İ’èƒƒjƒ…[
echo. 
echo O========================O                  O======O
echo I      ƒJƒeƒSƒŠ[        I                  I İ’è I
echo O========================O==================O======O======================O
echo I                        I                                                I
echo I  ƒJ[ƒ\ƒ‹‘Ö‚¦  ‹@”\Œn  I  ƒwƒ‹ƒvƒ‚[ƒh‚Å‚·B‚±‚Ì‹@”\‚ğ‘I‘ğ‚µ‚½ŒãA      I
echo I                        I  ŠT—v‚ğŒ©‚½‚¢İ’è‚ğ‘I‘ğ‚·‚é‚ÆA                I
echo I========================I  ‚»‚Ìİ’è‚ÌŠT—v‚ğŒ©‚é‚±‚Æ‚ª‚Å‚«‚Ü‚·B          I
echo I  ƒJƒeƒSƒŠ[  ã‚©‰º‚©  I                                                I
echo I========================I  ƒwƒ‹ƒvƒ‚[ƒh‚ğ–³Œø‚É‚µ‚½‚¢ê‡‚ÍA            I
Echo I                        I  Ä“x‚±‚Ì‹@”\‚ğ‘I‘ğ‚µ‚Ä‚­‚¾‚³‚¢B              I
echo I ƒJ[ƒ\ƒ‹‘Ö‚¦  Œ©‚½–ÚŒn I                                                I
echo I                        I  %clrgra%ƒwƒ‹ƒvƒ‚[ƒh‚Í%settinghelp%‚Å‚·%clr2%                        I
echo O========================O==O=====================O==========O============O
echo I%clr%      ƒwƒ‹ƒvƒ‚[ƒh      %clr2%I  I ˆÚ“® : W A S D ”š I –ß‚é : B I Œˆ’è : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12wsbye3 /n /m "•ÏX‚·‚é‚à‚Ì‚ğ”š‚Åw’è–”‚Íwasd‚ÅˆÚ“®‚µ‚Äw’è‚µ‚Ä‚­‚¾‚³‚¢"
set clrgra=
if "%wmodetoggle%"=="false" (set clr=[7m&set clr2=[0m)
if "%wmodetoggle%"=="true" (set clr=[100m[97m&set clr2=[0m[107m[30m)
if %ErrorLevel%==1 goto :settingcategory1
if %ErrorLevel%==2 goto :settingcategory2
if %ErrorLevel%==3 goto :settingcategory2
if %ErrorLevel%==4 goto :settingcategoryhelpmode
if %ErrorLevel%==5 goto :hazime
if %ErrorLevel%==6 goto :settingcategoryhelpmodetoggle
if %ErrorLevel%==7 goto :settingcategoryhelpmodetoggle
if %ErrorLevel%==8 goto :settingcategoryhelpmode

:settingcategoryhelpmodetoggle
if "%settinghelptoggle%"=="true" (set settinghelptoggle=false&set clrhelp=&set clrhelp2=&goto :settingcategoryhelpmode)
if "%settinghelptoggle%"=="false" (set settinghelptoggle=true&goto :settingcategoryhelpmodetoggleiftrue)


:settingcategoryhelpmodetoggleiftrue
if "%wmodetoggle%"=="false" (set clr=[46m&set clrhelp=[7m&set clrhelp2=[0m)
if "%wmodetoggle%"=="true" (set clr=[46m&set clrhelp=[100m[97m&set clrhelp2=[0m[107m[30m)
goto :settingcategoryhelpmode





rem İ’è‚Ì“K—p‚ÆŠm”F
rem İ’è‚ª‘¶İ‚·‚é‚©‚ÌŒŸØ
:setting1
if "%settinghelptoggle%"=="true" (goto :setting1help)
find "BootAsCC=false" %Settingsfile% > nul
if %ErrorLevel%==0 set setting1setonoff=—LŒø&goto :setting1okey
if %ErrorLevel%==1 set setting1setonoff=C•œ‚µA³í‚Èó‘Ô& goto :setting1onoff

:setting1onoff
find "BootAsCC=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting1setonoff=–³Œø

:setting1okey
cls
set selected=
echo ‹N“®‚ÉƒJ[ƒ\ƒ‹‘Ö‚¦‚Å‹N“®‚·‚é‚Ì‚ğ%setting1setonoff%‚É‚µ‚Ü‚·‚©H(Y=‚Í‚¢ N=‚¢‚¢‚¦ B=–ß‚é)
SET /P selected= :
echo %selected% ‚ª‘I‘ğ‚³‚ê‚Ü‚µ‚½B
if "%selected%"=="y" (goto :setting1y)
if "%selected%"=="n" (goto :setting1n)
if "%selected%"=="back" (goto :settingcategory1intsetting1)
if "%selected%"=="b" (goto :settingcategory1intsetting1)
goto :setting1okey

:setting1y
find "BootAsCC=false" %Settingsfile% > nul
echo İ’è‚ğ“K—p’†...
if %ErrorLevel%==1 goto :setting1ygo3test
if %ErrorLevel%==0 goto :setting1ygo1

:setting1ygo3test
find "BootAsCC=true" %Settingsfile% > nul
if %ErrorLevel%==1 echo BootAsCC=false >> %Settingsfile%
if %ErrorLevel%==0 goto :setting1ygo2

:setting1ygo2
powershell "(gc %Settingsfile%) -replace 'BootAsCC=true','BootAsCC=false' | sc %Settingsfile%"
goto :setting1yokey

:setting1ygo1
powershell "(gc %Settingsfile%) -replace 'BootAsCC=false','BootAsCC=true' | sc %Settingsfile%"
goto :setting1yokey

:setting1yokey
cls
Echo ³í‚É•ÏX‚³‚ê‚Ü‚µ‚½B
Pause
set wantload=setting1
call :SAB_Manager
goto :settingcategory1intsetting1

:setting1n
cls
Echo İ’è‚ğ•ÏX‚µ‚Ü‚¹‚ñ‚Å‚µ‚½
Pause
goto :settingcategory1intsetting1

:setting2
if "%settinghelptoggle%"=="true" (goto :setting2help)
find "admin=false" %Settingsfile% > nul
if %ErrorLevel%==0 set setting2setonoff=—LŒø&goto :setting2okey
if %ErrorLevel%==1 set setting2setonoff=C•œ‚µA³í‚Èó‘Ô&goto :setting2onoff

:setting2onoff
find "admin=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting2setonoff=–³Œø

:setting2okey
cls
echo ‹N“®‚ÌŠÇ—ÒŒ ŒÀ‚Ì—v‹‚ğ%setting2setonoff%‚É‚µ‚Ü‚·‚©H(Y=‚Í‚¢ N=‚¢‚¢‚¦ B=–ß‚é)
SET /P selected= :
echo %selected% ‚ª‘I‘ğ‚³‚ê‚Ü‚µ‚½B
if "%selected%"=="y" (goto :setting2y)
if "%selected%"=="n" (goto :setting2n)
if "%selected%"=="back" (goto :settingcategory1intsetting2)
if "%selected%"=="b" (goto :settingcategory1intsetting2)
goto :setting2okey

:setting2y
find "admin=false" %Settingsfile% > nul
echo İ’è‚ğ“K—p’†...
if %ErrorLevel%==1 goto :setting2ygo3test
if %ErrorLevel%==0 goto :setting2ygo1

:setting2ygo3test
find "admin=true" %Settingsfile% > nul
if %ErrorLevel%==1 echo admin=true >> %Settingsfile%
if %ErrorLevel%==0 goto :setting2ygo2

:setting2ygo2
powershell "(gc %Settingsfile%) -replace 'admin=true','admin=false' | sc %Settingsfile%"
goto :setting2yokey

:setting2ygo1
powershell "(gc %Settingsfile%) -replace 'admin=false','admin=true' | sc %Settingsfile%"
goto :setting2yokey

:setting2yokey
cls
Echo ³í‚É•ÏX‚³‚ê‚Ü‚µ‚½B
Pause
set wantload=setting2
call :SAB_Manager
goto :settingcategory1intsetting2

:setting2n
cls
Echo ‹N“®‚ÌŠÇ—ÒŒ ŒÀ‚Ì—v‹‚Í%setting2onoff%‚É‚È‚è‚Ü‚¹‚ñ‚Å‚µ‚½
Pause
goto :settingcategory1intsetting2

:setting3
if "%settinghelptoggle%"=="true" (goto :setting3help)
find "CheckUpdate=false" %Settingsfile% > nul
if %ErrorLevel%==0 set setting3setonoff=—LŒø&goto :setting3onoff
if %ErrorLevel%==1 set setting3setonoff=C•œ‚µA³í‚Èó‘Ô&goto :setting3onoff

:setting3onoff
find "CheckUpdate=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting3setonoff=–³Œø&set setting3warning=
:setting3okey
cls
echo ‹N“®‚ÉXV‚ğŠm”F‚·‚é‹@”\‚ğ%setting3setonoff%‚É‚µ‚Ü‚·‚©H(Y=‚Í‚¢ N=‚¢‚¢‚¦ B=–ß‚é)
SET /P selected= :
echo %selected% ‚ª‘I‘ğ‚³‚ê‚Ü‚µ‚½B
if "%selected%"=="y" (goto :setting3y)
if "%selected%"=="n" (goto :setting3n)
if "%selected%"=="back" (goto :settingcategory1intsetting3)
if "%selected%"=="b" (goto :settingcategory1intsetting3)
goto :setting3okey

:setting3y
find "CheckUpdate=false" %Settingsfile% > nul
echo İ’è‚ğ“K—p’†...
if %ErrorLevel%==1 goto :setting3ygo3test
if %ErrorLevel%==0 goto :setting3ygo1

:setting3ygo3test
find "CheckUpdate=true" %Settingsfile% > nul
if %ErrorLevel%==1 echo CheckUpdate=false >> %Settingsfile%
if %ErrorLevel%==0 goto :setting3ygo2

:setting3ygo2
powershell "(gc %Settingsfile%) -replace 'CheckUpdate=true','CheckUpdate=false' | sc %Settingsfile%"
goto :setting3yokey

:setting3ygo1
powershell "(gc %Settingsfile%) -replace 'CheckUpdate=false','CheckUpdate=true' | sc %Settingsfile%"
goto :setting3yokey

:setting3n
cls
Echo ‚‘¬‹N“®‚Í—LŒø‚É‚È‚è‚Ü‚¹‚ñ‚Å‚µ‚½
Pause
goto :settingcategory1intsetting3

:setting3yokey
cls
Echo ‚‘¬‹N“®‚ğ%setting3setonoff%‚É‚µ‚Ü‚µ‚½B
Pause
set wantload=setting3
call :SAB_Manager
goto :settingcategory1intsetting3

:setting4
if "%settinghelptoggle%"=="true" (goto :setting4help)
find "hatenakeikoku=false" %Settingsfile% > nul
if %ErrorLevel%==0 set setting4setonoff=—LŒø&goto :setting4okey
if %ErrorLevel%==1 set setting4setonoff=C•œ‚µA³í‚Èó‘Ô&goto :setting4onoff

:setting4onoff
find "hatenakeikoku=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting4setonoff=–³Œø

:setting4okey
cls
echo ƒGƒ“ƒ^[ƒL[‚Ì’·‰Ÿ‚µŒŸ’m‹@”\‚ğ%setting4setonoff%‚É‚µ‚Ü‚·‚©H(Y=‚Í‚¢ N=‚¢‚¢‚¦ B=–ß‚é)
SET /P selected= :
echo %selected% ‚ª‘I‘ğ‚³‚ê‚Ü‚µ‚½B
if "%selected%"=="y" (goto :setting4y)
if "%selected%"=="n" (goto :setting4n)
if "%selected%"=="back" (goto :settingcategory1intsetting4)
if "%selected%"=="b" (goto :settingcategory1intsetting4)
goto :setting4okey

:setting4y
find "hatenakeikoku=false" %Settingsfile% > nul
echo İ’è‚ğ“K—p’†...
if %ErrorLevel%==1 goto :setting4ygo3test
if %ErrorLevel%==0 goto :setting4ygo1

:setting4ygo3test
find "hatenakeikoku=true" %Settingsfile% > nul
if %ErrorLevel%==1 echo hatenakeikoku=true >> %Settingsfile%
if %ErrorLevel%==0 goto :setting4ygo2

:setting4ygo2
powershell "(gc %Settingsfile%) -replace 'hatenakeikoku=true','hatenakeikoku=false' | sc %Settingsfile%"
goto :setting4yokey

:setting4ygo1
powershell "(gc %Settingsfile%) -replace 'hatenakeikoku=false','hatenakeikoku=true' | sc %Settingsfile%"
goto :setting4yokey

:setting4yokey
cls
Echo ³í‚É“K—p‚³‚ê‚Ü‚µ‚½B
Pause
set wantload=setting4
call :SAB_Manager
goto :settingcategory1intsetting4

:setting4n
cls
Echo İ’è‚ğ•ÏX‚µ‚Ü‚¹‚ñ‚Å‚µ‚½
Pause
goto :settingcategory1intsetting4

:setting5
if "%settinghelptoggle%"=="true" (goto :setting5help)
find "bootanimation=false" %Settingsfile% > nul
if %ErrorLevel%==0 set setting5setonoff=—LŒø&goto :setting5okey
if %ErrorLevel%==1 set setting5setonoff=C•œ‚µA³í‚Èó‘Ô&goto :setting5onoff

:setting5onoff
find "bootanimation=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting5setonoff=–³Œø

:setting5okey
cls
echo ‹N“®‚Ìƒu[ƒgƒAƒjƒ[ƒVƒ‡ƒ“‚ğ%setting5setonoff%‚É‚µ‚Ü‚·‚©H(Y=‚Í‚¢ N=‚¢‚¢‚¦ B=–ß‚é)
SET /P selected= :
echo %selected% ‚ª‘I‘ğ‚³‚ê‚Ü‚µ‚½B
if "%selected%"=="y" (goto :setting5y)
if "%selected%"=="n" (goto :setting5n)
if "%selected%"=="back" (goto :settingcategory2intsetting5_stg0)
if "%selected%"=="b" (goto :settingcategory2intsetting5_stg0)
goto :setting5okey

:setting5y
find "bootanimation=false" %Settingsfile% > nul
echo İ’è‚ğ“K—p’†...
if %ErrorLevel%==1 goto :setting5ygo3test
if %ErrorLevel%==0 goto :setting5ygo1

:setting5ygo3test
find "bootanimation=true" %Settingsfile% > nul
if %ErrorLevel%==1 echo bootanimation=true >> %Settingsfile%
if %ErrorLevel%==0 goto :setting5ygo2

:setting5ygo2
powershell "(gc %Settingsfile%) -replace 'bootanimation=true','bootanimation=false' | sc %Settingsfile%"
goto :setting5yokey

:setting5ygo1
powershell "(gc %Settingsfile%) -replace 'bootanimation=false','bootanimation=true' | sc %Settingsfile%"
goto :setting5yokey

:setting5yokey
cls
Echo İ’è‚ğ•ÏX‚µ‚Ü‚µ‚½B
Pause
set wantload=setting5
call :SAB_Manager
goto :settingcategory2intsetting5_stg0


:setting5n
cls
Echo İ’è‚ğ•ÏX‚µ‚Ü‚¹‚ñ‚Å‚µ‚½
Pause
goto :settingcategory2intsetting5_stg0


:setting5_1
if "%settinghelptoggle%"=="true" (goto :setting5_1help)
find "s5_linuxboot=false" %Settingsfile% > nul
if %ErrorLevel%==0 set setting5_1setonoff=—LŒø&goto :setting5_1okey
if %ErrorLevel%==1 set setting5_1setonoff=C•œ‚µA³í‚Èó‘Ô&goto :setting5_1onoff

:setting5_1onoff
find "s5_linuxboot=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting5_1setonoff=–³Œø

:setting5_1okey
cls
echo ‹N“®‚Ìlinux•—‚Ì‹N“®ƒAƒjƒ[ƒVƒ‡ƒ“‚ğ%setting5_1setonoff%‚É‚µ‚Ü‚·‚©H(Y=‚Í‚¢ N=‚¢‚¢‚¦ B=–ß‚é)
SET /P selected= :
echo %selected% ‚ª‘I‘ğ‚³‚ê‚Ü‚µ‚½B
if "%selected%"=="y" (goto :setting5_1y)
if "%selected%"=="n" (goto :setting5_1n)
if "%selected%"=="back" (goto :settingcategory2intsetting5_stg0)
if "%selected%"=="b" (goto :settingcategory2intsetting5_stg0)
goto :setting5_1okey

:setting5_1y
find "s5_linuxboot=false" %Settingsfile% > nul
echo İ’è‚ğ“K—p’†...

if %ErrorLevel%==1 goto :setting5_1ygo3test
if %ErrorLevel%==0 goto :setting5_1ygo1

:setting5_1ygo3test
find "s5_linuxboot=true" %Settingsfile% > nul
if %ErrorLevel%==1 echo s5_linuxboot=false >> %Settingsfile%
if %ErrorLevel%==0 goto :setting5_1ygo2

:setting5_1ygo2
powershell "(gc %Settingsfile%) -replace 's5_linuxboot=true','s5_linuxboot=false' | sc %Settingsfile%"
set linuxboot=false
goto :setting5_1yokey

:setting5_1ygo1
powershell "(gc %Settingsfile%) -replace 's5_linuxboot=false','s5_linuxboot=true' | sc %Settingsfile%"
set linuxboot=true
goto :setting5_1yokey

:setting5_1yokey
if "%linuxboot%"=="true" (
if "%wmodetoggle%"=="true" (set linuxishclr2=[107m[30m) else (set linuxishclr2=[0m)
set linuxishclred=[91m& set linuxishclr=[92m
) else (set linuxishclred=& set linuxishclr=& set linuxishclr2=)
cls
Echo İ’è‚ğ•ÏX‚µ‚Ü‚µ‚½B
Pause
set wantload=setting5_1
call :SAB_Manager
goto :settingcategory2intsetting5_stg1

:setting5_1n
cls
Echo İ’è‚ğ•ÏX‚µ‚Ü‚¹‚ñ‚Å‚µ‚½
Pause
goto :settingcategory2intsetting5_stg1


:setting5_2
if "%settinghelptoggle%"=="true" (goto :setting5_2help)
find "s5_simpleboot=false" %Settingsfile% > nul
if %ErrorLevel%==0 set setting5_2setonoff=—LŒø&goto :setting5_2okey
if %ErrorLevel%==1 set setting5_2setonoff=C•œ‚µA³í‚Èó‘Ô&goto :setting5_2onoff

:setting5_2onoff
find "s5_simpleboot=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting5_2setonoff=–³Œø

:setting5_2okey
cls
echo ‹N“®‚ÌƒVƒ“ƒvƒ‹‚Èƒu[ƒgƒAƒjƒ[ƒVƒ‡ƒ“‚ğ%setting5_2setonoff%‚É‚µ‚Ü‚·‚©H(Y=‚Í‚¢ N=‚¢‚¢‚¦ B=–ß‚é)
SET /P selected= :
echo %selected% ‚ª‘I‘ğ‚³‚ê‚Ü‚µ‚½B
if "%selected%"=="y" (goto :setting5_2y)
if "%selected%"=="n" (goto :setting5_2n)
if "%selected%"=="back" (goto :settingcategory2intsetting5_stg1)
if "%selected%"=="b" (goto :settingcategory2intsetting5_stg1)
goto :setting5_2okey

:setting5_2y
find "s5_simpleboot=false" %Settingsfile% > nul
echo İ’è‚ğ“K—p’†...
if %ErrorLevel%==1 goto :setting5_2ygo3test
if %ErrorLevel%==0 goto :setting5_2ygo1

:setting5_2ygo3test
find "s5_simpleboot=true" %Settingsfile% > nul
if %ErrorLevel%==1 echo s5_simpleboot=false >> %Settingsfile%
if %ErrorLevel%==0 goto :setting5_2ygo2

:setting5_2ygo2
powershell "(gc %Settingsfile%) -replace 's5_simpleboot=true','s5_simpleboot=false' | sc %Settingsfile%"
set simpleboot=false
goto :setting5_2yokey

:setting5_2ygo1
powershell "(gc %Settingsfile%) -replace 's5_simpleboot=false','s5_simpleboot=true' | sc %Settingsfile%"
set simpleboot=true
goto :setting5_2yokey

:setting5_2yokey
cls
Echo İ’è‚ğ•ÏX‚µ‚Ü‚µ‚½B
Pause
set wantload=setting5_2
call :SAB_Manager
goto :settingcategory2intsetting5_stg2

:setting5_2n
cls
Echo İ’è‚ğ•ÏX‚µ‚Ü‚¹‚ñ‚Å‚µ‚½
Pause
goto :settingcategory2intsetting5_stg2



:setting5_3
if "%settinghelptoggle%"=="true" (goto :setting5_3help)
find "s5_rawboot=false" %Settingsfile% > nul
if %ErrorLevel%==0 set setting5_3setonoff=—LŒø&goto :setting5_3okey
if %ErrorLevel%==1 set setting5_3setonoff=C•œ‚µA³í‚Èó‘Ô&goto :setting5_3onoff

:setting5_3onoff
find "s5_rawboot=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting5_3setonoff=–³Œø

:setting5_3okey
cls
echo ‹N“®‚Ì¶ƒAƒjƒ[ƒVƒ‡ƒ“‚ğ%setting5_3setonoff%‚É‚µ‚Ü‚·‚©H(Y=‚Í‚¢ N=‚¢‚¢‚¦ B=–ß‚é)
SET /P selected= :
echo %selected% ‚ª‘I‘ğ‚³‚ê‚Ü‚µ‚½B
if "%selected%"=="y" (goto :setting5_3y)
if "%selected%"=="n" (goto :setting5_3n)
if "%selected%"=="back" (goto :settingcategory2intsetting5_stg3)
if "%selected%"=="b" (goto :settingcategory2intsetting5_stg3)
goto :setting5_3okey

:setting5_3y
find "s5_rawboot=false" %Settingsfile% > nul
echo İ’è‚ğ“K—p’†...

if %ErrorLevel%==1 goto :setting5_3ygo3test
if %ErrorLevel%==0 goto :setting5_3ygo1

:setting5_3ygo3test
find "s5_rawboot=true" %Settingsfile% > nul
if %ErrorLevel%==1 echo s5_rawboot=false >> %Settingsfile%
if %ErrorLevel%==0 goto :setting5_3ygo2

:setting5_3ygo2
powershell "(gc %Settingsfile%) -replace 's5_rawboot=true','s5_rawboot=false' | sc %Settingsfile%"
set rawboot=false
goto :setting5_3yokey

:setting5_3ygo1
powershell "(gc %Settingsfile%) -replace 's5_rawboot=false','s5_rawboot=true' | sc %Settingsfile%"
set rawboot=true
goto :setting5_3yokey

:setting5_3yokey
cls
Echo İ’è‚ğ•ÏX‚µ‚Ü‚µ‚½B
Pause
set wantload=setting5_3
call :SAB_Manager
goto :settingcategory2intsetting5_stg3

:setting5_3n
cls
Echo İ’è‚ğ•ÏX‚µ‚Ü‚¹‚ñ‚Å‚µ‚½
Pause
goto :settingcategory2intsetting5_stg3


:setting6
if "%settinghelptoggle%"=="true" (goto :setting6help)
find "HazimeBg=false" %Settingsfile% > nul
if %ErrorLevel%==0 set setting6setonoff=—LŒø&goto :setting6okey
if %ErrorLevel%==1 set setting6setonoff=C•œ‚µA³í‚Èó‘Ô&goto :setting6onoff

:setting6onoff
find "HazimeBg=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting6setonoff=–³Œø

:setting6okey
cls
echo ƒƒCƒ“ƒƒjƒ…[‚Ì”wŒi‚ğ%setting6setonoff%‚É‚µ‚Ü‚·‚©H(Y=‚Í‚¢ N=‚¢‚¢‚¦ B=–ß‚é)
SET /P selected= :
echo %selected% ‚ª‘I‘ğ‚³‚ê‚Ü‚µ‚½B
if "%selected%"=="y" (goto :setting6y)
if "%selected%"=="n" (goto :setting6n)
if "%selected%"=="back" (goto :settingcategory2intsetting2)
if "%selected%"=="b" (goto :settingcategory2intsetting2)
goto :setting6okey

:setting6y
find "HazimeBg=false" %Settingsfile% > nul
echo İ’è‚ğ“K—p’†...

if %ErrorLevel%==1 goto :setting6ygo3test
if %ErrorLevel%==0 goto :setting6ygo1

:setting6ygo3test
find "HazimeBg=true" %Settingsfile% > nul
if %ErrorLevel%==1 echo HazimeBg=true >> %Settingsfile%& goto :setting6yokey
if %ErrorLevel%==0 goto :setting6ygo2

:setting6ygo2
powershell "(gc %Settingsfile%) -replace 'HazimeBg=true','HazimeBg=false' | sc %Settingsfile%"
goto :setting6yokey

:setting6ygo1
powershell "(gc %Settingsfile%) -replace 'HazimeBg=false','HazimeBg=true' | sc %Settingsfile%"
goto :setting6yokey

:setting6yokey
cls
Echo İ’è‚ğ•ÏX‚µ‚Ü‚µ‚½B
Pause
set wantload=setting6
call :SAB_Manager
goto :settingcategory2intsetting2

:setting6n
cls
Echo İ’è‚ğ•ÏX‚µ‚Ü‚¹‚ñ‚Å‚µ‚½
Pause
goto :settingcategory2intsetting2



:wmode
if "%settinghelptoggle%"=="true" (goto :wmodehelp)
cd /d %batchmainpath%
:wmodetest
find "wmode=false" %Settingsfile% > nul
if %ErrorLevel%==0 set wmodesetonoff=ƒzƒƒCƒg
if %ErrorLevel%==1 set wmodesetonoff=ƒe[ƒ}‚Ìİ’è‚ğC•œ‚µA³í‚È& goto :wmodeonoff

:wmodeonoff
find "wmode=true" %Settingsfile% > nul
if %ErrorLevel%==0 set wmodesetonoff=ƒ_[ƒN

cls
echo ƒJ[ƒ\ƒ‹‘Ö‚¦‚Ìƒe[ƒ}‚ğ%wmodesetonoff%ƒe[ƒ}‚É‚µ‚Ü‚·‚©H(Y=‚Í‚¢ N=‚¢‚¢‚¦ B=–ß‚é)
SET /P selected= :
rem ƒe[ƒ}‚Ì•ªŠò
if "%selected%"=="y" (goto :wmodey)
if "%selected%"=="yes" (goto :wmodey)
if "%selected%"=="egg" (goto :secret)
if "%selected%"=="n" (goto :no01)
if "%selected%"=="no" (goto :no01)
if "%selected%"=="back" (goto :settingcategory2intsetting3)
if "%selected%"=="b" (goto :settingcategory2intsetting3)
if "%selected%"=="def" (goto :defultwok)
if "%selected%"=="defult" (goto :defultwok)
goto :wmode

:wmodey
find "wmode=false" %Settingsfile% > nul
echo ƒe[ƒ}‚ğ“K—p’†...
if %ErrorLevel%==1 goto :wmodeygo3test
if %ErrorLevel%==0 goto :wmodeygo1

:wmodeygo3test
find "wmode=true" %Settingsfile% > nul
if %ErrorLevel%==1 echo wmode=false >> %Settingsfile%&goto :wmodeygo1
if %ErrorLevel%==0 goto :wmodeygo2

:wmodeygo2
powershell "(gc %Settingsfile%) -replace 'wmode=true','wmode=false' | sc %Settingsfile%"
goto :wmodeyokey

:wmodeygo1
powershell "(gc %Settingsfile%) -replace 'wmode=false','wmode=true' | sc %Settingsfile%"
goto :wmodeyokey

:wmodeyokey
find "wmode=false" %Settingsfile% > nul
if %ErrorLevel%==0 color 07
if %ErrorLevel%==1 goto :wmodeonoffkenti
:wmodeonoffkenti
find "wmode=true" %Settingsfile% > nul
if %ErrorLevel%==0 color f0
cls
echo %wmodesetonoff%ƒe[ƒ}‚É•ÏX‚µ‚Ü‚µ‚½B
Pause
set wantload=wmode
call :SAB_Manager
if "%wmodetoggle%"=="false" (set clr=[7m&set clr2=[0m)
if "%wmodetoggle%"=="true" (set clr=[100m[97m&set clr2=[0m[107m[30m)
if "%linuxboot%"=="true" (
    if "%wmodetoggle%"=="false" (set linuxishclr2=[0m)
    if "%wmodetoggle%"=="true" (set linuxishclr2=[107m[30m) else (set linuxishclr2=[0m)
)
goto :settingcategory2intsetting3

:no01
cls
echo %wmodesetonoff%ƒe[ƒ}‚É‚Í•ÏX‚µ‚Ü‚¹‚ñ‚Å‚µ‚½B
pause
goto :settingcategory2intsetting3

rem İ’è‚Ìƒwƒ‹ƒv
:setting1help
cls
echo ‚±‚Ìİ’è‚ÍA‹N“®Œã‚ÉƒJ[ƒ\ƒ‹‘Ö‚¦ (ƒƒCƒ“ƒƒjƒ…[‚Å1‚Ì€–Ú‚É‚ ‚é‹@”\) ‚É‘JˆÚ‚·‚é‚©‚ğØ‚è‘Ö‚¦‚Ü‚·B
echo ‚±‚ê‚ğ—LŒø‚É‚·‚é‚ÆA‹N“®’¼Œã‚ÉƒƒCƒ“ƒƒjƒ…[‚É‘JˆÚ‚·‚é‘ã‚í‚è‚ÉƒJ[ƒ\ƒ‹‘Ö‚¦‚É‘JˆÚ‚·‚é‚Ì‚ÅA‘f‘‚­ƒJ[ƒ\ƒ‹‚ğ•ÏX‚Å‚«‚Ü‚·B
echo ‚±‚Ìİ’è‚ÍƒfƒtƒHƒ‹ƒg‚Å‚Í–³Œø‚Å‚·B
pause
goto :settingcategory1intsetting1

:setting2help
cls
echo ‚±‚Ìİ’è‚ÍAŠÇ—ÒŒ ŒÀ‚ÅƒJ[ƒ\ƒ‹‘Ö‚¦‚ğÀs‚·‚é‚±‚Æ‚É‚æ‚Á‚ÄAƒJ[ƒ\ƒ‹‚ğ•ÏX‚·‚éÛ‚ÉƒGƒ‰[‚ª‹N‚«‚È‚¢‚æ‚¤‚É‚·‚é‚½‚ß‚É‚ ‚è‚Ü‚·B
echo ‚à‚µ‰¼‚ÉAƒJ[ƒ\ƒ‹‚ğ•ÏX‚·‚éÛ‚ÉƒGƒ‰[‚à‚µ‚­‚Í•ÏX‚Å‚«‚È‚©‚Á‚½ê‡‚Ì‚İ‚É‚±‚Ìİ’è‚ğ—LŒø‚É‚·‚é‚±‚Æ‚ğ„§‚µ‚Ü‚·B
echo ‚±‚Ìİ’è‚ğ—LŒø‚É‚·‚é‚±‚Æ‚É‚æ‚Á‚Ä‹N“®ŠÔ‚ª’Zk‚³‚ê‚éê‡‚ª‚ ‚è‚Ü‚·B
echo ‚±‚Ìİ’è‚ÍƒfƒtƒHƒ‹ƒg‚Å‚Í–³Œø‚Å‚·B
pause
goto :settingcategory1intsetting2

:setting3help
cls
echo ‚±‚Ì‹@”\‚ÍƒJ[ƒ\ƒ‹‘Ö‚¦‚Ì‹N“®‚ÉXV‚ğŠm”F‚·‚é‚©”Û‚©‚Ìİ’è‚Å‚·B
echo ‚±‚Ì‹@”\‚ğ—LŒø‚É‚·‚é‚ÆA–ˆ‹N“®‚ÉƒAƒbƒvƒf[ƒg‚ÌŠm”F‚ªs‚í‚ê‚Ü‚·B
echo ƒAƒbƒvƒf[ƒg‚ª—˜—p‰Â”\‚È‚ç“K—p‚·‚é‚±‚Æ‚ª‚Å‚«‚Ü‚·B
echo ‚¨g‚¢‚ÌƒCƒ“ƒ^[ƒlƒbƒg‚âŠÂ‹«‚Ì‘¬“x‚É‚æ‚Á‚Ä‚Í‹N“®ŠÔ‚ª’x‚­‚È‚é‰Â”\«‚ª‚ ‚è‚Ü‚·B
echo ˆêŠÔ‚É‚¾‚¢‚½‚¢50‰ñˆÈã˜A‘±‚µ‚Ä‹N“®‚·‚é‚ÆAgithub‚ÌAPIƒŒ[ƒg§ŒÀ‚É“’B‚·‚é‰Â”\«‚ª‚ ‚è‚Ü‚·B(‘‡“I‚É3~4‰ñ‚Ù‚ÇAPI‚ğ—˜—p‚·‚é‚½‚ßA‚•‰‰×)
echo ‚±‚Ìİ’è‚ÍƒfƒtƒHƒ‹ƒg‚Å‚Í–³Œø‚Å‚·B
pause
goto :settingcategory1intsetting3

:setting4help
cls
echo ‚±‚Ìİ’è‚Í­X‚í‚©‚è‚É‚­‚¢‚Å‚·‚ªAŠÈ’P‚ÉŒ¾‚¤‚Æƒoƒbƒ`‚ğ‹N“®‚µ‚½‚Æ‚«‚É•\¦‚³‚ê‚é‰æ–Ê‚Ì‚Ü‚Ü‚Å‰½‚à“ü—Í‚¹‚¸‚ÉƒGƒ“ƒ^[‚ğ’·‰Ÿ‚µ‚µ‚½‚Æ‚«‚Éo‚Ä‚­‚é
echo ŒxƒƒbƒZ[ƒW‚ğoff/on‚É‚Å‚«‚é‹@”\‚Å‚·B
echo ‚±‚ê‚ÍÀÛ‚É‘ÌŒ±‚µ‚Ä‚à‚ç‚Á‚½‚Ù‚¤‚ª‚í‚©‚è‚â‚·‚¢‚Ì‚Å‚·‚ªA‚Ü‚Ÿ‘å‘Ì50‰ñ~250‰ñ‚­‚ç‚¢‚ÌŠÔƒGƒ“ƒ^[‚ğ’·‰Ÿ‚µ‚©‰Ÿ‚µ‚Ä‚¢‚é‚ÆA
echo Œx•¶‚ª•\¦‚³‚ê‚éŠ´‚¶‚É‚È‚è‚Ü‚·‚ËB‚µ‚©‚µ‚É‚Í‚±‚ê‚ª‚¤‚Á‚Æ‚¨‚µ‚¢‚Æv‚¤l‚à‚¢‚é‚©‚Æv‚¢‚Ü‚·‚Ì‚ÅA‚±‚Ì‹@”\‚ğƒIƒt‚É‚Å‚«‚éİ’è‚ğ’Ç‰Á‚µ‚Ü‚µ‚½B
echo ‚±‚Ìİ’è‚ÍƒfƒtƒHƒ‹ƒg‚Å‚Í—LŒø‚Å‚·B
pause
goto :settingcategory1intsetting4

:setting5help
cls
echo ‚±‚Ìİ’è‚ÍA‹N“®‚É•K‚¸–ˆ‰ñ—¬‚ê‚éƒu[ƒgƒAƒjƒ[ƒVƒ‡ƒ“A‚¢‚í‚Î‹N“®‰æ–Ê‚ğ–³Œø‚É‚µ”ñ•\¦‚É‚·‚éİ’è‚Å‚·B
echo ‚±‚Ìİ’è‚ğ–³Œø‚É‚·‚é‚±‚Æ‚É‚æ‚Á‚ÄA‹N“®ŠÔ‚Ì’Zk‚â‚¤‚Á‚Æ‚¤‚µ‚³‚ÌŒyŒ¸‚É‚Â‚È‚ª‚è‚Ü‚·B
echo ‚±‚Ìİ’è‚ÍƒfƒtƒHƒ‹ƒg‚Å‚Í—LŒø‚Å‚·B
pause
goto :settingcategory2intsetting5_stg0

:setting5_1help
cls
echo ‚±‚Ìİ’è‚ÍƒŠƒiƒbƒNƒX•—‚Ì‹N“®ƒAƒjƒ[ƒVƒ‡ƒ“‚ğÄ¶‚·‚é‚æ‚¤‚É‚·‚éİ’è‚Å‚·B
echo ‹N“®’†‚È‚Ì‚ª‚í‚©‚è‚â‚·‚­AŒ©‚½–Ú‚ª—Ç‚¢‚Å‚·B‚Ü‚½A‹N“®’†‚ÉƒGƒ‰[‚ª”­¶‚µ‚½Û‚ÉAƒGƒ‰[‚ª”­¶‚µ‚½ŒÂŠ‚ª‚í‚©‚è‚â‚·‚­‚È‚é‚±‚Æ‚ª‚ ‚è‚Ü‚·B
echo ‚±‚Ìİ’è‚Ísimpleboot‚¨‚æ‚Ñrawboot‚Æ•¹—p‚Å‚«‚Ü‚¹‚ñB
echo ‚±‚Ìİ’è‚Í•W€‚Å‚Ífalse‚Å‚·B
pause
goto :settingcategory2intsetting5_stg1

:setting5_2help
cls
echo ‚±‚Ìİ’è‚Í‹N“®‚É"‹N“®’†..."‚Æ‚¢‚¤ƒeƒLƒXƒg‚Ì‚İ‚Å‹N“®‚³‚¹‚é‚æ‚¤‚É‚·‚éİ’è‚Å‚·B
echo ‚‘¬‚©‚Â•ª‚©‚è‚â‚·‚­AƒVƒ“ƒvƒ‹‚Å‚·B‚½‚¾‚µ‚Â‚Ü‚ç‚È‚­Œ©‚¦‚é‰Â”\«‚ª‚ ‚èƒ}ƒXB
echo ‚±‚Ìİ’è‚Ílinuxboot‚¨‚æ‚Ñrawboot‚Æ•¹—p‚Å‚«‚Ü‚¹‚ñB
echo ‚±‚Ìİ’è‚Í•W€‚Å‚Ífalse‚Å‚·B
pause
goto :settingcategory2intsetting5_stg2

:setting5_3help
cls
echo ‚±‚Ìİ’è‚Í‹N“®‚Éecho on‚Ìó‘Ô‚Å‹N“®‚·‚é‚æ‚¤‚É‚·‚éİ’è‚Å‚·B
echo ƒVƒ“ƒvƒ‹‚Å‚í‚©‚è‚â‚·‚­AŒ»İ‰½‚ªÀs‚³‚ê‚Ä‚¢‚é‚©‚ªˆê–Ú‚Å‚í‚©‚è‚Ü‚·B‚Ü‚½AƒnƒbƒJ[‹C•ª‚É‚à‚È‚ê‚Ü‚·B
echo ‚±‚Ìİ’è‚Ílinuxboot‚¨‚æ‚Ñsimpleboot‚Æ•¹—p‚Å‚«‚Ü‚¹‚ñB
echo ‚±‚Ìİ’è‚Í•W€‚Å‚Ífalse‚Å‚·B
pause
goto :settingcategory2intsetting5_stg3

:setting6help
cls
echo ‚±‚Ìİ’è‚ÍƒƒCƒ“ƒƒjƒ…[‚Å”wŒi‚ğ—LŒø‚É‚·‚é‚©‚Ç‚¤‚©‚ğ
echo İ’è‚Å‚«‚Ü‚·B‚±‚ê‚ğ—LŒø‚É‚·‚é‚ÆA‚æ‚è—Ç‚¢Œ©‚½–Ú‚É‚È‚è‚Ü‚·B
echo ‚½‚¾‚µAƒRƒ“ƒsƒ…[ƒ^[‚Ì«”\‚É‚æ‚Á‚Ä‚ÍƒƒCƒ“ƒƒjƒ…[‚ÌƒŒƒXƒ|ƒ“ƒX‚ªˆ«‚­‚È‚é‰Â”\«‚ª‚ ‚è‚Ü‚·B
echo ‚±‚Ìİ’è‚ÍƒfƒtƒHƒ‹ƒg‚Åtrue‚Å‚·B
pause
goto :settingcategory2intsetting2

:wmodehelp
cls
echo ‚±‚ê‚ÍCMD‚Ì‰æ–Ê‚ğ”’F‚Ü‚½‚Í•F‚É•Ï‚¦‚é•¨‚Å‚·B
echo ‚±‚ê‚ğg—p‚·‚é‚ÆA—á‚¦‚Î‰æ–Ê‚ÍƒzƒƒCƒgƒe[ƒ}‚Å“ˆê‚³‚¹‚½‚èA‚Ü‚½‚»‚Ì‚Ù‚¤‚ªD‚«‚Æ‚¢‚¤l‚É‚à‘Î‰‚Å‚«‚é‚æ‚¤‚É‚È‚è‚Ü‚·B
echo •W€‚Å‚Í•F‚Å‚·‚ªA”’F‚É‚µ‚½ŒãA¡Œã‹N“®‚µ‚½‚Æ‚«‚É©“®“I‚É‰æ–Ê‚ª”’F‚É‚È‚é‚æ‚¤‚É‚È‚è‚Ü‚·B
echo ‚Ü‚½A‚¿‚å‚Á‚Æ‚µ‚½— ˜b‚Å‚·‚ª‚±‚Ìİ’è‚ÍA1.10ˆÈ‘O‚Ü‚Å‚Íƒz[ƒ€‘¤‚Éİ’u‚³‚ê‚Ä‚¢‚Ü‚µ‚½B‚Ü‚½A‚±‚Ì‹@”\‚Íİ’è‚Ì“à•”\‘¢‚Ì‚à‚Æ‚É‚È‚Á‚Ä‚¢‚Ü‚·B
echo •W€‚Å‚Íƒ_[ƒNƒe[ƒ}‚Å‚·B
pause
goto :settingcategory2intsetting3
 
:alldefhelp
cls
echo ‚±‚ê‚ÍƒAƒ“ƒCƒ“ƒXƒg[ƒ‹ƒƒjƒ…[‚Å‚·B‚±‚Ìƒƒjƒ…[‚ÍƒJ[ƒ\ƒ‹‘Ö‚¦‚ÌƒAƒ“ƒCƒ“ƒXƒg[ƒ‹‚ğs‚¢‚Ü‚·B
echo ‚±‚Ìƒƒjƒ…[‚É‚Íİ’èƒtƒ@ƒCƒ‹iİ’è‚ª‹L˜^‚³‚ê‚Ä‚¢‚éƒeƒLƒXƒgƒtƒ@ƒCƒ‹j‚ÌƒpƒX‚ğ•\¦‚·‚é‹@”\Aİ’è‚ğ‰Šú‰»(ƒfƒtƒHƒ‹ƒg‚É)‚·‚é‹@”\‚ªŠÜ‚Ü‚ê‚Ä‚¢‚Ü‚·B
echo ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹‚ğÀs‚·‚éê‡AƒJ[ƒ\ƒ‹‘Ö‚¦–{‘Ì‚ªíœ‚³‚êAi”CˆÓjƒJ[ƒ\ƒ‹‚àƒfƒtƒHƒ‹ƒg‚Éíœ‚³‚ê‚Ü‚·Bi”CˆÓjİ’èA‰‰ñ‹N“®‚ğŒŸ’m‚·‚é‚½‚ß‚Ìƒtƒ@ƒCƒ‹‚àŠ®‘S‚Éíœ‚³‚ê‚Ü‚·B
echo Às‚·‚éÛ‚Í‚­‚ê‚®‚ê‚à©ŒÈÓ”C‚ÅÀs‚µ‚Ä‚­‚¾‚³‚¢B
pause
goto :settingcategory1intsetting5




:batver
set batvercurrent=0& call :batver_exit
if "%batverdev%"=="dev" (set batverdevshow=Dev)
if "%batverdev%"=="beta" (set batverdevshow=Beta)
if "%batverdev%"=="stable" (set batverdevshow=Stable)
if not defined dummy (set /p nothing=[?25l<nul)
if not defined dummy (set clr=[7m&set clrgra=[90m&set clr2=[0m)
if "%wmodetoggle%"=="false" (set clr=[7m&set clrgra=[90m&set clr2=[0m)
if "%wmodetoggle%"=="true" (set clr=[100m[97m&set clrgra=[0m[107m&set clr2=[90m[107m[30m)

:batver_main
rem Main Bat Version Menu
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ƒo[ƒWƒ‡ƒ“î•ñ
if "%batverexit%"=="true" (set batvercurrent=& call :batver_exit & goto :hazimemenu)
if not defined batverboot (set MenuRedrew=true& set /p nothing=%clrgra%<nul& call :hazimemenudrew & echo %clr2% & set batverboot=true)
rem I'm doing this because when I use ANSI ESC sequences in Virtual Studio Code, the parentheses are colored incorrectly and I don't like that
call :batver_Core_Drew
if not defined dummuy (set ccmmul=[4m)
if not defined dummy (
echo [6;12H O=================================================O 
echo [7;12H I             ƒJ[ƒ\ƒ‹‘Ö‚¦  ƒo[ƒWƒ‡ƒ“            I 
echo [8;12H I                                                 I 
echo [9;12H I          Œ»İ‚Ìƒo[ƒWƒ‡ƒ“ :[9;63HI 
echo [10;12H I          Œ»İ‚Ìƒrƒ‹ƒh     :[10;63HI 
echo [11;12H I                                                 I 
echo [12;12H I    O====================O         O========O    I 
echo [13;12H I    I%bvb% ƒAƒbƒvƒf[ƒg‚ÌŠm”F %clr2%I         I%bvb2% •Â‚¶‚é %clr2%I    I 
echo [14;12H I    O====================O         O========O    I 
echo [15;12H I                                                 I 
echo [16;12H O=================================================O 
echo [17;20H %clrgra%1~2‚©A,D‚Å“®‚©‚µAY,E‚ÅŒˆ’èAB‚ÅI—¹%clr2%
)
choice /c 12adyeb /n >nul
if %ErrorLevel%==1 set batvercurrent=1& goto :batver_main
if %ErrorLevel%==2 set batvercurrent=2& goto :batver_main
if %ErrorLevel%==3 call :batver_Core a
if %ErrorLevel%==4 call :batver_Core d
if %ErrorLevel%==5 call :batver_Core y
if %ErrorLevel%==6 call :batver_Core e
if %ErrorLevel%==7 call :batver_Core b
goto :batver_main


:batver_Core
rem Processing of each move
if "%1"=="a" (set /a batvercurrent-=1
    if "%batvercurrent%"=="0" (set batvercurrent=1)
    if "%batvercurrent%"=="1" (set batvercurrent=1)
    exit /b
)
if "%1"=="d" (set /a batvercurrent+=1
    if "%batvercurrent%"=="2" (set batvercurrent=2)
    exit /b
)
if "%1"=="b" (set batverexit=true& exit /b)
if "%1"=="y" (call :batverselect_core& exit /b)
if "%1"=="e" (call :batverselect_core& exit /b)


:batverselect_core
rem Processing of Confirm key, like Y and E.
if "%batvercurrent%"=="0" (set batvercurrent=1& exit /b)
if "%batvercurrent%"=="1" (call :batverupdate& set batverboot=& exit /b)
if "%batvercurrent%"=="2" (set batverexit=true& exit /b)
exit /b

:batver_Core_Drew
rem drawer of Text and Colors.
if not defined dummy (echo [9;42H %batver% ^(%batverdevshow%^))
if not defined dummy (echo [10;42H %batbuild:~6%)
if not defined dummy (set /p nothing=[25;0H%clrgra%ŠJ”­Ò : tamago_1908%clr2%<nul)
if "%batvercurrent%"=="0" (echo [18;27H %clrgra%‰½‚à‘I‘ğ‚³‚ê‚Ä‚¢‚Ü‚¹‚ñ...%clr2%) else (echo [18;29H                                 )
if "%batvercurrent%"=="1" (set bvb=%clr%& set bvb2=& exit /b)
if "%batvercurrent%"=="2" (set bvb2=%clr%& set bvb=& exit /b)
exit /b

:batver_exit
rem initialize of variable
set batverexit=& set bvb=& set bvb2=& set batverboot=& set batverdevshow=& set clrgra=
if not defined dummy (set /p nothing=[?25h<nul)
exit /b

:batverupdate
cd %~dp0
cls
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ƒAƒbƒvƒf[ƒ^[
echo ƒAƒbƒvƒf[ƒg ƒvƒƒZƒX‚ğŠJn‚µ‚Ä‚¢‚Ü‚·...
set Powersheller=Fullupdater& call :Powersheller
pause
cd %batchmainpath%
mode con: cols=75 lines=25
exit /b


:Appmenu
cls
rem initialize variable
mode con: cols=67 lines=20
if not defined dummy (set clr=[7m&set clrgra=[90m&set clr2=[0m)
if "%wmodetoggle%"=="false" (set clr=[7m&set clrgra=[90m&set clr2=[0m)
if "%wmodetoggle%"=="true" (set clr=[100m[97m&set clrgra=[0m[107m&set clr2=[90m[107m[30m)
if not defined dummy (set /p nothing=[?25l<nul)
set Appmenucurrent=0

:Appmenu_main
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ƒAƒvƒŠƒP[ƒVƒ‡ƒ“ƒƒjƒ…[ (Œ±“I)
if "%Appmenuexit%"=="true" (call :Appmenu_exit& goto :hazimemenu)
call :Appmenu_Core_Drew
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
if %ErrorLevel%==1 set Appmenucurrent=1
if %ErrorLevel%==2 set Appmenucurrent=2
if %ErrorLevel%==3 set Appmenucurrent=3
if %ErrorLevel%==4 call :Appmenu_Core w
if %ErrorLevel%==5 call :Appmenu_Core s
if %ErrorLevel%==6 call :Appmenu_Core y
if %ErrorLevel%==7 call :Appmenu_Core e
if %ErrorLevel%==8 call :Appmenu_Core b
if %ErrorLevel%==9 call :Appmenu_Core n
goto :Appmenu_main


:Appmenu_Core
rem Processing of each move

if "%1"=="w" (
    if "%Appmenucurrent%"=="0" (set Appmenucurrent=1& exit /b)
    if "%Appmenucurrent%"=="1" (set Appmenucurrent=1& exit /b)
    if "%Appmenucurrent%"=="3" (set Appmenucurrent=2& exit /b)
    set /a Appmenucurrent-=1
    exit /b
) else if "%1"=="s" (
    if "%Appmenucurrent%"=="0" (set Appmenucurrent=1& exit /b)
    if "%Appmenucurrent%"=="1" (set Appmenucurrent=2& exit /b)
    if "%Appmenucurrent%"=="3" (set Appmenucurrent=3& exit /b)
    set /a Appmenucurrent+=1
    exit /b
)

if "%1"=="y" (
call :Appmenuselect_core
exit /b
) else if "%1"=="e" (
call :Appmenuselect_core
exit /b
)

if "%1"=="b" (
set Appmenuexit=true
exit /b
) else if "%1"=="n" (
set Appmenuexit=true
exit /b
)

:Appmenuselect_core
rem Processing of Confirm key, like Y and E.
if "%Appmenucurrent%"=="0" (set Appmenucurrent=1& exit /b)
if "%Appmenucurrent%"=="1" (call :Startcal)
if "%Appmenucurrent%"=="2" (call :2048_game)
if "%Appmenucurrent%"=="3" (call :Openie)
rem I know it works the same way as cls when mode con is changed, but well... whatever.
mode con: cols=67 lines=20
cls & call :Appmenu_Core_Drew
exit /b

:Appmenu_Core_Drew
rem drawer of Text and Colors.
if "%Appmenucurrent%"=="0" (echo [7;38H ‰½‚à‘I‘ğ‚³‚ê‚Ä‚¢‚Ü‚¹‚ñ) else (for /l %%i in (6,1,10) do (echo [%%i;38H                        ))
if "%Appmenucurrent%"=="1" (echo [7;42H ƒVƒ“ƒvƒ‹‚È“d‘ì& echo [8;41H ƒoƒJ‚Å‚àg‚¦‚Ü‚·B)
if "%Appmenucurrent%"=="2" (echo [7;44H 2048 ƒQ[ƒ€B& echo [8;44H –³ŒÀ‚ÉŠy‚µ‚¢& echo [9;44H Å‹­‚ÌƒQ[ƒ€B& echo [10;42H %clrgra%‚¿‚å‚Á‚Æ’x‚¢‚©‚à%clr2%)
if "%Appmenucurrent%"=="3" (echo [7;41H Internet Explorer& echo [8;43H IE‚ğŠJ‚«‚Ü‚·B)
if "%Appmenucurrent%"=="1" (set amb1=%clr%& set amb2=& set amb3=& exit /b)
if "%Appmenucurrent%"=="2" (set amb2=%clr%& set amb1=& set amb3=& exit /b)
if "%Appmenucurrent%"=="3" (set amb3=%clr%& set amb1=& set amb2=& exit /b)
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
ping -n 2 127.0.0.1 > nul 2>&1
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
rem initialize variable
mode con: cols=75 lines=20
if not defined dummy (set clr=[7m&set clrgra=[90m&set clr2=[0m)
if "%wmodetoggle%"=="false" (set clr=[7m&set clrgra=[90m&set clr2=[0m)
if "%wmodetoggle%"=="true" (set clr=[100m[97m&set clrgra=[0m[107m&set clr2=[90m[107m[30m)
if not defined dummy (set /p nothing=[?25l<nul)
set cursorchangecurrent=0

:cursorchange_loop
rem main menu of cursor change
title ƒJ[ƒ\ƒ‹‘Ö‚¦
if "%cursorchangeexit%"=="true" (set cursorchangecurrent=& call :cursorchange_exit& goto :hazimemenu)
if "%cursorchangeexit%"=="true1y" (call :cursorchange_main_cfm)
if "%cursorchangeexit%"=="true2" (call :cursorchange_Drew& goto :cursorchange_loop)
call :cursorchange_Drew
if not defined dummy (set /p nothing=[0;0H<nul)
if "%cursorchangecurrent%"=="0" (call :cursorchange_Drew boot)
if not "%cursorchangeexit%"=="true1" (
echo                               ƒJ[ƒ\ƒ‹‘Ö‚¦%batver%
echo.
echo           O================================O=====================O
echo           I            ƒƒjƒ…[            I         î•ñ        I
echo           I                                I[5;66HI
echo           I   %ccm1%1 ƒJ[ƒ\ƒ‹‚ğ%cursorcolor%F‚É•Ï‚¦‚é %ccm1e%    I[6;66HI
echo           I                                I[7;66HI
echo           I   %ccm2%2 ƒJƒXƒ^ƒ€ƒJ[ƒ\ƒ‹‚É•ÏX‚·‚é%ccm2e% I[8;66HI
echo           I                                I[9;66HI
echo           O================================O=====================O
echo.
echo.
echo               1~2 ‚© W,D ‚Å‘I‘ğ‚µAY,E‚ÅŒˆ’èA B,N‚ÅI—¹‚µ‚Ü‚·B
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
    if "%cursorchangeexit%"=="true2" (
        rem confirm messages (Ughhhhh)
        set cursorchangeexit=
        call :cursorchange_clear
        set /p nothing=[5;13H ‚±‚Ì‹@”\‚ÍŒ»İ‚ÍÀ‘•‚³‚ê‚Ä‚¢‚Ü‚¹‚ñB<nul& set /p nothing=[7;13H %clrgra%‰½‚©ƒL[‚ğ‰Ÿ‚µ‚Ä–ß‚é...%clr2%<nul
        pause >nul
        call :cursorchange_clear
        exit /b
    )
    echo [6;47H ƒJƒXƒ^ƒ€ƒJ[ƒ\ƒ‹
    echo [7;49H ‚É•ÏX‚µ‚Ü‚·B
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
set Powersheller=RefreshCursor& call :Powersheller
set a=
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
set Powersheller=RefreshCursor& call :Powersheller
set a=
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





rem dogcheckB%Settingsfile%‚ª‘¶İ‚·‚é‚©‚ğŒŸØ
:AllDefult
cd /d %batchmainpath%
if "%settinghelptoggle%"=="true" (goto :alldefhelp)
if exist %Settingsfile% goto :AllDefulttest
if not exist %Settingsfile% goto :Dogcheck

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
start chrome.exe --window-size=0,0 --incognito -- https://www.youtube.com/watch?v=kO77pZFJp1o
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
taskkill /im chrome.exe
call :exit 0


rem alldef
:AllDefulttest
cd /d %batchmainpath% 
find "nodogcheckfor1234567890qwertyuiop" %Settingsfile%
cls
if %ErrorLevel%==0 goto :AllDefult1
if %ErrorLevel%==1 goto :Dogcheck
rem ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹ƒƒjƒ…[
:AllDefult1
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹ (Œ±“I)
Cls
echo ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹‚Ìd•û‚ğ‘I‘ğ b‚Å–ß‚ê‚Ü‚·B
echo ‘I‘ğ‚µ‚½‚¢”š‚ğ‰Ÿ‚·‚©A‚Ü‚½‚Íw‚ÅãAs‚Å‰º‚Ì€–Ú‚ÉˆÚ“®‚µA”CˆÓ‚Ì•”•ª‚ğ‘I‘ğŒãAy‚Ü‚½‚ÍeƒL[‚ğ“ü—Í‚µ‚ÄŒˆ’è‚µ‚Ü‚·B
echo.
echo 1 ‚±‚Ìbatƒtƒ@ƒCƒ‹‚ÉŠÖ‚·‚é‚·‚×‚Ä‚Ìƒf[ƒ^‚ğíœ‚µAƒJ[ƒ\ƒ‹‚à”’F‚É–ß‚·
echo.
echo 2 ƒJ[ƒ\ƒ‹‚Í‚»‚Ì‚Ü‚Ü‚É‚µ‚ÄA‚·‚×‚Äíœ‚·‚é
echo.
echo 3 İ’è‚ğ‰Šú‰»‚·‚é
echo.
echo 4 İ’è‚Ìƒtƒ@ƒCƒ‹ƒpƒX‚ğ•\¦‚·‚é
echo.
echo Œ»İ‚Í‰½‚à‘I‘ğ‚³‚ê‚Ä‚¢‚Ü‚¹‚ñB
choice /c 1234wsb /n /m ""
if %ErrorLevel%==1 goto :alldefselect1
if %ErrorLevel%==2 goto :alldefselect2
if %ErrorLevel%==3 goto :alldefselect3
if %ErrorLevel%==4 goto :alldefselect4
if %ErrorLevel%==5 goto :alldefselect1
if %ErrorLevel%==6 goto :alldefselect1
if %ErrorLevel%==7 goto :settingcategory1intsetting5

rem ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹ƒƒjƒ…[‚Ì•ªŠò
:alldefselect1
Cls
echo ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹‚Ìd•û‚ğ‘I‘ğ b‚Å–ß‚ê‚Ü‚·B
echo ‘I‘ğ‚µ‚½‚¢”š‚ğ‰Ÿ‚·‚©A‚Ü‚½‚Íw‚ÅãAs‚Å‰º‚Ì€–Ú‚ÉˆÚ“®‚µA”CˆÓ‚Ì•”•ª‚ğ‘I‘ğŒãAy‚Ü‚½‚ÍeƒL[‚ğ“ü—Í‚µ‚ÄŒˆ’è‚µ‚Ü‚·B
echo.
echo %clr%1 ‚±‚Ìbatƒtƒ@ƒCƒ‹‚ÉŠÖ‚·‚é‚·‚×‚Ä‚Ìƒf[ƒ^‚ğíœ‚µAƒJ[ƒ\ƒ‹‚à”’F‚É–ß‚·%clr2%
echo.
echo 2 ƒJ[ƒ\ƒ‹‚Í‚»‚Ì‚Ü‚Ü‚É‚µ‚ÄA‚·‚×‚Äíœ‚·‚é
echo.
echo 3 İ’è‚ğ‰Šú‰»‚·‚é
echo.
echo 4 İ’è‚Ìƒtƒ@ƒCƒ‹ƒpƒX‚ğ•\¦‚·‚é
echo.
echo Œ»İ‚Í1‚ª‘I‘ğ‚³‚ê‚Ä‚¢‚Ü‚·BŒˆ’è‚·‚éê‡‚Íy‚Ü‚½‚ÍeƒL[‚ğ‰Ÿ‚µ‚Ä‚­‚¾‚³‚¢
choice /c 1234wseyb /n /m ""
if %ErrorLevel%==1 goto :alldefselect1
if %ErrorLevel%==2 goto :alldefselect2
if %ErrorLevel%==3 goto :alldefselect3
if %ErrorLevel%==4 goto :alldefselect4
if %ErrorLevel%==5 goto :alldefselect1
if %ErrorLevel%==6 goto :alldefselect2
if %ErrorLevel%==7 set alldefselect=1&goto :alldefselectokey
if %ErrorLevel%==8 set alldefselect=1&goto :alldefselectokey
if %ErrorLevel%==9 goto :settingcategory1intsetting5


rem ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹ƒƒjƒ…[‚Ì•ªŠò
:alldefselect2
Cls
echo ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹‚Ìd•û‚ğ‘I‘ğ b‚Å–ß‚ê‚Ü‚·B
echo ‘I‘ğ‚µ‚½‚¢”š‚ğ‰Ÿ‚·‚©A‚Ü‚½‚Íw‚ÅãAs‚Å‰º‚Ì€–Ú‚ÉˆÚ“®‚µA”CˆÓ‚Ì•”•ª‚ğ‘I‘ğŒãAy‚Ü‚½‚ÍeƒL[‚ğ“ü—Í‚µ‚ÄŒˆ’è‚µ‚Ü‚·B
echo.
echo 1 ‚±‚Ìbatƒtƒ@ƒCƒ‹‚ÉŠÖ‚·‚é‚·‚×‚Ä‚Ìƒf[ƒ^‚ğíœ‚µAƒJ[ƒ\ƒ‹‚à”’F‚É–ß‚·
echo.
echo %clr%2 ƒJ[ƒ\ƒ‹‚Í‚»‚Ì‚Ü‚Ü‚É‚µ‚ÄA‚·‚×‚Äíœ‚·‚é %clr2%
echo.
echo 3 İ’è‚ğ‰Šú‰»‚·‚é
echo.
echo 4 İ’è‚Ìƒtƒ@ƒCƒ‹ƒpƒX‚ğ•\¦‚·‚é
echo.
echo Œ»İ‚Í2‚ª‘I‘ğ‚³‚ê‚Ä‚¢‚Ü‚·BŒˆ’è‚·‚éê‡‚Íy‚Ü‚½‚ÍeƒL[‚ğ‰Ÿ‚µ‚Ä‚­‚¾‚³‚¢
choice /c 1234wseyb /n /m ""
if %ErrorLevel%==1 goto :alldefselect1
if %ErrorLevel%==2 goto :alldefselect2
if %ErrorLevel%==3 goto :alldefselect3
if %ErrorLevel%==4 goto :alldefselect4
if %ErrorLevel%==5 goto :alldefselect1
if %ErrorLevel%==6 goto :alldefselect3
if %ErrorLevel%==7 set alldefselect=2&goto :alldefselectokey
if %ErrorLevel%==8 set alldefselect=2&goto :alldefselectokey
if %ErrorLevel%==9 goto :settingcategory1intsetting5

rem ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹ƒƒjƒ…[‚Ì•ªŠò
:alldefselect3
Cls
echo ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹‚Ìd•û‚ğ‘I‘ğ b‚Å–ß‚ê‚Ü‚·B
echo ‘I‘ğ‚µ‚½‚¢”š‚ğ‰Ÿ‚·‚©A‚Ü‚½‚Íw‚ÅãAs‚Å‰º‚Ì€–Ú‚ÉˆÚ“®‚µA”CˆÓ‚Ì•”•ª‚ğ‘I‘ğŒãAy‚Ü‚½‚ÍeƒL[‚ğ“ü—Í‚µ‚ÄŒˆ’è‚µ‚Ü‚·B
echo.
echo 1 ‚±‚Ìbatƒtƒ@ƒCƒ‹‚ÉŠÖ‚·‚é‚·‚×‚Ä‚Ìƒf[ƒ^‚ğíœ‚µAƒJ[ƒ\ƒ‹‚à”’F‚É–ß‚·
echo.
echo 2 ƒJ[ƒ\ƒ‹‚Í‚»‚Ì‚Ü‚Ü‚É‚µ‚ÄA‚·‚×‚Äíœ‚·‚é
echo.
echo %clr%3 İ’è‚ğ‰Šú‰»‚·‚é%clr2%
echo.
echo 4 İ’è‚Ìƒtƒ@ƒCƒ‹ƒpƒX‚ğ•\¦‚·‚é
echo.
echo Œ»İ‚Í3‚ª‘I‘ğ‚³‚ê‚Ä‚¢‚Ü‚·BŒˆ’è‚·‚éê‡‚Íy‚Ü‚½‚ÍeƒL[‚ğ‰Ÿ‚µ‚Ä‚­‚¾‚³‚¢
choice /c 1234wseyb /n /m ""
if %ErrorLevel%==1 goto :alldefselect1
if %ErrorLevel%==2 goto :alldefselect2
if %ErrorLevel%==3 goto :alldefselect3
if %ErrorLevel%==4 goto :alldefselect4
if %ErrorLevel%==5 goto :alldefselect2
if %ErrorLevel%==6 goto :alldefselect4
if %ErrorLevel%==7 set alldefselect=3&goto :alldefselectokey
if %ErrorLevel%==8 set alldefselect=3&goto :alldefselectokey
if %ErrorLevel%==9 goto :settingcategory1intsetting5

rem ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹ƒƒjƒ…[‚Ì•ªŠò
:alldefselect4
Cls
echo ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹‚Ìd•û‚ğ‘I‘ğ b‚Å–ß‚ê‚Ü‚·B
echo ‘I‘ğ‚µ‚½‚¢”š‚ğ‰Ÿ‚·‚©A‚Ü‚½‚Íw‚ÅãAs‚Å‰º‚Ì€–Ú‚ÉˆÚ“®‚µA”CˆÓ‚Ì•”•ª‚ğ‘I‘ğŒãAy‚Ü‚½‚ÍeƒL[‚ğ“ü—Í‚µ‚ÄŒˆ’è‚µ‚Ü‚·B
echo.
echo 1 ‚±‚Ìbatƒtƒ@ƒCƒ‹‚ÉŠÖ‚·‚é‚·‚×‚Ä‚Ìƒf[ƒ^‚ğíœ‚µAƒJ[ƒ\ƒ‹‚à”’F‚É–ß‚·
echo.
echo 2 ƒJ[ƒ\ƒ‹‚Í‚»‚Ì‚Ü‚Ü‚É‚µ‚ÄA‚·‚×‚Äíœ‚·‚é
echo.
echo 3 İ’è‚ğ‰Šú‰»‚·‚é
echo.
echo %clr%4 İ’è‚Ìƒtƒ@ƒCƒ‹ƒpƒX‚ğ•\¦‚·‚é%clr2%
echo.
echo Œ»İ‚Í4‚ª‘I‘ğ‚³‚ê‚Ä‚¢‚Ü‚·BŒˆ’è‚·‚éê‡‚Íy‚Ü‚½‚ÍeƒL[‚ğ‰Ÿ‚µ‚Ä‚­‚¾‚³‚¢
choice /c 1234wseyb /n /m ""
if %ErrorLevel%==1 goto :alldefselect1
if %ErrorLevel%==2 goto :alldefselect2
if %ErrorLevel%==3 goto :alldefselect3
if %ErrorLevel%==4 goto :alldefselect4
if %ErrorLevel%==5 goto :alldefselect3
if %ErrorLevel%==6 goto :alldefselect4
if %ErrorLevel%==7 set alldefselect=4&goto :alldefselectokey
if %ErrorLevel%==8 set alldefselect=4&goto :alldefselectokey
if %ErrorLevel%==9 goto :settingcategory1intsetting5


rem İ’è‚Ì‰Šú‰»‚ğ‚·‚éÛ‚ÌŒxƒƒbƒZ[ƒW
:alldefsettingonly
cls
:alldefsettingonlyokey
echo ‚±‚Ìƒƒjƒ…[‚Å‚Íİ’è‚ğ‰Šú‰»‚µ‚Ü‚·B‚µ‚½‚ª‚Á‚ÄA‚ ‚È‚½‚ª¡‚Ü‚Å‚Éİ’è‚µ‚½‚à‚Ì‚Í‚·‚×‚Ä‰Šúİ’è‚É–ß‚è‚Ü‚·BiƒJ[ƒ\ƒ‹‘Ö‚¦‚ğ‰‚ß‚Ä‹N“®‚µ‚½‚Æ‚«‚Ìİ’è‚É–ß‚éj‚æ‚ë‚µ‚¢‚Å‚·‚©H(Y=Yes / N=No)
choice /c yn /n /m ""
if %ErrorLevel%==1 goto :alldefsettingonlyokey2
if %ErrorLevel%==2 goto :alldefsettingno
:alldefsettingonlyokey2
echo –{“–‚Éíœ‚·‚é‚Ì‚Å‚·‚ËH(Y=Yes / N=No)
choice /c yn /n /m ""
if %ErrorLevel%==1 goto :alldefsettingyes
if %ErrorLevel%==2 goto :alldefsettingno
goto :alldefsettingonly

:alldefsettingyes
echo İ’èƒtƒ@ƒCƒ‹‚ğ‰Šú‰»‚µ‚Ü‚·B‚¢‚Ü‚Ü‚Å‚Ìİ’è‚Í‚·‚×‚Äíœ‚³‚ê‚Ü‚·B
echo ƒLƒƒƒ“ƒZƒ‹‚·‚éê‡‚ÍA‚±‚Ì“_‚Åƒoƒbƒ`ˆ—‚ğI—¹‚µ‚Ä‚­‚¾‚³‚¢B
pause
cls
call :Wipealldeta
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ...
echo ‰Šú‰»‚ªŠ®—¹‚µ‚Ü‚µ‚½B•ÏX‚ğ“K—p‚·‚é‚½‚ßAƒJ[ƒ\ƒ‹‘Ö‚¦‚ğÄ‹N“®‚µ‚Ü‚·B‰½‚©ƒL[‚ğ‰Ÿ‚µ‚ÄÄ‹N“®...
pause >nul
call :rebootbatch
:alldefsettingno
cls
echo İ’è‚Í‰Šú‰»‚³‚ê‚Ü‚¹‚ñ‚Å‚µ‚½B
pause
:alldefsettingno2
cls
echo ‚±‚Ì‚Ü‚ÜƒAƒ“ƒCƒ“ƒXƒg[ƒ‹ƒƒjƒ…[‚És‚­‚©A‚à‚µ‚­‚Íƒz[ƒ€‚É–ß‚é‚©B
echo ‚Ç‚Á‚¿‚É‚µ‚Ü‚·‚©H(İ’è‚É–ß‚é=1 / ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹ƒƒjƒ…[=2)
choice /c 12 /n /m ""
if %ErrorLevel%==1 goto :settingcategory1intsetting5
if %ErrorLevel%==2 goto :alldefselect3
goto :alldefsettingno2

:alldefshowsettingpass
cls
echo İ’èƒtƒ@ƒCƒ‹‚ª’u‚©‚ê‚Ä‚¢‚éƒpƒX‚ğ•\¦‚µ‚Ü‚·B
start explorer %batchmainpath%
timeout /t 3 /nobreak >nul
echo ŠÂ‹«‚É‚à‚æ‚è‚Ü‚·‚ªA‚½‚¢‚Ä‚¢‚Ìê‡A‰º‚Ì‚Ù‚¤‚Ü‚½‚Íã‚Ì‚Ù‚¤‚É%Settingsfile%‚ª‚ ‚é‚Æv‚¢‚Ü‚·B
pause
cls
:alldefshowsettingpass2
echo ‚±‚Ì‚Ü‚ÜƒAƒ“ƒCƒ“ƒXƒg[ƒ‹ƒƒjƒ…[‚És‚­‚©A‚à‚µ‚­‚Íƒz[ƒ€‚É–ß‚é‚©B
echo ‚Ç‚Á‚¿‚É‚µ‚Ü‚·‚©H(İ’è‚É–ß‚é=1 / ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹ƒƒjƒ…[=2)
choice /c 12 /n /m ""
if %ErrorLevel%==1 goto :settingcategory1intsetting5
if %ErrorLevel%==2 goto :alldefselect4
goto :alldefshowsettingpass2

:alldefselectokey
if %alldefselect%==3 goto :alldefsettingonly
if %alldefselect%==4 goto :alldefshowsettingpass
cls
color 9f
set alldefentered=true
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^|‚ÌƒAƒ“ƒCƒ“ƒXƒg[ƒ‹ 
echo ‚±‚ÌƒAƒ“ƒCƒ“ƒXƒg[ƒ‹ƒƒjƒ…[‚ÍA‚±‚Ìƒoƒbƒ`ƒtƒ@ƒCƒ‹‚ª•ÏX‚µ‚½ƒŒƒWƒXƒgƒŠA‰‰ñ‹L˜^—p‚Ìƒtƒ@ƒCƒ‹‚ğ‚·‚×‚ÄŒ³‚Ìó‘Ô‚É–ß‚µAƒJ[ƒ\ƒ‹‘Ö‚¦©‘Ì‚ğíœ‚·‚é•¨‚Å‚·B
pause
cls
echo ‚Â‚Ü‚èA‚±‚Ì‹@”\‚ğg—p‚·‚é‚Æƒ}ƒEƒXƒJ[ƒ\ƒ‹‚ª‰Šú‚Ì”’FA‚»‚µ‚Ä‚±‚Ìƒoƒbƒ`ƒtƒ@ƒCƒ‹‚àŠ®‘S‚Éíœ‚·‚é‚±‚Æ‚É‚È‚èAÄ“xg—p‚·‚é‚½‚ß‚É‚ÍƒJ[ƒ\ƒ‹‘Ö‚¦‚ğÄ“xƒCƒ“ƒXƒg[ƒ‹‚µ‚È‚¯‚ê‚Î‚¢‚¯‚È‚­‚È‚è‚Ü‚·I
echo (OS‚ª‰Šú‰»‚³‚ê‚é‚í‚¯‚Å‚Í‚È‚¢)
pause
cls
echo ‚Ü‚½AƒAƒ“ƒCƒ“ƒXƒg[ƒ‹‚ğÀs‚µ‚½‚±‚Æ‚É‹Nˆö‚·‚é‰½‚ç‚©‚ÌáŠQA‚Ü‚½‚Í•s—˜‰v‚ğ”í‚Á‚½ê‡‚ÌÓ”C‚Íì¬Ò‚Ìtamago1908‚ÍˆêØ•‰‚¢‚Ü‚¹‚ñI
echo.
pause
:AllDefultOkey
SET /P selected=‚æ‚ë‚µ‚¢‚Å‚·‚©H(Y=Yes / N=No / B=Back)
if "%selected%"=="y" (goto :yes2)
if "%selected%"=="yes" (goto :yes2)
if "%selected%"=="n" (goto :no2)
if "%selected%"=="no" (goto :no2)
if "%selected%"=="back" (color 07&goto :hazime)
if "%selected%"=="b" (color 07&goto :hazime)
if "%selected%"=="debugyesnow" (goto :yes2go)
echo ?
echo.
pause
echo ‚·‚İ‚Ü‚¹‚ñB‚à‚¤ˆê“xŒ¾‚Á‚Ä‚¢‚½‚¾‚¯‚Ü‚¹‚ñ‚©H
echo.
pause
cls
goto :AllDefultOkey

:no2
cls
color 0B
echo [40m[3m[96m‚ğ–ß‚»‚¤
timeout /t 3 /nobreak >nul
find "wmode=false" %Settingsfile% > nul
if %ErrorLevel%==0 color 07
if %ErrorLevel%==1 goto :wmodeonoffkenti
:wmodeonoffkentialldefno2
find "wmode=true" %Settingsfile% > nul
if %ErrorLevel%==0 color f0
goto :hazime

:yes2
rem ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹‚ÌÅIŠm”F
set selected=
SET /P selected=–{“–‚É‚¢‚¢‚Å‚·‚ËH(Y=Yes / N=No / B=Back)
if "%selected%"=="y" (set alldefclr=[31m&set alldefclr2=[97m&goto :yes2final)
if "%selected%"=="yes" (setalldefclr=[31m&set alldefclr2=[97m&goto :yes2final)
if "%selected%"=="n" (goto :no2)
if "%selected%"=="no" (goto :no2)
if "%selected%"=="back" (color 07&goto :hazime)
if "%selected%"=="b" (color 07&goto :hazime)
if "%selected%"=="debugyesnow" (goto :yes2go)
echo.
echo ?
pause
echo.
echo ‚·‚İ‚Ü‚¹‚ñB‚à‚¤ˆê“xŒ¾‚Á‚Ä‚¢‚½‚¾‚¯‚Ü‚¹‚ñ‚©H
pause
cls
goto :yes2


:yes2final
rem ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹‚ÌÅIŠm”F ƒV[ƒYƒ“‚Q
set selected=
echo.
echo 
SET /P selected=%alldefclr%‚±‚¤‚©‚¢@‚µ‚Ü‚¹‚ñ‚ËH(‚à‚Ç‚¹‚Ü‚¹‚ñ‚æI)%alldefclr2%(Y=Yes / N=No / B=Back)
if "%selected%"=="y" (goto :yes2go)
if "%selected%"=="yes" (goto :yes2go)
if "%selected%"=="n" (goto :no2)
if "%selected%"=="no" (goto :no2)
if "%selected%"=="back" (color 07&goto :hazime)
if "%selected%"=="b" (color 07&goto :hazime)
if "%selected%"=="debugyesnow" (goto :yes2go)
echo.
echo ?
pause
echo.
echo ‚·‚İ‚Ü‚¹‚ñB‚à‚¤ˆê“xŒ¾‚Á‚Ä‚¢‚½‚¾‚¯‚Ü‚¹‚ñ‚©H
pause
cls
goto :yes2final

:yes2go
rem ˆø‚«‰º‚ª‚ê‚È‚¢B—ˆ‚é...ƒbI
cls
color 9f
echo Às‚µ‚Ü‚·B–ß‚éê‡‚Íƒoƒbƒ`ƒtƒ@ƒCƒ‹‚ğ’â~‚µ‚Ä‚­‚¾‚³‚¢B
pause

rem ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹ƒƒjƒ…[‚Ì—áŠOˆ— ‰‰ñƒJ[ƒ\ƒ‹‚ª‚È‚¢ê‡‚ÌB‚¾‚¯‚Çç’·‚¾‚©‚ç‰ü‘P‚µ‚½‚¢B
rem —áŠOˆ—‚ğ‚à‚¤‚¿‚å‚Á‚Æ‘‚â‚µ‚½‚¢B—á‚¦‚ÎA’†g‚ğ‰ü‘¢‚µ‚È‚¢ŒÀ‚èâ‘Î‚É‚ ‚è‚¦‚È‚¢ó‘Ô‚É‚È‚Á‚½ê‡‚ÉAgoto‚µ‚Ä•Ï”‚Å•ªŠò‚µ‚ÄƒƒbƒZ[ƒW‚ğ•ÏX‚·‚é‚İ‚½‚¢‚É‚µ‚ÄB
cd /d %batchmainpath%
if not exist %FirstSTFsfile% if exist %Settingsfile% set erroralldefwhatdelete=%FirstSTFsfile%& call :BSOD_Errors 3
if exist %FirstSTFsfile% if not exist %Settingsfile% set erroralldefwhatdelete=%Settingsfile%& call :BSOD_Errors 3
if not exist %FirstSTFsfile% if not exist %Settingsfile% set "erroralldefwhatdelete=%FirstSTFsfile%‚ÆA%Settingsfile%A‚»‚Ì—¼•û"& call :BSOD_Errors 3
goto :alldefnow

:BSOD_Errors
if not defined dummy (set bsod_errors_clrforsad=[44m[7m&set bsod_errors_clrforsad2=[0m[44m[97m)
for /f "tokens=6 delims=. " %%i in ('ver') do set bsodwinver=%%i
set runningfromfulldebug=
set FromREConsole=

rem message indication
timeout /t 1 /nobreak >nul
mode con: cols=97 lines=25
rundll32 user32.dll,MessageBeep || echo 
color 1f
cls
if "%1"=="" (goto :BSOD_Errors_Error) else if "%1"=="BatBootErrorHandlerArgument1908" (goto :BSOD_Errors_Error)
if "%2"=="" (set bsoderrorlevel=Undefined) else (set bsoderrorlevel=%2)
if "%1"=="THERE_IS_NO_PROBLEMS" (goto :BSOD_Errors_NOERRORS)
call :batbootcheckwinver dynamic
if "%errorlevel%"=="1" (call :BSOD_Errors_OG %1) else (set /p nothing=[?25l<nul)
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ƒuƒ‹[ƒXƒNƒŠ[ƒ“I
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
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"...‚Ü‚ŸAÀÛ‚É‚Í%erroralldefwhatdelete%‚ğ‚ ‚È‚½‚ªíœ‚µ‚½‚Ì‚ªŒ´ˆö‚Å‚µ‚å‚¤‚ª... (‚à‚µ‚»‚¤‚È‚ç ‚Í‚¢ ‚ğA‚»‚¤‚Å‚È‚¢‚È‚ç ‚¢‚¢‚¦ ‚ğ‰Ÿ‚µ‚Ä‚­‚¾‚³‚¢)\", '', [System.Windows.Forms.MessageBoxButtons]::'Yesno', 'Question');exit $result;"
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
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"d‘å‚ÈƒGƒ‰[‚ªErrorHandler‚Å”­¶‚µ‚Ü‚µ‚½I\", 'CRITICAL ERROR', 'OK', 'Warning');Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"ƒGƒ‰[‚ÌŠT—v : ErrorHandler‚Åd‘å‚ÈƒGƒ‰[‚ª”­¶‚µ‚Ü‚µ‚½I ƒGƒ‰[ID : 6\", 'ƒGƒ‰[', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"‚±‚ÌƒGƒ‰[‚Í—lX‚È——R‚Å”­¶‚·‚é‰Â”\«‚ª‚ ‚è‚Ü‚·B—á‚¦‚ÎA³‚µ‚­‚È‚¢ƒJ[ƒ\ƒ‹‘Ö‚¦‚Ì–¼‘OACtrl+C‚Ìg—pA•s“KØ‚È•û–@‚Å‚Ì‹N“®“™‚Å‚·B\", 'ƒGƒ‰[', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"Cursor Changer‚ğÄƒCƒ“ƒXƒg[ƒ‹‚µ‚½‚èApowershell‚â‚±‚Ìbatch‚Ì–¼‘O‚ğŠm”F‚µ‚½‚èAƒfƒXƒNƒgƒbƒv‚É‚¨‚¢‚Ä‚©‚çbatch‚ğ‹N“®‚·‚é‚È‚Ç‚ğ‚µ‚Ä‚­‚¾‚³‚¢B\", '‚Ç‚¤‚·‚ê‚Î‚¢‚¢H', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"‚»‚ê‚Å‚àƒGƒ‰[‚ªŒp‘±‚·‚éê‡AGithub‚Ìissue‚É‚Ä•ñ‚µ‚Ä‚­‚¾‚³‚¢B\", 'ƒGƒ‰[', 'OK', 'None')"
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
echo WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I 
pause


:bsod_errors_RANDOMFACEHAHA
set /a bootegg=%random%*17/32767
set /a bootegg2=%random%*17/32767
if "%bootegg%"=="%bootegg2%" (goto :bsod_errors_RANDOMFACEHAHA2)
set /a bootegg=%random%*129/32767
set /a bootegg2=%random%*129/32767
if "%bootegg%"=="%bootegg2%" (goto :bsod_errors_RANDOMFACEHAHA3)
rem :)
if not defined dummy (echo [17a%bsod_errors_clrforsad%  %bsod_errors_clrforsad2%& echo [09a%bsod_errors_clrforsad%  %bsod_errors_clrforsad2%[4a%bsod_errors_clrforsad%  %bsod_errors_clrforsad2%& echo [15a%bsod_errors_clrforsad%  %bsod_errors_clrforsad2%& echo [09a%bsod_errors_clrforsad%  %bsod_errors_clrforsad2%[4a%bsod_errors_clrforsad%  %bsod_errors_clrforsad2%& echo [17a%bsod_errors_clrforsad%  %bsod_errors_clrforsad2%)
exit /b
:bsod_errors_RANDOMFACEHAHA2
rem :(
if not defined dummy (echo [13a%bsod_errors_clrforsad%  %bsod_errors_clrforsad2%& echo [09a%bsod_errors_clrforsad%  %bsod_errors_clrforsad2%[4a%bsod_errors_clrforsad%  %bsod_errors_clrforsad2%& echo [15a%bsod_errors_clrforsad%  %bsod_errors_clrforsad2%& echo [09a%bsod_errors_clrforsad%  %bsod_errors_clrforsad2%[4a%bsod_errors_clrforsad%  %bsod_errors_clrforsad2%& echo [13a%bsod_errors_clrforsad%  %bsod_errors_clrforsad2%)
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
timeout /t 1 /nobreak >nul
mode con: cols=97 lines=21
rundll32 user32.dll,MessageBeep || echo 
color 07
cls
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ƒuƒ‹[ƒXƒNƒŠ[ƒ“I
echo O========================================= ƒNƒ‰ƒbƒVƒ… ==========================================O
echo.
echo.
echo          ƒJ[ƒ\ƒ‹‘Ö‚¦‚ªƒNƒ‰ƒbƒVƒ…‚µ‚Ü‚µ‚½I
echo.
echo          ‚±‚Ì‰æ–Ê‚Í‰½‚ç‚©‚Ì——R‚ÅƒJ[ƒ\ƒ‹‘Ö‚¦‚ªƒNƒ‰ƒbƒVƒ…‚µ‚½Û‚É•\¦‚³‚ê‚Ü‚·B
echo          ƒTƒ|[ƒg‚ğ“¾‚éÛ‚É‚ÍˆÈ‰º‚Ìî•ñ‚ª–ğ‚É—§‚Â‚©‚à‚µ‚ê‚Ü‚¹‚ñ :
echo          (Œx : ƒJ[ƒ\ƒ‹‘Ö‚¦‚Í‚ ‚È‚½‚ÌWindows‚ğƒTƒ|[ƒg‚µ‚Ä‚¢‚Ü‚¹‚ñI)
echo.
echo          ƒJ[ƒ\ƒ‹‘Ö‚¦ ƒo[ƒWƒ‡ƒ“ : %batver% (%batbuild%)
echo          Windows ƒrƒ‹ƒh”Ô†      : (–¢ƒTƒ|[ƒg‚Ìƒo[ƒWƒ‡ƒ“)
echo          ƒGƒ‰[ID                : %1
echo          ƒGƒ‰[ƒŒƒxƒ‹            : %bsoderrorlevel%
echo.
echo          ‚±‚Ì‰æ–Ê‚É‚Â‚¢‚Ä‚ÌÚ×î•ñ‚ğ“¾‚éÛ‚É‚ÍˆÈ‰º‚ÌƒŠƒ“ƒN‚ÉƒAƒNƒZƒX‚µ‚Ä‚­‚¾‚³‚¢ (‰pŒê) :
echo.
echo          https://github.com/tamago1908/Cursor-Changer.bat/wiki/BSOD-Crash-(Error-Screen)
echo.
echo          ‰½‚©ƒL[‚ğ‰Ÿ‚µ‚ÄI—¹...
echo.
pause >nul
if "%wmodetoggle%"=="true" (color f0) else (color 07)
call :exit 1


:BSOD_Errors_NOERRORS
rem Your Cursor Changer is running perfectly fine :)
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
exit /b



rem ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹ƒƒjƒ…[‚Ì‘I‘ğ‚Ì”»•Ê
:alldefnow
cls
color 07
if %alldefselect%==1 goto :alldefnowchangeit
if %alldefselect%==2 goto :alldefnowsettingdel

rem ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹ƒƒjƒ…[‚Ì‘I‘ğ‚É‰‚¶‚Ä‚Ì•ªŠò
:alldefnowsettingdel
del %FirstSTFsfile%
del %Settingsfile%
goto :alldefnowfinish

:alldefnowchangeit
del %FirstSTFsfile%
del %Settingsfile%
rem ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹‚Ì‚½‚ß‚ÌƒJ[ƒ\ƒ‹‚Ì‰Šú‰»B”’‚É–ß‚·
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /ve /f /d "Windows •W€" >nul
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v ContactVisualization /t REG_DWORD /f /d "0x00000001" >nul
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v CursorBaseSize /t REG_DWORD /f /d "0x00000020" >nul
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v GestureVisualization /t REG_DWORD /f /d "0x0000001f" >nul
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v "Scheme Source" /t REG_DWORD /f /d "0x0000002" >nul
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v AppStarting /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\aero_working.ani >nul
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v Arrow /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\aero_arrow.cur >nul
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v Crosshair /t REG_EXPAND_SZ /f /d "" >nul
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v Hand /t REG_SZ /f /d "%SystemRoot%\cursors\aero_link.cur" >nul
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v Help /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\aero_helpsel.cur >nul
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v IBeam /t REG_EXPAND_SZ /f /d "" >nul
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v No /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\aero_unavail.cur >nul
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v NWPen /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\aero_pen.cur >nul
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v Person /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\aero_person.cur >nul
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v Pin /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\aero_pin.cur >nul
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v SizeAll /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\aero_move.cur >nul
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v SizeNESW /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\aero_nesw.cur >nul
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v SizeNS /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\aero_ns.cur >nul
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v SizeNWSE /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\aero_nwse.cur >nul
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v SizeWE /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\aero_ew.cur >nul
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v UpArrow /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\aero_up.cur >nul
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v Wait /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\aero_busy.ani >nul
:alldefnowfinish
rem ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹Š®—¹Œã‚ÌƒƒbƒZ[ƒW
cls
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ^| ‚³‚æ‚¤‚È‚çI 
echo ‚·‚×‚Ä‚ğƒfƒtƒHƒ‹ƒg‚É–ß‚µ‚Ü‚µ‚½B
pause
echo ‚±‚ê‚Å‚¨•Ê‚ê‚Å‚·‚ËB‚³‚æ‚¤‚È‚çB
pause
rem ©g‚ÌƒpƒX‚ğæ“¾‚µ‚ÄA©•ª©g‚ğíœ
del "%~dp0%~n0%~x0" & exit



:DEATHEASTEREGG
rem :(
set "Hazimebuild=[0;22HMy version shouldn't be like this."
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
    ping -n 0 -w 500 localhost >nul
)
echo.& echo HELLO WORLD!!! (‰½‚©ƒL[‚ğ‰Ÿ‚µ‚Ä–ß‚é...)
exit /b



:batstarthelp
call :batbootcheckwinver dynamic
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
if "%input%" neq "" (
    if %len% equ 19 (
        echo [12;29H%input%
    ) else (
        echo [12;29H%input%[5m_[0m
    )
)
if not defined input (
  echo [12;29H[5m_[0m
)
if not defined dummy (echo [0;0H)
if "%wmodetoggle%"=="true" (echo [107;30m)
choice /c:0123456789bye /n >nul
set num=%errorlevel%
rem Check inputs
if %num% neq 0 set /a num=num-1
if %num%==10 if "%input%" neq "" set input=%input:~0,-1%&set /a len=len-1
if %num%==11 if "%input%"=="1908" (echo [17;28H³‚µ‚¢ƒpƒXƒR[ƒh‚Å‚·B&timeout /t 2 /nobreak >nul&echo [?25h&set invisiblecursor=&setlocal disabledelayedexpansion&set input=&set len=&set allcommandlock=false&goto :allcommandsmain) else (echo [17;12H•s³‰ğI Ä“x‚·ê‡‚É‚ÍAbatch‚ğÄ‹N“®‚µ‚Ä‚­‚¾‚³‚¢B&timeout /t 3 /nobreak >nul&set input=&set len=0&set allcommandlock=true&goto :hazimemenu)
if %num%==12 (
    if not defined dummy (
        setlocal disabledelayedexpansion&echo [?25h&set invisiblecursor=&set input=&set len=& goto :hazimemenu
    )
)
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
if "%wmodetoggle%"=="true" (set clr=[100m[97m&set clred=[91m&set clrgrn=[92m&set clryel=[93m&set clrmag=[95m&set clrgra=[90m&set clrcyan=[96m&set clr2=[0m[107m[30m)
if not defined dummy (set /p nothing=[?25l<nul)
cls
echo [Loading Command list...]
powershell -command "&{$h=Get-Host;$w=$h.UI.RawUI;$s=$w.BufferSize;$s.height=63;$w.BufferSize=$s;}"
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
echo           %clrcyan%-%clr2% bypassfirstboot   %clrgra%(bypassing first boot constraints.)%clr2%
echo           %clrcyan%-%clr2% setenter          %clrgra%(wets the enter count in main menu.)%clr2%
echo           %clrcyan%-%clr2% playdefboot       %clrgra%(playing first start animation.)%clr2%
echo           %clrcyan%-%clr2% crashtest         %clrgra%(will happen Intentionally crashes.)%clr2%
echo           %clrcyan%-%clr2% reload            %clrgra%(reloading settings.) %clr2%
echo           %clrcyan%-%clr2% openie            %clrgra%(trying open internet explorer.)%clr2%
echo           %clrcyan%-%clr2% counttestdeb      %clrgra%(enter the count test mode.)%clr2%
echo           %clrcyan%-%clr2% alldefnow1        %clrgra%(forced to enter alldefault.)%clr2%
echo           %clrcyan%-%clr2% funanimationdeb   %clrgra%(play rare boot animation.)%clr2%
echo           %clrcyan%-%clr2% windowsfiltertest %clrgra%(play bad win ver Warning.)%clr2%
echo           %clrcyan%-%clr2% reboot            %clrgra%(reboot this batch.)%clr2%
echo           %clrcyan%-%clr2% shutdown          %clrgra%(shutdown this bach.)%clr2%
echo.
echo            ^<%clrgrn%Easter egg purposes commands%clr2%^>
echo.
echo           %clrcyan%-%clr2% egg1             %clrgra%(play error message in alldef.)%clr2%
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
echo.
:acbatargmentsonly
echo                     %clred%[%clr2%Bat argument commands%clred%]%clr2%
echo.
echo            %clrcyan%-%clr2% help              %clrgra%(show available arguments.)%clr2%
echo            %clrcyan%-%clr2% enablesimpleboot  %clrgra%(boot up with Simple txt.)%clr2%
echo            %clrcyan%-%clr2% recovery          %clrgra%(boot up with recovery menu.)%clr2%
echo            %clrcyan%-%clr2% bypsbootpwsh      %clrgra%(bypass the powershell when boot.)%clr2%
echo            %clrcyan%-%clr2% bypsloadsg        %clrgra%(bypass the loading of settings.)%clr2%
echo            %clrcyan%-%clr2% bypsvck           %clrgra%(bypass the windows version check.)%clr2%
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
set clrcyan=
set clrgra=
set clred=
set clrgrn=
set clryel=
set clrmag=
if "%batargmentonly%"=="true" (set batargmentonly= &cls&exit /b)
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
if "%1"=="1" (start "ƒJ[ƒ\ƒ‹‘Ö‚¦" ^"%~dp0%~n0%~x0^" recovery& call :exit 0) else (start "ƒJ[ƒ\ƒ‹‘Ö‚¦" ^"%~dp0%~n0%~x0^"& call :exit 0)

:exit
if "%1"=="1" (echo ƒVƒƒƒbƒgƒ_ƒEƒ“’†...)
if "%1"=="2" (goto :batshutdown)
powershell -command "$pid1 = Get-WmiObject win32_process -filter processid=$pid | ForEach-Object{$_.parentprocessid;}";$pid2 = "Get-WmiObject win32_process -filter processid=$pid1 | ForEach-Object{$_.parentprocessid;}";$pid3 = "Get-WmiObject win32_process -filter processid=$pid2 | ForEach-Object{$_.parentprocessid;};exit $pid3"
>nul 2>&1 taskkill /pid %errorlevel% >nul
exit
:reboot


rem [‚ ‚È‚½‚Í‚º‚ñ‚Ô‚ÌƒR[ƒh‚ğ‚æ‚ñ‚¾]
rem ...
rem * ƒLƒ~  ‚æ‚Á‚Û‚Ç  ƒqƒ}‚È‚ñ‚¾‚ËB