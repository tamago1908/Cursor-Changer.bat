@echo off
setlocal
mode con: | find "75" >nul && mode con: | find "25" >nul
if "%errorlevel%"=="1" (mode con: cols=75 lines=25& set boottime1=%time%)
if "%batbootargumentbad%"=="false" (title カーソル替え ^| 準備中...) else if not "%1"=="BatBootErrorHandlerArgument1908" (title カーソル替え)
if not defined dummy (set /p nothing=[?25h<nul)

rem Cursor Changer by tamago_1908
rem English version.

rem https://github.com/tamago1908/cursor-changer.bat 

rem OS並みの機能を持ったバッチファイル、"カーソル替え"
rem 詳細はgithubを参照。

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
rem                         カーソル替え.bat

rem 上記のメッセージの表示が崩れている？ならVirtual Studio Codeで開くのを推奨します...

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



rem 計画     : rem customテーマ機能 (一カラー) を実装する (1.15?)
rem 上 具体的にはColor_Applyerを実装して、先にfor分で空白を利用して文字色などを指定、後に描写されるGUIやハイライトは従来の方法で最適化する。
rem もう少し賢い方法で設定ファイルなどの改変を検知する  (1.15?)
rem "Uninstall"を引数で利用してアンインストーラーで起動できるようにする。これの実装はアンインストーラーのオーバーホール時に実装する。
rem 現在実装されているyoutube関連の処理をすべて削除して、dogcheckとstartup rickrollをpowershellの音楽再生に置き換える。 (1.15?)
rem 上に伴い、よりカテゴナライズされた設定GUIを実装する。 (1.15?)
rem アップデート利用可能の改良、ログインメニューの実装 (1.15?)
rem settingを適用する部分を改良する (1.15?)
rem version checkのバイパスの仕方を変える。それに伴いそれら周辺の処理も変える (1.15?)
rem 上ができれば、powershell前にwinver checkを配置できる可能性がある



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
set "Settingsfile=カーソル替え設定.txt"
rem O===================================O
rem First Stuffs file
set "FirstSTFsfile=初回カーソル.txt"
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
echo powershellの確認に失敗しました！
pause
cls
echo これが表示されたということは、お使いのPCにpowershellがインストールされていない可能性が高いということです。
pause
cls
echo カーソル替えを動作させるにはpowershellが必須です。
echo windows 10 1803以降ではpowershell 5.1が標準でインストールされているため、恐らく意図的にアンインストールされているか、利用できなくなっている可能性が高いでしょう。
pause
cls
echo Powershell 5.1か、それ以降を別途インストールしたのち、再度試してください。
pause
cls
echo それを行っても(もしくはpowershellがインストールされているのに)問題が続く場合には、githubのissueにて報告してください。
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
        if "%batbootargumentbad%"=="false" (echo [%time: =%] カーソル替え %batver% ブートローダー - by tamago_1908& echo.) else (echo [%time: =%] ブートローダーを開始中...)
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
        if not "%batbootargumentbad%"=="false" (echo セットアップの準備中... 1/2)
    ) else (title カーソル替え ^| しばらくお待ちください...& echo カーソル替え ^| 準備中... 1/2)
)
if exist %Settingsfile% if not "%linuxboot%"=="true" (if not "%batbootargumentbad%"=="false" (title カーソル替え ^| 準備中...& echo しばらくお待ちください... 1/2)) else (if not "%batbootargumentbad%"=="false" (title カーソル替え ^| 準備中...))
rem chenge the boot message if it is the first time, or if a value is defined in batbotpowershell, or at boot up
if not exist %Settingsfile% set firststartbat=yes
if "%batbootargumentbad%"=="false" (
if not "%linuxboot%"=="true" (
if not "%firststartbat%"=="yes" (
if "%bootbatnow%"=="yes" (cls & echo しばらくお待ちください... 2/2)
) else (
    if not defined Powersheller (
        if not exist %FirstSTFsfile% (
        cls & echo セットアップの準備中... 2/2
        ) else (cls & echo しばらくお待ちください... 2/2)
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
    echo 嘘みたいだろ。死んでるんだぜ、これで。
    exit
)
set batbootargumentbad=
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Error_Handler is Working! :D)


:Arguments_Loader
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Arguments_Loader is Started...)
if "%~1"=="" goto :Arguments_Loaderend
if not "%~1"=="BatBootErrorHandlerArgument1908" (title カーソル替え ^| Cursor Changer argment checking...)
setlocal enabledelayedexpansion
set i=0
for %%a in (%*) do (
  set /a i+=1
  set arg[!i!]=%%a
)

rem 配列の要素数を取得
set n=%i%
rem 配列の要素を順番に処理
:Arguments_Loaderbreak
for /l %%i in (1,1,%n%) do (
  rem 例外処理用の変数の初期化。あとで使用します。
  set argmentserror=
  rem 現在の要素を取得
  set current=!arg[%%i]!
  rem 現在の要素が空でなければ処理
  if not "!current!"=="" (
    rem 現在の要素と一致する要素を空にする（重複排除）
    for /l %%j in (%%i,1,%n%) do (
      if "!arg[%%j]!"=="!current!" set arg[%%j]=
    )
    rem 現在の要素に応じた処理を行う
    if "!current!"=="BatBootErrorHandlerArgument1908" (set Arguments_Loaderbreaked=true& goto :Arguments_Loaderbreak)
    set Arguments_Loaderbreaked=false
    if "!current!"=="bypsbootpwsh" (echo byps batbootpowershellを有効にしました。& set disableexit=false& set argmentserror=false)
    if "!current!"=="enablesimpleboot" (echo simplebootを有効にしました。& set simpleboot=true& set argmentserror=false)
    if "!current!"=="devmode" (call :developermenu& set argmentserror=false)
    if "!current!"=="recovery" (echo recovery menuを有効にしました。& set argmentserror=false& goto :Cursor_Changer_REmenu)
    if "!current!"=="help" (title カーソル替え ^| 引数のヘルプ& call :batstarthelp& set argmentserror=false)
    if "!current!"=="bypsvck" (echo bypsvckを有効にしました。& set bypasswinvercheck=true& set argmentserror=false)
    if "!current!"=="bypsadm" (echo bypsadmを有効にしました。& set adminbypass=true& set adminbypass=false& set argmentserror=false)
    if "!current!"=="bypsloadsg" (echo bypsloadsgを有効にしました。& set settingbypass=true& set argmentserror=false)
rem 例外処理
   if "!argmentserror!"=="" (title カーソル替え ^| カーソル引数 エラー&echo 不明な引数が指定されました！^(!current!^) 有効な引数を指定してください。 ^(それか、^"help^"を利用してください。^)
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
if "%batbootargumentbad%"=="false" (title カーソル替え ^| 準備中...) else if not "%1"=="BatBootErrorHandlerArgument1908" if "%1"=="dynamic" (exit /b 1)
if "%bypasswinvercheck%"=="true" (goto :batbootcheckwinverbadwarning)
rem check windows 8.1 or lower
for /f "usebackq delims=" %%a in (`ver`) do set version2=%%a
echo %version2% | find /i "Version 10.0" > nul
if "%errorlevel%"=="0" (set windowsverfilter=windows 10, 古いビルド) else (set "windowsverfilter=古すぎます！Windows XP？")
echo %version2% | find /i "Version 6.3." > nul
if "%errorlevel%"=="0" (set windowsverfilter=windows 8.1)
echo %version2% | find /i "Version 6.2." > nul
if "%errorlevel%"=="0" (set windowsverfilter=windows 8)
echo %version2% | find /i "Version 6.1." > nul
if "%errorlevel%"=="0" (set windowsverfilter=windows7)
echo %version2% | find /i "Version 6.0." > nul
if "%errorlevel%"=="0" (set windowsverfilter=windows vista)
rem winver check failed message
title カーソル替え ^| Windows バージョンエラー！
cls
echo カーソル替えはお使いのWindowsのバージョンをサポートしていません！
echo (%windowsverfilter%)
pause
cls
echo カーソル替えはWindows 10 1803以降のWindowsをサポートしています！
echo (ビルド 17134 以降。あなたがお使いのWindowsはビルド %version% です^^!)
pause
cls
echo それよりも古いバージョン (例えば windows 7, windows 8, 8.1, 等です) はサポートされていません。
pause
cls
echo お使いのWindowsをアップデートしてください。
echo もしこのメッセージがWindows 10 1803以降を利用しているのに表示されている場合は、Githubのissueにて報告してください。
pause
call :exit 1



:batbootcheckwinverbadwarning
cls
rem 警告メッセージ (winvercheckに違反している状態でbypsしようとした際の)
set selected=
cls
echo.
echo                                    警告
echo.
echo あなたがお使いのWindowsのバージョン (%windowsverfilter%)はカーソル替えに対応していないようです！
echo 引数でbypsvckを利用しているようですが、このまま続行すると致命的な問題に遭遇する可能性が非常に高いです。
echo 仮に続行した場合、その後に引き起こされる問題に対する責任はカーソル替えの開発者であるtamago_1908は負いません。
echo.
echo それでも続行しますか？
set /p selected=Y or N : 
if %selected%==n exit 1
if %selected%==y goto :batbootcheckwinversafe
if %selected%== echo what? "Y" or "N".& pause & goto :batbootcheckwinverbadwarning


:batbootcheckwinversafe
setlocal disabledelayedexpansion
if "%batbootargumentbad%"=="false" (title カーソル替え ^| Cursor Changer Preparing...) else if not "%1"=="BatBootErrorHandlerArgument1908" if "%1"=="dynamic" (exit /b 0)
set batbootcheckwinversafe=& set version=& set version2=
if "%1"=="dynamic" (exit /b)
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] WinverCheck is done.)


rem カーソル替え処理を実行
rem 本処理 (変数のセットとか、前段階)
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
    set "batverforpowersheller=%batver:β=.b%"
) else (set "batverforpowersheller=%batver%")
)

rem startid~powershell までのコードはずらしてはいけない　それ以前かそれ以後ならok
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

# カーソル設定を再適用
[User32]::SystemParametersInfo($SPI_SETCURSORS, 0, [IntPtr]::Zero, $SPIF_SENDCHANGE) | Out-Null
}



function Updater {
    # Check for updates of Cursor Changer with GitHub API, But won't do update. Just check.
    $repo = "https://api.github.com/repos/tamago1908/Cursor-Changer.bat/releases/latest"
    try{$file = (Invoke-RestMethod -Uri $repo -Method Get -Headers @{'Accept'='application/vnd.github.v3+json'}).assets | Where-Object { $_.name -like "Cursor.Changer.*" }
    }catch{if($_.Exception.Response.StatusCode.Value__ -eq 403){Write-Host "[ERROR] githubのAPIレート制限に到達しました。これが意味するのは要するに、一時間以内に大量にアップデートを確認し過ぎ、ということです。一時間ほど間を置いたのち、再度アップデートを確認してください。" -foregroundcolor red}else{Write-Host "[ERROR] 何らかのエラーが発生しました。インターネット接続を確認するか、githubのサーバーが落ちていないかを確認したのち、再度試してください。`nエラーログ : $_" -foregroundcolor red};break}


    $fileVersion = $file.name -replace "Cursor\.Changer\.|\.bat", ""
    $batVersion = "$env:batverforpowersheller"
    $batName = Get-Item "カーソル替え *.bat"

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
    Write-Host "アップデートを確認中...`n"
    # check the update of Cursor Changer with github api, and Update it.
    $repo = "https://api.github.com/repos/tamago1908/Cursor-Changer.bat/releases/latest"
    try{$file = (Invoke-RestMethod -Uri $repo -Method Get -Headers @{'Accept'='application/vnd.github.v3+json'}).assets | Where-Object { $_.name -like "Cursor.Changer.*" }
    }catch{if($_.Exception.Response.StatusCode.Value__ -eq 403){Write-Host "[ERROR] You have exceeded the GitHub API rate limit. This may be because you have checked for updates too frequently. Please wait for an hour and try again." -foregroundcolor red}else{Write-Host "[ERROR] Oops, something went wrong. You can try again later. or check the internet connection. `nError log : $_" -foregroundcolor red};break}


    $fileVersion = $file.name -replace "Cursor\.Changer\.|\.bat", ""
    $batVersion = "$env:batverforpowersheller"
    $batName = Get-Item "カーソル替え *.bat"

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
                Write-Host "アップデートが利用可能です。現在のバージョンは、 `"$($batVersion)`"で、アップデートされたバージョンは `"$($fileVersion)`"です。`n"
                Start-Sleep 1
                Changelog
                Start-Sleep 2

                if ($isFileBeta) { Write-Host "[TIP] このアップデートはベータ版です。なので、一部不安定な部分がある可能性があります。`n" -ForeGroundColor DarkGray}

                $answer = Read-Host "アップデートしますか？尚、アップデートをインストールすると強制的に英語版へと変更されます。 (y or n)"
                if ($answer -eq "y") {
                    $downloadFile = Join-Path (Join-Path $env:USERPROFILE "Downloads") $file.name
                    Invoke-WebRequest -Uri $file.url -OutFile $downloadFile -Headers @{'Accept'='application/octet-stream'}
                    Move-Item $downloadFile (Join-Path (Split-Path $batName) "Cursor.Changer.$fileVersion.bat") -Force
                    Remove-Item "カーソル替え $batVersion.bat" -Force
                    Write-Host "アップデートは完了しました。`n"
                    Start-Sleep 2
                    Write-Host "再起動中..."
                    PowerShell -WindowStyle Hidden -Command Exit
                    Start-process "カーソル替え $fileVersion.bat"
                    Killwhole
                } else {
                    Write-Host "アップデートはキャンセルされました。`n"
                    Start-Sleep 2
                    return
                }
            } elseif ($comparisonResult -lt 0) {
                Write-Host "[ERROR] あなたのバージョン ($($batVersion)) は、アップデートファイルよりも先行 ($($fileVersion)) しています！(恐らく、あなたはカーソル替えのバージョンを故意に変えたのでしょう...)`n" -ForegroundColor Red
                Start-Sleep 2
                return
            }
        }

        if ($i -eq [Math]::Max($fileverArray.Length, $batverArray.Length)) {
            Write-Host "すでに最新バージョンです！ (`"$($batVersion)`") アップデートは必要ありません。`n"
            Start-Sleep 2
        }
    }
}


function Doupdate {
    $repo = "https://api.github.com/repos/tamago1908/Cursor-Changer.bat/releases/latest"
    try{$file = (Invoke-RestMethod -Uri $repo -Method Get -Headers @{'Accept'='application/vnd.github.v3+json'}).assets | Where-Object { $_.name -like "Cursor.Changer.*" }
    }catch{if($_.Exception.Response.StatusCode.Value__ -eq 403){Write-Host "[ERROR] githubのAPIレート制限に到達しました。これが意味するのは要するに、一時間以内に大量にアップデートを確認し過ぎ、ということです。一時間ほど間を置いたのち、再度アップデートを確認してください。" -foregroundcolor red}else{Write-Host "[ERROR] 何らかのエラーが発生しました。インターネット接続を確認するか、githubのサーバーが落ちていないかを確認したのち、再度試してください。`nエラーログ : $_" -foregroundcolor red};break}
    $fileVersion = $file.name -replace "Cursor.Changer\.|\.bat", ""
    $batVersion = "$env:batverforpowersheller"
    $batName = Get-Item "カーソル替え *.bat"
    $downloadFolder = Join-Path $env:USERPROFILE "Downloads"
    $downloadFile = Join-Path $downloadFolder $file.name
    Invoke-WebRequest -Uri $file.url -OutFile $downloadFile -Headers @{'Accept'='application/octet-stream'}
    $newBatName = "カーソル替え $fileVersion.bat"
    Move-Item $downloadFile (Join-Path (Split-Path $batName) ("$newBatName")) -Force
    Remove-Item "カーソル替え $fileVersion.bat" -Force
    Write-Host "アップデートは完了しました。`n"
    Start-Sleep 2
    Write-Host "再起動中..."
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
            Write-Host "音楽をダウンロード中... $progress% " -NoNewline
        }

        $memoryStream.Position = 0
        $response.Close()
        Write-Host "`nダウンロード成功！    たぶん....."
    } catch {
        $errorMsg = if ($_.Exception.Response.StatusCode.Value__ -eq 403) {
            "[ERROR] githubのAPIレートリミットに到達しました！これが意味するのは要するにあなたは音楽を再生し過ぎたということです。音楽なしで続行するか、一時間ほど後にもう一度やり直してください。"
        } else {
            "[ERROR] 何らかのエラーが発生しました。インターネット接続を確認するか、githubのサーバーが落ちていないかを確認したのち、再度試してください。`nエラーログ : $_"
        }
        Write-Host $errorMsg -ForegroundColor Red
        Write-Host "何かキーを押して終了..."
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
    Write-Host "音楽を再生しています。`n音楽を止めたい場合、このpowershellウィンドウを終了してください。"
} catch {
    Write-Host "[ERROR] 音楽の再生に失敗しました。ファイルが正しいか、空でないかを確認してください。" -ForegroundColor Red
    Write-Host "何かキーを押して終了..."
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
    Write-Host "`nシャットダウン中..."
    Start-Sleep 1
    $pid1 = (Get-WmiObject win32_process -filter "processid=$pid").parentprocessid
    $pid2 = (Get-WmiObject win32_process -filter "processid=$pid1").parentprocessid
    taskkill /pid $pid1 /pid $pid2 /pid $pid > $null 2>&1
}

Function Changelog {
    $h=Get-Host;$w=$h.UI.RawUI;$s=$w.BufferSize;$s.height=(irm -Uri "https://api.github.com/repos/tamago1908/Cursor-Changer.bat/releases/latest").body -split '\r\n' | Measure-Object | %{$_.Count + 22};$w.BufferSize=$s;
    try{if($env:wmodetoggle -eq "false"){Write-Host "チェンジログ :" -foregroundcolor white}elseif($env:wmodetoggle -eq "true"){Write-Host "Change Log :" -foregroundcolor black }else{Write-Host "Change Log :" -foregroundcolor white};$e=[char]27;$clr="$e[7m";$clred="$e[91m";$clrgrn="$e[92m";$clryel="$e[93m";$clrmag="$e[95m";$clrgra="$e[90m";$clrcyan="$e[96m";$c="$e[0m";if($env:wmodetoggle -eq "true"){$clr="$e[100m$e[97m";$c="$e[0m$e[107m$e[30m"};foreach($s in (irm -Uri "https://api.github.com/repos/tamago1908/Cursor-Changer.bat/releases/latest").body -split '\r\n'){if($s -match "####"){write-host "$clrcyan$e[1m$($s -replace '(^\#+)|(\#+$)', '')$c" `n -NoNewline}elseif($s -match ">"){write-host "$clred$($s -replace '\>', '')$c" `n -NoNewline}elseif($s -match "###"){write-host "$clryel$e[1m$($s -replace '(^\#+)|(\#+$)', '')$c" `n -NoNewline}elseif($s -match "___"){write-host "$clrgra--------------------------------------------------$c" `n -NoNewline}else{$s=$s -replace "\*{3}(.+?)\*{3}", "$e[3m;1m`$1$c";$s=$s -replace "\*{2}(.+?)\*{2}", "$e[1m`$1$c";$s=$s -replace "^\s*-(\s+)(.*)", "$clred-$c`$1`$2";$s=$s -replace "\*+", "";write-host "$s" `n -NoNewline}};rv e,clr,clred,clrgrn,clryel,clrmag,clrgra,clrcyan,c,s}catch{if($_.Exception.Response.StatusCode.Value__ -eq 403){Write-Host "[ERROR] githubのAPIレートリミットに到達しました！これが意味するのは要するにあなたは音楽を再生し過ぎたということです。音楽なしで続行するか、一時間ほど後にもう一度やり直してください。" -foregroundcolor red}else{Write-Host "[ERROR] 何らかのエラーが発生しました。インターネット接続を確認するか、githubのサーバーが落ちていないかを確認したのち、再度試してください。`nエラーログ : $_" -foregroundcolor red};break}
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

rem 本処理
:Powersheller_end
set startline=& set endline=& set Powersheller_passed=& set batverforpowersheller=
if "%bootbatnow%"=="no" (set Powersheller=& exit /b)
if "%Powersheller%"=="OOBEMusic" (set Powersheller=& exit /b)
set Powersheller=

rem get updater variable
if "%checkupdatetoggle%"=="true" (goto :Powersheller_get_updater_variable) else (goto :Powersheller_get_updater_variable_end)

:Powersheller_get_updater_variable
rem powershellの戻り値をbatchの変数に変換
setlocal enabledelayedexpansion
if "%updateinfo%"=="null" (goto :Powersheller_get_updater_variable_end)
if "%updateinfo%"=="die" (set Punish=true& goto :Powersheller_get_updater_variable_end)
for /f "tokens=1-4 delims=," %%a in ("%updateinfo%") do (
  for /f "tokens=1-2 delims==" %%x in ("%%a") do set "%%x=%%y"& for /f "tokens=1-2 delims==" %%x in ("%%b") do set "%%x=%%y"& for /f "tokens=1-2 delims==" %%x in ("%%c") do set "%%x=%%y"& for /f "tokens=1-2 delims==" %%x in ("%%d") do set "%%x=%%y"
)
setlocal disabledelayedexpansion
set updatemyversion=%batver:β=.b%

:Powersheller_get_updater_variable_end
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Powersheller is Ended...)
set updateinfo=
set checkupdatetoggle=
cd /d %batchmainpath%

rem いらない情報の羅列

rem ###################
rem #    HELLO　WORLD    #  
rem ###################
rem 表示100%、フルスクリーン推奨　それ以外は表示の保証なし


rem ちなみに情報
rem このバッチファイルの開発が始まったのは2021年の10月8日(恐らく)
rem 開発の動機は、カーソルを初期化されたときにいちいち変えるのがめんどくさいからバッチファイルで自動化しようとしたから。だがそのあといろいろ機能が増えていって今の状態になったのである。
rem バージョン2.0.0まではカーソルブラックという名前だった
rem 開発中期になってカーソル替え(黒)に変更された
rem 開発後期になってカーソル替えのみに変更された
rem 最初のバージョンが1.0.1だった
rem 名前の変更がされたバージョンは2.0.0と2.5.0beta5
rem バージョン2.0.0ではデフォルトに戻せる機能が追加
rem デフォルトに戻す機能はバージョン1.5.0あたりからほのめかしていた
rem バージョン2.1.xからNoFB NonFIxBugというバージョンが追加されたがすぐに削除された
rem カーソル替えにはバージョン Dev.1というものがあった
rem バージョンDev.1はバージョン2.4.xに相当
rem バージョン2.4.xまではものすごくバージョンの上り方が早かった
rem 一番開発に時間がかかったのはバージョン1.12である。 (半年間の開発期間)
rem 内容がぐちゃぐちゃなのはもともと人に見せるつもりがなかったからである。
rem カーソル替えには2022年2月22日22時22分22秒に完成したバージョンがある。それがカーソル替え1.7aだ。

rem バージョンアップ情報
rem バージョン2.5.0以前のハージョン履歴は消失しています
rem バージョン2.5.0 beta1ですべての変更をデフォルトに戻す機能が追加
rem バージョン2.5.0 beta5から名前がカーソル替え 1.0betaに変更
rem バージョン2.5.0 beta7 (1.0beta2)からDogcheckというネタ機能が追加された
rem バージョン2.5.0 beta9 (1.0beta4)からDogcheckにアップデートが入り、同じ名前のテキストファイルを作るだけでは回避ができないようになった
rem バージョン1.0(2.5.0 beta10)から正式にカーソル変えの根幹的な部分が完成、これに伴いカーソル替えのバージョンは1.0となった
rem バージョン1.1 (2.5.0beta11)からalldef周りのコマンドのミスにより分岐ができていなかったバグが解消され、何より分岐ごとのクリアがなくなり、よりシームレスに分岐するようになった。
rem バージョン1.2 (2.5.0beta13)からデフォルトに戻す、もしくは黒色に変更する際の文字が変更された。
rem バージョン1.3(2.5.0beta14)から、初回の変更でいいえをを押したときに、初回カーソル変更というものが削除される機能がじっそうされ、それに加えて、イースターエッグにちょっとした新機能が追加。
rem バージョン1.4(旧2.5.0beta15)から、ついに開発当初から同じだった機能を選択する部分が変更され、それに伴い旧バージョン表記がなくなり、本当の意味でのver2.5.0になった。
REM バージョン1.5から、超大型だと言ってもいいほどのアップデートが来た。

rem 詳しく言うと、まず設定メニューの追加、それに伴いカーソルを変更した際の再起動の確認を完全にOFFにする設定、デバッグモードのON/OFFが追加された。
rem そして次に、ホワイトモードの追加。cmd上のテーマをホワイト基調のデザインに変更でき、しかも設定したことを記録する機能もあり、起動時に自動的にホワイトモードにすることができるという機能も搭載している。
rem そして多少のバグ修正、誤字脱字を修正した。

rem バージョン1.5a 再起動の判別に伴う文字変更とダークテーマに戻す際の機能を廃止予定の文を挿入した。
rem バージョン1.6 今回のアップデートは超大型だ。

rem 詳しく言うと、まず初回起動時にカーソル替えの文字が虹色に変化するような機能が追加され、
rem 次に、最初の画面でエンターキーを長押ししているとそれを検知してメッセージが流れるような機能が追加され、
rem そのまた次に、ホワイトモードの画面が革新され、設定メニューと同じようになった。それに伴ってダークテーマに戻す際の個別の画面が消失した。
rem そしてエンターキー長押しを検知する機能の追加に伴って、設定メニューでその機能の無効化ができるようにもなった。

rem バージョン 1.6a ホワイトモードに変更が加えられ、ダークモードかホワイトモードかを検出し、それに伴い文字を変化させる機能が追加され、多少のバグ修正が行われた。
rem バージョン 1.6b 設定メニューの三番目、デバッグモードの有効無効化のメニューにちょっとした改良が加えられた。
rem バージョン 1.7 今回のアップデートでは、電卓機能が追加され、ちょっとしたイースターエッグが追加された。そして、HNYという文字は今さらだが削除された。
rem バージョン 1.7a 今回のアップデートは、機能選択の画面の順番を機能が増えてきたことに伴い、変更した。alldefは設定メニューに移行した。
rem そして、バージョン情報に多少の変更、何もしないにちょっとした変更が加えられた。
rem バージョン 1.8 今回のアップデートでは設定メニューにちょっとした変更が加えられ、設定の説明と現在の設定が有効か無効かをシームレスに見れるようになった。
rem そして今回のアップデートでは2048というゲームが搭載予定だったのだが、開発中期にセーブ機能関連に技術的な制約とバグがあることが発覚し、開発が難航したため、
rem その機能追加は無期限に延期になった。
rem バージョン1.9 今回のアップデートは、カーソル替え設定の構文を変更し、falseかtrueかを変更するだけにした。これにより何がオンで何がオフかがわかりやすくなった。
rem また、今回のアップデートによって、%FirstSTFsfile%にもdogcheckが追加されたので、まぁ設定ファイルを途中で削除したりなんてことがしにくくなった。

rem バージョン1.10 今回のアップデートはカーソル替え史上最もBIGなアップデートだ。まず、設定メニューと最初のメニューにUIが追加され、メニューの整理が行われ、ホワイトモードとAlldefが移動した。Alldefには自己消去機能が追加され、アンインストールメニューが試験的機能として新たに実装された。そして初回起動メッセージが変更され、軽くアニメーションするようになり、メッセージも変更された。そして、カーソル替えの初期のバージョンからあったカーソルを変えるメニューがなんと統合され、白色と黒色を自動的に認識して、選択しなくても自動的に変更されるようになった。そしてちょっとした隠し要素も追加された。また、設定も自動的に記入されるようになり、バグや誤字脱字も直された。それ以外にもたくさんの部分が変更され、もはや別物になった。
rem バージョン1.10a ちょっとした修正と、起動時に処理中と起動中というメッセージが表示されるようになり、わかりやすくなった。

rem バージョン1.11 今回のアップデートは、主に設定と起動関係の内部構造が大幅に変わり、簡単に言うと今までは、"とりあえず全部取る"構造から、"ほしいときに取る"構造になったおかげで、全体的なレスポンスが向上した。それと、ちょっとした変更が加えられた。(ちなみに、この機能の実装にはとても苦労した。)
rem バージョン1.11a dogcheckのAA崩れと、設定で設定を変更した後にreloadをすると永遠にロードし続けてしまう不具合を修正。

rem バージョン1.12
rem 今回のアップデートは、カーソル替え史上最も巨大且つ大型のアップデートといっていい。まず、設定のUI、起動中のUIが大幅に変更された。そして、メニュー画面の電卓と終了が反転し、dogcheckも大幅に変わり、様々な新機能が追加され、ほぼすべてのバグが修正され、英語も追加され、....もうとにかく、言い合わらせないほど、大量の機能が追加された。debugの設定が変更され、1.11とは互換性が半分失われた。とにかくとても大量の機能が追加された。そして開発には半年がかかった。

rem ベータ版の進捗

rem ver1.6
rem バージョン1.6α 1.6のαバージョン。設定の3番目、デバッグモードの欄の機能が増えた。
rem バージョン1.6β1 1.6のベータ版。今まで欠けていた設定の2番目が完成した。
rem バージョン1.6β2 1.6のベータ版2。設定の二番目にあった重大なバグを修正した。(setting3とタイプミスで干渉,adminonoffと関数を入力ミス)
rem バージョン1.6β2 バージョン規則がベータ版限り変更され更新した日を追加することとなった。
rem バージョン1.6β3 1.6のベータ版3。初回起動時にロゴが虹色で光る演出が追加された。ちなみにもうすぐ1.6が正式に完成する。
rem バージョン1.6β3 1.6のベータ版の最終バージョン。三つほど機能が追加された。

rem ver1.10
rem バージョン 1.10β1 1.10の最初のベータ版.。最初の画面と設定メニューのUIが追加された。
rem バージョン 1.10β2 1.10のベータ版2。 設定メニューにアニメーションが追加された。
rem バージョン 1.10β3 1.10のベータ版3。 変更が統合され、一つのメニューで白色、黒色に変更できるようになった。しかしこれによって複縦がなくなった。
rem バージョン 1.10β4 1.10のベータ版4。 テーマの変更が設定に移行され、それに伴い少しメニューが変化した。
rem バージョン 1.10β5 1.10のベータ版5。 alldefに試験的だがアンインストール機能が実装され、このバッチファイルも削除されるようになった。そして初回起動時のメッセージも少し変更され全体的な質が向上した。
rem バージョン 1.10β6 1.10のベータ版6。 まだ未完成だが初回起動メッセージが進化した。また、このバージョンではtestと入力すると初回起動メッセージが流れる。(正式版では削除予定)そして、windowのサイズが変更された。
rem バージョン 1.10β7 1.10のベータ版7。 初回起動時のメッセージがすべて変更され、またアニメーションも追加された。そしてeastereggという物が追加された.....

rem ver1.12
rem バージョン 1.12β1 最初の1.12のベータ版。何もしない ボタンが、終了ボタンへと変わり、配置が電卓と入れ替わった。そして設定の欠損を検知して修復できる機能が追加された。
rem バージョン 1.12β2 1.12のベータ版2。ベータ1で実装された設定の整合性テストのバグが完璧に修正。それにより完璧に動作するようになった。また、設定を読み込む部分が最適化された。そして一部のバグや不要な機能が削除された。
rem バージョン 1.12β3 1.12のベータ版3。このバージョンでは細かい部分の修正がメインで、主にsetting dogcheckの機能拡張とバグ修正、dogcheck関連の機能増強とバグ修正がメイン。初回起動時の機能制限の追加もされた。
rem バージョン 1.12β setting ui deb 設定の新しいUIの開発のためだけに作成された特別なバージョン。
rem バージョン 1.12β4 1.12のベータ版4。このバージョンは大量の機能追加がなされた。主に設定メニューのUIが大幅に変更され、設定が二つのカテゴリーで分けられ、より直感的に操作できるようになった。そしてアンインストールメニューも進化し、機能が追加された。設定のhelpも変更され、dogcheckも進化し、設定のdebugが高速起動（fastboot）に変更され、起動アニメーションに一つ種類が増え、それに伴い起動アニメーションを無効にできるようになり、それ以外にも様々な部分が変更された。
rem バージョン 1.12β5 1.12β5。このバージョンでは、設定メニューの設定を適用するメニューが改良され、よりわかりやすくなり、alldefの分岐部分の不備が一部修正された。そして、windowsのOSバージョンを検知し、windows 10 1551以前では動作不能になった。また新しいmsgboxの表示方法のテストがeastereggに導入され、それにはpowershellが使用されており、より安全な構造になった。それ以外にも、fulldebugの機能増強、debug用のリダイレクトコマンドが追加された。
rem バージョン 1.12β6 1.12β6。このバージョンのアップデートは微々たるもので、そこまで大きな変化はない。主にデバッグモード関連が進化した。fulldebugの機能がより増え、自由に変数を変更できるようになった。そして、cmdでないと起動できなくなった。(その際には開き直す機能もある。)そして、細かい修正がされている。
rem バージョン 1.12β7 1.12β7。このバージョンは、主に起動画面が変更され、よりグラフィカルな表現になった。そして汎用性が増えて使いやすくなった。しかし、その半面、起動時間が倍増し、現状では少し不安定なアニメーションだ。しかしそれ以外にも、細かい部分のバグ修正や、機能増強が行われた。（alldefの自己削除機能のバグ修正など）
rem バージョン 1.12β7a 1.12β7のマイナーアップデート。このバージョンでは、細かい部分の修正が行われた。管理者権限の設定が有効の際に誤ってエラーが出てしまう問題と、fulldebugの機能増強、新しい起動アニメーションのエラー処理が改善された。それ以外にも誤字が修正された。build番号は35に。
rem バージョン 1.12β7b 1.12β7aのマイナーアップデート。このバージョンでは、主に起動アニメーションの不具合が修正され、よりエラーが起きにくくなった。変数の初期化も行われるようになり、より安定した。そして、起動完了時にバーが最後まで行くようになった。build番号は35.5に変更。
rem バージョン 1.12β7c 1.12β7bのマイナーアップデート。このバージョンでは、1.12β7bに含まれていた変数の初期化にあったバグが修正され、より安定するようになった。そしてそれ以外にも含まれていたバグも修正されたので、主にこのバージョンはバグ修正バージョンである。build番号は35.7に変更。
rem バージョン 1.12β7d 1.12β7cのマイナーアップデート。このバージョンでは、fulldebugの機能が増強され、新しく変数を作りやすくなり、削除や変更などもしやすくなった。そしてeastereggが凶悪になった....build番号は35.8に変更。
rem バージョン 1.12β8 1.12β8。このバージョンでは、試験的に、ウィンドウ右上の、閉じるボタンからのカーソル替えの終了ができなくなった。これにより、不正な終了ができなくなった。そしてその機能実装には特殊な方法を使用しており、より実験的な意味合いがある。そして細かな部分の調整が行われた。build番号は36に変更。
rem バージョン 1.12β8a 1.12β8のマイナーアップデート。このバージョンでは、現在開かれているconsoleの検出機能が排除された。どうやらconsoleの検出は不安定で、その時の状況によって左右されるから。build番号は36.1に変更。
rem バージョン 1.12β8b 1.12β8aのマイナーアップデート。このバージョンでは、inspect entire command listというコマンドが追加され、このコマンドを使用するとメインメニューで使用可能なほぼすべてのコマンドを閲覧することができる。使用にはパスワードが必要。それには試験的な機能として、6色の色で表現されている。それ以外にも細かい部分が修正された。 build番号は37に変更。
rem build 38 マイナーアップデート。powershell経由でのC#複数行実行で発生していた分岐のバグが修正。それ以外にも細かなバグ修正が行われた。
rem build 39 マイナーアップデート。新しく引数にenablesimplebootが追加された。将来的に、設定に含める予定。それに伴ってieclと引数helpも変更された。
rem バージョン 1.12β9 1.12のベータ版9。このバージョンでは、細かな不具合が修正された。そして、settingの読み込み部分が変更され、gotoを使用した方法からcallを使用した方法に変更され、より安定するようになった。それ以外にも細かい部分の不具合が修正された。ちなみにもうすぐ1.12が完成する。
rem build 41 マイナーアップデート。終了ボタンを無効化していたのが、最大化ボタンの無効化に変更された。
rem バージョン 1.12β10 1.12のベータ版10 このバージョンでは、英語翻訳が追加され、細かいバグが修正された。あまり大きな変化はない。そしてこれが1.12βの最終バージョンになる予定だ。

rem ver1.13
rem バージョン 1.13β1 最初の1.13のベータ版。このバージョンでは、英語版での英訳の修正と、ウィンドウズのバージョンを確認する機構が少し変更され、また英語版ではeastereggが解放された。また、バグも修正された。とりあえず、主に英語版でのアップデートになる。
rem バージョン 1.13β2
rem 1.13のベータ版1。このバージョンでは主に二つの新機能がある。それは、終了メニューと新しいバージョン表示UIだ。これに伴い、今まではreloadをしないと再起動できなかったのが、そのままメニューから再起動できるようになった。また、自己アップデート機能も新しくなったバージョン表示部分からアクセスできるようになる予定。また、他にもバグ修正などが行われた。


rem 今後の予定 (roadmap)

rem コードの順番を変更し、読みやすくする
rem 何もしないを終了または何かしらに変更
rem 設定のUIを大幅に変えて、カテゴリーに分ける。そのカテゴリーの中に設定を入れる
rem セーブ関係のファイルを保存するディレクトリを設定で変更できるようにする。
rem %Settingsfile%に含まれている設定が全部欠損している場合は、%Settingsfile%を作成しなおす機能。
rem 設定の初期化（アンインストールメニューを初期化とかの項目にする）
rem 1.12実装

rem ver 1.13 23年？未定
rem 初回起動時の初期設定の追加 (設定をユーザー任意でセット、テーマなども)
rem 未使用コードまたは無駄なものを削除して、より可読性を上げる。
rem 2048の実装
rem 単体アップデート機能
rem 終了メニュー (Windows XP風)
rem アンインストールメニューを完成させる

rem ver 1.14 
rem より派手なアニメーションとsetxを用いた起動回数のカウントと、より良い電卓

rem ver 1.15 
rem 色でわかりやすい！チュートリアルとより進化したdogcheck (samチェックのような機能を実装)

rem ver 1.16 
rem より良い初回起動時のメッセージと派手なUI

rem ver 1.17 
rem より多くの設定とより良い安定したプログラム

rem ver 1.18 
rem カスタムカーソル機能

rem ver 1.19 
rem ゲームの追加とカーソル替えプログラム全体のリファクタリング

rem ver 1.20 (2.0) 
rem .....???

rem 未定 
rem チュートリアル機能　うまいことやって、初回起動時にのみ起動させる(あばよくはreadmeの代替にしたい)＃うーん。一人でやるには大規模すぎる
rem UIの部分をwasdまたは12345で選択して、eとかで選択するように(設定メニューとかも。＃ほぼほぼ確定で実装するけど、ただかなり難しくなりそうだから現時点では未定
rem すべてのUI部分を変更(alldefやwmodeとかもすべてにおいて)＃ほぼ確定、ただオーバーホールするというよりは現在のメインメニューに近しいUIにするという意味だと思う。
rem fulldebug 変数情報をすべて表示＃仮だけど実装済み。
rem 右上らへんにリアルタイムで表示される時計＃無理。不可能だね。仮に実装しても操作性が改悪されるから別途それ専用のbatファイルが必要。
rem 常に起動アニメーションを再生させる＃実装済み。
rem 設定メニューの壮大化、オプションのbatファイルの使用＃2.00で予定されてるけど上記の通りきつい
rem 英語対応　しかし現実的ではない
rem 上のを実装するにあたって、一番実装しやすいのは変数を用いて、もし変数langがjpであるならば、関数jp1,2,3,4,5,6,7,8...に適当な文字を挿入させるとかだろうか。
rem しかしそれを行おうとすると今このバッチ処理に含まれている全文字を変数の名前にしなければいけず、実装するとしてもv1.10以降の実装になりそうだ。＃....まぁ頑張る

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
set "show=[2;24H[38;2;%clresc%mカーソル替え %batver% へようこそ [0m"
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
set "show2=[5;26H[38;2;%clresc%m[何かキーを押して始める] [0m"
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
set "show2=[5;26H[38;2;%clresc%m[何かキーを押して始める] [0m"
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
set "show=[2;%clrmove%H[38;2;%clresc%mカーソル替え %batver% へようこそ   [0m"
set /a clrmove-=1
if %clrmove% equ 1 (
    goto :CursorChangerOOBE_Animation5
) else (
    ping -n 0 -w 500 localhost >nul & goto :CursorChangerOOBE_Animation4
)

:CursorChangerOOBE_Animation5
rem WOW IT CHANGED INTO SETUP!!!!!!!!!
ping -n 2 -w 500 localhost >nul & cls
set "show=[38;2;%clresc%m  カーソル替え %batver% セットアップ [0m"
echo.
echo %show%
ping -n 2 -w 500 localhost >nul
set show=& set show2=& set clresc=& set clrmove=& set count2=& set count=
setlocal disabledelayedexpansion


:CursorChangerOOBEdev
rem Now, it's the beginning of a fucking trashy long goofy ahh idiot code.
title カーソル替え %batver% セットアップ
if not defined dummy (set clr=[3m[97m&set clrhigh=[7m&set clrhighend=[0m&set clrwhi=[48;5;250m[30m&set clr2=[0m&set clrgra=[90m)
if not defined dummy (set moveline=[22;0H) else (set moveline=[22;0H)
if not defined dummy (set /p nothing=[?25l<nul)
mode con: cols=80 lines=22
echo.
echo   カーソル替え %batver% セットアップ
echo ====================================O
echo.
echo     %clr% セットアップへようこそ。%clr2%
echo.
echo     カーソル替えの初回起動とセットアップへようこそ。
echo     このセットアップはカーソル替えをお使いの
echo     コンピューターで実行できる状態にするためのセットアップです。
echo.
echo.
echo          ^・     今すぐセットアップする場合は、Eキーを押してください。
echo.
echo          ^・     セットアップをスキップして今すぐ利用する場合は、
echo                 Sキーを押してください。(設定はすべて既定値に設定されます。)
echo.
echo          ^・     セットアップをせずに終了する場合は、Bキーを押してください。
echo.
echo.
echo.
echo.
set /p nothing=%clrwhi%     E=続行     S=スキップ     B=退出                                           %moveline%%clrwhi% <nul& choice /c ESB /n >nul
if %ErrorLevel%==1 goto :OOBEmain
if %ErrorLevel%==2 goto :OOBESkip
if %ErrorLevel%==3 call :OOBEmainshutdown& timeout /t 1 /nobreak >nul&call :exit 

:OOBESkip
color 07
cls
echo.
echo   カーソル替え %batver% セットアップ
echo ====================================O
echo.
echo.
echo          セットアップをスキップ
echo.
echo          もしセットアップ今スキップすると、すべての設定の値と
echo          テーマは既定値に設定されます。
echo          また、重要な規定事項や注意、免責事項を読み逃すことになります。
echo          免責事項に関しては、スキップしても同意したことになります。
echo.
echo          それでもよろしいですか？
echo.
echo          (Y=はい。セットアップとか面倒くさい。)
echo          (N=いいえ。セットアップしたいです！)
echo.
echo.
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     Y=スキップ     N,B=スキップしない                                          %moveline%%clrwhi% <nul& choice /c YNB /n >nul
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
echo   カーソル替え %batver% セットアップ
echo ====================================O
echo.
echo.
echo          Windows XPのOOBE BGMを聞きながらセットアップしますか？
echo.
echo          聞きたいなら、Yキーを押してください。
echo          聞きたくないなら、Nキーを押してください。
echo.
echo.
echo          %clrgra%(Yを押すと約15MB程度のダウンロードが発生します。)%clr2%
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     Y=続行     N=いいえ                                                        %moveline%%clrwhi% <nul& choice /c YN /n >nul
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
echo   カーソル替え %batver% セットアップ
echo ====================================O
echo.
echo.
echo          音楽のダンロードを準備しています...しばらくお待ちください。
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
echo   カーソル替え %batver% セットアップ
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
echo          シャットダウン中...
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
echo   カーソル替え %batver% セットアップ
echo ====================================O
echo.
echo.
echo          完了。
echo.
echo          音楽が再生されるまでに多少時間がかかる場合があります。
echo          音楽を停止したいときは、最小化されているpowershellを停止してください。
echo.
echo          音楽がいつまでたっても再生されない場合、以下の事項を確認してください。
echo.
echo          アンチウィルスソフトを確認する
echo          Githubが有効かどうか確認する
echo          GithubのAPIレート制限に到達していないかどうか
echo          Powershellが利用可能かどうか
echo.
echo          (5秒後にセットアップを続行します)
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
echo   カーソル替え %batver% セットアップ
echo ====================================O
echo セットアップ進捗 : 1/5 (注意事項の確認)
echo.
echo.
echo          カーソル替えは二つのファイルを生成します。
echo          %Settingsfile%と%FirstSTFsfile%の二つです。
echo.
echo          %Settingsfile%はカーソル替えの設定を保存しています。
echo          このファイルは非常に重要なファイルです。
echo.
echo          %FirstSTFsfile%はカーソルを変更したかどうかの判定に利用しています。
echo          これもまた重要なファイルです。
echo.
echo          もしユーザー(%USERNAME%、あなたです)がこれらのファイルを削除すると、
echo          このカーソル替えは正常に動作しなくなる場合があります。
echo          ですから、これらのファイルを絶対に削除しないでください。絶対に。
echo.
echo          (Y キーで続行)
echo.
set /p nothing=%clr2%%clrwhi%     Y=続行                                                                  1/3%moveline%%clrwhi% <nul&choice /c Y /n >nul
if %ErrorLevel%==1 goto :OOBEmain3


:OOBEmain3
color 07
cls
echo.
echo   カーソル替え %batver% セットアップ
echo ====================================O
echo セットアップ進捗 : 1/5 (注意事項の確認)
echo.
echo.
echo          このカーソル替えの開発者であるtamago_1908は、
echo          このカーソル替えによって発生したいかなる損失・損害に対して、
echo          いかなる責任を負わないものとします。
echo.
echo          言い換えれば、このカーソル替えを実行したことによる責任については、
echo          すべてカーソル替えを実行した本人に帰属します。
echo.
echo          ただし、tamago_1908はこのカーソル替えに存在するバグや問題
echo          に対する対応や修正、サポートなどは行うこととします。
echo          サポート期間についてはgithubを閲覧してください (英語)
echo          また、以上の免責事項はすべてカーソル替えのGithubにある、Readme
echo          と同じ意味を持ちます。必要に応じて確認してください。
echo.
echo          (Y キーで続行)
echo.
set /p nothing=%clr2%%clrwhi%     Y=続行                                                                  2/3%moveline%%clrwhi% <nul&choice /c Y /n >nul
if %ErrorLevel%==1 goto :OOBEmain4


:OOBEmain4
color 07
cls
echo.
echo   カーソル替え %batver% セットアップ
echo ====================================O
echo セットアップ進捗 : 1/5 (注意事項の確認)
echo.
echo.
echo          このカーソル替えはwindows 10 1803以降での動作を推奨しています。
echo          それ以下のバージョンのWindowsでの動作はサポートしていません。
echo          また、Powershell 5.1以降のバージョンが推奨されています。
echo.
echo          インターネット接続は必須ではありませんが、あったほうが良いです。
echo          (アップデートのチェック等に利用します)
echo.
echo          また、お使いのPCの性能はできるだけ早い方が良いです。
echo          恐ろしく速いCPUやのろっちいCPUでは、アニメーション
echo          や処理に影響を及ぼす可能性があります。
echo.
echo          (Y キーで続行)
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     Y=続行                                                                  3/3%moveline%%clrwhi% <nul&choice /c Y /n >nul
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul


:OOBEmain5
color 07
cls
echo.
echo   カーソル替え %batver% セットアップ
echo ====================================O
echo セットアップ進捗 : 2/5 (情報の確認)
echo.
echo.
echo          現在、カーソル替えは日本語版がインストールされています。
echo          これでいいですか？
echo.
echo.
echo          (Y=はい。正しい。言うまでもない。)
echo          (N=いいえ。にほんごがわかりません)
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     Y=続行     N=いいえ                                                        %moveline%%clrwhi% <nul&choice /c YN /n >nul
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto :OOBEmain5_1
if %ErrorLevel%==2 goto :OOBEmain5ifno


:OOBEmain5ifno
color 07
cls
echo.
echo   カーソル替え %batver% セットアップ
echo ====================================O
echo セットアップ進捗 : 2/5 (情報の確認)
echo.
echo.
echo          申し訳ありませんが、現在カーソル替えは英語と日本語
echo          以外の言語をサポートしていません。
echo.
echo          もしカーソル替えを上記の二つ以外の言語で利用したい場合には、
echo          アップデートを待つか、あきらめる必要があります。
echo          それでもなおセットアップを続けますか？
echo.
echo.
echo          (Y=はい。セットアップを続けます。)
echo          (N=いいえ。やっぱりセットアップをやめます。)
echo.
echo.
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     Y=続行     N=いいえ                                                        %moveline%%clrwhi% <nul&choice /c YN /n >nul
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto :OOBEmain5_1
if %ErrorLevel%==2 call :OOBEmainshutdown & timeout /t 1 /nobreak >nul&call :exit 


:OOBEmain5_1
color 07
cls
echo.
echo   カーソル替え %batver% セットアップ
echo ====================================O
echo セットアップ進捗 : 2/5 (情報の確認)
echo.
echo.
echo          カーソル替えがあなたの事を何と呼んで欲しいかを入力できます。
echo          デフォルトでは、カーソル替えはあなたのことを"%USERNAME%"と呼びます。
echo          変更しますか？
echo.
echo.
echo          (Y=はい、変更します。)
echo          (N=いいえ、そのままで。)
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     Y=はい     N=いいえ                                                        %moveline%%clrwhi% <nul&choice /c YN /n >nul
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto :OOBEmain5_2
if %ErrorLevel%==2 call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto :OOBEmain6


:OOBEmain5_2
set YourName=
color 07
cls
echo.
echo   カーソル替え %batver% セットアップ
echo ====================================O
echo セットアップ進捗 : 2/5 (情報の確認)
echo.
echo.
echo          では、以下になんと呼ばれたいかを入力してください。
echo.
echo.
echo          入力欄 :
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
echo   カーソル替え %batver% セットアップ
echo ====================================O
echo セットアップ進捗 : 2/5 (情報の確認)
echo.
echo.
echo          "%YourName%"と入力しました。
echo          これでいいですか？
echo.
echo.
echo          (Y=はい！)
echo          (N=いいえ)
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     Y=はい     N=いいえ                                                        %moveline%%clrwhi% <nul&choice /c YN /n >nul
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto :OOBEmain6
if %ErrorLevel%==2 goto :OOBEmain5_2


:OOBEmain5_2c_error
color 07
cls
echo.
echo   カーソル替え %batver% セットアップ
echo ====================================O
echo セットアップ進捗 : 2/5 (情報の確認)
echo.
echo.
echo          あなたの名前には必ず何かを入力してください。
echo          名前なしで続行することはできません！
echo.
echo.
echo          (何かキーを押して続行...)
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
echo   カーソル替え %batver% セットアップ
echo ====================================O
echo セットアップ進捗 : 3/5 (カーソル替えのテーマの設定)
echo.
echo.
echo          カーソル替えは自由にダークテーマか、ライトテーマ
echo          を選択し、設定することができます。
echo          選択しますか？
echo.
echo          (選択しなかった場合、デフォルトのダークテーマが適用されます。)
echo.
echo.
echo          (Y=はい。テーマを選択したいです)
echo          (N=いいえ。テーマなんぞ知るか！)
echo.
echo.
echo.
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     Y=続行     N=いいえ                                                        %moveline%%clrwhi% <nul&choice /c YN /n >nul
if %ErrorLevel%==1 goto :OOBEmain6theme1
if %ErrorLevel%==2 call :OOBEmainblank & timeout /t 1 /nobreak >nul&set oobetheme=dark&goto :OOBEmain7


:OOBEmain6theme1
if "%OOBEundiscard%"=="true" (call :OOBEmainblank & timeout /t 1 /nobreak >nul&set oobetheme=dark&set OOBEundiscard=&goto :OOBEmain7)
color 07
cls
echo.
echo   カーソル替え %batver% セットアップ
echo ====================================O
echo セットアップ進捗 : 3/5 (カーソル替えのテーマの設定)
echo.
echo.
echo          O============O    O============O
echo          IダークテーマI    IライトテーマI
echo          O============O    O============O
echo.
echo.
echo    ^・   何も選択されていません。A,Dまたは1,2で選択してください。
echo.
echo          (A,Dまたは1,2で選択し、YまたはEで決定します。)
echo          (B キーでテーマの選択を破棄します。)
echo.
echo.
echo.
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     A,1=左に動かす     D,2=右に動かす     B=退出                               %moveline%%clrwhi% <nul&choice /c AD12B /n >nul
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
echo   カーソル替え %batver% セットアップ
echo ====================================O
echo セットアップ進捗 : 3/5 (カーソル替えのテーマの設定)
echo.
echo.
echo          O============O    O============O
echo          I%clrhigh%ダークテーマ%clrhighend%I    IライトテーマI
echo          O============O    O============O
echo.
echo.
echo     ^・   最も原初的で、高貴且つ至高のテーマ。
echo     ^・   そしてカーソル替えに最も最適化されている。
echo     ^・   基本的にはこれが推奨されている。
echo.
echo          (A,Dまたは1,2で選択し、YまたはEで決定します。)
echo          (B キーでテーマの選択を破棄します。)
echo.
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     A,1=左に動かす     D,2=右に動かす     Y,E=決定     B=退出                  %moveline%%clrwhi% <nul&choice /c AD12BYE /n >nul
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
echo   カーソル替え %batver% セットアップ
echo ====================================O
echo セットアップ進捗 : 3/5 (カーソル替えのテーマの設定)
echo.
echo.
echo          O============O    O============O
echo          IダークテーマI    I%clrhigh%ライトテーマ%clrhighend%I
echo          O============O    O============O
echo.
echo.
echo     ^・   このテーマは綺麗かつ神々しい雰囲気がある。
echo     ^・   ダークテーマより圧倒的に明るく表示され、ハイコントラスト。
echo     ^・   ごく一部の機能がライトテーマに対応していない場合がある。
echo     ^・   より明るく見たい人におすすめ
echo.
echo          (A,Dまたは1,2で選択し、YまたはEで決定します。)
echo          (B キーでテーマの選択を破棄します。)
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     A,1=左に動かす     D,2=右に動かす     Y,E=続行     B=退出                  %moveline%%clrwhi% <nul&choice /c AD12BYE /n >nul
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
echo   カーソル替え %batver% セットアップ
echo ====================================O
echo セットアップ進捗 : 3/5 (カーソル替えのテーマの設定)
echo.
echo.
echo          O============O    O============O
echo          I%clrhigh%ダークテーマ%clrhighend%I    IライトテーマI
echo          O============O    O============O
echo.
echo     ^・   このテーマで本当によろしいですか？
echo           (ヒント : テーマは後から設定で変更できます)
echo.
echo.
echo          (Y=はい！このテーマが気に入りました)
echo          (N=んなわけあるかいボケ)
echo.
echo.
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     Y,E=続行     B,N=終了                                                      %moveline%%clrwhi% <nul&choice /c BNYE /n >nul
if %ErrorLevel%==1 goto :OOBEmain6theme2
if %ErrorLevel%==2 goto :OOBEmain6theme2
if %ErrorLevel%==3 call :OOBEmainblank & timeout /t 1 /nobreak >nul&set oobetheme=dark&goto :OOBEmain7
if %ErrorLevel%==4 call :OOBEmainblank & timeout /t 1 /nobreak >nul&set oobetheme=dark&goto :OOBEmain7



:OOBEmain6theme3confirm
color f0
cls
echo.
echo   カーソル替え %batver% セットアップ
echo ====================================O
echo セットアップ進捗 : 3/5 (カーソル替えのテーマの設定)
echo.
echo.
echo          O============O    O============O
echo          IダークテーマI    I%clrhigh%ライトテーマ%clrhighend%I
echo          O============O    O============O
echo.
echo     ^・   本当にこのテーマでよろしいですか？
echo           (ヒント : テーマは後から設定で変更できます)
echo.
echo.
echo          (Y=はい！このテーマが気に入りました)
echo          (N=んなわけあるかいボケ)
echo.
echo.
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     Y,E=続行     B,N=終了                                                      %moveline%%clrwhi% <nul&choice /c BNYE /n >nul
if %ErrorLevel%==1 goto :OOBEmain6theme3
if %ErrorLevel%==2 goto :OOBEmain6theme3
if %ErrorLevel%==3 set oobetheme=white&call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto :OOBEmain7
if %ErrorLevel%==4 set oobetheme=white&call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto :OOBEmain7


:OOBEmain6themeifback
if "%oobetheme%"=="white" (color f0) else (color 07)
cls
echo.
echo   カーソル替え %batver% セットアップ
echo ====================================O
echo セットアップ進捗 : 3/5 (カーソル替えのテーマの設定)
echo.
echo.
echo          本当にテーマの選択を破棄しますか？
echo          (破棄した場合、既定値のテーマに設定されます。)
echo.
echo.
echo          (Y=はい。破棄します。)
echo          (N=いいえ。テーマを選択します)
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     Y=はい     N=いいえ                                                        %moveline%%clrwhi% <nul&choice /c YN /n >nul
if %ErrorLevel%==1 set OOBEundiscard=true&exit /b
if %ErrorLevel%==2 exit /b

:OOBEmain7
if "%oobetheme%"=="white" (color f0) else (color 07)
cls
echo.
echo   カーソル替え %batver% セットアップ
echo ====================================O
echo セットアップ進捗 : 4/5 (設定のカスタマイズ)
echo.
echo.
echo          カーソル替えは設定をカスタマイズできます。
echo          カスタマイズしますか？
echo.
echo          (しなかった場合、設定は既定値に設定されます。)
echo.
echo.
echo          (Y=はい！)
echo          (N=いいえ。めんどくさいだけです。)
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     Y=続行     N=いいえ                                                        %moveline%%clrwhi% <nul&choice /c YN /n >nul
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto :OOBEmain7CustomizeSettings
if %ErrorLevel%==2 call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto :OOBEmain8

:OOBEmain7CustomizeSettingsdiscard
if "%oobetheme%"=="white" (color f0) else (color 07)
cls
echo.
echo   カーソル替え %batver% セットアップ
echo ====================================O
echo セットアップ進捗 : 4/5 (設定のカスタマイズ)
echo.
echo.
echo          本当に設定のカスタマイズを破棄しますか？
echo.
echo          (破棄した場合、すべての設定は既定値に設定されます)
echo.
echo          (Y=はい！破棄します！！)
echo          (N=いいえ！カスタマイズしたいです！)
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     Y=はい     N=いいえ                                                        %moveline%%clrwhi% <nul&choice /c YN /n >nul
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&set OOBEsetting1toggle=true&set OOBEsetting2toggle=false&set OOBEsetting3toggle=false&set OOBEsetting4toggle=true&set OOBEsetting5toggle=true&goto :OOBEmain8
if %ErrorLevel%==2 goto :OOBEmain7CustomizeSettings1

:OOBEmain7CustomizeSettings
if "%oobetheme%"=="white" (set OOBEsettingclr=[100m[97m&set OOBEsettingclr2=[0m[107m[30m)
if "%oobetheme%"=="dark" (set OOBEsettingclr=[7m&set OOBEsettingclr2=[0m)
set OOBEsetting1toggle=false&set OOBEsetting2toggle=false&set OOBEsetting3toggle=false&set OOBEsetting4toggle=false&set OOBEsetting5toggle=false
if "%oobetheme%"=="white" (color f0) else (color 07)
cls
echo.
echo   カーソル替え %batver% セットアップ
echo ====================================O
echo セットアップ進捗 : 4/5 (設定のカスタマイズ)
echo.
echo.
echo          O================================O   設定のカスタマイズ
echo          I 1 起動時にカーソル替えで起動   I
echo          O================================O   何も選択されていません。
echo          I 2 起動時のアドミン             I
echo          O================================O   W または S、1から5で選択し、
echo          I 3 起動時に更新確認             I   Y で切り替え、 N または Bで
echo          O================================O   破棄します。
echo          I 4 Enterの長押しを検知する機能  I   OK に移動したのち、Y
echo          O================================O   で確定します。
echo          I 5 起動時のアニメーション       I   
echo          O================================O
echo                       I  OK  I
echo                       O======O
echo.
echo.
set /p nothing=%clr2%%clrwhi%     W,S もしくは 1~5=動かす     Y=切り替え     N,B=破棄                        %moveline%%clrwhi% <nul&choice /c WS12345YNB6 /n >nul
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
echo   カーソル替え %batver% セットアップ
echo ====================================O
echo セットアップ進捗 : 4/5 (設定のカスタマイズ)
echo.
echo.
echo          O================================O   設定のカスタマイズ
echo          I%OOBEsettingclr% 1 起動時にカーソル替えで起動   %OOBEsettingclr2%I
echo          O================================O   カーソル替えの起動後に、
echo          I%OOBEsetting2clr% 2 起動時のアドミン             %OOBEsetting2clr2%I   カーソル替えに遷移
echo          O================================O   するかを切り替えます。
echo          I%OOBEsetting3clr% 3 起動時に更新確認             %OOBEsetting3clr2%I   有効にすると、カーソルをすぐに
echo          O================================O   変更できます。
echo          I%OOBEsetting4clr% 4 Enterの長押しを検知する機能  %OOBEsetting4clr2%I
echo          O================================O   %clrgra%無効にするのを推奨%OOBEsettingclr2%
echo          I%OOBEsetting5clr% 5 起動時のアニメーション       %OOBEsetting5clr2%I
echo          O================================O
echo                       I  OK  I
echo                       O======O
echo.
echo.
set /p nothing=%clr2%%clrwhi%     W,S もしくは 1~5=動かす     Y=切り替え     N,B=破棄                        %moveline%%clrwhi% <nul&choice /c WS12345YNB6 /n >nul
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
echo   カーソル替え %batver% セットアップ
echo ====================================O
echo セットアップ進捗 : 4/5 (設定のカスタマイズ)
echo.
echo.
echo          O================================O   設定のカスタマイズ
echo          I%OOBEsetting1clr% 1 起動時にカーソル替えで起動   %OOBEsetting1clr2%I
echo          O================================O   カーソル替えの起動時に管理者
echo          I%OOBEsettingclr% 2 起動時のアドミン             %OOBEsettingclr2%I   権限の取得を試みます。基本的に
echo          O================================O   カーソルの変更時に問題が発生した
echo          I%OOBEsetting3clr% 3 起動時に更新確認             %OOBEsetting3clr2%I   際に有効にするべきです。有効にする
echo          O================================O   と、起動が早くなる場合があります。
echo          I%OOBEsetting4clr% 4 Enterの長押しを検知する機能  %OOBEsetting4clr2%I   
echo          O================================O   %clrgra%無効にするのを推奨%OOBEsettingclr2%
echo          I%OOBEsetting5clr% 5 起動時のアニメーション       %OOBEsetting5clr2%I
echo          O================================O
echo                       I  OK  I
echo                       O======O
echo.
echo.
set /p nothing=%clr2%%clrwhi%     W,S もしくは 1~5=動かす     Y=切り替え     N,B=破棄                        %moveline%%clrwhi% <nul&choice /c WS12345YNB6 /n >nul
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
echo   カーソル替え %batver% セットアップ
echo ====================================O
echo セットアップ進捗 : 4/5 (設定のカスタマイズ)
echo.
echo.
echo          O================================O   設定のカスタマイズ
echo          I%OOBEsetting1clr% 1 起動時にカーソル替えで起動   %OOBEsetting1clr2%I
echo          O================================O   カーソル替えの起動時にアップデート
echo          I%OOBEsetting2clr% 2 起動時のアドミン             %OOBEsetting2clr2%I   の確認を行うかどうかを
echo          O================================O   切り替えられます。アップデート
echo          I%OOBEsettingclr% 3 起動時に更新確認             %OOBEsettingclr2%I   が利用可能な際には、
echo          O================================O   そのまま適用することができます。
echo          I%OOBEsetting4clr% 4 Enterの長押しを検知する機能  %OOBEsetting4clr2%I
echo          O================================O   %clrgra%無効にするのを推奨%OOBEsettingclr2%
echo          I%OOBEsetting5clr% 5 起動時のアニメーション       %OOBEsetting5clr2%I
echo          O================================O
echo                       I  OK  I
echo                       O======O
echo.
echo.
set /p nothing=%clr2%%clrwhi%     W,S もしくは 1~5=動かす     Y=切り替え     N,B=破棄                        %moveline%%clrwhi% <nul&choice /c WS12345YNB6 /n >nul
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
echo   カーソル替え %batver% セットアップ
echo ====================================O
echo セットアップ進捗 : 4/5 (設定のカスタマイズ)
echo.
echo.
echo          O================================O   設定のカスタマイズ
echo          I%OOBEsetting1clr% 1 起動時にカーソル替えで起動   %OOBEsetting1clr2%I
echo          O================================O   カーソル替えのメインメニューで、
echo          I%OOBEsetting2clr% 2 起動時のアドミン             %OOBEsetting2clr2%I   Enterが長押しされているかどうか
echo          O================================O   を検知する機能を切り替えられます。
echo          I%OOBEsetting3clr% 3 起動時に更新確認             %OOBEsetting3clr2%I   ちなみに、この機能には意味が
echo          O================================O   ない可能性が高いです。
echo          I%OOBEsettingclr% 4 Enterの長押しを検知する機能  %OOBEsettingclr2%I
echo          O================================O   %clrgra%有効にするのを推奨%OOBEsettingclr2%
echo          I%OOBEsetting5clr% 5 起動時のアニメーション       %OOBEsetting5clr2%I
echo          O================================O
echo                       I  OK  I
echo                       O======O
echo.
echo.
set /p nothing=%clr2%%clrwhi%     W,S もしくは 1~5=動かす     Y=切り替え     N,B=破棄                        %moveline%%clrwhi% <nul&choice /c WS12345YNB6 /n >nul
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
echo   カーソル替え %batver% セットアップ
echo ====================================O
echo セットアップ進捗 : 4/5 (設定のカスタマイズ)
echo.
echo.
echo          O================================O   設定のカスタマイズ
echo          I%OOBEsetting1clr% 1 起動時にカーソル替えで起動   %OOBEsetting1clr2%I
echo          O================================O   カーソル替えの起動時の読み込み
echo          I%OOBEsetting2clr% 2 起動時のアドミン             %OOBEsetting2clr2%I   が終了した際の起動アニメーション
echo          O================================O   を切り替えれます。無効だと
echo          I%OOBEsetting3clr% 3 起動時に更新確認             %OOBEsetting3clr2%I   ロードが終わったら即座に
echo          O================================O   メニューに遷移します。
echo          I%OOBEsetting4clr% 4 Enterの長押しを検知する機能  %OOBEsetting4clr2%I
echo          O================================O   %clrgra%有効にするのを推奨%OOBEsettingclr2%
echo          I%OOBEsettingclr% 5 起動時のアニメーション       %OOBEsettingclr2%I
echo          O================================O
echo                       I  OK  I
echo                       O======O
echo.
echo.
set /p nothing=%clr2%%clrwhi%     W,S もしくは 1~5=動かす     Y=切り替え     N,B=破棄                        %moveline%%clrwhi% <nul&choice /c WS12345YNB6 /n >nul
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
echo   カーソル替え %batver% セットアップ
echo ====================================O
echo セットアップ進捗 : 4/5 (設定のカスタマイズ)
echo.
echo.
echo          O================================O   設定のカスタマイズ
echo          I%OOBEsetting1clr% 1 起動時にカーソル替えで起動   %OOBEsetting1clr2%I
echo          O================================O   設定の確認
echo          I%OOBEsetting2clr% 2 起動時のアドミン             %OOBEsetting2clr2%I
echo          O================================O   ちなみに、最低でも一つの設定を
echo          I%OOBEsetting3clr% 3 起動時に更新確認             %OOBEsetting3clr2%I   有効にするのを推奨しています。
echo          O================================O   すべての設定は後から変更できます。
echo          I%OOBEsetting4clr% 4 Enterの長押しを検知する機能  %OOBEsetting4clr2%I   
echo          O================================O   %clrgra%(設定メニューで変更可能)%OOBEsettingclr2%
echo          I%OOBEsetting5clr% 5 起動時のアニメーション       %OOBEsetting5clr2%I
echo          O================================O
echo                       I%OOBEsettingclr%  OK  %OOBEsettingclr2%I
echo                       O======O
echo.
echo.
set /p nothing=%clr2%%clrwhi%     W,S もしくは 1~5=動かす     Y=切り替え     N,B=破棄                        %moveline%%clrwhi% <nul&choice /c WS12345YNB6 /n >nul
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
echo   カーソル替え %batver% セットアップ
echo ====================================O
echo セットアップ進捗 : 4/5 (設定のカスタマイズ)
echo.
echo.
echo          設定のカスタマイズ :
echo.
echo          1 変更後の再起動の確認        : %OOBEsetting1toggle% %clrgra%(falseが推奨)%OOBEsettingclr2%
echo          2 起動時のアドミン            : %OOBEsetting2toggle% %clrgra%(falseが推奨)%OOBEsettingclr2%
echo          3 起動時に更新確認            : %OOBEsetting3toggle% %clrgra%(falseが推奨)%OOBEsettingclr2%
echo          4 Enterの長押しを検知する機能 : %OOBEsetting4toggle% %clrgra%(trueが推奨)%OOBEsettingclr2%
echo          5 起動時のアニメーション      : %OOBEsetting5toggle% %clrgra%(trueが推奨)%OOBEsettingclr2%
echo.
echo          続行すると、これらの設定がすべて設定ファイルに書き込まれます。
echo          よろしいですか？ %clrgra%(設定ファイルは "%batchmainpath%"にあります。) %OOBEsettingclr2%
echo.
echo          (Y=はい)
echo          (N=いいえ。やっぱり変更したいです。)
echo.
echo.
set /p nothing=%clr2%%clrwhi%     Y=はい     N=いいえ                                                        %moveline%%clrwhi% <nul&choice /c YN /n >nul
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
echo   カーソル替え %batver% セットアップ
echo ====================================O
echo セットアップ進捗 : 5/5 (セットアップ完了)
echo.
echo.
echo          セットアップは完了しました。
echo.
echo          最後に、カーソル替えに対して何かエラーや問題、提案がある場合には、
echo          Githubでissueを作成して、開発者に報告してください。
echo.
echo          カーソル替えはまだ開発途中で、未完成です。
echo          それだけは理解してください。
echo.
echo          (Y または E キーでメニューに移動)
echo.
echo.
echo.
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     Y,E=退出                                                                   %moveline%%clrwhi% <nul&choice /c YE /n >nul
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
echo リカバリーメニューを読み込んでいます。 しばらくお待ちください...& timeout /t 1 /nobreak >nul
:Cursor_Changer_REmenu_main
cls
title カーソル替え ^| リカバリーメニュー
:Cursor_Changer_REmenu_main_loop
if not defined dummy (set /p nothing=[?25l<nul)
if not defined dummy (set /p nothing=[H<nul)
for /l %%i in (9,1,10) do (set /p nothing=[%%i;7H                                                            [H<nul)
if %rmsel%==0 (set /p nothing=[9;22H 現在は何も選択されていません。[H<nul)
if %rmsel%==1 (set /p nothing=[9;25H カーソル替えを再起動します。[10;22H ^(基本的にはこれがおすすめです。^)[H<nul)
if %rmsel%==2 (set /p nothing=[9;28H 設定を初期化します。[10;23H ^(全ての設定を初期化します。^)[H<nul)
if %rmsel%==3 (set /p nothing=[9;21H リカバリーコンソールに移動します。[10;17H ^(デバッグ目的のコマンドを利用できます。^)[H<nul)
if %rmsel%==4 (set /p nothing=[9;26H メニューから退出します。[10;29H ^(シャットダウン^)[H<nul)
echo                     カーソル替え %batver% リカバリーメニュー              
echo.
echo                            %rmcb1%        再起動        %clr2%
echo                            %rmcb2%     設定の初期化     %clr2%
echo                            %rmcb3% リカバリーコンソール %clr2%
echo                            %rmcb4%         退出         %clr2%
echo.
echo                     1~4 か WS で 選択、 E か Y で 決定
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
title カーソル替え ^| リカバリーメニュー
echo                     カーソル替え %batver% リカバリーメニュー                 
echo.
echo.  
echo                     設定の初期化 (デフォルト値に戻す) 
echo                          本当に実行しますか？
echo.
echo.
echo                           Yで実行、Nで戻る
echo.
choice /c YN /n 
if %ErrorLevel%==1 (
call :Wipealldeta
goto :Cursor_Changer_REWipeYippeee
)
if %ErrorLevel%==2 set rmsel=2& goto :Cursor_Changer_REmenu_main

:Cursor_Changer_REWipeYippeee
cls
title カーソル替え ^| リカバリーメニュー
echo                     カーソル替え %batver% リカバリーメニュー                 
echo.
echo.  
echo                               設定の初期化は
echo                             正常に完了しました。
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
echo リカバリーコンソールを読み込んでいます...
timeout /t 2 /nobreak >nul
cls
:Cursor_Changer_REConsolemain
if not defined dummy (set /p nothing=[?25h<nul)
title カーソル替え ^| リカバリーコンソール
echo tamago_1908 カーソル替え [Version %batver%]
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
echo                                                こんにちは！
echo                                   実行したいコマンドを入力してください。
echo                                            "help" と入力すれば
echo                                       全コマンドリストを参照できます。
echo                                デバッグ目的のコマンドをすべて利用可能です。
echo                                     (restoresetting で設定の初期化)
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
echo 完了。何かキーを押して続行...
pause >nul
)
if "%selected%"=="alldefdeletebat" (set hatenakeikoku=0&echo delete bat, confirm to type something...&pause&goto :alldefdeletefinish5)
if "%selected%"=="windowsfiltertest" (goto :batbootcheckwinverbad)
if "%selected%"=="funanimationdeb" (goto :batbootanimationfun)
if "%selected%"=="openie" (goto :openiedev)
if "%selected%"=="setenter" (echo.&set /p hatenakeikoku=pls type:&goto :hazimeboot) else (set selected= &echo 有効なコマンドを入力してください。&goto :Cursor_Changer_REConsoleask)


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
if "%linuxboot%"=="false" (mode con: cols=75 lines=25)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   & set ??????=ここで何をしているんだ？ ここにいるんだろ？%username%.
if "%settingbypass%"=="true" (goto :hazimemenuskipboot)
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] admin checked.) else (cls)
rem 管理者権限設定の検知
find "admin=true" %Settingsfile% > nul
if "%adminbypass%"=="true" (goto :gotadmin)
if "%errorlevel%"=="0" (goto :batstartadm) else (
call :SAB_Manager 0
goto :hazime
)


:batstartadm
if not "%linuxboot%"=="true" (cls)
rem 管理者権限の取得
if not "%linuxboot%"=="true" (echo copyright.カーソル替え %batver% by tamago_1908)
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    goto :UACPrompt
) else ( goto :gotAdmin )
:UACPrompt
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Requesting Administrative privileges...)
powershell -NoProfile -Command "Start-Process '%~dp0%~n0%~x0' -Verb RunAs" >nul && PowerShell -WindowStyle Hidden -Command Exit && call :exit 0
echo.
if "%linuxboot%"=="true" (echo [%linuxishclred%ERROR%linuxishclr2%] Request for administrative privileges denied. & echo.) else (
echo 管理者権限の要求が拒否されました。
echo ^(ヒント: 管理者権限の要求は設定で無効にできます。^)
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
rem 設定とその他のロード
rem 何を読み込み、読み込んだ後どこにgotoしたいかを変数に代入必要 set wantload=setting1 set whatloadgoto=hazime 等 hazime関係の場合はそれオンリー
rem カーソルの色に関してはメインの変更部分には実装していません。変更してからhazimeに戻って来れるように設計してないので。
rem 設定を追加する場合は基本コピペで大丈夫。ただ、メニューの見た目とかにかかわるものではコードを追加しないといけないかも
:settingloads
cd /d %batchmainpath%
if not exist %Settingsfile% (
cls
title カーソル替え ^| 設定エラー
echo 設定ファイルが存在しません。
pause
echo 恐らく、初回起動をした際にそのままカーソル替えを閉じてから再起動してしまったのが原因でしょう。それか、故意に設定ファイルを消去したか...少なくとも、設定ファイルが存在しないのは事実です。
pause
cls
echo 設定ファイルを再生成します。いままでの設定はすべて削除されます。
pause
cls
call :Wipealldeta
title カーソル替え ^| ...
echo 再生成が完了しました。
pause
echo 変更を適用するため、カーソル替えを再起動してください。
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
    for /l %%i in (0,1,1000) do (set /p nothing= すぐにけせ <nul)
timeout 2 /nobreak >nul & call :exit)
set die=& set die2=


if "%bootbatnow%"=="no" (goto :whatload) else (goto :setting1load)
:setting1load
set allsettingerror=0
find "BootAsCC=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting1onoff=有効
if %ErrorLevel%==1 goto :setting1load2
if "%bootbatnow%"=="yes" (
if "%linuxboot%"=="true" if not "%bootbatnow%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Setting1 Loaded as "true")
call :SAB_Manager 1
goto :setting2load
)
goto :whatloadgoto


:setting2load
find "admin=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting2onoff=有効
if %ErrorLevel%==1 goto :setting2load2
if "%bootbatnow%"=="yes" (
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Setting2 Loaded as "true")
call :SAB_Manager 2
goto :setting3load
) 
goto :whatloadgoto

:setting3load
find "CheckUpdate=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting3onoff=有効
if %ErrorLevel%==1 goto :setting3load2
if "%bootbatnow%"=="yes" (
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Setting3 Loaded as "true")
call :SAB_Manager 3
goto :setting4load
) 
goto :whatloadgoto

:setting4load
find "hatenakeikoku=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting4onoff=有効
if %ErrorLevel%==1 goto :setting4load2
if "%bootbatnow%"=="yes" (
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Setting4 Loaded as "true")
call :SAB_Manager 4
goto :setting5load
) 
goto :whatloadgoto

:setting5load
find "bootanimation=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting5onoff=有効
if %ErrorLevel%==1 goto :setting5load2
if "%bootbatnow%"=="yes" (
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Setting5 Loaded as "true")
call :SAB_Manager 5
goto :setting5_s1load
) 
goto :whatloadgoto


:setting5_s1load
find "s5_linuxboot=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting5_s1onoff=有効
if %ErrorLevel%==1 goto :setting5_s1load2
if "%bootbatnow%"=="yes" (
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Setting5_1 Loaded as "true")
call :SAB_Manager 5
goto :setting5_s2load
) 
goto :whatloadgoto

:setting5_s2load
find "s5_simpleboot=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting5_s2onoff=有効
if %ErrorLevel%==1 goto :setting5_s2load2
if "%bootbatnow%"=="yes" (
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Setting5_2 Loaded as "true")
call :SAB_Manager 5
goto :setting5_s3load
) 
goto :whatloadgoto

:setting5_s3load
find "s5_rawboot=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting5_s3onoff=有効
if %ErrorLevel%==1 goto :setting5_s3load2
if "%bootbatnow%"=="yes" (
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Setting5_3 Loaded as "true")
call :SAB_Manager 5
goto :setting6load
) 
goto :whatloadgoto

:setting6load
find "HazimeBg=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting6onoff=有効
if %ErrorLevel%==1 goto :setting6load2
if "%bootbatnow%"=="yes" (
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Setting6 Loaded as "true")
call :SAB_Manager 6
goto :wmodeload
) 
goto :whatloadgoto


:wmodeload
find "wmode=true" %Settingsfile% > nul
if "%ErrorLevel%"=="0" (set wmodeonoff=ダークテーマに変更  &set wmodetoggle=true)
if "%ErrorLevel%"=="1" (goto :wmodeload2)
if "%bootbatnow%"=="yes" (
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Wmode Loaded as "true")
call :SAB_Manager 6
goto :loads
) 
goto :whatloadgoto

:allsettingtest
rem 設定の欠損を検証
:setting1load2
find "BootAsCC=false" %Settingsfile% > nul
if %ErrorLevel%==0 (set setting1onoff=無効& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting1 Loaded as "false")) else if %ErrorLevel%==1 set setting1onoff=null&set /a allsettingerror=allsettingerror+1& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclred%ERROR%linuxishclr2%] Setting1 is corrupted. Loaded as "null")
if "%bootbatnow%"=="yes" (call :SAB_Manager 1)
if "%bootbatnow%"=="yes" (goto :setting2load) else (goto :whatloadgoto)

:setting2load2
find "admin=false" %Settingsfile% > nul
if %ErrorLevel%==0 (set setting2onoff=無効& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting2 Loaded as "false")) else if %ErrorLevel%==1 set setting2onoff=null&set /a allsettingerror=allsettingerror+1& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclred%ERROR%linuxishclr2%] Setting2 is corrupted. Loaded as "null")
if "%bootbatnow%"=="yes" (call :SAB_Manager 2)
if "%bootbatnow%"=="yes" (goto :setting3load) else (goto :whatloadgoto)

:setting3load2
find "CheckUpdate=false" %Settingsfile% > nul
if %ErrorLevel%==0 (set setting3onoff=無効& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting3 Loaded as "false")) else if %ErrorLevel%==1 set setting3onoff=null&set /a allsettingerror=allsettingerror+1& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclred%ERROR%linuxishclr2%] Setting3 is corrupted. Loaded as "null")
if "%bootbatnow%"=="yes" (call :SAB_Manager 3)
if "%bootbatnow%"=="yes" (goto :setting4load) else (goto :whatloadgoto)

:setting4load2
find "hatenakeikoku=false" %Settingsfile% > nul
if %ErrorLevel%==0 (set setting4onoff=無効& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting4 Loaded as "false")) else if %ErrorLevel%==1 set setting4onoff=null&set /a allsettingerror=allsettingerror+1& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclred%ERROR%linuxishclr2%] Setting4 is corrupted. Loaded as "null")
if "%bootbatnow%"=="yes" (call :SAB_Manager 4)
if "%bootbatnow%"=="yes" (goto :setting5load) else (goto :whatloadgoto)

:setting5load2
find "bootanimation=false" %Settingsfile% > nul
if %ErrorLevel%==0 (set setting5onoff=無効& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting5 Loaded as "false")) else if %ErrorLevel%==1 set setting5onoff=null&set /a allsettingerror=allsettingerror+1& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclred%ERROR%linuxishclr2%] Setting5 is corrupted. Loaded as "null")
if "%bootbatnow%"=="yes" (call :SAB_Manager 5)
if "%bootbatnow%"=="yes" (goto :setting5_s1load) else (goto :whatloadgoto)

:setting5_s1load2
find "s5_linuxboot=false" %Settingsfile% > nul
if %ErrorLevel%==0 (set setting5_s1onoff=無効& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting5_1 Loaded as "false")) else if %ErrorLevel%==1 set setting5_s1onoff=null&set /a allsettingerror=allsettingerror+1& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclred%ERROR%linuxishclr2%] Setting5_1 is corrupted. Loaded as "null")
if "%bootbatnow%"=="yes" (call :SAB_Manager 5)
if "%bootbatnow%"=="yes" (goto :setting5_s2load) else (goto :whatloadgoto)

:setting5_s2load2
find "s5_simpleboot=false" %Settingsfile% > nul
if %ErrorLevel%==0 (set setting5_s2onoff=無効& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting5_2 Loaded as "false")) else if %ErrorLevel%==1 set setting5_s2onoff=null&set /a allsettingerror=allsettingerror+1& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclred%ERROR%linuxishclr2%] Setting5_2 is corrupted. Loaded as "null")
if "%bootbatnow%"=="yes" (call :SAB_Manager 5)
if "%bootbatnow%"=="yes" (goto :setting5_s3load) else (goto :whatloadgoto)

:setting5_s3load2
find "s5_rawboot=false" %Settingsfile% > nul
if %ErrorLevel%==0 (set setting5_s3onoff=無効& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting5_3 Loaded as "false")) else if %ErrorLevel%==1 set setting5_s3onoff=null&set /a allsettingerror=allsettingerror+1& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclred%ERROR%linuxishclr2%] Setting5_3 is corrupted. Loaded as "null")
if "%bootbatnow%"=="yes" (call :SAB_Manager 5)
if "%bootbatnow%"=="yes" (goto :setting6load) else (goto :whatloadgoto)

:setting6load2
find "HazimeBg=false" %Settingsfile% > nul
if %ErrorLevel%==0 (set setting6onoff=無効& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting6 Loaded as "false")) else if %ErrorLevel%==1 set setting6onoff=null&set /a allsettingerror=allsettingerror+1& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclred%ERROR%linuxishclr2%] Setting6 is corrupted. Loaded as "null")
if "%bootbatnow%"=="yes" (call :SAB_Manager 6)
if "%bootbatnow%"=="yes" (goto :wmodeload) else (goto :whatloadgoto)

:wmodeload2
find "wmode=false" %Settingsfile% > nul
if "%ErrorLevel%"=="0" (set wmodeonoff=ホワイトテーマに変更& set wmodetoggle=false& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Wmode Loaded as "false")) else if "%ErrorLevel%"=="1" (set wmodeonoff=  null  テーマに変更&set wmodetoggle=false&set /a allsettingerror=allsettingerror+1& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclred%ERROR%linuxishclr2%] Wmode is corrupted. Loaded as "null"))
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
if "%bootbatnow%"=="no" (echo 処理中...) else (
if "%linuxboot%"=="true" (echo.&echo [%linuxishclr%info%linuxishclr2%] %FirstSTFsfile% is Loaded.)
call :SAB_Manager 8
goto :cursorcolorload
)
if "%whatloadgoto%"=="hazime" (goto :hazimemenu)
goto :cursorcolorload

:cursorcolorload
reg query "HKEY_CURRENT_USER\Control Panel\Cursors" /v "" | find "Windows 黒" >nul
if "%ErrorLevel%"=="0" (set cursorcolor=白)
if "%ErrorLevel%"=="1" (set cursorcolor=白)
if "%bootbatnow%"=="no" (echo 処理中...) else (
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Cursor Color is Loaded.)
call :SAB_Manager 10
goto :hazimecursorcolor2
)
if "%whatloadgoto%"=="hazime" (goto :hazimemenu)

:hazimecursorcolor2
reg query "HKEY_CURRENT_USER\Control Panel\Cursors" /v "" | find "Windows 標準" >nul
if "%ErrorLevel%"=="0" (set cursorcolor=黒)
if "%bootbatnow%"=="no" (echo 処理中...) else (
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Menu stuff All Loaded.)
call :SAB_Manager 10
goto :SAB_Manager_initializeVaribale
)
if "%whatloadgoto%"=="hazime" (goto :hazimemenu)
goto :hazimemenu



:SAB_Manager
if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] SAB_Manager Running...)
rem ブートアニメーション。
rem 下は読み込み時のテキスト分岐。
if "%bootbatnow%"=="no" (cls & title カーソル替え ^| 設定 処理中... & echo 処理中... & goto :whatload) else (title カーソル替え ^| 起動中...)
if "%simpleboot%"=="true" (cls & echo 起動中...& exit /b)
if "%wmodetoggle%"=="false" (set loadscrnprgsclr=[7m&set loadscrnprgsclrgra=[48;5;244m&set loadscrnprgsclr2=[0m&set back_to_the_firstline=[18;0H&set back_to_the_loadline=[23;12H)
if "%wmodetoggle%"=="true" (set loadscrnprgsclr=[47m[97m&set loadscrnprgsclrgra=[48;5;244m&set loadscrnprgsclr2=[0m[107m[30m&set back_to_the_firstline=[18;0H&set back_to_the_loadline=[23;12H) else (set loadscrnprgsclr=[7m&set loadscrnprgsclrgra=[48;5;244m&set loadscrnprgsclr2=[0m&set back_to_the_firstline=[18;0H&set back_to_the_loadline=[23;12H)
if not defined dummy if not "%linuxboot%"=="true" (set /p nothing=[?25l<nul)
if defined linuxboot if "%linuxboot%"=="true" (exit /b)

rem 読み込みバーのUI (枠) 描写
if not defined SAB_Manager_Drewed (set SAB_Manager_Drewed=true& set batloadprgsDrewrn=12) else if defined SAB_Manager_Drewed (goto :SAB_Manager_Main_Bar)
set /p nothing=%back_to_the_loadline%%loadscrnprgsclr2%<nul
echo %back_to_the_firstline%
echo O=========================================================================O
echo.
echo                       カーソル替えを読み込んでいます...
echo           O=====================================================O
echo           I                                                     I
echo           O=====================================================O
set /p nothing=%back_to_the_loadline%%loadscrnprgsclrgra%                                                     %loadscrnprgsclr2%<nul
:SAB_Manager_Main_Bar
rem 実際のprogressバー本体の描写
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
rem ここの処理、いるかなぁ？普通にsettingの値が欲しいだけならsetting1loadとかにgotoしたうえで行き先をwhatloadgotoに代入すれば動くと思うんだけど....
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
rem よっしゃーーーーーーーーー！！！！！！！！！！！！！！！！！！！！！
if "%linuxboot%"=="true" (setlocal enabledelayedexpansion & set /a yay=%random%*17/32767& set yayshow=ー
for /l %%i in (0,1,!yay!) do (set yayshow=!yayshow!ー)
setlocal disabledelayedexpansion)

if "%linuxboot%"=="true" (echo.&echo [%linuxishclr%info%linuxishclr2%] 起動完了! よっしゃー%yayshow% :D& echo [%linuxishclr%info%linuxishclr2%] ^(起動時間 : %BootTime% 秒^)& title カーソル替え ^| よっしゃー%yayshow%& set yay=& set yayshow=& timeout /t 2 /nobreak >nul& cls) else (cls)
if "%rawboot%"=="true" (echo off)
if "%firststartbat%"=="yes" (goto :batbootanimationbypassfun)
if "%setting5onoff%"=="無効" (goto :checksum)
rem ブートアニメーションを再生。64分の1の確率または512分の1の確率で別バージョンが再生される。ramdomの仕様(？)によって二回連続でrandomをしないといけない。
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
title カーソル替え ^| ようこそ
if "%wmodetoggle%"=="true" (set welcomelineclr=[38;2;135;135;135m& set welcomelineclr2=[0m[107m[30m& set welcomelineclr3=[30m) else (set welcomelineclr=[38;2;120;120;120m& set welcomelineclr2=[0m& set welcomelineclr3=[39m)
if "%wmodetoggle%"=="true" (for /l %%i in (0,1,3) do (set /p nothing=[%%i;0H[48;2;230;230;230m                                                                           [0;0H<nul)) else (for /l %%i in (0,1,3) do (set /p nothing=[%%i;0H[48;2;20;20;20m                                                                           [0;0H<nul))
echo.
if not defined dummy (echo [30aカーソル替え%batver%)
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
echo ::::: ##.... ##: #########:::: ##::::            ようこそ
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
rem 設定の欠損を確認
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
title カーソル替え ^| さすがカーソル替え！俺たちにできないことを平然とやってのけるッ！そこにしびれる憧れるぅっ！
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
echo                         カーソル替え%batver% ようこそ 2021-2024 
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
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"助けて\", '', 'OK', 'Error');Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"助けて\", '', 'OK', 'None')"
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"助けますか。\", '', [System.Windows.Forms.MessageBoxButtons]::'Yesno', 'None');exit $result;"
if "%errorlevel%"=="6" (goto :batbootanimationscaryif1)
if "%errorlevel%"=="7" (goto :batbootanimationscaryif2)
call :exit 0
:batbootanimationscaryif1
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"よっしゃー :)\", '', 'OK', 'none')"
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
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"助けてほしかっただけなのに :%batbootanimationscaryihatevscaf%\", '', 'OK', 'information')"
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
    title カーソル替え ^| 設定の破損
    mode con: cols=60 lines=29
    echo.
    echo                      設定が破損しています！           
    echo.
    echo   O======================================================O
    echo   I                                                      I
    echo   I                        エラー!                       I
    echo   I                                                      I
    echo   I       設定が %allsettingerrorshow% 個破損しているか、存在しません。     I
    echo   I        設定ファイルを変更したか、移動していない      I
    echo   I                  事を確認してください。              I
    echo   I                                                      I
    echo   I    カーソル替えの更新後にこのメッセージが表示された  I
    echo   I      場合、新しい設定が追加された可能性が高いです    I
    echo   I                                                      I
    echo   I        その場合、設定を修復するか、破損している      I
    echo   I            箇所を手動で変更することによって          I
    echo   I                      修復できます。                  I
    echo   I                                                      I
    echo   I  修復する際には、設定に行き、破損している個所 ^(Null^) I
    echo   I      を切り替えてください。そうすると、自動的に      I
    echo   I                 破損個所が修復されます。             I
    echo   I       修復の際には、デフォルトの値に設定は変更       I
    echo   I                        されます。                    I
    echo   I                                                      I
    echo   I                 %clrgra%何かキーを押して続行...%clr2%              I
    echo   I                                                      I
    echo   O======================================================O
    echo.
    pause >nul
)
set allsettingerrorshow=&set clrgra=&set clr2= 
if %allsettingerror% gtr 5 (goto :fixallsetting) else (if "%Setting1onoff%"=="有効" (goto :cursorchange) else (goto :hazimemenu))
echo.
:fixallsetting
rem 自動修復
timeout /t 2 /nobreak >nul
mode con: cols=75 lines=25
echo.
SET /P selected=自動修復を利用できます。自動修復を実行するとそれまでの設定がすべて初期化され、デフォルトの設定にリセットされます。続行しますか？(yesまたはno):
if "%selected%"=="yes" (
call :Wipealldeta
echo.
echo 修復が完了しました。
pause
call :exit 1
)
if "%selected%"=="y" (
call :Wipealldeta
echo.
echo 修復が完了しました。
pause
call :exit 1
)
if "%selected%"=="no" (hazimemenuskipboot)
if "%selected%"=="n" (hazimemenuskipboot)

goto :hazimemenu


rem メニューの生成の準備
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
rem メニューの描写
title カーソル替え ^| メインメニュー
:hazimemenudrew
cls
if not "%MenuRedrew%"=="true" (call :background_menu)
rem center = 37 (75). 文字を中央に設置する場合は二分の一colsの値から中央に設置したい文字の、文字数の半分を引いた数の空白を挿入すればよい
echo                              カーソル替え%batver%  %hazimebuild%
echo.
echo   O=====================================================================O
echo   I     1 カーソル替え          2 アプリケーション           3 終了     I
echo   I                                                                     I
echo   I                   4 バージョン情報          5 設定                  I
echo   O=====================================================================O
echo.
if "%MenuRedrew%"=="true" (set MenuRedrew=& exit /b) else (call :hazimeMessages)
if "%errorlevel%"=="1" (cls&set Updateavailable=& goto :hazimemenudrew) else if "%errorlevel%"=="0" (goto :hazimemenudrewend)
:hazimemenudrewend
set selected=
rem ask select
echo            実行したい数字またはアルファベットを入力してください。
if "%FirstCursorisEdited%"=="true" (set /p "selected=[13;37H") else if "%hazimemenuMessageshowed%"=="true" (set /p selected=[13;37H) else if not defined hazimemenuMessageshowed (set /p selected=[11;37H)
echo.& if "%selected%"=="" (goto :hatenahazime) else (echo %selected% が選択されました。)
set hatenaita=0


rem 選択の分岐
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

rem イースターエッグ
if "%selected%"=="egg1" (color 1f&call :BSOD_Errors 4)
if "%selected%"=="egg2" (goto :Dogcheck)
if "%selected%"=="wwssdadaba" (set hatenaita=0&goto :littleeasteregg)
if "%selected%"=="tamago1908" (echo :P&pause&goto :hazime)
if "%selected%"=="himazinnoob1908" (echo :D&pause&goto :hazime)
if "%selected%"=="mskg1908" (echo xD&pause&goto :hazime)
if "%selected%"=="1908" (goto :1908hell)
if "%selected%"=="helloworld" (call :Hello_World& goto :hazimemenu)
if "%selected%"=="私は眠いです" (echo 俺もだ！&pause& goto :hazime)

rem デバッグ用コマンドの参照
if "%selected%"=="help" (goto :allcommands)

rem デバッグ用
if "%selected%"=="crashtest" (exit /b)
if "%selected%"=="checkmem" (call :checkmem& goto :hazimemenu)
if "%selected%"=="boottime" (echo.& echo 起動時間 : %BootTime% 秒& echo.& pause & goto :hazimemenu)
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
if "%selected%"=="reboot" (echo.& echo 再起動しています...& call :rebootbatch)
if "%selected%"=="counttestdeb" (set hatenaita=0&goto :stupidtest) else echo. &echo 無効な（もしくは使用不可な）選択です！有効な入力をしてください。&pause&goto :hazimemenudrew

rem 何も入力しなかった場合の帰還処理
:hatenahazime
echo ?
echo.
pause
echo すみません。何か入力してくれませんか？
echo.
pause
if "%hatenakeikoku%"=="無効" (goto :hazimemenu)

rem 長押しを検知するための機構
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

rem 長押しの警告メッセージ集
:hatenaoko1
if %hatenaita% gtr 21 (goto :hazime)
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"...何してるの...？\", '...', 'OK', 'none');exit $result;"
goto :hazime

:hatenaoko2
if %hatenaita% gtr 51 (goto :hazime)
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"...なんで何も入力せずにエンター押し続けてるの！？...もしかして...\", '>:/', 'OK', 'none');exit $result;"
goto :hazime

:hatenaoko3
if %hatenaita% gtr 101 (goto :hazime)
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"ふつうそこまで何も打たずにエンター押さないだろ！！！いい加減にしろ！！！\", '>:(', 'OK', 'none');exit $result;"
goto :hazime

:hatenaoko4
if %hatenaita% gtr 131 (goto :hazime)
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"さすがにそろそろやめてくれ\", '...', 'OK', 'none');exit $result;"
goto :hazime

:hatenaoko5
if %hatenaita% gtr 201 (goto :hazime)
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"これ以上やったら後悔させます。200回も...\", '最後の警告', 'OK', 'Warning');exit $result;"
goto :hazime

:hatenaoko6
if %hatenaita% gtr 251 (goto :hazime)
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"...\", '...', 'OK', 'Error');exit $result;"
shutdown /r /t 5 /c "後悔するがよい。"
taskkill /im cmd.exe
goto :reboot


:hazimeMessages
rem Display messages. FirstCursorisEdited message, and updateavailable message
Call :hazimeMessagesTimecheck & set tcmrand=&set tcmrand2=
if not "%errorlevel%"=="1" (
if "%FirstCursorisEdited%"=="true" (echo [22a簡単に  かきかえられた  でしょ？&echo.)
) else (set hazimemenuMessageshowed=true)
if "%Updateavailable%"=="true" (
    title カーソル替え ^| 更新が利用可能 ^(試験的^)
  setlocal enabledelayedexpansion
    if "%batbeta%"=="True" (set batbetamessage=^(ヒント : このバージョンはベータ版です。バグや問題がある可能性があります。 ^))
  echo アップデートが利用可能です！ ^(%updatemyversion% to %updateversion%^)
  echo アップデートしますか？^(アップデートすると英語版へ強制的に変更されます^) !batbetamessage!
  set batbetamessage=
  SET /P updateselected=^(Y または N^) :
  if "!updateselected!"=="y" (set updateselected=&set updateavailable=&echo.&echo アップデート中...しばらくお待ちください。&cd %~dp0&set Powersheller=Doupdate&call :Powersheller&cd %batchmainpath%&echo アップデートに成功しました。&pause&exit)
if "!updateselected!"=="n" (set updateselected=&set updateavailable=&echo.&echo アップデートはキャンセルされました。起動時にアップデートを確認する機能は設定から無効にできます。&pause&set checkupdatetoggle=false&cls&exit /b 1)
setlocal disabledelayedexpansion
)
exit /b 0

:hazimeMessagesTimecheck
rem Display messages for specific dates
if "%timecheckmessageshowed%"=="true" (set hazimemenuMessageshowed=& exit /b 0) else (set timecheckmessageshowed=true)
if "%date:~0,4%"=="1999" (echo [25aウーパールーパーはどこ？& echo.& exit /b 1)
if "%date:~5%"=="01/01" (echo [22a明けましておめでとうございます。& echo.& exit /b 1)
if "%date:~5%"=="04/01" (echo [15aカーソル替えを利用したければ5000兆円払いな！& echo.& exit /b 1)
if "%date:~5%"=="10/31" (echo [27aハッピーハロウィン！& echo.& exit /b 1)
if "%date:~5%"=="12/25" (echo [28aメリークリスマス！& echo.& exit /b 1)
if "%date:~5%"=="12/31" (echo [13aいろいろあったけど  じぶんは  やっぱり  じぶんだ。& echo.& exit /b 1)
set tcmrand=0& set tcmrand2=0
set /a tcmrand=%random%*33/32767& set /a tcmrand2=%random%*33/32767
setlocal enabledelayedexpansion
rem you're bit lucky if you see this.
if "!tcmrand!"=="!tcmrand2!" (
set tcmrand=0
set /a tcmrand=%random%*11/32767& set /a tcmrand=%random%*11/32767
if "!tcmrand!"=="0" (echo [29aすべてが無意味だ&echo.& exit /b 1) else if "!tcmrand!"=="1" (echo [14a誰がこのメッセージを実際に読んでいるんだろう？& echo.& exit /b 1) else if "!tcmrand!"=="2" (echo [22a誰もこのバッチを気にしていない。& echo.& exit /b 1) else if "!tcmrand!"=="3" (echo [22a僕をアンインストールしないで& echo.& exit /b 1) else if "!tcmrand!"=="4" (echo [31aケーキは嘘だ& echo.& exit /b 1) else if "!tcmrand!"=="5" (echo [28aあなたは本当に%YourName%？& echo.& exit /b 1) else if "!tcmrand!"=="6" (echo [15a君達のバッチファイルは、全て私がいただいた。& echo.& exit /b 1) else if "!tcmrand!"=="7" (echo [30aHello world :D& echo.& exit /b 1) else if "!tcmrand!"=="8" (echo [27aDebiosを試してみよう& echo.& exit /b 1) else if "!tcmrand!"=="9" (echo [24aShivtanium OSを試してみよう& echo.& exit /b 1) else if "!tcmrand!"=="10" (goto :hazimemenuMessagesTimecheckEASTEREGG)
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
if not defined dummy (echo [19a最も最高なバッチファイルの名前は何？)
set name=
if "%namecount%" gtr "2" start /min powershell -WindowStyle Hidden -Command "& {Add-Type -AssemblyName System.Windows.Forms; Start-Sleep -Milliseconds 100; $welcomeText = \"カーソル替え\"; foreach ($char in $welcomeText.ToCharArray()) {[System.Windows.Forms.SendKeys]::SendWait($char); Start-Sleep -Milliseconds 125}; Start-Sleep -Milliseconds 500; [System.Windows.Forms.SendKeys]::SendWait('{ENTER}'); exit}"
rem where is my location?
rem powershell -Command "& { Add-Type -AssemblyName System.Windows.Forms; Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class KeyboardHelper { [DllImport(\"user32.dll\", SetLastError = true)] public static extern void keybd_event(byte bVk, byte bScan, uint dwFlags, UIntPtr dwExtraInfo); public const byte VK_LWIN = 0x5B; public const byte VK_S = 0x53; public const uint KEYEVENTF_KEYUP = 0x0002; public static void SendWinS() { keybd_event(VK_LWIN, 0, 0, UIntPtr.Zero); keybd_event(VK_S, 0, 0, UIntPtr.Zero); keybd_event(VK_S, 0, KEYEVENTF_KEYUP, UIntPtr.Zero); keybd_event(VK_LWIN, 0, KEYEVENTF_KEYUP, UIntPtr.Zero); } }'; Start-Sleep -Milliseconds 500; [KeyboardHelper]::SendWinS(); Start-Sleep -Milliseconds 250; $welcomeText = 'Where is my location?'; foreach ($char in $welcomeText.ToCharArray()) { [System.Windows.Forms.SendKeys]::SendWait($char); Start-Sleep -Milliseconds 50; }; Start-Sleep -Milliseconds 3500; [System.Windows.Forms.SendKeys]::SendWait('{ESC}') }"
if not defined dummy (set /p "name=[30a")
if not "%name%"=="カーソル替え" (set /a namecount=namecount+1) else (goto :hazimemenuMessagesTimecheckEASTEREGG_RIGHT)
if "%namecount%"=="1" (echo [29a残念、不正解！)
if "%namecount%"=="2" (echo [34a違う) else if %namecount% gtr 2 (echo [35a...)
ping -n 2 -w 500 localhost >nul
goto :hazimemenuMessagesTimecheckEASTEREGG_ASK
:hazimemenuMessagesTimecheckEASTEREGG_RIGHT
if not defined dummy (echo [31aその通り！)
if "%wmodetoggle%"=="true" (color f0) else (color 07)
timeout /t 2 /nobreak >nul
set name=& set namecount=
goto :hazimemenu


:background_menu
rem Honestly, I have no idea HOW this is working.
if "%setting7onoff%"=="無効" (exit /b)
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
    rem                                  ↑      and      ↑ Difference is must be 4. 170 is (100/) + 61+12. maybe.
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
echo メモリ使用量 (概算) : %memWholeKB%.%memFractionKB% KB (%total_length% バイト)
echo.
pause
set output=& set nl=& set length=& set crlf_count=& set total_length=& set memWholeKB=& set memFractionKB=
setlocal disabledelayedexpansion
exit /b


:exitmenu
rem Preparing of Menu and Variables
rem Smart Processing!!!! DO NOT CARE ABOUT SO MANY OF IF STATEMENTS. PLS
cls
title カーソル替え ^| 終了 
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
echo [4;22H I カーソル替えの終了 I 
echo [5;22H O==========O====%ccmmul%===%clr2%===O===========O 
echo [6;22H I%emb%     ^|    %clr2%I%emb2%   /   \  %clr2%I%emb3%           %clr2%I 
echo [7;22H I%emb%   / ^| \  %clr2%I%emb2%  V    ∧ %clr2%I%emb3%  ^-^-^-^-^-^-^>  %clr2%I 
echo [8;22H I%emb%   \___/  %clr2%I%emb2%   \___/  %clr2%I%emb3%           %clr2%I 
echo [9;22H O==========O==========O===========O 
echo [10;22H I[10;57HI 
echo [11;22H O=================================O 
echo [12;20H%clrgra%1~3、もしくはA,Dで移動、Y,Eで決定、Bで終了%clr2%
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
if "%Exitmenucurrent%"=="0" (echo [10;24H 何も選択されていません。& exit /b)
if "%Exitmenucurrent%"=="1" (echo [10;24H シャットダウン& set emb=%clred%& set emb2=& set emb3=& exit /b)
if "%Exitmenucurrent%"=="2" (echo [10;24H 再起動& set emb2=%clrgrn%& set emb=& set emb3=& exit /b)
if "%Exitmenucurrent%"=="3" (echo [10;24H 戻る& set emb3=%clrcyan%& set emb2=& set emb=& exit /b)
if "%Exitmenucurrent%"=="1c" (echo [10;24H 本当にシャットダウンしますか？& exit /b)
if "%Exitmenucurrent%"=="2c" (echo [10;24H 本当に再起動しますか？& exit /b)
exit /b

:exitmenu_exit
rem initialize of variable
set exitmenuexit=& set emb=& set emb2=& set emb3=& set exitmenuboot=& set clred=& set clrgrn=& set clrcyan=& set clrgra=
if not defined dummy (set /p nothing=[?25h<nul)
exit /b


:batshutdown
if not defined dummy (set /p nothing=[?25l<nul)
title カーソル替え ^| アリーヴェデルチ
cls
if "%wmodetoggle%"=="true" (set welcomelineclr=[38;2;135;135;135m& set welcomelineclr2=[0m[107m[30m& set welcomelineclr3=[30m) else (set welcomelineclr=[38;2;120;120;120m& set welcomelineclr2=[0m& set welcomelineclr3=[39m)
if "%wmodetoggle%"=="true" (for /l %%i in (0,1,3) do (set /p nothing=[%%i;0H[48;2;230;230;230m                                                                           [0;0H<nul)) else (for /l %%i in (0,1,3) do (set /p nothing=[%%i;0H[48;2;20;20;20m                                                                           [0;0H<nul))
echo.
if not defined dummy (echo [30aカーソル替え%batver%)
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
echo                                                さようなら
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




rem 設定メニューの描写
:setting
set wantload=
set settinghelptoggle=false
if not defined dummy (set clr=[7m&set clr2=[0m)
if "%wmodetoggle%"=="false" (set clr=[7m&set clr2=[0m)
if "%wmodetoggle%"=="true" (set clr=[100m[97m&set clr2=[0m[107m[30m)
rem 設定ファイルが存在するかを検知
cd /d %batchmainpath%
rem 場所 OSが入ったドライブ:\Users\ユーザー名
rem (例 ユーザーの名前がtestだった場合と、OSが入った場所がCドライブだった場合だと C:\Users\Test)
if not exist %Settingsfile% (goto :dogcheck)
title カーソル替え ^| 設定 
set selected=
if not defined "%clrgra%" (set clrgra=[90m)
Cls
echo.
Echo                                 設定メニュー
echo. 
echo O========================O                  O======O
echo I      カテゴリー        I                  I 設定 I
echo O========================O==================O======O======================O
echo I                        I                                                I
echo I  カーソル替え  機能系  I  カテゴリーが選択されていません。              I
echo I                        I                                                I
echo I========================I                                                I
echo I  カテゴリー  上か下か  I                                                I
echo I========================I                                                I
Echo I                        I  %clrgra%[W S] か [1 2] どちらかを押してカテゴリーを%clr2%   I
echo I カーソル替え  見た目系 I  %clrgra%選択してください。%clr2%                            I
echo I                        I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ヘルプモード      %clrhelp2%I  I 移動 : W A S D 数字 I 戻る : B I 決定 : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12wsdbye3 /n /m "変更するものを数字で指定又はwasdで移動して指定してください"
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
title カーソル替え ^| 設定 
set selected=
Cls
echo.
Echo                                 設定メニュー
echo. 
echo O========================O                  O======O
echo I      カテゴリー        I                  I 設定 I
echo O========================O==================O======O======================O
echo I%clr%                        %clr2%I                                                I
echo I%clr%  カーソル替え  機能系  %clr2%I  カーソル替えの機能に関する設定です。          I
echo I%clr%                        %clr2%I                                                I
echo I========================I                                                I
echo I  カテゴリー  上か下か  I                                                I
echo I========================I                                                I
Echo I                        I                                                I
echo I カーソル替え  見た目系 I                                                I
echo I                        I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ヘルプモード      %clrhelp2%I  I 移動 : W A S D 数字 I 戻る : B I 決定 : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12wsdbye3 /n /m "変更するものを数字で指定又はwasdで移動して指定してください"
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
rem 設定ファイルが存在するかを検知
cd /d %batchmainpath%
rem 場所 OSが入ったドライブ:\Users\ユーザー名
rem (例 ユーザーの名前がtestだった場合と、OSが入った場所がCドライブだった場合だと C:\Users\Test)
if not exist %Settingsfile% (goto :dogcheck)
title カーソル替え ^| 設定 
set selected=
if not defined "%clrgra%" (set clrgra=[90m)
Cls
echo.
Echo                                 設定メニュー
echo. 
echo O========================O                  O======O
echo I      カテゴリー        I                  I 設定 I
echo O========================O==================O======O======================O
echo I                        I                                                I
echo I  カーソル替え  機能系  I  カーソル替えの見た目に関する設定です。        I
echo I                        I %clrgra%（テーマなど）%clr2%                                 I
echo I========================I                                                I
echo I  カテゴリー  上か下か  I                                                I
echo I========================I                                                I
Echo I%clr%                        %clr2%I                                                I
echo I%clr% カーソル替え  見た目系 %clr2%I                                                I
echo I%clr%                        %clr2%I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ヘルプモード      %clrhelp2%I  I 移動 : W A S D 数字 I 戻る : B I 決定 : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12wsdbye3 /n /m "変更するものを数字で指定又はwasdで移動して指定してください"
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

rem カテゴリー内部

:settingcategory1int
title カーソル替え ^| 設定 
set selected=
Cls
echo.
Echo                                 設定メニュー
echo. 
echo O========================O                  O======O
echo I      カテゴリー        I                  I 設定 I
echo O========================O==================O======O===========O==========O
echo I%clr%                        %clr2%I 1 起動時にカーソル替えで起動        I   %setting1onoff%   I
echo I%clr%  カーソル替え  機能系  %clr2%I                                     O==========O
echo I%clr%                        %clr2%I 2 起動時のアドミン                  I   %setting2onoff%   I
echo I========================I                                     O==========O
echo I  カテゴリー  上か下か  I 3 起動時に更新確認                  I   %setting3onoff%   I
echo I========================I                                     O==========O
Echo I                        I 4 Enterの長押しを検知する機能       I   %setting4onoff%   I
echo I カーソル替え  見た目系 I                                     O==========O
echo I                        I 5 初期化またはアンインストール                 I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ヘルプモード      %clrhelp2%I  I 移動 : W A S D 数字 I 戻る : B I 決定 : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12wsdbye3 /n /m "変更するものを数字で指定又はwasdで移動して指定してください"
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
title カーソル替え ^| 設定 
set selected=
Cls
echo.
Echo                                 設定メニュー
echo. 
echo O========================O                  O======O
echo I      カテゴリー        I                  I 設定 I
echo O========================O==================O======O===========O==========O
echo I%clr%                        %clr2%I %clr%1 起動時にカーソル替えで起動%clr2%        I   %setting1onoff%   I
echo I%clr%  カーソル替え  機能系  %clr2%I                                     O==========O
echo I%clr%                        %clr2%I 2 起動時のアドミン                  I   %setting2onoff%   I
echo I========================I                                     O==========O
echo I  カテゴリー  上か下か  I 3 起動時に更新確認                  I   %setting3onoff%   I
echo I========================I                                     O==========O
Echo I                        I 4 Enterの長押しを検知する機能       I   %setting4onoff%   I
echo I カーソル替え  見た目系 I                                     O==========O
echo I                        I 5 初期化またはアンインストール                 I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ヘルプモード      %clrhelp2%I  I 移動 : W A S D 数字 I 戻る : B I 決定 : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12345wsabye /n /m "変更するものを数字で指定又はwasdで移動して指定してください"
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
title カーソル替え ^| 設定 
set selected=
Cls
echo.
Echo                                 設定メニュー
echo. 
echo O========================O                  O======O
echo I      カテゴリー        I                  I 設定 I
echo O========================O==================O======O===========O==========O
echo I%clr%                        %clr2%I 1 起動時にカーソル替えで起動        I   %setting1onoff%   I
echo I%clr%  カーソル替え  機能系  %clr2%I                                     O==========O
echo I%clr%                        %clr2%I %clr%2 起動時のアドミン%clr2%                  I   %setting2onoff%   I
echo I========================I                                     O==========O
echo I  カテゴリー  上か下か  I 3 起動時に更新確認                  I   %setting3onoff%   I
echo I========================I                                     O==========O
Echo I                        I 4 Enterの長押しを検知する機能       I   %setting4onoff%   I
echo I カーソル替え  見た目系 I                                     O==========O
echo I                        I 5 初期化またはアンインストール                 I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ヘルプモード      %clrhelp2%I  I 移動 : W A S D 数字 I 戻る : B I 決定 : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12345wsabye /n /m "変更するものを数字で指定又はwasdで移動して指定してください"
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
title カーソル替え ^| 設定 
set selected=
Cls
echo.
Echo                                 設定メニュー
echo. 
echo O========================O                  O======O
echo I      カテゴリー        I                  I 設定 I
echo O========================O==================O======O===========O==========O
echo I%clr%                        %clr2%I 1 起動時にカーソル替えで起動        I   %setting1onoff%   I
echo I%clr%  カーソル替え  機能系  %clr2%I                                     O==========O
echo I%clr%                        %clr2%I 2 起動時のアドミン                  I   %setting2onoff%   I
echo I========================I                                     O==========O
echo I  カテゴリー  上か下か  I %clr%3 起動時に更新確認%clr2%                  I   %setting3onoff%   I
echo I========================I                                     O==========O
Echo I                        I 4 Enterの長押しを検知する機能       I   %setting4onoff%   I
echo I カーソル替え  見た目系 I                                     O==========O
echo I                        I 5 初期化またはアンインストール                 I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ヘルプモード      %clrhelp2%I  I 移動 : W A S D 数字 I 戻る : B I 決定 : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12345wsabye /n /m "変更するものを数字で指定又はwasdで移動して指定してください"
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
title カーソル替え ^| 設定 
set selected=
Cls
echo.
Echo                                 設定メニュー
echo. 
echo O========================O                  O======O
echo I      カテゴリー        I                  I 設定 I
echo O========================O==================O======O===========O==========O
echo I%clr%                        %clr2%I 1 起動時にカーソル替えで起動        I   %setting1onoff%   I
echo I%clr%  カーソル替え  機能系  %clr2%I                                     O==========O
echo I%clr%                        %clr2%I 2 起動時のアドミン                  I   %setting2onoff%   I
echo I========================I                                     O==========O
echo I  カテゴリー  上か下か  I 3 起動時に更新確認                  I   %setting3onoff%   I
echo I========================I                                     O==========O
Echo I                        I %clr%4 Enterの長押しを検知する機能%clr2%       I   %setting4onoff%   I
echo I カーソル替え  見た目系 I                                     O==========O
echo I                        I 5 初期化またはアンインストール                 I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ヘルプモード      %clrhelp2%I  I 移動 : W A S D 数字 I 戻る : B I 決定 : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12345wsabye /n /m "変更するものを数字で指定又はwasdで移動して指定してください"
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
title カーソル替え ^| 設定 
set selected=
Cls
echo.
Echo                                 設定メニュー
echo. 
echo O========================O                  O======O
echo I      カテゴリー        I                  I 設定 I
echo O========================O==================O======O===========O==========O
echo I%clr%                        %clr2%I 1 起動時にカーソル替えで起動        I   %setting1onoff%   I
echo I%clr%  カーソル替え  機能系  %clr2%I                                     O==========O
echo I%clr%                        %clr2%I 2 起動時のアドミン                  I   %setting2onoff%   I
echo I========================I                                     O==========O
echo I  カテゴリー  上か下か  I 3 起動時に更新確認                  I   %setting3onoff%   I
echo I========================I                                     O==========O
Echo I                        I 4 Enterの長押しを検知する機能       I   %setting4onoff%   I
echo I カーソル替え  見た目系 I                                     O==========O
echo I                        I %clr%5 初期化またはアンインストール%clr2%                 I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ヘルプモード      %clrhelp2%I  I 移動 : W A S D 数字 I 戻る : B I 決定 : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12345wsabye /n /m "変更するものを数字で指定又はwasdで移動して指定してください"
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
title カーソル替え ^| 設定 
set selected=
Cls
echo.
Echo                                 設定メニュー
echo. 
echo O========================O                  O======O
echo I      カテゴリー        I                  I 設定 I
echo O========================O==================O======O======================O
echo I                        I 1 起動時のアニメーションの設定      I     ^>    I
echo I  カーソル替え  機能系  I                                     O==========O
echo I                        I 2 メインメニューに背景を表示        I   %setting6onoff%   I
echo I========================I                                     O==========O
echo I  カテゴリー  上か下か  I 3 %wmodeonoff%                         I
echo I========================I                                                I
Echo I%clr%                        %clr2%I                                                I
echo I%clr% カーソル替え  見た目系 %clr2%I                                                I
echo I%clr%                        %clr2%I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ヘルプモード      %clrhelp2%I  I 移動 : W A S D 数字 I 戻る : B I 決定 : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12wsdbye3 /n /m "変更するものを数字で指定又はwasdで移動して指定してください"
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
title カーソル替え ^| 設定 
set selected=
Cls
echo.
Echo                                 設定メニュー  
echo. 
echo O========================O                  O======O
echo I      カテゴリー        I                  I 設定 I
echo O========================O==================O======O======================O
echo I                        I %clr%1 起動時のアニメーションの設定%clr2%      I     ^>    I
echo I  カーソル替え  機能系  I                                     O==========O
echo I                        I 2 メインメニューに背景を表示        I   %setting6onoff%   I
echo I========================I                                     O==========O
echo I  カテゴリー  上か下か  I 3 %wmodeonoff%                         I
echo I========================I                                                I
Echo I%clr%                        %clr2%I                                                I
echo I%clr% カーソル替え  見た目系 %clr2%I                                                I
echo I%clr%                        %clr2%I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ヘルプモード      %clrhelp2%I  I 移動 : W A S D 数字 I 戻る : B I 決定 : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12wsabyed3 /n /m "変更するものを数字で指定又はwasdで移動して指定してください"
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
title カーソル替え ^| 設定 
set selected=
Cls
echo.
Echo                                 設定メニュー
echo. 
echo O========================O                  O======O
echo I      カテゴリー        I                  I 設定 I
echo O========================O==================O======O======================O
echo I                        I 1 起動時のアニメーションの設定      I     ^>    I
echo I  カーソル替え  機能系  I                                     O==========O
echo I                        I %clr%2 メインメニューに背景を表示%clr2%        I   %setting6onoff%   I
echo I========================I                                     O==========O
echo I  カテゴリー  上か下か  I 3 %wmodeonoff%                         I
echo I========================I                                                I
Echo I%clr%                        %clr2%I                                                I
echo I%clr% カーソル替え  見た目系 %clr2%I                                                I
echo I%clr%                        %clr2%I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ヘルプモード      %clrhelp2%I  I 移動 : W A S D 数字 I 戻る : B I 決定 : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12wsabye3 /n /m "変更するものを数字で指定又はwasdで移動して指定してください"
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
title カーソル替え ^| 設定 
set selected=
Cls
echo.
Echo                                 設定メニュー
echo. 
echo O========================O                  O======O
echo I      カテゴリー        I                  I 設定 I
echo O========================O==================O======O======================O
echo I                        I 1 起動時のアニメーションの設定      I     ^>    I
echo I  カーソル替え  機能系  I                                     O==========O
echo I                        I 2 メインメニューに背景を表示        I   %setting6onoff%   I
echo I========================I                                     O==========O
echo I  カテゴリー  上か下か  I %clr%3 %wmodeonoff%%clr2%                         I
echo I========================I                                                I
Echo I%clr%                        %clr2%I                                                I
echo I%clr% カーソル替え  見た目系 %clr2%I                                                I
echo I%clr%                        %clr2%I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ヘルプモード      %clrhelp2%I  I 移動 : W A S D 数字 I 戻る : B I 決定 : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12wsabye3 /n /m "変更するものを数字で指定又はwasdで移動して指定してください"
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
title カーソル替え ^| 設定 
call :settingcategory2intsetting5blockcheck
set selected=
Cls
echo.
Echo                                 設定メニュー
echo. 
echo O========================O                  O======O O====================O
echo I      カテゴリー        I                  I 設定 I I 設定5/...          I
echo O========================O==================O======O=O====================O
echo I                        I %clr%1 起動アニメーション%clr2%                I   %setting5onoff%   I
echo I  カーソル替え  機能系  I                                     O==========O
echo I                        I %sc2s5s1lock%2 リナックス風起動アニメーション%sc2s5s1lock2%    I   %setting5_s1onoff%   I
echo I========================I                                     O==========O
echo I  カテゴリー  上か下か  I %sc2s5s2lock%3 シンプルな起動アニメーション%sc2s5s2lock2%      I   %setting5_s2onoff%   I
echo I========================I                                     O==========O
Echo I%clr%                        %clr2%I %sc2s5s3lock%4 生の起動アニメーション%sc2s5s3lock2%            I   %setting5_s3onoff%   I
echo I%clr% カーソル替え  見た目系 %clr2%I                                     O==========O
echo I%clr%                        %clr2%I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ヘルプモード      %clrhelp2%I  I 移動 : W A S D 数字 I 戻る : B I 決定 : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 123wsabye4 /n /m "変更するものを数字で指定又はwasdで移動して指定してください"
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
if "%setting5onoff%"=="無効" if "%linuxboot%"=="false" if "%setting5_stg_whereyou%"=="stg1" (goto :settingcategory2intsetting5_stg0)
if "%setting5onoff%"=="無効" if "%setting5_stg_whereyou%"=="stg2" (goto :settingcategory2intsetting5_stg0) else if "%linuxboot%"=="false" if "%setting5onoff%"=="無効" if "%setting5_stg_whereyou%"=="stg0" (goto :settingcategory2intsetting5_stg2)
if "%simpleboot%"=="true" if "%setting5_stg_whereyou%"=="stg0" (goto :settingcategory2intsetting5_stg2) else if "%setting5_stg_whereyou%"=="stg2" (goto :settingcategory2intsetting5_stg0)
if "%rawboot%"=="true" if "%setting5_stg_whereyou%"=="stg3" (goto :settingcategory2intsetting5_stg3) else if "%setting5_stg_whereyou%"=="stg0" (goto :settingcategory2intsetting5_stg3)
set setting5_stg_whereyou=stg1
title カーソル替え ^| 設定  
call :settingcategory2intsetting5blockcheck
set selected=
Cls
echo.
Echo                                 設定メニュー
echo. 
echo O========================O                  O======O O====================O
echo I      カテゴリー        I                  I 設定 I I 設定5/...          I
echo O========================O==================O======O=O====================O
echo I                        I 1 起動アニメーション                I   %setting5onoff%   I
echo I  カーソル替え  機能系  I                                     O==========O
echo I                        I %clr%2 リナックス風起動アニメーション%clr2%    I   %setting5_s1onoff%   I
echo I========================I                                     O==========O
echo I  カテゴリー  上か下か  I %sc2s5s2lock%3 シンプルな起動アニメーション%sc2s5s2lock2%      I   %setting5_s2onoff%   I
echo I========================I                                     O==========O
Echo I%clr%                        %clr2%I %sc2s5s3lock%4 生の起動アニメーション%sc2s5s3lock2%            I   %setting5_s3onoff%   I
echo I%clr% カーソル替え  見た目系 %clr2%I                                     O==========O
echo I%clr%                        %clr2%I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ヘルプモード      %clrhelp2%I  I 移動 : W A S D 数字 I 戻る : B I 決定 : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 123wsabye4 /n /m "変更するものを数字で指定又はwasdで移動して指定してください"
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
title カーソル替え ^| 設定 
call :settingcategory2intsetting5blockcheck
set selected=
Cls
echo.
Echo                                 設定メニュー
echo. 
echo O========================O                  O======O O====================O
echo I      カテゴリー        I                  I 設定 I I 設定5/...          I
echo O========================O==================O======O=O====================O
echo I                        I 1 起動アニメーション                I   %setting5onoff%   I
echo I  カーソル替え  機能系  I                                     O==========O
echo I                        I %sc2s5s1lock%2 リナックス風起動アニメーション%sc2s5s1lock2%    I   %setting5_s1onoff%   I
echo I========================I                                     O==========O
echo I  カテゴリー  上か下か  I %clr%3 シンプルな起動アニメーション%clr2%      I   %setting5_s2onoff%   I
echo I========================I                                     O==========O
Echo I%clr%                        %clr2%I %sc2s5s3lock%4 生の起動アニメーション%sc2s5s3lock2%            I   %setting5_s3onoff%   I
echo I%clr% カーソル替え  見た目系 %clr2%I                                     O==========O
echo I%clr%                        %clr2%I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ヘルプモード      %clrhelp2%I  I 移動 : W A S D 数字 I 戻る : B I 決定 : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 123wsabye4 /n /m "変更するものを数字で指定又はwasdで移動して指定してください"
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
if "%setting5onoff%"=="無効" if "%setting5_stg_whereyou%"=="stg0" (goto :settingcategory2intsetting5_stg0) else if "%setting5_stg_whereyou%"=="stg2" (goto :settingcategory2intsetting5_stg2)
if "%linuxboot%"=="true" if "%setting5_stg_whereyou%"=="stg1" (goto :settingcategory2intsetting5_stg1)  else if "%setting5_stg_whereyou%"=="stg0" (goto :settingcategory2intsetting5_stg0)
if "%simpleboot%"=="true" if "%setting5_stg_whereyou%"=="stg2" (goto :settingcategory2intsetting5_stg2) else if "%setting5_stg_whereyou%"=="stg0" (goto :settingcategory2intsetting5_stg0)
set setting5_stg_whereyou=stg3
title カーソル替え ^| 設定 
call :settingcategory2intsetting5blockcheck
set selected=
Cls
echo.
Echo                                 設定メニュー
echo. 
echo O========================O                  O======O O====================O
echo I      カテゴリー        I                  I 設定 I I 設定5/...          I
echo O========================O==================O======O=O====================O
echo I                        I 1 起動アニメーション                I   %setting5onoff%   I
echo I  カーソル替え  機能系  I                                     O==========O
echo I                        I %sc2s5s1lock%2 リナックス風起動アニメーション%sc2s5s1lock2%    I   %setting5_s1onoff%   I
echo I========================I                                     O==========O
echo I  カテゴリー  上か下か  I %sc2s5s2lock%3 シンプルな起動アニメーション%sc2s5s2lock2%      I   %setting5_s2onoff%   I
echo I========================I                                     O==========O
Echo I%clr%                        %clr2%I %clr%4 生の起動アニメーション%clr2%            I   %setting5_s3onoff%   I
echo I%clr% カーソル替え  見た目系 %clr2%I                                     O==========O
echo I%clr%                        %clr2%I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ヘルプモード      %clrhelp2%I  I 移動 : W A S D 数字 I 戻る : B I 決定 : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 123wsabye4 /n /m "変更するものを数字で指定又はwasdで移動して指定してください"
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
    if "%setting5onoff%"=="無効" (
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
if "%setting5onoff%"=="無効" (
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
rem メモ ここの分岐のtrueのところに、clrの色を変える処理を追加したい。choiceの直後に分岐でもとに戻す処理も追加して
if "%settinghelptoggle%"=="true" (set settinghelp=有効)
if "%settinghelptoggle%"=="false" (set settinghelp=無効)
title カーソル替え ^| 設定 
set selected=
if not defined "%clrgra%" (set clrgra=[90m)
if "%settinghelptoggle%"=="true" (set clr=[46m)
Cls
echo.
Echo                                 設定メニュー
echo. 
echo O========================O                  O======O
echo I      カテゴリー        I                  I 設定 I
echo O========================O==================O======O======================O
echo I                        I                                                I
echo I  カーソル替え  機能系  I  ヘルプモードです。この機能を選択した後、      I
echo I                        I  概要を見たい設定を選択すると、                I
echo I========================I  その設定の概要を見ることができます。          I
echo I  カテゴリー  上か下か  I                                                I
echo I========================I  ヘルプモードを無効にしたい場合は、            I
Echo I                        I  再度この機能を選択してください。              I
echo I カーソル替え  見た目系 I                                                I
echo I                        I  %clrgra%ヘルプモードは%settinghelp%です%clr2%                        I
echo O========================O==O=====================O==========O============O
echo I%clr%      ヘルプモード      %clr2%I  I 移動 : W A S D 数字 I 戻る : B I 決定 : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12wsbye3 /n /m "変更するものを数字で指定又はwasdで移動して指定してください"
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





rem 設定の適用と確認
rem 設定が存在するかの検証
:setting1
if "%settinghelptoggle%"=="true" (goto :setting1help)
find "BootAsCC=false" %Settingsfile% > nul
if %ErrorLevel%==0 set setting1setonoff=有効&goto :setting1okey
if %ErrorLevel%==1 set setting1setonoff=修復し、正常な状態& goto :setting1onoff

:setting1onoff
find "BootAsCC=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting1setonoff=無効

:setting1okey
cls
set selected=
echo 起動時にカーソル替えで起動するのを%setting1setonoff%にしますか？(Y=はい N=いいえ B=戻る)
SET /P selected= :
echo %selected% が選択されました。
if "%selected%"=="y" (goto :setting1y)
if "%selected%"=="n" (goto :setting1n)
if "%selected%"=="back" (goto :settingcategory1intsetting1)
if "%selected%"=="b" (goto :settingcategory1intsetting1)
goto :setting1okey

:setting1y
find "BootAsCC=false" %Settingsfile% > nul
echo 設定を適用中...
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
Echo 正常に変更されました。
Pause
set wantload=setting1
call :SAB_Manager
goto :settingcategory1intsetting1

:setting1n
cls
Echo 設定を変更しませんでした
Pause
goto :settingcategory1intsetting1

:setting2
if "%settinghelptoggle%"=="true" (goto :setting2help)
find "admin=false" %Settingsfile% > nul
if %ErrorLevel%==0 set setting2setonoff=有効&goto :setting2okey
if %ErrorLevel%==1 set setting2setonoff=修復し、正常な状態&goto :setting2onoff

:setting2onoff
find "admin=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting2setonoff=無効

:setting2okey
cls
echo 起動時の管理者権限の要求を%setting2setonoff%にしますか？(Y=はい N=いいえ B=戻る)
SET /P selected= :
echo %selected% が選択されました。
if "%selected%"=="y" (goto :setting2y)
if "%selected%"=="n" (goto :setting2n)
if "%selected%"=="back" (goto :settingcategory1intsetting2)
if "%selected%"=="b" (goto :settingcategory1intsetting2)
goto :setting2okey

:setting2y
find "admin=false" %Settingsfile% > nul
echo 設定を適用中...
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
Echo 正常に変更されました。
Pause
set wantload=setting2
call :SAB_Manager
goto :settingcategory1intsetting2

:setting2n
cls
Echo 起動時の管理者権限の要求は%setting2onoff%になりませんでした
Pause
goto :settingcategory1intsetting2

:setting3
if "%settinghelptoggle%"=="true" (goto :setting3help)
find "CheckUpdate=false" %Settingsfile% > nul
if %ErrorLevel%==0 set setting3setonoff=有効&goto :setting3onoff
if %ErrorLevel%==1 set setting3setonoff=修復し、正常な状態&goto :setting3onoff

:setting3onoff
find "CheckUpdate=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting3setonoff=無効&set setting3warning=
:setting3okey
cls
echo 起動時に更新を確認する機能を%setting3setonoff%にしますか？(Y=はい N=いいえ B=戻る)
SET /P selected= :
echo %selected% が選択されました。
if "%selected%"=="y" (goto :setting3y)
if "%selected%"=="n" (goto :setting3n)
if "%selected%"=="back" (goto :settingcategory1intsetting3)
if "%selected%"=="b" (goto :settingcategory1intsetting3)
goto :setting3okey

:setting3y
find "CheckUpdate=false" %Settingsfile% > nul
echo 設定を適用中...
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
Echo 高速起動は有効になりませんでした
Pause
goto :settingcategory1intsetting3

:setting3yokey
cls
Echo 高速起動を%setting3setonoff%にしました。
Pause
set wantload=setting3
call :SAB_Manager
goto :settingcategory1intsetting3

:setting4
if "%settinghelptoggle%"=="true" (goto :setting4help)
find "hatenakeikoku=false" %Settingsfile% > nul
if %ErrorLevel%==0 set setting4setonoff=有効&goto :setting4okey
if %ErrorLevel%==1 set setting4setonoff=修復し、正常な状態&goto :setting4onoff

:setting4onoff
find "hatenakeikoku=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting4setonoff=無効

:setting4okey
cls
echo エンターキーの長押し検知機能を%setting4setonoff%にしますか？(Y=はい N=いいえ B=戻る)
SET /P selected= :
echo %selected% が選択されました。
if "%selected%"=="y" (goto :setting4y)
if "%selected%"=="n" (goto :setting4n)
if "%selected%"=="back" (goto :settingcategory1intsetting4)
if "%selected%"=="b" (goto :settingcategory1intsetting4)
goto :setting4okey

:setting4y
find "hatenakeikoku=false" %Settingsfile% > nul
echo 設定を適用中...
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
Echo 正常に適用されました。
Pause
set wantload=setting4
call :SAB_Manager
goto :settingcategory1intsetting4

:setting4n
cls
Echo 設定を変更しませんでした
Pause
goto :settingcategory1intsetting4

:setting5
if "%settinghelptoggle%"=="true" (goto :setting5help)
find "bootanimation=false" %Settingsfile% > nul
if %ErrorLevel%==0 set setting5setonoff=有効&goto :setting5okey
if %ErrorLevel%==1 set setting5setonoff=修復し、正常な状態&goto :setting5onoff

:setting5onoff
find "bootanimation=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting5setonoff=無効

:setting5okey
cls
echo 起動時のブートアニメーションを%setting5setonoff%にしますか？(Y=はい N=いいえ B=戻る)
SET /P selected= :
echo %selected% が選択されました。
if "%selected%"=="y" (goto :setting5y)
if "%selected%"=="n" (goto :setting5n)
if "%selected%"=="back" (goto :settingcategory2intsetting5_stg0)
if "%selected%"=="b" (goto :settingcategory2intsetting5_stg0)
goto :setting5okey

:setting5y
find "bootanimation=false" %Settingsfile% > nul
echo 設定を適用中...
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
Echo 設定を変更しました。
Pause
set wantload=setting5
call :SAB_Manager
goto :settingcategory2intsetting5_stg0


:setting5n
cls
Echo 設定を変更しませんでした
Pause
goto :settingcategory2intsetting5_stg0


:setting5_1
if "%settinghelptoggle%"=="true" (goto :setting5_1help)
find "s5_linuxboot=false" %Settingsfile% > nul
if %ErrorLevel%==0 set setting5_1setonoff=有効&goto :setting5_1okey
if %ErrorLevel%==1 set setting5_1setonoff=修復し、正常な状態&goto :setting5_1onoff

:setting5_1onoff
find "s5_linuxboot=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting5_1setonoff=無効

:setting5_1okey
cls
echo 起動時のlinux風の起動アニメーションを%setting5_1setonoff%にしますか？(Y=はい N=いいえ B=戻る)
SET /P selected= :
echo %selected% が選択されました。
if "%selected%"=="y" (goto :setting5_1y)
if "%selected%"=="n" (goto :setting5_1n)
if "%selected%"=="back" (goto :settingcategory2intsetting5_stg0)
if "%selected%"=="b" (goto :settingcategory2intsetting5_stg0)
goto :setting5_1okey

:setting5_1y
find "s5_linuxboot=false" %Settingsfile% > nul
echo 設定を適用中...

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
Echo 設定を変更しました。
Pause
set wantload=setting5_1
call :SAB_Manager
goto :settingcategory2intsetting5_stg1

:setting5_1n
cls
Echo 設定を変更しませんでした
Pause
goto :settingcategory2intsetting5_stg1


:setting5_2
if "%settinghelptoggle%"=="true" (goto :setting5_2help)
find "s5_simpleboot=false" %Settingsfile% > nul
if %ErrorLevel%==0 set setting5_2setonoff=有効&goto :setting5_2okey
if %ErrorLevel%==1 set setting5_2setonoff=修復し、正常な状態&goto :setting5_2onoff

:setting5_2onoff
find "s5_simpleboot=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting5_2setonoff=無効

:setting5_2okey
cls
echo 起動時のシンプルなブートアニメーションを%setting5_2setonoff%にしますか？(Y=はい N=いいえ B=戻る)
SET /P selected= :
echo %selected% が選択されました。
if "%selected%"=="y" (goto :setting5_2y)
if "%selected%"=="n" (goto :setting5_2n)
if "%selected%"=="back" (goto :settingcategory2intsetting5_stg1)
if "%selected%"=="b" (goto :settingcategory2intsetting5_stg1)
goto :setting5_2okey

:setting5_2y
find "s5_simpleboot=false" %Settingsfile% > nul
echo 設定を適用中...
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
Echo 設定を変更しました。
Pause
set wantload=setting5_2
call :SAB_Manager
goto :settingcategory2intsetting5_stg2

:setting5_2n
cls
Echo 設定を変更しませんでした
Pause
goto :settingcategory2intsetting5_stg2



:setting5_3
if "%settinghelptoggle%"=="true" (goto :setting5_3help)
find "s5_rawboot=false" %Settingsfile% > nul
if %ErrorLevel%==0 set setting5_3setonoff=有効&goto :setting5_3okey
if %ErrorLevel%==1 set setting5_3setonoff=修復し、正常な状態&goto :setting5_3onoff

:setting5_3onoff
find "s5_rawboot=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting5_3setonoff=無効

:setting5_3okey
cls
echo 起動時の生アニメーションを%setting5_3setonoff%にしますか？(Y=はい N=いいえ B=戻る)
SET /P selected= :
echo %selected% が選択されました。
if "%selected%"=="y" (goto :setting5_3y)
if "%selected%"=="n" (goto :setting5_3n)
if "%selected%"=="back" (goto :settingcategory2intsetting5_stg3)
if "%selected%"=="b" (goto :settingcategory2intsetting5_stg3)
goto :setting5_3okey

:setting5_3y
find "s5_rawboot=false" %Settingsfile% > nul
echo 設定を適用中...

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
Echo 設定を変更しました。
Pause
set wantload=setting5_3
call :SAB_Manager
goto :settingcategory2intsetting5_stg3

:setting5_3n
cls
Echo 設定を変更しませんでした
Pause
goto :settingcategory2intsetting5_stg3


:setting6
if "%settinghelptoggle%"=="true" (goto :setting6help)
find "HazimeBg=false" %Settingsfile% > nul
if %ErrorLevel%==0 set setting6setonoff=有効&goto :setting6okey
if %ErrorLevel%==1 set setting6setonoff=修復し、正常な状態&goto :setting6onoff

:setting6onoff
find "HazimeBg=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting6setonoff=無効

:setting6okey
cls
echo メインメニューの背景を%setting6setonoff%にしますか？(Y=はい N=いいえ B=戻る)
SET /P selected= :
echo %selected% が選択されました。
if "%selected%"=="y" (goto :setting6y)
if "%selected%"=="n" (goto :setting6n)
if "%selected%"=="back" (goto :settingcategory2intsetting2)
if "%selected%"=="b" (goto :settingcategory2intsetting2)
goto :setting6okey

:setting6y
find "HazimeBg=false" %Settingsfile% > nul
echo 設定を適用中...

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
Echo 設定を変更しました。
Pause
set wantload=setting6
call :SAB_Manager
goto :settingcategory2intsetting2

:setting6n
cls
Echo 設定を変更しませんでした
Pause
goto :settingcategory2intsetting2



:wmode
if "%settinghelptoggle%"=="true" (goto :wmodehelp)
cd /d %batchmainpath%
:wmodetest
find "wmode=false" %Settingsfile% > nul
if %ErrorLevel%==0 set wmodesetonoff=ホワイト
if %ErrorLevel%==1 set wmodesetonoff=テーマの設定を修復し、正常な& goto :wmodeonoff

:wmodeonoff
find "wmode=true" %Settingsfile% > nul
if %ErrorLevel%==0 set wmodesetonoff=ダーク

cls
echo カーソル替えのテーマを%wmodesetonoff%テーマにしますか？(Y=はい N=いいえ B=戻る)
SET /P selected= :
rem テーマの分岐
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
echo テーマを適用中...
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
echo %wmodesetonoff%テーマに変更しました。
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
echo %wmodesetonoff%テーマには変更しませんでした。
pause
goto :settingcategory2intsetting3

rem 設定のヘルプ
:setting1help
cls
echo この設定は、起動後にカーソル替え (メインメニューで1の項目にある機能) に遷移するかを切り替えます。
echo これを有効にすると、起動直後にメインメニューに遷移する代わりにカーソル替えに遷移するので、素早くカーソルを変更できます。
echo この設定はデフォルトでは無効です。
pause
goto :settingcategory1intsetting1

:setting2help
cls
echo この設定は、管理者権限でカーソル替えを実行することによって、カーソルを変更する際にエラーが起きないようにするためにあります。
echo もし仮に、カーソルを変更する際にエラーもしくは変更できなかった場合のみにこの設定を有効にすることを推奨します。
echo この設定を有効にすることによって起動時間が短縮される場合があります。
echo この設定はデフォルトでは無効です。
pause
goto :settingcategory1intsetting2

:setting3help
cls
echo この機能はカーソル替えの起動時に更新を確認するか否かの設定です。
echo この機能を有効にすると、毎起動時にアップデートの確認が行われます。
echo アップデートが利用可能なら適用することができます。
echo お使いのインターネットや環境の速度によっては起動時間が遅くなる可能性があります。
echo 一時間にだいたい50回以上連続して起動すると、githubのAPIレート制限に到達する可能性があります。(総合的に3~4回ほどAPIを利用するため、高負荷)
echo この設定はデフォルトでは無効です。
pause
goto :settingcategory1intsetting3

:setting4help
cls
echo この設定は少々わかりにくいですが、簡単に言うとバッチを起動したときに表示される画面のままで何も入力せずにエンターを長押ししたときに出てくる
echo 警告メッセージをoff/onにできる機能です。
echo これは実際に体験してもらったほうがわかりやすいのですが、まぁ大体50回~250回くらいの間エンターを長押しか押していると、
echo 警告文が表示される感じになりますね。しかし時にはこれがうっとおしいと思う人もいるかと思いますので、この機能をオフにできる設定を追加しました。
echo この設定はデフォルトでは有効です。
pause
goto :settingcategory1intsetting4

:setting5help
cls
echo この設定は、起動時に必ず毎回流れるブートアニメーション、いわば起動画面を無効にし非表示にする設定です。
echo この設定を無効にすることによって、起動時間の短縮やうっとうしさの軽減につながります。
echo この設定はデフォルトでは有効です。
pause
goto :settingcategory2intsetting5_stg0

:setting5_1help
cls
echo この設定はリナックス風の起動アニメーションを再生するようにする設定です。
echo 起動中なのがわかりやすく、見た目が良いです。また、起動中にエラーが発生した際に、エラーが発生した個所がわかりやすくなることがあります。
echo この設定はsimplebootおよびrawbootと併用できません。
echo この設定は標準ではfalseです。
pause
goto :settingcategory2intsetting5_stg1

:setting5_2help
cls
echo この設定は起動時に"起動中..."というテキストのみで起動させるようにする設定です。
echo 高速かつ分かりやすく、シンプルです。ただしつまらなく見える可能性がありマス。
echo この設定はlinuxbootおよびrawbootと併用できません。
echo この設定は標準ではfalseです。
pause
goto :settingcategory2intsetting5_stg2

:setting5_3help
cls
echo この設定は起動時にecho onの状態で起動するようにする設定です。
echo シンプルでわかりやすく、現在何が実行されているかが一目でわかります。また、ハッカー気分にもなれます。
echo この設定はlinuxbootおよびsimplebootと併用できません。
echo この設定は標準ではfalseです。
pause
goto :settingcategory2intsetting5_stg3

:setting6help
cls
echo この設定はメインメニューで背景を有効にするかどうかを
echo 設定できます。これを有効にすると、より良い見た目になります。
echo ただし、コンピューターの性能によってはメインメニューのレスポンスが悪くなる可能性があります。
echo この設定はデフォルトでtrueです。
pause
goto :settingcategory2intsetting2

:wmodehelp
cls
echo これはCMDの画面を白色または黒色に変える物です。
echo これを使用すると、例えば画面はホワイトテーマで統一させたり、またそのほうが好きという人にも対応できるようになります。
echo 標準では黒色ですが、白色にした後、今後起動したときに自動的に画面が白色になるようになります。
echo また、ちょっとした裏話ですがこの設定は、1.10以前まではホーム側に設置されていました。また、この機能は設定の内部構造のもとになっています。
echo 標準ではダークテーマです。
pause
goto :settingcategory2intsetting3
 
:alldefhelp
cls
echo これはアンインストールメニューです。このメニューはカーソル替えのアンインストールを行います。
echo このメニューには設定ファイル（設定が記録されているテキストファイル）のパスを表示する機能、設定を初期化(デフォルトに)する機能が含まれています。
echo アンインストールを実行する場合、カーソル替え本体が削除され、（任意）カーソルもデフォルトに削除されます。（任意）設定、初回起動を検知するためのファイルも完全に削除されます。
echo 実行する際はくれぐれも自己責任で実行してください。
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
title カーソル替え ^| バージョン情報
if "%batverexit%"=="true" (set batvercurrent=& call :batver_exit & goto :hazimemenu)
if not defined batverboot (set MenuRedrew=true& set /p nothing=%clrgra%<nul& call :hazimemenudrew & echo %clr2% & set batverboot=true)
rem I'm doing this because when I use ANSI ESC sequences in Virtual Studio Code, the parentheses are colored incorrectly and I don't like that
call :batver_Core_Drew
if not defined dummuy (set ccmmul=[4m)
if not defined dummy (
echo [6;12H O=================================================O 
echo [7;12H I             カーソル替え  バージョン            I 
echo [8;12H I                                                 I 
echo [9;12H I          現在のバージョン :[9;63HI 
echo [10;12H I          現在のビルド     :[10;63HI 
echo [11;12H I                                                 I 
echo [12;12H I    O====================O         O========O    I 
echo [13;12H I    I%bvb% アップデートの確認 %clr2%I         I%bvb2% 閉じる %clr2%I    I 
echo [14;12H I    O====================O         O========O    I 
echo [15;12H I                                                 I 
echo [16;12H O=================================================O 
echo [17;20H %clrgra%1~2かA,Dで動かし、Y,Eで決定、Bで終了%clr2%
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
if not defined dummy (set /p nothing=[25;0H%clrgra%開発者 : tamago_1908%clr2%<nul)
if "%batvercurrent%"=="0" (echo [18;27H %clrgra%何も選択されていません...%clr2%) else (echo [18;29H                                 )
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
title カーソル替え ^| アップデーター
echo アップデート プロセスを開始しています...
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
title カーソル替え ^| アプリケーションメニュー (試験的)
if "%Appmenuexit%"=="true" (call :Appmenu_exit& goto :hazimemenu)
call :Appmenu_Core_Drew
if not defined dummy (set /p nothing=[0;0H<nul)
if not defined dummmy (
echo.
echo                        アプリケーションメニュー                
echo.
echo      O==============================O========================O     
echo      I                              I          情報          I
echo      I   1 : %amb1%シンプル電卓%clr2%           I[6;62HI
echo      I                              I[7;62HI
echo      I   2 : %amb2%2048 ゲーム%clr2%            I[8;62HI
echo      I                              I[9;62HI
echo      I   3 : %amb3%Internet Explorer 11%clr2%   I[10;62HI
echo      I                              I[11;62HI
echo      O==============================O========================O
echo      I   操作方法 :                                          I
echo      I   W,S か 1~3 で移動、Y か E で起動します              I
echo      I   N か B で終了                                       I
echo      O=======================================================O
echo.
echo             %clrgra%実行したいアプリケーションを選択してください。%clr2%
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
if "%Appmenucurrent%"=="0" (echo [7;38H 何も選択されていません) else (for /l %%i in (6,1,10) do (echo [%%i;38H                        ))
if "%Appmenucurrent%"=="1" (echo [7;42H シンプルな電卓& echo [8;41H バカでも使えます。)
if "%Appmenucurrent%"=="2" (echo [7;44H 2048 ゲーム。& echo [8;44H 無限に楽しい& echo [9;44H 最強のゲーム。& echo [10;42H %clrgra%ちょっと遅いかも%clr2%)
if "%Appmenucurrent%"=="3" (echo [7;41H Internet Explorer& echo [8;43H IEを開きます。)
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
rem 電卓
set q=0
set number1=0
set number2=0
set number3=0
cls
echo 2147483647の計算まで(int型の上限 仕様上これより上の計算は不可)
echo.
title カーソル替え ^| カーソル電卓

rem シンプルモード
:simplemodecal
set q=0
set number1=0
set number2=0
set number3=0

echo 式を入力して計算する場合は3と入力してください。
echo.
echo 戻る場合はbackと入力してください。
echo.
echo + or -
echo 足し算なら1、引き算なら2を選択してください。
set /p q=
rem 電卓の分岐
if "%q%"=="back" (exit /b)
if "%q%"=="b" (exit /b)
if "%q%"=="1" (set whatnumber=足される側&goto :startcal2)
if "%q%"=="2" (set whatnumber=引かれる側&goto :startcal2) 
if "%q%"=="3" (goto :advancemodecal) else (
echo 無効な選択です&pause&goto :startcal)

:startcal2
echo.
set /p number1=%whatnumber%を入力 :
if "%q%"=="1" (goto :pcal)
if "%q%"=="2" (goto :mcal)

:pcal
set /p number3=足す側を入力 :
set /a number1=number1+number3
echo 結果 : %number1%
pause
cls
goto :simplemodecal

:mcal
set /p number3=引く側を入力 :
set /a number1=number1-number3
echo 結果 : %number1%
pause
cls
goto :simplemodecal

rem アドバンスモード
:advancemodecal

:loopcal
cls
echo 終わる場合はbackと入力してください。
SET /P formula="計算する式を入力してください."
SET /A result=%formula%
if "%formula%"=="back" goto :startcal
echo 結果：%Result%
pause
goto :loopcal


:openie
title カーソル替え ^| インターネットエクスプローラーを開く
cls
echo インターネットエクスプローラーを開いています...
powershell -command "$ie = New-Object -ComObject InternetExplorer.Application; $ie.Visible = $true"
ping -n 2 127.0.0.1 > nul 2>&1
exit /b


:2048_game
setlocal enabledelayedexpansion
title カーソル替え ^| 2048 ゲーム
mode con: cols=33 lines=31
set bestscore=0
:2048_startgame
set /a score=0,winstate=0&for /l %%g in (0,1,15)do set board[%%g]=0
set /a moves=0,h=0&for /l %%g in (0,1,15)do if !board[%%g]!==0 set /a h+=1
if %h%==16 call :2048_tilespawn&call :2048_tilespawn
:2048_startloop
if %score% gtr %bestscore% set bestscore=%score%
call :2048_drawboard 0&choice /c wasdbn /n /m ""
echo 処理中...
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
cls&echo   ___     ___    _  _      ___&echo  ^|__ ?   / _ ?  ^| ^|^| ^|    / _ ?&echo     ) ^| ^| ^| ^| ^| ^| ^|^| ^|_  ^| (_) ^|&echo    / /  ^| ^| ^| ^| ^|__   _^|  ^> _ ^<&echo   / /_  ^| ^|_^| ^|    ^| ^|   ^| (_) ^|&echo  ^|____^|  ?___/     ^|_^|    ?___/&echo(&echo        タイルを足し合わせて、  &echo   　2048のタイルを作りましょう^^!&echo(&if %1==0 echo     (Nで新しいゲームを開始)&echo            (Bで終了)&&echo(
if %1==1 echo             あなたの勝ち！&echo Cを押して続行するか、 Nでリセットしましょう。
if %1==2 echo            Game Over!&echo        Nを押してリセット...
echo   スコア: %score%&echo   最高記録: %bestscore%&echo   O======O======O======O======O&echo   I%board2[0]%I%board2[1]%I%board2[2]%I%board2[3]%I&echo   O======O======O======O======O&echo   I%board2[4]%I%board2[5]%I%board2[6]%I%board2[7]%I&echo   O======O======O======O======O&echo   I%board2[8]%I%board2[9]%I%board2[10]%I%board2[11]%I&echo   O======O======O======O======O&echo   I%board2[12]%I%board2[13]%I%board2[14]%I%board2[15]%I&echo   O======O======O======O======O&echo プレイ方法: WASDキーを使ってタイルを動かします。同じ数字の2つのタイルがタッチすると、1つに統合されます&exit /b
exit /b
:2048_end
cls
echo 2048を終了しています...
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
title カーソル替え
if "%cursorchangeexit%"=="true" (set cursorchangecurrent=& call :cursorchange_exit& goto :hazimemenu)
if "%cursorchangeexit%"=="true1y" (call :cursorchange_main_cfm)
if "%cursorchangeexit%"=="true2" (call :cursorchange_Drew& goto :cursorchange_loop)
call :cursorchange_Drew
if not defined dummy (set /p nothing=[0;0H<nul)
if "%cursorchangecurrent%"=="0" (call :cursorchange_Drew boot)
if not "%cursorchangeexit%"=="true1" (
echo                               カーソル替え%batver%
echo.
echo           O================================O=====================O
echo           I            メニュー            I         情報        I
echo           I                                I[5;66HI
echo           I   %ccm1%1 カーソルを%cursorcolor%色に変える %ccm1e%    I[6;66HI
echo           I                                I[7;66HI
echo           I   %ccm2%2 カスタムカーソルに変更する%ccm2e% I[8;66HI
echo           I                                I[9;66HI
echo           O================================O=====================O
echo.
echo.
echo               1~2 か W,D で選択し、Y,Eで決定、 B,Nで終了します。
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
    set /p nothing=[6;46H 選択してください。[0;0H<nul
    exit /b
)
if "%cursorchangecurrent%"=="0" (
    echo [6;46H 選択してください。
    exit /b
)

if "%cursorchangecurrent%"=="1" (
    if "%cursorchangeexit%"=="true1" (
        rem confirm messages
        call :cursorchange_clear
        set /p nothing=[5;13H 本当にカーソルを%cursorcolor%色に変更しますか？<nul& set /p nothing=[8;13H %clrgra%^(Y,E または B,N^)%clr2%<nul
        exit /b
    )
    if not "%cursorchangeexit%"=="true1y" (
    echo [6;48H %cursorcolor%色のカーソル
    echo [7;49H に変更します。
    set ccm2=& set ccm2e=& set ccm1=%clr%& set ccm1e=%clr2%
    exit /b
    )
)
if "%cursorchangecurrent%"=="2" (
    if "%cursorchangeexit%"=="true2" (
        rem confirm messages (Ughhhhh)
        set cursorchangeexit=
        call :cursorchange_clear
        set /p nothing=[5;13H この機能は現在は実装されていません。<nul& set /p nothing=[7;13H %clrgra%何かキーを押して戻る...%clr2%<nul
        pause >nul
        call :cursorchange_clear
        exit /b
    )
    echo [6;47H カスタムカーソル
    echo [7;49H に変更します。
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
    set /p nothing=[5;13H %clrgra%^(最初の変更時のみ^)%clr2%<nul
)
timeout /t 2 /nobreak >nul
call :cursorchange_clear
if not defined dummy (
    set /p nothing=[5;13H この機能はお使いのWindowsのカーソルを変更します。 <nul
    set /p nothing=[6;13H 変更したくない場合は、この時点で戻ってください。 <nul
    set /p nothing=[8;13H %clrgra%何かキーを押して続行...%clr2%<nul
    pause >nul
)
call :cursorchange_clear
if not defined dummy (
    set /p nothing=[5;13H 開発者であるtamago_1908は、カーソルを変更した<nul
    set /p nothing=[6;13H 事に起因する全ての問題に対して責任を負いません。 <nul
    set /p nothing=[8;13H %clrgra%何かキーを押して続行...%clr2%<nul
    pause >nul
)
call :cursorchange_clear
if not defined dummy (
    set /p nothing=[5;13H 本当に続行しますか？<nul
    set /p nothing=[8;13H %clrgra%^(Y または N^)%clr2%<nul
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
reg query "HKEY_CURRENT_USER\Control Panel\Cursors" /v "" | find "Windows 標準" >nul
if "%ErrorLevel%"=="0" (goto :darkgo)
if "%ErrorLevel%"=="1" (goto :darkgotest)

:darkgotest
reg query "HKEY_CURRENT_USER\Control Panel\Cursors" /v "" | find "Windows 黒" >nul
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
if not defined dummy (set /p nothing=[5;13H %clrgra%何かキーを押して適用...%clr2%<nul& pause >nul)
if not defined dummy (call :cursorchange_clear& set /p nothing=[5;13H 適用中... %clrgra%^(カーソル替えを閉じないでください！^)%clr2%<nul)
call :Progress_bar_drawer 14 %a% 63 8 1
timeout /t 1 /nobreak >nul
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /ve /f /d "Windows 標準" >nul
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
if not defined dummy (call :cursorchange_clear& set /p nothing=[5;13H カーソルを更新中...<nul)
set Powersheller=RefreshCursor& call :Powersheller
set a=
if not defined dummy (call :cursorchange_clear& set /p nothing=[5;13H カーソルの色を白色に変更しました。<nul& timeout /t 3 /nobreak >nul)
goto :cursorchange_afterchange



rem Change the cursor color to black.
:darkgo
set a=13
if "%wmodetoggle%"=="true" (color f0) else (color 07)
if not defined dummy (set /p nothing=[5;13H %clrgra%何かキーを押して適用...%clr2%<nul& pause >nul)
if not defined dummy (call :cursorchange_clear& set /p nothing=[5;13H 適用中... %clrgra%^(カーソル替えを閉じないでください！^)%clr2%<nul)
call :Progress_bar_drawer 14 %a% 63 8 1
timeout /t 1 /nobreak >nul
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /ve /f /d "Windows 黒" >nul
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
if not defined dummy (call :cursorchange_clear& set /p nothing=[5;13H カーソルを更新中...<nul)
set Powersheller=RefreshCursor& call :Powersheller
set a=
if not defined dummy (call :cursorchange_clear& set /p nothing=[5;13H カーソルの色を黒色に変更しました。<nul& timeout /t 3 /nobreak >nul)
goto :cursorchange_afterchange



:cursorchange_afterchange
rem Determining whether or not to play reboot message depending on settings
reg query "HKEY_CURRENT_USER\Control Panel\Cursors" /v "" | find "Windows 黒" >nul
if "%ErrorLevel%"=="0" (set cursorcolor=白)
if "%ErrorLevel%"=="1" (set cursorcolor=白)
reg query "HKEY_CURRENT_USER\Control Panel\Cursors" /v "" | find "Windows 標準" >nul
if "%ErrorLevel%"=="0" (set cursorcolor=黒)
set cursorchangeexit=& exit /b





rem dogcheck。%Settingsfile%が存在するかを検証
:AllDefult
cd /d %batchmainpath%
if "%settinghelptoggle%"=="true" (goto :alldefhelp)
if exist %Settingsfile% goto :AllDefulttest
if not exist %Settingsfile% goto :Dogcheck

:Dogcheck
rem dogcheck, respect tobyfox and dog
if "%wmodetoggle%"=="false" (set c=[7m&set c2=[0m)
if "%wmodetoggle%"=="true" (set c=[100m[97m&set c2=[0m[107m[30m)
title カーソル替え ^| Dogcheck 
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
if %dogcheckcount% gtr 5 if %dogcheckcount% lss 7 (title カーソル替え ^| Dogcheck respect tobyfox)
if %dogcheckcount% gtr 8 (title カーソル替え ^| Dogcheck)
if %dogcheckcount% gtr 30 if %dogcheckcount% lss 32 (title カーソル替え ^| dogrune chapter 1)
if %dogcheckcount% gtr 33 (title カーソル替え ^| Dogcheck)
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
rem アンインストールメニュー
:AllDefult1
title カーソル替え ^| アンインストール (試験的)
Cls
echo アンインストールの仕方を選択 bで戻れます。
echo 選択したい数字を押すか、またはwで上、sで下の項目に移動し、任意の部分を選択後、yまたはeキーを入力して決定します。
echo.
echo 1 このbatファイルに関するすべてのデータを削除し、カーソルも白色に戻す
echo.
echo 2 カーソルはそのままにして、すべて削除する
echo.
echo 3 設定を初期化する
echo.
echo 4 設定のファイルパスを表示する
echo.
echo 現在は何も選択されていません。
choice /c 1234wsb /n /m ""
if %ErrorLevel%==1 goto :alldefselect1
if %ErrorLevel%==2 goto :alldefselect2
if %ErrorLevel%==3 goto :alldefselect3
if %ErrorLevel%==4 goto :alldefselect4
if %ErrorLevel%==5 goto :alldefselect1
if %ErrorLevel%==6 goto :alldefselect1
if %ErrorLevel%==7 goto :settingcategory1intsetting5

rem アンインストールメニューの分岐
:alldefselect1
Cls
echo アンインストールの仕方を選択 bで戻れます。
echo 選択したい数字を押すか、またはwで上、sで下の項目に移動し、任意の部分を選択後、yまたはeキーを入力して決定します。
echo.
echo %clr%1 このbatファイルに関するすべてのデータを削除し、カーソルも白色に戻す%clr2%
echo.
echo 2 カーソルはそのままにして、すべて削除する
echo.
echo 3 設定を初期化する
echo.
echo 4 設定のファイルパスを表示する
echo.
echo 現在は1が選択されています。決定する場合はyまたはeキーを押してください
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


rem アンインストールメニューの分岐
:alldefselect2
Cls
echo アンインストールの仕方を選択 bで戻れます。
echo 選択したい数字を押すか、またはwで上、sで下の項目に移動し、任意の部分を選択後、yまたはeキーを入力して決定します。
echo.
echo 1 このbatファイルに関するすべてのデータを削除し、カーソルも白色に戻す
echo.
echo %clr%2 カーソルはそのままにして、すべて削除する %clr2%
echo.
echo 3 設定を初期化する
echo.
echo 4 設定のファイルパスを表示する
echo.
echo 現在は2が選択されています。決定する場合はyまたはeキーを押してください
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

rem アンインストールメニューの分岐
:alldefselect3
Cls
echo アンインストールの仕方を選択 bで戻れます。
echo 選択したい数字を押すか、またはwで上、sで下の項目に移動し、任意の部分を選択後、yまたはeキーを入力して決定します。
echo.
echo 1 このbatファイルに関するすべてのデータを削除し、カーソルも白色に戻す
echo.
echo 2 カーソルはそのままにして、すべて削除する
echo.
echo %clr%3 設定を初期化する%clr2%
echo.
echo 4 設定のファイルパスを表示する
echo.
echo 現在は3が選択されています。決定する場合はyまたはeキーを押してください
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

rem アンインストールメニューの分岐
:alldefselect4
Cls
echo アンインストールの仕方を選択 bで戻れます。
echo 選択したい数字を押すか、またはwで上、sで下の項目に移動し、任意の部分を選択後、yまたはeキーを入力して決定します。
echo.
echo 1 このbatファイルに関するすべてのデータを削除し、カーソルも白色に戻す
echo.
echo 2 カーソルはそのままにして、すべて削除する
echo.
echo 3 設定を初期化する
echo.
echo %clr%4 設定のファイルパスを表示する%clr2%
echo.
echo 現在は4が選択されています。決定する場合はyまたはeキーを押してください
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


rem 設定の初期化をする際の警告メッセージ
:alldefsettingonly
cls
:alldefsettingonlyokey
echo このメニューでは設定を初期化します。したがって、あなたが今までに設定したものはすべて初期設定に戻ります。（カーソル替えを初めて起動したときの設定に戻る）よろしいですか？(Y=Yes / N=No)
choice /c yn /n /m ""
if %ErrorLevel%==1 goto :alldefsettingonlyokey2
if %ErrorLevel%==2 goto :alldefsettingno
:alldefsettingonlyokey2
echo 本当に削除するのですね？(Y=Yes / N=No)
choice /c yn /n /m ""
if %ErrorLevel%==1 goto :alldefsettingyes
if %ErrorLevel%==2 goto :alldefsettingno
goto :alldefsettingonly

:alldefsettingyes
echo 設定ファイルを初期化します。いままでの設定はすべて削除されます。
echo キャンセルする場合は、この時点でバッチ処理を終了してください。
pause
cls
call :Wipealldeta
title カーソル替え ^| ...
echo 初期化が完了しました。変更を適用するため、カーソル替えを再起動します。何かキーを押して再起動...
pause >nul
call :rebootbatch
:alldefsettingno
cls
echo 設定は初期化されませんでした。
pause
:alldefsettingno2
cls
echo このままアンインストールメニューに行くか、もしくはホームに戻るか。
echo どっちにしますか？(設定に戻る=1 / アンインストールメニュー=2)
choice /c 12 /n /m ""
if %ErrorLevel%==1 goto :settingcategory1intsetting5
if %ErrorLevel%==2 goto :alldefselect3
goto :alldefsettingno2

:alldefshowsettingpass
cls
echo 設定ファイルが置かれているパスを表示します。
start explorer %batchmainpath%
timeout /t 3 /nobreak >nul
echo 環境にもよりますが、たいていの場合、下のほうまたは上のほうに%Settingsfile%があると思います。
pause
cls
:alldefshowsettingpass2
echo このままアンインストールメニューに行くか、もしくはホームに戻るか。
echo どっちにしますか？(設定に戻る=1 / アンインストールメニュー=2)
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
title カーソル替え ^|のアンインストール 
echo このアンインストールメニューは、このバッチファイルが変更したレジストリ、初回記録用のファイルをすべて元の状態に戻し、カーソル替え自体を削除する物です。
pause
cls
echo つまり、この機能を使用するとマウスカーソルが初期の白色、そしてこのバッチファイルも完全に削除することになり、再度使用するためにはカーソル替えを再度インストールしなければいけなくなります！
echo (OSが初期化されるわけではない)
pause
cls
echo また、アンインストールを実行したことに起因する何らかの障害、または不利益を被った場合の責任は作成者のtamago1908は一切負いません！
echo.
pause
:AllDefultOkey
SET /P selected=よろしいですか？(Y=Yes / N=No / B=Back)
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
echo すみません。もう一度言っていただけませんか？
echo.
pause
cls
goto :AllDefultOkey

:no2
cls
color 0B
echo [40m[3m[96m時を戻そう
timeout /t 3 /nobreak >nul
find "wmode=false" %Settingsfile% > nul
if %ErrorLevel%==0 color 07
if %ErrorLevel%==1 goto :wmodeonoffkenti
:wmodeonoffkentialldefno2
find "wmode=true" %Settingsfile% > nul
if %ErrorLevel%==0 color f0
goto :hazime

:yes2
rem アンインストールの最終確認
set selected=
SET /P selected=本当にいいですね？(Y=Yes / N=No / B=Back)
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
echo すみません。もう一度言っていただけませんか？
pause
cls
goto :yes2


:yes2final
rem アンインストールの最終確認 シーズン２
set selected=
echo.
echo 
SET /P selected=%alldefclr%こうかい　しませんね？(もどせませんよ！)%alldefclr2%(Y=Yes / N=No / B=Back)
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
echo すみません。もう一度言っていただけませんか？
pause
cls
goto :yes2final

:yes2go
rem 引き下がれない。来る...ッ！
cls
color 9f
echo 実行します。戻る場合はバッチファイルを停止してください。
pause

rem アンインストールメニューの例外処理 初回カーソルがない場合の。だけど冗長だから改善したい。
rem 例外処理をもうちょっと増やしたい。例えば、中身を改造しない限り絶対にありえない状態になった場合に、gotoして変数で分岐してメッセージを変更するみたいにして。
cd /d %batchmainpath%
if not exist %FirstSTFsfile% if exist %Settingsfile% set erroralldefwhatdelete=%FirstSTFsfile%& call :BSOD_Errors 3
if exist %FirstSTFsfile% if not exist %Settingsfile% set erroralldefwhatdelete=%Settingsfile%& call :BSOD_Errors 3
if not exist %FirstSTFsfile% if not exist %Settingsfile% set "erroralldefwhatdelete=%FirstSTFsfile%と、%Settingsfile%、その両方"& call :BSOD_Errors 3
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
title カーソル替え ^| ブルースクリーン！
echo.
echo.
call :bsod_errors_RANDOMFACEHAHA
echo.
echo.
echo          カーソル替えがクラッシュしました！
echo.
echo          この画面は何らかの理由でカーソル替えがクラッシュした際に表示されます。
echo          サポートを得る際には以下の情報が役に立つかもしれません :
echo.
echo          カーソル替え バージョン : %batver% (%batbuild%)
echo          Windows ビルド番号      : %bsodwinver%
echo          エラーID                : %1
echo          エラーレベル            : %bsoderrorlevel%
echo.
echo          この画面についての詳細情報を得る際には以下のリンクにアクセスしてください (英語) :
echo.
echo          https://github.com/tamago1908/Cursor-Changer.bat/wiki/BSOD-Crash-(Error-Screen)
echo.

if %1 geq 0 if %1 leq 6 (goto :BSOD_Errors%1message) else (goto :BSOD_Errors_Error)


:BSOD_Errors0message
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"不明且つ重大なエラーが発生しました！\", '重大なエラー', 'OK', 'Warning');Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"エラーの概要 : 不明且つ重大なエラーが発生しました。 エラーID : 0\", 'エラー', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"殆どの場合、このエラーは開発者による重大なミスが原因です。(構文エラーなど)\", 'エラー', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"お使いの環境、アンチウィルスソフトウェア等を確認後、再度エラーが発生した個所でやり直してください。\", 'どうすればいい？?', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"それでもエラーが継続する場合、Githubのissueにて報告してください。\", 'エラー', 'OK', 'None')"
goto :BSOD_ErrorsRorR

:BSOD_Errors1message
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"重大なエラーが発生しました！\", '重大なエラー', 'OK', 'Warning');Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"エラーの概要 : 重大なエラーが発生しました。 エラーID : 1\", 'Error', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"このエラーは予期されていないExit /bや、不正なサブルーチン、もしくは存在していないラベルへのgoto、callで発生します。\", 'Error', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"お使いの環境、アンチウィルスソフトウェア等を確認後、再度エラーが発生した個所でやり直してください。\", 'どうすればいい？?', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"それでもエラーが継続する場合、Githubのissueにて報告してください。\", 'エラー', 'OK', 'None')"
goto :BSOD_ErrorsRorR

:BSOD_Errors2message
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"SAB_Managerでエラーが発生しました！\", 'エラー', 'OK', 'Warning');Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"エラーの概要 : SAB_Managerが読み込まれる際に必要なwantloadの値が予期せぬ値でした。%wantload% エラーID : 2\", 'Error', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"このエラーは非常に珍しいです。ただし、デバッグ用途の機能を使用した際に発生することがあります。\", 'Error', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"お使いの環境、アンチウィルスソフトウェア等を確認後、再度エラーが発生した個所でやり直してください。\", 'どうすればいい？?', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"それでもエラーが継続する場合、Githubのissueにて報告してください。\", 'エラー', 'OK', 'None')"
goto :BSOD_ErrorsRorR

:BSOD_Errors3message
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"アンインストール中にエラーが発生しました！\", 'エラー', 'OK', 'Warning');Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"エラーの概要 : アンインストールの際に存在しているべきファイルが存在しませんでした！ エラーID : 3\", 'Error', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"お使いの環境、アンチウィルスソフトウェア等を確認後、再度エラーが発生した個所でやり直してください。\", 'どうすればいい？?', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"それでもエラーが継続する場合、Githubのissueにて報告してください。\", 'エラー', 'OK', 'None')"


:BSOD_Errors3message3message
cls
color 04
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"...まぁ、実際には%erroralldefwhatdelete%をあなたが削除したのが原因でしょうが... (もしそうなら はい を、そうでないなら いいえ を押してください)\", '', [System.Windows.Forms.MessageBoxButtons]::'Yesno', 'Question');exit $result;"
if "%errorlevel%"=="6" (goto :BSOD_Errors3message3messageok)
if "%errorlevel%"=="7" (goto :BSOD_Errors3message3messageno)
goto :BSOD_Errors3message3message

:BSOD_Errors3message3messageok
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"やっぱりね....\", '', 'OK', 'Error')
goto :BSOD_ErrorsRorR

:BSOD_Errors3message3messageno
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"えっ........ 本当に...？ま、まぁ、もし何もしていないのにこのエラーが発生した場合は、お使いの環境、アンチウィルスソフトウェア等を確認後、再度エラーが発生した個所でやり直してください。\", '', 'OK', 'Error');Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"それでもエラーが継続する場合、Githubのissueにて報告してください。\", '', 'OK', 'エラー')"
goto :BSOD_ErrorsRorR


:BSOD_Errors4message
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"うわぁあああああああああああああああああああああああああああ！！！！\", 'くくぁｗせｄｒｆｔｇｙふじこｌｐ', 'OK', 'Warning');Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"エラーの概要 : テメェはもうおしまいだぁあぁっぁぁぁっ！！！！！！！！１１ エラーID : 9999999\", 'Error', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"このエラーはテメェがもうおしまいだということを教えてんだよ！！！！！！！！！！！\", 'その通り', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"テメェにできる事は何もねぇ！くたばりな！\", 'どうすればいい？?', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"くたばれ！！！！！！！\", 'くたばれ！！！！！！！！！！！！！！', 'OK', 'None')"
goto :BSOD_ErrorsRorR

:BSOD_Errors5message
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"重大な引数のエラーが発生しました！\", '重大なエラー', 'OK', 'Warning');Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"エラーの概要 : Batchで予約済みの引数がユーザー引数として使用されました！ エラーID : 5\", 'エラー', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"このエラーはユーザー (この場合あなた)が、batchで予約済みの引数を、cmd等で直接指定して実行した際に発生します。\", 'エラー', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"予約済みの引数を指定して実行しないでください。\", 'どうすればいい？?', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"それでもエラーが継続する場合、Githubのissueにて報告してください。\", 'エラー', 'OK', 'None')"
goto :BSOD_ErrorsRorR

:BSOD_Errors6message
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"重大なエラーがErrorHandlerで発生しました！\", 'CRITICAL ERROR', 'OK', 'Warning');Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"エラーの概要 : ErrorHandlerで重大なエラーが発生しました！ エラーID : 6\", 'エラー', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"このエラーは様々な理由で発生する可能性があります。例えば、正しくないカーソル替えの名前、Ctrl+Cの使用、不適切な方法での起動等です。\", 'エラー', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"Cursor Changerを再インストールしたり、powershellやこのbatchの名前を確認したり、デスクトップにおいてからbatchを起動するなどを試してください。\", 'どうすればいい？', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"それでもエラーが継続する場合、Githubのissueにて報告してください。\", 'エラー', 'OK', 'None')"
goto :BSOD_ErrorsRorR


:BSOD_Errors_Error
cls
echo BSOD_Errorsが不適切な方法でcallされました！
pause
if not defined dummy (set /p nothing=[?25h<nul)
if "%wmodetoggle%"=="true" (color f0) else (color 07)
exit /b


:BSOD_ErrorsRorR
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"[はい] を押して再起動、[いいえ] を押してリカバリーメニューで再起動します。\", 'どちらかを選択してください...', [System.Windows.Forms.MessageBoxButtons]::'Yesno', 'Question');exit $result;"
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
echo                                     今すぐ以下のリンクを開け...
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
title カーソル替え ^| ブルースクリーン！
echo O========================================= クラッシュ ==========================================O
echo.
echo.
echo          カーソル替えがクラッシュしました！
echo.
echo          この画面は何らかの理由でカーソル替えがクラッシュした際に表示されます。
echo          サポートを得る際には以下の情報が役に立つかもしれません :
echo          (警告 : カーソル替えはあなたのWindowsをサポートしていません！)
echo.
echo          カーソル替え バージョン : %batver% (%batbuild%)
echo          Windows ビルド番号      : (未サポートのバージョン)
echo          エラーID                : %1
echo          エラーレベル            : %bsoderrorlevel%
echo.
echo          この画面についての詳細情報を得る際には以下のリンクにアクセスしてください (英語) :
echo.
echo          https://github.com/tamago1908/Cursor-Changer.bat/wiki/BSOD-Crash-(Error-Screen)
echo.
echo          何かキーを押して終了...
echo.
pause >nul
if "%wmodetoggle%"=="true" (color f0) else (color 07)
call :exit 1


:BSOD_Errors_NOERRORS
rem Your Cursor Changer is running perfectly fine :)
title カーソル替え ^| ブルースクリーンとエラー  どこに行った？
echo.
echo.
call :bsod_errors_RANDOMFACEHAHA2
echo.
echo.
echo          よっしゃー！ カーソル替えがちゃんと動いてる！
echo.
echo          この画面は何らかの理由でカーソル替えが正常に動作している際に表示されます。
echo          正常に動作していることを知る際には以下の情報が役に立つかもしれません :
echo.
echo          カーソル替え バージョン : なにそれおいしいの
echo          Windows ビルド番号      : ぬるぽ
echo          エラーID                : %1
echo          エラーレベル            : わぁー
echo.
echo          この画面についての詳細情報を得る際には以下のリンクにアクセスしてください (英語) :
echo.
echo          https://www.youtube.com/watch?v=dQw4w9WgXcQ
echo.
echo          何かキーを押して続行...
pause >nul
exit /b



rem アンインストールメニューの選択の判別
:alldefnow
cls
color 07
if %alldefselect%==1 goto :alldefnowchangeit
if %alldefselect%==2 goto :alldefnowsettingdel

rem アンインストールメニューの選択に応じての分岐
:alldefnowsettingdel
del %FirstSTFsfile%
del %Settingsfile%
goto :alldefnowfinish

:alldefnowchangeit
del %FirstSTFsfile%
del %Settingsfile%
rem アンインストールのためのカーソルの初期化。白に戻す
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /ve /f /d "Windows 標準" >nul
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
rem アンインストール完了後のメッセージ
cls
title カーソル替え ^| さようなら！ 
echo すべてをデフォルトに戻しました。
pause
echo これでお別れですね。さようなら。
pause
rem 自身のパスを取得して、自分自身を削除
del "%~dp0%~n0%~x0" & exit



:DEATHEASTEREGG
rem :(
set "Hazimebuild=[0;22HMy version shouldn't be like this."
exit /B


:1908hell
rem テスト機能とイースターエッグ
cls
set eggloop=0
:loop1908
set /a eggrandom=%random%*5/32767
title カーソル替え ^| %eggloop%

if "%eggrandom%"=="0" (echo 1908 :D)
if "%eggrandom%"=="1" (echo 1908 :P)
if "%eggrandom%"=="2" (echo 1908 xD)
if "%eggrandom%"=="3" (echo 1908 :C)
if "%eggrandom%"=="4" (echo 1908 :O)
set /a eggloop=eggloop+1
if %eggloop% gtr 1908 (pause&echo 1 9 0 8 :D :D :D :D :D :D&pause&goto :hazime)
goto :loop1908

:developermenu
title カーソル替え ^| developer menu
echo axolotl is my best friend
pause
exit /b

:Hello_World
rem Hello world!! Yippeeeee :D
cls
for /l %%i in (1,1,1000) do (
    title カーソル替え ^| Hello world!! ^(%%i / 1000^)
    set /p nothing=Hello world!! <nul
    ping -n 0 -w 500 localhost >nul
)
echo.& echo HELLO WORLD!!! (何かキーを押して戻る...)
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
title カーソル替え ^| パスコードを入力してください (ヒント : 開発者の名前)
setlocal enabledelayedexpansion
if not defined dummy (set /p nothing=[?25l<nul)
mode con: cols=75 lines=25
set "input=" & set len=0
:allcommandslockloop
rem drew UI
if "%wmodetoggle%"=="true" (echo [97m)
if not defined dummy (
echo [10;25H[44m┌───  パスコード 入力 ───┐ [0m
echo [11;25H[44m│                        │ [0m
echo [12;25H[44m│ ┃[0m                    ┃[44m │ [0m
echo [13;25H[44m│                        │ [0m
echo [14;25H[44m└────────────────────────┘ [0m
echo [15;25H[44m   B=削除  Y=決定  E=戻る  [0m
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
if %num%==11 if "%input%"=="1908" (echo [17;28H正しいパスコードです。&timeout /t 2 /nobreak >nul&echo [?25h&set invisiblecursor=&setlocal disabledelayedexpansion&set input=&set len=&set allcommandlock=false&goto :allcommandsmain) else (echo [17;12H不正解！ 再度試す場合には、batchを再起動してください。&timeout /t 3 /nobreak >nul&set input=&set len=0&set allcommandlock=true&goto :hazimemenu)
if %num%==12 (
    if not defined dummy (
        setlocal disabledelayedexpansion&echo [?25h&set invisiblecursor=&set input=&set len=& goto :hazimemenu
    )
)
if %num% lss 10 if not defined input (set "input=%num%"&set "len=1") else if !len! gtr 18 (goto :allcommandslockloop) else set input=%input%%num%&set /a len=len+1
goto :allcommandslockloop

:allcommandsmain
title カーソル替え ^| コマンドリスト
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
echo          %clryel%・%clr2% help %clrgra%(displays all available commands.)%clr2%
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
echo                                   !警告!
echo.
echo この機能は開発者向けに作成されたものです。ですので、開発者以外の人が利用した場合、何らかのバグや問題を引き起こす可能性があります。
echo それでもこの機能を使用したい場合には、"y"を入力して下さい。
echo 戻るか、キャンセルしたい場合には、"n"を入力してください。
echo 一度yを入力した場合、このbatchを直接再起動するか、変数"fulldebug"を削除しない限りこのメッセージは再度表示されなくなります。
set /p selected=Y or N : 
if %selected%==n goto :hazimemenu
if %selected%==y set fulldebug=true
if %selected%== echo what? "Y" or "N".&pause&goto :fulldebug

:fulldebugmain
set fulldebugsetvariable=
set fulldebugvariableapply=
title カーソル替え ^| ^(デバッグ用^) カーソル変数
echo.
echo fulldebug を起動しています...
powershell -command "&{$h=Get-Host;$w=$h.UI.RawUI;$s=$w.BufferSize;$s.height=150;$w.BufferSize=$s;}"
cls
:fulldebugtypevariable
set fulldebugsetvariable=
set fulldebugvariableapply=
set
set /p fulldebugsetvariable=変更するラベルを指定してください。 :
if "%fulldebugsetvariable%"=="back" (goto :hazimemenu)
if "%fulldebugsetvariable%"=="exit" (goto :hazimemenu)
if "%fulldebugsetvariable%"=="help" (echo goto&echo set&echo run&echo help&echo back&pause&cls&set fulldebugsetvariable=&goto :fulldebugtypevariable)
if "%fulldebugsetvariable%"=="goto" (goto :fulldebuggoto)
if "%fulldebugsetvariable%"=="set" (goto :fulldebugsetnew)
if "%fulldebugsetvariable%"=="run" (goto :fulldebugrun)
if "%fulldebugsetvariable%"=="" (cls&goto :fulldebugtypevariable)
if not defined %fulldebugsetvariable% (echo 変数 %fulldebugsetvariable% は存在しません。新たに作成するか、存在する物を指定して下さい。&pause&cls&goto :fulldebugtypevariable)
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
set /p fulldebugsetvariable=どこにgotoしますか？:
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
echo 存在しないラベルが指定されました。
echo ^(もしくは、殆ど処理が存在しないラベルにgotoしたか...^). 
echo 存在するラベルを指定してください。
pause
  )
 )
cls
goto :fulldebuggoto


:fulldebugsetnew
cls
set fulldebugsetvariable=
set fulldebugvariableapply=
set /p fulldebugsetvariable=作成したい変数名を入力してください。  :
if defined %fulldebugsetvariable% (echo %fulldebugsetvariable% という変数はすでに存在しています。存在しないラベルを指定してください。 &pause&cls&goto :fulldebugsetnew)
if "%fulldebugsetvariable%"=="back" (goto :fulldebugtypevariable)
if "%fulldebugsetvariable%"=="" (echo 何か入力してください。&pause&cls&goto :fulldebugsetnew)
:fulldebugsetnewenter
set /p fulldebugvariableapply=%fulldebugsetvariable%^=
if "%fulldebugvariableapply%"=="" (echo 空の値では変数を作成できません。 &pause&cls&goto :fulldebugsetnewenter)
if "%fulldebugvariableapply%"=="back" (goto :fulldebugerrorsetnew1)
set %fulldebugsetvariable%=%fulldebugvariableapply%
echo 変数 %fulldebugsetvariable% は、 %fulldebugvariableapply% という値で作成されました。(%fulldebugsetvariable%^=%fulldebugvariableapply%).
pause
cls
goto :fulldebugtypevariable

:fulldebugerrorsetnew1
set /p fulldebugsetvariableerrornew=退出するか、その値で変数を作成しますか？ (1 or 2) : 
if "%fulldebugsetvariableerrornew%"=="1" (goto :fulldebugtypevariable)
if "%fulldebugsetvariableerrornew%"=="2" (goto :fulldebugerrorsetnew1if)
:fulldebugerrorsetnew1if
set %fulldebugsetvariable%=back
echo 変数 %fulldebugsetvariable% は、 %fulldebugvariableapply% という値で作成されました。 (%fulldebugsetvariable%^=%fulldebugvariableapply%).
pause
cls
goto :fulldebugtypevariable


:fulldebugerrorsetvariable1
set /p fulldebugsetvariableerrorif=本当に変数 %fulldebugsetvariable%を削除しますか？ (y or n)
if "%fulldebugsetvariableerrorif%"=="y" (
set %fulldebugsetvariable%=
echo 変数 %fulldebugsetvariable% は削除されました。
pause
cls
goto :fulldebugtypevariable
)
if "%fulldebugsetvariableerrorif%"=="n" (goto :fulldebug)


:fulldebugrun
cls
set fulldebugrun=
set /p fulldebugrun=実行したいコマンドを入力してください。 :
if "%fulldebugrun%"=="" (echo 何かあなたが実行したいコマンドを入力してください。 ^(例えば "echo" 等^)& pause & goto :fulldebugrun)
if "%fulldebugrun%"=="back" (set fulldebugrun=& goto :fulldebugtypevariable)
if "%fulldebugrun%"=="b" (set fulldebugrun=& goto :fulldebugtypevariable)
%fulldebugrun% || echo そのコマンドでエラーが発生したか、もしくは無効なコマンドのようです。
echo.
pause
set fulldebugrun=
goto :fulldebugtypevariable


:littleeasteregg
if "%hazimeeaster%"=="true" (goto :hazimemenu)
cls&pause&echo hello! this is easteregg!&pause&cls&title カーソル替え ^| 隠し機能でメインメニューとバージョン情報の部分でビルドナンバーが表示されるようになった&echo and bye!&pause&cls&set hazimeeaster=true&goto :hazime




:Rebootbatch
PowerShell -WindowStyle Hidden -Command Exit
if "%1"=="1" (start "カーソル替え" ^"%~dp0%~n0%~x0^" recovery& call :exit 0) else (start "カーソル替え" ^"%~dp0%~n0%~x0^"& call :exit 0)

:exit
if "%1"=="1" (echo シャットダウン中...)
if "%1"=="2" (goto :batshutdown)
powershell -command "$pid1 = Get-WmiObject win32_process -filter processid=$pid | ForEach-Object{$_.parentprocessid;}";$pid2 = "Get-WmiObject win32_process -filter processid=$pid1 | ForEach-Object{$_.parentprocessid;}";$pid3 = "Get-WmiObject win32_process -filter processid=$pid2 | ForEach-Object{$_.parentprocessid;};exit $pid3"
>nul 2>&1 taskkill /pid %errorlevel% >nul
exit
:reboot


rem [あなたはぜんぶのコードをよんだ]
rem ...
rem * キミ  よっぽど  ヒマなんだね。