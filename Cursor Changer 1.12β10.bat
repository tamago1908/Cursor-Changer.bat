@echo off
setlocal

rem Cursor Changer by tamago_1908

rem ÉTÉCÉYÇÃéwíË
mode con: cols=75 lines=25

rem ÉÅÉÇ cd %~dp0 &start %~n0%~x0&exit trueäàópÇ≈Ç´ÇÈÇ©Ç‡ (batçƒãNìÆ)
rem ÉRÅ[ÉhÇÃç≈èâÇ…ì¸ÇÍÇÍÇÈèàóùÇÃêîÇÕå¿ÇÁÇÍÇƒÇ¢Ç‹Ç∑(ì¸ÇÍÇ∑Ç¨ÇÈÇ∆ãNìÆÇ™íxÇ≠Ç»ÇÈâ¬î\ê´) (íxÇ≠Ç»Ç¡ÇΩ (éËíxÇÍ(âΩÇ∆Ç©Ç»Ç¡ÇΩ)) )
rem ÉrÉãÉhÉiÉìÉoÅ[Ç∆ÉoÅ[ÉWÉáÉìÇÃãLì¸ÇÕïKÇ∏ÇµÇƒÇ≠ÇæÇ≥Ç¢ÅIÇ†Ç∆ÉAÅ[ÉJÉCÉuÇ…ì¸ÇÍÇÈÇÃÇñYÇÍÇ∏Ç…ÅI
rem ÇªÇµÇƒç≈ãﬂÅAÇ±ÇÃÉoÉbÉ`èàóùÇ…âpåÍÇëΩÇ≠ä‹ÇﬂÇÈÇÊÇ§Ç…ÇµÇƒÇ¢ÇÈÅBÇ»Ç∫Ç»ÇÁÅAè´óàìIÇ…Ç±ÇÃÉoÉbÉ`èàóùÇñ|ñÛÇ∑ÇÈÇ±Ç∆Ç…Ç»Ç¡ÇΩéûÅAì˙ñ{åÍÇ™ëΩÇ¢Ç∆ñ ì|ÇæÇ©ÇÁÅB
title Cursor Changer
rem VER v1.12É¿10
set batver=1.12É¿10
set batbuild=build 42
set hazimeeaster=false
set firststartbat=no
rem êßçÏÇ…Ç†ÇΩÇ¡ÇƒégópÇµÇΩÉ\ÉtÉg windows notepad v10.2103.12.0 égópÉtÉHÉìÉgÅ@Nirmala UIÇÃëæéö
rem 2021îN12åé09ì˙Ç©ÇÁ windows notepad v10.2110.64.0 Nirmala UIÇÃëæéö
rem ÉÅÉCÉì Visual Studio Code
rem ÉfÉoÉbÉNóp Visual bat

if {%1}=={devmode} (goto developermenu)
if {%1}=={help} (goto batstarthelp)
if {%1}=={bypsvck} (echo winver check is bypassed.&timeout 3 &goto batstart)
if {%1}=={bypsloadsg} (echo setting load is bypassed.&timeout 3 &bootbatnow=no&goto hazimemenuskipboot)
if {%1}=={bypsdisexit} (echo disableexitbutton is bypassed.&timeout 3 &set disableexit=false) else set disableexit=true
if {%1}=={enablesimpleboot} (title simpleboot is enabled.&set simpleboot=true)
if {%1}=={bypsadm} (echo getadmin is bypassed.&timeout 3 &set adminbypass=true) else set adminbypass=false

rem windowsÉoÅ[ÉWÉáÉìîªíf
rem ÇøÇÂÇ¡Ç∆ïsãÔçáÇ†ÇÈÇ©Ç‡ÅBàÍïîÇÃÉoÅ[ÉWÉáÉìÇ≈ÇÕê≥èÌÇ…ÉtÉBÉãÉ^Å[Ç™ìÆçÏÇµÇ»Ç¢â¬î\ê´Ç™Ç†ÇÈÅB
:batbootcheckwinver
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
if {%errorlevel%}=={0} (set windowsverfilter=windows8.1à»ëO&goto batbootcheckwinverbad) else set windowsverfilter=windows vistaà»ëOÅiå√Ç∑Ç¨Ç‹Ç∑ÅIÅj goto batbootcheckwinverbad

:batbootcheckwinverbad
ver | find /i "Version 6.1" > nul
if {%errorlevel%}=={0} (set windowsverfilter=windows7)
ver | find /i "Version 6.2" > nul
if {%errorlevel%}=={0} (set windowsverfilter=windows8)
ver | find /i "Version 6.3" > nul
if {%errorlevel%}=={0} (set windowsverfilter=windows8.1)
echo Your version of windows (%windowsverfilter%) does not support Cursor Changer!
pause
cls
echo Cursor Changer is compatible with windows 10 version 1511 or later.
pause
cls
echo Older versions (e.g., windows 7, windows 8, 8.1, etc.) are not supported.
pause
cls
echo Please update your windows, or use Cursor Changer version 1.12 earlier.
pause
exit

:batbootcheckwinversafe
rem ñ{èàóù (ïœêîÇÃÉZÉbÉgÇ∆Ç©ÅAëOíiäK)
set bootbatnow=yes
set exitbuttondisabled=false
rem ä«óùé“å†å¿Çï€óLÇµÇƒÇ¢ÇÈÇ©ÇÃämîF
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
rem ä«óùé“å†å¿Çï€óLÇµÇƒÇ¢ÇÈèÛë‘Ç≈ÅAexitÉ{É^ÉìÇfalseÇ…Ç∑ÇÈÇ∆ÅAãHÇ…ÉEÉCÉãÉXÇ∆ÇµÇƒåüèoÇ≥ÇÍÇƒÇµÇ‹Ç§èÍçáÇ™Ç†ÇÈÅBÇ»ÇÃÇ≈ÅAä«óùé“å†å¿ï€óLéûÇ∆ÅAdisableexitÇ∆Ç¢Ç§ïœêîÇ™falseÇÃèÍçáÇÕÅAèàóùÇÉoÉCÉpÉXÇµÇƒÇ¢ÇÈÅB
if {%disableexit%}=={false} (goto batbootdisabledexitbutton)
if {%errorlevel%} NEQ {0} (set disableexit=false) else (set disableexit=true)

:batbootdisableexitbutton
if {%disableexit%}=={true} (goto batbootdisabledexitbutton)
rem startid~powershell Ç‹Ç≈ÇÃÉRÅ[ÉhÇÕÇ∏ÇÁÇµÇƒÇÕÇ¢ÇØÇ»Ç¢Å@ÇªÇÍà»ëOÇ©ÇªÇÍà»å„Ç»ÇÁok
:: StartID1908
call :getLineNumber startLine StartID1908 0
goto batbootdisableexitbuttonendcode
:batbootdisableexitbuttoncodestart
set /a startline=startline+4&set /a endline=endline-3
title booting up cursor changer...&echo Please wait a while.&powershell -NoProfile -ExecutionPolicy Unrestricted "$s=[System.Management.Automation.ScriptBlock]::create((Get-Content \"%~f0\" -TotalCount $env:endline|Where-Object{$_.readcount -gt $env:startline }) -join \"`n\");&$s" %*&goto batbootdisabledexitbutton
#èIóπÉ{É^ÉìÇñ≥å¯âª
#Calling user32.dll methods for Windows and Menus
$code = @'
using System;
using System.Runtime.InteropServices;

namespace CloseButtonToggle {

// ä÷êîÇÃêÈåæ

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

// êÈåæèIóπ

// ïKóvÇ»à¯êîÇÃê›íË
   const int GWL_STYLE = -16;
   const int WS_MAXIMIZEBOX = 0x00010000;

   const uint SC_MAXIMIZE = 0xF030; 
   const uint MF_BYCOMMAND = 0;

// ÉÅÉCÉìÇÃèàóù
internal static void ChangeCurrentState(bool state) {
     IntPtr hWnd = GetConsoleWindow();
     int style = GetWindowLong(hWnd, GWL_STYLE);
     if (state) {
       style |= WS_MAXIMIZEBOX; // ç≈ëÂâªÉ{É^ÉìÇóLå¯Ç…Ç∑ÇÈ
     } else {
       style &= ~WS_MAXIMIZEBOX; // ç≈ëÂâªÉ{É^ÉìÇñ≥å¯Ç…Ç∑ÇÈ
     }
     SetWindowLong(hWnd, GWL_STYLE, style);
     DrawMenuBar(hWnd);
   }
 }
// ïœçXÇÃämîF
 public static class Status {
   public static void Disable() {
     WinAPI.ChangeCurrentState(false); //ÉIÉìÇ…Ç∑ÇÈÇ»ÇÁ 'true' Ç…ïœçX
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

rem ñ{èàóù
:batbootdisabledexitbutton
set startline=&set endline=&set exitbuttondisabled=
cd /d %HOMEDRIVE%%HOMEPATH%
find "fastboot=true" CursorChangerSettings.txt
cls
if {%errorlevel%}=={0} (goto batstart) else (goto nofastboot)
:nofastboot

rem Ç¢ÇÁÇ»Ç¢èÓïÒÇÃóÖóÒ

rem ###################
rem #    HELLOÅ@WORLD    #  
rem ###################
rem ï\é¶100%ÅAÉtÉãÉXÉNÉäÅ[ÉìêÑèßÅ@ÇªÇÍà»äOÇÕï\é¶ÇÃï€èÿÇ»Çµ


rem ÇøÇ»Ç›Ç…èÓïÒ
rem Ç±ÇÃÉoÉbÉ`ÉtÉ@ÉCÉãÇÃäJî≠Ç™énÇ‹Ç¡ÇΩÇÃÇÕ2021îNÇÃ10åé8ì˙(ã∞ÇÁÇ≠)
rem äJî≠ÇÃìÆã@ÇÕÅAÉJÅ[É\ÉãÇèâä˙âªÇ≥ÇÍÇΩÇ∆Ç´Ç…Ç¢ÇøÇ¢ÇøïœÇ¶ÇÈÇÃÇ™ÇﬂÇÒÇ«Ç≠Ç≥Ç¢Ç©ÇÁÉoÉbÉ`ÉtÉ@ÉCÉãÇ≈é©ìÆâªÇµÇÊÇ§Ç∆ÇµÇΩÇ©ÇÁÅBÇæÇ™ÇªÇÃÇ†Ç∆Ç¢ÇÎÇ¢ÇÎã@î\Ç™ëùÇ¶ÇƒÇ¢Ç¡Çƒç°ÇÃèÛë‘Ç…Ç»Ç¡ÇΩÇÃÇ≈Ç†ÇÈÅB
rem ÉoÅ[ÉWÉáÉì2.0.0Ç‹Ç≈ÇÕÉJÅ[É\ÉãÉuÉâÉbÉNÇ∆Ç¢Ç§ñºëOÇæÇ¡ÇΩ
rem äJî≠íÜä˙Ç…Ç»Ç¡ÇƒCursor Changer(çï)Ç…ïœçXÇ≥ÇÍÇΩ
rem äJî≠å„ä˙Ç…Ç»Ç¡ÇƒCursor ChangerÇÃÇ›Ç…ïœçXÇ≥ÇÍÇΩ
rem ç≈èâÇÃÉoÅ[ÉWÉáÉìÇ™1.0.1ÇæÇ¡ÇΩ
rem ñºëOÇÃïœçXÇ™Ç≥ÇÍÇΩÉoÅ[ÉWÉáÉìÇÕ2.0.0Ç∆2.5.0beta5
rem ÉoÅ[ÉWÉáÉì2.0.0Ç≈ÇÕÉfÉtÉHÉãÉgÇ…ñﬂÇπÇÈã@î\Ç™í«â¡
rem ÉfÉtÉHÉãÉgÇ…ñﬂÇ∑ã@î\ÇÕÉoÅ[ÉWÉáÉì1.5.0Ç†ÇΩÇËÇ©ÇÁÇŸÇÃÇﬂÇ©ÇµÇƒÇ¢ÇΩ
rem ÉoÅ[ÉWÉáÉì2.1.xÇ©ÇÁNoFB NonFIxBugÇ∆Ç¢Ç§ÉoÅ[ÉWÉáÉìÇ™í«â¡Ç≥ÇÍÇΩÇ™Ç∑ÇÆÇ…çÌèúÇ≥ÇÍÇΩ
rem Cursor ChangerÇ…ÇÕÉoÅ[ÉWÉáÉì Dev.1Ç∆Ç¢Ç§Ç‡ÇÃÇ™Ç†Ç¡ÇΩ
rem ÉoÅ[ÉWÉáÉìDev.1ÇÕÉoÅ[ÉWÉáÉì2.4.xÇ…ëäìñ
rem ÉoÅ[ÉWÉáÉì2.4.xÇ‹Ç≈ÇÕÇ‡ÇÃÇ∑Ç≤Ç≠ÉoÅ[ÉWÉáÉìÇÃè„ÇËï˚Ç™ëÅÇ©Ç¡ÇΩ
rem àÍî‘äJî≠Ç…éûä‘Ç™Ç©Ç©Ç¡ÇΩÇÃÇÕÉoÅ[ÉWÉáÉì1.10Ç≈Ç†ÇÈÅB
rem ì‡óeÇ™ÇÆÇøÇ·ÇÆÇøÇ·Ç»ÇÃÇÕÇ‡Ç∆Ç‡Ç∆êlÇ…å©ÇπÇÈÇ¬Ç‡ÇËÇ™Ç»Ç©Ç¡ÇΩÇ©ÇÁÇ≈Ç†ÇÈÅB
rem Cursor ChangerÇ…ÇÕ2022îN2åé22ì˙22éû22ï™22ïbÇ…äÆê¨ÇµÇΩÉoÅ[ÉWÉáÉìÇ™Ç†ÇÈÅBÇªÇÍÇ™Cursor Changer1.7aÇæÅB

rem ÉoÅ[ÉWÉáÉìÉAÉbÉvèÓïÒ
rem ÉoÅ[ÉWÉáÉì2.5.0à»ëOÇÃÉnÅ[ÉWÉáÉìóöóÇÕè¡é∏ÇµÇƒÇ¢Ç‹Ç∑
rem ÉoÅ[ÉWÉáÉì2.5.0 beta1Ç≈Ç∑Ç◊ÇƒÇÃïœçXÇÉfÉtÉHÉãÉgÇ…ñﬂÇ∑ã@î\Ç™í«â¡
rem ÉoÅ[ÉWÉáÉì2.5.0 beta5Ç©ÇÁñºëOÇ™Cursor Changer 1.0betaÇ…ïœçX
rem ÉoÅ[ÉWÉáÉì2.5.0 beta7 (1.0beta2)Ç©ÇÁDogcheckÇ∆Ç¢Ç§ÉlÉ^ã@î\Ç™í«â¡Ç≥ÇÍÇΩ
rem ÉoÅ[ÉWÉáÉì2.5.0 beta9 (1.0beta4)Ç©ÇÁDogcheckÇ…ÉAÉbÉvÉfÅ[ÉgÇ™ì¸ÇËÅAìØÇ∂ñºëOÇÃÉeÉLÉXÉgÉtÉ@ÉCÉãÇçÏÇÈÇæÇØÇ≈ÇÕâÒîÇ™Ç≈Ç´Ç»Ç¢ÇÊÇ§Ç…Ç»Ç¡ÇΩ
rem ÉoÅ[ÉWÉáÉì1.0(2.5.0 beta10)Ç©ÇÁê≥éÆÇ…ÉJÅ[É\ÉãïœÇ¶ÇÃç™ä≤ìIÇ»ïîï™Ç™äÆê¨ÅAÇ±ÇÍÇ…î∫Ç¢Cursor ChangerÇÃÉoÅ[ÉWÉáÉìÇÕ1.0Ç∆Ç»Ç¡ÇΩ
rem ÉoÅ[ÉWÉáÉì1.1 (2.5.0beta11)Ç©ÇÁalldefé¸ÇËÇÃÉRÉ}ÉìÉhÇÃÉ~ÉXÇ…ÇÊÇËï™äÚÇ™Ç≈Ç´ÇƒÇ¢Ç»Ç©Ç¡ÇΩÉoÉOÇ™âè¡Ç≥ÇÍÅAâΩÇÊÇËï™äÚÇ≤Ç∆ÇÃÉNÉäÉAÇ™Ç»Ç≠Ç»ÇËÅAÇÊÇËÉVÅ[ÉÄÉåÉXÇ…ï™äÚÇ∑ÇÈÇÊÇ§Ç…Ç»Ç¡ÇΩÅB
rem ÉoÅ[ÉWÉáÉì1.2 (2.5.0beta13)Ç©ÇÁÉfÉtÉHÉãÉgÇ…ñﬂÇ∑ÅAÇ‡ÇµÇ≠ÇÕçïêFÇ…ïœçXÇ∑ÇÈç€ÇÃï∂éöÇ™ïœçXÇ≥ÇÍÇΩÅB
rem ÉoÅ[ÉWÉáÉì1.3(2.5.0beta14)Ç©ÇÁÅAèââÒÇÃïœçXÇ≈Ç¢Ç¢Ç¶ÇÇâüÇµÇΩÇ∆Ç´Ç…ÅAFIrstCursorïœçXÇ∆Ç¢Ç§Ç‡ÇÃÇ™çÌèúÇ≥ÇÍÇÈã@î\Ç™Ç∂Ç¡ÇªÇ§Ç≥ÇÍÅAÇªÇÍÇ…â¡Ç¶ÇƒÅAÉCÅ[ÉXÉ^Å[ÉGÉbÉOÇ…ÇøÇÂÇ¡Ç∆ÇµÇΩêVã@î\Ç™í«â¡ÅB
rem ÉoÅ[ÉWÉáÉì1.4(ãå2.5.0beta15)Ç©ÇÁÅAÇ¬Ç¢Ç…äJî≠ìñèâÇ©ÇÁìØÇ∂ÇæÇ¡ÇΩã@î\ÇëIëÇ∑ÇÈïîï™Ç™ïœçXÇ≥ÇÍÅAÇªÇÍÇ…î∫Ç¢ãåÉoÅ[ÉWÉáÉìï\ãLÇ™Ç»Ç≠Ç»ÇËÅAñ{ìñÇÃà”ñ°Ç≈ÇÃver2.5.0Ç…Ç»Ç¡ÇΩÅB
REM ÉoÅ[ÉWÉáÉì1.5Ç©ÇÁÅAí¥ëÂå^ÇæÇ∆åæÇ¡ÇƒÇ‡Ç¢Ç¢ÇŸÇ«ÇÃÉAÉbÉvÉfÅ[ÉgÇ™óàÇΩÅB

rem è⁄ÇµÇ≠åæÇ§Ç∆ÅAÇ‹Ç∏ê›íËÉÅÉjÉÖÅ[ÇÃí«â¡ÅAÇªÇÍÇ…î∫Ç¢ÉJÅ[É\ÉãÇïœçXÇµÇΩç€ÇÃçƒãNìÆÇÃämîFÇäÆëSÇ…OFFÇ…Ç∑ÇÈê›íËÅAÉfÉoÉbÉOÉÇÅ[ÉhÇÃON/OFFÇ™í«â¡Ç≥ÇÍÇΩÅB
rem ÇªÇµÇƒéüÇ…ÅAÉzÉèÉCÉgÉÇÅ[ÉhÇÃí«â¡ÅBcmdè„ÇÃÉeÅ[É}ÇÉzÉèÉCÉgäÓí≤ÇÃÉfÉUÉCÉìÇ…ïœçXÇ≈Ç´ÅAÇµÇ©Ç‡ê›íËÇµÇΩÇ±Ç∆ÇãLò^Ç∑ÇÈã@î\Ç‡Ç†ÇËÅAãNìÆéûÇ…é©ìÆìIÇ…ÉzÉèÉCÉgÉÇÅ[ÉhÇ…Ç∑ÇÈÇ±Ç∆Ç™Ç≈Ç´ÇÈÇ∆Ç¢Ç§ã@î\Ç‡ìãç⁄ÇµÇƒÇ¢ÇÈÅB
rem ÇªÇµÇƒëΩè≠ÇÃÉoÉOèCê≥ÅAåÎéöíEéöÇèCê≥ÇµÇΩÅB

rem ÉoÅ[ÉWÉáÉì1.5a çƒãNìÆÇÃîªï Ç…î∫Ç§ï∂éöïœçXÇ∆É_Å[ÉNÉeÅ[É}Ç…ñﬂÇ∑ç€ÇÃã@î\Çîpé~ó\íËÇÃï∂Çë}ì¸ÇµÇΩÅB
rem ÉoÅ[ÉWÉáÉì1.6 ç°âÒÇÃÉAÉbÉvÉfÅ[ÉgÇÕí¥ëÂå^ÇæÅB

rem è⁄ÇµÇ≠åæÇ§Ç∆ÅAÇ‹Ç∏èââÒãNìÆéûÇ…Cursor ChangerÇÃï∂éöÇ™ì¯êFÇ…ïœâªÇ∑ÇÈÇÊÇ§Ç»ã@î\Ç™í«â¡Ç≥ÇÍÅA
rem éüÇ…ÅAç≈èâÇÃâÊñ Ç≈ÉGÉìÉ^Å[ÉLÅ[Çí∑âüÇµÇµÇƒÇ¢ÇÈÇ∆ÇªÇÍÇåüímÇµÇƒÉÅÉbÉZÅ[ÉWÇ™ó¨ÇÍÇÈÇÊÇ§Ç»ã@î\Ç™í«â¡Ç≥ÇÍÅA
rem ÇªÇÃÇ‹ÇΩéüÇ…ÅAÉzÉèÉCÉgÉÇÅ[ÉhÇÃâÊñ Ç™ävêVÇ≥ÇÍÅAê›íËÉÅÉjÉÖÅ[Ç∆ìØÇ∂ÇÊÇ§Ç…Ç»Ç¡ÇΩÅBÇªÇÍÇ…î∫Ç¡ÇƒÉ_Å[ÉNÉeÅ[É}Ç…ñﬂÇ∑ç€ÇÃå¬ï ÇÃâÊñ Ç™è¡é∏ÇµÇΩÅB
rem ÇªÇµÇƒÉGÉìÉ^Å[ÉLÅ[í∑âüÇµÇåüímÇ∑ÇÈã@î\ÇÃí«â¡Ç…î∫Ç¡ÇƒÅAê›íËÉÅÉjÉÖÅ[Ç≈ÇªÇÃã@î\ÇÃfalseeeeeâªÇ™Ç≈Ç´ÇÈÇÊÇ§Ç…Ç‡Ç»Ç¡ÇΩÅB

rem ÉoÅ[ÉWÉáÉì 1.6a ÉzÉèÉCÉgÉÇÅ[ÉhÇ…ïœçXÇ™â¡Ç¶ÇÁÇÍÅAÉ_Å[ÉNÉÇÅ[ÉhÇ©ÉzÉèÉCÉgÉÇÅ[ÉhÇ©ÇåüèoÇµÅAÇªÇÍÇ…î∫Ç¢ï∂éöÇïœâªÇ≥ÇπÇÈã@î\Ç™í«â¡Ç≥ÇÍÅAëΩè≠ÇÃÉoÉOèCê≥Ç™çsÇÌÇÍÇΩÅB
rem ÉoÅ[ÉWÉáÉì 1.6b ê›íËÉÅÉjÉÖÅ[ÇÃéOî‘ñ⁄ÅAÉfÉoÉbÉOÉÇÅ[ÉhÇÃtruefalseâªÇÃÉÅÉjÉÖÅ[Ç…ÇøÇÂÇ¡Ç∆ÇµÇΩâ¸ó«Ç™â¡Ç¶ÇÁÇÍÇΩÅB
rem ÉoÅ[ÉWÉáÉì 1.7 ç°âÒÇÃÉAÉbÉvÉfÅ[ÉgÇ≈ÇÕÅAìdëÏã@î\Ç™í«â¡Ç≥ÇÍÅAÇøÇÂÇ¡Ç∆ÇµÇΩÉCÅ[ÉXÉ^Å[ÉGÉbÉOÇ™í«â¡Ç≥ÇÍÇΩÅBÇªÇµÇƒÅAHNYÇ∆Ç¢Ç§ï∂éöÇÕç°Ç≥ÇÁÇæÇ™çÌèúÇ≥ÇÍÇΩÅB
rem ÉoÅ[ÉWÉáÉì 1.7a ç°âÒÇÃÉAÉbÉvÉfÅ[ÉgÇÕÅAã@î\ëIëÇÃâÊñ ÇÃèáî‘Çã@î\Ç™ëùÇ¶ÇƒÇ´ÇΩÇ±Ç∆Ç…î∫Ç¢ÅAïœçXÇµÇΩÅBalldefÇÕê›íËÉÅÉjÉÖÅ[Ç…à⁄çsÇµÇΩÅB
rem ÇªÇµÇƒÅAÉoÅ[ÉWÉáÉìèÓïÒÇ…ëΩè≠ÇÃïœçXÅAâΩÇ‡ÇµÇ»Ç¢Ç…ÇøÇÂÇ¡Ç∆ÇµÇΩïœçXÇ™â¡Ç¶ÇÁÇÍÇΩÅB
rem ÉoÅ[ÉWÉáÉì 1.8 ç°âÒÇÃÉAÉbÉvÉfÅ[ÉgÇ≈ÇÕê›íËÉÅÉjÉÖÅ[Ç…ÇøÇÂÇ¡Ç∆ÇµÇΩïœçXÇ™â¡Ç¶ÇÁÇÍÅAê›íËÇÃê‡ñæÇ∆åªç›ÇÃê›íËÇ™trueÇ©falseÇ©ÇÉVÅ[ÉÄÉåÉXÇ…å©ÇÍÇÈÇÊÇ§Ç…Ç»Ç¡ÇΩÅB
rem ÇªÇµÇƒç°âÒÇÃÉAÉbÉvÉfÅ[ÉgÇ≈ÇÕ2048Ç∆Ç¢Ç§ÉQÅ[ÉÄÇ™ìãç⁄ó\íËÇæÇ¡ÇΩÇÃÇæÇ™ÅAäJî≠íÜä˙Ç…ÉZÅ[Éuã@î\ä÷òAÇ…ãZèpìIÇ»êßñÒÇ∆ÉoÉOÇ™Ç†ÇÈÇ±Ç∆Ç™î≠äoÇµÅAäJî≠Ç™ìÔçqÇµÇΩÇΩÇﬂÅA
rem ÇªÇÃã@î\í«â¡ÇÕñ≥ä˙å¿Ç…âÑä˙Ç…Ç»Ç¡ÇΩÅB
rem ÉoÅ[ÉWÉáÉì1.9 ç°âÒÇÃÉAÉbÉvÉfÅ[ÉgÇÕÅACursorChangerSettingsÇÃç\ï∂ÇïœçXÇµÅAfalseÇ©trueÇ©ÇïœçXÇ∑ÇÈÇæÇØÇ…ÇµÇΩÅBÇ±ÇÍÇ…ÇÊÇËâΩÇ™ÉIÉìÇ≈âΩÇ™ÉIÉtÇ©Ç™ÇÌÇ©ÇËÇ‚Ç∑Ç≠Ç»Ç¡ÇΩÅB
rem Ç‹ÇΩÅAç°âÒÇÃÉAÉbÉvÉfÅ[ÉgÇ…ÇÊÇ¡ÇƒÅAFIrstCursor.txtÇ…Ç‡dogcheckÇ™í«â¡Ç≥ÇÍÇΩÇÃÇ≈ÅAÇ‹Çüê›íËÉtÉ@ÉCÉãÇìríÜÇ≈çÌèúÇµÇΩÇËÇ»ÇÒÇƒÇ±Ç∆Ç™ÇµÇ…Ç≠Ç≠Ç»Ç¡ÇΩÅB

rem ÉoÅ[ÉWÉáÉì1.10 ç°âÒÇÃÉAÉbÉvÉfÅ[ÉgÇÕCursor Changeréjè„ç≈Ç‡BIGÇ»ÉAÉbÉvÉfÅ[ÉgÇæÅBÇ‹Ç∏ÅAê›íËÉÅÉjÉÖÅ[Ç∆ç≈èâÇÃÉÅÉjÉÖÅ[Ç…UIÇ™í«â¡Ç≥ÇÍÅAÉÅÉjÉÖÅ[ÇÃêÆóùÇ™çsÇÌÇÍÅAÉzÉèÉCÉgÉÇÅ[ÉhÇ∆AlldefÇ™à⁄ìÆÇµÇΩÅBAlldefÇ…ÇÕé©å»è¡ãéã@î\Ç™í«â¡Ç≥ÇÍÅAÉAÉìÉCÉìÉXÉgÅ[ÉãÉÅÉjÉÖÅ[Ç™ééå±ìIã@î\Ç∆ÇµÇƒêVÇΩÇ…é¿ëïÇ≥ÇÍÇΩÅBÇªÇµÇƒèââÒãNìÆÉÅÉbÉZÅ[ÉWÇ™ïœçXÇ≥ÇÍÅAåyÇ≠ÉAÉjÉÅÅ[ÉVÉáÉìÇ∑ÇÈÇÊÇ§Ç…Ç»ÇËÅAÉÅÉbÉZÅ[ÉWÇ‡ïœçXÇ≥ÇÍÇΩÅBÇªÇµÇƒÅACursor ChangerÇÃèâä˙ÇÃÉoÅ[ÉWÉáÉìÇ©ÇÁÇ†Ç¡ÇΩÉJÅ[É\ÉãÇïœÇ¶ÇÈÉÅÉjÉÖÅ[Ç™Ç»ÇÒÇ∆ìùçáÇ≥ÇÍÅAîíêFÇ∆çïêFÇé©ìÆìIÇ…îFéØÇµÇƒÅAëIëÇµÇ»Ç≠ÇƒÇ‡é©ìÆìIÇ…ïœçXÇ≥ÇÍÇÈÇÊÇ§Ç…Ç»Ç¡ÇΩÅBÇªÇµÇƒÇøÇÂÇ¡Ç∆ÇµÇΩâBÇµóvëfÇ‡í«â¡Ç≥ÇÍÇΩÅBÇ‹ÇΩÅAê›íËÇ‡é©ìÆìIÇ…ãLì¸Ç≥ÇÍÇÈÇÊÇ§Ç…Ç»ÇËÅAÉoÉOÇ‚åÎéöíEéöÇ‡íºÇ≥ÇÍÇΩÅBÇªÇÍà»äOÇ…Ç‡ÇΩÇ≠Ç≥ÇÒÇÃïîï™Ç™ïœçXÇ≥ÇÍÅAÇ‡ÇÕÇ‚ï ï®Ç…Ç»Ç¡ÇΩÅB
rem ÉoÅ[ÉWÉáÉì1.10a ÇøÇÂÇ¡Ç∆ÇµÇΩèCê≥Ç∆ÅAãNìÆéûÇ…èàóùíÜÇ∆ãNìÆíÜÇ∆Ç¢Ç§ÉÅÉbÉZÅ[ÉWÇ™ï\é¶Ç≥ÇÍÇÈÇÊÇ§Ç…Ç»ÇËÅAÇÌÇ©ÇËÇ‚Ç∑Ç≠Ç»Ç¡ÇΩÅB

rem ÉoÅ[ÉWÉáÉì1.11 ç°âÒÇÃÉAÉbÉvÉfÅ[ÉgÇÕÅAéÂÇ…ê›íËÇ∆ãNìÆä÷åWÇÃì‡ïîç\ë¢Ç™ëÂïùÇ…ïœÇÌÇËÅAä»íPÇ…åæÇ§Ç∆ç°Ç‹Ç≈ÇÕÅA"Ç∆ÇËÇ†Ç¶Ç∏ëSïîéÊÇÈ"ç\ë¢Ç©ÇÁÅA"ÇŸÇµÇ¢Ç∆Ç´Ç…éÊÇÈ"ç\ë¢Ç…Ç»Ç¡ÇΩÇ®Ç©Ç∞Ç≈ÅAëSëÃìIÇ»ÉåÉXÉ|ÉìÉXÇ™å¸è„ÇµÇΩÅBÇªÇÍÇ∆ÅAÇøÇÂÇ¡Ç∆ÇµÇΩïœçXÇ™â¡Ç¶ÇÁÇÍÇΩÅB(ÇøÇ»Ç›Ç…ÅAÇ±ÇÃã@î\ÇÃé¿ëïÇ…ÇÕÇ∆ÇƒÇ‡ãÍòJÇµÇΩÅB)
rem ÉoÅ[ÉWÉáÉì1.11a dogcheckÇÃAAïˆÇÍÇ∆ÅAê›íËÇ≈ê›íËÇïœçXÇµÇΩå„Ç…reloadÇÇ∑ÇÈÇ∆âiâìÇ…ÉçÅ[ÉhÇµë±ÇØÇƒÇµÇ‹Ç§ïsãÔçáÇèCê≥ÅB

rem ÉoÅ[ÉWÉáÉì1.12
rem

rem ÉxÅ[É^î≈ÇÃêiíª

rem ver1.6
rem ÉoÅ[ÉWÉáÉì1.6Éø 1.6ÇÃÉøÉoÅ[ÉWÉáÉìÅBê›íËÇÃ3î‘ñ⁄ÅAÉfÉoÉbÉOÉÇÅ[ÉhÇÃóìÇÃã@î\Ç™ëùÇ¶ÇΩÅB
rem ÉoÅ[ÉWÉáÉì1.6É¿1 1.6ÇÃÉxÅ[É^î≈ÅBç°Ç‹Ç≈åáÇØÇƒÇ¢ÇΩê›íËÇÃ2î‘ñ⁄Ç™äÆê¨ÇµÇΩÅB
rem ÉoÅ[ÉWÉáÉì1.6É¿2 1.6ÇÃÉxÅ[É^î≈2ÅBê›íËÇÃìÒî‘ñ⁄Ç…Ç†Ç¡ÇΩèdëÂÇ»ÉoÉOÇèCê≥ÇµÇΩÅB(setting3Ç∆É^ÉCÉvÉ~ÉXÇ≈ä±è¬,adminonoffÇ∆ä÷êîÇì¸óÕÉ~ÉX)
rem ÉoÅ[ÉWÉáÉì1.6É¿2 ÉoÅ[ÉWÉáÉìãKë•Ç™ÉxÅ[É^î≈å¿ÇËïœçXÇ≥ÇÍçXêVÇµÇΩì˙Çí«â¡Ç∑ÇÈÇ±Ç∆Ç∆Ç»Ç¡ÇΩÅB
rem ÉoÅ[ÉWÉáÉì1.6É¿3 1.6ÇÃÉxÅ[É^î≈3ÅBèââÒãNìÆéûÇ…ÉçÉSÇ™ì¯êFÇ≈åıÇÈââèoÇ™í«â¡Ç≥ÇÍÇΩÅBÇøÇ»Ç›Ç…Ç‡Ç§Ç∑ÇÆ1.6Ç™ê≥éÆÇ…äÆê¨Ç∑ÇÈÅB
rem ÉoÅ[ÉWÉáÉì1.6É¿3 1.6ÇÃÉxÅ[É^î≈ÇÃç≈èIÉoÅ[ÉWÉáÉìÅBéOÇ¬ÇŸÇ«ã@î\Ç™í«â¡Ç≥ÇÍÇΩÅB

rem ver1.10
rem ÉoÅ[ÉWÉáÉì 1.10É¿1 1.10ÇÃç≈èâÇÃÉxÅ[É^î≈.ÅBç≈èâÇÃâÊñ Ç∆ê›íËÉÅÉjÉÖÅ[ÇÃUIÇ™í«â¡Ç≥ÇÍÇΩÅB
rem ÉoÅ[ÉWÉáÉì 1.10É¿2 1.10ÇÃÉxÅ[É^î≈2ÅB ê›íËÉÅÉjÉÖÅ[Ç…ÉAÉjÉÅÅ[ÉVÉáÉìÇ™í«â¡Ç≥ÇÍÇΩÅB
rem ÉoÅ[ÉWÉáÉì 1.10É¿3 1.10ÇÃÉxÅ[É^î≈3ÅB ïœçXÇ™ìùçáÇ≥ÇÍÅAàÍÇ¬ÇÃÉÅÉjÉÖÅ[Ç≈îíêFÅAçïêFÇ…ïœçXÇ≈Ç´ÇÈÇÊÇ§Ç…Ç»Ç¡ÇΩÅBÇµÇ©ÇµÇ±ÇÍÇ…ÇÊÇ¡Çƒï°ècÇ™Ç»Ç≠Ç»Ç¡ÇΩÅB
rem ÉoÅ[ÉWÉáÉì 1.10É¿4 1.10ÇÃÉxÅ[É^î≈4ÅB ÉeÅ[É}ÇÃïœçXÇ™ê›íËÇ…à⁄çsÇ≥ÇÍÅAÇªÇÍÇ…î∫Ç¢è≠ÇµÉÅÉjÉÖÅ[Ç™ïœâªÇµÇΩÅB
rem ÉoÅ[ÉWÉáÉì 1.10É¿5 1.10ÇÃÉxÅ[É^î≈5ÅB alldefÇ…ééå±ìIÇæÇ™ÉAÉìÉCÉìÉXÉgÅ[Éãã@î\Ç™é¿ëïÇ≥ÇÍÅAÇ±ÇÃÉoÉbÉ`ÉtÉ@ÉCÉãÇ‡çÌèúÇ≥ÇÍÇÈÇÊÇ§Ç…Ç»Ç¡ÇΩÅBÇªÇµÇƒèââÒãNìÆéûÇÃÉÅÉbÉZÅ[ÉWÇ‡è≠ÇµïœçXÇ≥ÇÍëSëÃìIÇ»éøÇ™å¸è„ÇµÇΩÅB
rem ÉoÅ[ÉWÉáÉì 1.10É¿6 1.10ÇÃÉxÅ[É^î≈6ÅB Ç‹Çæñ¢äÆê¨ÇæÇ™èââÒãNìÆÉÅÉbÉZÅ[ÉWÇ™êiâªÇµÇΩÅBÇ‹ÇΩÅAÇ±ÇÃÉoÅ[ÉWÉáÉìÇ≈ÇÕtestÇ∆ì¸óÕÇ∑ÇÈÇ∆èââÒãNìÆÉÅÉbÉZÅ[ÉWÇ™ó¨ÇÍÇÈÅB(ê≥éÆî≈Ç≈ÇÕçÌèúó\íË)ÇªÇµÇƒÅAwindowÇÃÉTÉCÉYÇ™ïœçXÇ≥ÇÍÇΩÅB
rem ÉoÅ[ÉWÉáÉì 1.10É¿7 1.10ÇÃÉxÅ[É^î≈7ÅB èââÒãNìÆéûÇÃÉÅÉbÉZÅ[ÉWÇ™Ç∑Ç◊ÇƒïœçXÇ≥ÇÍÅAÇ‹ÇΩÉAÉjÉÅÅ[ÉVÉáÉìÇ‡í«â¡Ç≥ÇÍÇΩÅBÇªÇµÇƒeastereggÇ∆Ç¢Ç§ï®Ç™í«â¡Ç≥ÇÍÇΩ.....

rem ver1.12
rem ÉoÅ[ÉWÉáÉì 1.12É¿1 ç≈èâÇÃ1.12ÇÃÉxÅ[É^î≈ÅBâΩÇ‡ÇµÇ»Ç¢ É{É^ÉìÇ™ÅAèIóπÉ{É^ÉìÇ÷Ç∆ïœÇÌÇËÅAîzíuÇ™ìdëÏÇ∆ì¸ÇÍë÷ÇÌÇ¡ÇΩÅBÇªÇµÇƒê›íËÇÃåáëπÇåüímÇµÇƒèCïúÇ≈Ç´ÇÈã@î\Ç™í«â¡Ç≥ÇÍÇΩÅB
rem ÉoÅ[ÉWÉáÉì 1.12É¿2 1.12ÇÃÉxÅ[É^î≈2ÅBÉxÅ[É^1Ç≈é¿ëïÇ≥ÇÍÇΩê›íËÇÃêÆçáê´ÉeÉXÉgÇÃÉoÉOÇ™äÆ‡¯Ç…èCê≥ÅBÇªÇÍÇ…ÇÊÇËäÆ‡¯Ç…ìÆçÏÇ∑ÇÈÇÊÇ§Ç…Ç»Ç¡ÇΩÅBÇ‹ÇΩÅAê›íËÇì«Ç›çûÇﬁïîï™Ç™ç≈ìKâªÇ≥ÇÍÇΩÅBÇªÇµÇƒàÍïîÇÃÉoÉOÇ‚ïsóvÇ»ã@î\Ç™çÌèúÇ≥ÇÍÇΩÅB
rem ÉoÅ[ÉWÉáÉì 1.12É¿3 1.12ÇÃÉxÅ[É^î≈3ÅBÇ±ÇÃÉoÅ[ÉWÉáÉìÇ≈ÇÕç◊Ç©Ç¢ïîï™ÇÃèCê≥Ç™ÉÅÉCÉìÇ≈ÅAéÂÇ…setting dogcheckÇÃã@î\ägí£Ç∆ÉoÉOèCê≥ÅAdogcheckä÷òAÇÃã@î\ëùã≠Ç∆ÉoÉOèCê≥Ç™ÉÅÉCÉìÅBèââÒãNìÆéûÇÃã@î\êßå¿ÇÃí«â¡Ç‡Ç≥ÇÍÇΩÅB
rem ÉoÅ[ÉWÉáÉì 1.12É¿ setting ui deb ê›íËÇÃêVÇµÇ¢UIÇÃäJî≠ÇÃÇΩÇﬂÇæÇØÇ…çÏê¨Ç≥ÇÍÇΩì¡ï Ç»ÉoÅ[ÉWÉáÉìÅB
rem ÉoÅ[ÉWÉáÉì 1.12É¿4 1.12ÇÃÉxÅ[É^î≈4ÅBÇ±ÇÃÉoÅ[ÉWÉáÉìÇÕëÂó ÇÃã@î\í«â¡Ç™Ç»Ç≥ÇÍÇΩÅBéÂÇ…ê›íËÉÅÉjÉÖÅ[ÇÃUIÇ™ëÂïùÇ…ïœçXÇ≥ÇÍÅAê›íËÇ™ìÒÇ¬ÇÃcategoryÇ≈ï™ÇØÇÁÇÍÅAÇÊÇËíºä¥ìIÇ…ëÄçÏÇ≈Ç´ÇÈÇÊÇ§Ç…Ç»Ç¡ÇΩÅBÇªÇµÇƒÉAÉìÉCÉìÉXÉgÅ[ÉãÉÅÉjÉÖÅ[Ç‡êiâªÇµÅAã@î\Ç™í«â¡Ç≥ÇÍÇΩÅBê›íËÇÃhelpÇ‡ïœçXÇ≥ÇÍÅAdogcheckÇ‡êiâªÇµÅAê›íËÇÃdebugÇ™çÇë¨ãNìÆÅifastbootÅjÇ…ïœçXÇ≥ÇÍÅAãNìÆÉAÉjÉÅÅ[ÉVÉáÉìÇ…àÍÇ¬éÌóﬁÇ™ëùÇ¶ÅAÇªÇÍÇ…î∫Ç¢ãNìÆÉAÉjÉÅÅ[ÉVÉáÉìÇfalseeÇ…Ç≈Ç´ÇÈÇÊÇ§Ç…Ç»ÇËÅAÇªÇÍà»äOÇ…Ç‡ólÅXÇ»ïîï™Ç™ïœçXÇ≥ÇÍÇΩÅB
rem ÉoÅ[ÉWÉáÉì 1.12É¿5 1.12É¿5ÅBÇ±ÇÃÉoÅ[ÉWÉáÉìÇ≈ÇÕÅAê›íËÉÅÉjÉÖÅ[ÇÃê›íËÇìKópÇ∑ÇÈÉÅÉjÉÖÅ[Ç™â¸ó«Ç≥ÇÍÅAÇÊÇËÇÌÇ©ÇËÇ‚Ç∑Ç≠Ç»ÇËÅAalldefÇÃï™äÚïîï™ÇÃïsîıÇ™àÍïîèCê≥Ç≥ÇÍÇΩÅBÇªÇµÇƒÅAwindowsÇÃOSÉoÅ[ÉWÉáÉìÇåüímÇµÅAwindows 10 1551à»ëOÇ≈ÇÕìÆçÏïsî\Ç…Ç»Ç¡ÇΩÅBÇ‹ÇΩêVÇµÇ¢msgboxÇÃï\é¶ï˚ñ@ÇÃÉeÉXÉgÇ™eastereggÇ…ì±ì¸Ç≥ÇÍÅAÇªÇÍÇ…ÇÕpowershellÇ™égópÇ≥ÇÍÇƒÇ®ÇËÅAÇÊÇËà¿ëSÇ»ç\ë¢Ç…Ç»Ç¡ÇΩÅBÇªÇÍà»äOÇ…Ç‡ÅAfulldebugÇÃã@î\ëùã≠ÅAdebugópÇÃÉäÉ_ÉCÉåÉNÉgÉRÉ}ÉìÉhÇ™í«â¡Ç≥ÇÍÇΩÅB
rem ÉoÅ[ÉWÉáÉì 1.12É¿6 1.12É¿6ÅBÇ±ÇÃÉoÅ[ÉWÉáÉìÇÃÉAÉbÉvÉfÅ[ÉgÇÕî˜ÅXÇΩÇÈÇ‡ÇÃÇ≈ÅAÇªÇ±Ç‹Ç≈ëÂÇ´Ç»ïœâªÇÕÇ»Ç¢ÅBéÂÇ…ÉfÉoÉbÉOÉÇÅ[Éhä÷òAÇ™êiâªÇµÇΩÅBfulldebugÇÃã@î\Ç™ÇÊÇËëùÇ¶ÅAé©óRÇ…ïœêîÇïœçXÇ≈Ç´ÇÈÇÊÇ§Ç…Ç»Ç¡ÇΩÅBÇªÇµÇƒÅAcmdÇ≈Ç»Ç¢Ç∆ãNìÆÇ≈Ç´Ç»Ç≠Ç»Ç¡ÇΩÅB(ÇªÇÃç€Ç…ÇÕäJÇ´íºÇ∑ã@î\Ç‡Ç†ÇÈÅB)ÇªÇµÇƒÅAç◊Ç©Ç¢èCê≥Ç™Ç≥ÇÍÇƒÇ¢ÇÈÅB
rem ÉoÅ[ÉWÉáÉì 1.12É¿7 1.12É¿7ÅBÇ±ÇÃÉoÅ[ÉWÉáÉìÇÕÅAéÂÇ…ãNìÆâÊñ Ç™ïœçXÇ≥ÇÍÅAÇÊÇËÉOÉâÉtÉBÉJÉãÇ»ï\åªÇ…Ç»Ç¡ÇΩÅBÇªÇµÇƒîƒópê´Ç™ëùÇ¶ÇƒégÇ¢Ç‚Ç∑Ç≠Ç»Ç¡ÇΩÅBÇµÇ©ÇµÅAÇªÇÃîºñ ÅAãNìÆéûä‘Ç™î{ëùÇµÅAåªèÛÇ≈ÇÕè≠Çµïsà¿íËÇ»ÉAÉjÉÅÅ[ÉVÉáÉìÇæÅBÇµÇ©ÇµÇªÇÍà»äOÇ…Ç‡ÅAç◊Ç©Ç¢ïîï™ÇÃÉoÉOèCê≥Ç‚ÅAã@î\ëùã≠Ç™çsÇÌÇÍÇΩÅBÅialldefÇÃé©å»çÌèúã@î\ÇÃÉoÉOèCê≥Ç»Ç«Åj
rem ÉoÅ[ÉWÉáÉì 1.12É¿7a 1.12É¿7ÇÃÉ}ÉCÉiÅ[ÉAÉbÉvÉfÅ[ÉgÅBÇ±ÇÃÉoÅ[ÉWÉáÉìÇ≈ÇÕÅAç◊Ç©Ç¢ïîï™ÇÃèCê≥Ç™çsÇÌÇÍÇΩÅBä«óùé“å†å¿ÇÃê›íËÇ™trueÇÃç€Ç…åÎÇ¡ÇƒÉGÉâÅ[Ç™èoÇƒÇµÇ‹Ç§ñ‚ëËÇ∆ÅAfulldebugÇÃã@î\ëùã≠ÅAêVÇµÇ¢ãNìÆÉAÉjÉÅÅ[ÉVÉáÉìÇÃÉGÉâÅ[èàóùÇ™â¸ëPÇ≥ÇÍÇΩÅBÇªÇÍà»äOÇ…Ç‡åÎéöÇ™èCê≥Ç≥ÇÍÇΩÅBbuildî‘çÜÇÕ35Ç…ÅB
rem ÉoÅ[ÉWÉáÉì 1.12É¿7b 1.12É¿7aÇÃÉ}ÉCÉiÅ[ÉAÉbÉvÉfÅ[ÉgÅBÇ±ÇÃÉoÅ[ÉWÉáÉìÇ≈ÇÕÅAéÂÇ…ãNìÆÉAÉjÉÅÅ[ÉVÉáÉìÇÃïsãÔçáÇ™èCê≥Ç≥ÇÍÅAÇÊÇËÉGÉâÅ[Ç™ãNÇ´Ç…Ç≠Ç≠Ç»Ç¡ÇΩÅBïœêîÇÃèâä˙âªÇ‡çsÇÌÇÍÇÈÇÊÇ§Ç…Ç»ÇËÅAÇÊÇËà¿íËÇµÇΩÅBÇªÇµÇƒÅAãNìÆäÆóπéûÇ…ÉoÅ[Ç™ç≈å„Ç‹Ç≈çsÇ≠ÇÊÇ§Ç…Ç»Ç¡ÇΩÅBbuildî‘çÜÇÕ35.5Ç…ïœçXÅB
rem ÉoÅ[ÉWÉáÉì 1.12É¿7c 1.12É¿7bÇÃÉ}ÉCÉiÅ[ÉAÉbÉvÉfÅ[ÉgÅBÇ±ÇÃÉoÅ[ÉWÉáÉìÇ≈ÇÕÅA1.12É¿7bÇ…ä‹Ç‹ÇÍÇƒÇ¢ÇΩïœêîÇÃèâä˙âªÇ…Ç†Ç¡ÇΩÉoÉOÇ™èCê≥Ç≥ÇÍÅAÇÊÇËà¿íËÇ∑ÇÈÇÊÇ§Ç…Ç»Ç¡ÇΩÅBÇªÇµÇƒÇªÇÍà»äOÇ…Ç‡ä‹Ç‹ÇÍÇƒÇ¢ÇΩÉoÉOÇ‡èCê≥Ç≥ÇÍÇΩÇÃÇ≈ÅAéÂÇ…Ç±ÇÃÉoÅ[ÉWÉáÉìÇÕÉoÉOèCê≥ÉoÅ[ÉWÉáÉìÇ≈Ç†ÇÈÅBbuildî‘çÜÇÕ35.7Ç…ïœçXÅB
rem ÉoÅ[ÉWÉáÉì 1.12É¿7d 1.12É¿7cÇÃÉ}ÉCÉiÅ[ÉAÉbÉvÉfÅ[ÉgÅBÇ±ÇÃÉoÅ[ÉWÉáÉìÇ≈ÇÕÅAfulldebugÇÃã@î\Ç™ëùã≠Ç≥ÇÍÅAêVÇµÇ≠ïœêîÇçÏÇËÇ‚Ç∑Ç≠Ç»ÇËÅAçÌèúÇ‚ïœçXÇ»Ç«Ç‡ÇµÇ‚Ç∑Ç≠Ç»Ç¡ÇΩÅBÇªÇµÇƒeastereggÇ™ã•à´Ç…Ç»Ç¡ÇΩ....buildî‘çÜÇÕ35.8Ç…ïœçXÅB
rem ÉoÅ[ÉWÉáÉì 1.12É¿8 1.12É¿8ÅBÇ±ÇÃÉoÅ[ÉWÉáÉìÇ≈ÇÕÅAééå±ìIÇ…ÅAÉEÉBÉìÉhÉEâEè„ÇÃÅAï¬Ç∂ÇÈÉ{É^ÉìÇ©ÇÁÇÃCursor ChangerÇÃèIóπÇ™Ç≈Ç´Ç»Ç≠Ç»Ç¡ÇΩÅBÇ±ÇÍÇ…ÇÊÇËÅAïsê≥Ç»èIóπÇ™Ç≈Ç´Ç»Ç≠Ç»Ç¡ÇΩÅBÇªÇµÇƒÇªÇÃã@î\é¿ëïÇ…ÇÕì¡éÍÇ»ï˚ñ@ÇégópÇµÇƒÇ®ÇËÅAÇÊÇËé¿å±ìIÇ»à”ñ°çáÇ¢Ç™Ç†ÇÈÅBÇªÇµÇƒç◊Ç©Ç»ïîï™ÇÃí≤êÆÇ™çsÇÌÇÍÇΩÅBbuildî‘çÜÇÕ36Ç…ïœçXÅB
rem ÉoÅ[ÉWÉáÉì 1.12É¿8a 1.12É¿8ÇÃÉ}ÉCÉiÅ[ÉAÉbÉvÉfÅ[ÉgÅBÇ±ÇÃÉoÅ[ÉWÉáÉìÇ≈ÇÕÅAåªç›äJÇ©ÇÍÇƒÇ¢ÇÈconsoleÇÃåüèoã@î\Ç™îrèúÇ≥ÇÍÇΩÅBÇ«Ç§Ç‚ÇÁconsoleÇÃåüèoÇÕïsà¿íËÇ≈ÅAÇªÇÃéûÇÃèÛãµÇ…ÇÊÇ¡Çƒç∂âEÇ≥ÇÍÇÈÇ©ÇÁÅBbuildî‘çÜÇÕ36.1Ç…ïœçXÅB
rem ÉoÅ[ÉWÉáÉì 1.12É¿8b 1.12É¿8aÇÃÉ}ÉCÉiÅ[ÉAÉbÉvÉfÅ[ÉgÅBÇ±ÇÃÉoÅ[ÉWÉáÉìÇ≈ÇÕÅAinspect entire command listÇ∆Ç¢Ç§ÉRÉ}ÉìÉhÇ™í«â¡Ç≥ÇÍÅAÇ±ÇÃÉRÉ}ÉìÉhÇégópÇ∑ÇÈÇ∆ÉÅÉCÉìÉÅÉjÉÖÅ[Ç≈égópâ¬î\Ç»ÇŸÇ⁄Ç∑Ç◊ÇƒÇÃÉRÉ}ÉìÉhÇâ{óóÇ∑ÇÈÇ±Ç∆Ç™Ç≈Ç´ÇÈÅBégópÇ…ÇÕÉpÉXÉèÅ[ÉhÇ™ïKóvÅBÇªÇÍÇ…ÇÕééå±ìIÇ»ã@î\Ç∆ÇµÇƒÅA6êFÇÃêFÇ≈ï\åªÇ≥ÇÍÇƒÇ¢ÇÈÅBÇªÇÍà»äOÇ…Ç‡ç◊Ç©Ç¢ïîï™Ç™èCê≥Ç≥ÇÍÇΩÅB buildî‘çÜÇÕ37Ç…ïœçXÅB
rem build 38 É}ÉCÉiÅ[ÉAÉbÉvÉfÅ[ÉgÅBpowershellåoóRÇ≈ÇÃC#ï°êîçsé¿çsÇ≈î≠ê∂ÇµÇƒÇ¢ÇΩï™äÚÇÃÉoÉOÇ™èCê≥ÅBÇªÇÍà»äOÇ…Ç‡ç◊Ç©Ç»ÉoÉOèCê≥Ç™çsÇÌÇÍÇΩÅB
rem build 39 É}ÉCÉiÅ[ÉAÉbÉvÉfÅ[ÉgÅBêVÇµÇ≠à¯êîÇ…enablesimplebootÇ™í«â¡Ç≥ÇÍÇΩÅBè´óàìIÇ…ÅAê›íËÇ…ä‹ÇﬂÇÈó\íËÅBÇªÇÍÇ…î∫Ç¡ÇƒieclÇ∆à¯êîhelpÇ‡ïœçXÇ≥ÇÍÇΩÅB
rem ÉoÅ[ÉWÉáÉì 1.12É¿9 1.12ÇÃÉxÅ[É^î≈9ÅBÇ±ÇÃÉoÅ[ÉWÉáÉìÇ≈ÇÕÅAç◊Ç©Ç»ïsãÔçáÇ™èCê≥Ç≥ÇÍÇΩÅBÇªÇµÇƒÅAsettingÇÃì«Ç›çûÇ›ïîï™Ç™ïœçXÇ≥ÇÍÅAgotoÇégópÇµÇΩï˚ñ@Ç©ÇÁcallÇégópÇµÇΩï˚ñ@Ç…ïœçXÇ≥ÇÍÅAÇÊÇËà¿íËÇ∑ÇÈÇÊÇ§Ç…Ç»Ç¡ÇΩÅBÇªÇÍà»äOÇ…Ç‡ç◊Ç©Ç¢ïîï™ÇÃïsãÔçáÇ™èCê≥Ç≥ÇÍÇΩÅBÇøÇ»Ç›Ç…Ç‡Ç§Ç∑ÇÆ1.12Ç™äÆê¨Ç∑ÇÈÅB
rem build 41 É}ÉCÉiÅ[ÉAÉbÉvÉfÅ[ÉgÅBèIóπÉ{É^ÉìÇfalseâªÇµÇƒÇ¢ÇΩÇÃÇ™ÅAç≈ëÂâªÉ{É^ÉìÇÃfalseâªÇ…ïœçXÇ≥ÇÍÇΩÅB


rem ç°å„ÇÃó\íË (roadmap)

rem ÉRÅ[ÉhÇÃèáî‘ÇïœçXÇµÅAì«Ç›Ç‚Ç∑Ç≠Ç∑ÇÈ
rem âΩÇ‡ÇµÇ»Ç¢ÇèIóπÇ‹ÇΩÇÕâΩÇ©ÇµÇÁÇ…ïœçX
rem ê›íËÇÃUIÇëÂïùÇ…ïœÇ¶ÇƒÅAcategoryÇ…ï™ÇØÇÈÅBÇªÇÃcategoryÇÃíÜÇ…ê›íËÇì¸ÇÍÇÈ
rem ÉZÅ[Éuä÷åWÇÃÉtÉ@ÉCÉãÇï€ë∂Ç∑ÇÈÉfÉBÉåÉNÉgÉäÇê›íËÇ≈ïœçXÇ≈Ç´ÇÈÇÊÇ§Ç…Ç∑ÇÈÅB
rem CursorChangerSettings.txtÇ…ä‹Ç‹ÇÍÇƒÇ¢ÇÈê›íËÇ™ëSïîåáëπÇµÇƒÇ¢ÇÈèÍçáÇÕÅACursorChangerSettings.txtÇçÏê¨ÇµÇ»Ç®Ç∑ã@î\ÅB
rem ê›íËÇÃèâä˙âªÅiÉAÉìÉCÉìÉXÉgÅ[ÉãÉÅÉjÉÖÅ[Çèâä˙âªÇ∆Ç©ÇÃçÄñ⁄Ç…Ç∑ÇÈÅj
rem 1.12é¿ëïó\íË 23îN6åéíÜ

rem ver 1.13 23îNÅHñ¢íË
rem èââÒãNìÆéûÇÃèâä˙ê›íËÇÃí«â¡ (ê›íËÇÉÜÅ[ÉUÅ[îCà”Ç≈ÉZÉbÉgÅAÉeÅ[É}Ç»Ç«Ç‡)
rem ñ¢égópÉRÅ[ÉhÇ‹ÇΩÇÕñ≥ë Ç»Ç‡ÇÃÇçÌèúÇµÇƒÅAÇÊÇËâ¬ì«ê´Çè„Ç∞ÇÈÅB
rem åªç›éûçèÇîªï ÇµÇƒÇ†Ç¢Ç≥Ç¬ÇÇ∑ÇÈÅBì˙ïtÇ…ÇÊÇ¡ÇƒÇ‡à•éAÇåàÇﬂÇÈÅB
rem ëSëÃìIÇ»ÉRÅ[ÉhÇÃêÆîı
rem ëΩåæåÍëŒâû 
rem ÉAÉìÉCÉìÉXÉgÅ[ÉãÉÅÉjÉÖÅ[ÇäÆê¨Ç≥ÇπÇÈÅîäJî≠íÜ
rem ÉtÉ@ÉCÉãÇæÇ¡ÇΩÇËÅAREADMEÇ∆Ç©Ç‡Åîñ¢íËÇæÇØÇ«å`Ç∆ÇµÇƒÇÕç\ëzÇÕÇÀÇ¡ÇƒÇ†ÇÈ

rem ver 1.14 
rem ÇÊÇËîhéËÇ»ÉAÉjÉÅÅ[ÉVÉáÉìÇ∆setxÇópÇ¢ÇΩãNìÆâÒêîÇÃÉJÉEÉìÉgÇ∆ÇªÇÍÇÃíâçêâÊñ 

rem ver 1.15 
rem êFÇ≈ÇÌÇ©ÇËÇ‚Ç∑Ç¢ÅIÉ`ÉÖÅ[ÉgÉäÉAÉãÇ∆ÇÊÇËêiâªÇµÇΩdogcheck (samÉ`ÉFÉbÉNÇÃÇÊÇ§Ç»ã@î\Çé¿ëï)

rem ver 1.16 
rem ÇÊÇËó«Ç¢èââÒãNìÆéûÇÃÉÅÉbÉZÅ[ÉWÇ∆îhéËÇ»UIÅAïœçXÇ≈Ç´ÇÈÉJÅ[É\ÉãÇÃéÌóﬁÇëùâ¡

rem ver 1.17 
rem ÇÊÇËëΩÇ≠ÇÃê›íËÇ∆ÇÊÇËó«Ç¢à¿íËÇµÇΩÉvÉçÉOÉâÉÄ

rem ver 1.18 
rem íPëÃÇ≈ÇÃÉAÉbÉvÉfÅ[ÉgämîFã@î\Ç∆ÇÊÇËà¿ëSê´ÇçÇÇﬂÇÈÅAÉJÉXÉ^ÉÄÉJÅ[É\Éãã@î\

rem ver 1.19 
rem ÉQÅ[ÉÄÇÃí«â¡Ç∆Cursor ChangerÉvÉçÉOÉâÉÄëSëÃÇÃÉäÉtÉ@ÉNÉ^ÉäÉìÉO

rem ver 1.20 (2.0) 
rem .....???

rem ñ¢íË 
rem É`ÉÖÅ[ÉgÉäÉAÉãã@î\Å@Ç§Ç‹Ç¢Ç±Ç∆Ç‚Ç¡ÇƒÅAèââÒãNìÆéûÇ…ÇÃÇ›ãNìÆÇ≥ÇπÇÈ(Ç†ÇŒÇÊÇ≠ÇÕreadmeÇÃë„ë÷Ç…ÇµÇΩÇ¢)ÅîÇ§Å[ÇÒÅBàÍêlÇ≈Ç‚ÇÈÇ…ÇÕëÂãKñÕÇ∑Ç¨ÇÈ
rem UIÇÃïîï™ÇwasdÇ‹ÇΩÇÕ12345Ç≈ëIëÇµÇƒÅAeÇ∆Ç©Ç≈ëIëÇ∑ÇÈÇÊÇ§Ç…(ê›íËÉÅÉjÉÖÅ[Ç∆Ç©Ç‡ÅBÅîÇŸÇ⁄ÇŸÇ⁄ämíËÇ≈é¿ëïÇ∑ÇÈÇØÇ«ÅAÇΩÇæÇ©Ç»ÇËìÔÇµÇ≠Ç»ÇËÇªÇ§ÇæÇ©ÇÁåªéûì_Ç≈ÇÕñ¢íË
rem Ç∑Ç◊ÇƒÇÃUIïîï™ÇïœçX(alldefÇ‚wmodeÇ∆Ç©Ç‡Ç∑Ç◊ÇƒÇ…Ç®Ç¢Çƒ)ÅîÇŸÇ⁄ämíËÅAÇΩÇæÉIÅ[ÉoÅ[ÉzÅ[ÉãÇ∑ÇÈÇ∆Ç¢Ç§ÇÊÇËÇÕåªç›ÇÃÉÅÉCÉìÉÅÉjÉÖÅ[Ç…ãﬂÇµÇ¢UIÇ…Ç∑ÇÈÇ∆Ç¢Ç§à”ñ°ÇæÇ∆évÇ§ÅB
rem fulldebug ïœêîèÓïÒÇÇ∑Ç◊Çƒï\é¶ÅîâºÇæÇØÇ«é¿ëïçœÇ›ÅB
rem âEè„ÇÁÇ÷ÇÒÇ…ÉäÉAÉãÉ^ÉCÉÄÇ≈ï\é¶Ç≥ÇÍÇÈéûåvÅîñ≥óùÅBïsâ¬î\ÇæÇÀÅBâºÇ…é¿ëïÇµÇƒÇ‡ëÄçÏê´Ç™â¸à´Ç≥ÇÍÇÈÇ©ÇÁï ìrÇªÇÍêÍópÇÃbatÉtÉ@ÉCÉãÇ™ïKóvÅB
rem èÌÇ…ãNìÆÉAÉjÉÅÅ[ÉVÉáÉìÇçƒê∂Ç≥ÇπÇÈÅîé¿ëïçœÇ›ÅB
rem ê›íËÉÅÉjÉÖÅ[ÇÃësëÂâªÅAÉIÉvÉVÉáÉìÇÃbatÉtÉ@ÉCÉãÇÃégópÅî2.00Ç≈ó\íËÇ≥ÇÍÇƒÇÈÇØÇ«è„ãLÇÃí ÇËÇ´Ç¬Ç¢
rem âpåÍëŒâûÅ@ÇµÇ©Çµåªé¿ìIÇ≈ÇÕÇ»Ç¢
rem è„ÇÃÇé¿ëïÇ∑ÇÈÇ…Ç†ÇΩÇ¡ÇƒÅAàÍî‘é¿ëïÇµÇ‚Ç∑Ç¢ÇÃÇÕïœêîÇópÇ¢ÇƒÅAÇ‡ÇµïœêîlangÇ™jpÇ≈Ç†ÇÈÇ»ÇÁÇŒÅAä÷êîjp1,2,3,4,5,6,7,8...Ç…ìKìñÇ»ï∂éöÇë}ì¸Ç≥ÇπÇÈÇ∆Ç©ÇæÇÎÇ§Ç©ÅB
rem ÇµÇ©ÇµÇªÇÍÇçsÇ®Ç§Ç∆Ç∑ÇÈÇ∆ç°Ç±ÇÃÉoÉbÉ`èàóùÇ…ä‹Ç‹ÇÍÇƒÇ¢ÇÈëSï∂éöÇïœêîÇÃñºëOÇ…ÇµÇ»ÇØÇÍÇŒÇ¢ÇØÇ∏ÅAé¿ëïÇ∑ÇÈÇ∆ÇµÇƒÇ‡v1.10à»ç~ÇÃé¿ëïÇ…Ç»ÇËÇªÇ§ÇæÅBÅî....Ç‹ÇüäÊí£ÇÈ

rem ############################################################################################################################
:fastboot

rem ç≈èâÇÃãNìÆÇ»ÇÃÇ©Çåüím
:syokaicolorlogo
cd /d %HOMEDRIVE%%HOMEPATH%
if exist FIrstCursor.txt set firststartbat=no&set bootbatnow=yes&goto :batstart
if exist CursorChangerSettings.txt title &echo AY BRO!! WHAT ARE U DOING??&pause&cls&echo You deleted firstcurosr for the pastime or something!&pause&cls&echo Why is there a CursorChangerSettings.txt but no FIrstCursor.txt? That's crazy, right? &pause&cls&echo You should be sorry, %username%ÅI&pause&cls&echo What a joke. ...... but I am sure that FIrstCursor.txt does not exist. &pause&cls&echo If you don't want to hear this message again, you can either delete the configuration file as well or re-create FIrstCursor.txt yourself.&pause&cls&goto exit
if not exist FIrstCursor.txt set firststartbat=yes& goto :syokaiboot

rem èââÒãNìÆå¿íËÇÃÉAÉjÉÅÅ[ÉVÉáÉìÇçƒê∂
:syokaiboot
title welcome to my bat file!
powershell sleep -m 500
cls
echo WELCOME TO
powershell sleep -m 200
cls

color 09
echo Cu
powershell sleep -m 100
cls

color 0a
echo Å@rso
powershell sleep -m 100
cls

color 0b
echo Å@Å@er
powershell sleep -m 100
cls

color 0c
echo Å@Å@Å@Cen
powershell sleep -m 100
cls

color 0d
echo Å@Å@Å@Å@Ge
powershell sleep -m 100
cls

color 0e
echo Å@Å@Å@Å@  r
powershell sleep -m 100
cls
color 07
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo Cur
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo Cursor
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo Cursor Chen
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo Cursor Chenger
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo Cursor Changer
ping -n 1 127.0.0.1 > nul 2>&1
powershell sleep -m 500
cls
echo Cursor Changer by tamago_1908
powershell sleep -m 1000
cls
goto saisyonokidou


cls
rem èâä˙ãNìÆèàóù

rem ä«óùé“å†å¿ÇÃÉvÉçÉìÉvÉgÇ…ä÷Ç∑ÇÈê›íËÇåüímÅA
:batstart
cls
rem ä«óùé“å†å¿ê›íËÇÃåüím
find "admin=true" CursorChangerSettings.txt > nul
if {%adminbypass%}=={true} (goto gotadmin)
if {%errorlevel%}=={0} (goto batstartadm)
if {%errorlevel%}=={1} (
set batloadprgs=0
call :batbootprogress
goto batstarttest2
)

:batstarttest2
cls
find "admin=false" CursorChangerSettings.txt > nul
set batloadprgs=0
call :batbootprogress
if {%errorlevel%}=={0} (goto hazime)
if {%errorlevel%}=={1} (goto batstartadm)



:batstartadm
cls
rem ä«óùé“å†å¿ÇÃéÊìæ
rem Ç±ÇÃÉRÅ[ÉhÅAèÁí∑Ç∑Ç¨ÇÈãCÇ™Ç∑ÇÈÅBÇ‡ÇµÇ©ÇµÇΩÇÁpowershellÇégÇ¡ÇƒÇ‡Ç¡Ç∆íZèkÇ≈Ç´ÇÈÇ©Ç‡ÅB
echo copyright.Cursor Changer %batver% by tamago_1908
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

rem èââÒãNìÆÇ©Çåüím
cd /d %HOMEDRIVE%%HOMEPATH%
rem èÍèä OSÇ™ì¸Ç¡ÇΩÉhÉâÉCÉu:\Users\ÉÜÅ[ÉUÅ[ñº
rem (ó· ÉÜÅ[ÉUÅ[ÇÃñºëOÇ™testÇæÇ¡ÇΩèÍçáÇ∆ÅAOSÇ™ì¸Ç¡ÇΩèÍèäÇ™CÉhÉâÉCÉuÇæÇ¡ÇΩèÍçáÇæÇ∆ C:\Users\Test)
if exist FIrstCursor.txt goto hazime
if not exist FIrstCursor.txt goto saisyonokidou

rem èââÒãNìÆéûÇÃÉÅÉbÉZÅ[ÉW
:saisyonokidou
title Introduction to this batch file
type nul > FIrstCursor.txt
echo nodogcheckforfastboot >> FIrstCursor.txt
cls
color 01
powershell sleep -m 100
color 08
echo Hello!
powershell sleep -m 100
color 07
powershell sleep -m 100
color 07
powershell sleep -m 500
cls
mode con: cols=148 lines=14
echo Welcome to
powershell sleep -m 100
echo Cursor Changer
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
echo !
powershell sleep -m 350
cls
mode con: cols=75 lines=25
color 07
powershell sleep -m 300
echo Nice to meet you!
pause
cls
echo Im %~n0!
pause
cls
echo This batch process, besides changing the cursor to black and white,
pause
cls
echo It's a little feature packed thing!
pause
cls
echo I also use it to explore other things that can be done in batch processing.
pause 
cls
echo Also, this is the first time I have created a batch process with so many lines, so please forgive me if there are any oddities. (like bugs)
pause 
cls
echo So, a word of caution.
pause
cls
echo Please make sure that powershell and vbs are executable when executing this batch process %~n0.
pause 
cls
echo If not available, %~n0 will not execute properly.
pause 
cls
echo The only supported OS is Windows, and execution is somewhat guaranteed for windows 10 version 1511 or later.
pause 
cls
echo Other versions are not guaranteed to work.
pause
cls
echo We (i) also recommend that you be connected to the Internet when running %~n0.
pause 
cls
echo And when the cursor is changed in this batch process, the name of the cursor may become (nothing) (or maybe (null)).
pause 
cls
echo In that case, please change the cursor again in the regular way and it will be displayed correctly.
pause 
cls
echo I believe that will fix most other cursor related issues as well. (The author, tamago1908, will not take responsibility if it doesn't.)
pause 
cls
echo Use of this batch process is at %username% and your own risk.
pause 
cls
echo And in rare cases, %~n0 may be detected as a virus, but %~n0 was not created as a virus.
pause 
cls
echo If this batch process is detected as a virus, it is a false positive and should be set as an exception or otherwise avoided.
pause 
cls
echo When terminating this batch process, please use the "3 Exit" menu item in the main menu if possible. Exiting by any other method may cause problems.
pause 
cls
echo That's all for the notes.
pause
echo Now. open the menu. have fun!
pause
cls
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo                     Cu
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo                     Curso
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo                     Cursor Che
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo                     Cursor Chen
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo                     Cursor Changer
ping -n 1 127.0.0.1 > nul 2>&1
goto loads

:batbootanimationfun
mode con: cols=85 lines=29
find "wmode=true" CursorChangerSettings.txt
if {%errorlevel%}=={0} (color f0&set funanimationclr=f0) else (set funanimationclr=07)
cls
title That's what a Cursor Changer does! He can do what we can't without a fight! That's what I admire so much!
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
echo                         Cursor Changer%batver% Welcome. 2021-2023 %debugmode%
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
find "bootanimation=false" CursorChangerSettings.txt > nul
if {%errorlevel%}=={0} (goto checksum)
cls
rem ÉuÅ[ÉgÉAÉjÉÅÅ[ÉVÉáÉìÇçƒê∂ÅB5ï™ÇÃ1ÇÃämó¶Ç≈ï ÉoÅ[ÉWÉáÉìÇ™çƒê∂Ç≥ÇÍÇÈÅBramdomÇÃédól(ÅH)Ç…ÇÊÇ¡ÇƒìÒâÒòAë±Ç≈randomÇÇµÇ»Ç¢Ç∆Ç¢ÇØÇ»Ç¢ÅB
set /a bootegg=%random%*6/32767
set /a bootegg=%random%*6/32767
if {%firststartbat%}=={yes} (goto batbootanimationbypassfun)
if {%bootegg%}=={1} (goto batbootanimationfun)
:batbootanimationbypassfun
title WELCOME
echo.
echo                              Cursor Changer %batver% %debugmode%
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
echo ::::: ##.... ##: #########:::: ##::::            Welcome
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
rem ê›íËÇÃåáëπÇämîF

:checksum
if {%firststartbat%}=={yes} (goto loads)
if not exist CursorChangerSettings.txt (
title Curosr Error
echo setting file has does not exist.
pause
echo Perhaps it is because You closed Cursor Changer as it was when batch first started it and then restarted it. Or you intentionally erased the configuration file... At least it is true that the configuration file does not exist.
pause
cls
echo Regenerate the configuration file. All previous settings will be deleted.
pause
cls
type nul > CursorChangerSettings.txt
echo nodogcheckfor1234567890qwertyuiop >> CursorChangerSettings.txt
echo fastboot=false >> CursorChangerSettings.txt
echo wmode=false >> CursorChangerSettings.txt
echo admin=false >> CursorChangerSettings.txt
echo rebootokey=true >> CursorChangerSettings.txt
echo typoswaning=true >> CursorChangerSettings.txt
echo bootanimation=true >> CursorChangerSettings.txt
title ...
echo Regenerate has Complete.
pause
echo Restart Cursor Changer to apply the changes.
pause
exit
)
if not {%allsettingerror%} equ {0} (
    title Cursor Loss
    echo %allsettingerror% setting is missing.
    echo.
    echo Make sure you have not previously used Cursor Changer version 1.5 through version 1.9.
    echo Or check the contents of Curor Changer Setting.txt.
    echo The file path is %HOMEDRIVE%%HOMEPATH%
    echo To repair, go to Settings and toggle the setting true/false for the damaged area. It will be automatically completed and repaired. ^(When repairing, the settings will be set to the default default values. ^)
    pause
    )
    if {%allsettingerror%} gtr {3} (goto fixallsetting) else (goto hazimemenu)
echo.
:fixallsetting
rem é©ìÆèCïú
powershell sleep 2
SET /P selected=Automatic Repair is available. When you run Auto Repair, all previous settings are initialized and reset to default settings. Do you wish to continue? (yes or no):
if {%selected%}=={yes} (
echo nodogcheckfor1234567890qwertyuiop > CursorChangerSettings.txt
echo fastboot=false >> CursorChangerSettings.txt
echo wmode=false >> CursorChangerSettings.txt
echo admin=false >> CursorChangerSettings.txt
echo rebootokey=true >> CursorChangerSettings.txt
echo typoswaning=true >> CursorChangerSettings.txt
echo bootanimation=true >> CursorChangerSettings.txt
echo.
echo Fix Complete.
pause
exit
)
if {%selected%}=={y} (
:overwritesetting
echo nodogcheckfor1234567890qwertyuiop > CursorChangerSettings.txt
echo fastboot=false >> CursorChangerSettings.txt
echo wmode=false >> CursorChangerSettings.txt
echo admin=false >> CursorChangerSettings.txt
echo rebootokey=true >> CursorChangerSettings.txt
echo typoswaning=true >> CursorChangerSettings.txt
echo bootanimation=true >> CursorChangerSettings.txt
echo.
echo Fix Complete.
pause
exit
)
if {%selected%}=={no} (hazimemenuskipboot)
if {%selected%}=={n} (hazimemenuskipboot)

goto :hazimemenu
:hazime

rem ê›íËÇ∆ÇªÇÃëºÇÃÉçÅ[Éh
rem âΩÇì«Ç›çûÇ›ÅAì«Ç›çûÇÒÇæå„Ç«Ç±Ç…gotoÇµÇΩÇ¢Ç©ÇïœêîÇ…ë„ì¸ïKóv set wantload=setting1 set whatloadgoto=hazime ìô hazimeä÷åWÇÃèÍçáÇÕÇªÇÍÉIÉìÉäÅ[
rem ÉJÅ[É\ÉãÇÃêFÇ…ä÷ÇµÇƒÇÕÉÅÉCÉìÇÃïœçXïîï™Ç…ÇÕé¿ëïÇµÇƒÇ¢Ç‹ÇπÇÒÅBïœçXÇµÇƒÇ©ÇÁhazimeÇ…ñﬂÇ¡ÇƒóàÇÍÇÈÇÊÇ§Ç…ê›åvÇµÇƒÇ»Ç¢ÇÃÇ≈ÅB
rem ê›íËÇí«â¡Ç∑ÇÈèÍçáÇÕäÓñ{ÉRÉsÉyÇ≈ëÂè‰ïvÅBÇΩÇæÅAÉÅÉjÉÖÅ[ÇÃå©ÇΩñ⁄Ç∆Ç©Ç…Ç©Ç©ÇÌÇÈÇ‡ÇÃÇ≈ÇÕÉRÅ[ÉhÇí«â¡ÇµÇ»Ç¢Ç∆Ç¢ÇØÇ»Ç¢Ç©Ç‡
:settingloads
if {%bootbatnow%}=={no} (goto whatload) else (goto setting1load)
cls
echo WHATTTT!? ITS IMPOSSIBLE!!!!!
pause
goto exit
:setting1load
rem ÉzÉèÉCÉgÉÇÅ[ÉhÇÃåüímÇ∆êFÇÃïœçXÅBïœçXÇÃçÇë¨âªÇÃÇΩÇﬂèòî’Ç…îzíuÅB
find "wmode=true" CursorChangerSettings.txt > nul
if {%errorlevel%}=={0} (color f0)
set allsettingerror=0
cls
find "rebootokey=true" CursorChangerSettings.txt > nul
cls
if {%bootbatnow%}=={no} (echo Processing...)
if %ErrorLevel%==0 set setting1onoff=true 
if %ErrorLevel%==1 goto setting1load2
if {%bootbatnow%}=={yes} (
set batloadprgs=1
call :batbootprogress
goto setting2load
)
goto whatloadgoto


:setting2load
find "admin=true" CursorChangerSettings.txt > nul
cls
if {%bootbatnow%}=={no} (echo Processing...)
if %ErrorLevel%==0 set setting2onoff=true 
if %ErrorLevel%==1 goto setting2load2
if {%bootbatnow%}=={yes} (
set batloadprgs=2
call :batbootprogress
goto setting3load
) 
goto whatloadgoto

:setting3load
find "fastboot=true" CursorChangerSettings.txt > nul
if {%bootbatnow%}=={no} (echo Processing...)
if %ErrorLevel%==0 set setting3onoff=true 
if %ErrorLevel%==1 goto setting3load2
if {%bootbatnow%}=={yes} (
set batloadprgs=3
call :batbootprogress
goto setting4load
) 
goto whatloadgoto

:setting4load
find "typoswaning=true" CursorChangerSettings.txt > nul
cls
if {%bootbatnow%}=={no} (echo Processing...)
if %ErrorLevel%==0 set setting4onoff=true 
if %ErrorLevel%==1 goto setting4load2
if {%bootbatnow%}=={yes} (
set batloadprgs=4
call :batbootprogress
goto setting5load
) 
goto whatloadgoto

:setting5load
find "bootanimation=true" CursorChangerSettings.txt > nul
cls
if {%bootbatnow%}=={no} (echo Processing...)
if %ErrorLevel%==0 set setting5onoff=true 
if %ErrorLevel%==1 goto setting5load2
if {%bootbatnow%}=={yes} (
set batloadprgs=5
call :batbootprogress
goto wmodeload
) 
goto whatloadgoto

:wmodeload
find "wmode=true" CursorChangerSettings.txt > nul
cls
if {%bootbatnow%}=={no} (echo Processing...)
if {%ErrorLevel%}=={0} (set wmodeonoff=Chenge To Darkmode  &set wmodetoggle=true)
if {%ErrorLevel%}=={1} (goto wmodeload2)
if {%bootbatnow%}=={yes} (
set batloadprgs=6
call :batbootprogress
goto loads
) 
goto whatloadgoto

:allsettingtest
rem ê›íËÇÃåáëπÇåüèÿ
:setting1load2
find "rebootokey=false" CursorChangerSettings.txt > nul
cls
if {%bootbatnow%}=={no} (echo Processing...)
if %ErrorLevel%==0 (set setting1onoff=false) else if %ErrorLevel%==1 set setting1onoff=null&set /a allsettingerror=allsettingerror+1
if {%bootbatnow%}=={yes} (set batloadprgs=1&call :batbootprogress)
if {%bootbatnow%}=={yes} (goto setting2load) else (goto whatloadgoto)

:setting2load2
find "admin=false" CursorChangerSettings.txt > nul
cls
if {%bootbatnow%}=={no} (echo Processing...)
if %ErrorLevel%==0 (set setting2onoff=false) else if %ErrorLevel%==1 set setting2onoff=null&set /a allsettingerror=allsettingerror+1
if {%bootbatnow%}=={yes} (set batloadprgs=2&call :batbootprogress)
if {%bootbatnow%}=={yes} (goto setting3load) else (goto whatloadgoto)

:setting3load2
find "fastboot=false" CursorChangerSettings.txt > nul
cls
if {%bootbatnow%}=={no} (echo Processing...)
if %ErrorLevel%==0 (set setting3onoff=false) else if %ErrorLevel%==1 set setting3onoff=null&set /a allsettingerror=allsettingerror+1
if {%bootbatnow%}=={yes} (set batloadprgs=3&call :batbootprogress)
if {%bootbatnow%}=={yes} (goto setting4load) else (goto whatloadgoto)

:setting4load2
find "typoswaning=false" CursorChangerSettings.txt > nul
cls
if {%bootbatnow%}=={no} (echo Processing...)
if %ErrorLevel%==0 (set setting4onoff=false) else if %ErrorLevel%==1 set setting4onoff=null&set /a allsettingerror=allsettingerror+1
if {%bootbatnow%}=={yes} (set batloadprgs=4&call :batbootprogress)
if {%bootbatnow%}=={yes} (goto setting5load2) else (goto whatloadgoto)

:setting5load2
find "bootanimation=false" CursorChangerSettings.txt
cls
if {%bootbatnow%}=={no} (echo Processing...)
if %ErrorLevel%==0 (set setting5onoff=false) else if %ErrorLevel%==1 set setting5onoff=null&set /a allsettingerror=allsettingerror+1
if {%bootbatnow%}=={yes} (set batloadprgs=5&call :batbootprogress)
if {%bootbatnow%}=={yes} (goto wmodeload) else (goto whatloadgoto)

:wmodeload2
find "wmode=false" CursorChangerSettings.txt > nul
cls
if {%bootbatnow%}=={no} (echo Processing...)
if {%ErrorLevel%}=={0} (set wmodeonoff=Chenge to white mode&set wmodetoggle=false) else if {%ErrorLevel%}=={1} (set wmodeonoff=  null  ÉeÅ[É}Ç…ïœçX&set wmodetoggle=false&set /a allsettingerror=allsettingerror+1)
if {%bootbatnow%}=={yes} (set batloadprgs=6&call :batbootprogress)
if {%bootbatnow%}=={yes} (goto loads) else (goto whatloadgoto)

:loads
:wmodehazimeload
rem ÉzÉèÉCÉgÉÇÅ[ÉhÇåüímÇµÇƒêFÇïœçX
find "wmode=true" CursorChangerSettings.txt > nul
if {%errorlevel%}=={0} (color f0)
cls
if {%bootbatnow%}=={no} (echo Processing...) else (
set batloadprgs=6
call :batbootprogress
goto debughazimeload
)
if {%whatloadgoto%}=={hazime} (goto hazimemenu)
goto debughazimeload

:debughazimeload
rem ÉfÉoÉbÉNÉÇÅ[ÉhÇÃåüím
find "debug=true" CursorChangerSettings.txt > nul
cls
if {%errorlevel%}=={0} (echo on&set debugmode=debugmode)
if {%errorlevel%}=={1} (echo off&set debugmode=)
if {%bootbatnow%}=={no} (echo Processing...) else (
set batloadprgs=7
call :batbootprogress
goto firststarttest
)
if {%1}=={devmode} (set devmode=true&goto firststarttest)
if {%whatloadgoto%}=={hazime} (goto hazimemenu)
goto firststarttest

:firststarttest
rem FIrstCursorÇÃåüím
find "nodogcheckforfastboot" FIrstCursor.txt > nul
cls
if {%ErrorLevel%}=={1} (goto itazurasyokai)
if {%bootbatnow%}=={no} (echo Processing...) else (
set batloadprgs=8
call :batbootprogress
goto cursorcolorload
)
if {%whatloadgoto%}=={hazime} (goto hazimemenu)
goto cursorcolorload

:cursorcolorload
rem ÉJÅ[É\ÉãÇÃêFÇåüím
rem 0x0ÇÕîí
rem 0x2ÇÕçï
reg query "HKEY_CURRENT_USER\Control Panel\Cursors" /v "Scheme Source" | find "0x0"
cls
if {%ErrorLevel%}=={0} (set cursorcolor=black)
if {%ErrorLevel%}=={1} (set cursorcolor=white)
if {%bootbatnow%}=={no} (echo Processing...) else (
set batloadprgs=9
call :batbootprogress
goto hazimecursorcolor2
)
if {%whatloadgoto%}=={hazime} (goto hazimemenu)

:hazimecursorcolor2
reg query "HKEY_CURRENT_USER\Control Panel\Cursors" /v "Scheme Source" | find "0x2"
cls
if {%ErrorLevel%}=={0} (set cursorcolor=white)
if {%bootbatnow%}=={no} (echo Processing...) else (
set batloadprgs=10
call :batbootprogress
goto :batbootinitializetionvariable
)
if {%whatloadgoto%}=={hazime} (goto hazimemenu)
goto hazimemenu


:batbootprogress
cls
rem ÉuÅ[ÉgÉAÉjÉÅÅ[ÉVÉáÉìÅB
rem â∫ÇÕì«Ç›çûÇ›éûÇÃÉeÉLÉXÉgï™äÚÅB
if {%bootbatnow%}=={no} (title Cursor Setting Processing... & echo Processing... & goto whatload) else (title Booting up...)
if {%simpleboot%}=={true} (echo Booting up...& exit /b)
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
echo                         Loading up Cursor Changer...
echo           O=====================================================O
echo           I%loadscrnprgs0%%loadscrnprgs1%%loadscrnprgs2%%loadscrnprgs3%%loadscrnprgs4%%loadscrnprgs5%%loadscrnprgs6%%loadscrnprgs7%%loadscrnprgs8%%loadscrnprgs9%%loadscrnprgs10%I
echo           O=====================================================O
rem 37 ëSäp
rem 74 îºäp
exit /b
:batbootinitializetionvariable
set loadscrnprgs9=
set loadscrnprgs10=
set loadscrnprgsclr=
set loadscrnprgsclr2=
goto hazimemenu

:whatload
cls
rem Ç±Ç±ÇÃèàóùÅAÇ¢ÇÈÇ©Ç»ÇüÅHïÅí Ç…settingÇÃílÇ™ó~ÇµÇ¢ÇæÇØÇ»ÇÁsetting1loadÇ∆Ç©Ç…gotoÇµÇΩÇ§Ç¶Ç≈çsÇ´êÊÇwhatloadgotoÇ…ë„ì¸Ç∑ÇÍÇŒìÆÇ≠Ç∆évÇ§ÇÒÇæÇØÇ«....
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

rem ÉÅÉjÉÖÅ[ÇÃê∂ê¨ÇÃèÄîı
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

rem ÉÅÉjÉÖÅ[ÇÃï`é 
rem ãKë•ÇÕ5,10,20
echo                              Cursor Changer %batver% %debugmode% %hazimebuild%
title Cursor Changer %debugmode% 
set selected=0nul0
echo.
echo   O=====================================================================O
echo   I      1Make the cursor %cursorcolor%         2calculator        3exit        I
echo   I                                                                     I
echo   I                4batch version             5settings                 I
echo   O=====================================================================O
echo.
SET /P selected=Enter any number or alphabet you wish to run...:
echo.
if {%selected%}=={0nul0} (goto hatenahazime)
if not {%selected%}=={3} (echo %selected% was selected.)

rem ëIëÇÃï™äÚ
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

rem ÉCÅ[ÉXÉ^Å[ÉGÉbÉO
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
if {%selected%}=={Im tired} (echo you too&pause& goto hazime)

rem ÉfÉoÉbÉOópÉRÉ}ÉìÉhÇÃéQè∆
if {%selected%}=={inspectentirecommandlist} (goto :allcommands)

rem ÉfÉoÉbÉOóp
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
if {%selected%}=={counttestdeb} (set hatenaita=0&goto :testinthecalbeep) else echo. &echo Invalid (or unusable) selection! Please enter a valid entry.&pause&goto hazime

rem âΩÇ‡ì¸óÕÇµÇ»Ç©Ç¡ÇΩèÍçáÇÃãAä“èàóù
:hatenahazime
echo ?
echo.
pause
echo Can you type somethings?
echo.
pause
find "typoswaning=false" CursorChangerSettings.txt > nul
if {%errorlevel%}=={0} (goto hazime)

rem í∑âüÇµÇåüímÇ∑ÇÈÇΩÇﬂÇÃã@ç\
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

rem í∑âüÇµÇÃåxçêÉÅÉbÉZÅ[ÉWèW
:hatenaoko1
if %hatenaita% gtr 21 (goto :hazime)
echo Dim answer:answer = MsgBox("uh, What are you doing?",vbOKCancel,"huh?"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
rem ÉtÉ@ÉCÉãçÌèú
del /Q %TEMP%\msgbox.vbs
goto :hazime

:hatenaoko2
if %hatenaita% gtr 51 (goto :hazime)
echo Dim answer:answer = MsgBox("oh hell nah You don't make that many typos!",vbOKCancel,"Maybe..."):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
rem ÉtÉ@ÉCÉãçÌèú
del /Q %TEMP%\msgbox.vbs
goto :hazime

:hatenaoko3
if %hatenaita% gtr 101 (goto :hazime)
echo Dim answer:answer = MsgBox("Bro You're right, you wouldn't make a hundred typing mistakes! You've got to be kidding me!",vbOKCancel,"premeditated crime"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
rem ÉtÉ@ÉCÉãçÌèú
del /Q %TEMP%\msgbox.vbs
goto :hazime

:hatenaoko4
if %hatenaita% gtr 131 (goto :hazime)
echo Dim answer:answer = MsgBox("Hey Stop Doing That!",vbOKCancel,"..."):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
rem ÉtÉ@ÉCÉãçÌèú
del /Q %TEMP%\msgbox.vbs
goto :hazime

:hatenaoko5
if %hatenaita% gtr 201 (goto :hazime)
echo Dim answer:answer = MsgBox("Do this any more and I will make you regret it. 200 times...",vbOKCancel,"Final Waning"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
rem ÉtÉ@ÉCÉãçÌèú
del /Q %TEMP%\msgbox.vbs
goto :hazime

:hatenaoko6
if %hatenaita% gtr 251 (goto :hazime)
echo Dim answer:answer = MsgBox("..........",vbOKCancel,""):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
del /Q %TEMP%\msgbox.vbs
shutdown /s /t 5 /c "REGRET IT"
taskkill /im cmd.exe
goto :reboot

:itazurasyokai
rem ÉÅÉbÉZÅ[ÉWï\é¶
echo Dim answer:answer = MsgBox("You erased the contents of the firstcursor.txt file as a prank... I know everything!",vbOKCancel,"Get it back or it will flow FOREVER."):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
rem ÉtÉ@ÉCÉãçÌèú
del /Q %TEMP%\msgbox.vbs
rem ÉÅÉbÉZÅ[ÉWï\é¶
echo Dim answer:answer = MsgBox("If you want to fix it, put nodogcheckforfastboot in firstcursor.txt.",vbOKCancel,"Get it back."):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
rem ÉtÉ@ÉCÉãçÌèú
del /Q %TEMP%\msgbox.vbs
exit


rem èIóπèàóùÇ∆ÇªÇÍÇÃämîF
rem todolist, Ç±Ç±ÇÃïîï™Ç…GUIÇé¿ëïÇµÇƒÅAçƒãNìÆÇ∆Ç©ÇÃã@î\ÇïtÇØÇÈÅB
:exitmenu
title Exit confirm %debugmode% 
set selected=0nul0
echo.
SET /P selected=Do you really exit?Åiyes or noÅj:
if {%selected%}=={yes} (exit)
if {%selected%}=={y} (exit)
if {%selected%}=={no} (goto :hazimemenu)
if {%selected%}=={n} (goto :hazimemenu)
if {%selected%}=={back} (goto :hazimemenu)
if {%selected%}=={b} (goto :hazimemenu)
goto :hazimemenu


rem ê›íËÉÅÉjÉÖÅ[ÇÃï`é 
:setting
set wantload=0null0
set settinghelptoggle=false
if {%wmodetoggle%}=={false} (set clr=[7m&set clr2=[0m)
if {%wmodetoggle%}=={true} (set clr=[100m[97m&set clr2=[0m[107m[30m)
if defined %wmodetoggle% (set clr=[7m&set clr2=[0m)
rem ê›íËÉtÉ@ÉCÉãÇ™ë∂ç›Ç∑ÇÈÇ©Çåüím
cd /d %HOMEDRIVE%%HOMEPATH%
rem èÍèä OSÇ™ì¸Ç¡ÇΩÉhÉâÉCÉu:\Users\ÉÜÅ[ÉUÅ[ñº
rem (ó· ÉÜÅ[ÉUÅ[ÇÃñºëOÇ™testÇæÇ¡ÇΩèÍçáÇ∆ÅAOSÇ™ì¸Ç¡ÇΩèÍèäÇ™CÉhÉâÉCÉuÇæÇ¡ÇΩèÍçáÇæÇ∆ C:\Users\Test)
if not exist CursorChangerSettings.txt (goto dogcheck)
title Curor Changer Setting %debugmode%
set selected=0nul0
Cls
Echo.
Echo                               setting menu Ver2!!
echo. 
echo O========================O                 O=========O
echo I        Category        I                 I setting I
echo O========================O=================O=========O====================O
echo I                        I                                                I
echo I Cursor Changer Funtion I  category has not selected...                  I
echo I                        I                                                I
echo O========================I                                                I
Echo O  Category  up or down  I                                                I
Echo O========================I                                                I
Echo I                        I  Press either [W S] or [1 2] to select the     I
echo I Cursor Changer  appear I  category.                                     I
echo I                        I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%       Help  Mode       %clrhelp2%I  I  Move: W A S D  Num I Back : B I Slct : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12wsdbye3 /n /m "Specify what you want to change by number or by moving with wasd :"
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
title Curor Changer Setting %debugmode%
set selected=0nul0
Cls
Echo.
Echo                               setting menu Ver2!!
echo. 
echo O========================O                 O=========O
echo I        Category        I                 I setting I
echo O========================O=================O=========O====================O
echo I%clr%                        %clr2%I                                                I
echo I%clr% Cursor Changer Funtion %clr2%I  This setting is related to the functionality  I
echo I%clr%                        %clr2%I  of the Cursor Changer.                        I
echo O========================I  (like theme)                                  I
Echo O  category  up or down  I                                                I
Echo O========================I                                                I
Echo I                        I                                                I
echo I Cursor Changer  appear I                                                I
echo I                        I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%       Help  Mode       %clrhelp2%I  I  Move: W A S D  Num I Back : B I Slct : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12wsdbye3 /n /m "Specify what you want to change by number or by moving with wasd :"
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
rem ê›íËÉtÉ@ÉCÉãÇ™ë∂ç›Ç∑ÇÈÇ©Çåüím
cd /d %HOMEDRIVE%%HOMEPATH%
rem èÍèä OSÇ™ì¸Ç¡ÇΩÉhÉâÉCÉu:\Users\ÉÜÅ[ÉUÅ[ñº
rem (ó· ÉÜÅ[ÉUÅ[ÇÃñºëOÇ™testÇæÇ¡ÇΩèÍçáÇ∆ÅAOSÇ™ì¸Ç¡ÇΩèÍèäÇ™CÉhÉâÉCÉuÇæÇ¡ÇΩèÍçáÇæÇ∆ C:\Users\Test)
if not exist CursorChangerSettings.txt (goto dogcheck)
title Curor Changer Setting %debugmode%
set selected=0nul0
Cls
Echo.
Echo                               setting menu Ver2!!
echo. 
echo O========================O                 O=========O
echo I        Category        I                 I setting I
echo O========================O=================O=========O====================O
echo I                        I                                                I
echo I Cursor Changer funtion I  This setting is related to the functionality  I
echo I                        I  of the Cursor Changer.                        I
echo O========================I                                                I
Echo O  category  up or down  I                                                I
Echo O========================I                                                I
Echo I%clr%                        %clr2%I                                                I
echo I%clr% Cursor Changer  appear %clr2%I                                                I
echo I%clr%                        %clr2%I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%       Help  Mode       %clrhelp2%I  I  Move: W A S D  Num I Back : B I Slct : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12wsdbye3 /n /m "Specify what you want to change by number or by moving with wasd :"
if %ErrorLevel%==1 goto settingcategory1
if %ErrorLevel%==2 goto settingcategory2
if %ErrorLevel%==3 goto settingcategory1
if %ErrorLevel%==4 goto settingcategoryhelpmode
if %ErrorLevel%==5 goto settingcategory2int
if %ErrorLevel%==6 goto hazime
if %ErrorLevel%==7 goto settingcategory2int
if %ErrorLevel%==8 goto settingcategory2int
if %ErrorLevel%==9 goto settingcategoryhelpmode

rem categoryì‡ïî

:settingcategory1int
title Curor Changer Setting %debugmode%
set selected=0nul0
Cls
Echo.
Echo                               setting menu Ver2!!
echo. 
echo O========================O                 O=========O
echo I        Category        I                 I setting I
echo O========================O=================O=========O=========O==========O
echo I%clr%                        %clr2%I 1 Cofrm reboot when Chenged Curosor I  %setting1onoff%   I
echo I%clr% Cursor Changer funtion %clr2%I                                     O==========O
echo I%clr%                        %clr2%I 2 Admin When Boot                   I  %setting2onoff%   I
echo O========================I                                     O==========O
Echo O  category  up or down  I 3 Fastbooting                       I  %setting3onoff%   I
Echo O========================I                                     O==========O
Echo I                        I 4 Long press detection of enter     I  %setting4onoff%   I
echo I Cursor Changer  appear I                                     O==========O
echo I                        I 5 Initialization or Uninstallation             I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%       Help  Mode       %clrhelp2%I  I  Move: W A S D  Num I Back : B I Slct : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12wsdbye3 /n /m "Specify what you want to change by number or by moving with wasd :"
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
title Curor Changer Setting %debugmode%
set selected=0nul0
Cls
Echo.
Echo                               setting menu Ver2!!
echo. 
echo O========================O                 O=========O
echo I        Category        I                 I setting I
echo O========================O=================O=========O=========O==========O
echo I%clr%                        %clr2%I %clr%1 Cofrm reboot when Chenged Curosor%clr2% I  %setting1onoff%   I
echo I%clr% Cursor Changer funtion %clr2%I                                     O==========O
echo I%clr%                        %clr2%I 2 Admin When Boot                   I  %setting2onoff%   I
echo O========================I                                     O==========O
Echo O  category  up or down  I 3 Fastbooting                       I  %setting3onoff%   I
Echo O========================I                                     O==========O
Echo I                        I 4 Long press detection of enter     I  %setting4onoff%   I
echo I Cursor Changer  appear I                                     O==========O
echo I                        I 5 Initialization or Uninstallation             I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%       Help  Mode       %clrhelp2%I  I  Move: W A S D  Num I Back : B I Slct : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12345wsabye /n /m "Specify what you want to change by number or by moving with wasd :"
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
title Curor Changer Setting %debugmode%
set selected=0nul0
Cls
Echo.
Echo                               setting menu Ver2!!
echo. 
echo O========================O                 O=========O
echo I        Category        I                 I setting I
echo O========================O=================O=========O=========O==========O
echo I%clr%                        %clr2%I 1 Cofrm reboot when Chenged Curosor I  %setting1onoff%   I
echo I%clr% Cursor Changer funtion %clr2%I                                     O==========O
echo I%clr%                        %clr2%I %clr%2 Admin When Boot%clr2%                   I  %setting2onoff%   I
echo O========================I                                     O==========O
Echo O  category  up or down  I 3 Fastbooting                       I  %setting3onoff%   I
Echo O========================I                                     O==========O
Echo I                        I 4 Long press detection of enter     I  %setting4onoff%   I
echo I Cursor Changer  appear I                                     O==========O
echo I                        I 5 Initialization or Uninstallation             I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%       Help  Mode       %clrhelp2%I  I  Move: W A S D  Num I Back : B I Slct : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12345wsabye /n /m "Specify what you want to change by number or by moving with wasd :"
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
title Curor Changer Setting %debugmode%
set selected=0nul0
Cls
Echo.
Echo                               setting menu Ver2!!
echo. 
echo O========================O                 O=========O
echo I        Category        I                 I setting I
echo O========================O=================O=========O=========O==========O
echo I%clr%                        %clr2%I 1 Cofrm reboot when Chenged Curosor I  %setting1onoff%   I
echo I%clr% Cursor Changer funtion %clr2%I                                     O==========O
echo I%clr%                        %clr2%I 2 Admin When Boot                   I  %setting2onoff%   I
echo O========================I                                     O==========O
Echo O  category  up or down  I %clr%3 Fastbooting%clr2%                       I  %setting3onoff%   I
Echo O========================I                                     O==========O
Echo I                        I 4 Long press detection of enter     I  %setting4onoff%   I
echo I Cursor Changer  appear I                                     O==========O
echo I                        I 5 Initialization or Uninstallation             I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%       Help  Mode       %clrhelp2%I  I  Move: W A S D  Num I Back : B I Slct : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12345wsabye /n /m "Specify what you want to change by number or by moving with wasd :"
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
title Curor Changer Setting %debugmode%
set selected=0nul0
Cls
Echo.
Echo                               setting menu Ver2!!
echo. 
echo O========================O                 O=========O
echo I        Category        I                 I setting I
echo O========================O=================O=========O=========O==========O
echo I%clr%                        %clr2%I 1 Cofrm reboot when Chenged Curosor I  %setting1onoff%   I
echo I%clr% Cursor Changer funtion %clr2%I                                     O==========O
echo I%clr%                        %clr2%I 2 Admin When Boot                   I  %setting2onoff%   I
echo O========================I                                     O==========O
Echo O  category  up or down  I 3 Fastbooting                       I  %setting3onoff%   I
Echo O========================I                                     O==========O
Echo I                        I %clr%4 Long press detection of enter%clr2%     I  %setting4onoff%   I
echo I Cursor Changer  appear I                                     O==========O
echo I                        I 5 Initialization or Uninstallation             I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%       Help  Mode       %clrhelp2%I  I  Move: W A S D  Num I Back : B I Slct : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12345wsabye /n /m "Specify what you want to change by number or by moving with wasd :"
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
title Curor Changer Setting %debugmode%
set selected=0nul0
Cls
Echo.
Echo                               setting menu Ver2!!
echo. 
echo O========================O                 O=========O
echo I        Category        I                 I setting I
echo O========================O=================O=========O=========O==========O
echo I%clr%                        %clr2%I 1 Cofrm reboot when Chenged Curosor I  %setting1onoff%   I
echo I%clr% Cursor Changer funtion %clr2%I                                     O==========O
echo I%clr%                        %clr2%I 2 Admin When Boot                   I  %setting2onoff%   I
echo O========================I                                     O==========O
Echo O  category  up or down  I 3 Fastbooting                       I  %setting3onoff%   I
Echo O========================I                                     O==========O
Echo I                        I 4 Long press detection of enter     I  %setting4onoff%   I
echo I Cursor Changer  appear I                                     O==========O
echo I                        I %clr%5 Initialization or Uninstallation %clr2%            I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%       Help  Mode       %clrhelp2%I  I  Move: W A S D  Num I Back : B I Slct : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12345wsabye /n /m "Specify what you want to change by number or by moving with wasd :"
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
title Curor Changer Setting %debugmode%
set selected=0nul0
Cls
Echo.
Echo                               setting menu Ver2!!
echo. 
echo O========================O                 O=========O
echo I        Category        I                 I setting I
echo O========================O=================O=========O=========O==========O
echo I                        I 1 Boot animation                    I  %setting5onoff%   I
echo I Cursor Changer funtion I                                     O==========O
echo I                        I 2 %wmodeonoff%                         I
echo O========================I                                                I
Echo O  category  up or down  I                                                I
Echo O========================I                                                I
Echo I%clr%                        %clr2%I                                                I
echo I%clr% Cursor Changer  appear %clr2%I                                                I
echo I%clr%                        %clr2%I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%       Help  Mode       %clrhelp2%I  I  Move: W A S D  Num I Back : B I Slct : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12wsdbye3 /n /m "Specify what you want to change by number or by moving with wasd :"
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
title Curor Changer Setting %debugmode%
set selected=0nul0
Cls
Echo.
Echo                               setting menu Ver2!!
echo. 
echo O========================O                 O=========O
echo I        Category        I                 I setting I
echo O========================O=================O=========O=========O==========O
echo I                        I %clr%1 Boot animation%clr2%                    I  %setting5onoff%   I
echo I Cursor Changer funtion I                                     O==========O
echo I                        I 2 %wmodeonoff%                         I
echo O========================I                                                I
Echo O  category  up or down  I                                                I
Echo O========================I                                                I
Echo I%clr%                        %clr2%I                                                I
echo I%clr% Cursor Changer  appear %clr2%I                                                I
echo I%clr%                        %clr2%I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%       Help  Mode       %clrhelp2%I  I  Move: W A S D  Num I Back : B I Slct : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12wsabye /n /m "Specify what you want to change by number or by moving with wasd :"
if %ErrorLevel%==1 goto settingcategory2intsetting1
if %ErrorLevel%==2 goto settingcategory2intsetting2
if %ErrorLevel%==3 goto settingcategory2intsetting1
if %ErrorLevel%==4 goto settingcategory2intsetting2
if %ErrorLevel%==5 goto settingcategory2int
if %ErrorLevel%==6 goto settingcategory2int
if %ErrorLevel%==7 goto setting5
if %ErrorLevel%==8 goto setting5

:settingcategory2intsetting2
title Curor Changer Setting %debugmode%
set selected=0nul0
Cls
Echo.
Echo                               setting menu Ver2!!
echo. 
echo O========================O                 O=========O
echo I        Category        I                 I setting I
echo O========================O=================O=========O=========O==========O
echo I                        I 1 Boot animaion                     I  %setting5onoff%   I
echo I Cursor Changer funtion I                                     O==========O
echo I                        I %clr%2 %wmodeonoff%%clr2%                         I
echo O========================I                                                I
Echo O  category  up or down  I                                                I
Echo O========================I                                                I
Echo I%clr%                        %clr2%I                                                I
echo I%clr% Cursor Changer  appear %clr2%I                                                I
echo I%clr%                        %clr2%I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%       Help  Mode       %clrhelp2%I  I  Move: W A S D  Num I Back : B I Slct : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12wsabye3 /n /m "Specify what you want to change by number or by moving with wasd :"
if %ErrorLevel%==1 goto settingcategory2intsetting1
if %ErrorLevel%==2 goto settingcategory2intsetting2
if %ErrorLevel%==3 goto settingcategory2intsetting1
if %ErrorLevel%==4 goto settingcategory2intsetting2
if %ErrorLevel%==5 goto settingcategory2int
if %ErrorLevel%==6 goto settingcategory2int
if %ErrorLevel%==7 goto wmode
if %ErrorLevel%==8 goto wmode


:settingcategoryhelpmode
rem ÉÅÉÇ Ç±Ç±ÇÃï™äÚÇÃtrueÇÃÇ∆Ç±ÇÎÇ…ÅAclrÇÃêFÇïœÇ¶ÇÈèàóùÇí«â¡ÇµÇΩÇ¢ÅBchoiceÇÃíºå„Ç…ï™äÚÇ≈Ç‡Ç∆Ç…ñﬂÇ∑èàóùÇ‡í«â¡ÇµÇƒ
if {%settinghelptoggle%}=={true} (set settinghelp=enabled. )
if {%settinghelptoggle%}=={false} (set settinghelp=disabled.)
title Curor Changer Setting %debugmode%
set selected=0nul0
Cls
echo.
Echo                               setting menu Ver2!!
echo. 
echo O========================O                 O=========O
echo I        Category        I                 I setting I
echo O========================O=================O=========O====================O
echo I                        I                                                I
echo I Cursor Changer funtion I  Help Mode. After selecting this function,     I
echo I                        I  Select the you want to see an overview of it, I
echo O========================I  You can see an overview of it.                I
Echo O  category  up or down  I                                                I
Echo O========================I  If you want to disable help mode,             I
Echo I                        I  select this feature again.                    I
echo I Cursor Changer  appear I                                                I
echo I                        I  Help mode is %settinghelp%                        I
echo O========================O==O=====================O==========O============O
echo I%clr%       Help  Mode       %clr2%I  I  Move: W A S D  Num I Back : B I Slct : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12wsbye3 /n /m "Specify what you want to change by number or by moving with wasd :"
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





rem ê›íËÇÃìKópÇ∆ämîF
rem ê›íËÇ™ë∂ç›Ç∑ÇÈÇ©ÇÃåüèÿ
:setting1
if {%settinghelptoggle%}=={true} (goto setting1help)
find "rebootokey=false" CursorChangerSettings.txt > nul
if %ErrorLevel%==0 set setting1setonoff=enable& goto setting1okey
if %ErrorLevel%==1 set setting1setonoff=Repair& goto setting1onoff

:setting1onoff
find "rebootokey=true" CursorChangerSettings.txt > nul
if %ErrorLevel%==0 set setting1setonoff=disable

:setting1okey
cls
set selected=0nul0
echo Confirm restart after cursor change to %setting1setonoff%?(Y=Yes N=No B=Back)
SET /P selected= :
echo %selected% has selected.
if {%selected%}=={y} (goto :setting1y)
if {%selected%}=={n} (goto :setting1n)
if {%selected%}=={back} (goto :settingcategory1intsetting1)
if {%selected%}=={b} (goto :settingcategory1intsetting1)
goto setting1okey

:setting1y
find "rebootokey=false" CursorChangerSettings.txt > nul
echo Applying settings...
if %ErrorLevel%==1 goto setting1ygo3test
if %ErrorLevel%==0 goto setting1ygo1

:setting1ygo3test
find "rebootokey=true" CursorChangerSettings.txt > nul
if %ErrorLevel%==1 echo rebootokey=true >> CursorChangerSettings.txt
if %ErrorLevel%==0 goto setting1ygo2

:setting1ygo2
powershell "(gc CursorChangerSettings.txt) -replace 'rebootokey=true','rebootokey=false' | sc CursorChangerSettings.txt"
goto setting1yokey

:setting1ygo1
powershell "(gc CursorChangerSettings.txt) -replace 'rebootokey=false','rebootokey=true' | sc CursorChangerSettings.txt"
goto setting1yokey

:setting1yokey
cls
Echo The change was made successfully.
Pause
set wantload=setting1
call :batbootprogress
Goto settingcategory1intsetting1

:setting1n
cls
Echo Did not change settings
Pause
goto settingcategory1intsetting1

:setting2
if {%settinghelptoggle%}=={true} (goto setting2help)
find "admin=false" CursorChangerSettings.txt > nul
if %ErrorLevel%==0 set setting2setonoff=enable& goto setting2okey
if %ErrorLevel%==1 set setting2setonoff=Repair& goto setting2onoff

:setting2onoff
find "admin=true" CursorChangerSettings.txt > nul
if %ErrorLevel%==0 set setting2setonoff=disable

:setting2okey
cls
echo Do you want to %setting2setonoff% the request for administrative privileges at startup?(Y=Yes N=No B=Back)
SET /P selected= :
echo %selected% has selected.
if {%selected%}=={y} (goto :setting2y)
if {%selected%}=={n} (goto :setting2n)
if {%selected%}=={back} (goto :settingcategory1intsetting2)
if {%selected%}=={b} (goto :settingcategory1intsetting2)
goto setting2okey

:setting2y
find "admin=false" CursorChangerSettings.txt > nul
echo Applying settings...

if %ErrorLevel%==1 goto setting2ygo3test
if %ErrorLevel%==0 goto setting2ygo1

:setting2ygo3test
find "admin=true" CursorChangerSettings.txt > nul
if %ErrorLevel%==1 echo admin=true >> CursorChangerSettings.txt
if %ErrorLevel%==0 goto setting2ygo2

:setting2ygo2
powershell "(gc CursorChangerSettings.txt) -replace 'admin=true','admin=false' | sc CursorChangerSettings.txt"
goto setting2yokey

:setting2ygo1
powershell "(gc CursorChangerSettings.txt) -replace 'admin=false','admin=true' | sc CursorChangerSettings.txt"
goto setting2yokey

:setting2yokey
cls
Echo The change was made successfully.

Pause
set wantload=setting2
call :batbootprogress
Goto settingcategory1intsetting2

:setting2n
cls
Echo Did not change settings.
Pause
goto settingcategory1intsetting2

:setting3
if {%settinghelptoggle%}=={true} (goto setting3help)
find "fastboot=false" CursorChangerSettings.txt > nul
if %ErrorLevel%==0 set setting3setonoff=enable& goto setting3onoff
if %ErrorLevel%==1 set setting3setonoff=Repair&goto setting3onoff

:setting3onoff
find "fastboot=true" CursorChangerSettings.txt > nul
if %ErrorLevel%==0 set setting3setonoff=disable&set setting3warning=
:setting3okey
cls
echo Do you want to set fast startup to be %setting3setonoff%? (Y=Yes N=No B=Back)
SET /P selected= :
echo %selected% has selected
if {%selected%}=={y} (goto :setting3y)
if {%selected%}=={n} (goto :setting3n)
if {%selected%}=={back} (goto :settingcategory1intsetting3)
if {%selected%}=={b} (goto :settingcategory1intsetting3)
goto setting3okey

:setting3y
find "fastboot=false" CursorChangerSettings.txt > nul
echo Applying settings...

if %ErrorLevel%==1 goto setting3ygo3test
if %ErrorLevel%==0 goto setting3ygo1

:setting3ygo3test
find "fastboot=true" CursorChangerSettings.txt > nul
if %ErrorLevel%==1 echo fastboot=false >> CursorChangerSettings.txt
if %ErrorLevel%==0 goto setting3ygo2

:setting3ygo2
powershell "(gc CursorChangerSettings.txt) -replace 'fastboot=true','fastboot=false' | sc CursorChangerSettings.txt"
goto setting3yokey

:setting3ygo1
powershell "(gc CursorChangerSettings.txt) -replace 'fastboot=falsee','fastboot=true' | sc CursorChangerSettings.txt"
goto setting3yokey

:setting3n
cls
Echo Did not change settings.
Pause
goto settingcategory1intsetting3

:setting3yokey
cls
Echo The change was made successfully.
Pause
set wantload=setting3
call :batbootprogress
Goto settingcategory1intsetting3

:setting4
if {%settinghelptoggle%}=={true} (goto setting4help)
find "typoswaning=false" CursorChangerSettings.txt > nul
if %ErrorLevel%==0 set setting4setonoff=enable&goto setting4okey
if %ErrorLevel%==1 set setting4setonoff=Repair&goto setting4onoff

:setting4onoff
find "typoswaning=true" CursorChangerSettings.txt > nul
if %ErrorLevel%==0 set setting4setonoff=disable

:setting4okey
cls
echo Do you want to %setting4setonoff% the enter key long press detection function? (Y=Yes N=No B=Back)
SET /P selected= :
echo %selected% has selected.
if {%selected%}=={y} (goto :setting4y)
if {%selected%}=={n} (goto :setting4n)
if {%selected%}=={back} (goto :settingcategory1intsetting4)
if {%selected%}=={b} (goto :settingcategory1intsetting4)
goto setting4okey

:setting4y
find "typoswaning=false" CursorChangerSettings.txt > nul
echo Applying settings...

if %ErrorLevel%==1 goto setting4ygo3test
if %ErrorLevel%==0 goto setting4ygo1

:setting4ygo3test
find "typoswaning=true" CursorChangerSettings.txt > nul
if %ErrorLevel%==1 echo typoswaning=true >> CursorChangerSettings.txt
if %ErrorLevel%==0 goto setting4ygo2

:setting4ygo2
powershell "(gc CursorChangerSettings.txt) -replace 'typoswaning=true','typoswaning=false' | sc CursorChangerSettings.txt"
goto setting4yokey

:setting4ygo1
powershell "(gc CursorChangerSettings.txt) -replace 'typoswaning=false','typoswaning=true' | sc CursorChangerSettings.txt"
goto setting4yokey

:setting4yokey
cls
Echo The change was made successfully.
Pause
set wantload=setting4
call :batbootprogress
Goto settingcategory1intsetting4

:setting4n
cls
Echo Did not change settings.
Pause
goto settingcategory1intsetting4

:setting5
if {%settinghelptoggle%}=={true} (goto setting5help)
find "bootanimation=false" CursorChangerSettings.txt > nul
if %ErrorLevel%==0 set setting5setonoff=enable&goto setting5okey
if %ErrorLevel%==1 set setting5setonoff=Repair&goto setting5onoff

:setting5onoff
find "bootanimation=true" CursorChangerSettings.txt > nul
if %ErrorLevel%==0 set setting5setonoff=disbale

:setting5okey
cls
echo Do you want the boot animation to be %setting5setonoff%? (Y=Yes N=No B=Back)
SET /P selected= :
echo %selected% has selected.
if {%selected%}=={y} (goto :setting5y)
if {%selected%}=={n} (goto :setting5n)
if {%selected%}=={back} (goto :settingcategory2intsetting1)
if {%selected%}=={b} (goto :settingcategory2intsetting1)
goto setting5okey

:setting5y
find "bootanimation=false" CursorChangerSettings.txt > nul
echo Applying settings...

if %ErrorLevel%==1 goto setting5ygo3test
if %ErrorLevel%==0 goto setting5ygo1

:setting5ygo3test
find "bootanimation=true" CursorChangerSettings.txt > nul
if %ErrorLevel%==1 echo bootanimation=true >> CursorChangerSettings.txt
if %ErrorLevel%==0 goto setting5ygo2

:setting5ygo2
powershell "(gc CursorChangerSettings.txt) -replace 'bootanimation=true','bootanimation=false' | sc CursorChangerSettings.txt"
goto setting5yokey

:setting5ygo1
powershell "(gc CursorChangerSettings.txt) -replace 'bootanimation=false','bootanimation=true' | sc CursorChangerSettings.txt"
goto setting5yokey

:setting5yokey
cls
Echo The change was made successfully.
Pause
set wantload=setting5
call :batbootprogress
Goto settingcategory2intsetting1

:setting5n
cls
Echo Did not change settings.
Pause
goto settingcategory2intsetting1


:wmode
if {%settinghelptoggle%}=={true} (goto wmodehelp)
cd /d %HOMEDRIVE%%HOMEPATH%
:wmodetest
find "wmode=false" CursorChangerSettings.txt > nul
if %ErrorLevel%==0 set wmodesetonoff=white
if %ErrorLevel%==1 set wmodesetonoff=Repair the theme settings and restore the normal& goto wmodeonoff

:wmodeonoff
find "wmode=true" CursorChangerSettings.txt > nul
if %ErrorLevel%==0 set wmodesetonoff=dark

cls
echo Do you want a %wmodesetonoff% theme for Cursor Changer?(Y=Yes N=No B=Back)
SET /P selected= :
rem ÉeÅ[É}ÇÃï™äÚ
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
echo 
echo.
pause
goto wmode

:wmodey
find "wmode=false" CursorChangerSettings.txt > nul
echo Applying theme...
if %ErrorLevel%==1 goto wmodeygo3test
if %ErrorLevel%==0 goto wmodeygo1

:wmodeygo3test
find "wmode=true" CursorChangerSettings.txt > nul
if %ErrorLevel%==1 echo wmode=false >> CursorChangerSettings.txt&goto wmodeygo1
if %ErrorLevel%==0 goto wmodeygo2

:wmodeygo2
powershell "(gc CursorChangerSettings.txt) -replace 'wmode=true','wmode=false' | sc CursorChangerSettings.txt"
goto wmodeyokey

:wmodeygo1
powershell "(gc CursorChangerSettings.txt) -replace 'wmode=false','wmode=true' | sc CursorChangerSettings.txt"
goto wmodeyokey

:wmodeyokey
Title Cursor Changer
find "wmode=false" CursorChangerSettings.txt > nul
if %ErrorLevel%==0 color 07
if %ErrorLevel%==1 goto wmodeonoffkenti
:wmodeonoffkenti
find "wmode=true" CursorChangerSettings.txt > nul
if %ErrorLevel%==0 color f0
cls
echo Successfully Changed to %wmodesetonoff% theme.
Pause
set wantload=wmode
call :batbootprogress
if {%wmodetoggle%}=={false} (set clr=[7m&set clr2=[0m)
if {%wmodetoggle%}=={true} (set clr=[100m[97m&set clr2=[0m[107m[30m)
Goto settingcategory2intsetting2

:no01
cls
echo No changes were made to the %wmodesetonoff% theme.
pause
Goto :settingcategory2intsetting2

rem ê›íËÇÃÉwÉãÉv
:setting1help
cls
echo Needless to say, there is a part of the batch process that checks for a restart after using the cursor change function,
echo which is the main part of the batch process, but this setting makes it possible to change the cursor seamlessly by setting that part to disable. This is a feature that will probably not be used very often, as few people will want to change the cursor very often.
echo This setting is true by default.
pause
goto settingcategory1intsetting1

:setting2help
cls
echo This setting is intended to prevent errors when changing cursors by running Cursor Changer with administrative privileges.
echo It is recommended that this setting be set to true only if there is an error or failure to change the cursor.
echo Setting this to true may reduce startup time.
echo This setting is false by default.
pause
goto settingcategory1intsetting2

:setting3help
cls
echo As the name suggests, this setting reduces startup time.
echo If this setting is set to true, some processing will be skipped (without affecting the main processing).
echo Startup time is reduced by like 0.5 ~ 0.25 seconds, depending on PC specifications.
echo This setting is false by default.
pause
goto settingcategory1intsetting3

:setting4help
cls
echo This setting is a little confusing, but simply put, it comes up when you press and hold enter without typing anything on the screen that appears when you start the batch,
echo This function allows you to turn off/on warning messages.
echo It is easier to understand this if you actually experience it, but, well, you have to press and hold enter for about 50~250 times,
echo It would be like a warning message being displayed. But sometimes people find this annoying, so we have added a setting that allows you to turn this feature off.
echo This setting is true by default.
pause
goto settingcategory1intsetting4

:setting5help
cls
echo This setting is a setting that makes the boot animation that always plays at each startup, so to speak, false and hidden.
echo Setting this setting to false will reduce startup time and annoyance.
echo This setting is true by default.
pause
goto settingcategory2intsetting1

:wmodehelp
cls
echo This changes the CMD screen to white or black.
echo This will allow, for example, the screen to be unified with a white theme, and also accommodate those who prefer it that way.
echo The standard color is black, but after setting it to white, the screen will automatically turn white when it is started up in the future.
echo Also, as a bit of backstory, this setting was placed on the home side until 1.10 or earlier. This feature is also the source of the internal structure of the setting.
echo By default, it is a dark theme.
pause
goto settingcategory2intsetting2
 
:alldefhelp
cls
echo This is the uninstall menu. This menu uninstalls Cursor Changer.
echo This menu contains functions to display the path to the configuration file (the text file in which the settings are recorded) and to initialize (set to default) the settings.
echo If uninstallation is performed, the Cursor Changer itself will be removed and (optional) cursors will be removed by default. (Optional) The configuration and files for detecting the first startup will also be completely removed.
echo Please do so at your own risk.
pause
goto settingcategory1intsetting5

rem ÉoÉbÉ`ÇÃÉoÅ[ÉWÉáÉì
:batver
echo.
echo Cursor Changer ver %batver%   2021-2023
if %hazimeeaster%==true echo %batbuild%
title CCursor Changer thenks so much %username%
powershell sleep -m 200
echo and...
powershell sleep -m 200
echo create by tamago_1908

pause
cls
goto hazime

rem ìdëÏ
:startcal
set q=0
set number1=0
set number2=0
set number3=0
cls
echo Calculations up to the value of 2147483647 (upper limit for int type. Calculations above this limit are not allowed due to the specification)
echo.
title Cursor calculator

rem ÉVÉìÉvÉãÉÇÅ[Éh
:simplemodecal
set q=0
set number1=0
set number2=0
set number3=0

echo If you want to enter an equation to calculate, enter 3.
echo.
echo To return, type back.
echo.
echo + or -
echo Select 1 for addition, or 2 for subtraction.
set /p q=
rem ìdëÏÇÃï™äÚ
if {%q%}=={back} (goto hazime)
if {%q%}=={b} (goto hazime)
if {%q%}=={1} (set whatnumber=addressee&goto startcal2)
if {%q%}=={2} (set whatnumber=subtracter&goto startcal2) 
if {%q%}=={3} (goto advancemodecal) else (
echo Invalid select.&pause&goto startcal)

:startcal2
echo.
set /p number1=Enter the %whatnumber% :
if {%q%}=={1} (goto pcal)
if {%q%}=={2} (goto mcal)

:pcal
set /p number3=Enter the side to be added :
set /a number1=number1+number3
echo result : %number1%
pause
cls
goto simplemodecal

:mcal
set /p number3=Enter the side to be subtracted :
set /a number1=number1-number3
echo result : %number1%
pause
cls
goto simplemodecal

rem ÉAÉhÉoÉìÉXÉÇÅ[Éh
:advancemodecal

:loopcal
cls
echo To end, type back.
SET /P formula="Enter the formula to be calculated."
SET /A result=%formula%
if "%formula%"=="back" goto :startcal
echo result ÅF%Result%
pause
goto loopcal

:cursorchange
rem ÉÅÉÇÅ@ïœêîÇ≈ï™äÚÇµÇƒÅAïœçXÇ∑ÇÈÅBÉfÉtÉHÉãÉgÇÉxÅ[ÉXÇ…çÏê¨
rem Cursor ChangerÇÃÉÅÉCÉìã@î\ÅBÇ±ÇÍÇ™Ç»Ç´Ç·énÇ‹ÇÁÇ»Ç¢
cls
echo                              Cursor Changer%batver% %debugmode%
title Cursor *Changer* %debugmode%
echo.
SET /P selected=Would you like to revert to %cursorcolor% color?(Y=Yes / N=No / B=Back)
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
echo Please provide valid input.
echo.
pause
goto default

:no0
echo Change has been canceled.
pause
goto hazime

:yes0
if exist CursorChangerSettings.txt goto henkoudefo
if not exist CursorChangerSettings.txt goto saisyonokeikoku
rem ê›íËÇÃèëÇ´çûÇ›(default)
:saisyonokeikoku
type nul > CursorChangerSettings.txt
echo nodogcheckfor1234567890qwertyuiop >> CursorChangerSettings.txt
echo fastboot=false >> CursorChangerSettings.txt
echo wmode=false >> CursorChangerSettings.txt
echo admin=false >> CursorChangerSettings.txt
echo rebootokey=true >> CursorChangerSettings.txt
echo typoswaning=true >> CursorChangerSettings.txt
echo bootanimation=true >> CursorChangerSettings.txt

rem åxçêÉÅÉbÉZÅ[ÉWÅAèââÒãNìÆéûå¿íË
cls
echo only at first startup
powershell sleep -m 500
cls
echo.
powershell sleep -m 100
color 04
echo                                    !WANING!
powershell sleep -m 200
color 0c
powershell sleep -m 100
color 07
powershell sleep -m 500
echo.
echo This bat file (Cursor Changer) is simply a script that makes the cursor default, or black.
powershell sleep -m 2000
echo Although we are sure that there is no such thing, the creator of this script, Eggs Around There, will not be held responsible for any damage or computer damage that may occur in the use of this script!
pause
echo.
echo.
rem åxçêÇÃï™äÚÅBnoÇì¸óÕÇ∑ÇÈÇ∆CursorChangerSettings.txtÇ™çÌèúÇ≥ÇÍÇÈÅB
:warningfirstchenge
SET /P selected=Do you understand?(Y=Yes yes yes yes, YES! / N=No No No No, NO!)
if {%selected%}=={n} (del CursorChangerSettings.txt & goto exit)
if {%selected%}=={no} (del CursorChangerSettings.txt & goto exit) 
if {%selected%}=={yes} (goto henkoudefo)
if {%selected%}=={y} (goto henkoudefo)
echo %selected% was selected.
echo.
echo ?
pause
echo.
echo Please provide valid input.
pause
goto warningfirstchenge
:henkoudefo
if {%cursorcolor%}=={çï} (goto kurogotest)
if {%selected%}=={îí} (goto defgotest)
cls

:defgotest
reg query "HKEY_CURRENT_USER\Control Panel\Cursors" /v "Scheme Source" | find "0x0"
cls
if {%ErrorLevel%}=={0} (goto sudenidef)
if {%ErrorLevel%}=={1} (goto defgo)

:sudenidef
rem å∂ÇÃåxçêÉÅÉbÉZÅ[ÉWÅBåªç›Ç≈ÇÕÇ±ÇÍÇ™ï\é¶Ç≥ÇÍÇÈÇ±Ç∆ÇÕÇŸÇ⁄Ç†ÇËìæÇ»Ç¢ÅB
title alrady white
rundll32 user32.dll,MessageBeep
echo WHAT, HOW!! WHAT THE, NO AWAY ITS IMPOSSIBLE!! UHH Don't come close to meeee!
goto exit

:kurogotest
reg query "HKEY_CURRENT_USER\Control Panel\Cursors" /v "Scheme Source" | find "0x2"
cls
if {%ErrorLevel%}=={0} (goto sudenikuro)
if {%ErrorLevel%}=={1} (goto kurogo)

:sudenikuro
rem å∂ÇÃåxçêÉÅÉbÉZÅ[ÉWÅBç°åªç›Ç≈ÇÕÇ±ÇÍÇ™ï\é¶Ç≥ÇÍÇÈéñÇÕÇŸÇ⁄Ç†ÇËìæÇ»Ç¢ÅB
title alrady black
rundll32 user32.dll,MessageBeep
echo WHAT, HOW!! WHAT THE, NO AWAY ITS IMPOSSIBLE!! UHH Don't come close to meeee!
goto exit

rem ÉJÅ[É\ÉãÇÃêFÇîíÇ…ïœçXÇ∑ÇÈ
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
echo Defaults have been restored.
pause
goto reboot

rem ÉJÅ[É\ÉãÇÃêFÇçïÇ…ïœçXÇ∑ÇÈÅB
:kurogo
pause
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /ve /f /d "Windows çï "
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
echo Changed.
pause
goto reboot

rem dogcheckÅBCursorChangerSettings.txtÇ™ë∂ç›Ç∑ÇÈÇ©Çåüèÿ
:AllDefult
cd /d %HOMEDRIVE%%HOMEPATH%
if {%settinghelptoggle%}=={true} (goto alldefhelp)
if exist CursorChangerSettings.txt goto AllDefulttest
if not exist CursorChangerSettings.txt goto Dogcheck

:Dogcheck
rem dogcheck, respect tobyfox and dog

if {%firststartbat%}=={yes} (cls&echo First change the cursor color!&echo.&pause&goto hazime)
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
find "nodogcheckfor1234567890qwertyuiop" CursorChangerSettings.txt
cls
if %ErrorLevel%==0 goto AllDefult1
if %ErrorLevel%==1 goto Dogcheck
rem ÉAÉìÉCÉìÉXÉgÅ[ÉãÉÅÉjÉÖÅ[
:AllDefult1
title Uninstall title Cursor Changer (experimental)
Cls
echo Choose how to uninstall. b to go back.
echo Press the number you want to select or use w to go to the top or s to go to the bottom item, select the desired part and then enter the y or e key to confirm.
echo.
echo 1 Delete all data related to this bat file and turn cursor back to white
echo.
echo 2 Delete everything, leaving the cursor intact
echo.
echo 3 Initialize settings
echo.
echo 4 Display configuration file path
echo.
echo Nothing is currently selected.
choice /c 1234wsb /n /m ""
if %ErrorLevel%==1 goto alldefselect1
if %ErrorLevel%==2 goto alldefselect2
if %ErrorLevel%==3 goto alldefselect3
if %ErrorLevel%==4 goto alldefselect4
if %ErrorLevel%==5 goto alldefselect1
if %ErrorLevel%==6 goto alldefselect1
if %ErrorLevel%==7 goto settingcategory1intsetting5

rem ÉAÉìÉCÉìÉXÉgÅ[ÉãÉÅÉjÉÖÅ[ÇÃï™äÚ
:alldefselect1
Cls
echo Choose how to uninstall. b to go back.
echo Press the number you want to select or use w to go to the top or s to go to the bottom item, select the desired part and then enter the y or e key to confirm.
echo.
echo %clr%1 Delete all data related to this bat file and turn cursor back to white%clr2%
echo.
echo 2 Delete everything, leaving the cursor intact
echo.
echo 3 initialize settings
echo.
echo 4 Display configuration file path
echo.
echo 1 is currently selected. press y or e key to confirm.
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


rem ÉAÉìÉCÉìÉXÉgÅ[ÉãÉÅÉjÉÖÅ[ÇÃï™äÚ
:alldefselect2
Cls
echo Choose how to uninstall. b to go back.
echo Press the number you want to select or use w to go to the top or s to go to the bottom item, select the desired part and then enter the y or e key to confirm.
echo.
echo 1 Delete all data related to this bat file and turn cursor back to white
echo.
echo %clr%2 Delete everything, leaving the cursor intact%clr2%
echo.
echo 3 Initialize settings
echo.
echo 4 Display the file path of the configuration
echo.
echo 2 is currently selected. press y or e key to confirm.
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

rem ÉAÉìÉCÉìÉXÉgÅ[ÉãÉÅÉjÉÖÅ[ÇÃï™äÚ
:alldefselect3
Cls
echo Choose how to uninstall. b to go back.
echo Press the number you want to select or use w to go to the top or s to go to the bottom item, select the desired part and then enter the y or e key to confirm.
echo.
echo 1 Delete all data related to this bat file and turn cursor back to white
echo.
echo 2 Delete everything, leaving the cursor intact
echo.
echo %clr%3 Initialize settings%clr2%
echo.
echo 4 Display the file path of the configuration
echo.
echo 3 is currently selected. press y or e key to confirm.
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

rem ÉAÉìÉCÉìÉXÉgÅ[ÉãÉÅÉjÉÖÅ[ÇÃï™äÚ
:alldefselect4
Cls
echo Choose how to uninstall. b to go back.
echo Press the number you want to select or use w to go to the top or s to go to the bottom item, select the desired part and then enter the y or e key to confirm.
echo.
echo 1 Delete all data related to this bat file and turn cursor back to white
echo.
echo 2 Delete everything, leaving the cursor intact
echo.
echo 3 Initialize settings
echo.
echo %clr%4 Display the file path of the configuration%clr2%
echo.
echo 4 is currently selected. Press y or e key to confirm.
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


rem ê›íËÇÃèâä˙âªÇÇ∑ÇÈç€ÇÃåxçêÉÅÉbÉZÅ[ÉW
:alldefsettingonly
cls
:alldefsettingonlyokey
echo This menu will initialize your settings. Thus, everything you have ever set will be returned to its default settings. (Return to the settings you had when you first started Cursor Changer.) Are you sure? (Y=Yes / N=No)
choice /c yn /n /m ""
if %ErrorLevel%==1 goto alldefsettingonlyokey2
if %ErrorLevel%==2 goto alldefsettingno
:alldefsettingonlyokey2
echo Are you sure you want to delete it?(Y=Yes / N=No)
choice /c yn /n /m ""
if %ErrorLevel%==1 goto alldefsettingyes
if %ErrorLevel%==2 goto alldefsettingno
goto alldefsettingonly

:alldefsettingyes
echo Initializes the configuration file. All previous settings will be deleted.
echo If you wish to cancel, exit the batch process at this point.
pause
cls
type nul > CursorChangerSettings.txt
echo nodogcheckfor1234567890qwertyuiop >> CursorChangerSettings.txt
echo fastboot=false >> CursorChangerSettings.txt
echo wmode=false >> CursorChangerSettings.txt
echo admin=false >> CursorChangerSettings.txt
echo rebootokey=true >> CursorChangerSettings.txt
echo typoswaning=true >> CursorChangerSettings.txt
echo bootanimation=true >> CursorChangerSettings.txt
title ...
echo Initialization is complete. In order to apply the changes, Cursor Changer will close. Please restart Cursor Changer to apply the changes.
goto exit

:alldefsettingno
cls
echo Settings were not initialized.
pause
:alldefsettingno2
cls
echo Do you want to keep going to the uninstall menu or go back to the home?
echo Which do you want to do? (return to settings=1 / uninstall menu=2)
choice /c 12 /n /m ""
if %ErrorLevel%==1 goto settingcategory1intsetting5
if %ErrorLevel%==2 goto :alldefselect3
goto alldefsettingno2

:alldefshowsettingpass
cls
echo Displays the path where the configuration file is located.
start explorer %HOMEDRIVE%%HOMEPATH%
powershell sleep 5
echo Depending on your environment, you will most likely find CursorChangerSettings.txt at the bottom or at the top.
pause
cls
:alldefshowsettingpass2
echo Do you want to keep going to the uninstall menu or go back to the home?
echo Which do you want to do? (return to settings=1 / uninstall menu=2)
choice /c 12 /n /m ""
if %ErrorLevel%==1 goto settingcategory1intsetting5
if %ErrorLevel%==2 goto alldefselect4
goto alldefshowsettingpass2

:alldefselectokey
if %alldefselect%==3 goto alldefsettingonly
if %alldefselect%==4 goto alldefshowsettingpass
cls
color 9f
title Uninstall of the Cursor Changer %debugmode%.
echo This uninstall menu will restore all registry and first-time record files modified by this batch file and remove Cursor Changer itself.
pause
cls
echo In other words, using this feature will cause the mouse cursor to be initial white, and this batch file to be deleted completely, and Cursor Changer will have to be installed again in order to use it again!
echo (it does not initialize the OS)
pause
cls
echo In addition, the creator, tamago1908, assumes no responsibility for any damage or disadvantage resulting from the execution of the uninstallation!
echo.
pause
:AllDefultOkey
SET /P selected=Are you sure?(Y=Yes / N=No / B=Back)
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
echo Enter the valid choice.
echo.
pause
cls
goto AllDefultOkey

:no2
set alldefno2clr=[96m
set alldefno2clr2=[40m[3m
cls
color 0B
echo %alldefno2clr2%%alldefno2clr%Let's turn back the clock...
powershell sleep 2
find "wmode=false" CursorChangerSettings.txt > nul
if %ErrorLevel%==0 color 07
if %ErrorLevel%==1 goto wmodeonoffkenti
:wmodeonoffkentialldefno2
find "wmode=true" CursorChangerSettings.txt > nul
if %ErrorLevel%==0 color f0
goto hazime

:yes2
rem ÉAÉìÉCÉìÉXÉgÅ[ÉãÇÃç≈èIämîF
set selected=null
SET /P selected=Really good?(Y=Yes / N=No / B=Back)
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
echo Enter valid choice.
pause
cls
goto yes2


:yes2final
rem ÉAÉìÉCÉìÉXÉgÅ[ÉãÇÃç≈èIämîF ÉVÅ[ÉYÉìÇQ
set selected=null
echo.
rundll32 user32.dll,MessageBeep
SET /P selected=%alldefclr%You don't want to go back? (You can't go back!)%alldefclr2%(Y=Yes / N=No / B=Back)
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
echo Enter valid choice.
pause
cls
goto yes2final

:yes2go
rem à¯Ç´â∫Ç™ÇÍÇ»Ç¢ÅBóàÇÈ...ÉbÅI
cls
color 9f
echo Execute. If you want to return, stop the batch file.
pause

rem ÉAÉìÉCÉìÉXÉgÅ[ÉãÉÅÉjÉÖÅ[ÇÃó·äOèàóù FIrstCursorÇ™Ç»Ç¢èÍçáÇÃÅBÇæÇØÇ«èÁí∑ÇæÇ©ÇÁâ¸ëPÇµÇΩÇ¢ÅB
rem ó·äOèàóùÇÇ‡Ç§ÇøÇÂÇ¡Ç∆ëùÇ‚ÇµÇΩÇ¢ÅBó·Ç¶ÇŒÅAíÜêgÇâ¸ë¢ÇµÇ»Ç¢å¿ÇËê‚ëŒÇ…Ç†ÇËÇ¶Ç»Ç¢èÛë‘Ç…Ç»Ç¡ÇΩèÍçáÇ…ÅAgotoÇµÇƒïœêîÇ≈ï™äÚÇµÇƒÉÅÉbÉZÅ[ÉWÇïœçXÇ∑ÇÈÇ›ÇΩÇ¢Ç…ÇµÇƒÅB
cd /d %HOMEDRIVE%%HOMEPATH%
if not exist FIrstCursor.txt set erroralldefwhatdelete=FIrstCursor & goto erroralldef1
:testerroralldef
if not exist CursorChangerSettings.txt set erroralldefwhatdelete=CursorChangerSettings & goto erroralldef1
set erroralldefwhatdelete=FIrstCursor.txt,CursorChangerSettings.txt,
goto alldefnow

:erroralldef1
mode con: cols=100 lines=30
color 1f
rem ÉÅÉbÉZÅ[ÉWï\é¶
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
echo *** MEMORY LOG: 57 68 61 74 20 74 68 65 20 66 75 63 6b 69 6e 67 20 61 72 65 20 79 6f 75 20 74 68 69 6e 6b 69 6e 67 3f
echo.
echo Beginning dump of physical memory
echo physical memory dump complete.
echo Contact your system administrator or technical support group for further echo assistance.
goto :erroralldef1massage

:erroralldef1massage
echo Dim answer:answer = MsgBox("Do you know what happens?",vbOKCancel,"error"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul
if {%errorlevel%}=={1} (goto :erroralldef2massage)
if {%errorlevel%}=={2} (goto :erroralldef2massage)

:erroralldef2massage
echo Dim answer:answer = MsgBox("This error occurs when a file that should be present when everything is restored to defaults is not present.",vbOKCancel,"cause of the error"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul
rem ÉtÉ@ÉCÉãçÌèú
del /Q %TEMP%\msgbox.vbs
goto erroralldef3massage

:erroralldef3massage
echo Dim answer:answer = MsgBox("Well, perhaps you deleted %erroralldefwhatdelete% when you ran AllDefult.",vbYesno,"The real cause of the error"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul
if {%errorlevel%}=={6} (goto :erroralldef3massageok)
if {%errorlevel%}=={7} (goto :erroralldef3massageno)
goto erroralldef3massage

:erroralldef3massageok
echo Dim answer:answer = MsgBox("I knew it.",vbOKCancel,"ERROR"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
rem ÉtÉ@ÉCÉãçÌèú
del /Q %TEMP%\msgbox.vbs
exit

:erroralldef3massageno
echo Dim answer:answer = MsgBox("Oops. But if you really mean that this happened due to a bug, please tell the producer and have them fix it.",vbOKCancel,"error?"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %ERRORLEVEL% > nul
del /Q %TEMP%\msgbox.vbs
exit

rem ÉAÉìÉCÉìÉXÉgÅ[ÉãÉÅÉjÉÖÅ[ÇÃëIëÇÃîªï 
:alldefnow
cls
color 07
if %alldefselect%==1 goto alldefnowhenkou
if %alldefselect%==2 goto alldefnowsettingdel

rem ÉAÉìÉCÉìÉXÉgÅ[ÉãÉÅÉjÉÖÅ[ÇÃëIëÇ…âûÇ∂ÇƒÇÃï™äÚ
:alldefnowsettingdel
del FIrstCursor.txt
del CursorChangerSettings.txt
goto alldefnowfinish

:alldefnowhenkou
del FIrstCursor.txt
del CursorChangerSettings.txt
rem ÉAÉìÉCÉìÉXÉgÅ[ÉãÇÃÇΩÇﬂÇÃÉJÅ[É\ÉãÇÃèâä˙âªÅBîíÇ…ñﬂÇ∑
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
rem ÉAÉìÉCÉìÉXÉgÅ[ÉãäÆóπå„ÇÃÉÅÉbÉZÅ[ÉW
cls
title Good bye! %debugmode%.
echo Everything has been returned to default.
pause
echo I guess this is Goodbye... well Goodbye.
pause
rem é©êgÇÃÉpÉXÇéÊìæÇµÇƒÅAé©ï™é©êgÇçÌèú
del %~0
goto exit

:reboot
rem ê›íËÇ…âûÇ∂ÇƒrebootÉÅÉbÉZÅ[ÉWÇçƒê∂Ç∑ÇÈÇ©Ç«Ç§Ç©ÇÃîªï 
find "rebootokey=false" CursorChangerSettings.txt
if {%errorlevel%}=={0} (goto rebootexit)
if {%errorlevel%}=={1} (goto rebootoktest)
cls

:rebootexit
exit

:rebootoktest
find "rebootokey=true" CursorChangerSettings.txt
if {%errorlevel%}=={0} (goto reboot1)
if {%errorlevel%}=={1} (goto reboot1)
cls

:reboot1
rem çƒãNìÆÇÃämîF
title çƒãNìÆÇÃämîF %debugmode%
cls
SET /P selected=çƒãNìÆÇµÇ‹Ç∑Ç©ÅHçƒãNìÆÇµÇ»Ç¢èÍçáÇÕïœçXÇ™ìKópÇ≥ÇÍÇ‹ÇπÇÒ(Y=Yes / N=No / S=Skip)
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
echo Enter the valid choice.
pause
goto rebootok

:nore
echo It was not rebooted.
pause
echo ...
pause
goto higan

:yesre
echo rebooting...
pause
shutdown /r /t 2
goto reboot

:higan
title earnest wish %debugmode%
SET /P selected=Then please at least sign out.....(Y=Yes / N=No / B=Back)
if {%selected%}=={egg} (goto :secret)
if {%selected%}=={y} (goto :yes)
if {%selected%}=={yes} (goto :yes)
if {%selected%}=={n} (goto :nohi)
if {%selected%}=={no} (goto :nohi)
if {%selected%}=={back} (goto :rebootok)
if {%selected%}=={b} (goto :rebootok)

echo ?
pause
echo Enter the valid choice.
pause
goto higan

:nohi
echo.
echo okey fine...
goto exit

:yes
echo thank you...
goto Lock

:testwipmenu
echo wip menu with test function
echo
echo

:secret
rem ÉCÅ[ÉXÉ^Å[ÉGÉbÉO
title how %debugmode%
echo What? how you know that word: ....
pause
SET /P selected=Where did you learn this word?
if {%selected%}=={hack} (goto :secrethentai)
if {%selected%}=={idk} (goto :secretnomal)
if {%selected%}=={i dont know} (goto :secretnomal)
if {%selected%}=={I looked inside} (goto :secrethentai)
if {%selected%}=={intuition} (goto :secretnomal)

if {%selected%}=={tyokkan} (goto :secretnomal) else (goto secretnomal)

echo.
echo ?
pause
echo.
echo Enter the valid choice.
pause
goto rebootok

:secretnomal
echo What? Does that mean you did it on a hunch?
pause
echo No way...?
goto exit
:secrethentai
echo Crikey! %USERNAME%!
goto exit


:testinthecalbeep
rem ÉeÉXÉgã@î\
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
cls
echo This has not been translated yet. Please wait for translation.
pause
goto hazime


rem ê^ÇÃÉCÅ[ÉXÉ^Å[ÉGÉbÉOÅH
PowerShell -WindowStyle Hidden -Command Exit
title 
cls
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"\", '', 'OK', 'none');exit $result;"
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"...\", '', 'OK', 'none');exit $result;"
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"Ç»Ç©Ç›\", '', 'OK', 'Warning');exit $result;"
PowerShell -WindowStyle Normal -Command Exit
cls
title Ç›ÇΩÇÃÅH
:eastereggh
cls
set ealoop=0
:eastereggloop
echo Ç›ÇΩÇÃÅH
set /a ealoop=%ealoop+1
if %ealoop% gtr 10 (goto eastereggloopout)
goto eastereggloop
:eastereggloopout
powershell sleep 0.5
PowerShell -WindowStyle Hidden -Command Exit
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"Ç›  ÇΩ  ÇÃ  ÅH\", 'Ç›ÇΩÇÃÅH', 'yesno', 'Warning');exit $result;"
if {%errorlevel%}=={6} (goto eastereggif1yes) else if {%errorlevel%}=={7} (goto eastereggif1no)

:eastereggif1yes
cls
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"Ç†ÇÕÇÕÇÕÇ†Ç†ÇÕÇ†Ç–Ç·\", '', 'OK', 'Exclamation');exit $result;"
set eaif1loop=0
:eastereggif1yesloop
start cmd.exe
set /a eaif1loop=eaif1loop+1
if %eaif1loop% gtr 5 (goto eastereggif1yesloopout)
goto eastereggif1yesloop
:eastereggif1yesloopout
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"Ç»ÇÒÇ≈ÅH\", '', 'OK', 'Question');exit $result;"
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"Ç»ÇÒÇ≈ÅH\", '', 'OK', 'Question');exit $result;"
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"Ç»ÇÒÇ≈Ç»ÇÒÇ≈Ç»ÇÒÇ≈Ç»ÇÒÇ≈Ç»ÇÒÇ≈Ç»ÇÒÇ≈Ç»ÇÒÇ≈Ç»ÇÒÇ≈Ç»ÇÒÇ≈Ç»ÇÒÇ≈Ç»ÇÒÇ≈Ç»ÇÒÇ≈Ç»ÇÒÇ≈Ç»ÇÒÇ≈Ç»ÇÒÇ≈Ç»ÇÒÇ≈Ç»ÇÒÇ≈Ç»ÇÒÇ≈Ç»ÇÒÇ≈Ç»ÇÒÇ≈Ç»ÇÒÇ≈Ç»ÇÒÇ≈Ç»ÇÒÇ≈Ç»ÇÒÇ≈Ç»ÇÒÇ≈Ç»ÇÒÇ≈Ç»ÇÒÇ≈Ç»ÇÒÇ≈Ç»ÇÒÇ≈Ç»ÇÒÇ≈Ç»ÇÒÇ≈Ç»ÇÒÇ≈Ç»ÇÒÇ≈Ç»ÇÒÇ≈Ç»ÇÒÇ≈Ç»ÇÒÇ≈Ç»ÇÒÇ≈Ç»ÇÒÇ≈Ç»ÇÒÇ≈Ç»ÇÒÇ≈Ç»ÇÒÇ≈Ç»ÇÒÇ≈ÅHÅHÅHÅHÅHÅHÅHÅHÅHÅHÅHÅHÅHÅHÅHÅHÅHÅHÅH\", '', 'OK', 'Question');exit $result;"
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"ãñÇ≥Ç»Ç¢\", '', 'OK', 'Warning');exit $result;"
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"ÉEÉFÉuÉJÉÅÉâÇ÷ÇÃÉAÉNÉZÉXÇ™ãëî€Ç≥ÇÍÇ‹ÇµÇΩÅB\", 'ÉAÉNÉZÉTÉäÇ™óòópÇ≈Ç´Ç‹ÇπÇÒ', 'OK', 'Error');exit $result;"
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"ãñÇ≥Ç»Ç¢ãñÇ≥Ç»Ç¢ãñÇ≥Ç»Ç¢ãñÇ≥Ç»Ç¢ãñÇ≥Ç»Ç¢\", '', 'OK', 'warning');exit $result;"
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"C:/ Ç…ÉAÉNÉZÉXÇ≈Ç´Ç‹ÇπÇÒÅBÉAÉNÉZÉXÇ™ãëî€Ç≥ÇÍÇ‹ÇµÇΩ\", 'èÍèäÇ™óòópÇ≈Ç´Ç‹ÇπÇÒÅB', 'OK', 'Error');exit $result;"
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"\", 'èÍèäÇ™óòópÇ≈Ç´Ç‹ÇπÇÒÇ≈ÇµÇΩÅB', 'OK', 'Error');exit $result;"
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"ãñ Ç≥ Ç» Ç¢\", '', 'OK', 'warning');exit $result;"
taskkill /f /im explorer.exe
PowerShell -WindowStyle normal -Command Exit
start explorer.exe
title ÅHÅHÅHÅHÅHÅHÅHÅHÅHÅHÅHÅHÅHÅHÅHÅH
color 47
cls
pause
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo Ç®
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo Ç®ëO
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo Ç®ëOÇÕ
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo Ç®ëOÇÕå„
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo Ç®ëOÇÕå„â˜
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo Ç®ëOÇÕå„â˜Ç∑
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo Ç®ëOÇÕå„â˜Ç∑ÇÈ
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo Ç®ëOÇÕå„â˜Ç∑ÇÈÇ◊
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo Ç®ëOÇÕå„â˜Ç∑ÇÈÇ◊Ç´
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo Ç®ëOÇÕå„â˜Ç∑ÇÈÇ◊Ç´Çæ
ping -n 1 127.0.0.1 > nul 2>&1
powershell sleep 2.5
cls
echo ÉçÉbÉNÉ_ÉEÉìÉtÉFÅ[ÉYÇé¿çsÇµÇƒÇ¢Ç‹Ç∑...
powershell sleep 0.5
cls
title ñ≥å¿ÉçÉbÉNÉ_ÉEÉìÇ©ÇÁî≤ÇØèoÇ∑èÍçáÇÕÅAÉçÉbÉNâÊñ Ç©ÇÁçƒãNìÆÇçsÇ¡ÇƒÇ≠ÇæÇ≥Ç¢...
echo êîïbå„ÅAã≠êßñ≥å¿ÉçÉbÉNÉ_ÉEÉìÇ™é¿çsÇ≥ÇÍÇ‹Ç∑...
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
rem ÉeÉXÉgã@î\Ç∆ÉCÅ[ÉXÉ^Å[ÉGÉbÉO
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
goto syokaicolorlogo

:batstarthelp
echo ____________help menu for bat arguments
echo.
echo devmode      ^- cursor chenger is will boot up with devmenu and devmode.
echo help     ^- cursor chenger is will boot up with help txt (this screen)
echo bypsvck     ^- cursor chenger is will boot up with bypass windows ver check.
echo bypsloadsg     ^- cursor chenger is will boot up with bypass load setting.
echo enablesimpleboot     ^- cursor chenger is will boot up with simple boot menu.
echo.
pause
exit

:openiedev
cls
echo InternetExplorer is will open.
echo CreateObject("InternetExplorer.Application").Visible=true > %TEMP%\openie.vbs & %TEMP%\openie.vbs
del %temp%\openie.vbs
powershell sleep 0.2
goto hazime

:allcommands
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
echo          %clryel%ÅE%clr2%inspectentirecommandlist %clrgra%(Displays all available commands.)%clr2%
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
echo                     %clred%[%clr2%Bat argument commands%clred%]%clr2%
echo.
echo            %clrcyan%-%clr2% help              %clrgra%(show available arguments.)%clr2%
echo            %clrcyan%-%clr2% enablesimpleboot  %clrgra%(Boot up with Simple txt.)%clr2%
echo            %clrcyan%-%clr2% bypsdisexit       %clrgra%(Bypass disabling the exit button.)%clr2%
echo            %clrcyan%-%clr2% bypsloadsg        %clrgra%(Bypass the loading of settings.)%clr2%
echo            %clrcyan%-%clr2% bypsvck           %clrgra%(Bypass the windows version check.)%clr2%
echo.
echo                     %clrgrn%[%clr2%fulldebug commands%clrgrn%]%clr2%
echo.
echo            %clrcyan%-%clr2% goto %clrgra%(goto for labels that exist.)%clr2%
echo            %clrcyan%-%clr2% set  %clrgra%(create new variable.)%clr2%
echo            %clrcyan%-%clr2% help %clrgra%(Show commands available in fulldebug.)%clr2%
echo.
echo %clred%^/^/%clr2%[Type something to back to menu...]                           %clrgra%%batver%%clr2%
pause >nul
set clrcyan=
set clrgra=
set clred=
set clrgrn=
set clryel=
set clrmag=
goto hazime


:fulldebug
set fulldebugsetvariable=0null0
set fulldebugvariableapply=0null0
title ^(for debug^) cursor variable
echo.
echo start up fulldebug...
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
cls&pause&echo hello! this is easteregg!&pause&cls&title The build number is now displayed in the main menu and the About section in the hidden features.&echo and bye!&pause&cls&set hazimeeaster=true&goto hazime


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