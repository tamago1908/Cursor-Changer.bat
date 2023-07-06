@echo off
setlocal

rem これは英語版です！もし日本語版をダウンロードしたい場合は、日本語の名前の物をダウンロードしてください。

rem カーソル替え by tamago_1908
rem Cursor Changer by tamago_1908


rem https://github.com/tamago1908/cursor-changer.bat 


rem サイズの指定
mode con: cols=75 lines=25

rem メモ cd %~dp0 &start %~n0%~x0&exit true活用できるかも (bat再起動)
rem コードの最初に入れれる処理の数は限られています(入れすぎると起動が遅くなる可能性) (遅くなった (手遅れ(何とかなった)) )
rem ビルドナンバーとバージョンの記入は必ずしてください！あとアーカイブに入れるのを忘れずに！
rem そして最近、このバッチ処理に英語を多く含めるようにしている。なぜなら、将来的にこのバッチ処理を翻訳することになった時、日本語が多いと面倒だから。
title Cursor Changer
rem VER v1.12
set batver=1.12
set batbuild=build 44
set hazimeeaster=false
set firststartbat=no
rem 制作にあたって使用したソフト windows notepad v10.2103.12.0 使用フォント　Nirmala UIの太字
rem 2021年12月09日から windows notepad v10.2110.64.0 Nirmala UIの太字
rem メイン Visual Studio Code
rem デバック用 Visual bat

:argmentcheck
rem 引数がなければ終了
if "%~1"=="" goto argmentcheckend
title Cursor Changer argment checking...
rem 引数を配列に格納
setlocal enabledelayedexpansion
set i=0
for %%a in (%*) do (
  set /a i+=1
  set arg[!i!]=%%a
)

rem 配列の要素数を取得
set n=%i%
rem 配列の要素を順番に処理
for /l %%i in (1,1,%n%) do (
  rem 例外処理用の変数の初期化。あとで使用します。
  set argmentserror=true
  rem 現在の要素を取得
  set current=!arg[%%i]!
  rem 現在の要素が空でなければ処理
  if not "!current!"=="" (
    rem 現在の要素と一致する要素を空にする（重複排除）
    for /l %%j in (%%i,1,%n%) do (
      if "!arg[%%j]!"=="!current!" set arg[%%j]=
    )
    rem 現在の要素に応じた処理を行う
    if "!current!"=="bypsdisexit" (echo disableexitbutton is bypassed.&set disableexit=false&set argmentserror=false)
    if "!current!"=="enablesimpleboot" (title simpleboot is enabled.&set simpleboot=true&set argmentserror=false)
    if "!current!"=="devmode" (call :developermenu&set argmentserror=false)
    if "!current!"=="help" (call :batstarthelp&set argmentserror=false)
    if "!current!"=="bypsvck" (echo winver check is bypassed.&set bypasswinvercheck=true&set argmentserror=false)
    if "!current!"=="bypsadm" (echo getadmin is bypassed.&set adminbypass=true&set adminbypass=false&set argmentserror=false)
    if "!current!"=="bypsloadsg" (echo setting load is bypassed.&set settingbypass=true&set argmentserror=false)
rem 例外処理
   if "!argmentserror!"=="true" (title Cursor Changer argment error&echo unvalid argment or something went worng ^(!current!^) error. please set valid argment. ^(or use ^"help^" ^)
      )
    )
  )
)
:argmentcheckend
setlocal disabledelayedexpansion
set argmentserror=
timeout 3 >nul

rem windowsバージョン判断
rem ちょっと不具合あるかも。一部のバージョンでは正常にフィルターが動作しない可能性がある。
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
if {%errorlevel%}=={0} (set windowsverfilter=windows8.1以前&goto batbootcheckwinverbad) else set windowsverfilter=windows vista以前（古すぎます！） goto batbootcheckwinverbad

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
rem 本処理 (変数のセットとか、前段階)
set bootbatnow=yes
set exitbuttondisabled=false
rem 管理者権限を保有しているかの確認
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
rem 管理者権限を保有している状態で、exitボタンをfalseにすると、稀にウイルスとして検出されてしまう場合がある。なので、管理者権限保有時と、disableexitという変数がfalseの場合は、処理をバイパスしている。
if {%disableexit%}=={false} (goto batbootdisabledexitbutton)

:batbootdisableexitbutton
rem startid~powershell までのコードはずらしてはいけない　それ以前かそれ以後ならok
:: StartID1908
call :getLineNumber startLine StartID1908 0
goto batbootdisableexitbuttonendcode
:batbootdisableexitbuttoncodestart
set /a startline=startline+4&set /a endline=endline-3
title booting up cursor changer...&echo Please wait a while.&powershell -NoProfile -ExecutionPolicy Unrestricted "$s=[System.Management.Automation.ScriptBlock]::create((Get-Content \"%~f0\" -TotalCount $env:endline|Where-Object{$_.readcount -gt $env:startline }) -join \"`n\");&$s" %*&goto batbootdisabledexitbutton
#終了ボタンを無効化
#Calling user32.dll methods for Windows and Menus
$code = @'
using System;
using System.Runtime.InteropServices;

namespace CloseButtonToggle {

// 関数の宣言

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

// 宣言終了

// 必要な引数の設定
   const int GWL_STYLE = -16;
   const int WS_MAXIMIZEBOX = 0x00010000;

   const uint SC_MAXIMIZE = 0xF030; 
   const uint MF_BYCOMMAND = 0;

// メインの処理
internal static void ChangeCurrentState(bool state) {
     IntPtr hWnd = GetConsoleWindow();
     int style = GetWindowLong(hWnd, GWL_STYLE);
     if (state) {
       style |= WS_MAXIMIZEBOX; // 最大化ボタンを有効にする
     } else {
       style &= ~WS_MAXIMIZEBOX; // 最大化ボタンを無効にする
     }
     SetWindowLong(hWnd, GWL_STYLE, style);
     DrawMenuBar(hWnd);
   }
 }
// 変更の確認
 public static class Status {
   public static void Disable() {
     WinAPI.ChangeCurrentState(false); //オンにするなら 'true' に変更
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

rem 本処理
:batbootdisabledexitbutton
set startline=&set endline=&set exitbuttondisabled=
cd /d %HOMEDRIVE%%HOMEPATH%
find "fastboot=true" CursorChangerSettings.txt
cls
if {%errorlevel%}=={0} (goto batstart) else (goto nofastboot)
:nofastboot

rem goofy ahh txts

rem ###################
rem #    HELLO　WORLD    #  
rem ###################

REM Notification, YOU SHOULD READ IT
rem In the Japanese version, which is the main development version, there were tons of patch notes (going back to 2.x.x before 1.x), roadmaps, and tons of other information in this section, which have been removed in the English version (because the translation burden was too much)! (because of too much translation burden), so fastboot makes little sense. It may be possible that it will be translated in the future, but it will be incomplete.
rem As for the most recent patch notes, they can be found on github. Also, if I haven't forgotten, there will be some new feature snake peaks on github.
rem At any given time, the most development will be in Japanese, but the burden of adding major new features, etc. will be too much (given that it is all developed by one person!). ), so it may be integrated into Japanese or English at some point. (This is just an idea at this point, so it may not be unified, or if there is someone who can do the translation for us, that may not be the case.) However, it is a fact that development in English is a bit burdensome. (Because the author is not a native English speaker and needs to translate from his native language.)
rem Well, I have no intention to stop developing in English, but just in case.


rem ############################################################################################################################
:fastboot

rem 最初の起動なのかを検知
:syokaicolorlogo
cd /d %HOMEDRIVE%%HOMEPATH%
if exist FIrstCursor.txt set firststartbat=no&set bootbatnow=yes&goto :batstart
if exist CursorChangerSettings.txt title &echo AY BRO!! WHAT ARE U DOING??&pause&cls&echo You deleted firstcurosr for the pastime or something!&pause&cls&echo Why is there a CursorChangerSettings.txt but no FIrstCursor.txt? That's crazy, right? &pause&cls&echo You should be sorry, %username%！&pause&cls&echo What a joke. ...... but I am sure that FIrstCursor.txt does not exist. &pause&cls&echo If you don't want to hear this message again, you can either delete the configuration file as well or re-create FIrstCursor.txt yourself.&pause&cls&goto exit
if not exist FIrstCursor.txt set firststartbat=yes& goto :syokaiboot

rem 初回起動限定のアニメーションを再生
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
echo 　rso
powershell sleep -m 100
cls

color 0b
echo 　　er
powershell sleep -m 100
cls

color 0c
echo 　　　Cen
powershell sleep -m 100
cls

color 0d
echo 　　　　Ge
powershell sleep -m 100
cls

color 0e
echo 　　　　  r
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
rem 初期起動処理

rem 管理者権限のプロンプトに関する設定を検知、
:batstart
cls
rem 管理者権限設定の検知
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
rem 管理者権限の取得
rem このコード、冗長すぎる気がする。もしかしたらpowershellを使ってもっと短縮できるかも。
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

rem 初回起動かを検知
cd /d %HOMEDRIVE%%HOMEPATH%
rem 場所 OSが入ったドライブ:\Users\ユーザー名
rem (例 ユーザーの名前がtestだった場合と、OSが入った場所がCドライブだった場合だと C:\Users\Test)
if exist FIrstCursor.txt goto hazime
if not exist FIrstCursor.txt goto saisyonokidou

rem 初回起動時のメッセージ
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
title TROLL FACE LOLLL
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
rem ブートアニメーションを再生。5分の1の確率で別バージョンが再生される。ramdomの仕様(？)によって二回連続でrandomをしないといけない。
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
rem 設定の欠損を確認

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
rem 自動修復
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

rem 設定とその他のロード
rem 何を読み込み、読み込んだ後どこにgotoしたいかを変数に代入必要 set wantload=setting1 set whatloadgoto=hazime 等 hazime関係の場合はそれオンリー
rem カーソルの色に関してはメインの変更部分には実装していません。変更してからhazimeに戻って来れるように設計してないので。
rem 設定を追加する場合は基本コピペで大丈夫。ただ、メニューの見た目とかにかかわるものではコードを追加しないといけないかも
:settingloads
if {%bootbatnow%}=={no} (goto whatload) else (goto setting1load)
cls
echo WHATTTT!? ITS IMPOSSIBLE!!!!!
pause
goto exit
:setting1load
rem ホワイトモードの検知と色の変更。変更の高速化のため序盤に配置。
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
rem 設定の欠損を検証
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
if {%ErrorLevel%}=={0} (set wmodeonoff=Chenge to white mode&set wmodetoggle=false) else if {%ErrorLevel%}=={1} (set wmodeonoff=  null  テーマに変更&set wmodetoggle=false&set /a allsettingerror=allsettingerror+1)
if {%bootbatnow%}=={yes} (set batloadprgs=6&call :batbootprogress)
if {%bootbatnow%}=={yes} (goto loads) else (goto whatloadgoto)

:loads
:wmodehazimeload
rem ホワイトモードを検知して色を変更
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
rem デバックモードの検知
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
rem FIrstCursorの検知
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
rem カーソルの色を検知
rem 0x0は白
rem 0x2は黒
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
rem ブートアニメーション。
rem 下は読み込み時のテキスト分岐。
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
rem 37 全角
rem 74 半角
exit /b
:batbootinitializetionvariable
set loadscrnprgs9=
set loadscrnprgs10=
set loadscrnprgsclr=
set loadscrnprgsclr2=
goto hazimemenu

:whatload
cls
rem ここの処理、いるかなぁ？普通にsettingの値が欲しいだけならsetting1loadとかにgotoしたうえで行き先をwhatloadgotoに代入すれば動くと思うんだけど....
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

rem メニューの生成の準備
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

rem メニューの描写
rem 規則は5,10,20
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

rem 選択の分岐
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

rem イースターエッグ
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

rem デバッグ用コマンドの参照
if {%selected%}=={inspectentirecommandlist} (goto :allcommands)

rem デバッグ用
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

rem 何も入力しなかった場合の帰還処理
:hatenahazime
echo ?
echo.
pause
echo Can you type somethings?
echo.
pause
find "typoswaning=false" CursorChangerSettings.txt > nul
if {%errorlevel%}=={0} (goto hazime)

rem 長押しを検知するための機構
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

rem 長押しの警告メッセージ集
:hatenaoko1
if %hatenaita% gtr 21 (goto :hazime)
echo Dim answer:answer = MsgBox("uh, What are you doing?",vbOKCancel,"huh?"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
rem ファイル削除
del /Q %TEMP%\msgbox.vbs
goto :hazime

:hatenaoko2
if %hatenaita% gtr 51 (goto :hazime)
echo Dim answer:answer = MsgBox("oh hell nah You don't make that many typos!",vbOKCancel,"Maybe..."):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
rem ファイル削除
del /Q %TEMP%\msgbox.vbs
goto :hazime

:hatenaoko3
if %hatenaita% gtr 101 (goto :hazime)
echo Dim answer:answer = MsgBox("Bro You're right, you wouldn't make a hundred typing mistakes! You've got to be kidding me!",vbOKCancel,"premeditated crime"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
rem ファイル削除
del /Q %TEMP%\msgbox.vbs
goto :hazime

:hatenaoko4
if %hatenaita% gtr 131 (goto :hazime)
echo Dim answer:answer = MsgBox("Hey Stop Doing That!",vbOKCancel,"..."):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
rem ファイル削除
del /Q %TEMP%\msgbox.vbs
goto :hazime

:hatenaoko5
if %hatenaita% gtr 201 (goto :hazime)
echo Dim answer:answer = MsgBox("Do this any more and I will make you regret it. 200 times...",vbOKCancel,"Final Waning"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
rem ファイル削除
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
rem メッセージ表示
echo Dim answer:answer = MsgBox("You erased the contents of the firstcursor.txt file as a prank... I know everything!",vbOKCancel,"Get it back or it will flow FOREVER."):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
rem ファイル削除
del /Q %TEMP%\msgbox.vbs
rem メッセージ表示
echo Dim answer:answer = MsgBox("If you want to fix it, put nodogcheckforfastboot in firstcursor.txt.",vbOKCancel,"Get it back."):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
rem ファイル削除
del /Q %TEMP%\msgbox.vbs
exit


rem 終了処理とそれの確認
rem todolist, ここの部分にGUIを実装して、再起動とかの機能を付ける。
:exitmenu
title Exit confirm %debugmode% 
set selected=0nul0
echo.
SET /P selected=Do you really exit?（yes or no）:
if {%selected%}=={yes} (exit)
if {%selected%}=={y} (exit)
if {%selected%}=={no} (goto :hazimemenu)
if {%selected%}=={n} (goto :hazimemenu)
if {%selected%}=={back} (goto :hazimemenu)
if {%selected%}=={b} (goto :hazimemenu)
goto :hazimemenu


rem 設定メニューの描写
:setting
set wantload=0null0
set settinghelptoggle=false
if {%wmodetoggle%}=={false} (set clr=[7m&set clr2=[0m)
if {%wmodetoggle%}=={true} (set clr=[100m[97m&set clr2=[0m[107m[30m)
if defined %wmodetoggle% (set clr=[7m&set clr2=[0m)
rem 設定ファイルが存在するかを検知
cd /d %HOMEDRIVE%%HOMEPATH%
rem 場所 OSが入ったドライブ:\Users\ユーザー名
rem (例 ユーザーの名前がtestだった場合と、OSが入った場所がCドライブだった場合だと C:\Users\Test)
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
rem 設定ファイルが存在するかを検知
cd /d %HOMEDRIVE%%HOMEPATH%
rem 場所 OSが入ったドライブ:\Users\ユーザー名
rem (例 ユーザーの名前がtestだった場合と、OSが入った場所がCドライブだった場合だと C:\Users\Test)
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

rem category内部

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
rem メモ ここの分岐のtrueのところに、clrの色を変える処理を追加したい。choiceの直後に分岐でもとに戻す処理も追加して
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





rem 設定の適用と確認
rem 設定が存在するかの検証
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
rem テーマの分岐
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

rem 設定のヘルプ
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

rem バッチのバージョン
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

rem 電卓
:startcal
set q=0
set number1=0
set number2=0
set number3=0
cls
echo Calculations up to the value of 2147483647 (upper limit for int type. Calculations above this limit are not allowed due to the specification)
echo.
title Cursor calculator

rem シンプルモード
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
rem 電卓の分岐
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

rem アドバンスモード
:advancemodecal

:loopcal
cls
echo To end, type back.
SET /P formula="Enter the formula to be calculated."
SET /A result=%formula%
if "%formula%"=="back" goto :startcal
echo result ：%Result%
pause
goto loopcal

:cursorchange
rem メモ　変数で分岐して、変更する。デフォルトをベースに作成
rem Cursor Changerのメイン機能。これがなきゃ始まらない
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
rem 設定の書き込み(default)
:saisyonokeikoku
type nul > CursorChangerSettings.txt
echo nodogcheckfor1234567890qwertyuiop >> CursorChangerSettings.txt
echo fastboot=false >> CursorChangerSettings.txt
echo wmode=false >> CursorChangerSettings.txt
echo admin=false >> CursorChangerSettings.txt
echo rebootokey=true >> CursorChangerSettings.txt
echo typoswaning=true >> CursorChangerSettings.txt
echo bootanimation=true >> CursorChangerSettings.txt

rem 警告メッセージ、初回起動時限定
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
rem 警告の分岐。noを入力するとCursorChangerSettings.txtが削除される。
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
if {%cursorcolor%}=={黒} (goto kurogotest)
if {%selected%}=={白} (goto defgotest)
cls

:defgotest
reg query "HKEY_CURRENT_USER\Control Panel\Cursors" /v "Scheme Source" | find "0x0"
cls
if {%ErrorLevel%}=={0} (goto sudenidef)
if {%ErrorLevel%}=={1} (goto defgo)

:sudenidef
rem 幻の警告メッセージ。現在ではこれが表示されることはほぼあり得ない。
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
rem 幻の警告メッセージ。今現在ではこれが表示される事はほぼあり得ない。
title alrady black
rundll32 user32.dll,MessageBeep
echo WHAT, HOW!! WHAT THE, NO AWAY ITS IMPOSSIBLE!! UHH Don't come close to meeee!
goto exit

rem カーソルの色を白に変更する
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

rem カーソルの色を黒に変更する。
:kurogo
pause
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /ve /f /d "Windows 黒 "
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

rem dogcheck。CursorChangerSettings.txtが存在するかを検証
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
rem アンインストールメニュー
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

rem アンインストールメニューの分岐
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


rem アンインストールメニューの分岐
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

rem アンインストールメニューの分岐
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

rem アンインストールメニューの分岐
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


rem 設定の初期化をする際の警告メッセージ
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
rem アンインストールの最終確認
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
rem アンインストールの最終確認 シーズン２
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
rem 引き下がれない。来る...ッ！
cls
color 9f
echo Execute. If you want to return, stop the batch file.
pause

rem アンインストールメニューの例外処理 FIrstCursorがない場合の。だけど冗長だから改善したい。
rem 例外処理をもうちょっと増やしたい。例えば、中身を改造しない限り絶対にありえない状態になった場合に、gotoして変数で分岐してメッセージを変更するみたいにして。
cd /d %HOMEDRIVE%%HOMEPATH%
if not exist FIrstCursor.txt set erroralldefwhatdelete=FIrstCursor & goto erroralldef1
:testerroralldef
if not exist CursorChangerSettings.txt set erroralldefwhatdelete=CursorChangerSettings & goto erroralldef1
set erroralldefwhatdelete=FIrstCursor.txt,CursorChangerSettings.txt,
goto alldefnow

:erroralldef1
mode con: cols=100 lines=30
color 1f
rem メッセージ表示
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
rem ファイル削除
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
rem ファイル削除
del /Q %TEMP%\msgbox.vbs
exit

:erroralldef3massageno
echo Dim answer:answer = MsgBox("Oops. But if you really mean that this happened due to a bug, please tell the producer and have them fix it.",vbOKCancel,"error?"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %ERRORLEVEL% > nul
del /Q %TEMP%\msgbox.vbs
exit

rem アンインストールメニューの選択の判別
:alldefnow
cls
color 07
if %alldefselect%==1 goto alldefnowhenkou
if %alldefselect%==2 goto alldefnowsettingdel

rem アンインストールメニューの選択に応じての分岐
:alldefnowsettingdel
del FIrstCursor.txt
del CursorChangerSettings.txt
goto alldefnowfinish

:alldefnowhenkou
del FIrstCursor.txt
del CursorChangerSettings.txt
rem アンインストールのためのカーソルの初期化。白に戻す
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
rem アンインストール完了後のメッセージ
cls
title Good bye! %debugmode%.
echo Everything has been returned to default.
pause
echo I guess this is Goodbye... well Goodbye.
pause
rem 自身のパスを取得して、自分自身を削除
del %~0
goto exit

:reboot
rem 設定に応じてrebootメッセージを再生するかどうかの判別
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
rem 再起動の確認
title 再起動の確認 %debugmode%
cls
SET /P selected=再起動しますか？再起動しない場合は変更が適用されません(Y=Yes / N=No / S=Skip)
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
rem イースターエッグ
rem btw this easteregg is little good quality so maybe i will delete this.
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
rem テスト機能
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


rem 真のイースターエッグ？
PowerShell -WindowStyle Hidden -Command Exit
title 
cls
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"\", '', 'OK', 'none');exit $result;"
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"...\", '', 'OK', 'none');exit $result;"
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"なかみ\", '', 'OK', 'Warning');exit $result;"
PowerShell -WindowStyle Normal -Command Exit
cls
title みたの？
:eastereggh
cls
set ealoop=0
:eastereggloop
echo みたの？
set /a ealoop=%ealoop+1
if %ealoop% gtr 10 (goto eastereggloopout)
goto eastereggloop
:eastereggloopout
powershell sleep 0.5
PowerShell -WindowStyle Hidden -Command Exit
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"み  た  の  ？\", 'みたの？', 'yesno', 'Warning');exit $result;"
if {%errorlevel%}=={6} (goto eastereggif1yes) else if {%errorlevel%}=={7} (goto eastereggif1no)

:eastereggif1yes
cls
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"あはははああはあひゃ\", '', 'OK', 'Exclamation');exit $result;"
set eaif1loop=0
:eastereggif1yesloop
start cmd.exe
set /a eaif1loop=eaif1loop+1
if %eaif1loop% gtr 5 (goto eastereggif1yesloopout)
goto eastereggif1yesloop
:eastereggif1yesloopout
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"なんで？\", '', 'OK', 'Question');exit $result;"
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"なんで？\", '', 'OK', 'Question');exit $result;"
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"なんでなんでなんでなんでなんでなんでなんでなんでなんでなんでなんでなんでなんでなんでなんでなんでなんでなんでなんでなんでなんでなんでなんでなんでなんでなんでなんでなんでなんでなんでなんでなんでなんでなんでなんでなんでなんでなんでなんでなんでなんでなんで？？？？？？？？？？？？？？？？？？？\", '', 'OK', 'Question');exit $result;"
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"許さない\", '', 'OK', 'Warning');exit $result;"
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"ウェブカメラへのアクセスが拒否されました。\", 'アクセサリが利用できません', 'OK', 'Error');exit $result;"
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"許さない許さない許さない許さない許さない\", '', 'OK', 'warning');exit $result;"
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"C:/ にアクセスできません。アクセスが拒否されました\", '場所が利用できません。', 'OK', 'Error');exit $result;"
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"\", '場所が利用できませんでした。', 'OK', 'Error');exit $result;"
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"許 さ な い\", '', 'OK', 'warning');exit $result;"
taskkill /f /im explorer.exe
PowerShell -WindowStyle normal -Command Exit
start explorer.exe
title ？？？？？？？？？？？？？？？？
color 47
cls
pause
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo お
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo お前
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo お前は
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo お前は後
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo お前は後悔
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo お前は後悔す
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo お前は後悔する
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo お前は後悔するべ
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo お前は後悔するべき
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo お前は後悔するべきだ
ping -n 1 127.0.0.1 > nul 2>&1
powershell sleep 2.5
cls
echo ロックダウンフェーズを実行しています...
powershell sleep 0.5
cls
title 無限ロックダウンから抜け出す場合は、ロック画面から再起動を行ってください...
echo 数秒後、強制無限ロックダウンが実行されます...
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
rem テスト機能とイースターエッグ
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
echo          %clryel%・%clr2%inspectentirecommandlist %clrgra%(Displays all available commands.)%clr2%
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
