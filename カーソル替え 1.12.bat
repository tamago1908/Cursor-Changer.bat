@echo off
setlocal

rem ƒJ[ƒ\ƒ‹‘Ö‚¦ by tamago_1908
rem Cursor Changer by tamago_1908


rem https://github.com/tamago1908/cursor-changer.bat 


rem ƒTƒCƒY‚Ìw’è
mode con: cols=75 lines=25

rem ƒƒ‚ cd %~dp0 &start %~n0%~x0&exit —LŒøŠˆ—p‚Å‚«‚é‚©‚à (batÄ‹N“®)
rem ƒR[ƒh‚ÌÅ‰‚É“ü‚ê‚ê‚éˆ—‚Ì”‚ÍŒÀ‚ç‚ê‚Ä‚¢‚Ü‚·(“ü‚ê‚·‚¬‚é‚Æ‹N“®‚ª’x‚­‚È‚é‰Â”\«) (’x‚­‚È‚Á‚½ (è’x‚ê(‰½‚Æ‚©‚È‚Á‚½)) )
rem ƒrƒ‹ƒhƒiƒ“ƒo[‚Æƒo[ƒWƒ‡ƒ“‚Ì‹L“ü‚Í•K‚¸‚µ‚Ä‚­‚¾‚³‚¢I‚ ‚ÆƒA[ƒJƒCƒu‚É“ü‚ê‚é‚Ì‚ğ–Y‚ê‚¸‚ÉI
rem ‚»‚µ‚ÄÅ‹ßA‚±‚Ìƒoƒbƒ`ˆ—‚É‰pŒê‚ğ‘½‚­ŠÜ‚ß‚é‚æ‚¤‚É‚µ‚Ä‚¢‚éB‚È‚º‚È‚çA«—ˆ“I‚É‚±‚Ìƒoƒbƒ`ˆ—‚ğ–|–ó‚·‚é‚±‚Æ‚É‚È‚Á‚½A“ú–{Œê‚ª‘½‚¢‚Æ–Ê“|‚¾‚©‚çB
title ƒJ[ƒ\ƒ‹•Ï‚¦
rem VER v1.12
set batver=1.12
set batbuild=build 44
set hazimeeaster=false
set firststartbat=no
rem §ì‚É‚ ‚½‚Á‚Äg—p‚µ‚½ƒ\ƒtƒg windows notepad v10.2103.12.0 g—pƒtƒHƒ“ƒg@Nirmala UI‚Ì‘¾š
rem 2021”N12Œ09“ú‚©‚ç windows notepad v10.2110.64.0 Nirmala UI‚Ì‘¾š
rem ƒƒCƒ“ Visual Studio Code
rem ƒfƒoƒbƒN—p Visual bat

:argmentcheck
rem ˆø”‚ª‚È‚¯‚ê‚ÎI—¹
if "%~1"=="" goto argmentcheckend
title Cursor Changer argment checking...
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
  set argmentserror=true
  rem Œ»İ‚Ì—v‘f‚ğæ“¾
  set current=!arg[%%i]!
  rem Œ»İ‚Ì—v‘f‚ª‹ó‚Å‚È‚¯‚ê‚Îˆ—
  if not "!current!"=="" (
    rem Œ»İ‚Ì—v‘f‚Æˆê’v‚·‚é—v‘f‚ğ‹ó‚É‚·‚éid•¡”rœj
    for /l %%j in (%%i,1,%n%) do (
      if "!arg[%%j]!"=="!current!" set arg[%%j]=
    )
    rem Œ»İ‚Ì—v‘f‚É‰‚¶‚½ˆ—‚ğs‚¤
    if "!current!"=="bypsdisexit" (echo disableexitbutton is bypassed.&set disableexit=false&set argmentserror=false)
    if "!current!"=="enablesimpleboot" (title simpleboot is enabled.&set simpleboot=true&set argmentserror=false)
    if "!current!"=="devmode" (call :developermenu&set argmentserror=false)
    if "!current!"=="help" (call :batstarthelp&set argmentserror=false)
    if "!current!"=="bypsvck" (echo winver check is bypassed.&set bypasswinvercheck=true&set argmentserror=false)
    if "!current!"=="bypsadm" (echo getadmin is bypassed.&set adminbypass=true&set adminbypass=false&set argmentserror=false)
    if "!current!"=="bypsloadsg" (echo setting load is bypassed.&set settingbypass=true&set argmentserror=false)
rem —áŠOˆ—
   if "!argmentserror!"=="true" (title Cursor Changer argment error&echo unvalid argment or something went worng ^(!current!^) error. please set valid argment. ^(or use ^"help^" ^)
      )
    )
  )
)
:argmentcheckend
setlocal disabledelayedexpansion
set argmentserror=
timeout 3 >nul

rem windowsƒo[ƒWƒ‡ƒ“”»’f
rem ‚¿‚å‚Á‚Æ•s‹ï‡‚ ‚é‚©‚àBˆê•”‚Ìƒo[ƒWƒ‡ƒ“‚Å‚Í³í‚ÉƒtƒBƒ‹ƒ^[‚ª“®ì‚µ‚È‚¢‰Â”\«‚ª‚ ‚éB
:batbootcheckwinver
if {%settingbypass%}=={true} (goto batbootcheckwinversafe)
rem windows11 check
ver | find /i "Version 10.0.2" > nul
if {%errorlevel%}=={0} (goto batbootcheckwinversafe)
rem windows10 1511 or higher check
ver | find /i "Version 10.0.10" > nul
if {%errorlevel%}=={0} (goto batbootcheckwinversafe)
rem windows10 1509 check
ver | find /i "Version 10.0.102" > nul
if {%errorlevel%}=={0} (set windowsverfilter=windows10 1509&goto batbootcheckwinverbad)
rem windows 8 or low check
ver | find /i "Version 6." > nul
if {%errorlevel%}=={0} (set windowsverfilter=windows8.1ˆÈ‘O&goto batbootcheckwinverbad) else set windowsverfilter=windows vistaˆÈ‘OiŒÃ‚·‚¬‚Ü‚·Ij goto batbootcheckwinverbad

:batbootcheckwinverbad
ver | find /i "Version 6.1" > nul
if {%errorlevel%}=={0} (set windowsverfilter=windows7)
ver | find /i "Version 6.2" > nul
if {%errorlevel%}=={0} (set windowsverfilter=windows8)
ver | find /i "Version 6.3" > nul
if {%errorlevel%}=={0} (set windowsverfilter=windows8.1)
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
rem –{ˆ— (•Ï”‚ÌƒZƒbƒg‚Æ‚©A‘O’iŠK)
set bootbatnow=yes
set exitbuttondisabled=false
rem ŠÇ—ÒŒ ŒÀ‚ğ•Û—L‚µ‚Ä‚¢‚é‚©‚ÌŠm”F
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
rem ŠÇ—ÒŒ ŒÀ‚ğ•Û—L‚µ‚Ä‚¢‚éó‘Ô‚ÅAexitƒ{ƒ^ƒ“‚ğ–³Œø‚É‚·‚é‚ÆA‹H‚ÉƒEƒCƒ‹ƒX‚Æ‚µ‚ÄŒŸo‚³‚ê‚Ä‚µ‚Ü‚¤ê‡‚ª‚ ‚éB‚È‚Ì‚ÅAŠÇ—ÒŒ ŒÀ•Û—L‚ÆAdisableexit‚Æ‚¢‚¤•Ï”‚ªfalse‚Ìê‡‚ÍAˆ—‚ğƒoƒCƒpƒX‚µ‚Ä‚¢‚éB
if {%disableexit%}=={false} (goto batbootdisabledexitbutton)

:batbootdisableexitbutton
rem startid~powershell ‚Ü‚Å‚ÌƒR[ƒh‚Í‚¸‚ç‚µ‚Ä‚Í‚¢‚¯‚È‚¢@‚»‚êˆÈ‘O‚©‚»‚êˆÈŒã‚È‚çok
:: StartID1908
call :getLineNumber startLine StartID1908 0
goto batbootdisableexitbuttonendcode
:batbootdisableexitbuttoncodestart
set /a startline=startline+4&set /a endline=endline-3
title ƒJ[ƒ\ƒ‹‘Ö‚¦‚ğ‹N“®’†...&echo ‚µ‚Î‚ç‚­‚¨‘Ò‚¿‚­‚¾‚³‚¢...&powershell -NoProfile -ExecutionPolicy Unrestricted "$s=[System.Management.Automation.ScriptBlock]::create((Get-Content \"%~f0\" -TotalCount $env:endline|Where-Object{$_.readcount -gt $env:startline }) -join \"`n\");&$s" %*&goto batbootdisabledexitbutton
#I—¹ƒ{ƒ^ƒ“‚ğ–³Œø‰»
#Calling user32.dll methods for Windows and Menus
$code = @'
using System;
using System.Runtime.InteropServices;

namespace CloseButtonToggle {

// ŠÖ”‚ÌéŒ¾

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

// éŒ¾I—¹

// •K—v‚Èˆø”‚Ìİ’è
   const int GWL_STYLE = -16;
   const int WS_MAXIMIZEBOX = 0x00010000;

   const uint SC_MAXIMIZE = 0xF030; 
   const uint MF_BYCOMMAND = 0;

// ƒƒCƒ“‚Ìˆ—
internal static void ChangeCurrentState(bool state) {
     IntPtr hWnd = GetConsoleWindow();
     int style = GetWindowLong(hWnd, GWL_STYLE);
     if (state) {
       style |= WS_MAXIMIZEBOX; // Å‘å‰»ƒ{ƒ^ƒ“‚ğ—LŒø‚É‚·‚é
     } else {
       style &= ~WS_MAXIMIZEBOX; // Å‘å‰»ƒ{ƒ^ƒ“‚ğ–³Œø‚É‚·‚é
     }
     SetWindowLong(hWnd, GWL_STYLE, style);
     DrawMenuBar(hWnd);
   }
 }
// •ÏX‚ÌŠm”F
 public static class Status {
   public static void Disable() {
     WinAPI.ChangeCurrentState(false); //ƒIƒ“‚É‚·‚é‚È‚ç 'true' ‚É•ÏX
   }
 }
} 
'@

Add-Type $code
[CloseButtonToggle.Status]::Disable()
:batbootdisableexitbuttonendcode
:: EndID1908
call :getLineNumber endLine EndID1908 0
if {%exitbuttondisabled%}=={false} (set exitbuttondisabled=true&goto batbootdisableexitbuttoncodestart) else (goto :batbootdisabledexitbutton)

:GetLineNumber <resultVar> <uniqueID> [LineOffset]
:: Detects the line number of the caller, the uniqueID have to be unique in the batch file
:: The lineno is return in the variable <resultVar> add with the [LineOffset]
SETLOCAL
for /F "usebackq tokens=1 delims=:" %%L IN (`findstr /N "%~2" "%~f0"`) DO set /a lineNr=%~3 + %%L
(
ENDLOCAL
 set "%~1=%LineNr%"
 goto :eof
)

rem –{ˆ—
:batbootdisabledexitbutton
set startline=&set endline=&set exitbuttondisabled=
cd /d %HOMEDRIVE%%HOMEPATH%
find "fastboot=true" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
cls
if {%errorlevel%}=={0} (goto batstart) else (goto nofastboot)
:nofastboot

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


rem ¡Œã‚Ì—\’è (roadmap)

rem ƒR[ƒh‚Ì‡”Ô‚ğ•ÏX‚µA“Ç‚İ‚â‚·‚­‚·‚é
rem ‰½‚à‚µ‚È‚¢‚ğI—¹‚Ü‚½‚Í‰½‚©‚µ‚ç‚É•ÏX
rem İ’è‚ÌUI‚ğ‘å•‚É•Ï‚¦‚ÄAƒJƒeƒSƒŠ[‚É•ª‚¯‚éB‚»‚ÌƒJƒeƒSƒŠ[‚Ì’†‚Éİ’è‚ğ“ü‚ê‚é
rem ƒZ[ƒuŠÖŒW‚Ìƒtƒ@ƒCƒ‹‚ğ•Û‘¶‚·‚éƒfƒBƒŒƒNƒgƒŠ‚ğİ’è‚Å•ÏX‚Å‚«‚é‚æ‚¤‚É‚·‚éB
rem ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt‚ÉŠÜ‚Ü‚ê‚Ä‚¢‚éİ’è‚ª‘S•”Œ‡‘¹‚µ‚Ä‚¢‚éê‡‚ÍAƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt‚ğì¬‚µ‚È‚¨‚·‹@”\B
rem İ’è‚Ì‰Šú‰»iƒAƒ“ƒCƒ“ƒXƒg[ƒ‹ƒƒjƒ…[‚ğ‰Šú‰»‚Æ‚©‚Ì€–Ú‚É‚·‚éj
rem 1.12À‘•—\’è 23”N6Œ’†

rem ver 1.13 23”NH–¢’è
rem ‰‰ñ‹N“®‚Ì‰Šúİ’è‚Ì’Ç‰Á (İ’è‚ğƒ†[ƒU[”CˆÓ‚ÅƒZƒbƒgAƒe[ƒ}‚È‚Ç‚à)
rem –¢g—pƒR[ƒh‚Ü‚½‚Í–³‘Ê‚È‚à‚Ì‚ğíœ‚µ‚ÄA‚æ‚è‰Â“Ç«‚ğã‚°‚éB
rem Œ»İ‚ğ”»•Ê‚µ‚Ä‚ ‚¢‚³‚Â‚ğ‚·‚éB“ú•t‚É‚æ‚Á‚Ä‚àˆ¥A‚ğŒˆ‚ß‚éB
rem ‘S‘Ì“I‚ÈƒR[ƒh‚Ì®”õ
rem ‘½Œ¾Œê‘Î‰ 
rem ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹ƒƒjƒ…[‚ğŠ®¬‚³‚¹‚é”ŠJ”­’†
rem ƒtƒ@ƒCƒ‹‚¾‚Á‚½‚èAREADME‚Æ‚©‚à”–¢’è‚¾‚¯‚ÇŒ`‚Æ‚µ‚Ä‚Í\‘z‚Í‚Ë‚Á‚Ä‚ ‚é

rem ver 1.14 
rem ‚æ‚è”hè‚ÈƒAƒjƒ[ƒVƒ‡ƒ“‚Æsetx‚ğ—p‚¢‚½‹N“®‰ñ”‚ÌƒJƒEƒ“ƒg‚Æ‚»‚ê‚Ì’‰‰æ–Ê

rem ver 1.15 
rem F‚Å‚í‚©‚è‚â‚·‚¢Iƒ`ƒ…[ƒgƒŠƒAƒ‹‚Æ‚æ‚èi‰»‚µ‚½dogcheck (samƒ`ƒFƒbƒN‚Ì‚æ‚¤‚È‹@”\‚ğÀ‘•)

rem ver 1.16 
rem ‚æ‚è—Ç‚¢‰‰ñ‹N“®‚ÌƒƒbƒZ[ƒW‚Æ”hè‚ÈUIA•ÏX‚Å‚«‚éƒJ[ƒ\ƒ‹‚Ìí—Ş‚ğ‘‰Á

rem ver 1.17 
rem ‚æ‚è‘½‚­‚Ìİ’è‚Æ‚æ‚è—Ç‚¢ˆÀ’è‚µ‚½ƒvƒƒOƒ‰ƒ€

rem ver 1.18 
rem ’P‘Ì‚Å‚ÌƒAƒbƒvƒf[ƒgŠm”F‹@”\‚Æ‚æ‚èˆÀ‘S«‚ğ‚‚ß‚éAƒJƒXƒ^ƒ€ƒJ[ƒ\ƒ‹‹@”\

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
:fastboot

rem Å‰‚Ì‹N“®‚È‚Ì‚©‚ğŒŸ’m
:syokaicolorlogo
cd /d %HOMEDRIVE%%HOMEPATH%
if exist ‰‰ñƒJ[ƒ\ƒ‹.txt set firststartbat=no&set bootbatnow=yes&goto :batstart
if exist ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt title &echo ƒeƒƒFIII‚¨‘O‚Í‚à‚¤‚¨‚µ‚Ü‚¢‚¾ƒAƒAƒbII&pause&cls&echo ‚¢‚½‚¸‚ç‚É‰‰ñƒJ[ƒ\ƒ‹‚¾‚¯‚ğÁ‚µ‚½‚ÈIHIHIH&pause&cls&echo ‚È‚ñ‚ÅƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt‚ª‚ ‚ñ‚Ì‚É‰‰ñƒJ[ƒ\ƒ‹.txt‚Í‘¶İ‚µ‚Ë‚¦‚ñ‚¾‚æII‚¨‚©‚µ‚¢‚¾‚ëIHH&pause&cls&echo ‚¨‘O‚ÍŒã‰÷‚·‚é‚×‚«‚¾‚ ƒbI%username%I&pause&cls&echo ‚È‚ñ‚Ä‚Ì‚Íç’k‚Å‚·......‚ªA‰‰ñƒJ[ƒ\ƒ‹.txt‚ª‘¶İ‚µ‚È‚¢‚Ì‚ÍŠm‚©‚Å‚·B&pause&cls&echo ‚±‚ÌƒƒbƒZ[ƒW‚ğÄ“x•·‚«‚½‚­‚È‚¢ê‡‚ÍAİ’èƒtƒ@ƒCƒ‹‚àÁ‚·‚©A‰‰ñƒJ[ƒ\ƒ‹.txt‚ğ‚²©g‚Åì¬‚µ’¼‚µ‚Ä‚­‚¾‚³‚¢B&pause&cls&goto exit
if not exist ‰‰ñƒJ[ƒ\ƒ‹.txt set firststartbat=yes& goto :syokaiboot

rem ‰‰ñ‹N“®ŒÀ’è‚ÌƒAƒjƒ[ƒVƒ‡ƒ“‚ğÄ¶
:syokaiboot
title welcome to my bat file!
powershell sleep -m 500
cls
echo WELCOME TO
powershell sleep -m 200
cls

color 09
echo ƒJ
powershell sleep -m 100
cls

color 0a
echo @[
powershell sleep -m 100
cls

color 0b
echo @@ƒ\
powershell sleep -m 100
cls

color 0c
echo @@@ƒ‹
powershell sleep -m 100
cls

color 0d
echo @@@@‘Ö
powershell sleep -m 100
cls

color 0e
echo @@@@  ‚¦
powershell sleep -m 100
cls
color 07
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo ƒJ
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo ƒJ[
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo ƒJ[ƒ\ƒ‹
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo ƒJ[ƒ\ƒ‹‘Ö
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo ƒJ[ƒ\ƒ‹‘Ö‚¦
ping -n 1 127.0.0.1 > nul 2>&1
powershell sleep -m 500
cls
echo ƒJ[ƒ\ƒ‹‘Ö‚¦ by tamago_1908
powershell sleep -m 1000
cls
goto saisyonokidou


cls
rem ‰Šú‹N“®ˆ—

rem ŠÇ—ÒŒ ŒÀ‚Ìƒvƒƒ“ƒvƒg‚ÉŠÖ‚·‚éİ’è‚ğŒŸ’mA
:batstart
cls
rem ŠÇ—ÒŒ ŒÀİ’è‚ÌŒŸ’m
find "admin=true" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
if {%adminbypass%}=={true} (goto gotadmin)
if {%errorlevel%}=={0} (goto batstartadm)
if {%errorlevel%}=={1} (
set batloadprgs=0
call :batbootprogress
goto batstarttest2
)

:batstarttest2
cls
find "admin=false" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
set batloadprgs=0
call :batbootprogress
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
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    del "%p]temp%\getadmin.vbs"
    set sessionname=Console&exit /b
:gotAdmin
    set haveadmin=yes
    pushd "%CD%"
    CD /D "%~dp0"

rem ‰‰ñ‹N“®‚©‚ğŒŸ’m
cd /d %HOMEDRIVE%%HOMEPATH%
rem êŠ OS‚ª“ü‚Á‚½ƒhƒ‰ƒCƒu:\Users\ƒ†[ƒU[–¼
rem (—á ƒ†[ƒU[‚Ì–¼‘O‚ªtest‚¾‚Á‚½ê‡‚ÆAOS‚ª“ü‚Á‚½êŠ‚ªCƒhƒ‰ƒCƒu‚¾‚Á‚½ê‡‚¾‚Æ C:\Users\Test)
if exist ‰‰ñƒJ[ƒ\ƒ‹.txt goto hazime
if not exist ‰‰ñƒJ[ƒ\ƒ‹.txt goto saisyonokidou

rem ‰‰ñ‹N“®‚ÌƒƒbƒZ[ƒW
:saisyonokidou
title ‚±‚Ìƒoƒbƒ`ƒtƒ@ƒCƒ‹‚ÌĞ‰î
type nul > ‰‰ñƒJ[ƒ\ƒ‹.txt
echo nodogcheckforfastboot >> ‰‰ñƒJ[ƒ\ƒ‹.txt
cls
color 01
powershell sleep -m 100
color 08
echo ‚±‚ñ‚É‚¿‚ÍI
powershell sleep -m 100
color 07
powershell sleep -m 100
color 07
powershell sleep -m 500
cls
mode con: cols=148 lines=14
echo ‚æ‚¤‚±‚»I
powershell sleep -m 100
echo ¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡Q¡¡¡¡¡Q¡¡¡¡¡¡¡¡¡¡¡¡¡¡
echo ¡¡¡QQ¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡QQQQQQQQQQQ¡¡¡¡¡QQQ¡¡¡¡
echo ¡¡¡QQ¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡QQ¡¡¡¡¡¡Q¡¡¡¡¡Q¡¡Q¡¡¡¡¡¡¡¡¡Q¡¡¡¡¡Q¡¡¡¡¡¡¡¡¡¡Q¡¡¡
echo ¡¡¡QQQQQQ¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡Q¡¡¡¡¡QQ¡¡¡¡¡QQ¡Q¡¡¡¡¡¡¡QQQQQQQQQQQ¡¡¡¡¡¡¡¡¡¡¡¡
echo QQQQ¡¡¡¡Q¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡QQ¡¡¡¡Q¡¡¡¡¡¡Q¡¡Q¡¡¡¡¡¡¡¡¡QQ¡¡¡QQ¡¡¡¡¡¡QQQQQQ¡¡
echo ¡¡¡Q¡¡¡¡Q¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡Q¡¡¡¡¡¡Q¡¡Q¡¡¡¡¡¡¡QQ¡¡Q¡Q¡¡QQ¡¡¡¡¡¡¡QQ¡¡¡
echo ¡¡¡Q¡¡¡QQ¡¡¡QQQQQQQQQQQ¡¡¡¡¡¡¡¡¡Q¡¡¡¡¡¡¡Q¡¡Q¡¡¡¡Q¡¡¡QQQQQQQQQ¡¡¡¡¡¡¡¡Q¡¡¡¡
echo ¡¡¡Q¡¡¡QQ¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡QQ¡¡¡¡¡¡¡Q¡¡Q¡¡¡Q¡¡¡¡Q¡¡¡¡¡¡¡Q¡¡¡¡¡¡¡QQQ¡¡¡
echo ¡¡Q¡¡¡¡QQ¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡QQ¡¡¡¡¡¡¡QQ¡¡Q¡¡QQ¡¡¡¡QQQQQQQQQ¡¡¡¡¡¡Q¡¡Q¡¡¡
echo ¡QQ¡¡¡¡Q¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡QQ¡¡¡¡¡¡¡¡Q¡¡¡QQQ¡¡¡¡¡¡Q¡¡¡¡¡¡¡Q¡¡¡¡¡Q¡¡¡Q¡¡¡
echo QQ¡¡¡QQQ¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡QQ¡¡¡¡¡¡¡¡Q¡¡¡¡¡Q¡¡¡¡¡¡¡QQQQQQQQQ¡¡¡¡Q¡¡¡¡QQQQ
powershell sleep -m 100
color 0a
powershell sleep -m 100
color 0b
powershell sleep -m 100
color 0c
powershell sleep -m 100
color 0d
powershell sleep -m 100
color 07
powershell sleep -m 100
echo ‚ÖI
powershell sleep -m 350
cls
mode con: cols=75 lines=25
color 07
powershell sleep -m 300
echo ‰‚ß‚Ü‚µ‚ÄI
pause
cls
echo %~n0‚Å‚·I
pause
cls
echo ‚±‚Ìƒoƒbƒ`ˆ—‚ÍAƒJ[ƒ\ƒ‹‚ğ•F‚Æ”’F‚É•Ï‚¦‚é‚Ù‚©‚ÉA
pause
cls
echo ‚¿‚å‚Á‚Æ‚µ‚½‹@”\‚ª‹l‚ß‚Ü‚ê‚½•¨‚Å‚·I
pause
cls
echo ‘¼‚É‚àƒoƒbƒ`ˆ—‚Å‚Å‚«‚é‚±‚Æ‚ğ–Íõ‚·‚éˆ×‚É‚àg‚Á‚Ä‚¢‚Ü‚·B
pause 
cls
echo ‚Ü‚½A‚±‚ñ‚È‚É‚às”‚ª‚ ‚éƒoƒbƒ`ˆ—‚ğì‚Á‚½‚Ì‚Í‚±‚ê‚ª‰‚ß‚Ä‚È‚Ì‚ÅA‚à‚µ•Ï‚È‚Æ‚±‚ë‚ª‚ ‚Á‚½‚Æ‚µ‚Ä‚à‹–‚µ‚Ä‚­‚¾‚³‚¢B
pause 
cls
echo ‚»‚ê‚ÅA’ˆÓ“_‚Å‚·B
pause
cls
echo ‚±‚Ìƒoƒbƒ`ˆ—A %~n0‚ğÀs‚·‚éê‡‚Í•K‚¸powershell‚Ævbs‚ªÀs‰Â”\‚Å‚ ‚é‚±‚Æ‚ğŠm”F‚µ‚Ä‚­‚¾‚³‚¢B
pause 
cls
echo —˜—p‚Å‚«‚È‚¢ê‡A %~n0‚ğ³í‚ÉÀs‚Å‚«‚È‚­‚È‚è‚Ü‚·B
pause 
cls
echo ‘Î‰OS‚ÍWindows‚Ì‚İ‚ÅAÀs‚ª‚ ‚é’ö“x•ÛØ‚³‚ê‚Ä‚¢‚é‚Ì‚Íwindows 10 ƒo[ƒWƒ‡ƒ“1511ˆÈ~‚Å‚·B
pause 
cls
echo ‚»‚êˆÈŠO‚Ìƒo[ƒWƒ‡ƒ“‚Í“®ì‚ğ•ÛØ‚µ‚Ü‚¹‚ñB
pause
cls
echo ‚Ü‚½A %~n0‚ğÀs‚·‚éÛ‚Í‚É‚ÍƒCƒ“ƒ^[ƒlƒbƒg‚ÉÚ‘±‚³‚ê‚Ä‚¢‚é‚Ì‚ğ„§‚µ‚Ä‚¢‚Ü‚·B
pause 
cls
echo ‚»‚µ‚Ä‚±‚Ìƒoƒbƒ`ˆ—‚ÅƒJ[ƒ\ƒ‹‚ğ•ÏX‚·‚é‚ÆAƒJ[ƒ\ƒ‹‚Ì–¼Ì‚ªA(–³) ‚É‚È‚éê‡‚ª‚ ‚è‚Ü‚·B
pause 
cls
echo ‚»‚ÌÛ‚É‚Í³‹K‚Ì•û–@‚ÅƒJ[ƒ\ƒ‹‚ğ•ÏX‚µ‚È‚¨‚µ‚Ä‚¢‚½‚¾‚­‚Æ³í‚É•\‹L‚³‚ê‚é‚æ‚¤‚É‚È‚è‚Ü‚·B
pause 
cls
echo ‚»‚êˆÈŠO‚ÌƒJ[ƒ\ƒ‹‚ÉŠÖ˜A‚·‚é–â‘è‚àA‚Ù‚Æ‚ñ‚Ç‚Ìê‡‚Í‚»‚ê‚ÅC³‚³‚ê‚é‚Æv‚¢‚Ü‚·Bi‚»‚¤‚Å‚È‚¢ê‡‚ÌÓ”C‚Íì¬Ò‚Å‚ ‚étamago1908‚Íæ‚è‚Ü‚¹‚ñBj
pause 
cls
echo ‚±‚Ìƒoƒbƒ`ˆ—‚Ìg—p‚Í%username%‚¨‚æ‚Ñ‚ ‚È‚½‚Ì©ŒÈÓ”C‚Åg—p‚µ‚Ä‚­‚¾‚³‚¢B
pause 
cls
echo ‚»‚µ‚Ä‹H‚ÉA%~n0‚ªƒEƒCƒ‹ƒX‚Æ‚µ‚ÄŒŸ’m‚³‚ê‚éê‡‚ª‚ ‚è‚Ü‚·‚ªA%~n0‚ÍƒEƒCƒ‹ƒX‚Æ‚µ‚Äì¬‚³‚ê‚½‚à‚Ì‚Å‚Í‚ ‚è‚Ü‚¹‚ñB
pause 
cls
echo ‚±‚Ìƒoƒbƒ`ˆ—‚ªƒEƒCƒ‹ƒX‚Æ‚µ‚ÄŒŸ’m‚³‚ê‚½ê‡A‚»‚ê‚ÍŒëŒŸ’m‚Å‚·‚Ì‚ÅA—áŠO‚Éİ’è‚·‚é‚È‚Ç‚µ‚Ä‰ñ”ğ‚µ‚Ä‚­‚¾‚³‚¢B
pause 
cls
echo ‚±‚Ìƒoƒbƒ`ˆ—‚ğI—¹‚·‚éÛ‚ÍA‚È‚é‚×‚­ƒƒCƒ“ƒƒjƒ…[‚ÌA3 I—¹ ‚©‚çs‚Á‚Ä‚­‚¾‚³‚¢B‚»‚êˆÈŠO‚Å‚ÌI—¹‚Í•s‹ï‡‚ÌŒ´ˆö‚É‚È‚é‰Â”\«‚ª‚ ‚è‚Ü‚·B
pause 
cls
echo ’ˆÓ“_‚ÍˆÈã‚Å‚·B
pause
echo ‚»‚ê‚Å‚Íƒƒjƒ…[‚ğŠJ‚«‚Ü‚·B
pause
cls
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo                     ƒJ
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo                     ƒJ[
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo                     ƒJ[ƒ\ƒ‹
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo                     ƒJ[ƒ\ƒ‹‘Ö
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo                     ƒJ[ƒ\ƒ‹‘Ö‚¦
ping -n 1 127.0.0.1 > nul 2>&1
goto loads

:batbootanimationfun
mode con: cols=85 lines=29
find "wmode=true" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
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
echo                         ƒJ[ƒ\ƒ‹‘Ö‚¦%batver% ‚æ‚¤‚±‚» 2021-2023 %debugmode%
powershell sleep 1
color cf
powershell sleep 0.1
color 2f
powershell sleep 0.1
color bf
powershell sleep 0.1
color 9f
powershell sleep 0.1
color %funanimationclr%
powershell sleep 1
set funanimationclr=
mode con: cols=75 lines=25
goto checksum

:batbootanimation
find "bootanimation=false" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
if {%errorlevel%}=={0} (goto checksum)
cls
rem ƒu[ƒgƒAƒjƒ[ƒVƒ‡ƒ“‚ğÄ¶B5•ª‚Ì1‚ÌŠm—¦‚Å•Êƒo[ƒWƒ‡ƒ“‚ªÄ¶‚³‚ê‚éBramdom‚Ìd—l(H)‚É‚æ‚Á‚Ä“ñ‰ñ˜A‘±‚Årandom‚ğ‚µ‚È‚¢‚Æ‚¢‚¯‚È‚¢B
set /a bootegg=%random%*6/32767
set /a bootegg=%random%*6/32767
if {%firststartbat%}=={yes} (goto batbootanimationbypassfun)
if {%bootegg%}=={1} (goto batbootanimationfun)
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
echo                      2021-2023 tamago1908 %batbuild%
powershell sleep 1
cls
rem İ’è‚ÌŒ‡‘¹‚ğŠm”F

:checksum
if {%firststartbat%}=={yes} (goto loads)
if not exist ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt (
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
echo fastboot=false >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
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
if not {%allsettingerror%} equ {0} (
    title ƒJ[ƒ\ƒ‹Œ‡‘¹
    echo İ’è‚ª%allsettingerror%ŒÂŒ‡‘¹‚µ‚Ä‚¢‚Ü‚·B%allstgerroreastereggmassage%
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
echo fastboot=false >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
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
if {%selected%}=={y} (
:overwritesetting
echo nodogcheckfor1234567890qwertyuiop > ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
echo fastboot=false >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
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

rem İ’è‚Æ‚»‚Ì‘¼‚Ìƒ[ƒh
rem ‰½‚ğ“Ç‚İ‚İA“Ç‚İ‚ñ‚¾Œã‚Ç‚±‚Égoto‚µ‚½‚¢‚©‚ğ•Ï”‚É‘ã“ü•K—v set wantload=setting1 set whatloadgoto=hazime “™ hazimeŠÖŒW‚Ìê‡‚Í‚»‚êƒIƒ“ƒŠ[
rem ƒJ[ƒ\ƒ‹‚ÌF‚ÉŠÖ‚µ‚Ä‚ÍƒƒCƒ“‚Ì•ÏX•”•ª‚É‚ÍÀ‘•‚µ‚Ä‚¢‚Ü‚¹‚ñB•ÏX‚µ‚Ä‚©‚çhazime‚É–ß‚Á‚Ä—ˆ‚ê‚é‚æ‚¤‚ÉİŒv‚µ‚Ä‚È‚¢‚Ì‚ÅB
rem İ’è‚ğ’Ç‰Á‚·‚éê‡‚ÍŠî–{ƒRƒsƒy‚Å‘åä•vB‚½‚¾Aƒƒjƒ…[‚ÌŒ©‚½–Ú‚Æ‚©‚É‚©‚©‚í‚é‚à‚Ì‚Å‚ÍƒR[ƒh‚ğ’Ç‰Á‚µ‚È‚¢‚Æ‚¢‚¯‚È‚¢‚©‚à
:settingloads
if {%bootbatnow%}=={no} (goto whatload) else (goto setting1load)
cls
echo ‚¤‚»‚¾‚ÁII‚±‚ñ‚È‚Ì‚ ‚è‚¦‚È‚¢‚Á‚Á‚ÁI
pause
goto exit
:setting1load
rem ƒzƒƒCƒgƒ‚[ƒh‚ÌŒŸ’m‚ÆF‚Ì•ÏXB•ÏX‚Ì‚‘¬‰»‚Ì‚½‚ß˜”Õ‚É”z’uB
find "wmode=true" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
if {%errorlevel%}=={0} (color f0)
set allsettingerror=0
cls
find "rebootokey=true" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
cls
if {%bootbatnow%}=={no} (echo ˆ—’†...)
if %ErrorLevel%==0 set setting1onoff=—LŒø
if %ErrorLevel%==1 goto setting1load2
if {%bootbatnow%}=={yes} (
set batloadprgs=1
call :batbootprogress
goto setting2load
)
goto whatloadgoto


:setting2load
find "admin=true" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
cls
if {%bootbatnow%}=={no} (echo ˆ—’†...)
if %ErrorLevel%==0 set setting2onoff=—LŒø
if %ErrorLevel%==1 goto setting2load2
if {%bootbatnow%}=={yes} (
set batloadprgs=2
call :batbootprogress
goto setting3load
) 
goto whatloadgoto

:setting3load
find "fastboot=true" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
if {%bootbatnow%}=={no} (echo ˆ—’†...)
if %ErrorLevel%==0 set setting3onoff=—LŒø
if %ErrorLevel%==1 goto setting3load2
if {%bootbatnow%}=={yes} (
set batloadprgs=3
call :batbootprogress
goto setting4load
) 
goto whatloadgoto

:setting4load
find "hatenakeikoku=true" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
cls
if {%bootbatnow%}=={no} (echo ˆ—’†...)
if %ErrorLevel%==0 set setting4onoff=—LŒø
if %ErrorLevel%==1 goto setting4load2
if {%bootbatnow%}=={yes} (
set batloadprgs=4
call :batbootprogress
goto setting5load
) 
goto whatloadgoto

:setting5load
find "bootanimation=true" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
cls
if {%bootbatnow%}=={no} (echo ˆ—’†...)
if %ErrorLevel%==0 set setting5onoff=—LŒø
if %ErrorLevel%==1 goto setting5load2
if {%bootbatnow%}=={yes} (
set batloadprgs=5
call :batbootprogress
goto wmodeload
) 
goto whatloadgoto

:wmodeload
find "wmode=true" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
cls
if {%bootbatnow%}=={no} (echo ˆ—’†...)
if {%ErrorLevel%}=={0} (set wmodeonoff=ƒ_[ƒNƒe[ƒ}‚É•ÏX  &set wmodetoggle=true)
if {%ErrorLevel%}=={1} (goto wmodeload2)
if {%bootbatnow%}=={yes} (
set batloadprgs=6
call :batbootprogress
goto loads
) 
goto whatloadgoto

:allsettingtest
rem İ’è‚ÌŒ‡‘¹‚ğŒŸØ
:setting1load2
find "rebootokey=false" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
cls
if {%bootbatnow%}=={no} (echo ˆ—’†...)
if %ErrorLevel%==0 (set setting1onoff=–³Œø) else if %ErrorLevel%==1 set setting1onoff=null&set /a allsettingerror=allsettingerror+1
if {%bootbatnow%}=={yes} (set batloadprgs=1&call :batbootprogress)
if {%bootbatnow%}=={yes} (goto setting2load) else (goto whatloadgoto)

:setting2load2
find "admin=false" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
cls
if {%bootbatnow%}=={no} (echo ˆ—’†...)
if %ErrorLevel%==0 (set setting2onoff=–³Œø) else if %ErrorLevel%==1 set setting2onoff=null&set /a allsettingerror=allsettingerror+1
if {%bootbatnow%}=={yes} (set batloadprgs=2&call :batbootprogress)
if {%bootbatnow%}=={yes} (goto setting3load) else (goto whatloadgoto)

:setting3load2
find "fastboot=false" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
cls
if {%bootbatnow%}=={no} (echo ˆ—’†...)
if %ErrorLevel%==0 (set setting3onoff=–³Œø) else if %ErrorLevel%==1 set setting3onoff=null&set /a allsettingerror=allsettingerror+1
if {%bootbatnow%}=={yes} (set batloadprgs=3&call :batbootprogress)
if {%bootbatnow%}=={yes} (goto setting4load) else (goto whatloadgoto)

:setting4load2
find "hatenakeikoku=false" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
cls
if {%bootbatnow%}=={no} (echo ˆ—’†...)
if %ErrorLevel%==0 (set setting4onoff=–³Œø) else if %ErrorLevel%==1 set setting4onoff=null&set /a allsettingerror=allsettingerror+1
if {%bootbatnow%}=={yes} (set batloadprgs=4&call :batbootprogress)
if {%bootbatnow%}=={yes} (goto setting5load2) else (goto whatloadgoto)

:setting5load2
find "bootanimation=false" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
cls
if {%bootbatnow%}=={no} (echo ˆ—’†...)
if %ErrorLevel%==0 (set setting5onoff=–³Œø) else if %ErrorLevel%==1 set setting5onoff=null&set /a allsettingerror=allsettingerror+1
if {%bootbatnow%}=={yes} (set batloadprgs=5&call :batbootprogress)
if {%bootbatnow%}=={yes} (goto wmodeload) else (goto whatloadgoto)

:wmodeload2
find "wmode=false" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
cls
if {%bootbatnow%}=={no} (echo ˆ—’†...)
if {%ErrorLevel%}=={0} (set wmodeonoff=ƒzƒƒCƒgƒe[ƒ}‚É•ÏX&set wmodetoggle=false) else if {%ErrorLevel%}=={1} (set wmodeonoff=  null  ƒe[ƒ}‚É•ÏX&set wmodetoggle=false&set /a allsettingerror=allsettingerror+1)
if {%bootbatnow%}=={yes} (set batloadprgs=6&call :batbootprogress)
if {%bootbatnow%}=={yes} (goto loads) else (goto whatloadgoto)

:loads
:wmodehazimeload
rem ƒzƒƒCƒgƒ‚[ƒh‚ğŒŸ’m‚µ‚ÄF‚ğ•ÏX
find "wmode=true" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
if {%errorlevel%}=={0} (color f0)
cls
if {%bootbatnow%}=={no} (echo ˆ—’†...) else (
set batloadprgs=6
call :batbootprogress
goto debughazimeload
)
if {%whatloadgoto%}=={hazime} (goto hazimemenu)
goto debughazimeload

:debughazimeload
rem ƒfƒoƒbƒNƒ‚[ƒh‚ÌŒŸ’m
find "debug=true" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
cls
if {%errorlevel%}=={0} (echo on&set debugmode=debugmode)
if {%errorlevel%}=={1} (echo off&set debugmode=)
if {%bootbatnow%}=={no} (echo ˆ—’†...) else (
set batloadprgs=7
call :batbootprogress
goto firststarttest
)
if {%1}=={devmode} (set devmode=true&goto firststarttest)
if {%whatloadgoto%}=={hazime} (goto hazimemenu)
goto firststarttest

:firststarttest
rem ‰‰ñƒJ[ƒ\ƒ‹‚ÌŒŸ’m
find "nodogcheckforfastboot" ‰‰ñƒJ[ƒ\ƒ‹.txt > nul
cls
if {%ErrorLevel%}=={1} (goto itazurasyokai)
if {%bootbatnow%}=={no} (echo ˆ—’†...) else (
set batloadprgs=8
call :batbootprogress
goto cursorcolorload
)
if {%whatloadgoto%}=={hazime} (goto hazimemenu)
goto cursorcolorload

:cursorcolorload
rem ƒJ[ƒ\ƒ‹‚ÌF‚ğŒŸ’m
rem 0x0‚Í”’
rem 0x2‚Í•
reg query "HKEY_CURRENT_USER\Control Panel\Cursors" /v "Scheme Source" | find "0x0"
cls
if {%ErrorLevel%}=={0} (set cursorcolor=•)
if {%ErrorLevel%}=={1} (set cursorcolor=”’)
if {%bootbatnow%}=={no} (echo ˆ—’†...) else (
set batloadprgs=9
call :batbootprogress
goto hazimecursorcolor2
)
if {%whatloadgoto%}=={hazime} (goto hazimemenu)

:hazimecursorcolor2
reg query "HKEY_CURRENT_USER\Control Panel\Cursors" /v "Scheme Source" | find "0x2"
cls
if {%ErrorLevel%}=={0} (set cursorcolor=”’)
if {%bootbatnow%}=={no} (echo ˆ—’†...) else (
set batloadprgs=10
call :batbootprogress
goto :batbootinitializetionvariable
)
if {%whatloadgoto%}=={hazime} (goto hazimemenu)
goto hazimemenu


:batbootprogress
cls
rem ƒu[ƒgƒAƒjƒ[ƒVƒ‡ƒ“B
rem ‰º‚Í“Ç‚İ‚İ‚ÌƒeƒLƒXƒg•ªŠòB
if {%bootbatnow%}=={no} (title ƒJ[ƒ\ƒ‹İ’è ˆ—’†... & echo ˆ—’†... & goto whatload) else (title ‹N“®’†...)
if {%simpleboot%}=={true} (echo ‹N“®’†...& exit /b)
cls
rem goofy ahh code
set loadscrnprgs0=
set loadscrnprgs1=
set loadscrnprgs2=
set loadscrnprgs3=
set loadscrnprgs4=
set loadscrnprgs5=
set loadscrnprgs6=
set loadscrnprgs7=
set loadscrnprgs8=
set loadscrnprgs9=
set loadscrnprgs10=
if {%wmodetoggle%}=={false} (set loadscrnprgsclr=[7m&set loadscrnprgsclr2=[0m)
if {%wmodetoggle%}=={true} (set loadscrnprgsclr=[100m[97m&set loadscrnprgsclr2=[0m[107m[30m) else (set loadscrnprgsclr=[7m&set loadscrnprgsclr2=[0m)
if {%batloadprgs%}=={0} (set loadscrnprgs0=                                                     )
if {%batloadprgs%}=={1} (set loadscrnprgs1=%loadscrnprgsclr%   %loadscrnprgsclr2%                                                  )
if {%batloadprgs%}=={2} (set loadscrnprgs2=%loadscrnprgsclr%       %loadscrnprgsclr2%                                              )
if {%batloadprgs%}=={3} (set loadscrnprgs3=%loadscrnprgsclr%           %loadscrnprgsclr2%                                          )
if {%batloadprgs%}=={4} (set loadscrnprgs4=%loadscrnprgsclr%                %loadscrnprgsclr2%                                     )
if {%batloadprgs%}=={5} (set loadscrnprgs5=%loadscrnprgsclr%                     %loadscrnprgsclr2%                                )
if {%batloadprgs%}=={6} (set loadscrnprgs6=%loadscrnprgsclr%                           %loadscrnprgsclr2%                          )
if {%batloadprgs%}=={7} (set loadscrnprgs7=%loadscrnprgsclr%                                  %loadscrnprgsclr2%                   )
if {%batloadprgs%}=={8} (set loadscrnprgs8=%loadscrnprgsclr%                                         %loadscrnprgsclr2%            )
if {%batloadprgs%}=={9} (set loadscrnprgs9=%loadscrnprgsclr%                                                %loadscrnprgsclr2%     )
if {%batloadprgs%}=={10} (set loadscrnprgs10=%loadscrnprgsclr%                                                     %loadscrnprgsclr2%)                                                  
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
echo O=========================================================================O
echo.
echo                       ƒJ[ƒ\ƒ‹‘Ö‚¦‚ğ“Ç‚İ‚ñ‚Å‚¢‚Ü‚·...
echo           O=====================================================O
echo           I%loadscrnprgs0%%loadscrnprgs1%%loadscrnprgs2%%loadscrnprgs3%%loadscrnprgs4%%loadscrnprgs5%%loadscrnprgs6%%loadscrnprgs7%%loadscrnprgs8%%loadscrnprgs9%%loadscrnprgs10%I
echo           O=====================================================O
rem 37 ‘SŠp
rem 74 ”¼Šp
exit /b
:batbootinitializetionvariable
set loadscrnprgs9=
set loadscrnprgs10=
set loadscrnprgsclr=
set loadscrnprgsclr2=
goto hazimemenu

:whatload
cls
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
if {%wantload%}=={0null0} (goto hazimemenu)
echo Error! %wantload% is not exist! pls set it.
pause
exit

:whatloadgoto
cls
set wantload=0null0
exit /b

rem ƒƒjƒ…[‚Ì¶¬‚Ì€”õ
:hazimemenu
cls
if {%bootbatnow%}=={no} (goto hazimemenuskipboot)
if {%bootbatnow%}=={yes} (set bootbatnow=no&goto batbootanimation)
:hazimemenuskipboot
set wantload=0null0
set clrhelp=& set clrhelp2=
set settinghelptoggle=false
mode con: cols=75 lines=25
if {%hazimeeaster%}=={true} (set hazimebuild=%batbuild%)

rem ƒƒjƒ…[‚Ì•`Ê
rem ‹K‘¥‚Í5,10,20
echo                              ƒJ[ƒ\ƒ‹‘Ö‚¦%batver% %debugmode% %hazimebuild%
title ƒJ[ƒ\ƒ‹‘Ö‚¦ %debugmode% 
set selected=0nul0
echo.
echo   O=====================================================================O
echo   I     1ƒJ[ƒ\ƒ‹‚ğ%cursorcolor%F‚É‚·‚é           2“d‘ì              3I—¹        I
echo   I                                                                     I
echo   I                   4ƒo[ƒWƒ‡ƒ“î•ñ          5İ’è                    I
echo   O=====================================================================O
echo.
SET /P selected=”CˆÓ‚ÌÀs‚µ‚½‚¢”šA‚à‚µ‚­‚ÍƒAƒ‹ƒtƒ@ƒxƒbƒg‚ğ“ü—Í‚µ‚Ä‚­‚¾‚³‚¢... :
echo.
if {%selected%}=={0nul0} (goto hatenahazime)
if not {%selected%}=={3} (echo %selected% ‚ª‘I‘ğ‚³‚ê‚Ü‚µ‚½B)

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
if {%selected%}=={egg1} (color 1f&goto :erroralldef1)
if {%selected%}=={egg2} (goto :Dogcheck)
if {%selected%}=={wwssdadaba} (set hatenaita=0&goto littleeasteregg)
if {%selected%}=={tamago1908} (echo :P&pause&goto hazime)
if {%selected%}=={himazinnoob1908} (echo :D&pause&goto hazime)
if {%selected%}=={mskg1908} (echo xD&pause&goto hazime)
if {%selected%}=={1908} (goto :1908hell)
if {%selected%}=={toxic} (start chrome.exe --window-size=0,0 --incognito -- https://www.youtube.com/watch?v=N6ael_DEPcs&goto hazime)
if {%selected%}=={abcdefu} (start chrome.exe --window-size=0,0 --incognito -- https://www.youtube.com/watch?v=qgRx58oItTk&goto hazime)
if {%selected%}=={dogsong} (start chrome.exe --window-size=0,0 --incognito -- https://www.youtube.com/watch?v=H4wptBuM6zs&goto hazime)
if {%selected%}=={„‚Í–°‚¢‚Å‚·} (echo me too&pause& goto hazime)

rem ƒfƒoƒbƒO—pƒRƒ}ƒ“ƒh‚ÌQÆ
if {%selected%}=={inspectentirecommandlist} (goto :allcommands)

rem ƒfƒoƒbƒO—p
if {%selected%}=={alldefnow1} (goto :AllDefult1)
if {%selected%}=={playdefboot} (set hatenaita=0&cls&goto :syokaiboot)
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
find "hatenakeikoku=false" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
if {%errorlevel%}=={0} (goto hazime)

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

:itazurasyokai
rem ƒƒbƒZ[ƒW•\¦
echo Dim answer:answer = MsgBox("ƒCƒ^ƒYƒ‰‚É‰‰ñƒJ[ƒ\ƒ‹.txt‚Ì’†gÁ‚µ‚½‚¾‚ë!!!‘S•”‚¨Œ©’Ê‚µ‚¾I",vbOKCancel,"‚³‚Á‚³‚Æ–ß‚¹A‚¶‚á‚È‚¢‚Æ‰i‰“‚É—¬‚ê‚é‚¼"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
rem ƒtƒ@ƒCƒ‹íœ
del /Q %TEMP%\msgbox.vbs
rem ƒƒbƒZ[ƒW•\¦
echo Dim answer:answer = MsgBox("‚à‚µ’¼‚µ‚½‚¯‚ê‚ÎAnodogcheckforfastboot‚ğ‰‰ñƒJ[ƒ\ƒ‹.txt‚É“ü‚ê‚é‚ñ‚¾‚ÈB",vbOKCancel,"‚³‚Á‚³‚Æ–ß‚¹"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
rem ƒtƒ@ƒCƒ‹íœ
del /Q %TEMP%\msgbox.vbs
exit


rem I—¹ˆ—‚Æ‚»‚ê‚ÌŠm”F
rem todolist, ‚±‚±‚Ì•”•ª‚ÉGUI‚ğÀ‘•‚µ‚ÄAÄ‹N“®‚Æ‚©‚Ì‹@”\‚ğ•t‚¯‚éB
:exitmenu
title I—¹Šm”F %debugmode% 
set selected=0nul0
echo.
SET /P selected=–{“–‚ÉI—¹‚µ‚Ü‚·‚©Hiyes‚Ü‚½‚Ínoj:
if {%selected%}=={yes} (exit)
if {%selected%}=={y} (exit)
if {%selected%}=={no} (goto :hazimemenu)
if {%selected%}=={n} (goto :hazimemenu)
if {%selected%}=={back} (goto :hazimemenu)
if {%selected%}=={b} (goto :hazimemenu)
goto :hazimemenu


rem İ’èƒƒjƒ…[‚Ì•`Ê
:setting
set wantload=0null0
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
set selected=0nul0
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
Echo I                        I  [W S] ‚© [1 2] ‚Ç‚¿‚ç‚©‚ğ‰Ÿ‚µ‚ÄƒJƒeƒSƒŠ[‚ğ   I
echo I ƒJ[ƒ\ƒ‹‘Ö‚¦  Œ©‚½–ÚŒn I  ‘I‘ğ‚µ‚Ä‚­‚¾‚³‚¢B                            I
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
if %ErrorLevel%==4 goto settingcategory1
if %ErrorLevel%==5 goto settingcategory1
if %ErrorLevel%==6 goto hazime
if %ErrorLevel%==7 goto settingcategory1
if %ErrorLevel%==8 goto settingcategory1
if %ErrorLevel%==9 goto settingcategoryhelpmode

:settingcategory1
title ƒJ[ƒ\ƒ‹İ’è %debugmode%
set selected=0nul0
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
set selected=0nul0
Cls
Echo.
Echo                               İ’èƒƒjƒ…[ Ver2!!
echo. 
echo O========================O                  O======O
echo I      ƒJƒeƒSƒŠ[        I                  I İ’è I
echo O========================O==================O======O======================O
echo I                        I                                                I
echo I  ƒJ[ƒ\ƒ‹‘Ö‚¦  ‹@”\Œn  I  ƒJ[ƒ\ƒ‹‘Ö‚¦‚ÌŒ©‚½–Ú‚ÉŠÖ‚·‚éİ’è‚Å‚·B        I
echo I                        I iƒe[ƒ}‚È‚Çj                                 I
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
set selected=0nul0
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
Echo O  ƒJƒeƒSƒŠ[  ã‚©‰º‚©  I 3 ‚‘¬‹N“®‹@”\                      I   %setting3onoff%   I
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
set selected=0nul0
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
Echo O  ƒJƒeƒSƒŠ[  ã‚©‰º‚©  I 3 ‚‘¬‹N“®‹@”\                      I   %setting3onoff%   I
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
set selected=0nul0
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
Echo O  ƒJƒeƒSƒŠ[  ã‚©‰º‚©  I 3 ‚‘¬‹N“®‹@”\                      I   %setting3onoff%   I
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
set selected=0nul0
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
Echo O  ƒJƒeƒSƒŠ[  ã‚©‰º‚©  I %clr%3 ‚‘¬‹N“®‹@”\%clr2%                      I   %setting3onoff%   I
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
set selected=0nul0
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
Echo O  ƒJƒeƒSƒŠ[  ã‚©‰º‚©  I 3 ‚‘¬‹N“®‹@”\                      I   %setting3onoff%   I
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
set selected=0nul0
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
Echo O  ƒJƒeƒSƒŠ[  ã‚©‰º‚©  I 3 ‚‘¬‹N“®‹@”\                      I   %setting3onoff%   I
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
set selected=0nul0
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
set selected=0nul0
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
set selected=0nul0
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
set selected=0nul0
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
echo I                        I  ƒwƒ‹ƒvƒ‚[ƒh‚Í%settinghelp%‚Å‚·                        I
echo O========================O==O=====================O==========O============O
echo I%clr%      ƒwƒ‹ƒvƒ‚[ƒh      %clr2%I  I ˆÚ“® : W A S D ”š I –ß‚é : B I Œˆ’è : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12wsbye3 /n /m "•ÏX‚·‚é‚à‚Ì‚ğ”š‚Åw’è–”‚Íwasd‚ÅˆÚ“®‚µ‚Äw’è‚µ‚Ä‚­‚¾‚³‚¢"
if %ErrorLevel%==1 goto settingcategory1
if %ErrorLevel%==2 goto settingcategory2
if %ErrorLevel%==3 goto settingcategory2
if %ErrorLevel%==4 goto settingcategoryhelpmode
if %ErrorLevel%==5 goto hazime
if %ErrorLevel%==6 goto settingcategoryhelpmodetoggle
if %ErrorLevel%==7 goto settingcategoryhelpmodetoggle
if %ErrorLevel%==8 goto settingcategoryhelpmode

:settingcategoryhelpmodetoggle
if %settinghelptoggle%==true set settinghelptoggle=false&set clrhelp=&set clrhelp2=&goto settingcategoryhelpmode
if %settinghelptoggle%==false set settinghelptoggle=true&goto settingcategoryhelpmodetoggleiftrue

:settingcategoryhelpmodetoggleiftrue
if {%wmodetoggle%}=={false} (set clrhelp=[7m&set clrhelp2=[0m)
if {%wmodetoggle%}=={true} (set clrhelp=[100m[97m&set clrhelp2=[0m[107m[30m)
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
set selected=0nul0
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
call :batbootprogress
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
call :batbootprogress
Goto settingcategory1intsetting2

:setting2n
cls
Echo ‹N“®‚ÌŠÇ—ÒŒ ŒÀ‚Ì—v‹‚Í%setting2onoff%‚É‚È‚è‚Ü‚¹‚ñ‚Å‚µ‚½
Pause
goto settingcategory1intsetting2

:setting3
if {%settinghelptoggle%}=={true} (goto setting3help)
find "fastboot=false" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
if %ErrorLevel%==0 set setting3setonoff=—LŒø&goto setting3onoff
if %ErrorLevel%==1 set setting3setonoff=C•œ‚µA³í‚Èó‘Ô&goto setting3onoff

:setting3onoff
find "fastboot=true" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
if %ErrorLevel%==0 set setting3setonoff=–³Œø&set setting3warning=
:setting3okey
cls
echo ‚‘¬‹N“®‚ğ%setting3setonoff%‚É‚µ‚Ü‚·‚©H(Y=‚Í‚¢ N=‚¢‚¢‚¦ B=–ß‚é)
SET /P selected= :
echo %selected% ‚ª‘I‘ğ‚³‚ê‚Ü‚µ‚½B
if {%selected%}=={y} (goto :setting3y)
if {%selected%}=={n} (goto :setting3n)
if {%selected%}=={back} (goto :settingcategory1intsetting3)
if {%selected%}=={b} (goto :settingcategory1intsetting3)
goto setting3okey

:setting3y
find "fastboot=false" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
echo İ’è‚ğ“K—p’†...
if %ErrorLevel%==1 goto setting3ygo3test
if %ErrorLevel%==0 goto setting3ygo1

:setting3ygo3test
find "fastboot=true" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
if %ErrorLevel%==1 echo fastboot=false >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
if %ErrorLevel%==0 goto setting3ygo2

:setting3ygo2
powershell "(gc ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt) -replace 'fastboot=true','fastboot=false' | sc ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt"
goto setting3yokey

:setting3ygo1
powershell "(gc ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt) -replace 'fastboot=false','fastboot=true' | sc ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt"
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
call :batbootprogress
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
call :batbootprogress
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
call :batbootprogress
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
echo ?
echo.
pause
echo ‚·‚İ‚Ü‚¹‚ñB‚à‚¤ˆê“xŒ¾‚Á‚Ä‚¢‚½‚¾‚¯‚Ü‚¹‚ñ‚©H
echo.
pause
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
call :batbootprogress
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
echo ‚±‚Ìİ’è‚Í–¼‘O‚Ì’Ê‚èA‹N“®ŠÔ‚ğ’Zk‚·‚éİ’è‚Å‚·B
echo ‚±‚Ìİ’è‚ğ—LŒø‚É‚·‚é‚ÆAˆê•”‚Ìˆ—‚ğƒXƒLƒbƒv‚µAiƒƒCƒ“‚Ìˆ—‚É‚Í‰e‹¿‚È‚µj
echo ‹N“®ŠÔ‚ªPC‚ÌƒXƒyƒbƒN‚É‚à‚æ‚è‚Ü‚·‚ª0.5•b‚Ù‚Ç’Zk‚³‚ê‚Ü‚·B
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
echo.
echo ƒJ[ƒ\ƒ‹‘Ö‚¦ ver %batver%   2021-2023
if %hazimeeaster%==true echo %batbuild%
title ƒJ[ƒ\ƒ‹‘Ö‚¦ thenks so much %username%
powershell sleep -m 200
echo and...
powershell sleep -m 200
echo create by tamago_1908

pause
cls
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
goto default

:no0
echo •ÏX‚Í‚³‚ê‚Ü‚¹‚ñ‚Å‚µ‚½B
pause
goto hazime

:yes0
if exist ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt goto henkoudefo
if not exist ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt goto saisyonokeikoku
rem İ’è‚Ì‘‚«‚İ(default)
:saisyonokeikoku
type nul > ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
echo nodogcheckfor1234567890qwertyuiop >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
echo fastboot=false >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
echo wmode=false >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
echo admin=false >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
echo rebootokey=true >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
echo hatenakeikoku=true >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
echo bootanimation=true >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt

rem ŒxƒƒbƒZ[ƒWA‰‰ñ‹N“®ŒÀ’è
cls
echo (‰‰ñ‹N“®‚Ì‚İ)
powershell sleep -m 500
cls
echo.
powershell sleep -m 100
color 04
echo @@@                         @I’ˆÓI
powershell sleep -m 200
color 0c
powershell sleep -m 100
color 07
powershell sleep -m 500
echo.
echo ‚±‚Ìbatƒtƒ@ƒCƒ‹iˆÈ‰ºAƒXƒNƒŠƒvƒgj‚ÍAƒJ[ƒ\ƒ‹‚ğƒfƒtƒHƒ‹ƒgA‚Ü‚½‚Í•F‚É‚·‚é‚¾‚¯‚ÌƒXƒNƒŠƒvƒg‚Å‚·B
powershell sleep -m 2000
echo ‚È‚¢‚Æ‚Ív‚¢‚Ü‚·‚ªA‚±‚ÌƒXƒNƒŠƒvƒg‚ğg—p‚·‚é‚É‚ ‚½‚Á‚Ä”­¶‚µ‚½‘¹ŠQA‚Ü‚½‚ÍƒRƒ“ƒsƒ…[ƒ^[‚Ì‘¹“™‚Ì”íŠQ‚ÌÓ”C‚Í»ìÒ‚Å‚ ‚é‚»‚±‚ç•Ó‚É‚ ‚é—‘‚ÍˆêØ‚ÌÓ”C‚ğæ‚è‚Ü‚¹‚ñI
pause
echo.
echo.
rem Œx‚Ì•ªŠòBno‚ğ“ü—Í‚·‚é‚ÆƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt‚ªíœ‚³‚ê‚éB
:warningfirstchenge
SET /P selected=‚æ‚ë‚µ‚¢‚Å‚·‚©H(Y=Yes / N=No)
if {%selected%}=={n} (del ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt & goto exit)
if {%selected%}=={no} (del ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt & goto exit) 
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
rundll32 user32.dll,MessageBeep
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
rundll32 user32.dll,MessageBeep
echo ‚È‚ÉIH‚È‚º‚¾I‚±‚ñ‚È‚±‚Æ‚Í‚ ‚è“¾‚È‚¢‚ÁIII‰´‚Ì‚»‚Î‚É‹ßŠñ‚é‚È‚Ÿ[‚ÁI
goto exit

rem ƒJ[ƒ\ƒ‹‚ÌF‚ğ”’‚É•ÏX‚·‚é
:defgo
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

if {%firststartbat%}=={yes} (cls&echo ‚Ü‚¸Å‰‚ÉƒJ[ƒ\ƒ‹‚ÌF‚ğ•ÏX‚µ‚Ä‚­‚¾‚³‚¢I&echo.&pause&goto hazime)
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
powershell sleep 1.5
cls
mode con: cols=85 lines=24
set dogcheckcount=0
:dogcheckanimation0f
set /a dogcheckcount=dogcheckcount+1
if %dogcheckcount% gtr 5 (title Dogcheck respect tobyfox)
if %dogcheckcount% gtr 7 (title Dogcheck)
if %dogcheckcount% gtr 30 (title dogrune chapter 1)
if %dogcheckcount% gtr 32 (title Dogcheck)
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
echo BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
powershell sleep 0.8
cls
goto dogcheckanimation1f

:dogcheckanimation1f
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
powershell sleep 0.7
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
echo fastboot=false >> ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
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
set alldefno2clr=[96m
set alldefno2clr2=[40m[3m
cls
color 0B
echo %alldefno2clr2%%alldefno2clr%‚ğ–ß‚»‚¤
powershell sleep 2
find "wmode=false" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
if %ErrorLevel%==0 color 07
if %ErrorLevel%==1 goto wmodeonoffkenti
:wmodeonoffkentialldefno2
find "wmode=true" ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt > nul
if %ErrorLevel%==0 color f0
goto hazime

:yes2
rem ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹‚ÌÅIŠm”F
set selected=null
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
set selected=null
echo.
rundll32 user32.dll,MessageBeep
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
if not exist ‰‰ñƒJ[ƒ\ƒ‹.txt set erroralldefwhatdelete=‰‰ñƒJ[ƒ\ƒ‹ & goto erroralldef1
:testerroralldef
if not exist ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt set erroralldefwhatdelete=ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è & goto erroralldef1
set erroralldefwhatdelete=‰‰ñƒJ[ƒ\ƒ‹.txt‚ÆAƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txtA‚»‚Ì—¼•û‚Ì
goto alldefnow

:erroralldef1
mode con: cols=100 lines=30
color 1f
rem ƒƒbƒZ[ƒW•\¦
rundll32 user32.dll,MessageBeep
cls
echo A problem has been detected and windows has been shut down to prevent echo damage to your computer.
echo If this is the first time you've seen this stop error screen,
echo restart your computer.
echo If this screen appears again,
echo follow these steps:
echo.
echo Check to be sure you have adequate disk space.
echo If a driver is identified in the stop message,
echo disable the driver or check with the manufacturer for driver updates.
echo Try changing Video adapters.
echo.
echo Check with your hardware vendor for any BIOS updates.
echo Disable BIOS memory options such as caching or shadowing.
echo If you need to use Safe Mode to remove or disable components,
echo restart your computer, press F8 select Advanced Startup Options,
echo and then select Safe Mode.
echo.
echo Technical information:
echo.
echo *** STOP: 0x0000008E (0xC0000005,0x8054DF87,0xB8F97810,0x00000000,)
echo *** MEMORY LOG: E3 81 93 E3 81 AE E5 A4 89 E6 85 8B EF BC 81 2E 2E 2E E3 82 88 E3 81 8F E3 81 93 E3 82 93 E3 81 AA E3 81 AE E8 A7 A3 E6 9E 90 E3 81 97 E3 82 88 E3 81 86 E3 81 A8 E6 80 9D E3 81 A3 E3 81 9F E3 82 8F E3 81 AD EF BC 81 E3 81 9D E3 81 AE E7 82 B9 E3 81 A0 E3 81 91 E3 81 AF E7 A7 B0 E8 B3 9B E3 81 AB E5 80 A4 E3 81 99 E3 82 8B E3 82 8F 2E 2E 2E 2E E3 81 BE E3 81 A3 E3 81 9F E3 81 8F E3 80 82
echo.
echo Beginning dump of physical memory
echo physical memory dump complete.
echo Contact your system administrator or technical support group for further echo assistance.
goto :erroralldef1massage

:erroralldef1massage
echo Dim answer:answer = MsgBox("‚Ç‚¤‚È‚é‚Ì‚©A‚í‚©‚Á‚Ä‚é‚Ì‚©‚ÈH",vbOKCancel,"ƒGƒ‰["):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul
if {%errorlevel%}=={1} (goto :erroralldef2massage)
if {%errorlevel%}=={2} (goto :erroralldef2massage)

:erroralldef2massage
echo Dim answer:answer = MsgBox("‚±‚ÌƒGƒ‰[‚Í‚·‚×‚Ä‚ğƒfƒtƒHƒ‹ƒg‚É–ß‚·Û‚É‘¶İ‚µ‚Ä‚¢‚é‚Í‚¸‚Ìƒtƒ@ƒCƒ‹‚ª‘¶İ‚µ‚Ä‚¢‚È‚¢‚Æ‚«‚É”­¶‚µ‚Ü‚·B",vbOKCancel,"ƒGƒ‰[‚ÌŒ´ˆö"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul
rem ƒtƒ@ƒCƒ‹íœ
del /Q %TEMP%\msgbox.vbs
goto erroralldef3massage

:erroralldef3massage
echo Dim answer:answer = MsgBox("‚Ü‚ŸA‚¨‚»‚ç‚­‚ ‚È‚½‚ª AllDefult ‚ğÀs‚·‚éÛ‚É%erroralldefwhatdelete%.txt‚ğíœ‚µ‚½‚Ì‚ªŒ´ˆö‚¾‚Æv‚¢‚Ü‚·‚¯‚Ç‚ËB",vbYesno,"ƒGƒ‰[‚Ì–{“–‚ÌŒ´ˆö"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul
if {%errorlevel%}=={6} (goto :erroralldef3massageok)
if {%errorlevel%}=={7} (goto :erroralldef3massageno)
goto erroralldef3massage

:erroralldef3massageok
echo Dim answer:answer = MsgBox("‚â‚Á‚Ï‚è‚ËB",vbOKCancel,"ƒGƒ‰["):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
rem ƒtƒ@ƒCƒ‹íœ
del /Q %TEMP%\msgbox.vbs
exit

:erroralldef3massageno
echo Dim answer:answer = MsgBox("‚¤‚Á‚»[‚ñB‚Å‚àA–{“–‚ÉƒoƒO‚Å‚±‚ê‚ª‹N‚«‚½‚Á‚Ä‚±‚Æ‚È‚ç»ìÒ‚É“`‚¦‚Ä’¼‚µ‚Ä‚à‚ç‚Á‚Ä‚­‚¾‚³‚¢‚ËB",vbOKCancel,"ƒGƒ‰[H"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %ERRORLEVEL% > nul
del /Q %TEMP%\msgbox.vbs
exit

rem ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹ƒƒjƒ…[‚Ì‘I‘ğ‚Ì”»•Ê
:alldefnow
cls
color 07
if %alldefselect%==1 goto alldefnowhenkou
if %alldefselect%==2 goto alldefnowsettingdel

rem ƒAƒ“ƒCƒ“ƒXƒg[ƒ‹ƒƒjƒ…[‚Ì‘I‘ğ‚É‰‚¶‚Ä‚Ì•ªŠò
:alldefnowsettingdel
del ‰‰ñƒJ[ƒ\ƒ‹.txt
del ƒJ[ƒ\ƒ‹‘Ö‚¦İ’è.txt
goto alldefnowfinish

:alldefnowhenkou
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
del %~0
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
if {%selected%}=={siranai} (goto :secretnomal)
if {%selected%}=={siran} (goto :secretnomal)
if {%selected%}=={kaiseki} (goto :secrethentai)
if {%selected%}=={tyokkan} (goto :secretnomal)

if {%selected%}=={tyokkan} (goto :secretnomal) else (goto secretnomal)

echo.
echo ?
pause
echo.
echo ‚·‚İ‚Ü‚¹‚ñB‚à‚¤ˆê“xŒ¾‚Á‚Ä‚¢‚½‚¾‚¯‚Ü‚¹‚ñ‚©H
pause
goto rebootok

:secretnomal
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
set clr=[7m&set clred=[91m&set clrgrn=[92m&set clryel=[93m&set clrmag=[95m&set clrgra=[90m&set clrcyan=[96m&set clr2=[0m
goto acbatargmentsonly

:openiedev
cls
echo InternetExplorer is will open.
echo CreateObject("InternetExplorer.Application").Visible=true > %TEMP%\openie.vbs & %TEMP%\openie.vbs
del %temp%\openie.vbs
powershell sleep 0.2
goto hazime

:allcommands
rem Sword art online War of Underworld refarence
set selected=0null0
if {%allcommandlock%}=={true} (goto hazime) else if {%allcommandlock%}=={false} (goto allcommandsmain)
title enter the password!
set /p selected=enter the password:
if {%selected%}=={1908} (echo correct.&set allcommandlock=false&pause) else if {%selected%}=={0null0} (echo please type something.&pause&goto allcommands) else (echo incorrect! now you need restart bat to try again.&set allcommandlock=true&pause&goto hazime)
:allcommandsmain
cls
rem dumbass code, wtf hell no who make it fr (damn its me but)!!!!! ITS ABSOLUTE TRASH!!!! THATS IS SO HARD TO READ
rem so many set uhhh
rem STOP SPAMMING SET AUHAUAHAUAHAUHAUAHAHAHAUAHUAHUUAUHHUHUHUHUHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHh&SET IHHHHGISJGIE
if {%wmodetoggle%}=={false} (set clr=[7m&set clred=[91m&set clrgrn=[92m&set clryel=[93m&set clrmag=[95m&set clrgra=[90m&set clrcyan=[96m&set clr2=[0m)
if {%wmodetoggle%}=={true} (set clr=[100m[97m&set clred=[91m&set clrgrn=[92m&set clryel=[93m&set clrmag=[95m&set clrgra=[90m&set clrcyan=[96m&set clr2=[0m[107m[30m)
if defined %wmodetoggle% (set clr=[7m&set clred=[91m&set clrgrn=[92m&set clryel=[93m&set clrmag=[95m&set clrcyan=[96m&set clrgra=[90m&set clr2=[0m)
echo [Loading Command list...]
powershell -command "&{$h=Get-Host;$w=$h.UI.RawUI;$s=$w.BufferSize;$s.height=65;$w.BufferSize=$s;}"
cls
title INSPECT:COMMANDLIST
echo %clr%::%clr2%                      [Entire list of menu commands]    %clrgra%6color test%clr2%
echo                     (you can use all them it in main menu)
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
echo           %clrcyan%-%clr2% reload            %clrgra%(reboot bat file, and reloading setting.) %clr2%
echo           %clrcyan%-%clr2% openie            %clrgra%(trying open internet explorer.)%clr2%
echo           %clrcyan%-%clr2% counttestdeb      %clrgra%(enter the count test mode.)%clr2%
echo           %clrcyan%-%clr2% alldefnow1        %clrgra%(forced to enter alldefault.)%clr2%
echo           %clrcyan%-%clr2% funanimationdeb   %clrgra%(play rare boot animation.)%clr2%
echo           %clrcyan%-%clr2% windowsfiltertest %clrgra%(play bad win ver waning.)%clr2%
echo.
echo            ^<%clrgrn%easter egg purposes commands%clr2%^>
echo.
echo           %clrcyan%-%clr2% easteregg %clryel%[%clr2%%clred%!%clr2%%clryel%]%clr2%    %clrgra%(playing easteregg, its little dangerous.)%clr2%
echo           %clrcyan%-%clr2% egg              %clrgra%(play seacret message.)%clr2%
echo           %clrcyan%-%clr2% egg1             %clrgra%(play error massage in alldef.)%clr2%
echo           %clrcyan%-%clr2% egg2             %clrgra%(play dogcheck error, inspire toby fox.)%clr2%
echo           %clrcyan%-%clr2% wwssdadaba       %clrgra%(seacret massage and show build number.)%clr2%
echo           %clrcyan%-%clr2% tamago1908       %clrgra%(show goofy massage.)%clr2%
echo           %clrcyan%-%clr2% himazionnoob1908 %clrgra%(show goofy massage.)%clr2%
echo           %clrcyan%-%clr2% mskg1908         %clrgra%(show goofy massage.)%clr2%
echo           %clrcyan%-%clr2% 1908             %clrgra%(show looped goofy massage.)%clr2%
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
echo            %clrcyan%-%clr2% bypsdisexit       %clrgra%(Bypass disabling the exit button.)%clr2%
echo            %clrcyan%-%clr2% bypsloadsg        %clrgra%(Bypass the loading of settings.)%clr2%
echo            %clrcyan%-%clr2% bypsvck           %clrgra%(Bypass the windows version check.)%clr2%
if {%batargmentonly%}=={true} (echo.&echo.&goto allcommandswait)
echo.
echo                     %clrgrn%[%clr2%fulldebug commands%clrgrn%]%clr2%
echo.
echo            %clrcyan%-%clr2% goto %clrgra%(goto for labels that exist.)%clr2%
echo            %clrcyan%-%clr2% set  %clrgra%(create new variable.)%clr2%
echo            %clrcyan%-%clr2% help %clrgra%(Show commands available in fulldebug.)%clr2%
echo.
:allcommandswait
echo %clred%^/^/%clr2%[Type something to back to menu...]                           %clrgra%%batver%%clr2%
pause >nul
set clrcyan=
set clrgra=
set clred=
set clrgrn=
set clryel=
set clrmag=
if {%batargmentonly%}=={true} (set batargmentonly= &cls&exit /b)
goto hazime


:fulldebug
set fulldebugsetvariable=0null0
set fulldebugvariableapply=0null0
title ^(ƒfƒoƒbƒO—p^) ƒJ[ƒ\ƒ‹•Ï”
echo.
echo fulldebug ‚ğ‹N“®‚µ‚Ä‚¢‚Ü‚·...
powershell -command "&{$h=Get-Host;$w=$h.UI.RawUI;$s=$w.BufferSize;$s.height=150;$w.BufferSize=$s;}"
cls
:fulldebugtypevariable
set fulldebugsetvariable=0null0
set fulldebugvariableapply=0null0
set
set /p fulldebugsetvariable=Enter the variable to change :
if {%fulldebugsetvariable%}=={back} (goto hazime)
if {%fulldebugsetvariable%}=={exit} (goto hazime)
if {%fulldebugsetvariable%}=={help} (echo goto&echo set&echo help&echo back&pause&cls&set fulldebugsetvariable=0null0&goto fulldebugtypevariable)
if {%fulldebugsetvariable%}=={goto} (goto fulldebuggoto)
if {%fulldebugsetvariable%}=={set} (goto fulldebugsetnew)
if {%fulldebugsetvariable%}=={0null0} (cls&goto fulldebugtypevariable)
if {%fulldebugsetvariable%}=={allcommandlock} (echo you cant chenge this variable, becouse this variable is locked.&pause&cls&goto fulldebugtypevariable)
if not defined %fulldebugsetvariable% (echo %fulldebugsetvariable% is not exist. please type exist variable or create it. &pause&cls&goto fulldebugtypevariable)
set /p fulldebugvariableapply=%fulldebugsetvariable%^=
if {%fulldebugvariableapply%}=={back} (goto fulldebugerrorsetnew1)
if {%fulldebugvariableapply%}=={0null0} (goto fulldebugerrorsetvariable1)
set %fulldebugsetvariable%=%fulldebugvariableapply%
echo %fulldebugsetvariable%^=%fulldebugvariableapply% chenged.
pause
cls
goto fulldebugtypevariable

:fulldebuggoto
set fulldebugsetvariable=0null0
set /p fulldebugsetvariable=goto where ?:
if {%fulldebugsetvariable%}=={back} (goto fulldebugtypevariable)
if {%fulldebugsetvariable%}=={allcommandsmain} (echo you cant goto this lavel, becouse this variable is locked.&pause&cls&goto fulldebuggoto)
if {%fulldebugsetvariable%}=={exit} (goto fulldebugtypevariable)
if {%fulldebugsetvariable%}=={0null0} (cls&goto fulldebuggoto)
goto %fulldebugsetvariable%

:fulldebugsetnew
cls
set fulldebugsetvariable=0null0
set fulldebugvariableapply=0null0
set /p fulldebugsetvariable=Enter the currently undefined variable you wish to create.  :
if defined %fulldebugsetvariable% (echo %fulldebugsetvariable% is already exist. please type not exist variable. &pause&cls&goto fulldebugsetnew)
if {%fulldebugsetvariable%}=={back} (goto fulldebugtypevariable)
if {%fulldebugsetvariable%}=={allcommandlock} (echo you cant chenge this variable, becouse this variable is locked.&pause&cls&goto fulldebugsetnew)
if {%fulldebugsetvariable%}=={0null0} (echo please enter something.&pause&cls&goto fulldebugsetnew)
:fulldebugsetnewenter
set /p fulldebugvariableapply=%fulldebugsetvariable%^=
if {%fulldebugvariableapply%}=={0null0} (echo You cannot create a variable with no content. &pause&cls&goto fulldebugsetnewenter)
if {%fulldebugvariableapply%}=={back} (goto fulldebugerrorsetnew1)
set %fulldebugsetvariable%=%fulldebugvariableapply%
echo variable %fulldebugsetvariable% has created with %fulldebugvariableapply% (%fulldebugsetvariable%^=%fulldebugvariableapply%).
pause
cls
goto fulldebugtypevariable

:fulldebugerrorsetnew1
set /p fulldebugsetvariableerrornew=Exit menu or set as variable? (1 or 2) : 
if {%fulldebugsetvariableerrornew%}=={1} (goto fulldebugtypevariable)
if {%fulldebugsetvariableerrornew%}=={2} (goto fulldebugerrorsetnew1if)
:fulldebugerrorsetnew1if
set %fulldebugsetvariable%=back
echo variable %fulldebugsetvariable% has created with %fulldebugvariableapply% (%fulldebugsetvariable%^=%fulldebugvariableapply%).
pause
cls
goto fulldebugtypevariable


:fulldebugerrorsetvariable1
set /p fulldebugsetvariableerrorif=do you really want delete %fulldebugsetvariable%? (y or n)
if {%fulldebugsetvariableerrorif%}=={y} (
set %fulldebugsetvariable%=
echo %fulldebugsetvariable% has deleted.
pause
cls
goto fulldebugtypevariable
)
if {%fulldebugsetvariableerrorif%}=={n} (goto fulldebug)

:littleeasteregg
if {%hazimeeaster%}=={true} (goto hazimemenu)
cls&pause&echo hello! this is easteregg!&pause&cls&title ‰B‚µ‹@”\‚ÅƒƒCƒ“ƒƒjƒ…[‚Æƒo[ƒWƒ‡ƒ“î•ñ‚Ì•”•ª‚Åƒrƒ‹ƒhƒiƒ“ƒo[‚ª•\¦‚³‚ê‚é‚æ‚¤‚É‚È‚Á‚½&echo and bye!&pause&cls&set hazimeeaster=true&goto hazime


:Lock
rundll32.exe user32.dll, LockWorkStation
if {%looplockdownhorroreaster%}=={true} (goto lock)
goto reboot

:exit
pause
:reboot

rem 3500 line code, wtf?
rem I still dont have any idea why i did make it
rem uh anyway finally end of line