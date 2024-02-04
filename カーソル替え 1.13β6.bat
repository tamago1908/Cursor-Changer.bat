@echo off
setlocal
rem ƒTƒCƒY‚Ìw’è
mode con: cols=75 lines=25
title ƒJ[ƒ\ƒ‹‘Ö‚¦
rem ƒJ[ƒ\ƒ‹‘Ö‚¦ by tamago_1908
rem “ú–{Œêƒo[ƒWƒ‡ƒ“

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


rem ‹N“®‚Ì“ú•t‚ğ—˜—p‚µ‚ÄƒƒbƒZ[ƒW‚ğ•\¦‚·‚éB‚»‚Ì‹Gß‚É‡‚Á‚½ƒƒbƒZ[ƒWB
rem exitƒƒjƒ…[‚ğƒI[ƒo[ƒŒƒC‰»‚·‚éB‹ï‘Ì“I‚É‚ÍÅ‰‚ÉŠDF‚Åƒƒjƒ…[‚ğ•\¦‚µ‚½‚Ì‚¿Aiecl‚ÌpswdƒƒbƒN‚Æ“¯‚¶•û®‚Å•`Ê‚·‚éB
rem İ’è‚Ì‰Šú‰»‚È‚Ç‚ÌÛ‚É—˜—p‚µ‚Ä‚¢‚é•”•ª‚ğŠÖ”‰»‚·‚é
rem ‚à‚¤­‚µŒ«‚¢•û–@‚Åİ’èƒtƒ@ƒCƒ‹‚È‚Ç‚Ì‰ü•Ï‚ğŒŸ’m‚·‚é
rem “ú–{Œê‰»‚Å‚«‚Ä‚¢‚È‚¢•”•ª‚ğ“ú–{Œê‰»‚·‚é
rem linux•—‚Ì‹N“®ƒAƒjƒ[ƒVƒ‡ƒ“‚ğÀ‘•‚·‚éB—á‚¦‚ÎA
rem [Info] (time) Linux-ish Boot Progress is just started.
rem [Info] (time) Error Tracking is Started.
rem [Info] (time) Argment_Loader is Starting...
rem [Info] (time) Argment_Loader is Ended.
rem [Info] (time) BatbootPowershell is Started with "Boot"
rem [Info] (time) BatbootPowershell is Ended.
rem [Error] (time) Error! BSOD_Loader is called with ID 0.


rem ƒXƒ^[ƒgƒAƒbƒvƒAƒjƒ[ƒVƒ‡ƒ“‚ÌƒC[ƒXƒ^[ƒGƒbƒO‚ğ‚à‚Á‚ÆÀ‘•‚·‚éB
rem ‹ï‘Ì“I‚É‚ÍA32768•ª‚Ì1‚ÌŠm—¦‚Å‹°‚ë‚µ‚¢‚à‚Ì‚ğÄ¶‚µA256•ª‚Ì1‚ÌŠm—¦‚ÅƒŠƒbƒNƒ[ƒ‹‚³‚¹‚éB
rem Œ»İÀ‘•‚³‚ê‚Ä‚¢‚éyoutubeŠÖ˜A‚Ìˆ—‚ğ‚·‚×‚Äíœ‚µ‚ÄAdogcheck‚Æstartup rickroll‚ğpowershell‚Ì‰¹ŠyÄ¶‚É’u‚«Š·‚¦‚éB
rem ‚à‚Á‚Æİ’è‚ğƒJƒeƒSƒiƒ‰ƒCƒY‚³‚¹‚éBbootanimation‚ÌƒJƒeƒSƒŠ[‚Æ‚©Bsetting5_1‚Æ‚©H

rem ƒJ[ƒ\ƒ‹‘Ö‚¦‚ğˆê‚Â‚Ì“Æ—§‚µ‚½cmd‚©‚çŒÄ‚Ño‚³‚¹‚Ä‹N“®‚³‚¹‚éB‚æ‚è—Ç‚¢ƒGƒ‰[ˆ—
rem ã‚ğÀ‘•‚·‚é‚¤‚¦‚Åˆê”ÔŠÈ’P‚È‚Ì‚Í‚ ‚ç‚©‚¶‚ßˆø”‚ğ—\–ñ‚³‚¹‚Ä‚¨‚­‚±‚ÆB—á‚¦‚ÎACSCG_BOOT_STARTERRORTRACKER‚Æ‚¢‚¤ˆø”‚ğ“n‚³‚¹‚é‚Æ‚©B

rem İ’è‚Ì“Ç‚İ‚İ‚ÌƒGƒ‰[‚ğŒŸo‚·‚é‚½‚ß‚ÉA–ˆİ’èƒ[ƒh‚É•Ï”‚ğİ’è‚·‚éBsetting_loader_errortracker‚Ì•Ï”‚ğ0‚Æ1‚Å
rem İ’è‚µ‚ÄA“Ç‚İ‚İ‚ÉƒGƒ‰[‚ª”­¶‚µ‚½ê‡‚É‚Í1‚Éİ’è‚³‚ê‚Ä‚¢‚È‚¢‚Æ‚¢‚¤‚±‚Æ‚ÅƒGƒ‰[ŒŸ’m‚µA“Ç‚İ‚İØ‚ê‚½‚Ì‚È‚ç1‚ÅƒGƒ‰[‚ª‚È‚¢‚Æ‚·‚éB
rem powershellˆ—•”•ª‚ÅAbatch‚ª‰ü•Ï‚³‚ê‚Ä‚¢‚é‚©‚Ç‚¤‚©‚ğŒŸ’m‚·‚é‹@”\‚ğ’Ç‰Á‚·‚éBİ’è‚Å‚»‚ê‚ğ–³Œø‚É‚Å‚«‚é‚æ‚¤‚É‚à‚·‚éB
rem ‚à‚Á‚Æ‹N“®‚ğ‘‚­‚·‚éB‹ï‘Ì“I‚É‚ÍAŒ»İ‚Ìƒo[‚Ìó‘Ô‚ğİ’è‚µ‚½uŠÔ‚Éexit /b‚Å‚«‚é‚æ‚¤‚É‚·‚éBcall‚Åİ’è‚·‚ê‚Î‚æ‚¢B


rem ”ñŒø—¦‚ÈGUI‚ğC³‚µ‚ÄAŒø—¦“I‚È‚à‚Ì‚É•ÏX‚·‚éB‚½‚¾‚µA’´d˜J“­B‚±‚ê‚ğ‚µ‚È‚¢‚Æ«—ˆ“I‚ÉŒã‰÷‚·‚é‚±‚Æ‚É‚È‚é‚Ì‚ÅA‚¹‚ß‚Äİ’è‚Æexit‚¾‚¯‚ÍŒø—¦“I‚É‚µ‚½‚¢B


rem Make sure to fill in the build number and version! Also, don't forget to put it in the archive!
title ƒJ[ƒ\ƒ‹‘Ö‚¦
rem VER v1.13ƒÀ6
set batver=1.13ƒÀ6
set batbuild=build 60
set batverdev=beta
set hazimeeaster=false
set firststartbat=no
set messagealreadyshowed=false
set batpath=%~0
cd /d %HOMEDRIVE%%HOMEPATH%

setlocal enabledelayedexpansion
>nul 2>&1 find "bootanimation=true" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
if "!errorlevel!"=="0" (
    >nul 2>&1 find "s5_rawboot=true" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
if not "!errorlevel!"=="0" (
>nul 2>&1 find "s5_linuxboot=true" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
if "!errorlevel!"=="0" (
    set linuxboot=true
>nul 2>&1 find "wmode=true" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
if "!errorlevel!"=="0" (set linuxishclr=[92m&set linuxishclr2=[107m[30m) 
>nul 2>&1 find "wmode=false" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
if "!errorlevel!"=="0" (set linuxishclr=[92m&set linuxishclr2=[0m)
) else (set linuxboot=false)
)
)

if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Linux-ish Boot Loader is just now started.)
>nul 2>&1 find "bootanimation=true" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
if "!errorlevel!"=="0" (
>nul 2>&1 find "s5_simpleboot=true" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
if "!errorlevel!"=="0" (
    set simpleboot=true
)
)
>nul 2>&1 find "bootanimation=true" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
if "!errorlevel!"=="0" (
>nul 2>&1 find "s5_rawboot=true" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
if "!errorlevel!"=="0" (
@echo on
)
)
setlocal disabledelayedexpansion
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Bootanimation Checked...)

:batstartErrortracker
rem I don't know why, but it seems that Argment_loader does not work within subroutines.
rem So, it is run once outside the subroutine and then returned to the subroutine for processing.
goto Argments_Loader
:batstarterrortrackermain
call :batstartErrortrackerstart

call :BSOD_Errors 0

goto :batstarterrortrackermain
:batstartErrortrackerstart
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Error_Tracker is started.)
set argmentloaded=
goto :Argments_Loaderend

:Argments_Loader
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Argment_Loader is started...)
rem ˆø”‚ª‚È‚¯‚ê‚ÎI—¹
if "%~1"=="" set argmentloaded=true& goto Argments_Loaderend
title ƒJ[ƒ\ƒ‹ˆø”
rem ˆø”‚ğ”z—ñ‚ÉŠi”[
setlocal enabledelayedexpansion
set i=0
for %%a in (%*) do (
  set /a i+=1
  set arg[!i!]=%%a
)

rem ”z—ñ‚Ì—v‘f”‚ğæ“¾
set n=%i%
rem ”z—ñ‚Ì—v‘f‚ğ‡”Ô‚Éˆ—
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
    if "!current!"=="bypsdisexit" (echo bypsdisexit‚ğ—LŒø‚É‚µ‚Ü‚µ‚½B&set disableexit=false&set argmentserror=false)
    if "!current!"=="enablesimpleboot" (echo simpleboot‚ğ—LŒø‚É‚µ‚Ü‚µ‚½B&set simpleboot=true&set argmentserror=false)
    if "!current!"=="devmode" (call :developermenu&set argmentserror=false)
    if "!current!"=="recovery" (echo recovery mode‚ğ—LŒø‚É‚µ‚Ü‚µ‚½B&set argmentserror=false&goto Cursor_Changer_REmenu)
    if "!current!"=="help" (title ˆø”‚Ìƒwƒ‹ƒv&call :batstarthelp&set argmentserror=false)
    if "!current!"=="bypsvck" (echo bypsvck‚ğ—LŒø‚É‚µ‚Ü‚µ‚½B&set bypasswinvercheck=true&set argmentserror=false)
    if "!current!"=="bypsadm" (echo bypsadm‚ğ—LŒø‚É‚µ‚Ü‚µ‚½B&set adminbypass=true&set adminbypass=false&set argmentserror=false)
    if "!current!"=="bypsloadsg" (echo bypsloadsg‚ğ—LŒø‚É‚µ‚Ü‚µ‚½B&set settingbypass=true&set argmentserror=false)
rem —áŠOˆ—
   if "!argmentserror!"=="" (title ƒJ[ƒ\ƒ‹ˆø” ƒGƒ‰[&echo •s–¾‚Èˆø”‚ªw’è‚³‚ê‚Ü‚µ‚½I^(!current!^) —LŒø‚Èˆø”‚ğw’è‚µ‚Ä‚­‚¾‚³‚¢B ^(‚»‚ê‚©A^"help^"‚ğ—˜—p‚µ‚Ä‚­‚¾‚³‚¢B^)
      )
    )
  )
    set argmentloaded=true
    timeout /t 3 /nobreak >nul
:Argments_Loaderend
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Argment_Loader is done.)
set n=
setlocal disabledelayedexpansion
if {%argmentloaded%}=={true} (set argmentloaded=&goto :batstarterrortrackermain)
set argmentserror=
if exist ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt (
setlocal enabledelayedexpansion
find "wmode=true" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul 
if {!errorlevel!}=={0} (color f0&set wmodetoggle=true) else (set wmodetoggle=false)
setlocal disabledelayedexpansion
) else (set wmodetoggle=false)

:batbootcheckwinver
ver | find /i "Version 10.0.23" > nul
if "%errorlevel%"=="0" (goto batbootcheckwinversafe)
ver | find /i "Version 10.0.22" > nul
if "%errorlevel%"=="0" (goto batbootcheckwinversafe)
ver | find /i "Version 10.0.105" > nul
if "%errorlevel%"=="0" (goto batbootcheckwinversafe)
ver | find /i "Version 10.0.102" > nul
if "%errorlevel%"=="0" (set windowsverfilter=windows10 1509&goto batbootcheckwinverbad)
ver | find /i "Version 10.0.10" > nul
if "%errorlevel%"=="0" (set windowsverfilter=windows10&goto batbootcheckwinverbad)
ver | find /i "Version 10.0.1" > nul
if "%errorlevel%"=="0" (goto batbootcheckwinversafe)
ver | find /i "Version 6.3." > nul
if "%errorlevel%"=="0" (set windowsverfilter=windows 8.1&goto batbootcheckwinverbad)
ver | find /i "Version 6.2." > nul
if "%errorlevel%"=="0" (set windowsverfilter=windows 8&goto batbootcheckwinverbad)
ver | find /i "Version 6.1." > nul
if "%errorlevel%"=="0" (set windowsverfilter=windows7&goto batbootcheckwinverbad) else (
set "windowsverfilter=ŒÃ‚·‚¬‚Ü‚·I"&goto batbootcheckwinverbad
)

:batbootcheckwinverbad
echo ‚¨g‚¢‚Ìwindows‚Ìƒo[ƒWƒ‡ƒ“(%windowsverfilter%)‚ÍƒJ[ƒ\ƒ‹‘Ö‚¦‚É‘Î‰‚µ‚Ä‚¢‚Ü‚¹‚ñI
pause
cls
echo ƒJ[ƒ\ƒ‹‘Ö‚¦‚Ì‘Î‰OS‚Íwindows 10 ƒo[ƒWƒ‡ƒ“ 1511ˆÈ~‚©‚ç‚Å‚·B
pause
cls
echo ‚»‚ê‚æ‚èŒÃ‚¢ƒo[ƒWƒ‡ƒ“i—á‚¦‚Îwindows 7‚âAwindows 8A8.1“™j‚Í‘Î‰‚µ‚Ä‚¢‚Ü‚¹‚ñB
pause
cls
echo ¡‚ ‚È‚½‚ª‚¨g‚¢‚Ìwindows‚ğƒAƒbƒvƒf[ƒg‚·‚é‚©AƒJ[ƒ\ƒ‹‘Ö‚¦ ƒo[ƒWƒ‡ƒ“1.12ˆÈ‘O‚ğ‚²—˜—p‚­‚¾‚³‚¢B
pause
exit
:batbootcheckwinversafe
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] WinverCheck is done.)

:batbootcheckpowershell
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Powershell Checking...)
rem check powershell is available
>nul 2>&1 powershell exit &&goto batbootcheckpowershellsafe
cls
echo powershell‚ÌŠm”F‚É¸”s‚µ‚Ü‚µ‚½I
pause
cls
echo ‚±‚ê‚ª•\¦‚³‚ê‚½‚Æ‚¢‚¤‚±‚Æ‚ÍA‚¨g‚¢‚ÌPC‚Épowershell‚ªƒCƒ“ƒXƒg[ƒ‹‚³‚ê‚Ä‚¢‚È‚¢‰Â”\«‚ª‚‚¢‚Æ‚¢‚¤‚±‚Æ‚Å‚·B
pause
cls
echo ƒJ[ƒ\ƒ‹‘Ö‚¦‚ğ“®ì‚³‚¹‚é‚É‚Ípowershell‚ª•K{‚Å‚·B
echo Windows 10 1511ˆÈ~‚Å‚Ípowershell 5.1‚ª•W€‚ÅƒCƒ“ƒXƒg[ƒ‹‚³‚ê‚Ä‚¢‚é‚½‚ßA‹°‚ç‚­ˆÓ}“I‚ÉƒAƒ“ƒCƒ“ƒXƒg[ƒ‹‚³‚ê‚Ä‚¢‚é‚©A—˜—p‚Å‚«‚È‚­‚È‚Á‚Ä‚¢‚é‰Â”\«‚ª‚‚¢‚Å‚µ‚å‚¤B
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
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Powershell Check is done.)
rem ƒJ[ƒ\ƒ‹‘Ö‚¦ˆ—‚ğÀs

rem –{ˆ— (•Ï”‚ÌƒZƒbƒg‚Æ‚©A‘O’iŠK)
set version=
set bootbatnow=yes
set exitbuttondisabled=false
rem ŠÇ—ÒŒ ŒÀ‚ğ•Û—L‚µ‚Ä‚¢‚é‚©‚ÌŠm”F
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
rem ŠÇ—ÒŒ ŒÀ‚ğ•Û—L‚µ‚Ä‚¢‚éó‘Ô‚ÅAexitƒ{ƒ^ƒ“‚ğ–³Œø‚É‚·‚é‚ÆA‹H‚ÉƒEƒCƒ‹ƒX‚Æ‚µ‚ÄŒŸo‚³‚ê‚Ä‚µ‚Ü‚¤ê‡‚ª‚ ‚éB‚È‚Ì‚ÅAŠÇ—ÒŒ ŒÀ•Û—L‚ÆAdisableexit‚Æ‚¢‚¤•Ï”‚ªfalse‚Ìê‡‚ÍAˆ—‚ğƒoƒCƒpƒX‚µ‚Ä‚¢‚éB
rem By the way, the reason why it is named disableexit is because this feature was a feature to disable the exit button in the beta version. After leaving beta, it was changed to disable maximization.
if exist ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt find "CheckUpdate=true" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
if {%errorlevel%}=={0} (set checkupdatetoggle=true&set batverforpowershell=%batver:ƒÀ=.b%) else (set checkupdatetoggle=false)
if {%disableexit%}=={false} (goto batbootdisabledexitbutton)

:batbootpowershell
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Batbootpowershell is started...)
set exitbuttondisabled=false
rem chenge the boot message if it is the first time, or if a value is defined in batbotpowershell, or at boot up
if not exist ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt set firststartbat=yes
if not "%linuxboot%"=="true" (
if not "%firststartbat%"=="yes" (
if {%bootbatnow%}=={yes} (title ƒJ[ƒ\ƒ‹‘Ö‚¦ €”õ’†...&echo ‚µ‚Î‚ç‚­‚¨‘Ò‚¿‚­‚¾‚³‚¢B)
) else (
    if not defined batbootpowershell (
        if not exist ‰‰ñƒJ[ƒ\ƒ‹.txt (
        echo ƒZƒbƒgƒAƒbƒv‚Ì€”õ‚ğ‚µ‚Ä‚¢‚Ü‚·...
        ) else (title ƒJ[ƒ\ƒ‹‘Ö‚¦ €”õ’†...&echo ‚µ‚Î‚ç‚­‚¨‘Ò‚¿‚­‚¾‚³‚¢B)
    )
)
)
rem startid~powershell ‚Ü‚Å‚ÌƒR[ƒh‚Í‚¸‚ç‚µ‚Ä‚Í‚¢‚¯‚È‚¢@‚»‚êˆÈ‘O‚©‚»‚êˆÈŒã‚È‚çok
:: StartID1908
call :getLineNumber startLine StartID1908 0
goto batbootpowershellendcode
:batbootpowershellcodestart
set /a startline=startline+5&set /a endline=endline-3
if "%batbootpowershell%"=="OOBEMusic" (start /min powershell.exe  -noexit -NoProfile -ExecutionPolicy Unrestricted "$s=[System.Management.Automation.ScriptBlock]::create((Get-Content \"%~f0\" -TotalCount $env:endline|Where-Object{$_.readcount -gt $env:startline }) -join \"`n\");&$s" %*&goto batbootdisabledexitbutton)
if "%checkupdatetoggle%"=="true" (for /f "delims=" %%a in ('powershell -NoProfile "$s=[System.Management.Automation.ScriptBlock]::create((Get-Content \"%~f0\" -TotalCount $env:endline|Where-Object{$_.readcount -gt $env:startline }) -join \"`n\");&$s" %*') do set Updateinfo=%%a&goto batbootdisabledexitbutton) else (powershell -NoProfile -ExecutionPolicy Unrestricted "$s=[System.Management.Automation.ScriptBlock]::create((Get-Content \"%~f0\" -TotalCount $env:endline|Where-Object{$_.readcount -gt $env:startline }) -join \"`n\");&$s" %*&goto batbootdisabledexitbutton)


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

# Define the function to check the update of ƒJ[ƒ\ƒ‹‘Ö‚¦ with github api
function Updater {
$repo = "https://api.github.com/repos/tamago1908/Cursor-Changer.bat/releases/latest"
try{$file = (Invoke-RestMethod -Uri $repo -Method Get -Headers @{'Accept'='application/vnd.github.v3+json'}).assets | Where-Object { $_.name -like "Cursor.Changer.*" }
}catch{if($_.Exception.Response.StatusCode.Value__ -eq 403){Write-Host "[ERROR] github‚ÌAPIƒŒ[ƒg§ŒÀ‚É“’B‚µ‚Ü‚µ‚½B‚±‚ê‚ªˆÓ–¡‚·‚é‚Ì‚Í—v‚·‚é‚ÉAˆêŠÔˆÈ“à‚É‘å—Ê‚ÉƒAƒbƒvƒf[ƒg‚ğŠm”F‚µ‰ß‚¬A‚Æ‚¢‚¤‚±‚Æ‚Å‚·BˆêŠÔ‚Ù‚ÇŠÔ‚ğ’u‚¢‚½‚Ì‚¿AÄ“xƒAƒbƒvƒf[ƒg‚ğŠm”F‚µ‚Ä‚­‚¾‚³‚¢B" -foregroundcolor red}else{Write-Host "[ERROR] ‰½‚ç‚©‚ÌƒGƒ‰[‚ª”­¶‚µ‚Ü‚µ‚½BƒCƒ“ƒ^[ƒlƒbƒgÚ‘±‚ğŠm”F‚·‚é‚©Agithub‚ÌƒT[ƒo[‚ª—‚¿‚Ä‚¢‚È‚¢‚©‚ğŠm”F‚µ‚½‚Ì‚¿AÄ“x‚µ‚Ä‚­‚¾‚³‚¢B`nƒGƒ‰[ƒƒO : $_" -foregroundcolor red};break}
$fileVersion = $file.name -replace "Cursor\.Changer\.|\.bat", ""
$batVersion = "$env:batverforpowershell", ""
$batName = Get-Item "ƒJ[ƒ\ƒ‹‘Ö‚¦ *.bat"

if ("$fileVersion" -eq "$env:batverforpowershell") {return "null";break}

if ($file.name -match "^Cursor\.Changer\..*\.bat$") {
    $fileverArray = $fileVersion -split "\."
    $batverArray = $batVersion -split "\."


    # Check if the file version is beta
    if ($fileverArray[-1] -match "^[a-z][0-9]+$") {
        $isFileBeta = $true
    }
    else {
        $isFileBeta = $false
    }

    # Check if the bat version is beta
    if ($batverArray[-1] -match "^[a-z][0-9]+$") {
        $isBatBeta = $true
    }
    else {
        $isBatBeta = $false
    }

    for ($i = 0; $i -lt [Math]::Max($fileverArray.Length, $batverArray.Length); $i++) {
        # Cast the elements to int if possible
        if ($fileverArray[$i] -as [int]) {
            $fileElement = [int]$fileverArray[$i]
        }
        else {
            $fileElement = $fileverArray[$i]
        }

        if ($batverArray[$i] -as [int]) {
            $batElement = [int]$batverArray[$i]
        }
        else {
            $batElement = $batverArray[$i]
        }

        if ($isFileBeta -eq $isBatBeta) {
            cls
            # Compare the elements as usual
            if ($fileElement -gt $batElement) {
            if ($batElement -ge $FileElement -or (-not $batElement -lt $FileElement)) {return "null";break}
            return "batbeta=$isfileBeta,updateavailable=true,updatemyversion=$batVersion,updateversion=$fileVersion"

            break # Exit the loop
            }
            
        }
        elseif ($isFileBeta -and -not $isBatBeta) {
            cls
            $fileElementsplit = $fileVersion -split "\."
            $batElementsplit = $batVersion -split "\."
            $fileElementsplit = [int]$fileElementsplit[2].Substring(1)
            $batElementsplit = [int]$batElementsplit[2].Substring(1)
            if ($batElementsplit -gt $fileElementsplit) {
                return "null";break
            }
            return "batbeta=$isfileBeta,updateavailable=true,updatemyversion=$batVersion,updateversion=$fileVersion"

       break # Exit the loop
        }
        
    }
}

            function Doupdate {
                $downloadFolder = Join-Path $env:USERPROFILE "Downloads"
                $downloadFile = Join-Path $downloadFolder $file.name
                Invoke-WebRequest -Uri $file.url -OutFile $downloadFile -Headers @{'Accept'='application/octet-stream'}
                $newBatName = "Cursor.Changer.$fileVersion.bat"
                Move-Item $downloadFile (Join-Path (Split-Path $batName) ("$newBatName")) -Force
                Remove-Item "Cursor.Changer.$batVersion.bat" -Force
            }
    }


function Fullupdater {
Write-Host "ƒAƒbƒvƒf[ƒg‚ğŠm”F‚µ‚Ä‚¢‚Ü‚·..."
#check the update of ƒJ[ƒ\ƒ‹‘Ö‚¦ with github api, and Update it.
$repo = "https://api.github.com/repos/tamago1908/Cursor-Changer.bat/releases/latest"
try{$file = (Invoke-RestMethod -Uri $repo -Method Get -Headers @{'Accept'='application/vnd.github.v3+json'}).assets | Where-Object { $_.name -like "Cursor.Changer.*" }
}catch{if($_.Exception.Response.StatusCode.Value__ -eq 403){Write-Host "[ERROR] github‚ÌAPIƒŒ[ƒg§ŒÀ‚É“’B‚µ‚Ü‚µ‚½B‚±‚ê‚ªˆÓ–¡‚·‚é‚Ì‚Í—v‚·‚é‚ÉAˆêŠÔˆÈ“à‚É‘å—Ê‚ÉƒAƒbƒvƒf[ƒg‚ğŠm”F‚µ‰ß‚¬A‚Æ‚¢‚¤‚±‚Æ‚Å‚·BˆêŠÔ‚Ù‚ÇŠÔ‚ğ’u‚¢‚½‚Ì‚¿AÄ“xƒAƒbƒvƒf[ƒg‚ğŠm”F‚µ‚Ä‚­‚¾‚³‚¢B" -foregroundcolor red}else{Write-Host "[ERROR] ‰½‚ç‚©‚ÌƒGƒ‰[‚ª”­¶‚µ‚Ü‚µ‚½BƒCƒ“ƒ^[ƒlƒbƒgÚ‘±‚ğŠm”F‚·‚é‚©Agithub‚ÌƒT[ƒo[‚ª—‚¿‚Ä‚¢‚È‚¢‚©‚ğŠm”F‚µ‚½‚Ì‚¿AÄ“x‚µ‚Ä‚­‚¾‚³‚¢B`nƒGƒ‰[ƒƒO : $_" -foregroundcolor red};break}
$fileVersion = $file.name -replace "Cursor.Changer\.|\.bat", ""
$batVersion = (Get-Item "ƒJ[ƒ\ƒ‹‘Ö‚¦ *.bat").name -replace "ƒJ[ƒ\ƒ‹‘Ö‚¦ |\.bat", ""
$batName = Get-Item "ƒJ[ƒ\ƒ‹‘Ö‚¦ *.bat"

if ( -not ($fileVerarray -eq $batVerarray)) {
if ($file.name -match "^Cursor\.Changer\..*\.bat$") {
    $fileverArray = $fileVersion -split "\."
    $batverArray = $batVersion -split "\."


    # Check if the file version is beta
    if ($fileverArray[-1] -match "^[a-z][0-9]+$") {
        $isFileBeta = $true
    }
    else {
        $isFileBeta = $false
    }

    # Check if the bat version is beta
    if ($batverArray[-1] -match "^[a-z][0-9]+$") {
        $isBatBeta = $true
    }
    else {
        $isBatBeta = $false
    }

    for ($i = 0; $i -lt [Math]::Max($fileverArray.Length, $batverArray.Length); $i++) {
        # Cast the elements to int if possible
        if ($fileverArray[$i] -as [int]) {
            $fileElement = [int]$fileverArray[$i]
        }
        else {
            $fileElement = $fileverArray[$i]
        }

        if ($batverArray[$i] -as [int]) {
            $batElement = [int]$batverArray[$i]
        }
        else {
            $batElement = $batverArray[$i]
        }

        if ($isFileBeta -eq $isBatBeta) {
         cls
            # Compare the elements as usual
            if ($fileElement -gt $batElement) {
            # The file version is beta and the bat version is not, so the file version is newer
            Write-Host "ƒAƒbƒvƒf[ƒg‚ª—˜—p‰Â”\‚Å‚·BŒ»İ‚Ìƒo[ƒWƒ‡ƒ“‚ÍA `"$($batVersion)`"‚ÅAƒAƒbƒvƒf[ƒg‚³‚ê‚½ƒo[ƒWƒ‡ƒ“‚Í `"$($fileVersion)`"‚Å‚·B" `n
            Start-Sleep 1
            powershell {$h=Get-Host;$w=$h.UI.RawUI;$s=$w.BufferSize;$s.height=62;$w.BufferSize=$s;}
try{if($env:wmodetoggle -eq "false"){Write-Host "ƒ`ƒFƒ“ƒWƒƒO :" -foregroundcolor white}elseif($env:wmodetoggle -eq "true"){Write-Host "ƒ`ƒFƒ“ƒWƒƒO :" -foregroundcolor black }else{Write-Host "ƒ`ƒFƒ“ƒWƒƒO :" -foregroundcolor white};$e=[char]27;$clr="$e[7m";$clred="$e[91m";$clrgrn="$e[92m";$clryel="$e[93m";$clrmag="$e[95m";$clrgra="$e[90m";$clrcyan="$e[96m";$c="$e[0m";if($env:wmodetoggle -eq "true"){$clr="$e[100m$e[97m";$c="$e[0m$e[107m$e[30m"};foreach($s in (irm -Uri "https://api.github.com/repos/tamago1908/Cursor-Changer.bat/releases/latest").body -split '\r\n'){if($s -match "####"){write-host "$clrcyan$e[1m$($s -replace '(^\#+)|(\#+$)', '')$c" `n -NoNewline}elseif($s -match ">"){write-host "$clred$($s -replace '\>', '')$c" `n -NoNewline}elseif($s -match "###"){write-host "$clryel$e[1m$($s -replace '(^\#+)|(\#+$)', '')$c" `n -NoNewline}elseif($s -match "___"){write-host "$clrgra--------------------------------------------------$c" `n -NoNewline}else{$s=$s -replace "\*{3}(.+?)\*{3}", "$e[3m;1m`$1$c";$s=$s -replace "\*{2}(.+?)\*{2}", "$e[1m`$1$c";$s=$s -replace "^\s*-(\s+)(.*)", "$clred-$c`$1`$2";$s=$s -replace "\*+", "";write-host "$s" `n -NoNewline}};write-host "";rv e,clr,clred,clrgrn,clryel,clrmag,clrgra,clrcyan,c,s}catch{if($_.Exception.Response.StatusCode.Value__ -eq 403){Write-Host "[ERROR] github‚ÌAPIƒŒ[ƒg§ŒÀ‚É“’B‚µ‚Ü‚µ‚½B‚±‚ê‚ªˆÓ–¡‚·‚é‚Ì‚Í—v‚·‚é‚ÉAˆêŠÔˆÈ“à‚É‘å—Ê‚ÉƒAƒbƒvƒf[ƒg‚ğŠm”F‚µ‰ß‚¬A‚Æ‚¢‚¤‚±‚Æ‚Å‚·BˆêŠÔ‚Ù‚ÇŠÔ‚ğ’u‚¢‚½‚Ì‚¿AÄ“xƒAƒbƒvƒf[ƒg‚ğŠm”F‚µ‚Ä‚­‚¾‚³‚¢B" -foregroundcolor red}else{Write-Host "[ERROR] ‰½‚ç‚©‚ÌƒGƒ‰[‚ª”­¶‚µ‚Ü‚µ‚½BƒCƒ“ƒ^[ƒlƒbƒgÚ‘±‚ğŠm”F‚·‚é‚©Agithub‚ÌƒT[ƒo[‚ª—‚¿‚Ä‚¢‚È‚¢‚©‚ğŠm”F‚µ‚½‚Ì‚¿AÄ“x‚µ‚Ä‚­‚¾‚³‚¢B`nƒGƒ‰[ƒƒO : $_" -foregroundcolor red};break}
            Start-Sleep 2

             if ($isFileBeta -eq "true") {
            $e=[char]27
            $clrgra="$e[90m"
            $c="$e[0m"
            Write-Host "$clrgra[TIP] ‚±‚ÌƒAƒbƒvƒf[ƒg‚Íƒx[ƒ^”Å‚Å‚·B‚È‚Ì‚ÅAˆê•”•sˆÀ’è‚È•”•ª‚ª‚ ‚é‰Â”\«‚ª‚ ‚è‚Ü‚·B$c"
            rv clrgra,c,e
            }
                $answer = Read-Host "ƒAƒbƒvƒf[ƒg‚µ‚Ü‚·‚©H ®AƒAƒbƒvƒf[ƒg‚ğƒCƒ“ƒXƒg[ƒ‹‚·‚é‚Æ‹­§“I‚É‰pŒê”Å‚Ö‚Æ•ÏX‚³‚ê‚Ü‚·B(y or n)"
                if ($answer -eq "y") {
                $downloadFolder = Join-Path $env:USERPROFILE "Downloads"
                $downloadFile = Join-Path $downloadFolder $file.name
                Invoke-WebRequest -Uri $file.url -OutFile $downloadFile -Headers @{'Accept'='application/octet-stream'}
                $newBatName = "Cursor.Changer.$fileVersion.bat"
                Move-Item $downloadFile (Join-Path (Split-Path $batName) ("$newBatName")) -Force
                Remove-Item "Cursor.Changer.$batVersion.bat" -Force

                    Write-Host "ƒAƒbƒvƒf[ƒg‚ÍŠ®—¹‚µ‚Ü‚µ‚½B"
                    Start-Sleep 2

                    break
                }
                else {
                    Write-Host "ƒAƒbƒvƒf[ƒg‚ÍƒLƒƒƒ“ƒZƒ‹‚³‚ê‚Ü‚µ‚½B"
                    Start-Sleep 2
                    break
                }
            }
            elseif ($fileElement -lt $batElement) {
                Write-Host "[ERROR] ‚ ‚È‚½‚Ìƒo[ƒWƒ‡ƒ“(`"$($batVersion)`")‚ÍAƒAƒbƒvƒf[ƒgƒtƒ@ƒCƒ‹‚æ‚è‚àæs (`"$($fileVersion)`")‚µ‚Ä‚¢‚Ü‚·I(‹°‚ç‚­A‚ ‚È‚½‚ÍƒJ[ƒ\ƒ‹‘Ö‚¦‚Ìƒo[ƒWƒ‡ƒ“‚ğŒÌˆÓ‚É•Ï‚¦‚½‚Ì‚Å‚µ‚å‚¤...)" -ForegroundColor Red 
                Start-Sleep 2
                break
            }
        }
        elseif ($isFileBeta -and -not $isBatBeta) {
        cls
            # The file version is beta and the bat version is not, so the file version is newer
            Write-Host "ƒAƒbƒvƒf[ƒg‚ª—˜—p‰Â”\‚Å‚·BŒ»İ‚Ìƒo[ƒWƒ‡ƒ“‚ÍA `"$($batVersion)`"‚ÅAƒAƒbƒvƒf[ƒg‚³‚ê‚½ƒo[ƒWƒ‡ƒ“‚Í `"$($fileVersion)`"‚Å‚·B" `n
            Start-Sleep 1
            powershell {$h=Get-Host;$w=$h.UI.RawUI;$s=$w.BufferSize;$s.height=62;$w.BufferSize=$s;}
try{if($env:wmodetoggle -eq "false"){Write-Host "ƒ`ƒFƒ“ƒWƒƒO :" -foregroundcolor white}elseif($env:wmodetoggle -eq "true"){Write-Host "ƒ`ƒFƒ“ƒWƒƒO :" -foregroundcolor black }else{Write-Host "ƒ`ƒFƒ“ƒWƒƒO :" -foregroundcolor white};$e=[char]27;$clr="$e[7m";$clred="$e[91m";$clrgrn="$e[92m";$clryel="$e[93m";$clrmag="$e[95m";$clrgra="$e[90m";$clrcyan="$e[96m";$c="$e[0m";if($env:wmodetoggle -eq "true"){$clr="$e[100m$e[97m";$c="$e[0m$e[107m$e[30m"};foreach($s in (irm -Uri "https://api.github.com/repos/tamago1908/Cursor-Changer.bat/releases/latest").body -split '\r\n'){if($s -match "####"){write-host "$clrcyan$e[1m$($s -replace '(^\#+)|(\#+$)', '')$c" `n -NoNewline}elseif($s -match ">"){write-host "$clred$($s -replace '\>', '')$c" `n -NoNewline}elseif($s -match "###"){write-host "$clryel$e[1m$($s -replace '(^\#+)|(\#+$)', '')$c" `n -NoNewline}elseif($s -match "___"){write-host "$clrgra--------------------------------------------------$c" `n -NoNewline}else{$s=$s -replace "\*{3}(.+?)\*{3}", "$e[3m;1m`$1$c";$s=$s -replace "\*{2}(.+?)\*{2}", "$e[1m`$1$c";$s=$s -replace "^\s*-(\s+)(.*)", "$clred-$c`$1`$2";$s=$s -replace "\*+", "";write-host "$s" `n -NoNewline}};write-host "";rv e,clr,clred,clrgrn,clryel,clrmag,clrgra,clrcyan,c,s}catch{if($_.Exception.Response.StatusCode.Value__ -eq 403){Write-Host "[ERROR] github‚ÌAPIƒŒ[ƒg§ŒÀ‚É“’B‚µ‚Ü‚µ‚½B‚±‚ê‚ªˆÓ–¡‚·‚é‚Ì‚Í—v‚·‚é‚ÉAˆêŠÔˆÈ“à‚É‘å—Ê‚ÉƒAƒbƒvƒf[ƒg‚ğŠm”F‚µ‰ß‚¬A‚Æ‚¢‚¤‚±‚Æ‚Å‚·BˆêŠÔ‚Ù‚ÇŠÔ‚ğ’u‚¢‚½‚Ì‚¿AÄ“xƒAƒbƒvƒf[ƒg‚ğŠm”F‚µ‚Ä‚­‚¾‚³‚¢B" -foregroundcolor red}else{Write-Host "[ERROR] ‰½‚ç‚©‚ÌƒGƒ‰[‚ª”­¶‚µ‚Ü‚µ‚½BƒCƒ“ƒ^[ƒlƒbƒgÚ‘±‚ğŠm”F‚·‚é‚©Agithub‚ÌƒT[ƒo[‚ª—‚¿‚Ä‚¢‚È‚¢‚©‚ğŠm”F‚µ‚½‚Ì‚¿AÄ“x‚µ‚Ä‚­‚¾‚³‚¢B`nƒGƒ‰[ƒƒO : $_" -foregroundcolor red};break}
            Start-Sleep 2

             if ($isFileBeta -eq "true") {
            $e=[char]27
            $clrgra="$e[90m"
            $c="$e[0m"
            Write-Host "$clrgra[TIP] ‚±‚ÌƒAƒbƒvƒf[ƒg‚Íƒx[ƒ^”Å‚Å‚·B‚È‚Ì‚ÅAˆê•”•sˆÀ’è‚È•”•ª‚ª‚ ‚é‰Â”\«‚ª‚ ‚è‚Ü‚·B$c"
            rv clrgra,c,e
            }

            $answer = Read-Host "ƒAƒbƒvƒf[ƒg‚µ‚Ü‚·‚©H®AƒAƒbƒvƒf[ƒg‚ğƒCƒ“ƒXƒg[ƒ‹‚·‚é‚Æ‹­§“I‚É‰pŒê”Å‚Ö‚Æ•ÏX‚³‚ê‚Ü‚·B (y or n)"
            if ($answer -eq "y") {
                $downloadFolder = Join-Path $env:USERPROFILE "Downloads"
                $downloadFile = Join-Path $downloadFolder $file.name
                Invoke-WebRequest -Uri $file.url -OutFile $downloadFile -Headers @{'Accept'='application/octet-stream'}
                $newBatName = "Cursor.Changer.$fileVersion.bat"
                Move-Item $downloadFile (Join-Path (Split-Path $batName) ("$newBatName")) -Force
                Remove-Item "Cursor.Changer.$batVersion.bat" -Force

                Write-Host "ƒAƒbƒvƒf[ƒg‚ÍŠ®—¹‚µ‚Ü‚µ‚½B"
                Start-Sleep 2

                break
            }
            else {
                Write-Host "ƒAƒbƒvƒf[ƒg‚ğƒLƒƒƒ“ƒZƒ‹‚µ‚Ü‚µ‚½B"
                Start-Sleep 2
                break
            }
        }
        elseif (-not $isFileBeta -and $isBatBeta) {
            # The file version is not beta and the bat version is beta, so the bat version is newer
            Write-Host "[ERROR] ‚ ‚È‚½‚Ìƒo[ƒWƒ‡ƒ“(`"$($batVersion)`")‚ÍAƒAƒbƒvƒf[ƒgƒtƒ@ƒCƒ‹‚æ‚è‚àæs (`"$($fileVersion)`")‚µ‚Ä‚¢‚Ü‚·I(‹°‚ç‚­A‚ ‚È‚½‚ÍƒJ[ƒ\ƒ‹‘Ö‚¦‚Ìƒo[ƒWƒ‡ƒ“‚ğŒÌˆÓ‚É•Ï‚¦‚½‚Ì‚Å‚µ‚å‚¤...)" -ForegroundColor Red 
            Start-Sleep 2
            break
        }
    }
}
    if ($i -eq [Math]::Max($fileverArray.Length, $batverArray.Length)) {
        Write-Host "‚·‚Å‚ÉÅVƒo[ƒWƒ‡ƒ“‚Å‚·I (`"$($batVersion)`") ƒAƒbƒvƒf[ƒg‚Í•K—v‚ ‚è‚Ü‚¹‚ñB"
        Start-Sleep 2
    }
}
}

function OOBEMusic {
$webClient = New-Object System.Net.WebClient
Write-Host "‰¹Šy‚ğƒ_ƒEƒ“ƒ[ƒh’†..."
try{$data = $webClient.DownloadData("https://raw.githubusercontent.com/tamago1908/Cursor-Changer.bat/main/resource/Windows_XP_OOBE_for_Cursor_Changer.wav")
}catch{if($_.Exception.Response.StatusCode.Value__ -eq 403){Write-Host "[ERROR] github‚ÌAPIƒŒ[ƒgƒŠƒ~ƒbƒg‚É“’B‚µ‚Ü‚µ‚½I‚±‚ê‚ªˆÓ–¡‚·‚é‚Ì‚Í—v‚·‚é‚É‚ ‚È‚½‚Í‰¹Šy‚ğÄ¶‚µ‰ß‚¬‚½‚Æ‚¢‚¤‚±‚Æ‚Å‚·B‰¹Šy‚È‚µ‚Å‘±s‚·‚é‚©AˆêŠÔ‚Ù‚ÇŒã‚É‚à‚¤ˆê“x‚â‚è’¼‚µ‚Ä‚­‚¾‚³‚¢B" -foregroundcolor red}else{Write-Host "[ERROR] ‰½‚ç‚©‚ÌƒGƒ‰[‚ª”­¶‚µ‚Ü‚µ‚½BƒCƒ“ƒ^[ƒlƒbƒgÚ‘±‚ğŠm”F‚·‚é‚©Agithub‚ÌƒT[ƒo[‚ª—‚¿‚Ä‚¢‚È‚¢‚©‚ğŠm”F‚µ‚½‚Ì‚¿AÄ“x‚µ‚Ä‚­‚¾‚³‚¢B`nƒGƒ‰[ƒƒO : $_" -foregroundcolor red};write-host "enter something to exit...";$host.UI.RawUI.ReadKey();exit}
Write-Host "ƒ_ƒEƒ“ƒ[ƒh¬Œ÷I    ‚½‚Ô‚ñ....."
# maybe useable    Start-Process -FilePath "powershell" -ArgumentList "-Command","Add-Type -AssemblyName System.Windows.Forms;`$result = [System.Windows.Forms.MessageBox]::Show('Download Complete. have fun.', '', 'OK', 'Exclamation');exit `$result;"

Add-Type -TypeDefinition @"
using System;
using System.IO;
using System.Net;

namespace ConsoleApp
{
    public class Program
    {
        public static void PlayAudioFromBytes(byte[] data)
        {
            MemoryStream stream = new MemoryStream();
            stream.Write(data, 0, data.Length);
            stream.Position = 0; 
            System.Media.SoundPlayer player = new System.Media.SoundPlayer(stream);
            player.PlayLooping(); 
        }
    }
}
"@
[ConsoleApp.Program]::PlayAudioFromBytes($data)
cls
Write-Host "‰¹Šy‚ğÄ¶‚µ‚Ä‚¢‚Ü‚·...(Œ»İ—¬‚ê‚Ä‚¢‚éWindows XP OOBE BGM)`n‰¹Šy‚ğ~‚ß‚½‚¢ê‡A‚±‚ÌpowershellƒEƒBƒ“ƒhƒE‚ğI—¹‚µ‚Ä‚­‚¾‚³‚¢B"
while ($true) {
$cmd = Get-Process -Name cmd -ErrorAction SilentlyContinue
if (-not $cmd) {
    $player.Stop()
    exit
     }
}
}

    if ($env:batbootpowershell -eq "Fullupdater") {Fullupdater}
if ($env:batbootpowershell -eq "Disablemax") {Disablemax}
if ($env:batbootpowershell -eq "OOBEMusic") {OOBEMusic}
if ($env:batbootpowershell -eq "Updater") {Updater}
if ($env:batbootpowershell -eq "Doupdate") {Doupdate} elseif ($env:checkupdatetoggle -eq "true") {Disablemax; Updater} elseif ($env:checkupdatetoggle -eq "false") {Disablemax}

:batbootpowershellendcode
:: EndID1908
call :getLineNumber endLine EndID1908 0
if {%exitbuttondisabled%}=={false} (set exitbuttondisabled=true&goto batbootpowershellcodestart) else (goto :batbootdisabledexitbutton)

:GetLineNumber <resultVar> <uniqueID> [LineOffset]
SETLOCAL
for /F "usebackq tokens=1 delims=:" %%L IN (`findstr /N "%~2" "%~f0"`) DO set /a lineNr=%~3 + %%L
(
ENDLOCAL
 set "%~1=%LineNr%"
 exit /b
)

rem –{ˆ—
:batbootdisabledexitbutton
set startline=&set endline=&set exitbuttondisabled=
if {%bootbatnow%}=={no} (exit /b)
if "%batbootpowershell%"=="OOBEMusic" (exit /b)
rem get updater variable
if "%checkupdatetoggle%"=="true" (goto batbootpowershell_get_updater_variable) else (goto batbootpowershell_get_updater_variable_end)

:batbootpowershell_get_updater_variable
rem powershell‚Ì–ß‚è’l‚ğbatch‚Ì•Ï”‚É•ÏŠ·
setlocal enabledelayedexpansion
if "%updateinfo%"=="null" (goto batbootpowershell_get_updater_variable_end)
for /f "tokens=1-4 delims=," %%a in ("%updateinfo%") do (
  for /f "tokens=1-2 delims==" %%x in ("%%a") do set "%%x=%%y"&for /f "tokens=1-2 delims==" %%x in ("%%b") do set "%%x=%%y"&for /f "tokens=1-2 delims==" %%x in ("%%c") do set "%%x=%%y"&for /f "tokens=1-2 delims==" %%x in ("%%d") do set "%%x=%%y"
)
setlocal disabledelayedexpansion
set updatemyversion=%batver:ƒÀ=.b% & rem this is so idiot. guess powershell should have used this method to handle the bat version, but it is what it is. However, it is something that needs to be fixed, so I may fix it soon, maybe.
set batverforpowershell=
:batbootpowershell_get_updater_variable_end

set updateinfo=
set checkupdatetoggle=

:batbootpowershell_get_updater_variable_end
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Batbootpowershell is Ended...)
cd /d %HOMEDRIVE%%HOMEPATH%

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
rem ‚Ü‚½A¡‰ñ‚ÌƒAƒbƒvƒf[ƒg‚É‚æ‚Á‚ÄA‰‰ñƒJ[ƒ\ƒ‹.txt‚É‚àdogcheck‚ª’Ç‰Á‚³‚ê‚½‚Ì‚ÅA‚Ü‚Ÿİ’èƒtƒ@ƒCƒ‹‚ğ“r’†‚Åíœ‚µ‚½‚è‚È‚ñ‚Ä‚±‚Æ‚ª‚µ‚É‚­‚­‚È‚Á‚½B

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
rem ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt‚ÉŠÜ‚Ü‚ê‚Ä‚¢‚éİ’è‚ª‘S•”Œ‡‘¹‚µ‚Ä‚¢‚éê‡‚ÍAƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt‚ğì¬‚µ‚È‚¨‚·‹@”\B
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
    echo [%linuxishclr%info%linuxishclr2%] Bootloader ended
echo.
timeout /t 1 /nobreak >nul
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Mobas_Loader Calling...)
timeout /t 2 /nobreak >nul
)
)
rem Detects whether this is the first start
if exist ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt set firststartbat=no&set bootbatnow=yes&goto :batstart
if not exist ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt (
if exist ‰‰ñƒJ[ƒ\ƒ‹.txt goto settingloads
)

:CursorChangerOOBEdev
rem Now, it's the beginning of a fucking trashy long goofy ahh idiot code.
title ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% Setup
if {%wmodetoggle%}=={false} (set clr=[3m[97m&set clrhigh=[7m&set clrhighend=[0m&set clrwhi=[48;5;250m[30m&set clr2=[0m)
if not defined {%clrgra%} (set clrgra=[90m)
if {%wmodetoggle%}=={false} (set moveline=[22;0H) else (set moveline=[22;0H)
if not defined invisiblecursor (echo [?25l&set invisiblecursor=true)
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
if %ErrorLevel%==1 goto OOBEmain
if %ErrorLevel%==2 goto OOBESkip
if %ErrorLevel%==3 call :OOBEmainblank&timeout /t 1 /nobreak >nul&exit

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
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&set oobetheme=dark&set OOBEsetting1toggle=true&set OOBEsetting2toggle=false&set OOBEsetting3toggle=false&set OOBEsetting4toggle=true&set OOBEsetting5toggle=true&goto OOBEmain8
if %ErrorLevel%==2 color 07&cls&goto CursorChangerOOBE
if %ErrorLevel%==3 color 07&cls&goto CursorChangerOOBE

:OOBEmain
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
echo          ‚±‚Ì‹@”\‚É‚ÍƒCƒ“ƒ^[ƒlƒbƒgÚ‘±‚ª•K—v‚Å‚·B
echo          ƒCƒ“ƒ^[ƒlƒbƒgÚ‘±‚ª‚È‚¢ê‡‚É‚ÍNƒL[‚ğ‰Ÿ‚µ‚Ä‚­‚¾‚³‚¢B
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
if %ErrorLevel%==1 goto OOBEmainmusic
if %ErrorLevel%==2 call :OOBEmainblank&timeout /t 1 /nobreak >nul&goto OOBEmain2


:OOBEmainmusic
call :OOBEmainmusicmessage
set batbootpowershell=OOBEMusic&call :batbootpowershell
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
echo          ƒCƒ“ƒ^[ƒlƒbƒgÚ‘±‚ª‚ ‚é‚©‚Ç‚¤‚©
echo          ƒAƒ“ƒ`ƒEƒBƒ‹ƒXƒ\ƒtƒg‚ğŠm”F‚·‚é
echo          Github‚ª—LŒø‚©‚Ç‚¤‚©Šm”F‚·‚é
echo          Github‚ÌAPIƒŒ[ƒg§ŒÀ‚É“’B‚µ‚Ä‚¢‚È‚¢‚©‚Ç‚¤‚©
echo          Powershell‚ª—˜—p‰Â”\‚©‚Ç‚¤‚©
echo.
echo          (5•bŒã‚ÉƒZƒbƒgƒAƒbƒv‚ğ‘±s‚µ‚Ü‚·)
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
echo          ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt‚Æ‰‰ñƒJ[ƒ\ƒ‹.txt‚Ì“ñ‚Â‚Å‚·B
echo.
echo          ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt‚ÍƒJ[ƒ\ƒ‹‘Ö‚¦‚Ìİ’è‚ğ•Û‘¶‚µ‚Ä‚¢‚Ü‚·B
echo          ‚±‚Ìƒtƒ@ƒCƒ‹‚Í”ñí‚Éd—v‚Èƒtƒ@ƒCƒ‹‚Å‚·B
echo.
echo          ‰‰ñƒJ[ƒ\ƒ‹.txt‚ÍƒJ[ƒ\ƒ‹‚ğ•ÏX‚µ‚½‚©‚Ç‚¤‚©‚Ì”»’è‚É—˜—p‚µ‚Ä‚¢‚Ü‚·B
echo          ‚±‚ê‚à‚Ü‚½d—v‚Èƒtƒ@ƒCƒ‹‚Å‚·B
echo.
echo          ‚à‚µƒ†[ƒU[(%USERNAME%A‚ ‚È‚½‚Å‚·)‚ª‚±‚ê‚ç‚Ìƒtƒ@ƒCƒ‹‚ğíœ‚·‚é‚ÆA
echo          ‚±‚ÌƒJ[ƒ\ƒ‹‘Ö‚¦‚Í³í‚É“®ì‚µ‚È‚­‚È‚éê‡‚ª‚ ‚è‚Ü‚·B
echo          ‚Å‚·‚©‚çA‚±‚ê‚ç‚Ìƒtƒ@ƒCƒ‹‚ğâ‘Î‚Éíœ‚µ‚È‚¢‚Å‚­‚¾‚³‚¢Bâ‘Î‚ÉB
echo.
echo          (Y ƒL[‚Å‘±s)
echo.
set /p nothing=%clr2%%clrwhi%     Y=‘±s                                                                  1/3%moveline%%clrwhi% <nul&choice /c Y /n >nul
if %ErrorLevel%==1 goto OOBEmain3


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
if %ErrorLevel%==1 goto OOBEmain4


:OOBEmain4
color 07
cls
echo.
echo   ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒZƒbƒgƒAƒbƒv
echo ====================================O
echo ƒZƒbƒgƒAƒbƒvi’» : 1/5 (’ˆÓ–€‚ÌŠm”F)
echo.
echo.
echo          ‚±‚ÌƒJ[ƒ\ƒ‹‘Ö‚¦‚ÍWindows 10 1511ˆÈ~‚Å‚Ì“®ì‚ğ„§‚µ‚Ä‚¢‚Ü‚·B
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
echo ƒZƒbƒgƒAƒbƒvi’» : 2/5 (ƒJ[ƒ\ƒ‹‘Ö‚¦‚ÌŠm”F)
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
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto OOBEmain6
if %ErrorLevel%==2 goto OOBEmain5ifno


:OOBEmain5ifno
color 07
cls
echo.
echo   ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒZƒbƒgƒAƒbƒv
echo ====================================O
echo ƒZƒbƒgƒAƒbƒvi’» : 2/5 (ƒJ[ƒ\ƒ‹‘Ö‚¦‚ÌŠm”F)
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
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto OOBEmain6
if %ErrorLevel%==2 call :OOBEmainblank & timeout /t 1 /nobreak >nul&exit



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
if %ErrorLevel%==1 goto OOBEmain6theme1
if %ErrorLevel%==2 call :OOBEmainblank & timeout /t 1 /nobreak >nul&set oobetheme=dark&goto OOBEmain7


:OOBEmain6theme1
if {%OOBEundiscard%}=={true} (call :OOBEmainblank & timeout /t 1 /nobreak >nul&set oobetheme=dark&set OOBEundiscard=&goto OOBEmain7)
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
if %ErrorLevel%==1 goto OOBEmain6theme2
if %ErrorLevel%==2 goto OOBEmain6theme2
if %ErrorLevel%==3 goto OOBEmain6theme2
if %ErrorLevel%==4 goto OOBEmain6theme3
if %ErrorLevel%==5 call :OOBEmain6themeifback&goto OOBEmain6theme1


:OOBEmain6theme2
if {%OOBEundiscard%}=={true} (call :OOBEmainblank & timeout /t 1 /nobreak >nul&set oobetheme=dark&set OOBEundiscard=&goto OOBEmain7)
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
if %ErrorLevel%==1 goto OOBEmain6theme2
if %ErrorLevel%==2 goto OOBEmain6theme3
if %ErrorLevel%==3 goto OOBEmain6theme2
if %ErrorLevel%==4 goto OOBEmain6theme3
if %ErrorLevel%==5 call :OOBEmain6themeifback&goto OOBEmain6theme2
if %ErrorLevel%==6 goto OOBEmain6theme2confirm
if %ErrorLevel%==7 goto OOBEmain6theme2confirm


:OOBEmain6theme3
if {%OOBEundiscard%}=={true} (call :OOBEmainblank & timeout /t 1 /nobreak >nul&set oobetheme=dark&set OOBEundiscard=&goto OOBEmain7)
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
if %ErrorLevel%==1 goto OOBEmain6theme2
if %ErrorLevel%==2 goto OOBEmain6theme3
if %ErrorLevel%==3 goto OOBEmain6theme2
if %ErrorLevel%==4 goto OOBEmain6theme3
if %ErrorLevel%==5 call :OOBEmain6themeifback&goto OOBEmain6theme3
if %ErrorLevel%==6 goto OOBEmain6theme3confirm
if %ErrorLevel%==7 goto OOBEmain6theme3confirm


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
if %ErrorLevel%==1 goto OOBEmain6theme2
if %ErrorLevel%==2 goto OOBEmain6theme2
if %ErrorLevel%==3 call :OOBEmainblank & timeout /t 1 /nobreak >nul&set oobetheme=dark&goto OOBEmain7
if %ErrorLevel%==4 call :OOBEmainblank & timeout /t 1 /nobreak >nul&set oobetheme=dark&goto OOBEmain7



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
if %ErrorLevel%==1 goto OOBEmain6theme3
if %ErrorLevel%==2 goto OOBEmain6theme3
if %ErrorLevel%==3 set oobetheme=white&call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto OOBEmain7
if %ErrorLevel%==4 set oobetheme=white&call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto OOBEmain7


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
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto OOBEmain7CustomizeSettings
if %ErrorLevel%==2 call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto OOBEmain8

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
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&set OOBEsetting1toggle=true&set OOBEsetting2toggle=false&set OOBEsetting3toggle=false&set OOBEsetting4toggle=true&set OOBEsetting5toggle=true&goto OOBEmain8
if %ErrorLevel%==2 goto OOBEmain7CustomizeSettings1

:OOBEmain7CustomizeSettings
if {%oobetheme%}=={white} (set OOBEsettingclr=[100m[97m&set OOBEsettingclr2=[0m[107m[30m)
if {%oobetheme%}=={dark} (set OOBEsettingclr=[7m&set OOBEsettingclr2=[0m)
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
echo          I 1 •ÏXŒã‚ÌÄ‹N“®‚ÌŠm”F         I
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
set /p nothing=%clr2%%clrwhi%     W,S ‚à‚µ‚­‚Í 1~5=“®‚©‚·     Y=Ø‚è‘Ö‚¦     N,B=”jŠü                        %moveline%%clrwhi% <nul&choice /c WS12345YNB /n >nul
if %ErrorLevel%==1 goto OOBEmain7CustomizeSettings1
if %ErrorLevel%==2 goto OOBEmain7CustomizeSettings1
if %ErrorLevel%==3 goto OOBEmain7CustomizeSettings1
if %ErrorLevel%==4 goto OOBEmain7CustomizeSettings2
if %ErrorLevel%==5 goto OOBEmain7CustomizeSettings3
if %ErrorLevel%==6 goto OOBEmain7CustomizeSettings4
if %ErrorLevel%==7 goto OOBEmain7CustomizeSettings5
if %ErrorLevel%==8 goto OOBEmain7CustomizeSettings1
if %ErrorLevel%==9 goto OOBEmain7CustomizeSettingsdiscard
if %ErrorLevel%==10 goto OOBEmain7CustomizeSettingsdiscard

:OOBEmain7CustomizeSettings1
if "%oobetheme%"=="white" (color f0) else (color 07)
cls
if "%OOBEsetting1toggle%"=="true" (set OOBEsettingclr=[46m) else if "%OOBEsetting1toggle%"=="false" (
if {%oobetheme%}=={white} (set OOBEsettingclr=[100m[97m&set OOBEsettingclr2=[0m[107m[30m)
if {%oobetheme%}=={dark} (set OOBEsettingclr=[7m&set OOBEsettingclr2=[0m)
)
echo.
echo   ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒZƒbƒgƒAƒbƒv
echo ====================================O
echo ƒZƒbƒgƒAƒbƒvi’» : 4/5 (İ’è‚ÌƒJƒXƒ^ƒ}ƒCƒY)
echo.
echo.
echo          O================================O   İ’è‚ÌƒJƒXƒ^ƒ}ƒCƒY
echo          I%OOBEsettingclr% 1 •ÏXŒã‚ÌÄ‹N“®‚ÌŠm”F         %OOBEsettingclr2%I
echo          O================================O   ƒJ[ƒ\ƒ‹‘Ö‚¦‚Å‚ÌƒJ[ƒ\ƒ‹‚Ì
echo          I%OOBEsetting2clr% 2 ‹N“®‚ÌƒAƒhƒ~ƒ“             %OOBEsetting2clr2%I   •ÏX‚ÉAÄ‹N“®‚ğ
echo          O================================O   Šm”F‚·‚é‹@”\‚ÌØ‚è‘Ö‚¦‚Å‚·B
echo          I%OOBEsetting3clr% 3 ‹N“®‚ÉXVŠm”F             %OOBEsetting3clr2%I   ‚à‚µƒIƒ“‚È‚çA•ÏX
echo          O================================O   ‚ÉÄ‹N“®‚ªŠm”F‚³‚ê‚Ü‚·B
echo          I%OOBEsetting4clr% 4 Enter‚Ì’·‰Ÿ‚µ‚ğŒŸ’m‚·‚é‹@”\  %OOBEsetting4clr2%I
echo          O================================O   %clrgra%—LŒø‚É‚·‚é‚Ì‚ğ„§%OOBEsettingclr2%
echo          I%OOBEsetting5clr% 5 ‹N“®‚ÌƒAƒjƒ[ƒVƒ‡ƒ“       %OOBEsetting5clr2%I
echo          O================================O
echo                       I  OK  I
echo                       O======O
echo.
echo.
set /p nothing=%clr2%%clrwhi%     W,S ‚à‚µ‚­‚Í 1~5=“®‚©‚·     Y=Ø‚è‘Ö‚¦     N,B=”jŠü                        %moveline%%clrwhi% <nul&choice /c WS12345YNB /n >nul
if {%oobetheme%}=={white} (set OOBEsettingclr=[100m[97m&set OOBEsettingclr2=[0m[107m[30m)
if {%oobetheme%}=={dark} (set OOBEsettingclr=[7m&set OOBEsettingclr2=[0m)
if %ErrorLevel%==1 goto OOBEmain7CustomizeSettings1
if %ErrorLevel%==2 goto OOBEmain7CustomizeSettings2
if %ErrorLevel%==3 goto OOBEmain7CustomizeSettings1
if %ErrorLevel%==4 goto OOBEmain7CustomizeSettings2
if %ErrorLevel%==5 goto OOBEmain7CustomizeSettings3
if %ErrorLevel%==6 goto OOBEmain7CustomizeSettings4
if %ErrorLevel%==7 goto OOBEmain7CustomizeSettings5
if %ErrorLevel%==8 call :OOBEsettingstoggle 1&goto OOBEmain7CustomizeSettings1
if %ErrorLevel%==9 goto OOBEmain7CustomizeSettingsdiscard
if %ErrorLevel%==10 goto OOBEmain7CustomizeSettingsdiscard

:OOBEmain7CustomizeSettings2
if "%oobetheme%"=="white" (color f0) else (color 07)
cls
if "%OOBEsetting2toggle%"=="true" (set OOBEsettingclr=[46m) else if "%OOBEsetting2toggle%"=="false" (
if {%oobetheme%}=={white} (set OOBEsettingclr=[100m[97m&set OOBEsettingclr2=[0m[107m[30m)
if {%oobetheme%}=={dark} (set OOBEsettingclr=[7m&set OOBEsettingclr2=[0m)
)
echo.
echo   ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒZƒbƒgƒAƒbƒv
echo ====================================O
echo ƒZƒbƒgƒAƒbƒvi’» : 4/5 (İ’è‚ÌƒJƒXƒ^ƒ}ƒCƒY)
echo.
echo.
echo          O================================O   İ’è‚ÌƒJƒXƒ^ƒ}ƒCƒY
echo          I%OOBEsetting1clr% 1 •ÏXŒã‚ÌÄ‹N“®‚ÌŠm”F         %OOBEsetting1clr2%I
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
set /p nothing=%clr2%%clrwhi%     W,S ‚à‚µ‚­‚Í 1~5=“®‚©‚·     Y=Ø‚è‘Ö‚¦     N,B=”jŠü                        %moveline%%clrwhi% <nul&choice /c WS12345YNB /n >nul
if {%oobetheme%}=={white} (set OOBEsettingclr=[100m[97m&set OOBEsettingclr2=[0m[107m[30m)
if {%oobetheme%}=={dark} (set OOBEsettingclr=[7m&set OOBEsettingclr2=[0m)
if %ErrorLevel%==1 goto OOBEmain7CustomizeSettings1
if %ErrorLevel%==2 goto OOBEmain7CustomizeSettings3
if %ErrorLevel%==3 goto OOBEmain7CustomizeSettings1
if %ErrorLevel%==4 goto OOBEmain7CustomizeSettings2
if %ErrorLevel%==5 goto OOBEmain7CustomizeSettings3
if %ErrorLevel%==6 goto OOBEmain7CustomizeSettings4
if %ErrorLevel%==7 goto OOBEmain7CustomizeSettings5
if %ErrorLevel%==8 call :OOBEsettingstoggle 2&goto OOBEmain7CustomizeSettings2
if %ErrorLevel%==9 goto OOBEmain7CustomizeSettingsdiscard
if %ErrorLevel%==10 goto OOBEmain7CustomizeSettingsdiscard

:OOBEmain7CustomizeSettings3
if "%oobetheme%"=="white" (color f0) else (color 07)
cls
if "%OOBEsetting3toggle%"=="true" (set OOBEsettingclr=[46m) else if "%OOBEsetting3toggle%"=="false" (
if {%oobetheme%}=={white} (set OOBEsettingclr=[100m[97m&set OOBEsettingclr2=[0m[107m[30m)
if {%oobetheme%}=={dark} (set OOBEsettingclr=[7m&set OOBEsettingclr2=[0m)
)
echo.
echo   ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒZƒbƒgƒAƒbƒv
echo ====================================O
echo ƒZƒbƒgƒAƒbƒvi’» : 4/5 (İ’è‚ÌƒJƒXƒ^ƒ}ƒCƒY)
echo.
echo.
echo          O================================O   İ’è‚ÌƒJƒXƒ^ƒ}ƒCƒY
echo          I%OOBEsetting1clr% 1 •ÏXŒã‚ÌÄ‹N“®‚ÌŠm”F         %OOBEsetting1clr2%I
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
set /p nothing=%clr2%%clrwhi%     W,S ‚à‚µ‚­‚Í 1~5=“®‚©‚·     Y=Ø‚è‘Ö‚¦     N,B=”jŠü                        %moveline%%clrwhi% <nul&choice /c WS12345YNB /n >nul
if {%oobetheme%}=={white} (set OOBEsettingclr=[100m[97m&set OOBEsettingclr2=[0m[107m[30m)
if {%oobetheme%}=={dark} (set OOBEsettingclr=[7m&set OOBEsettingclr2=[0m)
if %ErrorLevel%==1 goto OOBEmain7CustomizeSettings2
if %ErrorLevel%==2 goto OOBEmain7CustomizeSettings4
if %ErrorLevel%==3 goto OOBEmain7CustomizeSettings1
if %ErrorLevel%==4 goto OOBEmain7CustomizeSettings2
if %ErrorLevel%==5 goto OOBEmain7CustomizeSettings3
if %ErrorLevel%==6 goto OOBEmain7CustomizeSettings4
if %ErrorLevel%==7 goto OOBEmain7CustomizeSettings5
if %ErrorLevel%==8 call :OOBEsettingstoggle 3&goto OOBEmain7CustomizeSettings3
if %ErrorLevel%==9 goto OOBEmain7CustomizeSettingsdiscard
if %ErrorLevel%==10 goto OOBEmain7CustomizeSettingsdiscard

:OOBEmain7CustomizeSettings4
if "%oobetheme%"=="white" (color f0) else (color 07)
cls
if "%OOBEsetting4toggle%"=="true" (set OOBEsettingclr=[46m) else if "%OOBEsetting4toggle%"=="false" (
if {%oobetheme%}=={white} (set OOBEsettingclr=[100m[97m&set OOBEsettingclr2=[0m[107m[30m)
if {%oobetheme%}=={dark} (set OOBEsettingclr=[7m&set OOBEsettingclr2=[0m)
)
echo.
echo   ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒZƒbƒgƒAƒbƒv
echo ====================================O
echo ƒZƒbƒgƒAƒbƒvi’» : 4/5 (İ’è‚ÌƒJƒXƒ^ƒ}ƒCƒY)
echo.
echo.
echo          O================================O   İ’è‚ÌƒJƒXƒ^ƒ}ƒCƒY
echo          I%OOBEsetting1clr% 1 •ÏXŒã‚ÌÄ‹N“®‚ÌŠm”F         %OOBEsetting1clr2%I
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
set /p nothing=%clr2%%clrwhi%     W,S ‚à‚µ‚­‚Í 1~5=“®‚©‚·     Y=Ø‚è‘Ö‚¦     N,B=”jŠü                        %moveline%%clrwhi% <nul&choice /c WS12345YNB /n >nul
if {%oobetheme%}=={white} (set OOBEsettingclr=[100m[97m&set OOBEsettingclr2=[0m[107m[30m)
if {%oobetheme%}=={dark} (set OOBEsettingclr=[7m&set OOBEsettingclr2=[0m)
if %ErrorLevel%==1 goto OOBEmain7CustomizeSettings3
if %ErrorLevel%==2 goto OOBEmain7CustomizeSettings5
if %ErrorLevel%==3 goto OOBEmain7CustomizeSettings1
if %ErrorLevel%==4 goto OOBEmain7CustomizeSettings2
if %ErrorLevel%==5 goto OOBEmain7CustomizeSettings3
if %ErrorLevel%==6 goto OOBEmain7CustomizeSettings4
if %ErrorLevel%==7 goto OOBEmain7CustomizeSettings5
if %ErrorLevel%==8 call :OOBEsettingstoggle 4&goto OOBEmain7CustomizeSettings4
if %ErrorLevel%==9 goto OOBEmain7CustomizeSettingsdiscard
if %ErrorLevel%==10 goto OOBEmain7CustomizeSettingsdiscard

:OOBEmain7CustomizeSettings5
if "%oobetheme%"=="white" (color f0) else (color 07)
cls
if "%OOBEsetting5toggle%"=="true" (set OOBEsettingclr=[46m) else if "%OOBEsetting5toggle%"=="false" (
if {%oobetheme%}=={white} (set OOBEsettingclr=[100m[97m&set OOBEsettingclr2=[0m[107m[30m)
if {%oobetheme%}=={dark} (set OOBEsettingclr=[7m&set OOBEsettingclr2=[0m)
)
echo.
echo   ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒZƒbƒgƒAƒbƒv
echo ====================================O
echo ƒZƒbƒgƒAƒbƒvi’» : 4/5 (İ’è‚ÌƒJƒXƒ^ƒ}ƒCƒY)
echo.
echo.
echo          O================================O   İ’è‚ÌƒJƒXƒ^ƒ}ƒCƒY
echo          I%OOBEsetting1clr% 1 •ÏXŒã‚ÌÄ‹N“®‚ÌŠm”F         %OOBEsetting1clr2%I
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
set /p nothing=%clr2%%clrwhi%     W,S ‚à‚µ‚­‚Í 1~5=“®‚©‚·     Y=Ø‚è‘Ö‚¦     N,B=”jŠü                        %moveline%%clrwhi% <nul&choice /c WS12345YNB /n >nul
if {%oobetheme%}=={white} (set OOBEsettingclr=[100m[97m&set OOBEsettingclr2=[0m[107m[30m)
if {%oobetheme%}=={dark} (set OOBEsettingclr=[7m&set OOBEsettingclr2=[0m)
if %ErrorLevel%==1 goto OOBEmain7CustomizeSettings4
if %ErrorLevel%==2 goto OOBEmain7CustomizeSettingsOK
if %ErrorLevel%==3 goto OOBEmain7CustomizeSettings1
if %ErrorLevel%==4 goto OOBEmain7CustomizeSettings2
if %ErrorLevel%==5 goto OOBEmain7CustomizeSettings3
if %ErrorLevel%==6 goto OOBEmain7CustomizeSettings4
if %ErrorLevel%==7 goto OOBEmain7CustomizeSettings5
if %ErrorLevel%==8 call :OOBEsettingstoggle 5&goto OOBEmain7CustomizeSettings5
if %ErrorLevel%==9 goto OOBEmain7CustomizeSettingsdiscard
if %ErrorLevel%==10 goto OOBEmain7CustomizeSettingsdiscard

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
echo          I%OOBEsetting1clr% 1 •ÏXŒã‚ÌÄ‹N“®‚ÌŠm”F         %OOBEsetting1clr2%I
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
set /p nothing=%clr2%%clrwhi%     W,S ‚à‚µ‚­‚Í 1~5=“®‚©‚·     Y=Ø‚è‘Ö‚¦     N,B=”jŠü                        %moveline%%clrwhi% <nul&choice /c WS12345YNB /n >nul
if {%oobetheme%}=={white} (set OOBEsettingclr=[100m[97m&set OOBEsettingclr2=[0m[107m[30m)
if {%oobetheme%}=={dark} (set OOBEsettingclr=[7m&set OOBEsettingclr2=[0m)
if %ErrorLevel%==1 goto OOBEmain7CustomizeSettings5
if %ErrorLevel%==2 goto OOBEmain7CustomizeSettingsOK
if %ErrorLevel%==3 goto OOBEmain7CustomizeSettings1
if %ErrorLevel%==4 goto OOBEmain7CustomizeSettings2
if %ErrorLevel%==5 goto OOBEmain7CustomizeSettings3
if %ErrorLevel%==6 goto OOBEmain7CustomizeSettings4
if %ErrorLevel%==7 goto OOBEmain7CustomizeSettings5
if %ErrorLevel%==8 goto OOBEmain7CustomizeSettingsOKconfirm
if %ErrorLevel%==9 goto OOBEmain7CustomizeSettingsdiscard
if %ErrorLevel%==10 goto OOBEmain7CustomizeSettingsdiscard

:OOBEsettingstoggle
rem wtf?? goofy ahh if statements. well uh i mean, i dont know how to use "for" commands. so... u know, it cant be helped. fuckkkk
if "%1"=="1" (
    if "%OOBEsetting1toggle%"=="false" (
    if {%oobetheme%}=={white} (set OOBEsetting1clr=[100m[97m&set OOBEsetting1clr2=[0m[107m[30m)
    if {%oobetheme%}=={dark} (set OOBEsetting1clr=[7m&set OOBEsetting1clr2=[0m)
    set OOBEsetting1toggle=true
    ) else if "%OOBEsetting1toggle%"=="true" (
    if {%oobetheme%}=={white} (set OOBEsetting1clr=&set OOBEsetting1clr2=)
    if {%oobetheme%}=={dark} (set OOBEsetting1clr=&set OOBEsetting1clr2=)
        set OOBEsetting1toggle=false
    ) else set OOBEsetting1toggle=true
)
if "%1"=="2" (
    if "%OOBEsetting2toggle%"=="false" (
    if {%oobetheme%}=={white} (set OOBEsetting2clr=[100m[97m&set OOBEsetting2clr2=[0m[107m[30m)
    if {%oobetheme%}=={dark} (set OOBEsetting2clr=[7m&set OOBEsetting2clr2=[0m)
    set OOBEsetting2toggle=true
    ) else if "%OOBEsetting2toggle%"=="true" (
    if {%oobetheme%}=={white} (set OOBEsetting2clr=&set OOBEsetting2clr2=)
    if {%oobetheme%}=={dark} (set OOBEsetting2clr=&set OOBEsetting2clr2=)
        set OOBEsetting2toggle=false
    ) else set OOBEsetting2toggle=true
)
if "%1"=="3" (
    if "%OOBEsetting3toggle%"=="false" (
    if {%oobetheme%}=={white} (set OOBEsetting3clr=[100m[97m&set OOBEsetting3clr2=[0m[107m[30m)
    if {%oobetheme%}=={dark} (set OOBEsetting3clr=[7m&set OOBEsetting3clr2=[0m)
    set OOBEsetting3toggle=true
    ) else if "%OOBEsetting3toggle%"=="true" (
    if {%oobetheme%}=={white} (set OOBEsetting3clr=&set OOBEsetting3clr2=)
    if {%oobetheme%}=={dark} (set OOBEsetting3clr=&set OOBEsetting3clr2=)
        set OOBEsetting3toggle=false
    ) else set OOBEsetting3toggle=true
)
if "%1"=="4" (
    if "%OOBEsetting4toggle%"=="false" (
    if {%oobetheme%}=={white} (set OOBEsetting4clr=[100m[97m&set OOBEsetting4clr2=[0m[107m[30m)
    if {%oobetheme%}=={dark} (set OOBEsetting4clr=[7m&set OOBEsetting4clr2=[0m)
    set OOBEsetting4toggle=true
    ) else if "%OOBEsetting4toggle%"=="true" (
    if {%oobetheme%}=={white} (set OOBEsetting4clr=&set OOBEsetting4clr2=)
    if {%oobetheme%}=={dark} (set OOBEsetting4clr=&set OOBEsetting4clr2=)
        set OOBEsetting4toggle=false
    ) else set OOBEsetting4toggle=true
)
if "%1"=="5" (
    if "%OOBEsetting5toggle%"=="false" (
    if {%oobetheme%}=={white} (set OOBEsetting5clr=[100m[97m&set OOBEsetting5clr2=[0m[107m[30m)
    if {%oobetheme%}=={dark} (set OOBEsetting5clr=[7m&set OOBEsetting5clr2=[0m)
    set OOBEsetting5toggle=true
    ) else if "%OOBEsetting5toggle%"=="true" (
    if {%oobetheme%}=={white} (set OOBEsetting5clr=&set OOBEsetting5clr2=)
    if {%oobetheme%}=={dark} (set OOBEsetting5clr=&set OOBEsetting5clr2=)
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
echo          1 •ÏXŒã‚ÌÄ‹N“®‚ÌŠm”F        : %OOBEsetting1toggle% %clrgra%(true‚ª„§)%OOBEsettingclr2%
echo          2 ‹N“®‚ÌƒAƒhƒ~ƒ“            : %OOBEsetting2toggle% %clrgra%(false‚ª„§)%OOBEsettingclr2%
echo          3 ‹N“®‚ÉXVŠm”F            : %OOBEsetting3toggle% %clrgra%(false‚ª„§)%OOBEsettingclr2%
echo          4 Enter‚Ì’·‰Ÿ‚µ‚ğŒŸ’m‚·‚é‹@”\ : %OOBEsetting4toggle% %clrgra%(true‚ª„§)%OOBEsettingclr2%
echo          5 ‹N“®‚ÌƒAƒjƒ[ƒVƒ‡ƒ“      : %OOBEsetting5toggle% %clrgra%(true‚ª„§)%OOBEsettingclr2%
echo.
echo          ‘±s‚·‚é‚ÆA‚±‚ê‚ç‚Ìİ’è‚ª‚·‚×‚Äİ’èƒtƒ@ƒCƒ‹‚É‘‚«‚Ü‚ê‚Ü‚·B
echo          ‚æ‚ë‚µ‚¢‚Å‚·‚©H %clrgra%(İ’èƒtƒ@ƒCƒ‹‚Í "%HOMEDRIVE%%HOMEPATH%"‚É‚ ‚è‚Ü‚·B) %OOBEsettingclr2%
echo.
echo          (Y=‚Í‚¢)
echo          (N=‚¢‚¢‚¦B‚â‚Á‚Ï‚è•ÏX‚µ‚½‚¢‚Å‚·B)
echo.
echo.
set /p nothing=%clr2%%clrwhi%     Y=‚Í‚¢     N=‚¢‚¢‚¦                                                        %moveline%%clrwhi% <nul&choice /c YN /n >nul
if %ErrorLevel%==1 if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto OOBEmain8
if %ErrorLevel%==2 goto OOBEmain7CustomizeSettings1

:OOBEmain8
if "%oobetheme%"=="white" (color f0) else (color 07)
rem setting written, well, wtf is this?? so many goofy ahh if statement. hell no NOT AGAIN!!!!!!!!!!!!
if not exist ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt (
    type nul > ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
    echo nodogcheckfor1234567890qwertyuiop >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt 

    if "%OOBEsetting1toggle%"=="false" (
echo rebootokey=false >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
    ) else if "%OOBEsetting1toggle%"=="true" (
        echo rebootokey=true >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
    ) else (echo rebootokey=true >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt)

    if "%OOBEsetting2toggle%"=="false" (
echo admin=false >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
    ) else if "%OOBEsetting2toggle%"=="true" (
        echo admin=true >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
    ) else (echo admin=false >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt)

    if "%OOBEsetting3toggle%"=="false" (
echo CheckUpdate=false >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
    ) else if "%OOBEsetting3toggle%"=="true" (
        echo CheckUpdate=true >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
    ) else (echo CheckUpdate=false >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt)

    if "%OOBEsetting4toggle%"=="false" (
echo hatenakeikoku=false >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
    ) else if "%OOBEsetting4toggle%"=="true" (
        echo hatenakeikoku=true >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
    ) else (echo hatenakeikoku=true >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt)

    if "%OOBEsetting5toggle%"=="false" (
echo bootanimation=false >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
    ) else if "%OOBEsetting5toggle%"=="true" (
        echo bootanimation=true >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
    ) else (echo bootanimation=true >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt)
    
    if "%OOBEtheme%"=="dark" (
echo wmode=false >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
    ) else if "%OOBEtheme%"=="white" (
        echo wmode=true >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
    ) else (echo wmode=false >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt)

if not exist ‰‰ñƒJ[ƒ\ƒ‹.txt (
type nul > ‰‰ñƒJ[ƒ\ƒ‹.txt
echo nodogcheckforfastboot >> ‰‰ñƒJ[ƒ\ƒ‹.txt
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
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&call :OOBEinitialization &set bootbatnow=yes&goto batstart
if %ErrorLevel%==2 call :OOBEmainblank & timeout /t 1 /nobreak >nul&call :OOBEinitialization &set bootbatnow=yes&goto batstart

:OOBEinitialization
if "%oobetheme%"=="white" (color f0) else (color 07) & cls
if {%invisiblecursor%}=={true} (echo [?25h&set invisiblecursor=)
set clrgra=&set clrhigh=&set clrhighend=&set clrwhi=
set oobetheme=
set OOBEsetting1toggle=&set OOBEsetting2toggle=&set OOBEsetting3toggle=&set OOBEsetting4toggle=&set OOBEsetting5toggle=
set OOBEsetting1clr=&set OOBEsetting2clr=&set OOBEsetting3clr=&set OOBEsetting4clr=&set OOBEsetting5clr=
set OOBEsetting1clr2=&set OOBEsetting2clr2=&set OOBEsetting3clr2=&set OOBEsetting4clr2=&set OOBEsetting5clr2=
set OOBEsettingclr=&set OOBEsettingclr2=
2>nul taskkill /im powershell.exe >nul
exit /b




rem ŠÇ—ÒŒ ŒÀ‚Ìƒvƒƒ“ƒvƒg‚ÉŠÖ‚·‚éİ’è‚ğŒŸ’mA
:batstart
mode con: cols=75 lines=25
if {%settingbypass%}=={true} (goto hazimemenuskipboot)
cls
rem ŠÇ—ÒŒ ŒÀİ’è‚ÌŒŸ’m
find "admin=true" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
if {%adminbypass%}=={true} (goto gotadmin)
if {%errorlevel%}=={0} (goto batstartadm)
if {%errorlevel%}=={1} (
set batloadprgs=0
call :MOBAS_Loader
goto batstarttest2
)

:batstarttest2
cls
find "admin=false" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
set batloadprgs=0
call :MOBAS_Loader
if {%errorlevel%}=={0} (goto hazime)
if {%errorlevel%}=={1} (goto batstartadm)



:batstartadm
cls
rem ŠÇ—ÒŒ ŒÀ‚Ìæ“¾
rem ‚±‚ÌƒR[ƒhAç’·‚·‚¬‚é‹C‚ª‚·‚éB‚à‚µ‚©‚µ‚½‚çpowershell‚ğg‚Á‚Ä‚à‚Á‚Æ’Zk‚Å‚«‚é‚©‚àB
echo copyright.ƒJ[ƒ\ƒ‹‘Ö‚¦%batver% by tamago_1908
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
powershell -NoProfile -Command "Start-Process '%batpath%' -Verb RunAs" >nul && exit
echo.
echo ŠÇ—ÒŒ ŒÀ‚Ì—v‹‚ª‹‘”Û‚³‚ê‚Ü‚µ‚½B
echo ^(ƒqƒ“ƒg: ŠÇ—ÒŒ ŒÀ‚Ì—v‹‚Íİ’è‚Å–³Œø‚É‚Å‚«‚Ü‚·B^)
timeout /t 2 /nobreak >nul
:gotAdmin
cls
pushd "%CD%"
goto :hazime


:Cursor_Changer_REmenu
rem recovery menu for ƒJ[ƒ\ƒ‹‘Ö‚¦, and recobery console
cls
mode con: cols=75 lines=25
color 07
set bootbatnow=no
if defined bootbatnow (set clr=[7m&set clr2=[0m) else (set clr=[7m&set clr2=[0m)
echo ƒŠƒJƒoƒŠ[ƒƒjƒ…[‚ğ“Ç‚İ‚İ’†...
timeout /t 2 /nobreak >nul
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ƒŠƒJƒoƒŠ[ƒƒjƒ…[
cls
echo                     ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒŠƒJƒoƒŠ[ƒƒjƒ…[ %debugmode%               
echo.
echo                                    Ä‹N“®
echo                                 İ’è‚Ì‰Šú‰»  
echo                             ƒŠƒJƒoƒŠ[ƒRƒ“ƒ\[ƒ‹ 
echo                                     ‘Şo    
echo.
echo                    1‚©‚ç4A‚Ü‚½‚ÍWS‚Å‘I‘ğAE‚©Y‚ÅŒˆ’è‚µ‚Ü‚·B
echo                       Œ»İA‰½‚à‘I‘ğ‚³‚ê‚Ä‚¢‚Ü‚¹‚ñB
echo.
choice /c 1234WS /n 
if %ErrorLevel%==1 goto :Cursor_Changer_REmenu1
if %ErrorLevel%==2 goto :Cursor_Changer_REmenu1
if %ErrorLevel%==3 goto :Cursor_Changer_REmenu3
if %ErrorLevel%==4 goto :Cursor_Changer_REmenu4
if %ErrorLevel%==5 goto :Cursor_Changer_REmenu1
if %ErrorLevel%==6 goto :Cursor_Changer_REmenu1

pause

:Cursor_Changer_REmenu1
cls
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ƒŠƒJƒoƒŠ[ƒƒjƒ…[
echo                     ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒŠƒJƒoƒŠ[ƒƒjƒ…[ %debugmode%                
echo.
echo                            %clr%        Ä‹N“®        %clr2%
echo                                 İ’è‚Ì‰Šú‰»    
echo                             ƒŠƒJƒoƒŠ[ƒRƒ“ƒ\[ƒ‹ 
echo                                     ‘Şo    
echo.
echo                    1‚©‚ç4A‚Ü‚½‚ÍWS‚Å‘I‘ğAE‚©Y‚ÅŒˆ’è‚µ‚Ü‚·B  
echo                          ƒJ[ƒ\ƒ‹‘Ö‚¦‚ÌÄ‹N“®B’Êí‚Í
echo                              ‚±‚ê‚ª‚¨‚·‚·‚ß‚Å‚·B
echo.
choice /c 1234WSYE /n 
if %ErrorLevel%==1 goto :Cursor_Changer_REmenu1
if %ErrorLevel%==2 goto :Cursor_Changer_REmenu2
if %ErrorLevel%==3 goto :Cursor_Changer_REmenu3
if %ErrorLevel%==4 goto :Cursor_Changer_REmenu4
if %ErrorLevel%==5 goto :Cursor_Changer_REmenu1
if %ErrorLevel%==6 goto :Cursor_Changer_REmenu2
if %ErrorLevel%==7 set runningfromfulldebug=&set FromREConsole=&cd %~dp0 &start "" ^"%~n0%~x0^"&exit
if %ErrorLevel%==8 set runningfromfulldebug=&set FromREConsole=&cd %~dp0 &start "" ^"%~n0%~x0^"&exit
pause

:Cursor_Changer_REmenu2
cls
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ƒŠƒJƒoƒŠ[ƒƒjƒ…[
echo                     ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒŠƒJƒoƒŠ[ƒƒjƒ…[ %debugmode%                
echo.
echo                                    Ä‹N“®       
echo                            %clr%     İ’è‚Ì‰Šú‰»     %clr2%
echo                             ƒŠƒJƒoƒŠ[ƒRƒ“ƒ\[ƒ‹ 
echo                                     ‘Şo    
echo.
echo                    1‚©‚ç4A‚Ü‚½‚ÍWS‚Å‘I‘ğAE‚©Y‚ÅŒˆ’è‚µ‚Ü‚·B  
echo                             İ’è‚ğ‰Šú’l‚É–ß‚µ‚Ü‚·B
echo.
choice /c 1234WSYE /n 
if %ErrorLevel%==1 goto :Cursor_Changer_REmenu1
if %ErrorLevel%==2 goto :Cursor_Changer_REmenu2
if %ErrorLevel%==3 goto :Cursor_Changer_REmenu3
if %ErrorLevel%==4 goto :Cursor_Changer_REmenu4
if %ErrorLevel%==5 goto :Cursor_Changer_REmenu1
if %ErrorLevel%==6 goto :Cursor_Changer_REmenu3
if %ErrorLevel%==7 goto :Cursor_Changer_REWipe
if %ErrorLevel%==8 goto :Cursor_Changer_REWipe
pause

:Cursor_Changer_REmenu3
cls
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ƒŠƒJƒoƒŠ[ƒƒjƒ…[
echo                     ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒŠƒJƒoƒŠ[ƒƒjƒ…[ %debugmode%                
echo.
echo                                    Ä‹N“®       
echo                                 İ’è‚Ì‰Šú‰»    
echo                            %clr% ƒŠƒJƒoƒŠ[ƒRƒ“ƒ\[ƒ‹ %clr2%
echo                                     ‘Şo    
echo.
echo                    1‚©‚ç4A‚Ü‚½‚ÍWS‚Å‘I‘ğAE‚©Y‚ÅŒˆ’è‚µ‚Ü‚·B  
echo                      ƒŠƒJƒoƒŠ[ƒRƒ“ƒ\[ƒ‹‚ÉƒAƒNƒZƒX‚µ‚Ü‚·B
echo               ƒŠƒJƒoƒŠ[ƒRƒ“ƒ\[ƒ‹‚Å‚ÍAƒƒCƒ“ƒƒjƒ…[‚Å—˜—p‰Â”\‚È
echo                   ƒfƒoƒbƒO–Ú“I‚ÌƒRƒ}ƒ“ƒh‚ª‚·‚×‚Ä—˜—p‰Â”\‚Å‚·B
echo.
choice /c 1234WSYE /n 
if %ErrorLevel%==1 goto :Cursor_Changer_REmenu1
if %ErrorLevel%==2 goto :Cursor_Changer_REmenu2
if %ErrorLevel%==3 goto :Cursor_Changer_REmenu3
if %ErrorLevel%==4 goto :Cursor_Changer_REmenu4
if %ErrorLevel%==5 goto :Cursor_Changer_REmenu2
if %ErrorLevel%==6 goto :Cursor_Changer_REmenu4
if %ErrorLevel%==7 call :Cursor_Changer_REConsole
if %ErrorLevel%==8 call :Cursor_Changer_REConsole
goto :Cursor_Changer_REmenu3
pause

:Cursor_Changer_REmenu4
cls
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ƒŠƒJƒoƒŠ[ƒƒjƒ…[
echo                     ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒŠƒJƒoƒŠ[ƒƒjƒ…[ %debugmode%                
echo.
echo                                    Ä‹N“®       
echo                                 İ’è‚Ì‰Šú‰»    
echo                             ƒŠƒJƒoƒŠ[ƒRƒ“ƒ\[ƒ‹   
echo                            %clr%         ‘Şo         %clr2%
echo.
echo                    1‚©‚ç4A‚Ü‚½‚ÍWS‚Å‘I‘ğAE‚©Y‚ÅŒˆ’è‚µ‚Ü‚·B  
echo                        ƒŠƒJƒoƒŠ[ƒƒjƒ…[‚©‚ç‘Şo‚µ‚Ü‚·B
echo                               (ƒVƒƒƒbƒgƒ_ƒEƒ“)
choice /c 1234WSYE /n 
if %ErrorLevel%==1 goto :Cursor_Changer_REmenu1
if %ErrorLevel%==2 goto :Cursor_Changer_REmenu2
if %ErrorLevel%==3 goto :Cursor_Changer_REmenu3
if %ErrorLevel%==4 goto :Cursor_Changer_REmenu4
if %ErrorLevel%==5 goto :Cursor_Changer_REmenu3
if %ErrorLevel%==6 goto :Cursor_Changer_REmenu4
if %ErrorLevel%==7 goto :batshutdown
if %ErrorLevel%==8 goto :batshutdown
pause

:Cursor_Changer_REWipe
cls
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ƒŠƒJƒoƒŠ[ƒƒjƒ…[
echo                     ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒŠƒJƒoƒŠ[ƒƒjƒ…[ %debugmode%                
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
echo nodogcheckfor1234567890qwertyuiop > ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
echo CheckUpdate=false >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
echo wmode=false >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
echo admin=false >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
echo rebootokey=true >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
echo hatenakeikoku=true >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
echo bootanimation=true >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
goto :Cursor_Changer_REWipeYippeee
)
if %ErrorLevel%==2 goto :Cursor_Changer_REmenu2

:Cursor_Changer_REWipeYippeee
cls
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ƒŠƒJƒoƒŠ[ƒƒjƒ…[
echo                     ƒJ[ƒ\ƒ‹‘Ö‚¦ %batver% ƒŠƒJƒoƒŠ[ƒƒjƒ…[ %debugmode%                
echo.
echo.  
echo                               İ’è‚Ì‰Šú‰»‚Í
echo                             ³í‚ÉŠ®—¹‚µ‚Ü‚µ‚½B
echo.
echo.
echo.
echo.
timeout /t 3 /nobreak >nul
goto :Cursor_Changer_REmenu2


:Cursor_Changer_REConsole
cls
set selected=
set FromREConsole=true
mode con: cols=75 lines=25
color 07
set bootbatnow=no
if defined %wmodetoggle% (set clr=[7m&set clr2=[0m) else (set clr=[7m&set clr2=[0m)
echo ƒŠƒJƒoƒŠ[ƒRƒ“ƒ\[ƒ‹‚ğ“Ç‚İ‚ñ‚Å‚¢‚Ü‚·...
timeout /t 2 /nobreak >nul
cls
:Cursor_Changer_REConsolemain
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ƒŠƒJƒoƒŠ[ƒRƒ“ƒ\[ƒ‹
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
echo                                  Às‚µ‚½‚¢ƒRƒ}ƒ“ƒh‚ğ“ü—Í‚µ‚Ä‚­‚¾‚³‚¢B
echo                                         inspectentirecommandlist
echo                                         ‚Å‘SƒRƒ}ƒ“ƒhƒŠƒXƒg‚ğQÆB
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
if {%selected%}=={inspectentirecommandlist} (goto :allcommands)
if {%selected%}=={exit} (set FromREConsole=&exit /b)
if {%selected%}=={alldefnow1} (goto :AllDefult1)
if {%selected%}=={playdefboot} (set hatenakeikoku=0&cls&goto :firstboot)
if {%selected%}=={debugyesnow} (goto :kurogo)
if {%selected%}=={fulldebug} (goto fulldebug)
if {%selected%}=={getadmin} (goto :batstartadm)
if {%selected%}=={restoresetting} (
echo nodogcheckfor1234567890qwertyuiop > ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
echo CheckUpdate=false >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
echo wmode=false >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
echo admin=false >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
echo rebootokey=true >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
echo hatenakeikoku=true >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
echo bootanimation=true >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
echo Š®—¹B‰½‚©ƒL[‚ğ‰Ÿ‚µ‚Ä‘±s...
pause >nul
)
if {%selected%}=={alldefdeletebat} (set hatenakeikoku=0&echo delete bat, confirm to type something...&pause&goto alldefdeletefinish5)
if {%selected%}=={windowsfiltertest} (goto :batbootcheckwinverbad)
if {%selected%}=={funanimationdeb} (goto :batbootanimationfun)
if {%selected%}=={openie} (goto :openiedev)
if {%selected%}=={setenter} (echo.&set /p hatenakeikoku=pls type:&goto :hazimeboot) else (set selected= &echo —LŒø‚ÈƒRƒ}ƒ“ƒh‚ğ“ü—Í‚µ‚Ä‚­‚¾‚³‚¢B&goto Cursor_Changer_REConsoleask)



:batbootanimationfun
set bootegg=
set bootegg2=
mode con: cols=85 lines=29
find "wmode=true" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt >nul
if {%errorlevel%}=={0} (color f0&set funanimationclr=f0) else (set funanimationclr=07)
cls
title ‚³‚·‚ªƒJ[ƒ\ƒ‹‘Ö‚¦I‰´‚½‚¿‚É‚Å‚«‚È‚¢‚±‚Æ‚ğ•½‘R‚Æ‚â‚Á‚Ä‚Ì‚¯‚éƒbI‚»‚±‚É‚µ‚Ñ‚ê‚é“²‚ê‚é‚£‚ÁI
echo                                  A                A                                  
echo                                AAA                 AA                                
echo                             AABB                     AAA                             
echo                 AAAAAAAAAABBAA                           ABBBBBAAAAAAA               
echo                              A                         AA               A            
echo        AAA   AAAAAAAAAAAAAAAAAABAA                 AABAAAAAAAAA  AAABAA              
echo           AA         ABBBA                                 ABBBA       AAAA          
echo          AAA AAAAAAAAAAAAAAABBBB                 BBBBAAAAAAAAAAAAAAAAAAAAA           
echo                        ABBBBBBBA                 A   BBAA                  BA        
echo              AAAAAAAAAA       AAAAA               ABA      AAAAAAAA        AB        
echo                             AAA                     AAAA                 AAABBAAA    
echo       AAAAAAAAAAAAA                                                     ABBBA  AAAA  
echo        ABBB                                                           ABBBBA         
echo           AAAAAAA                                              AAAA  BBBBB           
echo               ABBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA  ABBBBA           
echo                  AA  AAABAAAABAAAAABAAAAAAAAAAAAAABAAAAAAABA      AABBBBA            
echo                  AA     B    A     B       A      B       BAAAABBBBBBB               
echo                   AAAAAABAAAABAAAAABAAAAAAABAAAAAABAAAAA AAAABBBBBBBAA               
echo    ABBABB     AAAAAAABBBBBBBBBBBBBBBBBBBBBBBBBBBBAAAAAAA     ABBBBAA                 
echo    AAAA  AA  ABB AAAAAAAABBAAAAAAAAAAAAAAA       A      AAAABBAAA                    
echo       B    AAAAA   AB    BB       AA     AA      BAA    ABBAA                        
echo       BBBA       ABBBB A   A      AB     AABAABBBBBBBBA                              
echo       ABBB           AAAABBBAAAAAABBBABBBBBBBAAAA                                    
echo        ABBA                   AAAAAAAAA                                              
echo           BBB                                                                        
echo O===================================================================================O
echo.
echo                         ƒJ[ƒ\ƒ‹‘Ö‚¦%batver% ‚æ‚¤‚±‚» 2021-2024 %debugmode%
timeout /t 2 /nobreak >nul
color cf
timeout /t 1 /nobreak >nul
color 2f
timeout /t 1 /nobreak >nul
color bf
timeout /t 1 /nobreak >nul
color 9f
timeout /t 1 /nobreak >nul
color %funanimationclr%
timeout /t 1 /nobreak >nul
set funanimationclr=
mode con: cols=75 lines=25
goto checksum

:batbootanimation
if {%firststartbat%}=={yes} (goto batbootanimationbypassfun)
find "bootanimation=false" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
if {%errorlevel%}=={0} (goto checksum)
cls
rem ƒu[ƒgƒAƒjƒ[ƒVƒ‡ƒ“‚ğÄ¶B50•ª‚Ì1‚ÌŠm—¦‚Å•Êƒo[ƒWƒ‡ƒ“‚ªÄ¶‚³‚ê‚éBramdom‚Ìd—l(H)‚É‚æ‚Á‚Ä“ñ‰ñ˜A‘±‚Årandom‚ğ‚µ‚È‚¢‚Æ‚¢‚¯‚È‚¢B
set /a bootegg=%random%*51/32767
set /a bootegg2=%random%*51/32767
if {%firststartbat%}=={yes} (goto batbootanimationbypassfun)
if {%bootegg%}=={%bootegg2%} (goto batbootanimationfun)
set bootegg=
set bootegg2=
:batbootanimationbypassfun
title ‚æ‚¤‚±‚»
echo.
echo                              ƒJ[ƒ\ƒ‹‘Ö‚¦%batver% %debugmode%
echo.
echo O=========================================================================O
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
echo O=========================================================================O
echo.
echo                       2021-2024 tamago1908 %batbuild%
timeout /t 3 /nobreak >nul
cls
rem İ’è‚ÌŒ‡‘¹‚ğŠm”F

:checksum
if {%invisiblecursor%}=={true} (echo [?25h&set invisiblecursor=)
if not {%allsettingerror%} equ {0} (
    title ƒJ[ƒ\ƒ‹Œ‡‘¹
    echo İ’è‚ª%allsettingerror%ŒÂŒ‡‘¹‚µ‚Ä‚¢‚Ü‚·B%allstgerroreastereggmessage%
    echo.
    echo ƒJ[ƒ\ƒ‹‘Ö‚¦ƒo[ƒWƒ‡ƒ“1.5‚©‚çƒo[ƒWƒ‡ƒ“1.9‚Ü‚Å‚Ìƒo[ƒWƒ‡ƒ“‚ğˆÈ‘O‚Ég—p‚µ‚Ä‚¢‚È‚¢‚±‚Æ‚ğŠm”F‚µ‚Ä‚­‚¾‚³‚¢B
    echo ‚à‚µ‚­‚ÍƒJ[ƒ\ƒ‹İ’è.txt‚Ì’†g‚ğŠm”F‚µ‚Ä‚­‚¾‚³‚¢B
    echo ƒtƒ@ƒCƒ‹ƒpƒX‚Í%HOMEDRIVE%%HOMEPATH%‚Å‚·B
    echo C•œ‚·‚éê‡‚Íİ’è‚És‚«A”j‘¹ŒÂŠ‚Ì•”•ª‚Ìİ’è‚Ì—LŒø/–³Œø‚ğØ‚è‘Ö‚¦‚Ä‚­‚¾‚³‚¢B©“®“I‚É•âŠ®‚³‚êC•œ‚³‚ê‚Ü‚·B^(C•œ‚ÌÛ‚É‚ÍAƒfƒtƒHƒ‹ƒg‚ÌŠù’è’l‚Éİ’è‚ÍƒZƒbƒg‚³‚ê‚Ü‚·B^)
    pause
    )
    if {%allsettingerror%} gtr {3} (goto fixallsetting) else (goto hazimemenu)
echo.
:fixallsetting
rem ©“®C•œ
powershell sleep 2
SET /P selected=©“®C•œ‚ğ—˜—p‚Å‚«‚Ü‚·B©“®C•œ‚ğÀs‚·‚é‚Æ‚»‚ê‚Ü‚Å‚Ìİ’è‚ª‚·‚×‚Ä‰Šú‰»‚³‚êAƒfƒtƒHƒ‹ƒg‚Ìİ’è‚ÉƒŠƒZƒbƒg‚³‚ê‚Ü‚·B‘±s‚µ‚Ü‚·‚©H(yes‚Ü‚½‚Íno):
if {%selected%}=={yes} (
echo nodogcheckfor1234567890qwertyuiop > ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
echo CheckUpdate=false >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
echo wmode=false >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
echo admin=false >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
echo rebootokey=true >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
echo  hatenakeikoku=true >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
echo bootanimation=true >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
echo.
echo C•œ‚ªŠ®—¹‚µ‚Ü‚µ‚½B
pause
exit
)
if {%selected%}=={y} (
:overwritesetting
echo nodogcheckfor1234567890qwertyuiop > ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
echo CheckUpdate=false >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
echo wmode=false >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
echo admin=false >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
echo rebootokey=true >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
echo hatenakeikoku=true >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
echo bootanimation=true >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
echo.
echo C•œ‚ªŠ®—¹‚µ‚Ü‚µ‚½B
pause
exit
)
if {%selected%}=={no} (hazimemenuskipboot)
if {%selected%}=={n} (hazimemenuskipboot)

goto :hazimemenu
:hazime
if {%alldefentered%}=={true} (
set alldefno2clr=
set alldefno2clr2=
set alldefclr=
set alldefclr2=
)
if {%settingbypass%}=={true} (goto hazimemenuskipboot)
rem İ’è‚Æ‚»‚Ì‘¼‚Ìƒ[ƒh
rem ‰½‚ğ“Ç‚İ‚İA“Ç‚İ‚ñ‚¾Œã‚Ç‚±‚Égoto‚µ‚½‚¢‚©‚ğ•Ï”‚É‘ã“ü•K—v set wantload=setting1 set whatloadgoto=hazime “™ hazimeŠÖŒW‚Ìê‡‚Í‚»‚êƒIƒ“ƒŠ[
rem ƒJ[ƒ\ƒ‹‚ÌF‚ÉŠÖ‚µ‚Ä‚ÍƒƒCƒ“‚Ì•ÏX•”•ª‚É‚ÍÀ‘•‚µ‚Ä‚¢‚Ü‚¹‚ñB•ÏX‚µ‚Ä‚©‚çhazime‚É–ß‚Á‚Ä—ˆ‚ê‚é‚æ‚¤‚ÉİŒv‚µ‚Ä‚È‚¢‚Ì‚ÅB
rem İ’è‚ğ’Ç‰Á‚·‚éê‡‚ÍŠî–{ƒRƒsƒy‚Å‘åä•vB‚½‚¾Aƒƒjƒ…[‚ÌŒ©‚½–Ú‚Æ‚©‚É‚©‚©‚í‚é‚à‚Ì‚Å‚ÍƒR[ƒh‚ğ’Ç‰Á‚µ‚È‚¢‚Æ‚¢‚¯‚È‚¢‚©‚à
:settingloads
cd /d %HOMEDRIVE%%HOMEPATH%
if not exist ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt (
cls
title ƒJ[ƒ\ƒ‹ƒGƒ‰[
echo İ’èƒtƒ@ƒCƒ‹‚ª‘¶İ‚µ‚Ü‚¹‚ñB
pause
echo ‹°‚ç‚­A‰‰ñ‹N“®‚ğ‚µ‚½Û‚É‚»‚Ì‚Ü‚ÜƒJ[ƒ\ƒ‹‘Ö‚¦‚ğ•Â‚¶‚Ä‚©‚çÄ‹N“®‚µ‚Ä‚µ‚Ü‚Á‚½‚Ì‚ªŒ´ˆö‚Å‚µ‚å‚¤B‚»‚ê‚©AŒÌˆÓ‚Éİ’èƒtƒ@ƒCƒ‹‚ğÁ‹‚µ‚½‚©...­‚È‚­‚Æ‚àAİ’èƒtƒ@ƒCƒ‹‚ª‘¶İ‚µ‚È‚¢‚Ì‚Í–À‚Å‚·B
pause
cls
echo İ’èƒtƒ@ƒCƒ‹‚ğÄ¶¬‚µ‚Ü‚·B‚¢‚Ü‚Ü‚Å‚Ìİ’è‚Í‚·‚×‚Äíœ‚³‚ê‚Ü‚·B
pause
cls
type nul > ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
echo nodogcheckfor1234567890qwertyuiop >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
echo CheckUpdate=false >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
echo wmode=false >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
echo admin=false >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
echo rebootokey=true >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
echo hatenakeikoku=true >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
echo bootanimation=true >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
title ...
echo Ä¶¬‚ªŠ®—¹‚µ‚Ü‚µ‚½B
pause
echo •ÏX‚ğ“K—p‚·‚é‚½‚ßAƒJ[ƒ\ƒ‹‘Ö‚¦‚ğÄ‹N“®‚µ‚Ä‚­‚¾‚³‚¢B
pause
exit
)


if {%bootbatnow%}=={no} (goto whatload) else (goto setting1load)
:setting1load
rem ƒzƒƒCƒgƒ‚[ƒh‚ÌŒŸ’m‚ÆF‚Ì•ÏXB•ÏX‚Ì‚‘¬‰»‚Ì‚½‚ß˜”Õ‚É”z’uB
set allsettingerror=0
find "rebootokey=true" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
if {%bootbatnow%}=={no} (echo ˆ—’†...)
if %ErrorLevel%==0 set setting1onoff=—LŒø
if %ErrorLevel%==1 goto setting1load2
if {%bootbatnow%}=={yes} (
set batloadprgs=1
call :MOBAS_Loader
goto setting2load
)
goto whatloadgoto


:setting2load
find "admin=true" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
if {%bootbatnow%}=={no} (echo ˆ—’†...)
if %ErrorLevel%==0 set setting2onoff=—LŒø
if %ErrorLevel%==1 goto setting2load2
if {%bootbatnow%}=={yes} (
set batloadprgs=2
call :MOBAS_Loader
goto setting3load
) 
goto whatloadgoto

:setting3load
find "CheckUpdate=true" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
if {%bootbatnow%}=={no} (echo ˆ—’†...)
if %ErrorLevel%==0 set setting3onoff=—LŒø
if %ErrorLevel%==1 goto setting3load2
if {%bootbatnow%}=={yes} (
set batloadprgs=3
call :MOBAS_Loader
goto setting4load
) 
goto whatloadgoto

:setting4load
find "hatenakeikoku=true" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
if {%bootbatnow%}=={no} (echo ˆ—’†...)
if %ErrorLevel%==0 set setting4onoff=—LŒø
if %ErrorLevel%==1 goto setting4load2
if {%bootbatnow%}=={yes} (
set batloadprgs=4
call :MOBAS_Loader
goto setting5load
) 
goto whatloadgoto

:setting5load
find "bootanimation=true" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
if {%bootbatnow%}=={no} (echo ˆ—’†...)
if %ErrorLevel%==0 set setting5onoff=—LŒø
if %ErrorLevel%==1 goto setting5load2
if {%bootbatnow%}=={yes} (
set batloadprgs=5
call :MOBAS_Loader
goto wmodeload
) 
goto whatloadgoto

:wmodeload
find "wmode=true" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
if {%bootbatnow%}=={no} (echo ˆ—’†...)
if {%ErrorLevel%}=={0} (set wmodeonoff=ƒ_[ƒNƒe[ƒ}‚É•ÏX  &set wmodetoggle=true)
if {%ErrorLevel%}=={1} (goto wmodeload2)
if {%bootbatnow%}=={yes} (
set batloadprgs=6
call :MOBAS_Loader
goto loads
) 
goto whatloadgoto

:allsettingtest
rem İ’è‚ÌŒ‡‘¹‚ğŒŸØ
:setting1load2
find "rebootokey=false" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
if {%bootbatnow%}=={no} (echo ˆ—’†...)
if %ErrorLevel%==0 (set setting1onoff=–³Œø) else if %ErrorLevel%==1 set setting1onoff=null&set /a allsettingerror=allsettingerror+1
if {%bootbatnow%}=={yes} (set batloadprgs=1&call :MOBAS_Loader)
if {%bootbatnow%}=={yes} (goto setting2load) else (goto whatloadgoto)

:setting2load2
find "admin=false" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
if {%bootbatnow%}=={no} (echo ˆ—’†...)
if %ErrorLevel%==0 (set setting2onoff=–³Œø) else if %ErrorLevel%==1 set setting2onoff=null&set /a allsettingerror=allsettingerror+1
if {%bootbatnow%}=={yes} (set batloadprgs=2&call :MOBAS_Loader)
if {%bootbatnow%}=={yes} (goto setting3load) else (goto whatloadgoto)

:setting3load2
find "CheckUpdate=false" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
if {%bootbatnow%}=={no} (echo ˆ—’†...)
if %ErrorLevel%==0 (set setting3onoff=–³Œø) else if %ErrorLevel%==1 set setting3onoff=null&set /a allsettingerror=allsettingerror+1
if {%bootbatnow%}=={yes} (set batloadprgs=3&call :MOBAS_Loader)
if {%bootbatnow%}=={yes} (goto setting4load) else (goto whatloadgoto)

:setting4load2
find "hatenakeikoku=false" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
if {%bootbatnow%}=={no} (echo ˆ—’†...)
if %ErrorLevel%==0 (set setting4onoff=–³Œø) else if %ErrorLevel%==1 set setting4onoff=null&set /a allsettingerror=allsettingerror+1
if {%bootbatnow%}=={yes} (set batloadprgs=4&call :MOBAS_Loader)
if {%bootbatnow%}=={yes} (goto setting5load2) else (goto whatloadgoto)

:setting5load2
find "bootanimation=false" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
if {%bootbatnow%}=={no} (echo ˆ—’†...)
if %ErrorLevel%==0 (set setting5onoff=–³Œø) else if %ErrorLevel%==1 set setting5onoff=null&set /a allsettingerror=allsettingerror+1
if {%bootbatnow%}=={yes} (set batloadprgs=5&call :MOBAS_Loader)
if {%bootbatnow%}=={yes} (goto wmodeload) else (goto whatloadgoto)

:wmodeload2
find "wmode=false" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
if {%bootbatnow%}=={no} (echo ˆ—’†...)
if {%ErrorLevel%}=={0} (set wmodeonoff=ƒzƒƒCƒgƒe[ƒ}‚É•ÏX&set wmodetoggle=false) else if {%ErrorLevel%}=={1} (set wmodeonoff=  null  ƒe[ƒ}‚É•ÏX&set wmodetoggle=false&set /a allsettingerror=allsettingerror+1)
if {%bootbatnow%}=={yes} (set batloadprgs=6&call :MOBAS_Loader)
if {%bootbatnow%}=={yes} (goto loads) else (goto whatloadgoto)

:loads
:wmodehazimeload
rem ƒzƒƒCƒgƒ‚[ƒh‚ğŒŸ’m‚µ‚ÄF‚ğ•ÏX
find "wmode=true" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
if {%errorlevel%}=={0} (color f0)
if {%bootbatnow%}=={no} (echo ˆ—’†...) else (
set batloadprgs=6
call :MOBAS_Loader
goto debughazimeload
)
if {%whatloadgoto%}=={hazime} (goto hazimemenu)
goto debughazimeload

:debughazimeload
rem ƒfƒoƒbƒNƒ‚[ƒh‚ÌŒŸ’m
find "debug=true" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
if {%errorlevel%}=={0} (echo on&set debugmode=debugmode)
if {%errorlevel%}=={1} (echo off&set debugmode=)
if {%bootbatnow%}=={no} (echo ˆ—’†...) else (
set batloadprgs=7
call :MOBAS_Loader
goto firststarttest
)
if {%1}=={devmode} (set devmode=true&goto firststarttest)
if {%whatloadgoto%}=={hazime} (goto hazimemenu)
goto firststarttest

:firststarttest
rem detect firstcursor.txt
setlocal enabledelayedexpansion
if exist ‰‰ñƒJ[ƒ\ƒ‹.txt (
find "nodogcheckforfastboot" ‰‰ñƒJ[ƒ\ƒ‹.txt > nul
if "!ErrorLevel!"=="1" (
set FirstCursorisEdited=true
    )
)
setlocal disabledelayedexpansion
if {%bootbatnow%}=={no} (echo ˆ—’†...) else (
set batloadprgs=8
call :MOBAS_Loader
goto cursorcolorload
)
if {%whatloadgoto%}=={hazime} (goto hazimemenu)
goto cursorcolorload

:cursorcolorload
rem ƒJ[ƒ\ƒ‹‚ÌF‚ğŒŸ’m
rem 0x0‚Í”’
rem 0x2‚Í•
reg query "HKEY_CURRENT_USER\Control Panel\Cursors" /v "Scheme Source" | find "0x0" > nul
if {%ErrorLevel%}=={0} (set cursorcolor=•)
if {%ErrorLevel%}=={1} (set cursorcolor=”’)
if {%bootbatnow%}=={no} (echo ˆ—’†...) else (
set batloadprgs=9
call :MOBAS_Loader
goto hazimecursorcolor2
)
if {%whatloadgoto%}=={hazime} (goto hazimemenu)

:hazimecursorcolor2
reg query "HKEY_CURRENT_USER\Control Panel\Cursors" /v "Scheme Source" | find "0x2" > nul
if {%ErrorLevel%}=={0} (set cursorcolor=”’)
if {%bootbatnow%}=={no} (echo ˆ—’†...) else (
set batloadprgs=10
call :MOBAS_Loader
goto :MOBAS_Loader_initializeVaribale
)
if {%whatloadgoto%}=={hazime} (goto hazimemenu)
goto hazimemenu


:MOBAS_Loader
rem ƒu[ƒgƒAƒjƒ[ƒVƒ‡ƒ“B
rem ‰º‚Í“Ç‚İ‚İ‚ÌƒeƒLƒXƒg•ªŠòB
if {%bootbatnow%}=={no} (cls & title ƒJ[ƒ\ƒ‹İ’è ˆ—’†... & echo ˆ—’†... & goto whatload) else (title ‹N“®’†...)
if {%simpleboot%}=={true} (cls & echo ‹N“®’†...& exit /b)
if {%wmodetoggle%}=={false} (set loadscrnprgsclr=[7m&set loadscrnprgsclrgra=[48;5;244m&set loadscrnprgsclr2=[0m&set back_to_the_firstline=[18;0H)
if {%wmodetoggle%}=={true} (set loadscrnprgsclr=[47m[97m&set loadscrnprgsclrgra=[48;5;244m&set loadscrnprgsclr2=[0m[107m[30m&set back_to_the_firstline=[18;0H) else (set loadscrnprgsclr=[7m&set loadscrnprgsclrgra=[48;5;244m&set loadscrnprgsclr2=[0m&set back_to_the_firstline=[18;0H)
if not defined invisiblecursor (echo [?25l&set invisiblecursor=true)

rem goofy ahh code
setlocal enabledelayedexpansion&if "!batloadprgs!" gtr "0" (set /a batloadprgsdelete=!batloadprgs!-1&set loadscrnprgs!batloadprgsdelete!=)&setlocal disabledelayedexpansion
if {%batloadprgs%}=={0} (set loadscrnprgs0=%loadscrnprgsclrgra%                                                     %loadscrnprgsclr2%)
if {%batloadprgs%}=={1} (set loadscrnprgs1=%loadscrnprgsclr%   %loadscrnprgsclr2%%loadscrnprgsclrgra%                                                  %loadscrnprgsclr2%)
if {%batloadprgs%}=={2} (set loadscrnprgs2=%loadscrnprgsclr%       %loadscrnprgsclr2%%loadscrnprgsclrgra%                                              %loadscrnprgsclr2%)
if {%batloadprgs%}=={3} (set loadscrnprgs3=%loadscrnprgsclr%           %loadscrnprgsclr2%%loadscrnprgsclrgra%                                          %loadscrnprgsclr2%)
if {%batloadprgs%}=={4} (set loadscrnprgs4=%loadscrnprgsclr%                %loadscrnprgsclr2%%loadscrnprgsclrgra%                                     %loadscrnprgsclr2%)
if {%batloadprgs%}=={5} (set loadscrnprgs5=%loadscrnprgsclr%                     %loadscrnprgsclr2%%loadscrnprgsclrgra%                                %loadscrnprgsclr2%)
if {%batloadprgs%}=={6} (set loadscrnprgs6=%loadscrnprgsclr%                           %loadscrnprgsclr2%%loadscrnprgsclrgra%                          %loadscrnprgsclr2%)
if {%batloadprgs%}=={7} (set loadscrnprgs7=%loadscrnprgsclr%                                  %loadscrnprgsclr2%%loadscrnprgsclrgra%                   %loadscrnprgsclr2%)
if {%batloadprgs%}=={8} (set loadscrnprgs8=%loadscrnprgsclr%                                         %loadscrnprgsclr2%%loadscrnprgsclrgra%            %loadscrnprgsclr2%)
if {%batloadprgs%}=={9} (set loadscrnprgs9=%loadscrnprgsclr%                                                %loadscrnprgsclr2%%loadscrnprgsclrgra%     %loadscrnprgsclr2%)
if {%batloadprgs%}=={10} (set loadscrnprgs10=%loadscrnprgsclr%                                                     %loadscrnprgsclr2%)                                                  
echo %back_to_the_firstline%
echo O=========================================================================O
echo.
echo                       ƒJ[ƒ\ƒ‹‘Ö‚¦‚ğ“Ç‚İ‚ñ‚Å‚¢‚Ü‚·...
echo           O=====================================================O
echo           I%loadscrnprgs0%%loadscrnprgs1%%loadscrnprgs2%%loadscrnprgs3%%loadscrnprgs4%%loadscrnprgs5%%loadscrnprgs6%%loadscrnprgs7%%loadscrnprgs8%%loadscrnprgs9%%loadscrnprgs10%I
echo           O=====================================================O
rem 37 ‘SŠp
rem 74 ”¼Šp
exit /b

:MOBAS_Loader_initializeVaribale
set loadscrnprgs9=&set loadscrnprgs10=&set loadscrnprgsclr=&set loadscrnprgsclr2=&set loadscrnprgsclrgra=
set batloadprgsdelete=&set back_to_the_firstline=
goto hazimemenu

:whatload

rem ‚±‚±‚Ìˆ—A‚¢‚é‚©‚È‚ŸH•’Ê‚Ésetting‚Ì’l‚ª—~‚µ‚¢‚¾‚¯‚È‚çsetting1load‚Æ‚©‚Égoto‚µ‚½‚¤‚¦‚Ås‚«æ‚ğwhatloadgoto‚É‘ã“ü‚·‚ê‚Î“®‚­‚Æv‚¤‚ñ‚¾‚¯‚Ç....
if {%wantload%}=={setting1} (goto setting1load) 
if {%wantload%}=={setting2} (goto setting2load)
if {%wantload%}=={setting3} (goto setting3load)
if {%wantload%}=={setting4} (goto setting4load)
if {%wantload%}=={setting5} (goto setting5load)
if {%wantload%}=={wmode} (goto wmodeload)
if {%wantload%}=={wmodehazime} (goto wmodehazimeload) 
if {%wantload%}=={debughazime} (goto debughazimeload)
if {%wantload%}=={syokaihazime} (goto syokaihazimeload)
if {%wantload%}=={cursorcolor} (goto cursorcolorload)
if {%wantload%}=={} (goto hazimemenu)
call :BSOD_Errors 2
pause
exit

:whatloadgoto
set wantload=
exit /b

rem ƒƒjƒ…[‚Ì¶¬‚Ì€”õ
:hazimemenu
cls
if {%bootbatnow%}=={no} (goto hazimemenuskipboot)
if {%bootbatnow%}=={yes} (set bootbatnow=no&goto batbootanimation)
:hazimemenuskipboot
setlocal disabledelayedexpansion
set wantload=
if {%runningfromfulldebug%}=={true} (set runningfromfulldebug=& exit /b)
if {%FromREConsole%}=={true} (cls&goto Cursor_Changer_REConsolemain)
set clrhelp=& set clrhelp2=
set settinghelptoggle=false
mode con: cols=75 lines=25
if {%hazimeeaster%}=={true} (set hazimebuild=%batbuild%)
if {%invisiblecursor%}=={true} (echo [?25h&set invisiblecursor=&cls)
set selected=
rem ƒƒjƒ…[‚Ì•`Ê
title ƒJ[ƒ\ƒ‹‘Ö‚¦ %debugmode% 
echo                              ƒJ[ƒ\ƒ‹‘Ö‚¦%batver% %debugmode% %hazimebuild%
echo.
echo   O=====================================================================O
echo   I     1ƒJ[ƒ\ƒ‹‚ğ%cursorcolor%F‚É‚·‚é           2“d‘ì              3I—¹        I
echo   I                                                                     I
echo   I                   4ƒo[ƒWƒ‡ƒ“î•ñ          5İ’è                    I
echo   O=====================================================================O
echo.
call :hazimeMessages
SET /P selected=”CˆÓ‚ÌÀs‚µ‚½‚¢”šA‚à‚µ‚­‚ÍƒAƒ‹ƒtƒ@ƒxƒbƒg‚ğ“ü—Í‚µ‚Ä‚­‚¾‚³‚¢... :
echo.
if {%selected%}=={} (goto hatenahazime)
if not {%selected%}=={} (echo %selected% ‚ª‘I‘ğ‚³‚ê‚Ü‚µ‚½B)

rem ‘I‘ğ‚Ì•ªŠò
if {%selected%}=={1} (set hatenaita=0&goto :cursorchange)
if {%selected%}=={a} (set hatenaita=0&goto :cursorchange)
if {%selected%}=={2} (set hatenaita=0&goto :startcal)
if {%selected%}=={b} (set hatenaita=0&goto :startcal)
if {%selected%}=={3} (set hatenaita=0&goto :exitmenu)
if {%selected%}=={c} (set hatenaita=0&goto :exitmenu)
if {%selected%}=={4} (set hatenaita=0&goto :batver)
if {%selected%}=={d} (set hatenaita=0&goto :batver)
if {%selected%}=={5} (set hatenaita=0&goto :setting)
if {%selected%}=={e} (set hatenaita=0&goto :setting)

rem ƒC[ƒXƒ^[ƒGƒbƒO
if {%selected%}=={easteregg} (goto :easteregg)
if {%selected%}=={egg} (goto :secret)
if {%selected%}=={egg1} (color 1f&call :BSOD_Errors 4)
if {%selected%}=={egg2} (goto :Dogcheck)
if {%selected%}=={wwssdadaba} (set hatenaita=0&goto littleeasteregg)
if {%selected%}=={tamago1908} (echo :P&pause&goto hazime)
if {%selected%}=={himazinnoob1908} (echo :D&pause&goto hazime)
if {%selected%}=={mskg1908} (echo xD&pause&goto hazime)
if {%selected%}=={1908} (goto :1908hell)
if {%selected%}=={toxic} (start chrome.exe --window-size=0,0 --incognito -- https://www.youtube.com/watch?v=N6ael_DEPcs&goto hazime)
if {%selected%}=={abcdefu} (start chrome.exe --window-size=0,0 --incognito -- https://www.youtube.com/watch?v=qgRx58oItTk&goto hazime)
if {%selected%}=={dogsong} (start chrome.exe --window-size=0,0 --incognito -- https://www.youtube.com/watch?v=H4wptBuM6zs&goto hazime)
if {%selected%}=={„‚Í–°‚¢‚Å‚·} (echo ‰´‚à‚¾I&pause& goto hazime)

rem ƒfƒoƒbƒO—pƒRƒ}ƒ“ƒh‚ÌQÆ
if {%selected%}=={inspectentirecommandlist} (goto :allcommands)

rem ƒfƒoƒbƒO—p
if {%selected%}=={crashtest} (exit /b)
if {%selected%}=={alldefnow1} (goto :AllDefult1)
if {%selected%}=={playdefboot} (set hatenaita=0&cls&goto :CursorChangerOOBEdev)
if {%selected%}=={debugyesnow} (goto :kurogo)
if {%selected%}=={reload} (set bootbatnow=yes&goto batstart)
if {%selected%}=={fulldebug} (goto fulldebug)
if {%selected%}=={getadmin} (goto :batstartadm)
if {%selected%}=={bypassfirstboot} (set hatenaita=0&set firststartbat=no&goto overwritesetting)
if {%selected%}=={alldefdeletebat} (set hatenaita=0&echo delete bat, confirm to type something...&pause&goto alldefdeletefinish5)
if {%selected%}=={windowsfiltertest} (goto :batbootcheckwinverbad)
if {%selected%}=={funanimationdeb} (goto :batbootanimationfun)
if {%selected%}=={openie} (goto :openiedev)
if {%selected%}=={setenter} (echo.&set /p hatenaita=pls type:&goto :hazime)

rem FUCK YOU!!!!!!
if {%selected%}=={fucku} (echo fuck you too&pause&goto hazime)
if {%selected%}=={fuckyou} (echo fuck you too&pause&goto hazime)
if {%selected%}=={fucu} (echo fuck you too&pause&goto hazime)
if {%selected%}=={fucyou} (echo fuck you too&pause&goto hazime)

if {%selected%}=={exit} (goto :exitmenu)
if {%selected%}=={counttestdeb} (set hatenaita=0&goto :testinthecalbeep) else echo. &echo –³Œø‚Èi‚à‚µ‚­‚Íg—p•s‰Â‚Èj‘I‘ğ‚Å‚·I—LŒø‚È“ü—Í‚ğ‚µ‚Ä‚­‚¾‚³‚¢B&pause&goto hazime

rem ‰½‚à“ü—Í‚µ‚È‚©‚Á‚½ê‡‚Ì‹AŠÒˆ—
:hatenahazime
echo ?
echo.
pause
echo ‚·‚İ‚Ü‚¹‚ñB‰½‚©“ü—Í‚µ‚Ä‚­‚ê‚Ü‚¹‚ñ‚©H
echo.
pause
if "%hatenakeikoku%"=="–³Œø" (goto hazime)

rem ’·‰Ÿ‚µ‚ğŒŸ’m‚·‚é‚½‚ß‚Ì‹@\
set /a hatenaita=hatenaita+1
if %hatenaita% gtr 20  (goto :hatenaokotest1)
goto :hazime

:hatenaokotest1
if not %hatenaita% gtr 50 (goto hatenaoko1)
if %hatenaita% gtr 50 (goto hatenaokotest2)

:hatenaokotest2
if not %hatenaita% gtr 100 (goto hatenaoko2)
if %hatenaita% gtr 100 (goto hatenaokotest3)

:hatenaokotest3
if not %hatenaita% gtr 130 (goto hatenaoko3)
if %hatenaita% gtr 130 (goto hatenaokotest4)

:hatenaokotest4
if not %hatenaita% gtr 200 (goto hatenaoko4)
if %hatenaita% gtr 200 (goto hatenaokotest5)

:hatenaokotest5
if not %hatenaita% gtr 250 (goto hatenaoko5)
if %hatenaita% gtr 250 (goto hatenaoko6)

rem ’·‰Ÿ‚µ‚ÌŒxƒƒbƒZ[ƒWW
:hatenaoko1
if %hatenaita% gtr 21 (goto :hazime)
echo Dim answer:answer = MsgBox("‚ñH‚ÈA‚È‚É‚µ‚Ä‚é‚ÌH",vbOKCancel,"‚ñH"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
rem ƒtƒ@ƒCƒ‹íœ
del /Q %TEMP%\msgbox.vbs
goto :hazime

:hatenaoko2
if %hatenaita% gtr 51 (goto :hazime)
echo Dim answer:answer = MsgBox("‚¿‚åA‚¿‚å‚Á‚ÆI‚»‚±‚Ü‚Å‘Å‚¿ŠÔˆá‚¦‚È‚¢‚Å‚µ‚åI",vbOKCancel,"‚à‚µ‚©‚µ‚Ä..."):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
rem ƒtƒ@ƒCƒ‹íœ
del /Q %TEMP%\msgbox.vbs
goto :hazime

:hatenaoko3
if %hatenaita% gtr 101 (goto :hazime)
echo Dim answer:answer = MsgBox("‚¨‚¢‚±‚ÌI‚³‚·‚ª‚É100‰ñ‚à‘Å‚¿ŠÔˆá‚¦‚È‚¢‚¾‚ëI‚Ó‚´‚¯‚ñ‚ÈI",vbOKCancel,"ŠmM”Æ"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
rem ƒtƒ@ƒCƒ‹íœ
del /Q %TEMP%\msgbox.vbs
goto :hazime

:hatenaoko4
if %hatenaita% gtr 131 (goto :hazime)
echo Dim answer:answer = MsgBox("‚¿‚å‚Á‚ÆI‚³‚·‚ª‚É‚â‚ß‚Ä‚­‚êIIIII",vbOKCancel,"..."):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
rem ƒtƒ@ƒCƒ‹íœ
del /Q %TEMP%\msgbox.vbs
goto :hazime

:hatenaoko5
if %hatenaita% gtr 201 (goto :hazime)
echo Dim answer:answer = MsgBox("‚±‚êˆÈã‚â‚Á‚½‚çŒã‰÷‚³‚¹‚Ü‚·B200‰ñ‚à...",vbOKCancel,"ÅŒã‚ÌŒx"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
rem ƒtƒ@ƒCƒ‹íœ
del /Q %TEMP%\msgbox.vbs
goto :hazime

:hatenaoko6
if %hatenaita% gtr 251 (goto :hazime)
echo Dim answer:answer = MsgBox("..........",vbOKCancel,""):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
del /Q %TEMP%\msgbox.vbs
shutdown /s /t 5 /c "Œã‰÷‚·‚é‚ª‚æ‚¢B"
taskkill /im cmd.exe
goto :reboot

:hazimeMessages
if "%messagealreadyshowed%"=="false" (set messagealreadyshowed=true) else (exit /b)
if "%FirstCursorisEdited%"=="true" (echo                        ŠÈ’P‚É@‚©‚«‚©‚¦‚ç‚ê‚½@‚Å‚µ‚åH&echo.&set FirstCursorisEdited=)

if "%Updateavailable%"=="true" (
    title ƒJ[ƒ\ƒ‹‘Ö‚¦ XV‚ª—˜—p‰Â”\ ^(Œ±“I^)
  setlocal enabledelayedexpansion
    if "%batbeta%"=="True" (set batbetamessage=^(ƒqƒ“ƒg : ‚±‚Ìƒo[ƒWƒ‡ƒ“‚Íƒx[ƒ^”Å‚Å‚·BƒoƒO‚â–â‘è‚ª‚ ‚é‰Â”\«‚ª‚ ‚è‚Ü‚·B ^))
  echo ƒAƒbƒvƒf[ƒg‚ª—˜—p‰Â”\‚Å‚·I ^(%updatemyversion%to %updateversion%^)
  echo ƒAƒbƒvƒf[ƒg‚µ‚Ü‚·‚©H^(ƒAƒbƒvƒf[ƒg‚·‚é‚Æ‰pŒê”Å‚Ö‹­§“I‚É•ÏX‚³‚ê‚Ü‚·^) !batbetamessage!
  set batbetamessage=
  SET /P updateselected=^(Y ‚Ü‚½‚Í N^) :
  if {!updateselected!}=={y} (set updateselected=&set updateavailable=&echo.&echo ƒAƒbƒvƒf[ƒg’†...‚µ‚Î‚ç‚­‚¨‘Ò‚¿‚­‚¾‚³‚¢B&set batbootpowershell=Doupdate&call :batbootpowershell&echo ƒAƒbƒvƒf[ƒg‚É¬Œ÷‚µ‚Ü‚µ‚½B&pause&exit)
if {!updateselected!}=={n} (set updateselected=&set updateavailable=&echo.&echo ƒAƒbƒvƒf[ƒg‚ÍƒLƒƒƒ“ƒZƒ‹‚³‚ê‚Ü‚µ‚½B‹N“®‚ÉƒAƒbƒvƒf[ƒg‚ğŠm”F‚·‚é‹@”\‚Íİ’è‚©‚ç–³Œø‚É‚Å‚«‚Ü‚·B&pause&set checkupdatetoggle=false&set messagealreadyshowed=false&exit /b)
setlocal disabledelayedexpansion
)
exit /b

:exitmenu
cls
if {%wmodetoggle%}=={false} (set clr=[7m&set clred=[41m&set clrgrn=[42m&set clryel=[43m&set clrmag=[46m&set clrgra=[90m&set clrcyan=[46m&set clr2=[0m)
if {%wmodetoggle%}=={true} (set clr=[100m[97m&set clred=[41m&set clrgrn=[42m&set clryel=[43m&set clrmag=[45m&set clrgra=[0m[107m&set clrcyan=[46m&set clr2=[90m[107m[30m)
if defined %wmodetoggle% (set clr=[7m&set clred=[41m&set clrgrn=[42m&set clryel=[43m&set clrmag=[45m&set clrcyan=[46m&set clrgra=[90m&set clr2=[0m)
title ƒJ[ƒ\ƒ‹‘Ö‚¦‚ÌI—¹ %debugmode% 
set selected=
echo                              %clrgra%ƒJ[ƒ\ƒ‹‘Ö‚¦%batver% %debugmode% %hazimebuild%%clr2%
echo.
echo   %clrgra%O================== %clr2%O================O%clrgra% ===============================O%clr2%
echo   %clrgra%I       1ƒJ[ƒ\ƒ‹‚ğ %clr2%I  ƒoƒbƒ`‚ÌI—¹  I%clrgra% “d‘ì              3I—¹        I%clr2%
echo   %clrgra%I                   %clr2%O==========O==========O===========O%clrgra%               I%clr2%
echo   %clrgra%I               4ƒo %clr2%I     ^|    I   /~~~\  I           I%clrgra%               I%clr2%
echo   %clrgra%O================== %clr2%I   / ^| \  I  V    È I  ^-^-^-^-^-^-^>  I%clrgra% ==============O%clr2%
echo                       I   \___/  I   \___/  I           I       
echo                       O==========O==========O===========O
echo                       I ‰½‚à‘I‘ğ‚µ‚Ä‚¢‚Ü‚¹‚ñB          I
echo                       O=================================O
echo.
choice /c 123adye /n /m "[1 2 3] ‚©A [A D] ‚ğ‰Ÿ‚µ‚Ä‘I‘ğ‚µ‚½‚Ì‚¿A [Y E]‚ğ‰Ÿ‚µ‚ÄŒˆ’è‚µ‚Ü‚·B"
if %ErrorLevel%==1 goto exitmenu1
if %ErrorLevel%==2 goto exitmenu2
if %ErrorLevel%==3 goto exitmenu3
if %ErrorLevel%==4 goto exitmenu1
if %ErrorLevel%==5 goto exitmenu1
if %ErrorLevel%==6 goto exitmenu1
if %ErrorLevel%==7 goto exitmenu1
goto :hazime

:exitmenu1
cls
set selected=
echo                              %clrgra%ƒJ[ƒ\ƒ‹‘Ö‚¦%batver% %debugmode% %hazimebuild%%clr2%
echo.
echo   %clrgra%O================== %clr2%O================O%clrgra% ===============================O%clr2%
echo   %clrgra%I       1ƒJ[ƒ\ƒ‹‚ğ %clr2%I  ƒoƒbƒ`‚ÌI—¹  I%clrgra% “d‘ì              3I—¹        I%clr2%
echo   %clrgra%I                   %clr2%O==========O==========O===========O%clrgra%               I%clr2%
echo   %clrgra%I               4ƒo %clr2%I%clred%     ^|    %clr2%I   /~~~\  I           I%clrgra%               I%clr2%
echo   %clrgra%O================== %clr2%I%clred%   / ^| \  %clr2%I  V    È I  ^-^-^-^-^-^-^>  I%clrgra% ==============O%clr2%
echo                       I%clred%   \___/  %clr2%I   \___/  I           I       
echo                       O==========O==========O===========O
echo                       I I—¹‚ª‘I‘ğ‚³‚ê‚Ü‚µ‚½B          I
echo                       O=================================O
echo.
choice /c 123adye /n /m "[1 2 3] ‚©A [A D] ‚ğ‰Ÿ‚µ‚Ä‘I‘ğ‚µ‚½‚Ì‚¿A [Y E]‚ğ‰Ÿ‚µ‚ÄŒˆ’è‚µ‚Ü‚·B"
if %ErrorLevel%==1 goto exitmenu1
if %ErrorLevel%==2 goto exitmenu2
if %ErrorLevel%==3 goto exitmenu3
if %ErrorLevel%==4 goto exitmenu1
if %ErrorLevel%==5 goto exitmenu2
if %ErrorLevel%==6 goto exitmenu1y
if %ErrorLevel%==7 goto exitmenu1y
goto :hazime

:exitmenu2
cls
set selected=
echo                              %clrgra%ƒJ[ƒ\ƒ‹‘Ö‚¦%batver% %debugmode% %hazimebuild%%clr2%
echo.
echo   %clrgra%O================== %clr2%O================O%clrgra% ===============================O%clr2%
echo   %clrgra%I       1ƒJ[ƒ\ƒ‹‚ğ %clr2%I  ƒoƒbƒ`‚ÌI—¹  I%clrgra% “d‘ì              3I—¹        I%clr2%
echo   %clrgra%I                   %clr2%O==========O==========O===========O%clrgra%               I%clr2%
echo   %clrgra%I               4ƒo %clr2%I     ^|    I%clrgrn%   /~~~\  %clr2%I           I%clrgra%               I%clr2%
echo   %clrgra%O================== %clr2%I   / ^| \  I%clrgrn%  V    È %clr2%I  ^-^-^-^-^-^-^>  I%clrgra% ==============O%clr2%
echo                       I   \___/  I%clrgrn%   \___/  %clr2%I           I       
echo                       O==========O==========O===========O
echo                       I Ä‹N“®‚ª‘I‘ğ‚³‚ê‚Ü‚µ‚½B        I
echo                       O=================================O
echo.
choice /c 123adye /n /m "[1 2 3] ‚©A [A D] ‚ğ‰Ÿ‚µ‚Ä‘I‘ğ‚µ‚½‚Ì‚¿A [Y E]‚ğ‰Ÿ‚µ‚ÄŒˆ’è‚µ‚Ü‚·B"
if %ErrorLevel%==1 goto exitmenu1
if %ErrorLevel%==2 goto exitmenu2
if %ErrorLevel%==3 goto exitmenu3
if %ErrorLevel%==4 goto exitmenu1
if %ErrorLevel%==5 goto exitmenu3
if %ErrorLevel%==6 goto exitmenu2y
if %ErrorLevel%==7 goto exitmenu2y
goto :hazime

:exitmenu3
cls
set selected=
echo                              %clrgra%ƒJ[ƒ\ƒ‹‘Ö‚¦%batver% %debugmode% %hazimebuild%%clr2%
echo.
echo   %clrgra%O================== %clr2%O================O%clrgra% ===============================O%clr2%
echo   %clrgra%I       1ƒJ[ƒ\ƒ‹‚ğ %clr2%I  ƒoƒbƒ`‚ÌI—¹  I%clrgra% “d‘ì              3I—¹        I%clr2%
echo   %clrgra%I                   %clr2%O==========O==========O===========O%clrgra%               I%clr2%
echo   %clrgra%I               4ƒo %clr2%I     ^|    I   /~~~\  I%clrcyan%           %clr2%I%clrgra%               I%clr2%
echo   %clrgra%O================== %clr2%I   / ^| \  I  V    È I%clrcyan%  ^-^-^-^-^-^-^>  %clr2%I%clrgra% ==============O%clr2%
echo                       I   \___/  I   \___/  I%clrcyan%           %clr2%I       
echo                       O==========O==========O===========O
echo                       I –ß‚é‚ª‘I‘ğ‚³‚ê‚Ü‚µ‚½B          I
echo                       O=================================O
echo.
choice /c 123adye /n /m "[1 2 3] ‚©A [A D] ‚ğ‰Ÿ‚µ‚Ä‘I‘ğ‚µ‚½‚Ì‚¿A [Y E]‚ğ‰Ÿ‚µ‚ÄŒˆ’è‚µ‚Ü‚·B"
if %ErrorLevel%==1 goto exitmenu1
if %ErrorLevel%==2 goto exitmenu2
if %ErrorLevel%==3 goto exitmenu3
if %ErrorLevel%==4 goto exitmenu2
if %ErrorLevel%==5 goto exitmenu3
if %ErrorLevel%==6 call :exitmenuexit&goto hazime
if %ErrorLevel%==7 call :exitmenuexit&goto hazime
goto :hazime


rem confirm

:exitmenu1y
cls
set selected=
echo                              %clrgra%ƒJ[ƒ\ƒ‹‘Ö‚¦%batver% %debugmode% %hazimebuild%%clr2%
echo.
echo   %clrgra%O================== %clr2%O================O%clrgra% ===============================O%clr2%
echo   %clrgra%I       1ƒJ[ƒ\ƒ‹‚ğ %clr2%I  ƒoƒbƒ`‚ÌI—¹  I%clrgra% “d‘ì              3I—¹        I%clr2%
echo   %clrgra%I                   %clr2%O==========O==========O===========O%clrgra%               I%clr2%
echo   %clrgra%I                4ba%clr2%I%clred%     ^|    %clr2%I   /~~~\  I           I%clrgra%               I%clr2%
echo   %clrgra%O================== %clr2%I%clred%   / ^| \  %clr2%I  V    È I  ^-^-^-^-^-^-^>  I%clrgra% ==============O%clr2%
echo                       I%clred%   \___/  %clr2%I   \___/  I           I       
echo                       O==========O==========O===========O
echo                       I –{“–‚ÉH                        I
echo                       O=================================O
echo.
choice /c 123adyeb /n /m "[1 2 3] ‚©A [A D] ‚ğ‰Ÿ‚µ‚Ä‘I‘ğ‚µ‚½‚Ì‚¿A [Y E]‚ğ‰Ÿ‚µ‚ÄŒˆ’è‚µ‚Ü‚·B"
if %ErrorLevel%==1 goto exitmenu1
if %ErrorLevel%==2 goto exitmenu2
if %ErrorLevel%==3 goto exitmenu3
if %ErrorLevel%==4 goto exitmenu1
if %ErrorLevel%==5 goto exitmenu2
if %ErrorLevel%==6 goto batshutdown
if %ErrorLevel%==7 goto batshutdown
if %ErrorLevel%==8 goto exitmenu1
goto :hazime

:exitmenu2y
cls
set selected=
echo                              %clrgra%ƒJ[ƒ\ƒ‹‘Ö‚¦%batver% %debugmode% %hazimebuild%%clr2%
echo.
echo   %clrgra%O================== %clr2%O================O%clrgra% ===============================O%clr2%
echo   %clrgra%I       1ƒJ[ƒ\ƒ‹‚ğ %clr2%I  ƒoƒbƒ`‚ÌI—¹  I%clrgra% “d‘ì              3I—¹        I%clr2%
echo   %clrgra%I                   %clr2%O==========O==========O===========O%clrgra%               I%clr2%
echo   %clrgra%I               4ƒo %clr2%I     ^|    I%clrgrn%   /~~~\  %clr2%I           I%clrgra%               I%clr2%
echo   %clrgra%O================== %clr2%I   / ^| \  I%clrgrn%  V    È %clr2%I  ^-^-^-^-^-^-^>  I%clrgra% ==============O%clr2%
echo                       I   \___/  I%clrgrn%   \___/  %clr2%I           I       
echo                       O==========O==========O===========O
echo                       I –{“–‚ÉH                        I
echo                       O=================================O
echo.
choice /c 123adyeb /n /m "[1 2 3] ‚©A [A D] ‚ğ‰Ÿ‚µ‚Ä‘I‘ğ‚µ‚½‚Ì‚¿A [Y E]‚ğ‰Ÿ‚µ‚ÄŒˆ’è‚µ‚Ü‚·B"
if %ErrorLevel%==1 goto exitmenu1
if %ErrorLevel%==2 goto exitmenu2
if %ErrorLevel%==3 goto exitmenu3
if %ErrorLevel%==4 goto exitmenu1
if %ErrorLevel%==5 goto exitmenu3
if %ErrorLevel%==6 (call :exitmenuexit &set bootbatnow=yes&goto batstart)
if %ErrorLevel%==7 (call :exitmenuexit &set bootbatnow=yes&goto batstart)
if %ErrorLevel%==8 goto exitmenu2
goto :hazime


:batshutdown
title ƒAƒŠ[ƒ”ƒFƒfƒ‹ƒ`
cls
echo.
echo                            ƒJ[ƒ\ƒ‹‘Ö‚¦%batver% %debugmode%
echo.
echo O=========================================================================O
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
echo O=========================================================================O
echo.
echo                        2021-2024 tamago1908 %batbuild%
call :exitmenuexit
timeout /t 3 /nobreak >nul
exit

:exitmenuexit
set clrcyan=
set clrgra=
set clred=
set clrgrn=
set clryel=
set clrmag=
exit /b


rem İ’èƒƒjƒ…[‚Ì•`Ê
:setting
set wantload=
set settinghelptoggle=false
if {%wmodetoggle%}=={false} (set clr=[7m&set clr2=[0m)
if {%wmodetoggle%}=={true} (set clr=[100m[97m&set clr2=[0m[107m[30m)
if defined %wmodetoggle% (set clr=[7m&set clr2=[0m)
rem İ’èƒtƒ@ƒCƒ‹‚ª‘¶İ‚·‚é‚©‚ğŒŸ’m
cd /d %HOMEDRIVE%%HOMEPATH%
rem êŠ OS‚ª“ü‚Á‚½ƒhƒ‰ƒCƒu:\Users\ƒ†[ƒU[–¼
rem (—á ƒ†[ƒU[‚Ì–¼‘O‚ªtest‚¾‚Á‚½ê‡‚ÆAOS‚ª“ü‚Á‚½êŠ‚ªCƒhƒ‰ƒCƒu‚¾‚Á‚½ê‡‚¾‚Æ C:\Users\Test)
if not exist ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt (goto dogcheck)
title ƒJ[ƒ\ƒ‹İ’è %debugmode%
set selected=
if not defined {%clrgra%} (set clrgra=[90m)
Cls
Echo.
Echo                               İ’èƒƒjƒ…[ Ver2!!
echo. 
echo O========================O                  O======O
echo I      ƒJƒeƒSƒŠ[        I                  I İ’è I
echo O========================O==================O======O======================O
echo I                        I                                                I
echo I  ƒJ[ƒ\ƒ‹‘Ö‚¦  ‹@”\Œn  I  ƒJƒeƒSƒŠ[‚ª‘I‘ğ‚³‚ê‚Ä‚¢‚Ü‚¹‚ñB              I
echo I                        I                                                I
echo O========================I                                                I
Echo O  ƒJƒeƒSƒŠ[  ã‚©‰º‚©  I                                                I
Echo O========================I                                                I
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
if %ErrorLevel%==1 goto settingcategory1
if %ErrorLevel%==2 goto settingcategory2
if %ErrorLevel%==3 goto settingcategory1
if %ErrorLevel%==4 goto settingcategory1
if %ErrorLevel%==5 goto settingcategory1
if %ErrorLevel%==6 goto hazime
if %ErrorLevel%==7 goto settingcategory1
if %ErrorLevel%==8 goto settingcategory1
if %ErrorLevel%==9 goto settingcategoryhelpmode

:settingcategory1
title ƒJ[ƒ\ƒ‹İ’è %debugmode%
set selected=
Cls
Echo.
Echo                               İ’èƒƒjƒ…[ Ver2!!
echo. 
echo O========================O                  O======O
echo I      ƒJƒeƒSƒŠ[        I                  I İ’è I
echo O========================O==================O======O======================O
echo I%clr%                        %clr2%I                                                I
echo I%clr%  ƒJ[ƒ\ƒ‹‘Ö‚¦  ‹@”\Œn  %clr2%I  ƒJ[ƒ\ƒ‹‘Ö‚¦‚Ì‹@”\‚ÉŠÖ‚·‚éİ’è‚Å‚·B          I
echo I%clr%                        %clr2%I                                                I
echo O========================I                                                I
Echo O  ƒJƒeƒSƒŠ[  ã‚©‰º‚©  I                                                I
Echo O========================I                                                I
Echo I                        I                                                I
echo I ƒJ[ƒ\ƒ‹‘Ö‚¦  Œ©‚½–ÚŒn I                                                I
echo I                        I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ƒwƒ‹ƒvƒ‚[ƒh      %clrhelp2%I  I ˆÚ“® : W A S D ”š I –ß‚é : B I Œˆ’è : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12wsdbye3 /n /m "•ÏX‚·‚é‚à‚Ì‚ğ”š‚Åw’è–”‚Íwasd‚ÅˆÚ“®‚µ‚Äw’è‚µ‚Ä‚­‚¾‚³‚¢"
if %ErrorLevel%==1 goto settingcategory1
if %ErrorLevel%==2 goto settingcategory2
if %ErrorLevel%==3 goto settingcategory1
if %ErrorLevel%==4 goto settingcategory2
if %ErrorLevel%==5 goto settingcategory1int
if %ErrorLevel%==6 goto hazime
if %ErrorLevel%==7 goto settingcategory1int
if %ErrorLevel%==8 goto settingcategory1int
if %ErrorLevel%==9 goto settingcategoryhelpmode

:settingcategory2
rem İ’èƒtƒ@ƒCƒ‹‚ª‘¶İ‚·‚é‚©‚ğŒŸ’m
cd /d %HOMEDRIVE%%HOMEPATH%
rem êŠ OS‚ª“ü‚Á‚½ƒhƒ‰ƒCƒu:\Users\ƒ†[ƒU[–¼
rem (—á ƒ†[ƒU[‚Ì–¼‘O‚ªtest‚¾‚Á‚½ê‡‚ÆAOS‚ª“ü‚Á‚½êŠ‚ªCƒhƒ‰ƒCƒu‚¾‚Á‚½ê‡‚¾‚Æ C:\Users\Test)
if not exist ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt (goto dogcheck)
title ƒJ[ƒ\ƒ‹İ’è %debugmode%
set selected=
if not defined {%clrgra%} (set clrgra=[90m)
Cls
Echo.
Echo                               İ’èƒƒjƒ…[ Ver2!!
echo. 
echo O========================O                  O======O
echo I      ƒJƒeƒSƒŠ[        I                  I İ’è I
echo O========================O==================O======O======================O
echo I                        I                                                I
echo I  ƒJ[ƒ\ƒ‹‘Ö‚¦  ‹@”\Œn  I  ƒJ[ƒ\ƒ‹‘Ö‚¦‚ÌŒ©‚½–Ú‚ÉŠÖ‚·‚éİ’è‚Å‚·B        I
echo I                        I %clrgra%iƒe[ƒ}‚È‚Çj%clr2%                                 I
echo O========================I                                                I
Echo O  ƒJƒeƒSƒŠ[  ã‚©‰º‚©  I                                                I
Echo O========================I                                                I
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
if %ErrorLevel%==1 goto settingcategory1
if %ErrorLevel%==2 goto settingcategory2
if %ErrorLevel%==3 goto settingcategory1
if %ErrorLevel%==4 goto settingcategoryhelpmode
if %ErrorLevel%==5 goto settingcategory2int
if %ErrorLevel%==6 goto hazime
if %ErrorLevel%==7 goto settingcategory2int
if %ErrorLevel%==8 goto settingcategory2int
if %ErrorLevel%==9 goto settingcategoryhelpmode

rem ƒJƒeƒSƒŠ[“à•”

:settingcategory1int
title ƒJ[ƒ\ƒ‹İ’è %debugmode%
set selected=
Cls
Echo.
Echo                               İ’èƒƒjƒ…[ Ver2!!
echo. 
echo O========================O                  O======O
echo I      ƒJƒeƒSƒŠ[        I                  I İ’è I
echo O========================O==================O======O===========O==========O
echo I%clr%                        %clr2%I 1 •ÏXŒã‚ÌÄ‹N“®‚ÌŠm”F              I   %setting1onoff%   I
echo I%clr%  ƒJ[ƒ\ƒ‹‘Ö‚¦  ‹@”\Œn  %clr2%I                                     O==========O
echo I%clr%                        %clr2%I 2 ‹N“®‚ÌƒAƒhƒ~ƒ“                  I   %setting2onoff%   I
echo O========================I                                     O==========O
Echo O  ƒJƒeƒSƒŠ[  ã‚©‰º‚©  I 3 ‹N“®‚ÉXVŠm”F                  I   %setting3onoff%   I
Echo O========================I                                     O==========O
Echo I                        I 4 Enter‚Ì’·‰Ÿ‚µ‚ğŒŸ’m‚·‚é‹@”\       I   %setting4onoff%   I
echo I ƒJ[ƒ\ƒ‹‘Ö‚¦  Œ©‚½–ÚŒn I                                     O==========O
echo I                        I 5 ‰Šú‰»‚Ü‚½‚ÍƒAƒ“ƒCƒ“ƒXƒg[ƒ‹                 I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ƒwƒ‹ƒvƒ‚[ƒh      %clrhelp2%I  I ˆÚ“® : W A S D ”š I –ß‚é : B I Œˆ’è : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12wsdbye3 /n /m "•ÏX‚·‚é‚à‚Ì‚ğ”š‚Åw’è–”‚Íwasd‚ÅˆÚ“®‚µ‚Äw’è‚µ‚Ä‚­‚¾‚³‚¢"
if %ErrorLevel%==1 goto settingcategory1
if %ErrorLevel%==2 goto settingcategory2
if %ErrorLevel%==3 goto settingcategory1
if %ErrorLevel%==4 goto settingcategory2
if %ErrorLevel%==5 goto settingcategory1intsetting1
if %ErrorLevel%==6 goto settingcategory1
if %ErrorLevel%==7 goto settingcategory1intsetting1
if %ErrorLevel%==8 goto settingcategory1intsetting1
if %ErrorLevel%==9 goto settingcategoryhelpmode

:settingcategory1intsetting1
title ƒJ[ƒ\ƒ‹İ’è %debugmode%
set selected=
Cls
Echo.
Echo                               İ’èƒƒjƒ…[ Ver2!!
echo. 
echo O========================O                  O======O
echo I      ƒJƒeƒSƒŠ[        I                  I İ’è I
echo O========================O==================O======O===========O==========O
echo I%clr%                        %clr2%I %clr%1 •ÏXŒã‚ÌÄ‹N“®‚ÌŠm”F%clr2%              I   %setting1onoff%   I
echo I%clr%  ƒJ[ƒ\ƒ‹‘Ö‚¦  ‹@”\Œn  %clr2%I                                     O==========O
echo I%clr%                        %clr2%I 2 ‹N“®‚ÌƒAƒhƒ~ƒ“                  I   %setting2onoff%   I
echo O========================I                                     O==========O
Echo O  ƒJƒeƒSƒŠ[  ã‚©‰º‚©  I 3 ‹N“®‚ÉXVŠm”F                  I   %setting3onoff%   I
Echo O========================I                                     O==========O
Echo I                        I 4 Enter‚Ì’·‰Ÿ‚µ‚ğŒŸ’m‚·‚é‹@”\       I   %setting4onoff%   I
echo I ƒJ[ƒ\ƒ‹‘Ö‚¦  Œ©‚½–ÚŒn I                                     O==========O
echo I                        I 5 ‰Šú‰»‚Ü‚½‚ÍƒAƒ“ƒCƒ“ƒXƒg[ƒ‹                 I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ƒwƒ‹ƒvƒ‚[ƒh      %clrhelp2%I  I ˆÚ“® : W A S D ”š I –ß‚é : B I Œˆ’è : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12345wsabye /n /m "•ÏX‚·‚é‚à‚Ì‚ğ”š‚Åw’è–”‚Íwasd‚ÅˆÚ“®‚µ‚Äw’è‚µ‚Ä‚­‚¾‚³‚¢"
if %ErrorLevel%==1 goto settingcategory1intsetting1
if %ErrorLevel%==2 goto settingcategory1intsetting2
if %ErrorLevel%==3 goto settingcategory1intsetting3
if %ErrorLevel%==4 goto settingcategory1intsetting4
if %ErrorLevel%==5 goto settingcategory1intsetting5
if %ErrorLevel%==6 goto settingcategory1intsetting1
if %ErrorLevel%==7 goto settingcategory1intsetting2
if %ErrorLevel%==8 goto settingcategory1int
if %ErrorLevel%==9 goto settingcategory1int
if %ErrorLevel%==10 goto setting1
if %ErrorLevel%==11 goto setting1

:settingcategory1intsetting2
title ƒJ[ƒ\ƒ‹İ’è %debugmode%
set selected=
Cls
Echo.
Echo                               İ’èƒƒjƒ…[ Ver2!!
echo. 
echo O========================O                  O======O
echo I      ƒJƒeƒSƒŠ[        I                  I İ’è I
echo O========================O==================O======O===========O==========O
echo I%clr%                        %clr2%I 1 •ÏXŒã‚ÌÄ‹N“®‚ÌŠm”F              I   %setting1onoff%   I
echo I%clr%  ƒJ[ƒ\ƒ‹‘Ö‚¦  ‹@”\Œn  %clr2%I                                     O==========O
echo I%clr%                        %clr2%I %clr%2 ‹N“®‚ÌƒAƒhƒ~ƒ“%clr2%                  I   %setting2onoff%   I
echo O========================I                                     O==========O
Echo O  ƒJƒeƒSƒŠ[  ã‚©‰º‚©  I 3 ‹N“®‚ÉXVŠm”F                  I   %setting3onoff%   I
Echo O========================I                                     O==========O
Echo I                        I 4 Enter‚Ì’·‰Ÿ‚µ‚ğŒŸ’m‚·‚é‹@”\       I   %setting4onoff%   I
echo I ƒJ[ƒ\ƒ‹‘Ö‚¦  Œ©‚½–ÚŒn I                                     O==========O
echo I                        I 5 ‰Šú‰»‚Ü‚½‚ÍƒAƒ“ƒCƒ“ƒXƒg[ƒ‹                 I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ƒwƒ‹ƒvƒ‚[ƒh      %clrhelp2%I  I ˆÚ“® : W A S D ”š I –ß‚é : B I Œˆ’è : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12345wsabye /n /m "•ÏX‚·‚é‚à‚Ì‚ğ”š‚Åw’è–”‚Íwasd‚ÅˆÚ“®‚µ‚Äw’è‚µ‚Ä‚­‚¾‚³‚¢"
if %ErrorLevel%==1 goto settingcategory1intsetting1
if %ErrorLevel%==2 goto settingcategory1intsetting2
if %ErrorLevel%==3 goto settingcategory1intsetting3
if %ErrorLevel%==4 goto settingcategory1intsetting4
if %ErrorLevel%==5 goto settingcategory1intsetting5
if %ErrorLevel%==6 goto settingcategory1intsetting1
if %ErrorLevel%==7 goto settingcategory1intsetting3
if %ErrorLevel%==8 goto settingcategory1int
if %ErrorLevel%==9 goto settingcategory1int
if %ErrorLevel%==10 goto setting2
if %ErrorLevel%==11 goto setting2


:settingcategory1intsetting3
title ƒJ[ƒ\ƒ‹İ’è %debugmode%
set selected=
Cls
Echo.
Echo                               İ’èƒƒjƒ…[ Ver2!!
echo. 
echo O========================O                  O======O
echo I      ƒJƒeƒSƒŠ[        I                  I İ’è I
echo O========================O==================O======O===========O==========O
echo I%clr%                        %clr2%I 1 •ÏXŒã‚ÌÄ‹N“®‚ÌŠm”F              I   %setting1onoff%   I
echo I%clr%  ƒJ[ƒ\ƒ‹‘Ö‚¦  ‹@”\Œn  %clr2%I                                     O==========O
echo I%clr%                        %clr2%I 2 ‹N“®‚ÌƒAƒhƒ~ƒ“                  I   %setting2onoff%   I
echo O========================I                                     O==========O
Echo O  ƒJƒeƒSƒŠ[  ã‚©‰º‚©  I %clr%3 ‹N“®‚ÉXVŠm”F%clr2%                  I   %setting3onoff%   I
Echo O========================I                                     O==========O
Echo I                        I 4 Enter‚Ì’·‰Ÿ‚µ‚ğŒŸ’m‚·‚é‹@”\       I   %setting4onoff%   I
echo I ƒJ[ƒ\ƒ‹‘Ö‚¦  Œ©‚½–ÚŒn I                                     O==========O
echo I                        I 5 ‰Šú‰»‚Ü‚½‚ÍƒAƒ“ƒCƒ“ƒXƒg[ƒ‹                 I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ƒwƒ‹ƒvƒ‚[ƒh      %clrhelp2%I  I ˆÚ“® : W A S D ”š I –ß‚é : B I Œˆ’è : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12345wsabye /n /m "•ÏX‚·‚é‚à‚Ì‚ğ”š‚Åw’è–”‚Íwasd‚ÅˆÚ“®‚µ‚Äw’è‚µ‚Ä‚­‚¾‚³‚¢"
if %ErrorLevel%==1 goto settingcategory1intsetting1
if %ErrorLevel%==2 goto settingcategory1intsetting2
if %ErrorLevel%==3 goto settingcategory1intsetting3
if %ErrorLevel%==4 goto settingcategory1intsetting4
if %ErrorLevel%==5 goto settingcategory1intsetting5
if %ErrorLevel%==6 goto settingcategory1intsetting2
if %ErrorLevel%==7 goto settingcategory1intsetting4
if %ErrorLevel%==8 goto settingcategory1int
if %ErrorLevel%==9 goto settingcategory1int
if %ErrorLevel%==10 goto setting3
if %ErrorLevel%==11 goto setting3


:settingcategory1intsetting4
title ƒJ[ƒ\ƒ‹İ’è %debugmode%
set selected=
Cls
Echo.
Echo                               İ’èƒƒjƒ…[ Ver2!!
echo. 
echo O========================O                  O======O
echo I      ƒJƒeƒSƒŠ[        I                  I İ’è I
echo O========================O==================O======O===========O==========O
echo I%clr%                        %clr2%I 1 •ÏXŒã‚ÌÄ‹N“®‚ÌŠm”F              I   %setting1onoff%   I
echo I%clr%  ƒJ[ƒ\ƒ‹‘Ö‚¦  ‹@”\Œn  %clr2%I                                     O==========O
echo I%clr%                        %clr2%I 2 ‹N“®‚ÌƒAƒhƒ~ƒ“                  I   %setting2onoff%   I
echo O========================I                                     O==========O
Echo O  ƒJƒeƒSƒŠ[  ã‚©‰º‚©  I 3 ‹N“®‚ÉXVŠm”F                  I   %setting3onoff%   I
Echo O========================I                                     O==========O
Echo I                        I %clr%4 Enter‚Ì’·‰Ÿ‚µ‚ğŒŸ’m‚·‚é‹@”\%clr2%       I   %setting4onoff%   I
echo I ƒJ[ƒ\ƒ‹‘Ö‚¦  Œ©‚½–ÚŒn I                                     O==========O
echo I                        I 5 ‰Šú‰»‚Ü‚½‚ÍƒAƒ“ƒCƒ“ƒXƒg[ƒ‹                 I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ƒwƒ‹ƒvƒ‚[ƒh      %clrhelp2%I  I ˆÚ“® : W A S D ”š I –ß‚é : B I Œˆ’è : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12345wsabye /n /m "•ÏX‚·‚é‚à‚Ì‚ğ”š‚Åw’è–”‚Íwasd‚ÅˆÚ“®‚µ‚Äw’è‚µ‚Ä‚­‚¾‚³‚¢"
if %ErrorLevel%==1 goto settingcategory1intsetting1
if %ErrorLevel%==2 goto settingcategory1intsetting2
if %ErrorLevel%==3 goto settingcategory1intsetting3
if %ErrorLevel%==4 goto settingcategory1intsetting4
if %ErrorLevel%==5 goto settingcategory1intsetting5
if %ErrorLevel%==6 goto settingcategory1intsetting3
if %ErrorLevel%==7 goto settingcategory1intsetting5
if %ErrorLevel%==8 goto settingcategory1int
if %ErrorLevel%==9 goto settingcategory1int
if %ErrorLevel%==10 goto setting4
if %ErrorLevel%==11 goto setting4


:settingcategory1intsetting5
title ƒJ[ƒ\ƒ‹İ’è %debugmode%
set selected=
Cls
Echo.
Echo                               İ’èƒƒjƒ…[ Ver2!!
echo. 
echo O========================O                  O======O
echo I      ƒJƒeƒSƒŠ[        I                  I İ’è I
echo O========================O==================O======O===========O==========O
echo I%clr%                        %clr2%I 1 •ÏXŒã‚ÌÄ‹N“®‚ÌŠm”F              I   %setting1onoff%   I
echo I%clr%  ƒJ[ƒ\ƒ‹‘Ö‚¦  ‹@”\Œn  %clr2%I                                     O==========O
echo I%clr%                        %clr2%I 2 ‹N“®‚ÌƒAƒhƒ~ƒ“                  I   %setting2onoff%   I
echo O========================I                                     O==========O
Echo O  ƒJƒeƒSƒŠ[  ã‚©‰º‚©  I 3 ‹N“®‚ÉXVŠm”F                  I   %setting3onoff%   I
Echo O========================I                                     O==========O
Echo I                        I 4 Enter‚Ì’·‰Ÿ‚µ‚ğŒŸ’m‚·‚é‹@”\       I   %setting4onoff%   I
echo I ƒJ[ƒ\ƒ‹‘Ö‚¦  Œ©‚½–ÚŒn I                                     O==========O
echo I                        I %clr%5 ‰Šú‰»‚Ü‚½‚ÍƒAƒ“ƒCƒ“ƒXƒg[ƒ‹%clr2%                 I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ƒwƒ‹ƒvƒ‚[ƒh      %clrhelp2%I  I ˆÚ“® : W A S D ”š I –ß‚é : B I Œˆ’è : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12345wsabye /n /m "•ÏX‚·‚é‚à‚Ì‚ğ”š‚Åw’è–”‚Íwasd‚ÅˆÚ“®‚µ‚Äw’è‚µ‚Ä‚­‚¾‚³‚¢"
if %ErrorLevel%==1 goto settingcategory1intsetting1
if %ErrorLevel%==2 goto settingcategory1intsetting2
if %ErrorLevel%==3 goto settingcategory1intsetting3
if %ErrorLevel%==4 goto settingcategory1intsetting4
if %ErrorLevel%==5 goto settingcategory1intsetting5
if %ErrorLevel%==6 goto settingcategory1intsetting4
if %ErrorLevel%==7 goto settingcategory1intsetting5
if %ErrorLevel%==8 goto settingcategory1int
if %ErrorLevel%==9 goto settingcategory1int
if %ErrorLevel%==10 goto AllDefult
if %ErrorLevel%==11 goto AllDefult

:settingcategory2int
title ƒJ[ƒ\ƒ‹İ’è %debugmode%
set selected=
Cls
Echo.
Echo                               İ’èƒƒjƒ…[ Ver2!!
echo. 
echo O========================O                  O======O
echo I      ƒJƒeƒSƒŠ[        I                  I İ’è I
echo O========================O==================O======O======================O
echo I                        I 1 ‹N“®‚ÌƒAƒjƒ[ƒVƒ‡ƒ“            I   %setting5onoff%   I
echo I  ƒJ[ƒ\ƒ‹‘Ö‚¦  ‹@”\Œn  I                                     O==========O
echo I                        I 2 %wmodeonoff%                         I
echo O========================I                                                I
Echo O  ƒJƒeƒSƒŠ[  ã‚©‰º‚©  I                                                I
Echo O========================I                                                I
Echo I%clr%                        %clr2%I                                                I
echo I%clr% ƒJ[ƒ\ƒ‹‘Ö‚¦  Œ©‚½–ÚŒn %clr2%I                                                I
echo I%clr%                        %clr2%I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ƒwƒ‹ƒvƒ‚[ƒh      %clrhelp2%I  I ˆÚ“® : W A S D ”š I –ß‚é : B I Œˆ’è : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12wsdbye3 /n /m "•ÏX‚·‚é‚à‚Ì‚ğ”š‚Åw’è–”‚Íwasd‚ÅˆÚ“®‚µ‚Äw’è‚µ‚Ä‚­‚¾‚³‚¢"
if %ErrorLevel%==1 goto settingcategory2intsetting1
if %ErrorLevel%==2 goto settingcategory2intsetting2
if %ErrorLevel%==3 goto settingcategory1
if %ErrorLevel%==4 goto settingcategoryhelpmode
if %ErrorLevel%==5 goto settingcategory2intsetting1
if %ErrorLevel%==6 goto settingcategory2
if %ErrorLevel%==7 goto settingcategory2intsetting1
if %ErrorLevel%==8 goto settingcategory2intsetting1
if %ErrorLevel%==9 goto settingcategoryhelpmode

:settingcategory2intsetting1
title ƒJ[ƒ\ƒ‹İ’è %debugmode%
set selected=
Cls
Echo.
Echo                               İ’èƒƒjƒ…[ Ver2!!  
echo. 
echo O========================O                  O======O
echo I      ƒJƒeƒSƒŠ[        I                  I İ’è I
echo O========================O==================O======O======================O
echo I                        I %clr%1 ‹N“®‚ÌƒAƒjƒ[ƒVƒ‡ƒ“%clr2%            I   %setting5onoff%   I
echo I  ƒJ[ƒ\ƒ‹‘Ö‚¦  ‹@”\Œn  I                                     O==========O
echo I                        I 2 %wmodeonoff%                         I
echo O========================I                                                I
Echo O  ƒJƒeƒSƒŠ[  ã‚©‰º‚©  I                                                I
Echo O========================I                                                I
Echo I%clr%                        %clr2%I                                                I
echo I%clr% ƒJ[ƒ\ƒ‹‘Ö‚¦  Œ©‚½–ÚŒn %clr2%I                                                I
echo I%clr%                        %clr2%I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ƒwƒ‹ƒvƒ‚[ƒh      %clrhelp2%I  I ˆÚ“® : W A S D ”š I –ß‚é : B I Œˆ’è : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12wsabye /n /m "•ÏX‚·‚é‚à‚Ì‚ğ”š‚Åw’è–”‚Íwasd‚ÅˆÚ“®‚µ‚Äw’è‚µ‚Ä‚­‚¾‚³‚¢"
if %ErrorLevel%==1 goto settingcategory2intsetting1
if %ErrorLevel%==2 goto settingcategory2intsetting2
if %ErrorLevel%==3 goto settingcategory2intsetting1
if %ErrorLevel%==4 goto settingcategory2intsetting2
if %ErrorLevel%==5 goto settingcategory2int
if %ErrorLevel%==6 goto settingcategory2int
if %ErrorLevel%==7 goto setting5
if %ErrorLevel%==8 goto setting5

:settingcategory2intsetting2
title ƒJ[ƒ\ƒ‹İ’è %debugmode%
set selected=
Cls
Echo.
Echo                               İ’èƒƒjƒ…[ Ver2!!
echo. 
echo O========================O                  O======O
echo I      ƒJƒeƒSƒŠ[        I                  I İ’è I
echo O========================O==================O======O======================O
echo I                        I 1 ‹N“®‚ÌƒAƒjƒ[ƒVƒ‡ƒ“            I   %setting5onoff%   I
echo I  ƒJ[ƒ\ƒ‹‘Ö‚¦  ‹@”\Œn  I                                     O==========O
echo I                        I %clr%2 %wmodeonoff%%clr2%                         I
echo O========================I                                                I
Echo O  ƒJƒeƒSƒŠ[  ã‚©‰º‚©  I                                                I
Echo O========================I                                                I
Echo I%clr%                        %clr2%I                                                I
echo I%clr% ƒJ[ƒ\ƒ‹‘Ö‚¦  Œ©‚½–ÚŒn %clr2%I                                                I
echo I%clr%                        %clr2%I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ƒwƒ‹ƒvƒ‚[ƒh      %clrhelp2%I  I ˆÚ“® : W A S D ”š I –ß‚é : B I Œˆ’è : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12wsabye3 /n /m "•ÏX‚·‚é‚à‚Ì‚ğ”š‚Åw’è–”‚Íwasd‚ÅˆÚ“®‚µ‚Äw’è‚µ‚Ä‚­‚¾‚³‚¢"
if %ErrorLevel%==1 goto settingcategory2intsetting1
if %ErrorLevel%==2 goto settingcategory2intsetting2
if %ErrorLevel%==3 goto settingcategory2intsetting1
if %ErrorLevel%==4 goto settingcategory2intsetting2
if %ErrorLevel%==5 goto settingcategory2int
if %ErrorLevel%==6 goto settingcategory2int
if %ErrorLevel%==7 goto wmode
if %ErrorLevel%==8 goto wmode


:settingcategoryhelpmode
rem ƒƒ‚ ‚±‚±‚Ì•ªŠò‚Ìtrue‚Ì‚Æ‚±‚ë‚ÉAclr‚ÌF‚ğ•Ï‚¦‚éˆ—‚ğ’Ç‰Á‚µ‚½‚¢Bchoice‚Ì’¼Œã‚É•ªŠò‚Å‚à‚Æ‚É–ß‚·ˆ—‚à’Ç‰Á‚µ‚Ä
if {%settinghelptoggle%}=={true} (set settinghelp=—LŒø)
if {%settinghelptoggle%}=={false} (set settinghelp=–³Œø)
title ƒJ[ƒ\ƒ‹İ’è %debugmode%
set selected=
if not defined {%clrgra%} (set clrgra=[90m)
if {%settinghelptoggle%}=={true} (set clr=[46m)
Cls
echo.
Echo                               İ’èƒƒjƒ…[ Ver2!!
echo. 
echo O========================O                  O======O
echo I      ƒJƒeƒSƒŠ[        I                  I İ’è I
echo O========================O==================O======O======================O
echo I                        I                                                I
echo I  ƒJ[ƒ\ƒ‹‘Ö‚¦  ‹@”\Œn  I  ƒwƒ‹ƒvƒ‚[ƒh‚Å‚·B‚±‚Ì‹@”\‚ğ‘I‘ğ‚µ‚½ŒãA      I
echo I                        I  ŠT—v‚ğŒ©‚½‚¢İ’è‚ğ‘I‘ğ‚·‚é‚ÆA                I
echo O========================I  ‚»‚Ìİ’è‚ÌŠT—v‚ğŒ©‚é‚±‚Æ‚ª‚Å‚«‚Ü‚·B          I
Echo O  ƒJƒeƒSƒŠ[  ã‚©‰º‚©  I                                                I
Echo O========================I  ƒwƒ‹ƒvƒ‚[ƒh‚ğ–³Œø‚É‚µ‚½‚¢ê‡‚ÍA            I
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
if {%wmodetoggle%}=={false} (set clr=[7m&set clr2=[0m)
if {%wmodetoggle%}=={true} (set clr=[100m[97m&set clr2=[0m[107m[30m)
if %ErrorLevel%==1 goto settingcategory1
if %ErrorLevel%==2 goto settingcategory2
if %ErrorLevel%==3 goto settingcategory2
if %ErrorLevel%==4 goto settingcategoryhelpmode
if %ErrorLevel%==5 goto hazime
if %ErrorLevel%==6 goto settingcategoryhelpmodetoggle
if %ErrorLevel%==7 goto settingcategoryhelpmodetoggle
if %ErrorLevel%==8 goto settingcategoryhelpmode

:settingcategoryhelpmodetoggle
if {%settinghelptoggle%}=={true} (set settinghelptoggle=false&set clrhelp=&set clrhelp2=&goto settingcategoryhelpmode)
if {%settinghelptoggle%}=={false} (set settinghelptoggle=true&goto settingcategoryhelpmodetoggleiftrue)


:settingcategoryhelpmodetoggleiftrue
if {%wmodetoggle%}=={false} (set clr=[46m&set clrhelp=[7m&set clrhelp2=[0m)
if {%wmodetoggle%}=={true} (set clr=[46m&set clrhelp=[100m[97m&set clrhelp2=[0m[107m)
goto settingcategoryhelpmode





rem İ’è‚Ì“K—p‚ÆŠm”F
rem İ’è‚ª‘¶İ‚·‚é‚©‚ÌŒŸØ
:setting1
if {%settinghelptoggle%}=={true} (goto setting1help)
find "rebootokey=false" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
if %ErrorLevel%==0 set setting1setonoff=—LŒø&goto setting1okey
if %ErrorLevel%==1 set setting1setonoff=C•œ‚µA³í‚Èó‘Ô& goto setting1onoff

:setting1onoff
find "rebootokey=true" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
if %ErrorLevel%==0 set setting1setonoff=–³Œø

:setting1okey
cls
set selected=
echo ƒJ[ƒ\ƒ‹•ÏXŒã‚ÌÄ‹N“®‚ÌŠm”F‚ğ%setting1setonoff%‚É‚µ‚Ü‚·‚©H(Y=‚Í‚¢ N=‚¢‚¢‚¦ B=–ß‚é)
SET /P selected= :
echo %selected% ‚ª‘I‘ğ‚³‚ê‚Ü‚µ‚½B
if {%selected%}=={y} (goto :setting1y)
if {%selected%}=={n} (goto :setting1n)
if {%selected%}=={back} (goto :settingcategory1intsetting1)
if {%selected%}=={b} (goto :settingcategory1intsetting1)
goto setting1okey

:setting1y
find "rebootokey=false" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
echo İ’è‚ğ“K—p’†...
if %ErrorLevel%==1 goto setting1ygo3test
if %ErrorLevel%==0 goto setting1ygo1

:setting1ygo3test
find "rebootokey=true" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
if %ErrorLevel%==1 echo rebootokey=true >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
if %ErrorLevel%==0 goto setting1ygo2

:setting1ygo2
powershell "(gc ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt) -replace 'rebootokey=true','rebootokey=false' | sc ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt"
goto setting1yokey

:setting1ygo1
powershell "(gc ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt) -replace 'rebootokey=false','rebootokey=true' | sc ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt"
goto setting1yokey

:setting1yokey
cls
Echo ³í‚É•ÏX‚³‚ê‚Ü‚µ‚½B
Pause
set wantload=setting1
call :MOBAS_Loader
Goto settingcategory1intsetting1

:setting1n
cls
Echo İ’è‚ğ•ÏX‚µ‚Ü‚¹‚ñ‚Å‚µ‚½
Pause
goto settingcategory1intsetting1

:setting2
if {%settinghelptoggle%}=={true} (goto setting2help)
find "admin=false" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
if %ErrorLevel%==0 set setting2setonoff=—LŒø&goto setting2okey
if %ErrorLevel%==1 set setting2setonoff=C•œ‚µA³í‚Èó‘Ô&goto setting2onoff

:setting2onoff
find "admin=true" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
if %ErrorLevel%==0 set setting2setonoff=–³Œø

:setting2okey
cls
echo ‹N“®‚ÌŠÇ—ÒŒ ŒÀ‚Ì—v‹‚ğ%setting2setonoff%‚É‚µ‚Ü‚·‚©H(Y=‚Í‚¢ N=‚¢‚¢‚¦ B=–ß‚é)
SET /P selected= :
echo %selected% ‚ª‘I‘ğ‚³‚ê‚Ü‚µ‚½B
if {%selected%}=={y} (goto :setting2y)
if {%selected%}=={n} (goto :setting2n)
if {%selected%}=={back} (goto :settingcategory1intsetting2)
if {%selected%}=={b} (goto :settingcategory1intsetting2)
goto setting2okey

:setting2y
find "admin=false" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
echo İ’è‚ğ“K—p’†...
if %ErrorLevel%==1 goto setting2ygo3test
if %ErrorLevel%==0 goto setting2ygo1

:setting2ygo3test
find "admin=true" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
if %ErrorLevel%==1 echo admin=true >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
if %ErrorLevel%==0 goto setting2ygo2

:setting2ygo2
powershell "(gc ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt) -replace 'admin=true','admin=false' | sc ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt"
goto setting2yokey

:setting2ygo1
powershell "(gc ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt) -replace 'admin=false','admin=true' | sc ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt"
goto setting2yokey

:setting2yokey
cls
Echo ³í‚É•ÏX‚³‚ê‚Ü‚µ‚½B
Pause
set wantload=setting2
call :MOBAS_Loader
Goto settingcategory1intsetting2

:setting2n
cls
Echo ‹N“®‚ÌŠÇ—ÒŒ ŒÀ‚Ì—v‹‚Í%setting2onoff%‚É‚È‚è‚Ü‚¹‚ñ‚Å‚µ‚½
Pause
goto settingcategory1intsetting2

:setting3
if {%settinghelptoggle%}=={true} (goto setting3help)
find "CheckUpdate=false" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
if %ErrorLevel%==0 set setting3setonoff=—LŒø&goto setting3onoff
if %ErrorLevel%==1 set setting3setonoff=C•œ‚µA³í‚Èó‘Ô&goto setting3onoff

:setting3onoff
find "CheckUpdate=true" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
if %ErrorLevel%==0 set setting3setonoff=–³Œø&set setting3warning=
:setting3okey
cls
echo ‹N“®‚ÉXV‚ğŠm”F‚·‚é‹@”\‚ğ%setting3setonoff%‚É‚µ‚Ü‚·‚©H(Y=‚Í‚¢ N=‚¢‚¢‚¦ B=–ß‚é)
SET /P selected= :
echo %selected% ‚ª‘I‘ğ‚³‚ê‚Ü‚µ‚½B
if {%selected%}=={y} (goto :setting3y)
if {%selected%}=={n} (goto :setting3n)
if {%selected%}=={back} (goto :settingcategory1intsetting3)
if {%selected%}=={b} (goto :settingcategory1intsetting3)
goto setting3okey

:setting3y
find "CheckUpdate=false" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
echo İ’è‚ğ“K—p’†...
if %ErrorLevel%==1 goto setting3ygo3test
if %ErrorLevel%==0 goto setting3ygo1

:setting3ygo3test
find "CheckUpdate=true" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
if %ErrorLevel%==1 echo CheckUpdate=false >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
if %ErrorLevel%==0 goto setting3ygo2

:setting3ygo2
powershell "(gc ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt) -replace 'CheckUpdate=true','CheckUpdate=false' | sc ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt"
goto setting3yokey

:setting3ygo1
powershell "(gc ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt) -replace 'CheckUpdate=false','CheckUpdate=true' | sc ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt"
goto setting3yokey

:setting3n
cls
Echo ‚‘¬‹N“®‚Í—LŒø‚É‚È‚è‚Ü‚¹‚ñ‚Å‚µ‚½
Pause
goto settingcategory1intsetting3

:setting3yokey
cls
Echo ‚‘¬‹N“®‚ğ%setting3setonoff%‚É‚µ‚Ü‚µ‚½B
Pause
set wantload=setting3
call :MOBAS_Loader
Goto settingcategory1intsetting3

:setting4
if {%settinghelptoggle%}=={true} (goto setting4help)
find "hatenakeikoku=false" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
if %ErrorLevel%==0 set setting4setonoff=—LŒø&goto setting4okey
if %ErrorLevel%==1 set setting4setonoff=C•œ‚µA³í‚Èó‘Ô&goto setting4onoff

:setting4onoff
find "hatenakeikoku=true" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
if %ErrorLevel%==0 set setting4setonoff=–³Œø

:setting4okey
cls
echo ƒGƒ“ƒ^[ƒL[‚Ì’·‰Ÿ‚µŒŸ’m‹@”\‚ğ%setting4setonoff%‚É‚µ‚Ü‚·‚©H(Y=‚Í‚¢ N=‚¢‚¢‚¦ B=–ß‚é)
SET /P selected= :
echo %selected% ‚ª‘I‘ğ‚³‚ê‚Ü‚µ‚½B
if {%selected%}=={y} (goto :setting4y)
if {%selected%}=={n} (goto :setting4n)
if {%selected%}=={back} (goto :settingcategory1intsetting4)
if {%selected%}=={b} (goto :settingcategory1intsetting4)
goto setting4okey

:setting4y
find "hatenakeikoku=false" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
echo İ’è‚ğ“K—p’†...
if %ErrorLevel%==1 goto setting4ygo3test
if %ErrorLevel%==0 goto setting4ygo1

:setting4ygo3test
find "hatenakeikoku=true" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
if %ErrorLevel%==1 echo hatenakeikoku=true >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
if %ErrorLevel%==0 goto setting4ygo2

:setting4ygo2
powershell "(gc ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt) -replace 'hatenakeikoku=true','hatenakeikoku=false' | sc ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt"
goto setting4yokey

:setting4ygo1
powershell "(gc ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt) -replace 'hatenakeikoku=false','hatenakeikoku=true' | sc ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt"
goto setting4yokey

:setting4yokey
cls
Echo ³í‚É“K—p‚³‚ê‚Ü‚µ‚½B
Pause
set wantload=setting4
call :MOBAS_Loader
Goto settingcategory1intsetting4

:setting4n
cls
Echo İ’è‚ğ•ÏX‚µ‚Ü‚¹‚ñ‚Å‚µ‚½
Pause
goto settingcategory1intsetting4

:setting5
if {%settinghelptoggle%}=={true} (goto setting5help)
find "bootanimation=false" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
if %ErrorLevel%==0 set setting5setonoff=—LŒø&goto setting5okey
if %ErrorLevel%==1 set setting5setonoff=C•œ‚µA³í‚Èó‘Ô&goto setting5onoff

:setting5onoff
find "bootanimation=true" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
if %ErrorLevel%==0 set setting5setonoff=–³Œø

:setting5okey
cls
echo ‹N“®‚Ìƒu[ƒgƒAƒjƒ[ƒVƒ‡ƒ“‚ğ%setting5setonoff%‚É‚µ‚Ü‚·‚©H(Y=‚Í‚¢ N=‚¢‚¢‚¦ B=–ß‚é)
SET /P selected= :
echo %selected% ‚ª‘I‘ğ‚³‚ê‚Ü‚µ‚½B
if {%selected%}=={y} (goto :setting5y)
if {%selected%}=={n} (goto :setting5n)
if {%selected%}=={back} (goto :settingcategory2intsetting1)
if {%selected%}=={b} (goto :settingcategory2intsetting1)
goto setting5okey

:setting5y
find "bootanimation=false" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
echo İ’è‚ğ“K—p’†...
if %ErrorLevel%==1 goto setting5ygo3test
if %ErrorLevel%==0 goto setting5ygo1

:setting5ygo3test
find "bootanimation=true" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
if %ErrorLevel%==1 echo bootanimation=true >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
if %ErrorLevel%==0 goto setting5ygo2

:setting5ygo2
powershell "(gc ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt) -replace 'bootanimation=true','bootanimation=false' | sc ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt"
goto setting5yokey

:setting5ygo1
powershell "(gc ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt) -replace 'bootanimation=false','bootanimation=true' | sc ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt"
goto setting5yokey

:setting5yokey
cls
Echo İ’è‚ğ•ÏX‚µ‚Ü‚µ‚½B
Pause
set wantload=setting5
call :MOBAS_Loader
Goto settingcategory2intsetting1

:setting5n
cls
Echo İ’è‚ğ•ÏX‚µ‚Ü‚¹‚ñ‚Å‚µ‚½
Pause
goto settingcategory2intsetting1


:wmode
if {%settinghelptoggle%}=={true} (goto wmodehelp)
cd /d %HOMEDRIVE%%HOMEPATH%
:wmodetest
find "wmode=false" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
if %ErrorLevel%==0 set wmodesetonoff=ƒzƒƒCƒg
if %ErrorLevel%==1 set wmodesetonoff=ƒe[ƒ}‚Ìİ’è‚ğC•œ‚µA³í‚È& goto wmodeonoff

:wmodeonoff
find "wmode=true" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
if %ErrorLevel%==0 set wmodesetonoff=ƒ_[ƒN

cls
echo ƒJ[ƒ\ƒ‹‘Ö‚¦‚Ìƒe[ƒ}‚ğ%wmodesetonoff%ƒe[ƒ}‚É‚µ‚Ü‚·‚©H(Y=‚Í‚¢ N=‚¢‚¢‚¦ B=–ß‚é)
SET /P selected= :
rem ƒe[ƒ}‚Ì•ªŠò
if {%selected%}=={y} (goto :wmodey)
if {%selected%}=={yes} (goto :wmodey)
if {%selected%}=={egg} (goto :secret)
if {%selected%}=={n} (goto :no01)
if {%selected%}=={no} (goto :no01)
if {%selected%}=={back} (goto :settingcategory2intsetting2)
if {%selected%}=={b} (goto :settingcategory2intsetting2)
if {%selected%}=={def} (goto :defultwok)
if {%selected%}=={defult} (goto :defultwok)
goto wmode

:wmodey
find "wmode=false" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
echo ƒe[ƒ}‚ğ“K—p’†...
if %ErrorLevel%==1 goto wmodeygo3test
if %ErrorLevel%==0 goto wmodeygo1

:wmodeygo3test
find "wmode=true" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
if %ErrorLevel%==1 echo wmode=false >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt&goto wmodeygo1
if %ErrorLevel%==0 goto wmodeygo2

:wmodeygo2
powershell "(gc ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt) -replace 'wmode=true','wmode=false' | sc ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt"
goto wmodeyokey

:wmodeygo1
powershell "(gc ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt) -replace 'wmode=false','wmode=true' | sc ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt"
goto wmodeyokey

:wmodeyokey
Title ƒJ[ƒ\ƒ‹‘Ö‚¦
find "wmode=false" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
if %ErrorLevel%==0 color 07
if %ErrorLevel%==1 goto wmodeonoffkenti
:wmodeonoffkenti
find "wmode=true" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
if %ErrorLevel%==0 color f0
cls
echo %wmodesetonoff%ƒe[ƒ}‚É•ÏX‚µ‚Ü‚µ‚½B
Pause
set wantload=wmode
call :MOBAS_Loader
if {%wmodetoggle%}=={false} (set clr=[7m&set clr2=[0m)
if {%wmodetoggle%}=={true} (set clr=[100m[97m&set clr2=[0m[107m[30m)
Goto settingcategory2intsetting2

:no01
cls
echo %wmodesetonoff%ƒe[ƒ}‚É‚Í•ÏX‚µ‚Ü‚¹‚ñ‚Å‚µ‚½B
pause
Goto :settingcategory2intsetting2

rem İ’è‚Ìƒwƒ‹ƒv
:setting1help
cls
echo ‚±‚Ìİ’è‚ÍA‚ä‚¤‚Ü‚Å‚à‚È‚­‚±‚Ìƒoƒbƒ`ˆ—‚ÌƒƒCƒ“‚Å‚à‚ ‚éƒJ[ƒ\ƒ‹‚ğ•ÏX‚·‚é‹@”\‚ğg—p‚µ‚½Œã‚Éˆê“xÄ‹N“®‚ğŠm”F‚·‚é‚Æ‚±‚ë‚ª‚ ‚é‚Ì‚Å‚·‚ªA‚»‚Ì•”•ª‚ğ–³Œø‚É‚µAƒV[ƒ€ƒŒƒX‚É
echo ƒJ[ƒ\ƒ‹‚ğ•Ï‚¦‚ê‚é‚æ‚¤‚É‚·‚éİ’è‚Å‚·B‚Ü‚Ÿ‚Å‚·‚ª‚ ‚Ü‚èƒJ[ƒ\ƒ‹‚ğ•p”É‚É•Ï‚¦‚½‚¢‚Æ‚¢‚¤l‚Í­‚È‚¢‚Æv‚¢‚Ü‚·‚Ì‚ÅA‚¨‚»‚ç‚­‚ ‚Ü‚èg‚í‚ê‚È‚¢‚Å‚ ‚ë‚¤‹@”\‚Å‚µ‚å‚¤B
echo ‚±‚Ìİ’è‚ÍƒfƒtƒHƒ‹ƒg‚Å‚Í—LŒø‚Å‚·B
pause
goto settingcategory1intsetting1

:setting2help
cls
echo ‚±‚Ìİ’è‚ÍAŠÇ—ÒŒ ŒÀ‚ÅƒJ[ƒ\ƒ‹‘Ö‚¦‚ğÀs‚·‚é‚±‚Æ‚É‚æ‚Á‚ÄAƒJ[ƒ\ƒ‹‚ğ•ÏX‚·‚éÛ‚ÉƒGƒ‰[‚ª‹N‚«‚È‚¢‚æ‚¤‚É‚·‚é‚½‚ß‚É‚ ‚è‚Ü‚·B
echo ‚à‚µ‰¼‚ÉAƒJ[ƒ\ƒ‹‚ğ•ÏX‚·‚éÛ‚ÉƒGƒ‰[‚à‚µ‚­‚Í•ÏX‚Å‚«‚È‚©‚Á‚½ê‡‚Ì‚İ‚É‚±‚Ìİ’è‚ğ—LŒø‚É‚·‚é‚±‚Æ‚ğ„§‚µ‚Ü‚·B
echo ‚±‚Ìİ’è‚ğ—LŒø‚É‚·‚é‚±‚Æ‚É‚æ‚Á‚Ä‹N“®ŠÔ‚ª’Zk‚³‚ê‚éê‡‚ª‚ ‚è‚Ü‚·B
echo ‚±‚Ìİ’è‚ÍƒfƒtƒHƒ‹ƒg‚Å‚Í–³Œø‚Å‚·B
pause
goto settingcategory1intsetting2

:setting3help
cls
echo ‚±‚Ì‹@”\‚ÍƒJ[ƒ\ƒ‹‘Ö‚¦‚Ì‹N“®‚ÉXV‚ğŠm”F‚·‚é‚©”Û‚©‚Ìİ’è‚Å‚·B
echo ‚±‚Ì‹@”\‚ğ—LŒø‚É‚·‚é‚ÆA–ˆ‹N“®‚ÉƒAƒbƒvƒf[ƒg‚ÌŠm”F‚ªs‚í‚ê‚Ü‚·B
echo ƒAƒbƒvƒf[ƒg‚ª—˜—p‰Â”\‚È‚ç“K—p‚·‚é‚±‚Æ‚ª‚Å‚«‚Ü‚·B
echo ‚¨g‚¢‚ÌƒCƒ“ƒ^[ƒlƒbƒg‚âŠÂ‹«‚Ì‘¬“x‚É‚æ‚Á‚Ä‚Í‹N“®ŠÔ‚ª’x‚­‚È‚é‰Â”\«‚ª‚ ‚è‚Ü‚·B
echo ˆêŠÔ‚É‚¾‚¢‚½‚¢50‰ñˆÈã˜A‘±‚µ‚Ä‹N“®‚·‚é‚ÆAgithub‚ÌAPIƒŒ[ƒg§ŒÀ‚É“’B‚·‚é‰Â”\«‚ª‚ ‚è‚Ü‚·B(‘‡“I‚É3~4‰ñ‚Ù‚ÇAPI‚ğ—˜—p‚·‚é‚½‚ßA‚•‰‰×)
echo ‚±‚Ìİ’è‚ÍƒfƒtƒHƒ‹ƒg‚Å‚Í–³Œø‚Å‚·B
pause
goto settingcategory1intsetting3

:setting4help
cls
echo ‚±‚Ìİ’è‚Í­X‚í‚©‚è‚É‚­‚¢‚Å‚·‚ªAŠÈ’P‚ÉŒ¾‚¤‚Æƒoƒbƒ`‚ğ‹N“®‚µ‚½‚Æ‚«‚É•\¦‚³‚ê‚é‰æ–Ê‚Ì‚Ü‚Ü‚Å‰½‚à“ü—Í‚¹‚¸‚ÉƒGƒ“ƒ^[‚ğ’·‰Ÿ‚µ‚µ‚½‚Æ‚«‚Éo‚Ä‚­‚é
echo ŒxƒƒbƒZ[ƒW‚ğoff/on‚É‚Å‚«‚é‹@”\‚Å‚·B
echo ‚±‚ê‚ÍÀÛ‚É‘ÌŒ±‚µ‚Ä‚à‚ç‚Á‚½‚Ù‚¤‚ª‚í‚©‚è‚â‚·‚¢‚Ì‚Å‚·‚ªA‚Ü‚Ÿ‘å‘Ì50‰ñ~250‰ñ‚­‚ç‚¢‚ÌŠÔƒGƒ“ƒ^[‚ğ’·‰Ÿ‚µ‚©‰Ÿ‚µ‚Ä‚¢‚é‚ÆA
echo Œx•¶‚ª•\¦‚³‚ê‚éŠ´‚¶‚É‚È‚è‚Ü‚·‚ËB‚µ‚©‚µ‚É‚Í‚±‚ê‚ª‚¤‚Á‚Æ‚¨‚µ‚¢‚Æv‚¤l‚à‚¢‚é‚©‚Æv‚¢‚Ü‚·‚Ì‚ÅA‚±‚Ì‹@”\‚ğƒIƒt‚É‚Å‚«‚éİ’è‚ğ’Ç‰Á‚µ‚Ü‚µ‚½B
echo ‚±‚Ìİ’è‚ÍƒfƒtƒHƒ‹ƒg‚Å‚Í—LŒø‚Å‚·B
pause
goto settingcategory1intsetting4

:setting5help
cls
echo ‚±‚Ìİ’è‚ÍA‹N“®‚É•K‚¸–ˆ‰ñ—¬‚ê‚éƒu[ƒgƒAƒjƒ[ƒVƒ‡ƒ“A‚¢‚í‚Î‹N“®‰æ–Ê‚ğ–³Œø‚É‚µ”ñ•\¦‚É‚·‚éİ’è‚Å‚·B
echo ‚±‚Ìİ’è‚ğ–³Œø‚É‚·‚é‚±‚Æ‚É‚æ‚Á‚ÄA‹N“®ŠÔ‚Ì’Zk‚â‚¤‚Á‚Æ‚¤‚µ‚³‚ÌŒyŒ¸‚É‚Â‚È‚ª‚è‚Ü‚·B
echo ‚±‚Ìİ’è‚ÍƒfƒtƒHƒ‹ƒg‚Å‚Í—LŒø‚Å‚·B
pause
goto settingcategory2intsetting1

:wmodehelp
cls
echo ‚±‚ê‚ÍCMD‚Ì‰æ–Ê‚ğ”’F‚Ü‚½‚Í•F‚É•Ï‚¦‚é•¨‚Å‚·B
echo ‚±‚ê‚ğg—p‚·‚é‚ÆA—á‚¦‚Î‰æ–Ê‚ÍƒzƒƒCƒgƒe[ƒ}‚Å“ˆê‚³‚¹‚½‚èA‚Ü‚½‚»‚Ì‚Ù‚¤‚ªD‚«‚Æ‚¢‚¤l‚É‚à‘Î‰‚Å‚«‚é‚æ‚¤‚É‚È‚è‚Ü‚·B
echo •W€‚Å‚Í•F‚Å‚·‚ªA”’F‚É‚µ‚½ŒãA¡Œã‹N“®‚µ‚½‚Æ‚«‚É©“®“I‚É‰æ–Ê‚ª”’F‚É‚È‚é‚æ‚¤‚É‚È‚è‚Ü‚·B
echo ‚Ü‚½A‚¿‚å‚Á‚Æ‚µ‚½— ˜b‚Å‚·‚ª‚±‚Ìİ’è‚ÍA1.10ˆÈ‘O‚Ü‚Å‚Íƒz[ƒ€‘¤‚Éİ’u‚³‚ê‚Ä‚¢‚Ü‚µ‚½B‚Ü‚½A‚±‚Ì‹@”\‚Íİ’è‚Ì“à•”\‘¢‚Ì‚à‚Æ‚É‚È‚Á‚Ä‚¢‚Ü‚·B
echo •W€‚Å‚Íƒ_[ƒNƒe[ƒ}‚Å‚·B
pause
goto settingcategory2intsetting2
 
:alldefhelp
cls
echo ‚±‚ê‚ÍƒAƒ“ƒCƒ“ƒXƒg[ƒ‹ƒƒjƒ…[‚Å‚·B‚±‚Ìƒƒjƒ…[‚ÍƒJ[ƒ\ƒ‹‘Ö‚¦‚ÌƒAƒ“ƒCƒ“ƒXƒg[ƒ‹‚ğs‚¢‚Ü‚·B
echo ‚±‚Ìƒƒjƒ…[‚É‚Íİ’èƒtƒ@ƒCƒ‹iİ’è‚ª‹L˜^‚³‚ê‚Ä‚¢‚éƒeƒLƒXƒgƒtƒ@ƒCƒ‹j‚ÌƒpƒX‚ğ•\¦‚·‚é‹@”\Aİ’è‚ğ‰Šú‰»(ƒfƒtƒHƒ‹ƒg‚É)‚·‚é‹@”\‚ªŠÜ‚Ü‚ê‚Ä‚¢‚Ü‚·B
echo ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹‚ğÀs‚·‚éê‡AƒJ[ƒ\ƒ‹‘Ö‚¦–{‘Ì‚ªíœ‚³‚êAi”CˆÓjƒJ[ƒ\ƒ‹‚àƒfƒtƒHƒ‹ƒg‚Éíœ‚³‚ê‚Ü‚·Bi”CˆÓjİ’èA‰‰ñ‹N“®‚ğŒŸ’m‚·‚é‚½‚ß‚Ìƒtƒ@ƒCƒ‹‚àŠ®‘S‚Éíœ‚³‚ê‚Ü‚·B
echo Às‚·‚éÛ‚Í‚­‚ê‚®‚ê‚à©ŒÈÓ”C‚ÅÀs‚µ‚Ä‚­‚¾‚³‚¢B
pause
goto settingcategory1intsetting5

rem ƒoƒbƒ`‚Ìƒo[ƒWƒ‡ƒ“
:batver
rem Version of batch
:batver
title ƒJ[ƒ\ƒ‹‘Ö‚¦ ƒo[ƒWƒ‡ƒ“ (Œ±“I)
if {%batverdev%}=={beta} (set batverdevshow=ƒx[ƒ^)
if {%batverdev%}=={stable} (set batverdevshow= ˆÀ’è )
echo.
echo.
echo     by tamago_1908   2021-2024
echo     O========================================O
echo     I                                        I
echo     I          ƒJ[ƒ\ƒ‹‘Ö‚¦ %batverdevshow% ”Å        I
echo     I                                        I
echo     O========================================O 
echo           Version : %batver%  %batbuild%
echo.
echo ƒAƒbƒvƒf[ƒg‚ğŠm”F‚µ‚Ü‚·‚©H
set /p selected=Y or N : 
if {%selected%}=={y} (goto batverupdate) else if {%selected%}=={yes} (goto batverupdate) else if {%selected%}=={n} (goto hazime) else if {%selected%}=={no} (goto hazime) else (echo ‚·‚İ‚Ü‚¹‚ñBY‚©N‚Ì‚İ‚ğ“ü—Í‚µ‚Ä‚­‚¾‚³‚¢B&pause&cls&goto batver )
pause
cls
set batverdevshow=
goto hazime

:batverupdate
cd %~dp0
echo ƒAƒbƒvƒf[ƒgƒvƒƒZƒX‚ğŠJn‚µ‚Ä‚¢‚Ü‚·...
:updatecode
set batbootpowershell=Fullupdater
call :batbootpowershell

pause
goto hazime

rem “d‘ì
:startcal
set q=0
set number1=0
set number2=0
set number3=0
cls
echo 2147483647‚ÌŒvZ‚Ü‚Å(intŒ^‚ÌãŒÀ d—lã‚±‚ê‚æ‚èã‚ÌŒvZ‚Í•s‰Â)
echo.
title ƒJ[ƒ\ƒ‹“d‘ì

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
if {%q%}=={back} (goto hazime)
if {%q%}=={b} (goto hazime)
if {%q%}=={1} (set whatnumber=‘«‚³‚ê‚é‘¤&goto startcal2)
if {%q%}=={2} (set whatnumber=ˆø‚©‚ê‚é‘¤&goto startcal2) 
if {%q%}=={3} (goto advancemodecal) else (
echo –³Œø‚È‘I‘ğ‚Å‚·&pause&goto startcal)

:startcal2
echo.
set /p number1=%whatnumber%‚ğ“ü—Í :
if {%q%}=={1} (goto pcal)
if {%q%}=={2} (goto mcal)

:pcal
set /p number3=‘«‚·‘¤‚ğ“ü—Í :
set /a number1=number1+number3
echo Œ‹‰Ê : %number1%
pause
cls
goto simplemodecal

:mcal
set /p number3=ˆø‚­‘¤‚ğ“ü—Í :
set /a number1=number1-number3
echo Œ‹‰Ê : %number1%
pause
cls
goto simplemodecal

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
goto loopcal

:cursorchange
rem ƒƒ‚@•Ï”‚Å•ªŠò‚µ‚ÄA•ÏX‚·‚éBƒfƒtƒHƒ‹ƒg‚ğƒx[ƒX‚Éì¬
rem ƒJ[ƒ\ƒ‹‘Ö‚¦‚ÌƒƒCƒ“‹@”\B‚±‚ê‚ª‚È‚«‚án‚Ü‚ç‚È‚¢
cls
echo                              ƒJ[ƒ\ƒ‹‘Ö‚¦%batver% %debugmode%
title ƒJ[ƒ\ƒ‹*‘Ö‚¦* %debugmode%
echo.
SET /P selected=%cursorcolor%F‚É–ß‚µ‚Ü‚·‚©H(Y=Yes / N=No / B=Back)
if {%selected%}=={y} (goto :yes0)
if {%selected%}=={yes} (goto :yes0)
if {%selected%}=={egg} (goto :secret)
if {%selected%}=={n} (goto :no0)
if {%selected%}=={no} (goto :no0)
if {%selected%}=={back} (goto :hazime)
if {%selected%}=={b} (goto :hazime)
if {%selected%}=={debugyesnow} (goto :defgo)

echo ?
echo.
pause
echo ‚·‚İ‚Ü‚¹‚ñB‚à‚¤ˆê“xŒ¾‚Á‚Ä‚¢‚½‚¾‚¯‚Ü‚¹‚ñ‚©H
echo.
pause
goto cursorchange

:no0
echo •ÏX‚Í‚³‚ê‚Ü‚¹‚ñ‚Å‚µ‚½B
pause
goto hazime

:yes0
find "CursorChanged" ‰‰ñƒJ[ƒ\ƒ‹.txt > nul
if "%errorlevel%"=="0" goto changetodefault else goto FirstWarning
rem Write settings (default)
:FirstWarning
if defined wmodetoggle (set clrfirstwarning=[40m[37m)
if {%wmodetoggle%}=={false} (set clrfirstwarning=[40m[37m)
if {%wmodetoggle%}=={true} (set clrfirstwarning=[107m[30m)
rem warning message, first-time startup only
cls
echo ‰‰ñ•ÏX‚Ì‚İ
timeout /t 1 /nobreak >nul
cls
echo.
timeout /t 1 /nobreak >nul
if {%wmodetoggle%}=={true} (color f0) else (color 07)
echo @@@                         @I’ˆÓI
timeout /t 1 /nobreak >nul
if {%wmodetoggle%}=={true} (color fc) else (color 0c)
timeout /t 1 /nobreak >nul
if {%wmodetoggle%}=={true} (color f4) else (color 04)
timeout /t 1 /nobreak >nul
echo.
echo %clrfirstwarning%‚±‚Ìbatƒtƒ@ƒCƒ‹iˆÈ‰ºAƒXƒNƒŠƒvƒgj‚ÍAƒJ[ƒ\ƒ‹‚ğƒfƒtƒHƒ‹ƒgA‚Ü‚½‚Í•F‚É‚·‚é‚¾‚¯‚ÌƒXƒNƒŠƒvƒg‚Å‚·B
timeout /t 2 /nobreak >nul
echo %clrfirstwarning%‚È‚¢‚Æ‚Ív‚¢‚Ü‚·‚ªA‚±‚ÌƒXƒNƒŠƒvƒg‚ğg—p‚·‚é‚É‚ ‚½‚Á‚Ä”­¶‚µ‚½‘¹ŠQA‚Ü‚½‚ÍƒRƒ“ƒsƒ…[ƒ^[‚Ì‘¹“™‚Ì”íŠQ‚ÌÓ”C‚Í»ìÒ‚Å‚ ‚é‚»‚±‚ç•Ó‚É‚ ‚é—‘‚ÍˆêØ‚ÌÓ”C‚ğæ‚è‚Ü‚¹‚ñI
pause
echo.
echo.
rem Œx‚Ì•ªŠòBno‚ğ“ü—Í‚·‚é‚ÆƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt‚ªíœ‚³‚ê‚éB
:warningfirstchenge
set clrfirstwarning=
SET /P selected=‚æ‚ë‚µ‚¢‚Å‚·‚©H(Y=Yes / N=No)
if {%selected%}=={n} (goto hazime)
if {%selected%}=={no} (goto hazime) 
if {%selected%}=={yes} (goto henkoudefo)
if {%selected%}=={y} (goto henkoudefo)
echo %selected% ‚ª‘I‘ğ‚³‚ê‚Ü‚µ‚½B
echo.
echo ?
pause
echo.
echo ‚·‚İ‚Ü‚¹‚ñB‚à‚¤ˆê“xŒ¾‚Á‚Ä‚¢‚½‚¾‚¯‚Ü‚¹‚ñ‚©H
pause
goto warningfirstchenge
:henkoudefo
find "CursorChanged" ‰‰ñƒJ[ƒ\ƒ‹.txt > nul
if "%errorlevel%"=="1" (
    find "nodogcheckforCheckUpdate" ‰‰ñƒJ[ƒ\ƒ‹.txt > nul
    if "%errorlevel%"=="1" (
    echo nodogcheckforfastboot > ‰‰ñƒJ[ƒ\ƒ‹.txt
    echo CursorChanged >> ‰‰ñƒJ[ƒ\ƒ‹.txt
    ) else echo CursorChanged >> ‰‰ñƒJ[ƒ\ƒ‹.txt
)
if {%cursorcolor%}=={•} (goto kurogotest)
if {%selected%}=={”’} (goto defgotest)
cls

:defgotest
reg query "HKEY_CURRENT_USER\Control Panel\Cursors" /v "Scheme Source" | find "0x0"
cls
if {%ErrorLevel%}=={0} (goto sudenidef)
if {%ErrorLevel%}=={1} (goto defgo)

:sudenidef
rem Œ¶‚ÌŒxƒƒbƒZ[ƒWBŒ»İ‚Å‚Í‚±‚ê‚ª•\¦‚³‚ê‚é‚±‚Æ‚Í‚Ù‚Ú‚ ‚è“¾‚È‚¢B
title ‚·‚Å‚É–¾‚é‚¢
echo 
echo ‚È‚ÉIH‚È‚º‚¾I‚±‚ñ‚È‚±‚Æ‚Í‚ ‚è“¾‚È‚¢‚ÁIII‰´‚Ì‚»‚Î‚É‹ßŠñ‚é‚È‚Ÿ[‚ÁI
goto exit

:kurogotest
reg query "HKEY_CURRENT_USER\Control Panel\Cursors" /v "Scheme Source" | find "0x2"
cls
if {%ErrorLevel%}=={0} (goto sudenikuro)
if {%ErrorLevel%}=={1} (goto kurogo)

:sudenikuro
rem Œ¶‚ÌŒxƒƒbƒZ[ƒWB¡Œ»İ‚Å‚Í‚±‚ê‚ª•\¦‚³‚ê‚é–‚Í‚Ù‚Ú‚ ‚è“¾‚È‚¢B
title ‚·‚Å‚É•‚¢
echo 
echo ‚È‚ÉIH‚È‚º‚¾I‚±‚ñ‚È‚±‚Æ‚Í‚ ‚è“¾‚È‚¢‚ÁIII‰´‚Ì‚»‚Î‚É‹ßŠñ‚é‚È‚Ÿ[‚ÁI
goto exit

rem ƒJ[ƒ\ƒ‹‚ÌF‚ğ”’‚É•ÏX‚·‚é
:defgo
if {%wmodetoggle%}=={true} (color f0) else (color 07)
pause
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /ve /f /d ""
title 1
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v ContactVisualization /t REG_DWORD /f /d "0x00000001"
title 2
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v CursorBaseSize /t REG_DWORD /f /d "0x00000020"
title 3
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v GestureVisualization /t REG_DWORD /f /d "0x0000001f"
title 4
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v "Scheme Source" /t REG_DWORD /f /d "0x0000000"
title 5
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v AppStarting /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\
title 6
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v Arrow /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\
title 7
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v Crosshair /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\
title 8
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v Hand /t REG_SZ /f /d ""
title 9
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v Help /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\
title 10
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v IBeam /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\
title 11
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v No /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\
title 12
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v NWPen /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\
title 13
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v Person /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\
title 14
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v SizeAll /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\
title 15
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v SizeNESW /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\
title 16
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v SizeNS /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\
title 17
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v SizeNWSE /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\
title  18
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v SizeWE /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\
title 19
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v UpArrow /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\
title 20
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v Wait /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\
title nice 21
cls
echo ƒfƒtƒHƒ‹ƒg‚É–ß‚µ‚Ü‚µ‚½B
pause
goto reboot

rem ƒJ[ƒ\ƒ‹‚ÌF‚ğ•‚É•ÏX‚·‚éB
:kurogo
pause
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /ve /f /d "Windows • "
title 1
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v ContactVisualization /t REG_DWORD /f /d "0x00000001"
title 2
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v CursorBaseSize /t REG_DWORD /f /d "0x00000020"
title 3
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v GestureVisualization /t REG_DWORD /f /d "0x0000001f"
title 4
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v "Scheme Source" /t REG_DWORD /f /d "0x0000002"
title 5
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v AppStarting /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\wait_r.cur
title 6
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v Arrow /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\arrow_r.cur
title 7
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v Crosshair /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\cross_r.cur
title 8
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v Hand /t REG_SZ /f /d ""
title 9
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v Help /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\help_r.cur
title 10
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v IBeam /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\beam_r.cur
title 11
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v No /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\no_r.cur
title 12
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v NWPen /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\pen_r.cur
title 13
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v Person /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\person_r.cur
title 14
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v SizeAll /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\move_r.cur
title 15
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v SizeNESW /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\size1_r.cur
title 16
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v SizeNS /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\size4_r.cur
title 17
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v SizeNWSE /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\size2_r.cur
title 18
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v SizeWE /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\size3_r.cur
title 19
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v UpArrow /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\up_r.cur
title 20
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v Wait /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\busy_r.cur
title black is nice. 21

cls
echo.
echo •ÏX‚µ‚Ü‚µ‚½
pause
goto reboot

rem dogcheckBƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt‚ª‘¶İ‚·‚é‚©‚ğŒŸØ
:AllDefult
cd /d %HOMEDRIVE%%HOMEPATH%
if {%settinghelptoggle%}=={true} (goto alldefhelp)
if exist ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt goto AllDefulttest
if not exist ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt goto Dogcheck

:Dogcheck
rem dogcheck, respect tobyfox and dog

title Dogcheck %debugmode%
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
if not defined back_to_the_firstline (set back_to_the_firstline=[0;0H)
:dogcheckanimation0f
set /a dogcheckcount=dogcheckcount+1
if %dogcheckcount% gtr 5 (title Dogcheck respect tobyfox)
if %dogcheckcount% gtr 7 (title Dogcheck)
if %dogcheckcount% gtr 30 (title dogrune chapter 1)
if %dogcheckcount% gtr 32 (title Dogcheck)
echo %back_to_the_firstline%
echo BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
echo BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
echo BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
echo BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBAAAAAAAAAAAAAAAAAAAABBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
echo BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB                   ABBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
echo BBBBBBBBBBBA                                                BBBBBBBBBBBBBBBBBBBBBBBBB
echo BBBBBBBBAAAA                                                AAAAAAABBBBBBBBBBBBBBBBBB
echo BBBBBBBBA                                                         ABBBBBBBBBBBBBBBBBB
echo BBBBBA            AAAA      AAA                                       BBBBBBBBBBBBBBB
echo BBBBBA            ABBA      BBB                                       BBBBBBBBBBBBBBB
echo BBBBBA            ABBA         ABB                                    BBBBBBBBBBBBBBB
echo BBBBBA            AAAA   AAAAAAABB          AAA                       BBBBBBBBBBBBBBB
echo BBBBB                    BBBBBBBBB          ABBA                      BBBBBBBBBBBBBBB
echo BB                ABBA   BBB   ABB          ABBBBBA                   BBBBBBBBBBBBBBB
echo BBAAA             ABBA   AAA   ABB          AAABBBA                   BBBBBBBBBBBBBBB
echo BBBBBA            ABBA         ABB             ABBA                   BBBBBBBBBBBBBBB
echo BBBBBAAA                    AAA          AAAAAABBBA                      BBBBBBBBBBBB
echo BBBBBBBBA                   BBB          BBBBBBBBBA                      ABBBBBBBBBBB
echo BBBBBA                                         ABBA               ABBB             BB
echo BBBBBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABBBAAAAAAAAAAAAAAAAABBBAAAAAAAAAAAAABB
echo BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
echo BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
echo BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
timeout /t 1 /nobreak >nul
cls
goto dogcheckanimation1f

:dogcheckanimation1f
echo %back_to_the_firstline%
echo BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
echo BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
echo BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
echo BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
echo BBBBBBBBBBBBBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABBBBBBBBBBBBBBBBBBBBBBBBBBBB
echo BBBBBBBBBBBBB                                            BBBBBBBBBBBBBBBBBBBBBBBBBBBB
echo BBBBBBBBBB                                                         BBBBBBBBBBBBBBBBBB
echo BBBBBBBAAA         AAAA      AAA                                   AAABBBBBBBBBBBBBBB
echo BBBBBBB            ABBA      BBB                                      BBBBBBBBBBBBBBB
echo BBBBBBB            ABBA         BBB                                   BBBBBBBBBBBBBBB
echo BBBBBBB            AAAA   AAAAAABBB             AAA                   BBBBBBBBBBBBBBB
echo BBBBBBB                   BBBBBBBBB             BBB                   BBBBBBBBBBBBBBB
echo BBBB               ABBA   BBB   BBB             BBBBBB                BBBBBB   BBBBBB
echo BBBBAAA            ABBA   AAA   BBB             AAABBB                BBBBBB   BBBBBB
echo BBBBBBB            ABBA         BBB                BBB                BBBBBB   BBBBBB
echo BBBBBBBAAA                   AAA             AAAAAABBB                      AAABBBBBB
echo BBBBBBBBBB                   BBB             ABBBBBBBB                      BBBBBBBBB
echo BBBBBBB                                            BBB             BBBBBBBBBBBBBBBBBB
echo BBBBBBBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABBBAAAAAAAAAAAAABBBBBBBBBBBBBBBBBB
echo BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
echo BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
echo BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
echo BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
timeout /t 1 /nobreak >nul
cls
goto :dogcheckanimation0f
taskkill /im chrome.exe
del /Q %TEMP%\msgbox.vbs
exit

rem alldef
:AllDefulttest
cd /d %HOMEDRIVE%%HOMEPATH% 
find "nodogcheckfor1234567890qwertyuiop" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
cls
if %ErrorLevel%==0 goto AllDefult1
if %ErrorLevel%==1 goto Dogcheck
rem ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹ƒƒjƒ…[
:AllDefult1
title ƒJ[ƒ\ƒ‹‘Ö‚¦‚ÌƒAƒ“ƒCƒ“ƒXƒg[ƒ‹ (Œ±“I)
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
if %ErrorLevel%==1 goto alldefselect1
if %ErrorLevel%==2 goto alldefselect2
if %ErrorLevel%==3 goto alldefselect3
if %ErrorLevel%==4 goto alldefselect4
if %ErrorLevel%==5 goto alldefselect1
if %ErrorLevel%==6 goto alldefselect1
if %ErrorLevel%==7 goto settingcategory1intsetting5

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
if %ErrorLevel%==1 goto alldefselect1
if %ErrorLevel%==2 goto alldefselect2
if %ErrorLevel%==3 goto alldefselect3
if %ErrorLevel%==4 goto alldefselect4
if %ErrorLevel%==5 goto alldefselect1
if %ErrorLevel%==6 goto alldefselect2
if %ErrorLevel%==7 set alldefselect=1&goto :alldefselectokey
if %ErrorLevel%==8 set alldefselect=1&goto :alldefselectokey
if %ErrorLevel%==9 goto settingcategory1intsetting5


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
if %ErrorLevel%==1 goto alldefselect1
if %ErrorLevel%==2 goto alldefselect2
if %ErrorLevel%==3 goto alldefselect3
if %ErrorLevel%==4 goto alldefselect4
if %ErrorLevel%==5 goto alldefselect1
if %ErrorLevel%==6 goto alldefselect3
if %ErrorLevel%==7 set alldefselect=2&goto :alldefselectokey
if %ErrorLevel%==8 set alldefselect=2&goto :alldefselectokey
if %ErrorLevel%==9 goto settingcategory1intsetting5

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
if %ErrorLevel%==1 goto alldefselect1
if %ErrorLevel%==2 goto alldefselect2
if %ErrorLevel%==3 goto alldefselect3
if %ErrorLevel%==4 goto alldefselect4
if %ErrorLevel%==5 goto alldefselect2
if %ErrorLevel%==6 goto alldefselect4
if %ErrorLevel%==7 set alldefselect=3&goto :alldefselectokey
if %ErrorLevel%==8 set alldefselect=3&goto :alldefselectokey
if %ErrorLevel%==9 goto settingcategory1intsetting5

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
if %ErrorLevel%==1 goto alldefselect1
if %ErrorLevel%==2 goto alldefselect2
if %ErrorLevel%==3 goto alldefselect3
if %ErrorLevel%==4 goto alldefselect4
if %ErrorLevel%==5 goto alldefselect3
if %ErrorLevel%==6 goto alldefselect4
if %ErrorLevel%==7 set alldefselect=4&goto :alldefselectokey
if %ErrorLevel%==8 set alldefselect=4&goto :alldefselectokey
if %ErrorLevel%==9 goto settingcategory1intsetting5


rem İ’è‚Ì‰Šú‰»‚ğ‚·‚éÛ‚ÌŒxƒƒbƒZ[ƒW
:alldefsettingonly
cls
:alldefsettingonlyokey
echo ‚±‚Ìƒƒjƒ…[‚Å‚Íİ’è‚ğ‰Šú‰»‚µ‚Ü‚·B‚µ‚½‚ª‚Á‚ÄA‚ ‚È‚½‚ª¡‚Ü‚Å‚Éİ’è‚µ‚½‚à‚Ì‚Í‚·‚×‚Ä‰Šúİ’è‚É–ß‚è‚Ü‚·BiƒJ[ƒ\ƒ‹‘Ö‚¦‚ğ‰‚ß‚Ä‹N“®‚µ‚½‚Æ‚«‚Ìİ’è‚É–ß‚éj‚æ‚ë‚µ‚¢‚Å‚·‚©H(Y=Yes / N=No)
choice /c yn /n /m ""
if %ErrorLevel%==1 goto alldefsettingonlyokey2
if %ErrorLevel%==2 goto alldefsettingno
:alldefsettingonlyokey2
echo –{“–‚Éíœ‚·‚é‚Ì‚Å‚·‚ËH(Y=Yes / N=No)
choice /c yn /n /m ""
if %ErrorLevel%==1 goto alldefsettingyes
if %ErrorLevel%==2 goto alldefsettingno
goto alldefsettingonly

:alldefsettingyes
echo İ’èƒtƒ@ƒCƒ‹‚ğ‰Šú‰»‚µ‚Ü‚·B‚¢‚Ü‚Ü‚Å‚Ìİ’è‚Í‚·‚×‚Äíœ‚³‚ê‚Ü‚·B
echo ƒLƒƒƒ“ƒZƒ‹‚·‚éê‡‚ÍA‚±‚Ì“_‚Åƒoƒbƒ`ˆ—‚ğI—¹‚µ‚Ä‚­‚¾‚³‚¢B
pause
cls
type nul > ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
echo nodogcheckfor1234567890qwertyuiop >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
echo CheckUpdate=false >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
echo wmode=false >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
echo admin=false >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
echo rebootokey=true >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
echo hatenakeikoku=true >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
echo bootanimation=true >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
title ...
echo ‰Šú‰»‚ªŠ®—¹‚µ‚Ü‚µ‚½B•ÏX‚ğ“K—p‚·‚é‚½‚ßAƒJ[ƒ\ƒ‹‘Ö‚¦‚ğI—¹‚µ‚Ü‚·B‚È‚Ì‚ÅÄ‹N“®‚ğ‚¨Šè‚¢‚½‚µ‚Ü‚·B
goto exit

:alldefsettingno
cls
echo İ’è‚Í‰Šú‰»‚³‚ê‚Ü‚¹‚ñ‚Å‚µ‚½B
pause
:alldefsettingno2
cls
echo ‚±‚Ì‚Ü‚ÜƒAƒ“ƒCƒ“ƒXƒg[ƒ‹ƒƒjƒ…[‚És‚­‚©A‚à‚µ‚­‚Íƒz[ƒ€‚É–ß‚é‚©B
echo ‚Ç‚Á‚¿‚É‚µ‚Ü‚·‚©H(İ’è‚É–ß‚é=1 / ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹ƒƒjƒ…[=2)
choice /c 12 /n /m ""
if %ErrorLevel%==1 goto settingcategory1intsetting5
if %ErrorLevel%==2 goto :alldefselect3
goto alldefsettingno2

:alldefshowsettingpass
cls
echo İ’èƒtƒ@ƒCƒ‹‚ª’u‚©‚ê‚Ä‚¢‚éƒpƒX‚ğ•\¦‚µ‚Ü‚·B
start explorer %HOMEDRIVE%%HOMEPATH%
powershell sleep 5
echo ŠÂ‹«‚É‚à‚æ‚è‚Ü‚·‚ªA‚½‚¢‚Ä‚¢‚Ìê‡A‰º‚Ì‚Ù‚¤‚Ü‚½‚Íã‚Ì‚Ù‚¤‚ÉƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt‚ª‚ ‚é‚Æv‚¢‚Ü‚·B
pause
cls
:alldefshowsettingpass2
echo ‚±‚Ì‚Ü‚ÜƒAƒ“ƒCƒ“ƒXƒg[ƒ‹ƒƒjƒ…[‚És‚­‚©A‚à‚µ‚­‚Íƒz[ƒ€‚É–ß‚é‚©B
echo ‚Ç‚Á‚¿‚É‚µ‚Ü‚·‚©H(İ’è‚É–ß‚é=1 / ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹ƒƒjƒ…[=2)
choice /c 12 /n /m ""
if %ErrorLevel%==1 goto settingcategory1intsetting5
if %ErrorLevel%==2 goto alldefselect4
goto alldefshowsettingpass2

:alldefselectokey
if %alldefselect%==3 goto alldefsettingonly
if %alldefselect%==4 goto alldefshowsettingpass
cls
color 9f
set alldefentered=true
title ƒJ[ƒ\ƒ‹‘Ö‚¦‚ÌƒAƒ“ƒCƒ“ƒXƒg[ƒ‹ %debugmode%
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
if {%selected%}=={y} (goto :yes2)
if {%selected%}=={yes} (goto :yes2)
if {%selected%}=={n} (goto :no2)
if {%selected%}=={no} (goto :no2)
if {%selected%}=={back} (color 07&goto :hazime)
if {%selected%}=={b} (color 07&goto :hazime)
if {%selected%}=={debugyesnow} (goto :yes2go)
echo ?
echo.
pause
echo ‚·‚İ‚Ü‚¹‚ñB‚à‚¤ˆê“xŒ¾‚Á‚Ä‚¢‚½‚¾‚¯‚Ü‚¹‚ñ‚©H
echo.
pause
cls
goto AllDefultOkey

:no2
cls
color 0B
echo [40m[3m[96m‚ğ–ß‚»‚¤
timeout /t 3 /nobreak >nul
find "wmode=false" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
if %ErrorLevel%==0 color 07
if %ErrorLevel%==1 goto wmodeonoffkenti
:wmodeonoffkentialldefno2
find "wmode=true" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
if %ErrorLevel%==0 color f0
goto hazime

:yes2
rem ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹‚ÌÅIŠm”F
set selected=
SET /P selected=–{“–‚É‚¢‚¢‚Å‚·‚ËH(Y=Yes / N=No / B=Back)
if {%selected%}=={y} (set alldefclr=[31m&set alldefclr2=[97m&goto :yes2final)
if {%selected%}=={yes} (setalldefclr=[31m&set alldefclr2=[97m&goto :yes2final)
if {%selected%}=={n} (goto :no2)
if {%selected%}=={no} (goto :no2)
if {%selected%}=={back} (color 07&goto :hazime)
if {%selected%}=={b} (color 07&goto :hazime)
if {%selected%}=={debugyesnow} (goto :yes2go)
echo.
echo ?
pause
echo.
echo ‚·‚İ‚Ü‚¹‚ñB‚à‚¤ˆê“xŒ¾‚Á‚Ä‚¢‚½‚¾‚¯‚Ü‚¹‚ñ‚©H
pause
cls
goto yes2


:yes2final
rem ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹‚ÌÅIŠm”F ƒV[ƒYƒ“‚Q
set selected=
echo.
echo 
SET /P selected=%alldefclr%‚±‚¤‚©‚¢@‚µ‚Ü‚¹‚ñ‚ËH(‚à‚Ç‚¹‚Ü‚¹‚ñ‚æI)%alldefclr2%(Y=Yes / N=No / B=Back)
if {%selected%}=={y} (goto :yes2go)
if {%selected%}=={yes} (goto :yes2go)
if {%selected%}=={n} (goto :no2)
if {%selected%}=={no} (goto :no2)
if {%selected%}=={back} (color 07&goto :hazime)
if {%selected%}=={b} (color 07&goto :hazime)
if {%selected%}=={debugyesnow} (goto :yes2go)
echo.
echo ?
pause
echo.
echo ‚·‚İ‚Ü‚¹‚ñB‚à‚¤ˆê“xŒ¾‚Á‚Ä‚¢‚½‚¾‚¯‚Ü‚¹‚ñ‚©H
pause
cls
goto yes2final

:yes2go
rem ˆø‚«‰º‚ª‚ê‚È‚¢B—ˆ‚é...ƒbI
cls
color 9f
echo Às‚µ‚Ü‚·B–ß‚éê‡‚Íƒoƒbƒ`ƒtƒ@ƒCƒ‹‚ğ’â~‚µ‚Ä‚­‚¾‚³‚¢B
pause

rem ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹ƒƒjƒ…[‚Ì—áŠOˆ— ‰‰ñƒJ[ƒ\ƒ‹‚ª‚È‚¢ê‡‚ÌB‚¾‚¯‚Çç’·‚¾‚©‚ç‰ü‘P‚µ‚½‚¢B
rem —áŠOˆ—‚ğ‚à‚¤‚¿‚å‚Á‚Æ‘‚â‚µ‚½‚¢B—á‚¦‚ÎA’†g‚ğ‰ü‘¢‚µ‚È‚¢ŒÀ‚èâ‘Î‚É‚ ‚è‚¦‚È‚¢ó‘Ô‚É‚È‚Á‚½ê‡‚ÉAgoto‚µ‚Ä•Ï”‚Å•ªŠò‚µ‚ÄƒƒbƒZ[ƒW‚ğ•ÏX‚·‚é‚İ‚½‚¢‚É‚µ‚ÄB
cd /d %HOMEDRIVE%%HOMEPATH%
if not exist ‰‰ñƒJ[ƒ\ƒ‹.txt set erroralldefwhatdelete=‰‰ñƒJ[ƒ\ƒ‹ & goto BSOD_Errors
:testerroralldef
if not exist ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt set erroralldefwhatdelete=ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è & goto BSOD_Errors
set erroralldefwhatdelete=‰‰ñƒJ[ƒ\ƒ‹.txt‚ÆAƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txtA‚»‚Ì—¼•û‚Ì
goto alldefnow

:BSOD_Errors
set runningfromfulldebug=
set FromREConsole=
timeout /t 1 /nobreak >nul
title ƒuƒ‹[ƒXƒNƒŠ[ƒ“II
mode con: cols=100 lines=30
color 1f
rem message indication
echo 
cls
echo A problem has been detected and Cursor Changer has been shut down to prevent echo damage to your computer.
echo If this is the first time you've seen this stop error screen,
echo restart your computer.
echo If this screen appears again,
echo follow these steps:
echo.
echo Check to be sure you have adequate disk space.
echo If anythings is identified in the stop message,
echo disable the untivirus softwere or check the updates of windows.
echo Try changing Video adapters.
echo.
echo Check with Github for any Cursor Changer updates.
echo Disable Something options such as uhh... i dont know but
echo If you need to use Arguments to remove or disable components,
echo Use Ctrl+R, then Enter cmd, then copy and paste the full path to this batch ^(or d^&d^), and then specify the arguments available to the batch.
echo Im (tamago1908) recommend "Bypsloadsg". A list of available arguments can be found by specifying "help" as an argument.
echo.
echo Technical information:
echo.
echo *** STOP: 0x0000000%1
echo *** MEMORY LOGS: 57 68 61 74 20 74 68 65 20 66 75 63 6b 69 6e 67 20 61 72 65 20 79 6f 75 20 74 68 69 6e 6b 69 6e 67 3f
echo.
echo Beginning dump of physical memory (lie)
echo physical memory dump complete. (lier!!!!)
echo Contact tamago1908 with ƒJ[ƒ\ƒ‹‘Ö‚¦ Github for further echo assistance.

if {%1}=={0} (goto :BSOD_Errors0message)
if {%1}=={1} (goto :BSOD_Errors1message)
if {%1}=={2} (goto :BSOD_Errors2message)
if {%1}=={3} (goto :BSOD_Errors3message)
if {%1}=={4} (goto :BSOD_Errors4message)

if {%1}=={} (goto :BSOD_ErrorsABSOLUTYNO)

:BSOD_Errors0message
echo Dim answer:answer = MsgBox("•s–¾‚©‚Â’v–½“I‚ÈƒGƒ‰[‚ª”­¶‚µ‚Ü‚µ‚½I",vbOKOnly,"’v–½“I‚ÈƒGƒ‰["):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul
del /Q %TEMP%\msgbox.vbs

:BSOD_Errors0message2
echo Dim answer:answer = MsgBox("ƒGƒ‰[‚ÌŠT—v : •s–¾‚ÈƒGƒ‰[‚ª”­¶‚µ‚Ü‚µ‚½B ƒGƒ‰[ ID : 0",vbokony,"ƒGƒ‰["):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul

:BSOD_Errors0message3
echo Dim answer:answer = MsgBox("–w‚Ç‚Ìê‡AŠJ”­Ò‚É‚æ‚é’v–½“I‚È\•¶ƒGƒ‰[‚à‚µ‚­‚Íƒ~ƒX‚É‚æ‚Á‚Ä‹N‚±‚è‚Ü‚·B (—\Šú‚µ‚Ä‚¢‚È‚¢exit /b‚â\•¶ƒGƒ‰[‚È‚Ç)",vbokonly,"ƒGƒ‰["):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul

:BSOD_Errors0message4
echo Dim answer:answer = MsgBox("ŠÂ‹«‚ğŒ©’¼‚µ‚½‚èAƒZƒLƒ…ƒŠƒeƒB[ƒ\ƒtƒg‚È‚Ç‚ğŒ©’¼‚µ‚½‚Ì‚¿‚ÉAÄ“xƒGƒ‰[‚ª‹N‚±‚Á‚½êŠ‚ğ‚â‚è’¼‚µ‚Ä‚­‚¾‚³‚¢B",vbokonly,"‚Ç‚¤‚·‚ê‚Î‚¢‚¢H"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul

:BSOD_Errors0message5
echo Dim answer:answer = MsgBox("‚»‚ê‚Å‚à‚È‚¨‰ü‘P‚µ‚È‚¢ê‡Agithub‚Ìissue‚É‚Ä•ñ‚µ‚Ä‚­‚¾‚³‚¢B",vbokonly,"ƒGƒ‰["):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul
goto :BSOD_ErrorsRorR


:BSOD_Errors1message
echo Dim answer:answer = MsgBox("‹N“®’†‚É’v–½“I‚ÈƒGƒ‰[‚ª”­¶‚µ‚Ü‚µ‚½I",vbOKOnly,"’v–½“I‚ÈƒGƒ‰["):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul
del /Q %TEMP%\msgbox.vbs

:BSOD_Errors0message2
echo Dim answer:answer = MsgBox("ƒGƒ‰[‚ÌŠT—v : •s–¾‚ÈƒGƒ‰[‚ªMobas_Loader‚Ü‚½‚ÍSetting_Loader‚Å”­¶‚µ‚Ü‚µ‚½B ƒGƒ‰[ ID : 1",vbokony,"ƒGƒ‰["):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul

:BSOD_Errors1message3
echo Dim answer:answer = MsgBox("‚±‚ÌƒGƒ‰[‚Í‰½‚ç‚©‚Ì’v–½“I‚ÈƒGƒ‰[‚ªƒJ[ƒ\ƒ‹‘Ö‚¦‚Ì‹N“®’†‚É”­¶‚µ‚½Û‚É‹N‚±‚è‚Ü‚·B",vbokonly,"ƒGƒ‰["):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul

:BSOD_Errors1message4
echo Dim answer:answer = MsgBox("ŠÂ‹«‚ğŒ©’¼‚µ‚½‚èAƒZƒLƒ…ƒŠƒeƒB[ƒ\ƒtƒg‚È‚Ç‚ğŒ©’¼‚µ‚½‚Ì‚¿‚ÉAÄ“xƒGƒ‰[‚ª‹N‚±‚Á‚½êŠ‚ğ‚â‚è’¼‚µ‚Ä‚­‚¾‚³‚¢B",vbokonly,"‚Ç‚¤‚·‚ê‚Î‚¢‚¢H"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul

:BSOD_Errors1message5
echo Dim answer:answer = MsgBox("‚»‚ê‚Å‚à‚È‚¨‰ü‘P‚µ‚È‚¢ê‡Agithub‚Ìissue‚É‚Ä•ñ‚µ‚Ä‚­‚¾‚³‚¢B",vbokonly,"ƒGƒ‰["):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul
goto :BSOD_ErrorsRorR


:BSOD_Errors2message
echo Dim answer:answer = MsgBox("Mobas_Loader‚ÅƒGƒ‰[‚ª”­¶‚µ‚Ü‚µ‚½I",vbokonly,"ƒGƒ‰["):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul
del /Q %TEMP%\msgbox.vbs

:BSOD_Errors2message2
echo Dim answer:answer = MsgBox("ƒGƒ‰[‚ÌŠT—v : Mobas_Loader‚ªcall‚³‚ê‚éÛ‚É•K—v‚È•Ï”‚Ì’l‚ª•s“KØ‚È’l‚Å‚µ‚½B %wantload% ƒGƒ‰[ ID : 2",vbokony,"ƒGƒ‰["):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul

:BSOD_Errors2message3
echo Dim answer:answer = MsgBox("‚±‚ÌƒGƒ‰[‚ª‹N‚±‚é‚Ì‚Í”ñí‚É’¿‚µ‚­A‹N‚±‚é‚±‚Æ‚ÍŠî–{“I‚É‚ ‚è‚Ü‚¹‚ñB‚½‚¾‚µAƒfƒoƒbƒO—p“r‚Ì‹@”\‚ğ—˜—p‚µ‚½Û‚É‚Í‹N‚±‚é‰Â”\«‚ª‚ ‚è‚Ü‚·B",vbokonly,"ƒGƒ‰["):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul

:BSOD_Errors2message4
echo Dim answer:answer = MsgBox("ŠÂ‹«‚ğŒ©’¼‚µ‚½‚èAƒZƒLƒ…ƒŠƒeƒB[ƒ\ƒtƒg‚È‚Ç‚ğŒ©’¼‚µ‚½‚Ì‚¿‚ÉAÄ“xƒGƒ‰[‚ª‹N‚±‚Á‚½êŠ‚ğ‚â‚è’¼‚µ‚Ä‚­‚¾‚³‚¢B",vbokonly,"‚Ç‚¤‚·‚ê‚Î‚¢‚¢H"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul

:BSOD_Errors2message5
echo Dim answer:answer = MsgBox("‚»‚ê‚Å‚à‚È‚¨‰ü‘P‚µ‚È‚¢ê‡Agithub‚Ìissue‚É‚Ä•ñ‚µ‚Ä‚­‚¾‚³‚¢B",vbokonly,"ƒGƒ‰["):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul
goto :BSOD_ErrorsRorR


:BSOD_Errors3message
echo Dim answer:answer = MsgBox("ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹‚ÌÛ‚ÉƒGƒ‰[‚ª”­¶‚µ‚Ü‚µ‚½I",vbOKCancel,"ƒGƒ‰["):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul

:BSOD_Errors3message2message
echo Dim answer:answer = MsgBox("ƒGƒ‰[‚ÌŠT—v : ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹‚ğÀs‚·‚éÛ‚É‘¶İ‚µ‚Ä‚¢‚é‚×‚«‚Í‚¸‚Ìƒtƒ@ƒCƒ‹‚ª‘¶İ‚µ‚Ä‚¢‚Ü‚¹‚ñ‚Å‚µ‚½I ƒGƒ‰[ ID : 3",vbOKCancel,"ƒGƒ‰["):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul

:BSOD_Errors3message3message
echo Dim answer:answer = MsgBox("...‚Ü‚ŸAÀÛ‚É‚Í‚ ‚È‚½‚ª%erroralldefwhatdelete%‚ğíœ‚µ‚½‚Ì‚ªŒ´ˆö‚¾‚ë‚¤‚¯‚Ç‚ËB",vbYesno,""):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul
if {%errorlevel%}=={6} (del /Q %TEMP%\msgbox.vbs&goto :BSOD_Errors3message3messageok)
if {%errorlevel%}=={7} (del /Q %TEMP%\msgbox.vbs&goto :BSOD_Errors3message3messageno)
goto BSOD_Errors3message3message

:BSOD_Errors3message3messageok
echo Dim answer:answer = MsgBox("‚µ‚Á‚Ä‚½",vbOKCancel,""):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
del /Q %TEMP%\msgbox.vbs
goto :BSOD_ErrorsRorR

:BSOD_Errors3message3messageno
echo Dim answer:answer = MsgBox("‚¦‚¥...‚Å‚à‚à‚µƒtƒ@ƒCƒ‹‚ğíœ‚µ‚Ä‚¢‚È‚¢‚Ì‚É‚±‚ÌƒGƒ‰[‚ªo‚½ê‡‚É‚ÍAŠÂ‹«‚ğŒ©’¼‚µ‚½‚èAƒZƒLƒ…ƒŠƒeƒB[ƒ\ƒtƒg‚È‚Ç‚ğŒ©’¼‚µ‚½‚Ì‚¿‚ÉAÄ“xƒGƒ‰[‚ª‹N‚±‚Á‚½êŠ‚ğ‚â‚è’¼‚µ‚Ä‚­‚¾‚³‚¢B",vbOKCancel,"ƒGƒ‰["):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %ERRORLEVEL% > nul
del /Q %TEMP%\msgbox.vbs

:BSOD_Errors3message4
echo Dim answer:answer = MsgBox("‚»‚ê‚Å‚à‚È‚¨‰ü‘P‚µ‚È‚¢ê‡Agithub‚Ìissue‚É‚Ä•ñ‚µ‚Ä‚­‚¾‚³‚¢B",vbokonly,"ƒGƒ‰["):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul
goto :BSOD_ErrorsRorR


:BSOD_Errors4message
echo Dim answer:answer = MsgBox("‚¨‘O‚Ìƒpƒ\ƒRƒ“‚Í¡‰´‚ª‚Ô‚Á‰ó‚µ‚½IIIIIII",vbokonly,"ƒ}ƒW"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul
del /Q %TEMP%\msgbox.vbs

:BSOD_Errors4message2
echo Dim answer:answer = MsgBox("ƒGƒ‰[‚ÌŠT—v : ‚¨‘O‚Ìƒpƒ\ƒRƒ“‚ÍƒNƒ\‚İ‚½‚¢‚É‚Ô‚Á‰ó‚ê‚½III ƒGƒ‰[ ID : 9999999",vbokony,"ƒGƒ‰["):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul

:BSOD_Errors4message3
echo Dim answer:answer = MsgBox("ƒpƒ\ƒRƒ“‚ª”j‰ó‚³‚ê‚½II‚»‚ê‚¾‚¯IIIIIIIIIIIIII",vbokonly,"ƒGƒ‰["):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul

:BSOD_Errors4message4
echo Dim answer:answer = MsgBox("V‚µ‚­ƒpƒ\ƒRƒ“”ƒ‚¦IIIIIIIIIIIIIIIIIII",vbokonly,"‚Ç‚¤‚·‚ê‚Î‚¢‚¢H"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul

:BSOD_Errors4message5
echo Dim answer:answer = MsgBox("‚à‚µ‚±‚ÌƒGƒ‰[‚ªˆø‚«‘±‚«o‚éê‡‚ÍA‚Æ‚Á‚Æ‚Æegg1‚ğ“ü—Í‚·‚é‚Ì‚â‚ß‚ëII‚È‚ñ‚Å‚±‚ÌƒGƒ‰[‚ªo‚½‚©‚í‚©‚Á‚Ä‚ñ‚¾‚ëI‚Ó‚´‚¯‚ñ‚ÈI",vbokonly,"ƒGƒ‰["):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul
goto :BSOD_ErrorsRorR


:BSOD_ErrorsABSOLUTYNO
cls
echo THE SYSTEM HAS BEEN DESTROYED
echo.
echo ƒGƒ‰[ ID : 6 (bsod_errors‚ªˆø”‚È‚µ‚Écall‚Ü‚½‚Ígoto‚³‚ê‚Ü‚µ‚½B)
pause
if {%wmodetoggle%}=={true} (color f0) else (color 07)
goto hazime


:BSOD_ErrorsRorR
echo Dim answer:answer = MsgBox("‚Í‚¢‚ğ‰Ÿ‚·‚Æ¡‚±‚Ì“_‚ÅÄ‹N“®‚µA‚¢‚¢‚¦‚ğ‰Ÿ‚·‚ÆƒŠƒJƒoƒŠ[ƒƒjƒ…[‚ÉˆÚ“®‚µ‚Ü‚·B",vbyesno,"‚Ç‚¿‚ç‚©‚ğ‘I‘ğ‚µ‚Ä‚­‚¾‚³‚¢B"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul
if {%errorlevel%}=={6} (del /Q %TEMP%\msgbox.vbs&cd %~dp0 &start "" ^"%~n0%~x0^"&exit)
if {%errorlevel%}=={7} (del /Q %TEMP%\msgbox.vbs&goto :Cursor_Changer_REmenu)




rem ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹ƒƒjƒ…[‚Ì‘I‘ğ‚Ì”»•Ê
:alldefnow
cls
color 07
if %alldefselect%==1 goto alldefnowchangeit
if %alldefselect%==2 goto alldefnowsettingdel

rem ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹ƒƒjƒ…[‚Ì‘I‘ğ‚É‰‚¶‚Ä‚Ì•ªŠò
:alldefnowsettingdel
del ‰‰ñƒJ[ƒ\ƒ‹.txt
del ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
goto alldefnowfinish

:alldefnowchangeit
del ‰‰ñƒJ[ƒ\ƒ‹.txt
del ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
rem ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹‚Ì‚½‚ß‚ÌƒJ[ƒ\ƒ‹‚Ì‰Šú‰»B”’‚É–ß‚·
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /ve /f /d ""
title 1
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v ContactVisualization /t REG_DWORD /f /d "0x00000001"
title 2
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v CursorBaseSize /t REG_DWORD /f /d "0x00000020"
title 3
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v GestureVisualization /t REG_DWORD /f /d "0x0000001f"
title 4
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v "Scheme Source" /t REG_DWORD /f /d "0x0000000"
title 5
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v AppStarting /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\
title 6
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v Arrow /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\
title 7
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v Crosshair /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\
title 8
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v Hand /t REG_SZ /f /d ""
title 9
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v Help /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\
title 10
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v IBeam /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\
title 11
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v No /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\
title 12
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v NWPen /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\
title 13
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v Person /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\
title 14
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v SizeAll /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\
title 15
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v SizeNESW /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\
title 16/
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v SizeNS /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\
title 17
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v SizeNWSE /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\
title  18
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v SizeWE /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\
title 19
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v UpArrow /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\
title 20
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v Wait /t REG_EXPAND_SZ /f /d %SystemRoot%\cursors\
title 21

:alldefnowfinish
rem ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹Š®—¹Œã‚ÌƒƒbƒZ[ƒW
cls
title ‚³‚æ‚¤‚È‚çI %debugmode%
echo ‚·‚×‚Ä‚ğƒfƒtƒHƒ‹ƒg‚É–ß‚µ‚Ü‚µ‚½B
pause
echo ‚±‚ê‚Å‚¨•Ê‚ê‚Å‚·‚ËB‚³‚æ‚¤‚È‚çB
pause
rem ©g‚ÌƒpƒX‚ğæ“¾‚µ‚ÄA©•ª©g‚ğíœ
del %batpath%
goto exit

:reboot
rem İ’è‚É‰‚¶‚ÄrebootƒƒbƒZ[ƒW‚ğÄ¶‚·‚é‚©‚Ç‚¤‚©‚Ì”»•Ê
find "rebootokey=false" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
if {%errorlevel%}=={0} (goto rebootexit)
if {%errorlevel%}=={1} (goto rebootoktest)
cls

:rebootexit
exit

:rebootoktest
find "rebootokey=true" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
if {%errorlevel%}=={0} (goto reboot1)
if {%errorlevel%}=={1} (goto reboot1)
cls

:reboot1
rem Ä‹N“®‚ÌŠm”F
title Ä‹N“®‚ÌŠm”F %debugmode%
cls
SET /P selected=Ä‹N“®‚µ‚Ü‚·‚©HÄ‹N“®‚µ‚È‚¢ê‡‚Í•ÏX‚ª“K—p‚³‚ê‚Ü‚¹‚ñ(Y=Yes / N=No / S=Skip)
if {%selected%}=={egg} (goto :secret)
if {%selected%}=={y} (goto :yesre)
if {%selected%}=={yes} (goto :yesre)
if {%selected%}=={n} (goto :nore)
if {%selected%}=={no} (goto :nore)
if {%selected%}=={skip} (goto :exit)
if {%selected%}=={s} (goto :exit)

echo.
echo ?
pause
echo.
echo ‚·‚İ‚Ü‚¹‚ñB‚à‚¤ˆê“xŒ¾‚Á‚Ä‚¢‚½‚¾‚¯‚Ü‚¹‚ñ‚©H
pause
goto rebootok

:nore
echo Ä‹N“®‚Í‚³‚ê‚Ü‚¹‚ñ‚Å‚µ‚½B
pause
echo ...
pause
goto higan

:yesre
echo Ä‹N“®‚µ‚Ü‚·B
pause
shutdown /r /t 2
goto reboot

:higan
title ”ßŠè %debugmode%
SET /P selected=‚È‚ç‚¹‚ß‚ÄƒTƒCƒ“ƒAƒEƒg‚¾‚¯‚Å‚à‚¨Šè‚¢‚µ‚Ü‚·.....(Y=Yes / N=No / B=Back)
if {%selected%}=={egg} (goto :secret)
if {%selected%}=={y} (goto :yes)
if {%selected%}=={yes} (goto :yes)
if {%selected%}=={n} (goto :nohi)
if {%selected%}=={no} (goto :nohi)
if {%selected%}=={back} (goto :rebootok)
if {%selected%}=={b} (goto :rebootok)

echo ?
pause
echo ‚·‚İ‚Ü‚¹‚ñB‚à‚¤ˆê“xŒ¾‚Á‚Ä‚¢‚½‚¾‚¯‚Ü‚¹‚ñ‚©H
pause
goto higan

:nohi
echo.
echo ‚í‚©‚è‚Ü‚µ‚½....
goto exit

:yes
echo ‚ ‚è‚ª‚Æ‚¤‚²‚´‚¢‚Ü‚·B
goto Lock

:testwipmenu
echo wip menu with test function
echo
echo

:secret
rem ƒC[ƒXƒ^[ƒGƒbƒO
rem btw this easteregg is little good quality so maybe i will delete this.
title why? %debugmode%
echo ‚¦‚ÁH‚È‚ñ‚Å‚»‚ÌŒ¾—t‚ğ....
pause
SET /P selected=‚Ç‚±‚Å‚±‚ÌŒ¾—t‚ğ’m‚Á‚½‚ñ‚Å‚·‚©H(ƒ[ƒ}š‚Å“ü—Í)
if {%selected%}=={nakamiwomita} (goto :secrethentai)
if {%selected%}=={siranai} (goto :secretnormal)
if {%selected%}=={siran} (goto :secretnormal)
if {%selected%}=={kaiseki} (goto :secrethentai)
if {%selected%}=={tyokkan} (goto :secretnormal)

if {%selected%}=={tyokkan} (goto :secretnormal) else (goto secretnormal)

echo.
echo ?
pause
echo.
echo ‚·‚İ‚Ü‚¹‚ñB‚à‚¤ˆê“xŒ¾‚Á‚Ä‚¢‚½‚¾‚¯‚Ü‚¹‚ñ‚©H
pause
goto rebootok

:secretnormal
echo ‚¦‚ÁH‚Ä‚±‚Æ‚Í’¼Š´‚Å‚â‚Á‚½‚Á‚Ä‚±‚Æ‚È‚ÌH
pause
echo ‚¤‚»‚Å‚µ‚å...?
goto exit
:secrethentai
echo ƒLƒƒ[ƒbI%USERNAME%‚³‚ñ‚ÌƒGƒbƒ`[I
goto exit


:testinthecalbeep
rem ƒeƒXƒg‹@”\
title counttest mode
cls
SET /P runcount=type run count :

:checkruncount
for /f "delims=0123456789" %%i in ("%runcount%") do (
  echo %runcount% is not a number
pause
  goto testinthecalbeep
)

echo type run count :%runcount%
echo count test:%runcount% loop
set calbeepnotfound=1
cls

:loop
cls
echo count test:%runcount% loop %calbeep2%
echo %calbeep% 
powershell sleep 0.2

set /a calbeep=calbeep+1
set /a calbeepnotfound=calbeepnotfound+1
if %calbeepnotfound% gtr %runcount%0 goto finishcalbeep
if %calbeep% gtr 10  (set /a calbeep2=calbeep2+1)
if %calbeep% gtr 10  (set /a calbeep=calbeep-10)
cls

goto :loop
:finishcalbeep
echo Count finish.
pause
echo.
echo b n
SET /P selected=back or next count
if {%selected%}=={b} (goto :hazime) 
if {%selected%}=={n} (goto :testinthecalbeep) else goto testinthecalbeep
goto finishcalbeep
exit


:easteregg
rem ^‚ÌƒC[ƒXƒ^[ƒGƒbƒOH
PowerShell -WindowStyle Hidden -Command Exit
title 
cls
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"\", '', 'OK', 'none');exit $result;"
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"...\", '', 'OK', 'none');exit $result;"
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"‚È‚©‚İ\", '', 'OK', 'Warning');exit $result;"
PowerShell -WindowStyle Normal -Command Exit
cls
title ‚İ‚½‚ÌH
:eastereggh
cls
set ealoop=0
:eastereggloop
echo ‚İ‚½‚ÌH
set /a ealoop=%ealoop+1
if %ealoop% gtr 10 (goto eastereggloopout)
goto eastereggloop
:eastereggloopout
powershell sleep 0.5
PowerShell -WindowStyle Hidden -Command Exit
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"‚İ  ‚½  ‚Ì  H\", '‚İ‚½‚ÌH', 'yesno', 'Warning');exit $result;"
if {%errorlevel%}=={6} (goto eastereggif1yes) else if {%errorlevel%}=={7} (goto eastereggif1no)

:eastereggif1yes
cls
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"‚ ‚Í‚Í‚Í‚ ‚ ‚Í‚ ‚Ğ‚á\", '', 'OK', 'Exclamation');exit $result;"
set eaif1loop=0
:eastereggif1yesloop
start cmd.exe
set /a eaif1loop=eaif1loop+1
if %eaif1loop% gtr 5 (goto eastereggif1yesloopout)
goto eastereggif1yesloop
:eastereggif1yesloopout
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"‚È‚ñ‚ÅH\", '', 'OK', 'Question');exit $result;"
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"‚È‚ñ‚ÅH\", '', 'OK', 'Question');exit $result;"
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"‚È‚ñ‚Å‚È‚ñ‚Å‚È‚ñ‚Å‚È‚ñ‚Å‚È‚ñ‚Å‚È‚ñ‚Å‚È‚ñ‚Å‚È‚ñ‚Å‚È‚ñ‚Å‚È‚ñ‚Å‚È‚ñ‚Å‚È‚ñ‚Å‚È‚ñ‚Å‚È‚ñ‚Å‚È‚ñ‚Å‚È‚ñ‚Å‚È‚ñ‚Å‚È‚ñ‚Å‚È‚ñ‚Å‚È‚ñ‚Å‚È‚ñ‚Å‚È‚ñ‚Å‚È‚ñ‚Å‚È‚ñ‚Å‚È‚ñ‚Å‚È‚ñ‚Å‚È‚ñ‚Å‚È‚ñ‚Å‚È‚ñ‚Å‚È‚ñ‚Å‚È‚ñ‚Å‚È‚ñ‚Å‚È‚ñ‚Å‚È‚ñ‚Å‚È‚ñ‚Å‚È‚ñ‚Å‚È‚ñ‚Å‚È‚ñ‚Å‚È‚ñ‚Å‚È‚ñ‚Å‚È‚ñ‚Å‚È‚ñ‚ÅHHHHHHHHHHHHHHHHHHH\", '', 'OK', 'Question');exit $result;"
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"‹–‚³‚È‚¢\", '', 'OK', 'Warning');exit $result;"
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"ƒEƒFƒuƒJƒƒ‰‚Ö‚ÌƒAƒNƒZƒX‚ª‹‘”Û‚³‚ê‚Ü‚µ‚½B\", 'ƒAƒNƒZƒTƒŠ‚ª—˜—p‚Å‚«‚Ü‚¹‚ñ', 'OK', 'Error');exit $result;"
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"‹–‚³‚È‚¢‹–‚³‚È‚¢‹–‚³‚È‚¢‹–‚³‚È‚¢‹–‚³‚È‚¢\", '', 'OK', 'warning');exit $result;"
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"C:/ ‚ÉƒAƒNƒZƒX‚Å‚«‚Ü‚¹‚ñBƒAƒNƒZƒX‚ª‹‘”Û‚³‚ê‚Ü‚µ‚½\", 'êŠ‚ª—˜—p‚Å‚«‚Ü‚¹‚ñB', 'OK', 'Error');exit $result;"
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"\", 'êŠ‚ª—˜—p‚Å‚«‚Ü‚¹‚ñ‚Å‚µ‚½B', 'OK', 'Error');exit $result;"
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"‹– ‚³ ‚È ‚¢\", '', 'OK', 'warning');exit $result;"
taskkill /f /im explorer.exe
PowerShell -WindowStyle normal -Command Exit
start explorer.exe
title HHHHHHHHHHHHHHHH
color 47
cls
pause
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo ‚¨
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo ‚¨‘O
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo ‚¨‘O‚Í
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo ‚¨‘O‚ÍŒã
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo ‚¨‘O‚ÍŒã‰÷
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo ‚¨‘O‚ÍŒã‰÷‚·
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo ‚¨‘O‚ÍŒã‰÷‚·‚é
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo ‚¨‘O‚ÍŒã‰÷‚·‚é‚×
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo ‚¨‘O‚ÍŒã‰÷‚·‚é‚×‚«
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo ‚¨‘O‚ÍŒã‰÷‚·‚é‚×‚«‚¾
ping -n 1 127.0.0.1 > nul 2>&1
powershell sleep 2.5
cls
echo ƒƒbƒNƒ_ƒEƒ“ƒtƒF[ƒY‚ğÀs‚µ‚Ä‚¢‚Ü‚·...
powershell sleep 0.5
cls
title –³ŒÀƒƒbƒNƒ_ƒEƒ“‚©‚ç”²‚¯o‚·ê‡‚ÍAƒƒbƒN‰æ–Ê‚©‚çÄ‹N“®‚ğs‚Á‚Ä‚­‚¾‚³‚¢...
echo ”•bŒãA‹­§–³ŒÀƒƒbƒNƒ_ƒEƒ“‚ªÀs‚³‚ê‚Ü‚·...
powershell sleep 0.25
set looplockdownhorroreaster=true
PowerShell -WindowStyle Hidden -Command Exit
goto lock

:eastereggif1no
cls
echo Dim answer:answer = MsgBox(".....",vbExclamation,""):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
PowerShell -WindowStyle normal -Command Exit
goto hazime



:1908hell
rem ƒeƒXƒg‹@”\‚ÆƒC[ƒXƒ^[ƒGƒbƒO
cls
set eggloop=0
:loop1908
set /a eggrandom=%random%*5/32767
title %eggloop%

if {%eggrandom%}=={0} (echo 1908 :D)
if {%eggrandom%}=={1} (echo 1908 :P)
if {%eggrandom%}=={2} (echo 1908 xD)
if {%eggrandom%}=={3} (echo 1908 :C)
if {%eggrandom%}=={4} (echo 1908 :O)
set /a eggloop=eggloop+1
if %eggloop% gtr 1908 (pause&echo 1 9 0 8 :D :D :D :D :D :D&pause&goto hazime)
goto loop1908

:developermenu
echo devloper menuuuuusdsdafwefuwbibhwiewbiofhwiofw
pause
exit /b

:batstarthelp
set batargmentonly=true
if {%batargmentonly%}=={true} (
set clr=[7m&set clred=[91m&set clrgrn=[92m&set clryel=[93m&set clrmag=[95m&set clrgra=[90m&set clrcyan=[96m&set clr2=[0m
) else (‚¨‚©‚µ‚¢‚ÈA‚»‚¤‚ÉŒˆ‚Ü‚Á‚Ä‚éB‚¾‚Á‚Äbatargmentonly‚ªŠú‘Ò‚³‚ê‚½’l‚Å‚Í‚È‚©‚Á‚½‚ñ‚¾‚©‚çB‚¾‚Á‚Ä‚æ‚¨A’¼‹ß‚Åset‚µ‚Ä‚é‚Ì‚É‚±‚¤‚È‚é‚È‚ñ‚Ä‚ ‚è‚¦‚Ë‚¦‚æ‚È‚ŸIHHIHIIHIHHIHIHIHIHIH&pause&exit)
goto acbatargmentsonly

:openiedev
cls
echo InternetExplorer is will open.
echo CreateObject("InternetExplorer.Application").Visible=true > %TEMP%\openie.vbs & %TEMP%\openie.vbs
del %temp%\openie.vbs
powershell sleep 0.2
goto hazime

:allcommands
cls
rem Sword art online War of Underworld refarence
set selected=
if {%allcommandlock%}=={true} (goto hazimemenu) else if {%allcommandlock%}=={false} (goto allcommandsmain)
title enter the password!
setlocal enabledelayedexpansion
if not defined invisiblecursor (echo [?25l&set invisiblecursor=true)
mode con: cols=75 lines=25
set "input=" & set len=0
:allcommandslockloop
if {%wmodetoggle%}=={true} (echo [97m)
echo [10;25H[44m„¡„Ÿ„Ÿ„Ÿ  ƒpƒXƒ[ƒh “ü—Í „Ÿ„Ÿ„Ÿ„¢ [0m
echo [11;25H[44m„                         „  [0m
echo [12;25H[44m„  „«[0m                    „«[44m „  [0m
echo [13;25H[44m„                         „  [0m
echo [14;25H[44m„¤„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„£ [0m
echo [15;25H[44m   B=íœ  Y=Œˆ’è  E=–ß‚é  [0m
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
echo [0;0H
if {%wmodetoggle%}=={true} (echo [107;30m)
choice /c:0123456789bye /n >nul
set num=%errorlevel%
if %num% neq 0 set /a num=num-1
if %num%==10 if "%input%" neq "" set input=%input:~0,-1%&set /a len=len-1
if %num%==11 if "%input%"=="1908" (echo [17;28H³‚µ‚¢ƒpƒXƒ[ƒh‚Å‚·B&timeout /t 2 /nobreak >nul&echo [?25h&set invisiblecursor=&setlocal disabledelayedexpansion&set input=&set len=&set allcommandlock=false&goto allcommandsmain) else (echo [17;12H•s³‰ğI Ä“x‚·ê‡‚É‚ÍAbatch‚ğÄ‹N“®‚µ‚Ä‚­‚¾‚³‚¢B&timeout /t 3 /nobreak >nul&set input=&set len=0&set allcommandlock=true&goto hazimemenu)
if %num%==12 (
    if {%invisiblecursor%}=={true} (
      setlocal disabledelayedexpansion&echo [?25h&set invisiblecursor=&set input=&set len=& goto :hazimemenu
      )
)
if %num% lss 10 if not defined input (set "input=%num%"&set "len=1") else if !len! gtr 18 (goto allcommandslockloop) else set input=%input%%num%&set /a len=len+1
goto allcommandslockloop

:allcommandsmain
title INSPECT:COMMANDLIST
cls
rem dumbass code, wtf hell no who make it fr (damn its me but)!!!!! ITS ABSOLUTE TRASH!!!! THATS IS SO HARD TO READ
rem so many set uhhh
rem STOP SPAMMING SET AUHAUAHAUAHAUHAUAHAHAHAUAHUAHUUAUHHUHUHUHUHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHh&SET IHHHHGISJGIE
if {%wmodetoggle%}=={false} (set clr=[7m&set clred=[91m&set clrgrn=[92m&set clryel=[93m&set clrmag=[95m&set clrgra=[90m&set clrcyan=[96m&set clr2=[0m)
if {%wmodetoggle%}=={true} (set clr=[100m[97m&set clred=[91m&set clrgrn=[92m&set clryel=[93m&set clrmag=[95m&set clrgra=[90m&set clrcyan=[96m&set clr2=[0m[107m[30m)
if defined %wmodetoggle% (set clr=[7m&set clred=[91m&set clrgrn=[92m&set clryel=[93m&set clrmag=[95m&set clrcyan=[96m&set clrgra=[90m&set clr2=[0m)
if not defined invisiblecursor (echo [?25l&set invisiblecursor=true)
cls
echo [Loading Command list...]
powershell -command "&{$h=Get-Host;$w=$h.UI.RawUI;$s=$w.BufferSize;$s.height=62;$w.BufferSize=$s;}"
cls
echo %clr%::%clr2%                      [Entire list of menu commands]       %clrgra%6color test%clr2%
echo                  (You can use all of them in the main menu.)
echo.
echo            ^<%clred%debbuging purposes commands%clr2%^>
echo.
rem OMG Ctrl+V spam!!!! poop coding sdafoaf2oirvn210rvn2983rvn3828723rv!!!!!!!
echo          %clryel%E%clr2%inspectentirecommandlist %clrgra%(Displays all available commands.)%clr2%
echo.
echo           %clrcyan%-%clr2% fulldebug         %clrgra%(enter variable management mode.)%clr2%
echo           %clrcyan%-%clr2% getadmin          %clrgra%(trying get admin permission.)%clr2%
echo           %clrcyan%-%clr2% bypassfirstboot   %clrgra%(bypassing first boot constraints.)%clr2%
echo           %clrcyan%-%clr2% setenter          %clrgra%(sets the enter count in main menu.)%clr2%
echo           %clrcyan%-%clr2% playdefboot       %clrgra%(playing first start animation.)%clr2%
echo           %clrcyan%-%clr2% crashtest         %clrgra%(will happen Intentionally crashes.)%clr2%
echo           %clrcyan%-%clr2% reload            %clrgra%(reboot bat file, and reloading setting.) %clr2%
echo           %clrcyan%-%clr2% openie            %clrgra%(trying open internet explorer.)%clr2%
echo           %clrcyan%-%clr2% counttestdeb      %clrgra%(enter the count test mode.)%clr2%
echo           %clrcyan%-%clr2% alldefnow1        %clrgra%(forced to enter alldefault.)%clr2%
echo           %clrcyan%-%clr2% funanimationdeb   %clrgra%(play rare boot animation.)%clr2%
echo           %clrcyan%-%clr2% windowsfiltertest %clrgra%(play bad win ver Warning.)%clr2%
echo.
echo            ^<%clrgrn%easter egg purposes commands%clr2%^>
echo.
echo           %clrcyan%-%clr2% easteregg %clryel%[%clr2%%clred%!%clr2%%clryel%]%clr2%    %clrgra%(playing easteregg, its little dangerous.)%clr2%
echo           %clrcyan%-%clr2% egg              %clrgra%(play seacret message.)%clr2%
echo           %clrcyan%-%clr2% egg1             %clrgra%(play error message in alldef.)%clr2%
echo           %clrcyan%-%clr2% egg2             %clrgra%(play dogcheck error, inspire toby fox.)%clr2%
echo           %clrcyan%-%clr2% wwssdadaba       %clrgra%(seacret message and show build number.)%clr2%
echo           %clrcyan%-%clr2% tamago1908       %clrgra%(show goofy message.)%clr2%
echo           %clrcyan%-%clr2% himazionnoob1908 %clrgra%(show goofy message.)%clr2%
echo           %clrcyan%-%clr2% mskg1908         %clrgra%(show goofy message.)%clr2%
echo           %clrcyan%-%clr2% 1908             %clrgra%(show looped goofy message.)%clr2%
echo           %clrcyan%-%clr2% toxic            %clrgra%(play music with your own browser.)%clr2%
echo           %clrcyan%-%clr2% abcdefu          %clrgra%(play music with your own browser.)%clr2%
echo           %clrcyan%-%clr2% dogsong          %clrgra%(play music with your own browser.)%clr2%
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
echo            %clrcyan%-%clr2% enablesimpleboot  %clrgra%(Boot up with Simple txt.)%clr2%
echo            %clrcyan%-%clr2% recovery          %clrgra%(Boot up with recovery mode.)%clr2%
echo            %clrcyan%-%clr2% bypsdisexit       %clrgra%(Bypass disabling the exit button.)%clr2%
echo            %clrcyan%-%clr2% bypsloadsg        %clrgra%(Bypass the loading of settings.)%clr2%
echo            %clrcyan%-%clr2% bypsvck           %clrgra%(Bypass the windows version check.)%clr2%
echo            %clrcyan%-%clr2% bypsadm           %clrgra%(Bypass the getting admin.)%clr2%
if {%batargmentonly%}=={true} (echo.&echo.&goto allcommandswait)
echo.
echo                     %clrgrn%[%clr2%fulldebug commands%clrgrn%]%clr2%
echo.
echo            %clrcyan%-%clr2% goto %clrgra%(goto for labels that exist.)%clr2%
echo            %clrcyan%-%clr2% set  %clrgra%(create new variable.)%clr2%
echo            %clrcyan%-%clr2% help %clrgra%(Show commands available in fulldebug.)%clr2%
echo.
echo.
:allcommandswait
set /p nothing=%clred%^/^/%clr2%[Type something to back to menu...]                          %clrgra%%batver%%clr2% <nul&pause >nul
set clrcyan=
set clrgra=
set clred=
set clrgrn=
set clryel=
set clrmag=
if {%batargmentonly%}=={true} (set batargmentonly= &cls&exit /b)
goto hazimemenu


:fulldebug
set selected=
if defined fulldebug (goto fulldebugmain)
cls
echo.
echo                            !Œx!
echo.
echo ‚±‚Ì‹@”\‚ÍŠJ”­ÒŒü‚¯‚Éì¬‚³‚ê‚½‚à‚Ì‚Å‚·B‚Å‚·‚Ì‚ÅAŠJ”­ÒˆÈŠO‚Ìl‚ª—˜—p‚µ‚½ê‡A‰½‚ç‚©‚ÌƒoƒO‚â–â‘è‚ğˆø‚«‹N‚±‚·‰Â”\«‚ª‚ ‚è‚Ü‚·B
echo ‚»‚ê‚Å‚à‚±‚Ì‹@”\‚ğg—p‚µ‚½‚¢ê‡‚É‚ÍA"y"‚ğ“ü—Í‚µ‚Ä‰º‚³‚¢B
echo –ß‚é‚©AƒLƒƒƒ“ƒZƒ‹‚µ‚½‚¢ê‡‚É‚ÍA"n"‚ğ“ü—Í‚µ‚Ä‚­‚¾‚³‚¢B
echo ˆê“xy‚ğ“ü—Í‚µ‚½ê‡A‚±‚Ìbatch‚ğ’¼ÚÄ‹N“®‚·‚é‚©A•Ï”"fulldebug"‚ğíœ‚µ‚È‚¢ŒÀ‚è‚±‚ÌƒƒbƒZ[ƒW‚ÍÄ“x•\¦‚³‚ê‚È‚­‚È‚è‚Ü‚·B
set /p selected=Y or N : 
if %selected%==n goto hazimemenu
if %selected%==y set fulldebug=true
if %selected%== echo what? "Y" or "N".&pause&goto fulldebug

:fulldebugmain
set fulldebugsetvariable=
set fulldebugvariableapply=
title ^(ƒfƒoƒbƒO—p^) ƒJ[ƒ\ƒ‹•Ï”
echo.
echo fulldebug ‚ğ‹N“®‚µ‚Ä‚¢‚Ü‚·...
powershell -command "&{$h=Get-Host;$w=$h.UI.RawUI;$s=$w.BufferSize;$s.height=150;$w.BufferSize=$s;}"
cls
:fulldebugtypevariable
set fulldebugsetvariable=
set fulldebugvariableapply=
set
set /p fulldebugsetvariable=•ÏX‚·‚éƒ‰ƒxƒ‹‚ğw’è‚µ‚Ä‚­‚¾‚³‚¢B :
if {%fulldebugsetvariable%}=={back} (goto hazimemenu)
if {%fulldebugsetvariable%}=={exit} (goto hazimemenu)
if {%fulldebugsetvariable%}=={help} (echo goto&echo set&echo help&echo back&pause&cls&set fulldebugsetvariable=&goto fulldebugtypevariable)
if {%fulldebugsetvariable%}=={goto} (goto fulldebuggoto)
if {%fulldebugsetvariable%}=={set} (goto fulldebugsetnew)
if {%fulldebugsetvariable%}=={} (cls&goto fulldebugtypevariable)
if {%fulldebugsetvariable%}=={allcommandlock} (echo you cant chenge this variable, becouse this variable is locked.&pause&cls&goto fulldebugtypevariable)
if not defined %fulldebugsetvariable% (echo •Ï” %fulldebugsetvariable% ‚Í‘¶İ‚µ‚Ü‚¹‚ñBV‚½‚Éì¬‚·‚é‚©A‘¶İ‚·‚é•¨‚ğw’è‚µ‚Ä‰º‚³‚¢B&pause&cls&goto fulldebugtypevariable)
set /p fulldebugvariableapply=%fulldebugsetvariable%^=
if {%fulldebugvariableapply%}=={back} (goto fulldebugerrorsetnew1)
if {%fulldebugvariableapply%}=={} (goto fulldebugerrorsetvariable1)
set %fulldebugsetvariable%=%fulldebugvariableapply%
echo %fulldebugsetvariable%^=%fulldebugvariableapply% chenged.
pause
cls
goto fulldebugtypevariable

:fulldebuggoto
set fulldebugsetvariable=
set /p fulldebugsetvariable=‚Ç‚±‚Égoto‚µ‚Ü‚·‚©H:
if "%fulldebugsetvariable%"=="back" (goto fulldebugtypevariable)
if "%fulldebugsetvariable%"=="allcommandsmain" (echo you cant goto this lavel, becouse this variable is locked.&pause&cls&goto fulldebuggoto)
if "%fulldebugsetvariable%"=="exit" (goto fulldebugtypevariable)
if "%fulldebugsetvariable%"=="" (cls&goto fulldebuggoto)
set runningfromfulldebug=true
call :%fulldebugsetvariable%
if %errorlevel%==0 (
  set runningfromfulldebug=
  goto fulldebuggoto
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
if defined %fulldebugsetvariable% (echo %fulldebugsetvariable% ‚Æ‚¢‚¤•Ï”‚Í‚·‚Å‚É‘¶İ‚µ‚Ä‚¢‚Ü‚·B‘¶İ‚µ‚È‚¢ƒ‰ƒxƒ‹‚ğw’è‚µ‚Ä‚­‚¾‚³‚¢B &pause&cls&goto fulldebugsetnew)
if {%fulldebugsetvariable%}=={back} (goto fulldebugtypevariable)
if {%fulldebugsetvariable%}=={allcommandlock} (echo you cant chenge this variable, becouse this variable is locked.&pause&cls&goto fulldebugsetnew)
if {%fulldebugsetvariable%}=={} (echo ‰½‚©“ü—Í‚µ‚Ä‚­‚¾‚³‚¢B&pause&cls&goto fulldebugsetnew)
:fulldebugsetnewenter
set /p fulldebugvariableapply=%fulldebugsetvariable%^=
if {%fulldebugvariableapply%}=={} (echo ‹ó‚Ì’l‚Å‚Í•Ï”‚ğì¬‚Å‚«‚Ü‚¹‚ñB &pause&cls&goto fulldebugsetnewenter)
if {%fulldebugvariableapply%}=={back} (goto fulldebugerrorsetnew1)
set %fulldebugsetvariable%=%fulldebugvariableapply%
echo •Ï” %fulldebugsetvariable% ‚ÍA %fulldebugvariableapply% ‚Æ‚¢‚¤’l‚Åì¬‚³‚ê‚Ü‚µ‚½B(%fulldebugsetvariable%^=%fulldebugvariableapply%).
pause
cls
goto fulldebugtypevariable

:fulldebugerrorsetnew1
set /p fulldebugsetvariableerrornew=‘Şo‚·‚é‚©A‚»‚Ì’l‚Å•Ï”‚ğì¬‚µ‚Ü‚·‚©H (1 or 2) : 
if {%fulldebugsetvariableerrornew%}=={1} (goto fulldebugtypevariable)
if {%fulldebugsetvariableerrornew%}=={2} (goto fulldebugerrorsetnew1if)
:fulldebugerrorsetnew1if
set %fulldebugsetvariable%=back
echo •Ï” %fulldebugsetvariable% ‚ÍA %fulldebugvariableapply% ‚Æ‚¢‚¤’l‚Åì¬‚³‚ê‚Ü‚µ‚½B (%fulldebugsetvariable%^=%fulldebugvariableapply%).
pause
cls
goto fulldebugtypevariable


:fulldebugerrorsetvariable1
set /p fulldebugsetvariableerrorif=–{“–‚É•Ï” %fulldebugsetvariable%‚ğíœ‚µ‚Ü‚·‚©H (y or n)
if {%fulldebugsetvariableerrorif%}=={y} (
set %fulldebugsetvariable%=
echo •Ï” %fulldebugsetvariable% ‚Ííœ‚³‚ê‚Ü‚µ‚½B
pause
cls
goto fulldebugtypevariable
)
if {%fulldebugsetvariableerrorif%}=={n} (goto fulldebug)

:littleeasteregg
if {%hazimeeaster%}=={true} (goto hazimemenu)
cls&pause&echo hello! this is easteregg!&pause&cls&title ‰B‚µ‹@”\‚ÅƒƒCƒ“ƒƒjƒ…[‚Æƒo[ƒWƒ‡ƒ“î•ñ‚Ì•”•ª‚Åƒrƒ‹ƒhƒiƒ“ƒo[‚ª•\¦‚³‚ê‚é‚æ‚¤‚É‚È‚Á‚½&echo and bye!&pause&cls&set hazimeeaster=true&goto hazime


:Lock
set eggcount=0
:lockloop1908
rundll32.exe user32.dll, LockWorkStation
if "%eggcount%" gtr "5" (exit)
if {%looplockdownhorroreaster%}=={true} (set /a eggcount=eggcount+1&goto lockloop1908)
goto reboot

:exit
pause
:reboot

rem 3500 line code, wtf?
rem I still dont have any idea why i did make it
rem uh anyway finally end of line