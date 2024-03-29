@echo off
setlocal
rem サイズの指定
mode con: cols=75 lines=25
title カーソル替え

rem カーソル替え by tamago_1908
rem 日本語バージョン

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


rem 1.14 :
rem 1.14はベータ版としてリリースしない
rem 新しいアップデート有効GUIを実装する。
rem バージョン情報の部分をオーバーレイ技術を利用して改良する
rem その他 をメインメニューに実装する。その際には高度なifカラー技術を採用する
rem できればより良い電卓を完成させて実装する

rem 起動時の日付を利用してメッセージを表示する。その季節に合ったメッセージ。
rem exitメニューをオーバーレイ化する。具体的には最初に灰色でメニューを表示したのち、ieclのpswdロックと同じ方式で描写する。
rem 設定の初期化などの際に利用している部分を関数化する
rem もう少し賢い方法で設定ファイルなどの改変を検知する
rem 日本語化できていない部分を日本語化する


rem スタートアップアニメーションのイースターエッグをもっと実装する。
rem 具体的には、32768分の1の確率で恐ろしいものを再生し、256分の1の確率でリックロールさせる。
rem 現在実装されているyoutube関連の処理をすべて削除して、dogcheckとstartup rickrollをpowershellの音楽再生に置き換える。
rem もっと設定をカテゴナライズさせる。bootanimationのカテゴリーとか。setting5_1とか？
rem 上に伴い、よりカテゴナライズされた設定GUIを実装する。
rem 引数指定時、セットアップされていない・windows version checkに引っかかっている場合にエラーを出す (半分終わり)

rem カーソル替えを一つの独立したcmdから呼び出させて起動させる。より良いエラー処理
rem 上を実装するうえで一番簡単なのはあらかじめ引数を予約させておくこと。例えば、CSCG_BOOT_STARTERRORTRACKERという引数を渡させるとか。


rem 非効率なGUIを修正して、効率的なものに変更する。ただし、超重労働。これをしないと将来的に後悔することになるので、せめて設定とexitだけは効率的にしたい。


rem powershell処理部分で、batchが改変されているかどうかを検知する機能を追加する。設定でそれを無効にできるようにもする。


rem Make sure to fill in the build number and version! Also, don't forget to put it in the archive!
rem environment setting, It is not recommended to change.
rem VER v1.13
set batver=1.13
set batbuild=build 64
set batverdev=stable
set hazimeeaster=false
set firststartbat=no
set bootbatnow=yes
set messagealreadyshowed=false
set batpath=%~0

rem Here you can change the path to the location where configuration files and other files are placed and loaded
rem Example : 
rem %HOMEDRIVE%%HOMEPATH% (default)
rem %HOMEDRIVE%%HOMEPATH%\desktop (desktop)
rem %0 (batch placed path)
rem O===================================O
set "batchmainpath=%HOMEDRIVE%%HOMEPATH%"
rem O===================================O
cd /d %batchmainpath%

:batbootloader_animationcheck
setlocal enabledelayedexpansion

rem bootloader animation loader. first of all, load theme setting.
if exist カーソル替え設定.txt (
find "wmode=true" カーソル替え設定.txt > nul 
if {!errorlevel!}=={0} (color f0&set wmodetoggle=true) else (set wmodetoggle=false)
) else (set wmodetoggle=false)

>nul 2>&1 find "bootanimation=true" カーソル替え設定.txt
if "!errorlevel!"=="0" (
    >nul 2>&1 find "s5_rawboot=true" カーソル替え設定.txt
if not "!errorlevel!"=="0" (
>nul 2>&1 find "s5_linuxboot=true" カーソル替え設定.txt
if "!errorlevel!"=="0" (
    set linuxboot=true
    echo [%time: =%] Cursor Changer %batver% Bootloader - by tamago_1908&echo.&echo O================ Boot Start Here ================O&echo.
>nul 2>&1 find "wmode=true" カーソル替え設定.txt
if "!errorlevel!"=="0" (set linuxishclr=[92m&set linuxishclr2=[107m[30m) 
>nul 2>&1 find "wmode=false" カーソル替え設定.txt
if "!errorlevel!"=="0" (set linuxishclr=[92m&set linuxishclr2=[0m)
)
)
)

if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Linux-ish Boot Loader is just now started.)
>nul 2>&1 find "bootanimation=true" カーソル替え.txt
if "!errorlevel!"=="0" (
>nul 2>&1 find "s5_simpleboot=true" カーソル替え.txt
if "!errorlevel!"=="0" (
    if not "%linuxboot%"=="true" (
    set simpleboot=true
    )
)
)
>nul 2>&1 find "bootanimation=true" カーソル替え.txt
if "!errorlevel!"=="0" (
>nul 2>&1 find "s5_rawboot=true" カーソル替え.txt
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
if "%animationrecheck%"=="true" (set animationrecheck=&exit /b)
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Bootanimation Checked...)


rem chenge the boot message if it is the first time, or if a value is defined in batbotpowershell, or at boot up
if not exist カーソル替え設定.txt set firststartbat=yes
if not "%linuxboot%"=="true" (
if not "%firststartbat%"=="yes" (
if {%bootbatnow%}=={yes} (title カーソル替え 準備中...&echo しばらくお待ちください。)
) else (
    if not defined batbootpowershell (
        if not exist 初回カーソル.txt (
        echo セットアップの準備をしています...
        ) else (title カーソル替え 準備中...&echo しばらくお待ちください。)
    )
)
)
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Boot Message IS NO MORE WORKING...)

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
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Argment_Loader is Started...)
rem 引数がなければ終了
if "%~1"=="" set argmentloaded=true& goto Argments_Loaderend
title カーソル引数
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
    if "!current!"=="bypsdisexit" (echo bypsdisexitを有効にしました。&set disableexit=false&set argmentserror=false)
    if "!current!"=="enablesimpleboot" (echo simplebootを有効にしました。&set simpleboot=true&set argmentserror=false)
    if "!current!"=="devmode" (call :developermenu&set argmentserror=false)
    if "!current!"=="recovery" (call :batbootcheckwinver dynamic&echo recovery modeを有効にしました。&set argmentserror=false&goto Cursor_Changer_REmenu)
    if "!current!"=="help" (call :batbootcheckwinver dynamic&title 引数のヘルプ&call :batstarthelp&set argmentserror=false)
    if "!current!"=="bypsvck" (echo bypsvckを有効にしました。&set bypasswinvercheck=true&set argmentserror=false)
    if "!current!"=="bypsadm" (echo bypsadmを有効にしました。&set adminbypass=true&set adminbypass=false&set argmentserror=false)
    if "!current!"=="bypsloadsg" (echo bypsloadsgを有効にしました。&set settingbypass=true&set argmentserror=false)
rem 例外処理
   if "!argmentserror!"=="" (title カーソル引数 エラー&echo 不明な引数が指定されました！^(!current!^) 有効な引数を指定してください。 ^(それか、^"help^"を利用してください。^)
      )
    )
  )
    set argmentloaded=true
    timeout /t 3 /nobreak >nul
:Argments_Loaderend
set n=
setlocal disabledelayedexpansion
if {%argmentloaded%}=={true} (set argmentloaded=&goto :batstarterrortrackermain)
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Argment_Loader is done.)
set argmentserror=


:batbootcheckwinver
setlocal enabledelayedexpansion
if not "%1"=="dynamic" (
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Checking Windows Version...)
)
rem check windows 10 1511 or higher
for /f "tokens=6 delims=. " %%i in ('ver') do set version=%%i
if "%version:~-0,-2%" gtr "105" (set batbootcheckwinversafe=true)
for /f "usebackq delims=" %%a in (`ver`) do set version2=%%a
rem check windows 8.1 or lower
echo %version2% | find /i "Version 6.3." > nul
if "%errorlevel%"=="0" (set windowsverfilter=windows 8.1&goto batbootcheckwinverbad)
echo %version2% | find /i "Version 6.2." > nul
if "%errorlevel%"=="0" (set windowsverfilter=windows 8&goto batbootcheckwinverbad)
echo %version2% | find /i "Version 6.1." > nul
if "%errorlevel%"=="0" (set windowsverfilter=windows7&goto batbootcheckwinverbad)
echo %version2% | find /i "Version 6.0." > nul
if "%errorlevel%"=="0" (set windowsverfilter=windows vista) else (
    if "%batbootcheckwinversafe%"=="true" (goto :batbootcheckwinversafe)
    set "windowsverfilter=古すぎます！"
    goto batbootcheckwinverbad
)


:batbootcheckwinverbad
if "%bypasswinvercheck%"=="true" (goto :batbootcheckwinverbadwarning)
rem winver check failed message
echo お使いのwindowsのバージョン(%windowsverfilter%)はカーソル替えに対応していません！
pause
cls
echo カーソル替えの対応OSはwindows 10 バージョン 1511以降からです。
pause
cls
echo それより古いバージョン（例えばwindows 7や、windows 8、8.1等）は対応していません。
pause
cls
echo 今あなたがお使いのwindowsをアップデートするか、カーソル替え バージョン1.12以前をご利用ください。
pause
exit

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
if %selected%==n exit
if %selected%==y goto :batbootcheckwinversafe
if %selected%== echo what? "Y" or "N".&pause&goto :batbootcheckwinverbadwarning


:batbootcheckwinversafe
setlocal disabledelayedexpansion
set batbootcheckwinversafe=&set version=&set version2=
if "%1"=="dynamic" (exit /b)
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] WinverCheck is done.)

:batbootcheckpowershell
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Powershell Checking...)
rem check powershell is available
>nul 2>&1 powershell exit &&goto batbootcheckpowershellsafe
cls
echo powershellの確認に失敗しました！
pause
cls
echo これが表示されたということは、お使いのPCにpowershellがインストールされていない可能性が高いということです。
pause
cls
echo カーソル替えを動作させるにはpowershellが必須です。
echo Windows 10 1511以降ではpowershell 5.1が標準でインストールされているため、恐らく意図的にアンインストールされているか、利用できなくなっている可能性が高いでしょう。
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
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Powershell Check is done.)



rem カーソル替え処理を実行

rem 本処理 (変数のセットとか、前段階)
set version=
set bootbatnow=yes
set exitbuttondisabled=false
rem 管理者権限を保有しているかの確認
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
rem 管理者権限を保有している状態で、exitボタンを無効にすると、稀にウイルスとして検出されてしまう場合がある。なので、管理者権限保有時と、disableexitという変数がfalseの場合は、処理をバイパスしている。
rem By the way, the reason why it is named disableexit is because this feature was a feature to disable the exit button in the beta version. After leaving beta, it was changed to disable maximization.
if exist カーソル替え設定.txt find "CheckUpdate=true" カーソル替え設定.txt > nul
if {%errorlevel%}=={0} (set checkupdatetoggle=true&set batverforpowershell=%batver:β=.b%) else (set checkupdatetoggle=false)
if {%disableexit%}=={false} (goto batbootdisabledexitbutton)

:batbootpowershell
if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Batbootpowershell is started...)
set exitbuttondisabled=false

rem startid~powershell までのコードはずらしてはいけない　それ以前かそれ以後ならok
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

# Define the function to check the update of カーソル替え with github api
function Updater {
$repo = "https://api.github.com/repos/tamago1908/Cursor-Changer.bat/releases/latest"
try{$file = (Invoke-RestMethod -Uri $repo -Method Get -Headers @{'Accept'='application/vnd.github.v3+json'}).assets | Where-Object { $_.name -like "Cursor.Changer.*" }
}catch{if($_.Exception.Response.StatusCode.Value__ -eq 403){Write-Host "[ERROR] githubのAPIレート制限に到達しました。これが意味するのは要するに、一時間以内に大量にアップデートを確認し過ぎ、ということです。一時間ほど間を置いたのち、再度アップデートを確認してください。" -foregroundcolor red}else{Write-Host "[ERROR] 何らかのエラーが発生しました。インターネット接続を確認するか、githubのサーバーが落ちていないかを確認したのち、再度試してください。`nエラーログ : $_" -foregroundcolor red};break}
$fileVersion = $file.name -replace "Cursor\.Changer\.|\.bat", ""
$batVersion = "$env:batverforpowershell", ""
$batName = Get-Item "カーソル替え *.bat"

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
Write-Host "アップデートを確認しています..."
#check the update of カーソル替え with github api, and Update it.
$repo = "https://api.github.com/repos/tamago1908/Cursor-Changer.bat/releases/latest"
try{$file = (Invoke-RestMethod -Uri $repo -Method Get -Headers @{'Accept'='application/vnd.github.v3+json'}).assets | Where-Object { $_.name -like "Cursor.Changer.*" }
}catch{if($_.Exception.Response.StatusCode.Value__ -eq 403){Write-Host "[ERROR] githubのAPIレート制限に到達しました。これが意味するのは要するに、一時間以内に大量にアップデートを確認し過ぎ、ということです。一時間ほど間を置いたのち、再度アップデートを確認してください。" -foregroundcolor red}else{Write-Host "[ERROR] 何らかのエラーが発生しました。インターネット接続を確認するか、githubのサーバーが落ちていないかを確認したのち、再度試してください。`nエラーログ : $_" -foregroundcolor red};break}
$fileVersion = $file.name -replace "Cursor.Changer\.|\.bat", ""
$batVersion = (Get-Item "カーソル替え *.bat").name -replace "カーソル替え |\.bat", ""
$batName = Get-Item "カーソル替え *.bat"

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
            Write-Host "アップデートが利用可能です。現在のバージョンは、 `"$($batVersion)`"で、アップデートされたバージョンは `"$($fileVersion)`"です。" `n
            Start-Sleep 1
            powershell {$h=Get-Host;$w=$h.UI.RawUI;$s=$w.BufferSize;$s.height=62;$w.BufferSize=$s;}
try{if($env:wmodetoggle -eq "false"){Write-Host "チェンジログ :" -foregroundcolor white}elseif($env:wmodetoggle -eq "true"){Write-Host "チェンジログ :" -foregroundcolor black }else{Write-Host "チェンジログ :" -foregroundcolor white};$e=[char]27;$clr="$e[7m";$clred="$e[91m";$clrgrn="$e[92m";$clryel="$e[93m";$clrmag="$e[95m";$clrgra="$e[90m";$clrcyan="$e[96m";$c="$e[0m";if($env:wmodetoggle -eq "true"){$clr="$e[100m$e[97m";$c="$e[0m$e[107m$e[30m"};foreach($s in (irm -Uri "https://api.github.com/repos/tamago1908/Cursor-Changer.bat/releases/latest").body -split '\r\n'){if($s -match "####"){write-host "$clrcyan$e[1m$($s -replace '(^\#+)|(\#+$)', '')$c" `n -NoNewline}elseif($s -match ">"){write-host "$clred$($s -replace '\>', '')$c" `n -NoNewline}elseif($s -match "###"){write-host "$clryel$e[1m$($s -replace '(^\#+)|(\#+$)', '')$c" `n -NoNewline}elseif($s -match "___"){write-host "$clrgra--------------------------------------------------$c" `n -NoNewline}else{$s=$s -replace "\*{3}(.+?)\*{3}", "$e[3m;1m`$1$c";$s=$s -replace "\*{2}(.+?)\*{2}", "$e[1m`$1$c";$s=$s -replace "^\s*-(\s+)(.*)", "$clred-$c`$1`$2";$s=$s -replace "\*+", "";write-host "$s" `n -NoNewline}};write-host "";rv e,clr,clred,clrgrn,clryel,clrmag,clrgra,clrcyan,c,s}catch{if($_.Exception.Response.StatusCode.Value__ -eq 403){Write-Host "[ERROR] githubのAPIレート制限に到達しました。これが意味するのは要するに、一時間以内に大量にアップデートを確認し過ぎ、ということです。一時間ほど間を置いたのち、再度アップデートを確認してください。" -foregroundcolor red}else{Write-Host "[ERROR] 何らかのエラーが発生しました。インターネット接続を確認するか、githubのサーバーが落ちていないかを確認したのち、再度試してください。`nエラーログ : $_" -foregroundcolor red};break}
            Start-Sleep 2

             if ($isFileBeta -eq "true") {
            $e=[char]27
            $clrgra="$e[90m"
            $c="$e[0m"
            Write-Host "$clrgra[TIP] このアップデートはベータ版です。なので、一部不安定な部分がある可能性があります。$c"
            rv clrgra,c,e
            }
                $answer = Read-Host "アップデートしますか？ 尚、アップデートをインストールすると強制的に英語版へと変更されます。(y or n)"
                if ($answer -eq "y") {
                $downloadFolder = Join-Path $env:USERPROFILE "Downloads"
                $downloadFile = Join-Path $downloadFolder $file.name
                Invoke-WebRequest -Uri $file.url -OutFile $downloadFile -Headers @{'Accept'='application/octet-stream'}
                $newBatName = "Cursor.Changer.$fileVersion.bat"
                Move-Item $downloadFile (Join-Path (Split-Path $batName) ("$newBatName")) -Force
                Remove-Item "Cursor.Changer.$batVersion.bat" -Force

                    Write-Host "アップデートは完了しました。"
                    Start-Sleep 2

                    break
                }
                else {
                    Write-Host "アップデートはキャンセルされました。"
                    Start-Sleep 2
                    break
                }
            }
            elseif ($fileElement -lt $batElement) {
                Write-Host "[ERROR] あなたのバージョン(`"$($batVersion)`")は、アップデートファイルよりも先行 (`"$($fileVersion)`")しています！(恐らく、あなたはカーソル替えのバージョンを故意に変えたのでしょう...)" -ForegroundColor Red 
                Start-Sleep 2
                break
            }
        }
        elseif ($isFileBeta -and -not $isBatBeta) {
        cls
            # The file version is beta and the bat version is not, so the file version is newer
            Write-Host "アップデートが利用可能です。現在のバージョンは、 `"$($batVersion)`"で、アップデートされたバージョンは `"$($fileVersion)`"です。" `n
            Start-Sleep 1
            powershell {$h=Get-Host;$w=$h.UI.RawUI;$s=$w.BufferSize;$s.height=62;$w.BufferSize=$s;}
try{if($env:wmodetoggle -eq "false"){Write-Host "チェンジログ :" -foregroundcolor white}elseif($env:wmodetoggle -eq "true"){Write-Host "チェンジログ :" -foregroundcolor black }else{Write-Host "チェンジログ :" -foregroundcolor white};$e=[char]27;$clr="$e[7m";$clred="$e[91m";$clrgrn="$e[92m";$clryel="$e[93m";$clrmag="$e[95m";$clrgra="$e[90m";$clrcyan="$e[96m";$c="$e[0m";if($env:wmodetoggle -eq "true"){$clr="$e[100m$e[97m";$c="$e[0m$e[107m$e[30m"};foreach($s in (irm -Uri "https://api.github.com/repos/tamago1908/Cursor-Changer.bat/releases/latest").body -split '\r\n'){if($s -match "####"){write-host "$clrcyan$e[1m$($s -replace '(^\#+)|(\#+$)', '')$c" `n -NoNewline}elseif($s -match ">"){write-host "$clred$($s -replace '\>', '')$c" `n -NoNewline}elseif($s -match "###"){write-host "$clryel$e[1m$($s -replace '(^\#+)|(\#+$)', '')$c" `n -NoNewline}elseif($s -match "___"){write-host "$clrgra--------------------------------------------------$c" `n -NoNewline}else{$s=$s -replace "\*{3}(.+?)\*{3}", "$e[3m;1m`$1$c";$s=$s -replace "\*{2}(.+?)\*{2}", "$e[1m`$1$c";$s=$s -replace "^\s*-(\s+)(.*)", "$clred-$c`$1`$2";$s=$s -replace "\*+", "";write-host "$s" `n -NoNewline}};write-host "";rv e,clr,clred,clrgrn,clryel,clrmag,clrgra,clrcyan,c,s}catch{if($_.Exception.Response.StatusCode.Value__ -eq 403){Write-Host "[ERROR] githubのAPIレート制限に到達しました。これが意味するのは要するに、一時間以内に大量にアップデートを確認し過ぎ、ということです。一時間ほど間を置いたのち、再度アップデートを確認してください。" -foregroundcolor red}else{Write-Host "[ERROR] 何らかのエラーが発生しました。インターネット接続を確認するか、githubのサーバーが落ちていないかを確認したのち、再度試してください。`nエラーログ : $_" -foregroundcolor red};break}
            Start-Sleep 2

             if ($isFileBeta -eq "true") {
            $e=[char]27
            $clrgra="$e[90m"
            $c="$e[0m"
            Write-Host "$clrgra[TIP] このアップデートはベータ版です。なので、一部不安定な部分がある可能性があります。$c"
            rv clrgra,c,e
            }

            $answer = Read-Host "アップデートしますか？尚、アップデートをインストールすると強制的に英語版へと変更されます。 (y or n)"
            if ($answer -eq "y") {
                $downloadFolder = Join-Path $env:USERPROFILE "Downloads"
                $downloadFile = Join-Path $downloadFolder $file.name
                Invoke-WebRequest -Uri $file.url -OutFile $downloadFile -Headers @{'Accept'='application/octet-stream'}
                $newBatName = "Cursor.Changer.$fileVersion.bat"
                Move-Item $downloadFile (Join-Path (Split-Path $batName) ("$newBatName")) -Force
                Remove-Item "Cursor.Changer.$batVersion.bat" -Force

                Write-Host "アップデートは完了しました。"
                Start-Sleep 2

                break
            }
            else {
                Write-Host "アップデートをキャンセルしました。"
                Start-Sleep 2
                break
            }
        }
        elseif (-not $isFileBeta -and $isBatBeta) {
            # The file version is not beta and the bat version is beta, so the bat version is newer
            Write-Host "[ERROR] あなたのバージョン(`"$($batVersion)`")は、アップデートファイルよりも先行 (`"$($fileVersion)`")しています！(恐らく、あなたはカーソル替えのバージョンを故意に変えたのでしょう...)" -ForegroundColor Red 
            Start-Sleep 2
            break
        }
    }
}

    if ($i -eq [Math]::Max($fileverArray.Length, $batverArray.Length)) {
        Write-Host "すでに最新バージョンです！ (`"$($batVersion)`") アップデートは必要ありません。"
        Start-Sleep 2
    }
}

function OOBEMusic {
$webClient = New-Object System.Net.WebClient
Write-Host "音楽をダウンロード中..."
try{$data = $webClient.DownloadData("https://raw.githubusercontent.com/tamago1908/Cursor-Changer.bat/main/resource/Windows_XP_OOBE_for_Cursor_Changer.wav")
}catch{if($_.Exception.Response.StatusCode.Value__ -eq 403){Write-Host "[ERROR] githubのAPIレートリミットに到達しました！これが意味するのは要するにあなたは音楽を再生し過ぎたということです。音楽なしで続行するか、一時間ほど後にもう一度やり直してください。" -foregroundcolor red}else{Write-Host "[ERROR] 何らかのエラーが発生しました。インターネット接続を確認するか、githubのサーバーが落ちていないかを確認したのち、再度試してください。`nエラーログ : $_" -foregroundcolor red};write-host "enter something to exit...";$host.UI.RawUI.ReadKey();exit}
Write-Host "ダウンロード成功！    たぶん....."
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
Write-Host "音楽を再生しています...(現在流れているWindows XP OOBE BGM)`n音楽を止めたい場合、このpowershellウィンドウを終了してください。"
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

rem 本処理
:batbootdisabledexitbutton
set startline=&set endline=&set exitbuttondisabled=
if {%bootbatnow%}=={no} (set batbootpowershell=&exit /b)
if "%batbootpowershell%"=="OOBEMusic" (set batbootpowershell=&exit /b)
set batbootpowershell=

rem get updater variable
if "%checkupdatetoggle%"=="true" (goto batbootpowershell_get_updater_variable) else (goto batbootpowershell_get_updater_variable_end)

:batbootpowershell_get_updater_variable
rem powershellの戻り値をbatchの変数に変換
setlocal enabledelayedexpansion
if "%updateinfo%"=="null" (goto batbootpowershell_get_updater_variable_end)
for /f "tokens=1-4 delims=," %%a in ("%updateinfo%") do (
  for /f "tokens=1-2 delims==" %%x in ("%%a") do set "%%x=%%y"&for /f "tokens=1-2 delims==" %%x in ("%%b") do set "%%x=%%y"&for /f "tokens=1-2 delims==" %%x in ("%%c") do set "%%x=%%y"&for /f "tokens=1-2 delims==" %%x in ("%%d") do set "%%x=%%y"
)
setlocal disabledelayedexpansion
set updatemyversion=%batver:β=.b% & rem this is so idiot. guess powershell should have used this method to handle the bat version, but it is what it is. However, it is something that needs to be fixed, so I may fix it soon, maybe.
set batverforpowershell=
:batbootpowershell_get_updater_variable_end

set updateinfo=
set checkupdatetoggle=

:batbootpowershell_get_updater_variable_end
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Batbootpowershell is Ended...)
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
rem また、今回のアップデートによって、初回カーソル.txtにもdogcheckが追加されたので、まぁ設定ファイルを途中で削除したりなんてことがしにくくなった。

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
rem カーソル替え設定.txtに含まれている設定が全部欠損している場合は、カーソル替え設定.txtを作成しなおす機能。
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
echo [%linuxishclr%info%linuxishclr2%] Bootloader ended.&echo.
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Mobas_Loader Calling...&echo.)
)
)
rem Detects whether this is the first start
if exist カーソル替え設定.txt set firststartbat=no&set bootbatnow=yes&goto :batstart
if not exist カーソル替え設定.txt (
if exist 初回カーソル.txt goto settingloads
)


:CursorChangerOOBE_Animation
setlocal enabledelayedexpansion
rem Play CursorChangerOOBE_Animations that appear slowly
if not defined invisiblecursor (echo [?25l&set invisiblecursor=true)
cls
set /a clr+=10
set clresc=%clr%;%clr%;%clr%
set "clr1=[38;2;%clresc%m                      カーソル替え %batver% へようこそ [0m"
echo.
echo %clr1%
if "%clr%" == "200" (ping -n 3 localhost>nul&set clr=&goto :CursorChangerOOBE_Animation2) else (
    ping -n 1 localhost>nul
)
goto :CursorChangerOOBE_Animation
:CursorChangerOOBE_Animation2
rem Play CursorChangerOOBE_Animations that appear slowly but more darker
cls
set /a clr+=10
set clresc=%clr%;%clr%;%clr%
set "clr2=[38;2;%clresc%m                         [何かキーを押して始める] [0m"
echo.
echo %clr1%
echo.& echo.
echo %clr2%
if "%clr%" == "120" (
    set clresc=&pause >nul&cls&echo.&echo %clr1%&ping -n 2 localhost>nul
    set clrmove=22&set clr2=&set clresc=204;204;204
    goto :CursorChangerOOBE_Animation3
) else (
    ping -n 1 localhost>nul
    goto :CursorChangerOOBE_Animation2
)
:CursorChangerOOBE_Animation3
rem Play CursorChangerOOBE_Animations that move left
cls
set /a clrmove-=2
set "clr1=[2;%clrmove%H[38;2;%clresc%mカーソル替え %batver% へようこそ [0m"
echo %clr1%
if "%clrmove%" == "4" (
    goto :CursorChangerOOBE_Animation4
) else (
    ping -n 1 localhost>nul
    goto :CursorChangerOOBE_Animation3
)
:CursorChangerOOBE_Animation4
rem WOW IT CHANGED INTO SETUP!!!!!!!!!
ping -n 2 localhost>nul&cls
set "clr1=[38;2;%clresc%m  カーソル替え %batver% セットアップ [0m"
echo.
echo %clr1%
ping -n 2 localhost>nul
set clr1=&set clresc=&set clrmove=&set clr2=&set clr=

:CursorChangerOOBEdev
rem Now, it's the beginning of a fucking trashy long goofy ahh idiot code.
title カーソル替え %batver% Setup
if not defined dummy (set clr=[3m[97m&set clrhigh=[7m&set clrhighend=[0m&set clrwhi=[48;5;250m[30m&set clr2=[0m&set clrgra=[90m)
if not defined dummy (set moveline=[22;0H) else (set moveline=[22;0H)
if not defined invisiblecursor (echo [?25l&set invisiblecursor=true)
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
if %ErrorLevel%==1 goto OOBEmain
if %ErrorLevel%==2 goto OOBESkip
if %ErrorLevel%==3 call :OOBEmainblank&timeout /t 1 /nobreak >nul&exit

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
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&set oobetheme=dark&set OOBEsetting1toggle=true&set OOBEsetting2toggle=false&set OOBEsetting3toggle=false&set OOBEsetting4toggle=true&set OOBEsetting5toggle=true&goto OOBEmain8
if %ErrorLevel%==2 color 07&cls&goto CursorChangerOOBEdev
if %ErrorLevel%==3 color 07&cls&goto CursorChangerOOBEdev

:OOBEmain
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
echo          この機能にはインターネット接続が必要です。
echo          インターネット接続がない場合にはNキーを押してください。
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
echo          インターネット接続があるかどうか
echo          アンチウィルスソフトを確認する
echo          Githubが有効かどうか確認する
echo          GithubのAPIレート制限に到達していないかどうか
echo          Powershellが利用可能かどうか
echo.
echo          (5秒後にセットアップを続行します)
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
echo          カーソル替え設定.txtと初回カーソル.txtの二つです。
echo.
echo          カーソル替え設定.txtはカーソル替えの設定を保存しています。
echo          このファイルは非常に重要なファイルです。
echo.
echo          初回カーソル.txtはカーソルを変更したかどうかの判定に利用しています。
echo          これもまた重要なファイルです。
echo.
echo          もしユーザー(%USERNAME%、あなたです)がこれらのファイルを削除すると、
echo          このカーソル替えは正常に動作しなくなる場合があります。
echo          ですから、これらのファイルを絶対に削除しないでください。絶対に。
echo.
echo          (Y キーで続行)
echo.
set /p nothing=%clr2%%clrwhi%     Y=続行                                                                  1/3%moveline%%clrwhi% <nul&choice /c Y /n >nul
if %ErrorLevel%==1 goto OOBEmain3


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
if %ErrorLevel%==1 goto OOBEmain4


:OOBEmain4
color 07
cls
echo.
echo   カーソル替え %batver% セットアップ
echo ====================================O
echo セットアップ進捗 : 1/5 (注意事項の確認)
echo.
echo.
echo          このカーソル替えはWindows 10 1511以降での動作を推奨しています。
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
echo セットアップ進捗 : 2/5 (カーソル替えの確認)
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
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto OOBEmain6
if %ErrorLevel%==2 goto OOBEmain5ifno


:OOBEmain5ifno
color 07
cls
echo.
echo   カーソル替え %batver% セットアップ
echo ====================================O
echo セットアップ進捗 : 2/5 (カーソル替えの確認)
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
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto OOBEmain6
if %ErrorLevel%==2 call :OOBEmainblank & timeout /t 1 /nobreak >nul&exit



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
if %ErrorLevel%==1 goto OOBEmain6theme1
if %ErrorLevel%==2 call :OOBEmainblank & timeout /t 1 /nobreak >nul&set oobetheme=dark&goto OOBEmain7


:OOBEmain6theme1
if {%OOBEundiscard%}=={true} (call :OOBEmainblank & timeout /t 1 /nobreak >nul&set oobetheme=dark&set OOBEundiscard=&goto OOBEmain7)
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
if %ErrorLevel%==1 goto OOBEmain6theme2
if %ErrorLevel%==2 goto OOBEmain6theme2
if %ErrorLevel%==3 call :OOBEmainblank & timeout /t 1 /nobreak >nul&set oobetheme=dark&goto OOBEmain7
if %ErrorLevel%==4 call :OOBEmainblank & timeout /t 1 /nobreak >nul&set oobetheme=dark&goto OOBEmain7



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
if %ErrorLevel%==1 goto OOBEmain6theme3
if %ErrorLevel%==2 goto OOBEmain6theme3
if %ErrorLevel%==3 set oobetheme=white&call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto OOBEmain7
if %ErrorLevel%==4 set oobetheme=white&call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto OOBEmain7


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
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto OOBEmain7CustomizeSettings
if %ErrorLevel%==2 call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto OOBEmain8

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
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&set OOBEsetting1toggle=true&set OOBEsetting2toggle=false&set OOBEsetting3toggle=false&set OOBEsetting4toggle=true&set OOBEsetting5toggle=true&goto OOBEmain8
if %ErrorLevel%==2 goto OOBEmain7CustomizeSettings1

:OOBEmain7CustomizeSettings
if {%oobetheme%}=={white} (set OOBEsettingclr=[100m[97m&set OOBEsettingclr2=[0m[107m[30m)
if {%oobetheme%}=={dark} (set OOBEsettingclr=[7m&set OOBEsettingclr2=[0m)
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
echo          I 1 変更後の再起動の確認         I
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
set /p nothing=%clr2%%clrwhi%     W,S もしくは 1~5=動かす     Y=切り替え     N,B=破棄                        %moveline%%clrwhi% <nul&choice /c WS12345YNB /n >nul
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
echo   カーソル替え %batver% セットアップ
echo ====================================O
echo セットアップ進捗 : 4/5 (設定のカスタマイズ)
echo.
echo.
echo          O================================O   設定のカスタマイズ
echo          I%OOBEsettingclr% 1 変更後の再起動の確認         %OOBEsettingclr2%I
echo          O================================O   カーソル替えでのカーソルの
echo          I%OOBEsetting2clr% 2 起動時のアドミン             %OOBEsetting2clr2%I   変更時に、再起動を
echo          O================================O   確認する機能の切り替えです。
echo          I%OOBEsetting3clr% 3 起動時に更新確認             %OOBEsetting3clr2%I   もしオンなら、変更時
echo          O================================O   に再起動が確認されます。
echo          I%OOBEsetting4clr% 4 Enterの長押しを検知する機能  %OOBEsetting4clr2%I
echo          O================================O   %clrgra%有効にするのを推奨%OOBEsettingclr2%
echo          I%OOBEsetting5clr% 5 起動時のアニメーション       %OOBEsetting5clr2%I
echo          O================================O
echo                       I  OK  I
echo                       O======O
echo.
echo.
set /p nothing=%clr2%%clrwhi%     W,S もしくは 1~5=動かす     Y=切り替え     N,B=破棄                        %moveline%%clrwhi% <nul&choice /c WS12345YNB /n >nul
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
echo   カーソル替え %batver% セットアップ
echo ====================================O
echo セットアップ進捗 : 4/5 (設定のカスタマイズ)
echo.
echo.
echo          O================================O   設定のカスタマイズ
echo          I%OOBEsetting1clr% 1 変更後の再起動の確認         %OOBEsetting1clr2%I
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
set /p nothing=%clr2%%clrwhi%     W,S もしくは 1~5=動かす     Y=切り替え     N,B=破棄                        %moveline%%clrwhi% <nul&choice /c WS12345YNB /n >nul
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
echo   カーソル替え %batver% セットアップ
echo ====================================O
echo セットアップ進捗 : 4/5 (設定のカスタマイズ)
echo.
echo.
echo          O================================O   設定のカスタマイズ
echo          I%OOBEsetting1clr% 1 変更後の再起動の確認         %OOBEsetting1clr2%I
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
set /p nothing=%clr2%%clrwhi%     W,S もしくは 1~5=動かす     Y=切り替え     N,B=破棄                        %moveline%%clrwhi% <nul&choice /c WS12345YNB /n >nul
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
echo   カーソル替え %batver% セットアップ
echo ====================================O
echo セットアップ進捗 : 4/5 (設定のカスタマイズ)
echo.
echo.
echo          O================================O   設定のカスタマイズ
echo          I%OOBEsetting1clr% 1 変更後の再起動の確認         %OOBEsetting1clr2%I
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
set /p nothing=%clr2%%clrwhi%     W,S もしくは 1~5=動かす     Y=切り替え     N,B=破棄                        %moveline%%clrwhi% <nul&choice /c WS12345YNB /n >nul
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
echo   カーソル替え %batver% セットアップ
echo ====================================O
echo セットアップ進捗 : 4/5 (設定のカスタマイズ)
echo.
echo.
echo          O================================O   設定のカスタマイズ
echo          I%OOBEsetting1clr% 1 変更後の再起動の確認         %OOBEsetting1clr2%I
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
set /p nothing=%clr2%%clrwhi%     W,S もしくは 1~5=動かす     Y=切り替え     N,B=破棄                        %moveline%%clrwhi% <nul&choice /c WS12345YNB /n >nul
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
echo   カーソル替え %batver% セットアップ
echo ====================================O
echo セットアップ進捗 : 4/5 (設定のカスタマイズ)
echo.
echo.
echo          O================================O   設定のカスタマイズ
echo          I%OOBEsetting1clr% 1 変更後の再起動の確認         %OOBEsetting1clr2%I
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
set /p nothing=%clr2%%clrwhi%     W,S もしくは 1~5=動かす     Y=切り替え     N,B=破棄                        %moveline%%clrwhi% <nul&choice /c WS12345YNB /n >nul
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
echo   カーソル替え %batver% セットアップ
echo ====================================O
echo セットアップ進捗 : 4/5 (設定のカスタマイズ)
echo.
echo.
echo          設定のカスタマイズ :
echo.
echo          1 変更後の再起動の確認        : %OOBEsetting1toggle% %clrgra%(trueが推奨)%OOBEsettingclr2%
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
if %ErrorLevel%==1 if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto OOBEmain8
if %ErrorLevel%==2 goto OOBEmain7CustomizeSettings1

:OOBEmain8
if "%oobetheme%"=="white" (color f0) else (color 07)
rem setting written, well, wtf is this?? so many goofy ahh if statement. hell no NOT AGAIN!!!!!!!!!!!!
if not exist カーソル替え設定.txt (
    type nul > カーソル替え設定.txt
    echo nodogcheckfor1234567890qwertyuiop >> カーソル替え設定.txt 

    if "%OOBEsetting1toggle%"=="false" (
echo rebootokey=false >> カーソル替え設定.txt
    ) else if "%OOBEsetting1toggle%"=="true" (
        echo rebootokey=true >> カーソル替え設定.txt
    ) else (echo rebootokey=true >> カーソル替え設定.txt)

    if "%OOBEsetting2toggle%"=="false" (
echo admin=false >> カーソル替え設定.txt
    ) else if "%OOBEsetting2toggle%"=="true" (
        echo admin=true >> カーソル替え設定.txt
    ) else (echo admin=false >> カーソル替え設定.txt)

    if "%OOBEsetting3toggle%"=="false" (
echo CheckUpdate=false >> カーソル替え設定.txt
    ) else if "%OOBEsetting3toggle%"=="true" (
        echo CheckUpdate=true >> カーソル替え設定.txt
    ) else (echo CheckUpdate=false >> カーソル替え設定.txt)

    if "%OOBEsetting4toggle%"=="false" (
echo hatenakeikoku=false >> カーソル替え設定.txt
    ) else if "%OOBEsetting4toggle%"=="true" (
        echo hatenakeikoku=true >> カーソル替え設定.txt
    ) else (echo hatenakeikoku=true >> カーソル替え設定.txt)

    if "%OOBEsetting5toggle%"=="false" (
echo bootanimation=false >> カーソル替え設定.txt
    ) else if "%OOBEsetting5toggle%"=="true" (
        echo bootanimation=true >> カーソル替え設定.txt
    ) else (echo bootanimation=true >> カーソル替え設定.txt)
    
    if "%OOBEtheme%"=="dark" (
echo wmode=false >> カーソル替え設定.txt
    ) else if "%OOBEtheme%"=="white" (
        echo wmode=true >> カーソル替え設定.txt
    ) else (echo wmode=false >> カーソル替え設定.txt)
    echo s5_linuxboot=false >> カーソル替え.txt
    echo s5_simpleboot=false >> カーソル替え.txt
    echo s5_rawboot=false >> カーソル替え.txt

if not exist 初回カーソル.txt (
type nul > 初回カーソル.txt
echo nodogcheckforfastboot >> 初回カーソル.txt
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
set clr1=&set clresc=&set clrmove=&set clr2=&set clr=
2>nul taskkill /im powershell.exe >nul
exit /b



:Cursor_Changer_REmenu
rem recovery menu for cursor changer, and recovery console
cls
mode con: cols=75 lines=25
color 07
set bootbatnow=no
if defined bootbatnow (set clr=[7m&set clr2=[0m) else (set clr=[7m&set clr2=[0m)
echo リカバリーメニューを読み込み中...
timeout /t 2 /nobreak >nul
title カーソル替え リカバリーメニュー
cls
echo                     カーソル替え %batver% リカバリーメニュー %debugmode%               
echo.
echo                                    再起動
echo                                 設定の初期化  
echo                             リカバリーコンソール 
echo                                     退出    
echo.
echo                    1から4、またはWSで選択、EかYで決定します。
echo                       現在、何も選択されていません。
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
title カーソル替え リカバリーメニュー
echo                     カーソル替え %batver% リカバリーメニュー %debugmode%                
echo.
echo                            %clr%        再起動        %clr2%
echo                                 設定の初期化    
echo                             リカバリーコンソール 
echo                                     退出    
echo.
echo                    1から4、またはWSで選択、EかYで決定します。  
echo                          カーソル替えの再起動。通常は
echo                              これがおすすめです。
echo.
choice /c 1234WSYE /n 
if %ErrorLevel%==1 goto :Cursor_Changer_REmenu1
if %ErrorLevel%==2 goto :Cursor_Changer_REmenu2
if %ErrorLevel%==3 goto :Cursor_Changer_REmenu3
if %ErrorLevel%==4 goto :Cursor_Changer_REmenu4
if %ErrorLevel%==5 goto :Cursor_Changer_REmenu1
if %ErrorLevel%==6 goto :Cursor_Changer_REmenu2
if %ErrorLevel%==7 set runningfromfulldebug=&set FromREConsole=&goto :batrestart
if %ErrorLevel%==8 set runningfromfulldebug=&set FromREConsole=&goto :batrestart
pause

:Cursor_Changer_REmenu2
cls
title カーソル替え リカバリーメニュー
echo                     カーソル替え %batver% リカバリーメニュー %debugmode%                
echo.
echo                                    再起動       
echo                            %clr%     設定の初期化     %clr2%
echo                             リカバリーコンソール 
echo                                     退出    
echo.
echo                    1から4、またはWSで選択、EかYで決定します。  
echo                             設定を初期値に戻します。
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
title カーソル替え リカバリーメニュー
echo                     カーソル替え %batver% リカバリーメニュー %debugmode%                
echo.
echo                                    再起動       
echo                                 設定の初期化    
echo                            %clr% リカバリーコンソール %clr2%
echo                                     退出    
echo.
echo                    1から4、またはWSで選択、EかYで決定します。  
echo                      リカバリーコンソールにアクセスします。
echo               リカバリーコンソールでは、メインメニューで利用可能な
echo                   デバッグ目的のコマンドがすべて利用可能です。
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
title カーソル替え リカバリーメニュー
echo                     カーソル替え %batver% リカバリーメニュー %debugmode%                
echo.
echo                                    再起動       
echo                                 設定の初期化    
echo                             リカバリーコンソール   
echo                            %clr%         退出         %clr2%
echo.
echo                    1から4、またはWSで選択、EかYで決定します。  
echo                        リカバリーメニューから退出します。
echo                               (シャットダウン)
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
title カーソル替え リカバリーメニュー
echo                     カーソル替え %batver% リカバリーメニュー %debugmode%                
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
if %ErrorLevel%==2 goto :Cursor_Changer_REmenu2

:Cursor_Changer_REWipeYippeee
cls
title カーソル替え リカバリーメニュー
echo                     カーソル替え %batver% リカバリーメニュー %debugmode%                
echo.
echo.  
echo                               設定の初期化は
echo                             正常に完了しました。
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
if not defined dummy (set clr=[7m&set clr2=[0m) else (set clr=[7m&set clr2=[0m)
echo リカバリーコンソールを読み込んでいます...
timeout /t 2 /nobreak >nul
cls
:Cursor_Changer_REConsolemain
title カーソル替え リカバリーコンソール
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
echo                                  実行したいコマンドを入力してください。
echo                                         inspectentirecommandlist
echo                                         で全コマンドリストを参照。
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
if {%selected%}=={inspectentirecommandlist} (goto :allcommands)
if {%selected%}=={exit} (set FromREConsole=&exit /b)
if {%selected%}=={alldefnow1} (goto :AllDefult1)
if {%selected%}=={playdefboot} (set hatenakeikoku=0&cls&goto :firstboot)
if {%selected%}=={debugyesnow} (goto :kurogo)
if {%selected%}=={fulldebug} (goto fulldebug)
if {%selected%}=={getadmin} (goto :batstartadm)
if {%selected%}=={restoresetting} (
call :Wipealldeta
echo 完了。何かキーを押して続行...
pause >nul
)
if {%selected%}=={alldefdeletebat} (set hatenakeikoku=0&echo delete bat, confirm to type something...&pause&goto alldefdeletefinish5)
if {%selected%}=={windowsfiltertest} (goto :batbootcheckwinverbad)
if {%selected%}=={funanimationdeb} (goto :batbootanimationfun)
if {%selected%}=={openie} (goto :openiedev)
if {%selected%}=={setenter} (echo.&set /p hatenakeikoku=pls type:&goto :hazimeboot) else (set selected= &echo 有効なコマンドを入力してください。&goto Cursor_Changer_REConsoleask)


rem O========================================= OOBE and Receovery Code Ended =================================================O


:Wipealldeta
rem Wipe Setting file
echo nodogcheckfor1234567890qwertyuiop > カーソル替え.txt
echo CheckUpdate=false >> カーソル替え.txt
echo wmode=false >> カーソル替え.txt
echo admin=false >> カーソル替え.txt
echo rebootokey=true >> カーソル替え.txt
echo typosWarning=true >> カーソル替え.txt
echo bootanimation=true >> カーソル替え.txt
echo s5_linuxboot=false >> カーソル替え.txt
echo s5_simpleboot=false >> カーソル替え.txt
echo s5_rawboot=false >> カーソル替え.txt
exit /b


rem Detects settings related to prompts for administrative privileges,
:batstart
if "%linuxboot%"=="false" (mode con: cols=75 lines=25)
if {%settingbypass%}=={true} (goto hazimemenuskipboot)
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] admin checked.) else (cls)
rem 管理者権限設定の検知
find "admin=true" カーソル替え設定.txt > nul
if {%adminbypass%}=={true} (goto gotadmin)
if {%errorlevel%}=={0} (goto batstartadm)
if {%errorlevel%}=={1} (
set batloadprgs=0
call :MOBAS_Loader
goto batstarttest2
)

:batstarttest2
if "%linuxboot%"=="false" (cls)
find "admin=false" カーソル替え設定.txt > nul
set batloadprgs=0
call :MOBAS_Loader
if {%errorlevel%}=={0} (goto hazime)
if {%errorlevel%}=={1} (goto batstartadm)



:batstartadm
cls
rem 管理者権限の取得
echo copyright.カーソル替え%batver% by tamago_1908
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
powershell -NoProfile -Command "Start-Process '%batpath%' -Verb RunAs" >nul && exit
echo.
echo 管理者権限の要求が拒否されました。
echo ^(ヒント: 管理者権限の要求は設定で無効にできます。^)
timeout /t 2 /nobreak >nul
:gotAdmin
cls
pushd "%CD%"
goto :hazime



:hazime
if {%alldefentered%}=={true} (
set alldefno2clr=
set alldefno2clr2=
set alldefclr=
set alldefclr2=
set alldefentered=
)
if {%settingbypass%}=={true} (goto hazimemenuskipboot)
rem 設定とその他のロード
rem 何を読み込み、読み込んだ後どこにgotoしたいかを変数に代入必要 set wantload=setting1 set whatloadgoto=hazime 等 hazime関係の場合はそれオンリー
rem カーソルの色に関してはメインの変更部分には実装していません。変更してからhazimeに戻って来れるように設計してないので。
rem 設定を追加する場合は基本コピペで大丈夫。ただ、メニューの見た目とかにかかわるものではコードを追加しないといけないかも
:settingloads
cd /d %batchmainpath%
if not exist カーソル替え設定.txt (
cls
title カーソルエラー
echo 設定ファイルが存在しません。
pause
echo 恐らく、初回起動をした際にそのままカーソル替えを閉じてから再起動してしまったのが原因でしょう。それか、故意に設定ファイルを消去したか...少なくとも、設定ファイルが存在しないのは事実です。
pause
cls
echo 設定ファイルを再生成します。いままでの設定はすべて削除されます。
pause
cls
call :Wipealldeta
title ...
echo 再生成が完了しました。
pause
echo 変更を適用するため、カーソル替えを再起動してください。
pause
exit
)
if not exist FirstCursor.txt (
type nul > FirstCursor.txt
echo nodogcheckforfastboot >> FirstCursor.txt
)


if {%bootbatnow%}=={no} (goto whatload) else (goto setting1load)
:setting1load
rem ホワイトモードの検知と色の変更。変更の高速化のため序盤に配置。
set allsettingerror=0
find "rebootokey=true" カーソル替え設定.txt > nul
if %ErrorLevel%==0 set setting1onoff=有効
if %ErrorLevel%==1 goto setting1load2
if {%bootbatnow%}=={yes} (
    if "%linuxboot%"=="true" if not "%bootbatnow%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Setting1 Loaded.)
set batloadprgs=1
call :MOBAS_Loader
goto setting2load
)
goto whatloadgoto


:setting2load
find "admin=true" カーソル替え設定.txt > nul
if %ErrorLevel%==0 set setting2onoff=有効
if %ErrorLevel%==1 goto setting2load2
if {%bootbatnow%}=={yes} (
    if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Setting2 Loaded.)
set batloadprgs=2
call :MOBAS_Loader
goto setting3load
) 
goto whatloadgoto

:setting3load
find "CheckUpdate=true" カーソル替え設定.txt > nul
if %ErrorLevel%==0 set setting3onoff=有効
if %ErrorLevel%==1 goto setting3load2
if {%bootbatnow%}=={yes} (
    if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Setting3 Loaded.)
set batloadprgs=3
call :MOBAS_Loader
goto setting4load
) 
goto whatloadgoto

:setting4load
find "hatenakeikoku=true" カーソル替え設定.txt > nul
if %ErrorLevel%==0 set setting4onoff=有効
if %ErrorLevel%==1 goto setting4load2
if {%bootbatnow%}=={yes} (
    if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Setting4 Loaded.)
set batloadprgs=4
call :MOBAS_Loader
goto setting5load
) 
goto whatloadgoto

:setting5load
find "bootanimation=true" カーソル替え設定.txt > nul
if %ErrorLevel%==0 set setting5onoff=有効
if %ErrorLevel%==1 goto setting5load2
if {%bootbatnow%}=={yes} (
    if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Setting5 Loaded.)
set batloadprgs=5
call :MOBAS_Loader
goto setting5_s1load
) 
goto whatloadgoto


:setting5_s1load
find "s5_linuxboot=true" カーソル替え.txt > nul
if %ErrorLevel%==0 set setting5_s1onoff=有効
if %ErrorLevel%==1 goto setting5_s1load2
if {%bootbatnow%}=={yes} (
    if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Setting5_1 Loaded.)
set batloadprgs=5
call :MOBAS_Loader
goto setting5_s2load
) 
goto whatloadgoto

:setting5_s2load
find "s5_simpleboot=true" カーソル替え.txt > nul
if %ErrorLevel%==0 set setting5_s2onoff=有効
if %ErrorLevel%==1 goto setting5_s2load2
if {%bootbatnow%}=={yes} (
    if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Setting5_2 Loaded.)
set batloadprgs=5
call :MOBAS_Loader
goto setting5_s3load
) 
goto whatloadgoto

:setting5_s3load
find "s5_rawboot=true" カーソル替え.txt > nul
if %ErrorLevel%==0 set setting5_s3onoff=有効
if %ErrorLevel%==1 goto setting5_s3load2
if {%bootbatnow%}=={yes} (
    if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Setting5_3 Loaded.)
set batloadprgs=5
call :MOBAS_Loader
goto wmodeload
) 
goto whatloadgoto

:wmodeload
find "wmode=true" カーソル替え設定.txt > nul
if {%ErrorLevel%}=={0} (set wmodeonoff=ダークテーマに変更  &set wmodetoggle=true)
if {%ErrorLevel%}=={1} (goto wmodeload2)
if {%bootbatnow%}=={yes} (
    if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Wmode Loaded.)
set batloadprgs=6
call :MOBAS_Loader
goto loads
) 
goto whatloadgoto

:allsettingtest
rem 設定の欠損を検証
:setting1load2
    if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting1 is not the true. Loaded.)
find "rebootokey=false" カーソル替え設定.txt > nul
if %ErrorLevel%==0 (set setting1onoff=無効) else if %ErrorLevel%==1 set setting1onoff=null&set /a allsettingerror=allsettingerror+1
if {%bootbatnow%}=={yes} (set batloadprgs=1&call :MOBAS_Loader)
if {%bootbatnow%}=={yes} (goto setting2load) else (goto whatloadgoto)

:setting2load2
    if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting2 is not the true. Loaded.)
find "admin=false" カーソル替え設定.txt > nul
if %ErrorLevel%==0 (set setting2onoff=無効) else if %ErrorLevel%==1 set setting2onoff=null&set /a allsettingerror=allsettingerror+1
if {%bootbatnow%}=={yes} (set batloadprgs=2&call :MOBAS_Loader)
if {%bootbatnow%}=={yes} (goto setting3load) else (goto whatloadgoto)

:setting3load2
    if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting3 is not the true. Loaded.)
find "CheckUpdate=false" カーソル替え設定.txt > nul
if %ErrorLevel%==0 (set setting3onoff=無効) else if %ErrorLevel%==1 set setting3onoff=null&set /a allsettingerror=allsettingerror+1
if {%bootbatnow%}=={yes} (set batloadprgs=3&call :MOBAS_Loader)
if {%bootbatnow%}=={yes} (goto setting4load) else (goto whatloadgoto)

:setting4load2
    if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting4 is not the true. Loaded.)
find "hatenakeikoku=false" カーソル替え設定.txt > nul
if %ErrorLevel%==0 (set setting4onoff=無効) else if %ErrorLevel%==1 set setting4onoff=null&set /a allsettingerror=allsettingerror+1
if {%bootbatnow%}=={yes} (set batloadprgs=4&call :MOBAS_Loader)
if {%bootbatnow%}=={yes} (goto setting5load) else (goto whatloadgoto)

:setting5load2
    if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting5 is not the true. Loaded.)
find "bootanimation=false" カーソル替え設定.txt > nul
if %ErrorLevel%==0 (set setting5onoff=無効) else if %ErrorLevel%==1 set setting5onoff=null&set /a allsettingerror=allsettingerror+1
if {%bootbatnow%}=={yes} (set batloadprgs=5&call :MOBAS_Loader)
if {%bootbatnow%}=={yes} (goto setting5_s1load) else (goto whatloadgoto)

:setting5_s1load2
    if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting5_1 is not the true. Loaded.)
find "s5_linuxboot=false" カーソル替え.txt > nul
if %ErrorLevel%==0 (set setting5_s1onoff=無効) else if %ErrorLevel%==1 set setting5_s1onoff= null&set /a allsettingerror=allsettingerror+1
if {%bootbatnow%}=={yes} (set batloadprgs=5&call :MOBAS_Loader)
if {%bootbatnow%}=={yes} (goto setting5_s2load) else (goto whatloadgoto)

:setting5_s2load2
    if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting5_2 is not the true. Loaded.)
find "s5_simpleboot=false" カーソル替え.txt > nul
if %ErrorLevel%==0 (set setting5_s2onoff=無効) else if %ErrorLevel%==1 set setting5_s2onoff= null&set /a allsettingerror=allsettingerror+1
if {%bootbatnow%}=={yes} (set batloadprgs=5&call :MOBAS_Loader)
if {%bootbatnow%}=={yes} (goto setting5_s3load) else (goto whatloadgoto)

:setting5_s3load2
    if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting5_3 is not the true. Loaded.)
find "s5_rawboot=false" カーソル替え.txt > nul
if %ErrorLevel%==0 (set setting5_s3onoff=無効) else if %ErrorLevel%==1 set setting5_s3onoff= null&set /a allsettingerror=allsettingerror+1
if {%bootbatnow%}=={yes} (set batloadprgs=5&call :MOBAS_Loader)
if {%bootbatnow%}=={yes} (goto wmodeload) else (goto whatloadgoto)

:wmodeload2
    if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting6 is not the true. Loaded.)
find "wmode=false" カーソル替え設定.txt > nul
if {%ErrorLevel%}=={0} (set wmodeonoff=ホワイトテーマに変更&set wmodetoggle=false) else if {%ErrorLevel%}=={1} (set wmodeonoff=  null  テーマに変更&set wmodetoggle=false&set /a allsettingerror=allsettingerror+1)
if {%bootbatnow%}=={yes} (set batloadprgs=6&call :MOBAS_Loader)
if {%bootbatnow%}=={yes} (goto loads) else (goto whatloadgoto)

:loads
:wmodehazimeload
rem ホワイトモードを検知して色を変更
find "wmode=true" カーソル替え設定.txt > nul
if {%errorlevel%}=={0} (color f0)
if {%bootbatnow%}=={no} (echo 処理中...) else (
    if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] mainmenu theme loaded.)
set batloadprgs=6
call :MOBAS_Loader
goto debughazimeload
)
if {%whatloadgoto%}=={hazime} (goto hazimemenu)
goto debughazimeload

:debughazimeload
rem デバックモードの検知
find "debug=true" カーソル替え設定.txt > nul
if {%errorlevel%}=={0} (echo on&set debugmode=debugmode)
if {%errorlevel%}=={1} (echo off&set debugmode=)
if {%bootbatnow%}=={no} (echo 処理中...) else (
    if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Debug mode Loaded.)
set batloadprgs=7
call :MOBAS_Loader
goto :firststarttest
)
if {%1}=={devmode} (set devmode=true&goto firststarttest)
if {%whatloadgoto%}=={hazime} (goto hazimemenu)
goto :firststarttest

:firststarttest
rem detect firstcursor.txt
setlocal enabledelayedexpansion
if exist 初回カーソル.txt (
find "nodogcheckforfastboot" 初回カーソル.txt > nul
if "!ErrorLevel!"=="1" (
set FirstCursorisEdited=true
    )
)
setlocal disabledelayedexpansion
if {%bootbatnow%}=={no} (echo 処理中...) else (
    if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] FirstCursor.txt is Loaded.)
set batloadprgs=8
call :MOBAS_Loader
goto cursorcolorload
)
if {%whatloadgoto%}=={hazime} (goto hazimemenu)
goto cursorcolorload

:cursorcolorload
rem カーソルの色を検知
rem 0x0は白
rem 0x2は黒
reg query "HKEY_CURRENT_USER\Control Panel\Cursors" /v "Scheme Source" | find "0x0" > nul
if {%ErrorLevel%}=={0} (set cursorcolor=黒)
if {%ErrorLevel%}=={1} (set cursorcolor=白)
if {%bootbatnow%}=={no} (echo 処理中...) else (
    if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Cursor Color is Loaded.)
set batloadprgs=9
call :MOBAS_Loader
goto hazimecursorcolor2
)
if {%whatloadgoto%}=={hazime} (goto hazimemenu)

:hazimecursorcolor2
reg query "HKEY_CURRENT_USER\Control Panel\Cursors" /v "Scheme Source" | find "0x2" > nul
if {%ErrorLevel%}=={0} (set cursorcolor=白)
if {%bootbatnow%}=={no} (echo 処理中...) else (
    if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Menu stuff All Loaded.)
set batloadprgs=10
call :MOBAS_Loader
goto :MOBAS_Loader_initializeVaribale
)
if {%whatloadgoto%}=={hazime} (goto hazimemenu)
goto hazimemenu


:MOBAS_Loader
if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Mobas_Loader Running...)
rem ブートアニメーション。
rem 下は読み込み時のテキスト分岐。
if {%bootbatnow%}=={no} (cls & title カーソル設定 処理中... & echo 処理中... & goto whatload) else (title 起動中...)
if {%simpleboot%}=={true} (cls & echo 起動中...& exit /b)
if {%wmodetoggle%}=={false} (set loadscrnprgsclr=[7m&set loadscrnprgsclrgra=[48;5;244m&set loadscrnprgsclr2=[0m&set back_to_the_firstline=[18;0H)
if {%wmodetoggle%}=={true} (set loadscrnprgsclr=[47m[97m&set loadscrnprgsclrgra=[48;5;244m&set loadscrnprgsclr2=[0m[107m[30m&set back_to_the_firstline=[18;0H) else (set loadscrnprgsclr=[7m&set loadscrnprgsclrgra=[48;5;244m&set loadscrnprgsclr2=[0m&set back_to_the_firstline=[18;0H)
if not defined invisiblecursor (echo [?25l&set invisiblecursor=true)

rem goofy ahh code
setlocal enabledelayedexpansion&if "!batloadprgs!" gtr "0" (set /a batloadprgsdelete=!batloadprgs!-1&set loadscrnprgs!batloadprgsdelete!=)&setlocal disabledelayedexpansion
call :MOBAS_Loader_prgbar %batloadprgs%&goto :MOBAS_Loader_prgbar_Main
:MOBAS_Loader_prgbar
if {%1}=={0} (set loadscrnprgs0=%loadscrnprgsclrgra%                                                     %loadscrnprgsclr2%&exit /b)
if {%1}=={1} (set loadscrnprgs1=%loadscrnprgsclr%   %loadscrnprgsclr2%%loadscrnprgsclrgra%                                                  %loadscrnprgsclr2%&exit /b)
if {%1}=={2} (set loadscrnprgs2=%loadscrnprgsclr%       %loadscrnprgsclr2%%loadscrnprgsclrgra%                                              %loadscrnprgsclr2%&exit /b)
if {%1}=={3} (set loadscrnprgs3=%loadscrnprgsclr%           %loadscrnprgsclr2%%loadscrnprgsclrgra%                                          %loadscrnprgsclr2%&exit /b)
if {%1}=={4} (set loadscrnprgs4=%loadscrnprgsclr%                %loadscrnprgsclr2%%loadscrnprgsclrgra%                                     %loadscrnprgsclr2%&exit /b)
if {%1}=={5} (set loadscrnprgs5=%loadscrnprgsclr%                     %loadscrnprgsclr2%%loadscrnprgsclrgra%                                %loadscrnprgsclr2%&exit /b)
if {%1}=={6} (set loadscrnprgs6=%loadscrnprgsclr%                           %loadscrnprgsclr2%%loadscrnprgsclrgra%                          %loadscrnprgsclr2%&exit /b)
if {%1}=={7} (set loadscrnprgs7=%loadscrnprgsclr%                                  %loadscrnprgsclr2%%loadscrnprgsclrgra%                   %loadscrnprgsclr2%&exit /b)
if {%1}=={8} (set loadscrnprgs8=%loadscrnprgsclr%                                         %loadscrnprgsclr2%%loadscrnprgsclrgra%            %loadscrnprgsclr2%&exit /b)
if {%1}=={9} (set loadscrnprgs9=%loadscrnprgsclr%                                                %loadscrnprgsclr2%%loadscrnprgsclrgra%     %loadscrnprgsclr2%&exit /b)
if {%1}=={10} (set loadscrnprgs10=%loadscrnprgsclr%                                                     %loadscrnprgsclr2%&exit /b)
:MOBAS_Loader_prgbar_Main
if not "%linuxboot%"=="true" (
echo %back_to_the_firstline%
echo O=========================================================================O
echo.
echo                       カーソル替えを読み込んでいます...
echo           O=====================================================O
echo           I%loadscrnprgs0%%loadscrnprgs1%%loadscrnprgs2%%loadscrnprgs3%%loadscrnprgs4%%loadscrnprgs5%%loadscrnprgs6%%loadscrnprgs7%%loadscrnprgs8%%loadscrnprgs9%%loadscrnprgs10%I
echo           O=====================================================O
rem 37 全角
rem 74 半角
)
exit /b

:MOBAS_Loader_initializeVaribale
set loadscrnprgs9=&set loadscrnprgs10=&set loadscrnprgsclr=&set loadscrnprgsclr2=&set loadscrnprgsclrgra=
set batloadprgsdelete=&set back_to_the_firstline=
goto hazimemenu

:whatload

rem ここの処理、いるかなぁ？普通にsettingの値が欲しいだけならsetting1loadとかにgotoしたうえで行き先をwhatloadgotoに代入すれば動くと思うんだけど....
if {%wantload%}=={setting1} (goto setting1load) 
if {%wantload%}=={setting2} (goto setting2load)
if {%wantload%}=={setting3} (goto setting3load)
if {%wantload%}=={setting4} (goto setting4load)
if {%wantload%}=={setting5} (goto setting5load)
if {%wantload%}=={setting5_1} (goto setting5_s1load&set animationrecheck=true)
if {%wantload%}=={setting5_2} (goto setting5_s2load&set animationrecheck=true)
if {%wantload%}=={setting5_3} (goto setting5_s3load&set animationrecheck=true)
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
if "%animationrecheck%"=="true" (call :batbootloader_animationcheck)
set wantload=
exit /b


:batbootanimation
if "%linuxboot%"=="true" (echo.&echo [%time: =%] O================ Boot End Here ================O&echo.&echo [%linuxishclr%info%linuxishclr2%] Boot Complete.&timeout /t 2 /nobreak >nul)
cls
if {%firststartbat%}=={yes} (goto batbootanimationbypassfun)
find "bootanimation=false" カーソル替え設定.txt > nul
if {%errorlevel%}=={0} (goto checksum)
rem ブートアニメーションを再生。50分の1の確率で別バージョンが再生される。ramdomの仕様(？)によって二回連続でrandomをしないといけない。
set /a bootegg=%random%*51/32767
set /a bootegg2=%random%*51/32767
if {%firststartbat%}=={yes} (goto batbootanimationbypassfun)
if {%bootegg%}=={%bootegg2%} (goto batbootanimationfun)
set bootegg=
set bootegg2=
:batbootanimationbypassfun
title ようこそ
echo.
echo                              カーソル替え%batver% %debugmode%
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
echo ::::: ##.... ##: #########:::: ##::::            ようこそ
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
rem 設定の欠損を確認
goto checksum

:batbootanimationfun
set bootegg=
set bootegg2=
mode con: cols=85 lines=29
find "wmode=true" カーソル替え設定.txt >nul
if {%errorlevel%}=={0} (color f0&set funanimationclr=f0) else (set funanimationclr=07)
cls
title さすがカーソル替え！俺たちにできないことを平然とやってのけるッ！そこにしびれる憧れるぅっ！
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
echo                         カーソル替え%batver% ようこそ 2021-2024 %debugmode%
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


:checksum
if {%invisiblecursor%}=={true} (echo [?25h&set invisiblecursor=)
if not {%allsettingerror%} equ {0} (
    title カーソル欠損
    echo 設定が%allsettingerror%個欠損しています。%allstgerroreastereggmessage%
    echo.
    echo カーソル替えバージョン1.5からバージョン1.9までのバージョンを以前に使用していないことを確認してください。
    echo もしくはカーソル設定.txtの中身を確認してください。
    echo ファイルパスは%batchmainpath%です。
    echo 修復する場合は設定に行き、破損個所の部分の設定の有効/無効を切り替えてください。自動的に補完され修復されます。^(修復の際には、デフォルトの既定値に設定はセットされます。^)
    pause
    )
    if {%allsettingerror%} gtr {3} (goto fixallsetting) else (goto hazimemenu)
echo.
:fixallsetting
rem 自動修復
powershell sleep 2
SET /P selected=自動修復を利用できます。自動修復を実行するとそれまでの設定がすべて初期化され、デフォルトの設定にリセットされます。続行しますか？(yesまたはno):
if {%selected%}=={yes} (
call :Wipealldeta
echo.
echo 修復が完了しました。
pause
exit
)
if {%selected%}=={y} (
:overwritesetting
call :Wipealldeta
echo.
echo 修復が完了しました。
pause
exit
)
if {%selected%}=={no} (hazimemenuskipboot)
if {%selected%}=={n} (hazimemenuskipboot)

goto :hazimemenu


rem メニューの生成の準備
:hazimemenu
if {%bootbatnow%}=={no} (goto hazimemenuskipboot)
if {%bootbatnow%}=={yes} (set bootbatnow=no&goto batbootanimation)
:hazimemenuskipboot
cls
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
rem メニューの描写
title カーソル替え %debugmode% 
echo                              カーソル替え%batver% %debugmode% %hazimebuild%
echo.
echo   O=====================================================================O
echo   I     1カーソルを%cursorcolor%色にする           2電卓              3終了        I
echo   I                                                                     I
echo   I                   4バージョン情報          5設定                    I
echo   O=====================================================================O
echo.
call :hazimeMessages
SET /P selected=任意の実行したい数字、もしくはアルファベットを入力してください... :
echo.
if {%selected%}=={} (goto hatenahazime)
if not {%selected%}=={} (echo %selected% が選択されました。)

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
if {%selected%}=={私は眠いです} (echo 俺もだ！&pause& goto hazime)

rem デバッグ用コマンドの参照
if {%selected%}=={inspectentirecommandlist} (goto :allcommands)

rem デバッグ用
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
if {%selected%}=={counttestdeb} (set hatenaita=0&goto :testinthecalbeep) else echo. &echo 無効な（もしくは使用不可な）選択です！有効な入力をしてください。&pause&goto hazime

rem 何も入力しなかった場合の帰還処理
:hatenahazime
echo ?
echo.
pause
echo すみません。何か入力してくれませんか？
echo.
pause
if "%hatenakeikoku%"=="無効" (goto hazime)

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
echo Dim answer:answer = MsgBox("ん？な、なにしてるの？",vbOKCancel,"ん？"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
rem ファイル削除
del /Q %TEMP%\msgbox.vbs
goto :hazime

:hatenaoko2
if %hatenaita% gtr 51 (goto :hazime)
echo Dim answer:answer = MsgBox("ちょ、ちょっと！そこまで打ち間違えないでしょ！",vbOKCancel,"もしかして..."):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
rem ファイル削除
del /Q %TEMP%\msgbox.vbs
goto :hazime

:hatenaoko3
if %hatenaita% gtr 101 (goto :hazime)
echo Dim answer:answer = MsgBox("おいこの！さすがに100回も打ち間違えないだろ！ふざけんな！",vbOKCancel,"確信犯"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
rem ファイル削除
del /Q %TEMP%\msgbox.vbs
goto :hazime

:hatenaoko4
if %hatenaita% gtr 131 (goto :hazime)
echo Dim answer:answer = MsgBox("ちょっと！さすがにやめてくれ！！！！！",vbOKCancel,"..."):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
rem ファイル削除
del /Q %TEMP%\msgbox.vbs
goto :hazime

:hatenaoko5
if %hatenaita% gtr 201 (goto :hazime)
echo Dim answer:answer = MsgBox("これ以上やったら後悔させます。200回も...",vbOKCancel,"最後の警告"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
rem ファイル削除
del /Q %TEMP%\msgbox.vbs
goto :hazime

:hatenaoko6
if %hatenaita% gtr 251 (goto :hazime)
echo Dim answer:answer = MsgBox("..........",vbOKCancel,""):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
del /Q %TEMP%\msgbox.vbs
shutdown /r /t 5 /c "後悔するがよい。"
taskkill /im cmd.exe
goto :reboot

:hazimeMessages
if "%messagealreadyshowed%"=="false" (set messagealreadyshowed=true) else (exit /b)
if "%FirstCursorisEdited%"=="true" (echo                        簡単に　かきかえられた　でしょ？&echo.&set FirstCursorisEdited=)

if "%Updateavailable%"=="true" (
    title カーソル替え 更新が利用可能 ^(試験的^)
  setlocal enabledelayedexpansion
    if "%batbeta%"=="True" (set batbetamessage=^(ヒント : このバージョンはベータ版です。バグや問題がある可能性があります。 ^))
  echo アップデートが利用可能です！ ^(%updatemyversion%to %updateversion%^)
  echo アップデートしますか？^(アップデートすると英語版へ強制的に変更されます^) !batbetamessage!
  set batbetamessage=
  SET /P updateselected=^(Y または N^) :
  if {!updateselected!}=={y} (set updateselected=&set updateavailable=&echo.&echo アップデート中...しばらくお待ちください。&set batbootpowershell=Doupdate&call :batbootpowershell&echo アップデートに成功しました。&pause&exit)
if {!updateselected!}=={n} (set updateselected=&set updateavailable=&echo.&echo アップデートはキャンセルされました。起動時にアップデートを確認する機能は設定から無効にできます。&pause&set checkupdatetoggle=false&set messagealreadyshowed=false&exit /b)
setlocal disabledelayedexpansion
)
exit /b

:exitmenu
cls
if not defined dummy (set clr=[7m&set clred=[41m&set clrgrn=[42m&set clryel=[43m&set clrmag=[45m&set clrcyan=[46m&set clrgra=[90m&set clr2=[0m)
if {%wmodetoggle%}=={false} (set clr=[7m&set clred=[41m&set clrgrn=[42m&set clryel=[43m&set clrmag=[46m&set clrgra=[90m&set clrcyan=[46m&set clr2=[0m)
if {%wmodetoggle%}=={true} (set clr=[100m[97m&set clred=[41m&set clrgrn=[42m&set clryel=[43m&set clrmag=[45m&set clrgra=[0m[107m&set clrcyan=[46m&set clr2=[90m[107m[30m)
title カーソル替えの終了 %debugmode% 
set selected=
echo                              %clrgra%カーソル替え%batver% %debugmode% %hazimebuild%%clr2%
echo.
echo   %clrgra%O================== %clr2%O================O%clrgra% ===============================O%clr2%
echo   %clrgra%I       1カーソルを %clr2%I  バッチの終了  I%clrgra% 電卓              3終了        I%clr2%
echo   %clrgra%I                   %clr2%O==========O==========O===========O%clrgra%               I%clr2%
echo   %clrgra%I               4バ %clr2%I     ^|    I   /~~~\  I           I%clrgra%               I%clr2%
echo   %clrgra%O================== %clr2%I   / ^| \  I  V    ∧ I  ^-^-^-^-^-^-^>  I%clrgra% ==============O%clr2%
echo                       I   \___/  I   \___/  I           I       
echo                       O==========O==========O===========O
echo                       I 何も選択していません。          I
echo                       O=================================O
echo.
choice /c 123adyeb /n /m "[1 2 3] か、 [A D] を押して選択したのち、 [Y E]を押して決定します。"
if %ErrorLevel%==1 goto exitmenu1
if %ErrorLevel%==2 goto exitmenu2
if %ErrorLevel%==3 goto exitmenu3
if %ErrorLevel%==4 goto exitmenu1
if %ErrorLevel%==5 goto exitmenu1
if %ErrorLevel%==6 goto exitmenu1
if %ErrorLevel%==7 goto exitmenu1
if %ErrorLevel%==8 goto hazime
goto :hazime

:exitmenu1
cls
set selected=
echo                              %clrgra%カーソル替え%batver% %debugmode% %hazimebuild%%clr2%
echo.
echo   %clrgra%O================== %clr2%O================O%clrgra% ===============================O%clr2%
echo   %clrgra%I       1カーソルを %clr2%I  バッチの終了  I%clrgra% 電卓              3終了        I%clr2%
echo   %clrgra%I                   %clr2%O==========O==========O===========O%clrgra%               I%clr2%
echo   %clrgra%I               4バ %clr2%I%clred%     ^|    %clr2%I   /~~~\  I           I%clrgra%               I%clr2%
echo   %clrgra%O================== %clr2%I%clred%   / ^| \  %clr2%I  V    ∧ I  ^-^-^-^-^-^-^>  I%clrgra% ==============O%clr2%
echo                       I%clred%   \___/  %clr2%I   \___/  I           I       
echo                       O==========O==========O===========O
echo                       I 終了が選択されました。          I
echo                       O=================================O
echo.
choice /c 123adyeb /n /m "[1 2 3] か、 [A D] を押して選択したのち、 [Y E]を押して決定します。"
if %ErrorLevel%==1 goto exitmenu1
if %ErrorLevel%==2 goto exitmenu2
if %ErrorLevel%==3 goto exitmenu3
if %ErrorLevel%==4 goto exitmenu1
if %ErrorLevel%==5 goto exitmenu2
if %ErrorLevel%==6 goto exitmenu1y
if %ErrorLevel%==7 goto exitmenu1y
if %ErrorLevel%==8 goto hazime
goto :hazime

:exitmenu2
cls
set selected=
echo                              %clrgra%カーソル替え%batver% %debugmode% %hazimebuild%%clr2%
echo.
echo   %clrgra%O================== %clr2%O================O%clrgra% ===============================O%clr2%
echo   %clrgra%I       1カーソルを %clr2%I  バッチの終了  I%clrgra% 電卓              3終了        I%clr2%
echo   %clrgra%I                   %clr2%O==========O==========O===========O%clrgra%               I%clr2%
echo   %clrgra%I               4バ %clr2%I     ^|    I%clrgrn%   /~~~\  %clr2%I           I%clrgra%               I%clr2%
echo   %clrgra%O================== %clr2%I   / ^| \  I%clrgrn%  V    ∧ %clr2%I  ^-^-^-^-^-^-^>  I%clrgra% ==============O%clr2%
echo                       I   \___/  I%clrgrn%   \___/  %clr2%I           I       
echo                       O==========O==========O===========O
echo                       I 再起動が選択されました。        I
echo                       O=================================O
echo.
choice /c 123adyeb /n /m "[1 2 3] か、 [A D] を押して選択したのち、 [Y E]を押して決定します。"
if %ErrorLevel%==1 goto exitmenu1
if %ErrorLevel%==2 goto exitmenu2
if %ErrorLevel%==3 goto exitmenu3
if %ErrorLevel%==4 goto exitmenu1
if %ErrorLevel%==5 goto exitmenu3
if %ErrorLevel%==6 goto exitmenu2y
if %ErrorLevel%==7 goto exitmenu2y
if %ErrorLevel%==8 goto hazime
goto :hazime

:exitmenu3
cls
set selected=
echo                              %clrgra%カーソル替え%batver% %debugmode% %hazimebuild%%clr2%
echo.
echo   %clrgra%O================== %clr2%O================O%clrgra% ===============================O%clr2%
echo   %clrgra%I       1カーソルを %clr2%I  バッチの終了  I%clrgra% 電卓              3終了        I%clr2%
echo   %clrgra%I                   %clr2%O==========O==========O===========O%clrgra%               I%clr2%
echo   %clrgra%I               4バ %clr2%I     ^|    I   /~~~\  I%clrcyan%           %clr2%I%clrgra%               I%clr2%
echo   %clrgra%O================== %clr2%I   / ^| \  I  V    ∧ I%clrcyan%  ^-^-^-^-^-^-^>  %clr2%I%clrgra% ==============O%clr2%
echo                       I   \___/  I   \___/  I%clrcyan%           %clr2%I       
echo                       O==========O==========O===========O
echo                       I 戻るが選択されました。          I
echo                       O=================================O
echo.
choice /c 123adyeb /n /m "[1 2 3] か、 [A D] を押して選択したのち、 [Y E]を押して決定します。"
if %ErrorLevel%==1 goto exitmenu1
if %ErrorLevel%==2 goto exitmenu2
if %ErrorLevel%==3 goto exitmenu3
if %ErrorLevel%==4 goto exitmenu2
if %ErrorLevel%==5 goto exitmenu3
if %ErrorLevel%==6 call :exitmenuexit&goto hazime
if %ErrorLevel%==7 call :exitmenuexit&goto hazime
if %ErrorLevel%==8 goto hazime
goto :hazime


rem confirm

:exitmenu1y
cls
set selected=
echo                              %clrgra%カーソル替え%batver% %debugmode% %hazimebuild%%clr2%
echo.
echo   %clrgra%O================== %clr2%O================O%clrgra% ===============================O%clr2%
echo   %clrgra%I       1カーソルを %clr2%I  バッチの終了  I%clrgra% 電卓              3終了        I%clr2%
echo   %clrgra%I                   %clr2%O==========O==========O===========O%clrgra%               I%clr2%
echo   %clrgra%I                4ba%clr2%I%clred%     ^|    %clr2%I   /~~~\  I           I%clrgra%               I%clr2%
echo   %clrgra%O================== %clr2%I%clred%   / ^| \  %clr2%I  V    ∧ I  ^-^-^-^-^-^-^>  I%clrgra% ==============O%clr2%
echo                       I%clred%   \___/  %clr2%I   \___/  I           I       
echo                       O==========O==========O===========O
echo                       I 本当に？                        I
echo                       O=================================O
echo.
choice /c 123adyeb /n /m "[1 2 3] か、 [A D] を押して選択したのち、 [Y E]を押して決定します。"
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
echo                              %clrgra%カーソル替え%batver% %debugmode% %hazimebuild%%clr2%
echo.
echo   %clrgra%O================== %clr2%O================O%clrgra% ===============================O%clr2%
echo   %clrgra%I       1カーソルを %clr2%I  バッチの終了  I%clrgra% 電卓              3終了        I%clr2%
echo   %clrgra%I                   %clr2%O==========O==========O===========O%clrgra%               I%clr2%
echo   %clrgra%I               4バ %clr2%I     ^|    I%clrgrn%   /~~~\  %clr2%I           I%clrgra%               I%clr2%
echo   %clrgra%O================== %clr2%I   / ^| \  I%clrgrn%  V    ∧ %clr2%I  ^-^-^-^-^-^-^>  I%clrgra% ==============O%clr2%
echo                       I   \___/  I%clrgrn%   \___/  %clr2%I           I       
echo                       O==========O==========O===========O
echo                       I 本当に？                        I
echo                       O=================================O
echo.
choice /c 123adyeb /n /m "[1 2 3] か、 [A D] を押して選択したのち、 [Y E]を押して決定します。"
if %ErrorLevel%==1 goto exitmenu1
if %ErrorLevel%==2 goto exitmenu2
if %ErrorLevel%==3 goto exitmenu3
if %ErrorLevel%==4 goto exitmenu1
if %ErrorLevel%==5 goto exitmenu3
if %ErrorLevel%==6 (call :exitmenuexit &goto :Rebootbatch)
if %ErrorLevel%==7 (call :exitmenuexit &goto :Rebootbatch)
if %ErrorLevel%==8 goto exitmenu2
goto :hazime


:batshutdown
title アリーヴェデルチ
cls
echo.
echo                            カーソル替え%batver% %debugmode%
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
echo                                                さようなら
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


rem 設定メニューの描写
:setting
set wantload=
set settinghelptoggle=false
if not defined dummy (set clr=[7m&set clr2=[0m)
if {%wmodetoggle%}=={false} (set clr=[7m&set clr2=[0m)
if {%wmodetoggle%}=={true} (set clr=[100m[97m&set clr2=[0m[107m[30m)
rem 設定ファイルが存在するかを検知
cd /d %batchmainpath%
rem 場所 OSが入ったドライブ:\Users\ユーザー名
rem (例 ユーザーの名前がtestだった場合と、OSが入った場所がCドライブだった場合だと C:\Users\Test)
if not exist カーソル替え設定.txt (goto dogcheck)
title カーソル設定 %debugmode%
set selected=
if not defined {%clrgra%} (set clrgra=[90m)
Cls
Echo.
Echo                               設定メニュー Ver2!!
echo. 
echo O========================O                  O======O
echo I      カテゴリー        I                  I 設定 I
echo O========================O==================O======O======================O
echo I                        I                                                I
echo I  カーソル替え  機能系  I  カテゴリーが選択されていません。              I
echo I                        I                                                I
echo O========================I                                                I
Echo O  カテゴリー  上か下か  I                                                I
Echo O========================I                                                I
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
title カーソル設定 %debugmode%
set selected=
Cls
Echo.
Echo                               設定メニュー Ver2!!
echo. 
echo O========================O                  O======O
echo I      カテゴリー        I                  I 設定 I
echo O========================O==================O======O======================O
echo I%clr%                        %clr2%I                                                I
echo I%clr%  カーソル替え  機能系  %clr2%I  カーソル替えの機能に関する設定です。          I
echo I%clr%                        %clr2%I                                                I
echo O========================I                                                I
Echo O  カテゴリー  上か下か  I                                                I
Echo O========================I                                                I
Echo I                        I                                                I
echo I カーソル替え  見た目系 I                                                I
echo I                        I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ヘルプモード      %clrhelp2%I  I 移動 : W A S D 数字 I 戻る : B I 決定 : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12wsdbye3 /n /m "変更するものを数字で指定又はwasdで移動して指定してください"
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
cd /d %batchmainpath%
rem 場所 OSが入ったドライブ:\Users\ユーザー名
rem (例 ユーザーの名前がtestだった場合と、OSが入った場所がCドライブだった場合だと C:\Users\Test)
if not exist カーソル替え設定.txt (goto dogcheck)
title カーソル設定 %debugmode%
set selected=
if not defined {%clrgra%} (set clrgra=[90m)
Cls
Echo.
Echo                               設定メニュー Ver2!!
echo. 
echo O========================O                  O======O
echo I      カテゴリー        I                  I 設定 I
echo O========================O==================O======O======================O
echo I                        I                                                I
echo I  カーソル替え  機能系  I  カーソル替えの見た目に関する設定です。        I
echo I                        I %clrgra%（テーマなど）%clr2%                                 I
echo O========================I                                                I
Echo O  カテゴリー  上か下か  I                                                I
Echo O========================I                                                I
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
if %ErrorLevel%==1 goto settingcategory1
if %ErrorLevel%==2 goto settingcategory2
if %ErrorLevel%==3 goto settingcategory1
if %ErrorLevel%==4 goto settingcategoryhelpmode
if %ErrorLevel%==5 goto settingcategory2int
if %ErrorLevel%==6 goto hazime
if %ErrorLevel%==7 goto settingcategory2int
if %ErrorLevel%==8 goto settingcategory2int
if %ErrorLevel%==9 goto settingcategoryhelpmode

rem カテゴリー内部

:settingcategory1int
title カーソル設定 %debugmode%
set selected=
Cls
Echo.
Echo                               設定メニュー Ver2!!
echo. 
echo O========================O                  O======O
echo I      カテゴリー        I                  I 設定 I
echo O========================O==================O======O===========O==========O
echo I%clr%                        %clr2%I 1 変更後の再起動の確認              I   %setting1onoff%   I
echo I%clr%  カーソル替え  機能系  %clr2%I                                     O==========O
echo I%clr%                        %clr2%I 2 起動時のアドミン                  I   %setting2onoff%   I
echo O========================I                                     O==========O
Echo O  カテゴリー  上か下か  I 3 起動時に更新確認                  I   %setting3onoff%   I
Echo O========================I                                     O==========O
Echo I                        I 4 Enterの長押しを検知する機能       I   %setting4onoff%   I
echo I カーソル替え  見た目系 I                                     O==========O
echo I                        I 5 初期化またはアンインストール                 I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ヘルプモード      %clrhelp2%I  I 移動 : W A S D 数字 I 戻る : B I 決定 : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12wsdbye3 /n /m "変更するものを数字で指定又はwasdで移動して指定してください"
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
title カーソル設定 %debugmode%
set selected=
Cls
Echo.
Echo                               設定メニュー Ver2!!
echo. 
echo O========================O                  O======O
echo I      カテゴリー        I                  I 設定 I
echo O========================O==================O======O===========O==========O
echo I%clr%                        %clr2%I %clr%1 変更後の再起動の確認%clr2%              I   %setting1onoff%   I
echo I%clr%  カーソル替え  機能系  %clr2%I                                     O==========O
echo I%clr%                        %clr2%I 2 起動時のアドミン                  I   %setting2onoff%   I
echo O========================I                                     O==========O
Echo O  カテゴリー  上か下か  I 3 起動時に更新確認                  I   %setting3onoff%   I
Echo O========================I                                     O==========O
Echo I                        I 4 Enterの長押しを検知する機能       I   %setting4onoff%   I
echo I カーソル替え  見た目系 I                                     O==========O
echo I                        I 5 初期化またはアンインストール                 I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ヘルプモード      %clrhelp2%I  I 移動 : W A S D 数字 I 戻る : B I 決定 : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12345wsabye /n /m "変更するものを数字で指定又はwasdで移動して指定してください"
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
title カーソル設定 %debugmode%
set selected=
Cls
Echo.
Echo                               設定メニュー Ver2!!
echo. 
echo O========================O                  O======O
echo I      カテゴリー        I                  I 設定 I
echo O========================O==================O======O===========O==========O
echo I%clr%                        %clr2%I 1 変更後の再起動の確認              I   %setting1onoff%   I
echo I%clr%  カーソル替え  機能系  %clr2%I                                     O==========O
echo I%clr%                        %clr2%I %clr%2 起動時のアドミン%clr2%                  I   %setting2onoff%   I
echo O========================I                                     O==========O
Echo O  カテゴリー  上か下か  I 3 起動時に更新確認                  I   %setting3onoff%   I
Echo O========================I                                     O==========O
Echo I                        I 4 Enterの長押しを検知する機能       I   %setting4onoff%   I
echo I カーソル替え  見た目系 I                                     O==========O
echo I                        I 5 初期化またはアンインストール                 I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ヘルプモード      %clrhelp2%I  I 移動 : W A S D 数字 I 戻る : B I 決定 : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12345wsabye /n /m "変更するものを数字で指定又はwasdで移動して指定してください"
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
title カーソル設定 %debugmode%
set selected=
Cls
Echo.
Echo                               設定メニュー Ver2!!
echo. 
echo O========================O                  O======O
echo I      カテゴリー        I                  I 設定 I
echo O========================O==================O======O===========O==========O
echo I%clr%                        %clr2%I 1 変更後の再起動の確認              I   %setting1onoff%   I
echo I%clr%  カーソル替え  機能系  %clr2%I                                     O==========O
echo I%clr%                        %clr2%I 2 起動時のアドミン                  I   %setting2onoff%   I
echo O========================I                                     O==========O
Echo O  カテゴリー  上か下か  I %clr%3 起動時に更新確認%clr2%                  I   %setting3onoff%   I
Echo O========================I                                     O==========O
Echo I                        I 4 Enterの長押しを検知する機能       I   %setting4onoff%   I
echo I カーソル替え  見た目系 I                                     O==========O
echo I                        I 5 初期化またはアンインストール                 I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ヘルプモード      %clrhelp2%I  I 移動 : W A S D 数字 I 戻る : B I 決定 : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12345wsabye /n /m "変更するものを数字で指定又はwasdで移動して指定してください"
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
title カーソル設定 %debugmode%
set selected=
Cls
Echo.
Echo                               設定メニュー Ver2!!
echo. 
echo O========================O                  O======O
echo I      カテゴリー        I                  I 設定 I
echo O========================O==================O======O===========O==========O
echo I%clr%                        %clr2%I 1 変更後の再起動の確認              I   %setting1onoff%   I
echo I%clr%  カーソル替え  機能系  %clr2%I                                     O==========O
echo I%clr%                        %clr2%I 2 起動時のアドミン                  I   %setting2onoff%   I
echo O========================I                                     O==========O
Echo O  カテゴリー  上か下か  I 3 起動時に更新確認                  I   %setting3onoff%   I
Echo O========================I                                     O==========O
Echo I                        I %clr%4 Enterの長押しを検知する機能%clr2%       I   %setting4onoff%   I
echo I カーソル替え  見た目系 I                                     O==========O
echo I                        I 5 初期化またはアンインストール                 I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ヘルプモード      %clrhelp2%I  I 移動 : W A S D 数字 I 戻る : B I 決定 : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12345wsabye /n /m "変更するものを数字で指定又はwasdで移動して指定してください"
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
title カーソル設定 %debugmode%
set selected=
Cls
Echo.
Echo                               設定メニュー Ver2!!
echo. 
echo O========================O                  O======O
echo I      カテゴリー        I                  I 設定 I
echo O========================O==================O======O===========O==========O
echo I%clr%                        %clr2%I 1 変更後の再起動の確認              I   %setting1onoff%   I
echo I%clr%  カーソル替え  機能系  %clr2%I                                     O==========O
echo I%clr%                        %clr2%I 2 起動時のアドミン                  I   %setting2onoff%   I
echo O========================I                                     O==========O
Echo O  カテゴリー  上か下か  I 3 起動時に更新確認                  I   %setting3onoff%   I
Echo O========================I                                     O==========O
Echo I                        I 4 Enterの長押しを検知する機能       I   %setting4onoff%   I
echo I カーソル替え  見た目系 I                                     O==========O
echo I                        I %clr%5 初期化またはアンインストール%clr2%                 I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ヘルプモード      %clrhelp2%I  I 移動 : W A S D 数字 I 戻る : B I 決定 : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12345wsabye /n /m "変更するものを数字で指定又はwasdで移動して指定してください"
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
title カーソル設定 %debugmode%
set selected=
Cls
Echo.
Echo                               設定メニュー Ver2!!
echo. 
echo O========================O                  O======O
echo I      カテゴリー        I                  I 設定 I
echo O========================O==================O======O======================O
echo I                        I 1 起動時のアニメーションの設定      I     ^>    I
echo I  カーソル替え  機能系  I                                     O==========O
echo I                        I 2 %wmodeonoff%                         I
echo O========================I                                                I
Echo O  カテゴリー  上か下か  I                                                I
Echo O========================I                                                I
Echo I%clr%                        %clr2%I                                                I
echo I%clr% カーソル替え  見た目系 %clr2%I                                                I
echo I%clr%                        %clr2%I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ヘルプモード      %clrhelp2%I  I 移動 : W A S D 数字 I 戻る : B I 決定 : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12wsdbye3 /n /m "変更するものを数字で指定又はwasdで移動して指定してください"
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
set sc2s5s1lock=&set sc2s5s2lock=&set sc2s5s3lock=&set sc2s5s1lock2=&set sc2s5s2lock2=&set sc2s5s3lock2=&set setting5_stg_whereyou=
title カーソル設定 %debugmode%
set selected=
Cls
Echo.
Echo                               設定メニュー Ver2!!  
echo. 
echo O========================O                  O======O
echo I      カテゴリー        I                  I 設定 I
echo O========================O==================O======O======================O
echo I                        I %clr%1 起動時のアニメーションの設定%clr2%      I     ^>    I
echo I  カーソル替え  機能系  I                                     O==========O
echo I                        I 2 %wmodeonoff%                         I
echo O========================I                                                I
Echo O  カテゴリー  上か下か  I                                                I
Echo O========================I                                                I
Echo I%clr%                        %clr2%I                                                I
echo I%clr% カーソル替え  見た目系 %clr2%I                                                I
echo I%clr%                        %clr2%I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ヘルプモード      %clrhelp2%I  I 移動 : W A S D 数字 I 戻る : B I 決定 : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12wsabye /n /m "変更するものを数字で指定又はwasdで移動して指定してください"
if %ErrorLevel%==1 goto settingcategory2intsetting1
if %ErrorLevel%==2 goto settingcategory2intsetting2
if %ErrorLevel%==3 goto settingcategory2intsetting1
if %ErrorLevel%==4 goto settingcategory2intsetting2
if %ErrorLevel%==5 goto settingcategory2int
if %ErrorLevel%==6 goto settingcategory2int
if %ErrorLevel%==7 goto settingcategory2intsetting5_stg0
if %ErrorLevel%==8 goto settingcategory2intsetting5_stg0

:settingcategory2intsetting2
title カーソル設定 %debugmode%
set selected=
Cls
Echo.
Echo                               設定メニュー Ver2!!
echo. 
echo O========================O                  O======O
echo I      カテゴリー        I                  I 設定 I
echo O========================O==================O======O======================O
echo I                        I 1 起動時のアニメーションの設定      I     ^>    I
echo I  カーソル替え  機能系  I                                     O==========O
echo I                        I %clr%2 %wmodeonoff%%clr2%                         I
echo O========================I                                                I
Echo O  カテゴリー  上か下か  I                                                I
Echo O========================I                                                I
Echo I%clr%                        %clr2%I                                                I
echo I%clr% カーソル替え  見た目系 %clr2%I                                                I
echo I%clr%                        %clr2%I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ヘルプモード      %clrhelp2%I  I 移動 : W A S D 数字 I 戻る : B I 決定 : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12wsabye3 /n /m "変更するものを数字で指定又はwasdで移動して指定してください"
if %ErrorLevel%==1 goto settingcategory2intsetting1
if %ErrorLevel%==2 goto settingcategory2intsetting2
if %ErrorLevel%==3 goto settingcategory2intsetting1
if %ErrorLevel%==4 goto settingcategory2intsetting2
if %ErrorLevel%==5 goto settingcategory2int
if %ErrorLevel%==6 goto settingcategory2int
if %ErrorLevel%==7 goto wmode
if %ErrorLevel%==8 goto wmode



:settingcategory2intsetting5_stg0
set setting5_stg_whereyou=stg0
title Cursor Changer Setting %debugmode%
call :settingcategory2intsetting5blockcheck
set selected=
Cls
Echo.
Echo                               設定メニュー Ver2!!
echo. 
echo O========================O                  O======O O====================O
echo I      カテゴリー        I                  I 設定 I I 設定5/...          I
echo O========================O==================O======O=O====================O
echo I                        I %clr%1 起動アニメーション%clr2%                I   %setting5onoff%   I
echo I  カーソル替え  機能系  I                                     O==========O
echo I                        I %sc2s5s1lock%2 リナックス風起動アニメーション%sc2s5s1lock2%    I   %setting5_s1onoff%   I
echo O========================I                                     O==========O
Echo O  カテゴリー  上か下か  I %sc2s5s2lock%3 シンプルな起動アニメーション%sc2s5s2lock2%      I   %setting5_s2onoff%   I
Echo O========================I                                     O==========O
Echo I%clr%                        %clr2%I %sc2s5s3lock%4 生の起動アニメーション%sc2s5s3lock2%            I   %setting5_s3onoff%   I
echo I%clr% カーソル替え  見た目系 %clr2%I                                     O==========O
echo I%clr%                        %clr2%I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ヘルプモード      %clrhelp2%I  I 移動 : W A S D 数字 I 戻る : B I 決定 : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 123wsabye4 /n /m "Specify what you want to change by number or by moving with wasd :"
if %ErrorLevel%==1 goto settingcategory2intsetting5_stg0
if %ErrorLevel%==2 goto settingcategory2intsetting5_stg1
if %ErrorLevel%==3 goto settingcategory2intsetting5_stg2
if %ErrorLevel%==4 goto settingcategory2intsetting5_stg0
if %ErrorLevel%==5 goto settingcategory2intsetting5_stg1
if %ErrorLevel%==6 goto settingcategory2intsetting1
if %ErrorLevel%==7 goto settingcategory2intsetting1
if %ErrorLevel%==8 goto setting5
if %ErrorLevel%==9 goto setting5
if %ErrorLevel%==10 goto settingcategory2intsetting5_stg3


:settingcategory2intsetting5_stg1
if "%setting5onoff%"=="無効" if "%setting5_stg_whereyou%"=="stg2" (goto :settingcategory2intsetting5_stg0) else if "%setting5onoff%"=="無効" if "%setting5_stg_whereyou%"=="stg0" (goto :settingcategory2intsetting5_stg2)
if "%simpleboot%"=="true" if "%setting5_stg_whereyou%"=="stg0" (goto :settingcategory2intsetting5_stg2) else if "%setting5_stg_whereyou%"=="stg2" (goto :settingcategory2intsetting5_stg0)
if "%rawboot%"=="true" if "%setting5_stg_whereyou%"=="stg3" (goto :settingcategory2intsetting5_stg3) else if "%setting5_stg_whereyou%"=="stg0" (goto :settingcategory2intsetting5_stg3)
set setting5_stg_whereyou=stg1
title Cursor Changer Setting %debugmode%
call :settingcategory2intsetting5blockcheck
set selected=
Cls
Echo.
Echo                               設定メニュー Ver2!!
echo. 
echo O========================O                  O======O O====================O
echo I      カテゴリー        I                  I 設定 I I 設定5/...          I
echo O========================O==================O======O=O====================O
echo I                        I 1 起動アニメーション                I   %setting5onoff%   I
echo I  カーソル替え  機能系  I                                     O==========O
echo I                        I %clr%2 リナックス風起動アニメーション%clr2%    I   %setting5_s1onoff%   I
echo O========================I                                     O==========O
Echo O  カテゴリー  上か下か  I %sc2s5s2lock%3 シンプルな起動アニメーション%sc2s5s2lock2%      I   %setting5_s2onoff%   I
Echo O========================I                                     O==========O
Echo I%clr%                        %clr2%I %sc2s5s3lock%4 生の起動アニメーション%sc2s5s3lock2%            I   %setting5_s3onoff%   I
echo I%clr% カーソル替え  見た目系 %clr2%I                                     O==========O
echo I%clr%                        %clr2%I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ヘルプモード      %clrhelp2%I  I 移動 : W A S D 数字 I 戻る : B I 決定 : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 123wsabye4 /n /m "Specify what you want to change by number or by moving with wasd :"
if %ErrorLevel%==1 goto settingcategory2intsetting5_stg0
if %ErrorLevel%==2 goto settingcategory2intsetting5_stg1
if %ErrorLevel%==3 goto settingcategory2intsetting5_stg2
if %ErrorLevel%==4 goto settingcategory2intsetting5_stg0
if %ErrorLevel%==5 goto settingcategory2intsetting5_stg2
if %ErrorLevel%==6 goto settingcategory2intsetting1
if %ErrorLevel%==7 goto settingcategory2intsetting1
if %ErrorLevel%==8 goto setting5_1
if %ErrorLevel%==9 goto setting5_1
if %ErrorLevel%==10 goto settingcategory2intsetting5_stg3


:settingcategory2intsetting5_stg2
if "%linuxboot%"=="true" if "%setting5_stg_whereyou%"=="stg1" (goto :settingcategory2intsetting5_stg1)
if "%rawboot%"=="true" if "%setting5_stg_whereyou%"=="stg3" (goto :settingcategory2intsetting5_stg0) else if "%setting5_stg_whereyou%"=="stg0" (goto :settingcategory2intsetting5_stg3)
set setting5_stg_whereyou=stg2
title Cursor Changer Setting %debugmode%
call :settingcategory2intsetting5blockcheck
set selected=
Cls
Echo.
Echo                               設定メニュー Ver2!!
echo. 
echo O========================O                  O======O O====================O
echo I      カテゴリー        I                  I 設定 I I 設定5/...          I
echo O========================O==================O======O=O====================O
echo I                        I 1 起動アニメーション                I   %setting5onoff%   I
echo I  カーソル替え  機能系  I                                     O==========O
echo I                        I %sc2s5s1lock%2 リナックス風起動アニメーション%sc2s5s1lock2%    I   %setting5_s1onoff%   I
echo O========================I                                     O==========O
Echo O  カテゴリー  上か下か  I %clr%3 シンプルな起動アニメーション%clr2%      I   %setting5_s2onoff%   I
Echo O========================I                                     O==========O
Echo I%clr%                        %clr2%I %sc2s5s3lock%4 生の起動アニメーション%sc2s5s3lock2%            I   %setting5_s3onoff%   I
echo I%clr% カーソル替え  見た目系 %clr2%I                                     O==========O
echo I%clr%                        %clr2%I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ヘルプモード      %clrhelp2%I  I 移動 : W A S D 数字 I 戻る : B I 決定 : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 123wsabye4 /n /m "Specify what you want to change by number or by moving with wasd :"
if %ErrorLevel%==1 goto settingcategory2intsetting5_stg0
if %ErrorLevel%==2 goto settingcategory2intsetting5_stg1
if %ErrorLevel%==3 goto settingcategory2intsetting5_stg2
if %ErrorLevel%==4 goto settingcategory2intsetting5_stg1
if %ErrorLevel%==5 goto settingcategory2intsetting5_stg3
if %ErrorLevel%==6 goto settingcategory2intsetting1
if %ErrorLevel%==7 goto settingcategory2intsetting1
if %ErrorLevel%==8 goto setting5_2
if %ErrorLevel%==9 goto setting5_2
if %ErrorLevel%==10 goto settingcategory2intsetting5_stg3

:settingcategory2intsetting5_stg3
if "%setting5onoff%"=="無効" if "%setting5_stg_whereyou%"=="stg0" (goto :settingcategory2intsetting5_stg0) else if "%setting5_stg_whereyou%"=="stg2" (goto :settingcategory2intsetting5_stg2)
if "%linuxboot%"=="true" if "%setting5_stg_whereyou%"=="stg1" (goto :settingcategory2intsetting5_stg1)
if "%simpleboot%"=="true" if "%setting5_stg_whereyou%"=="stg2" (goto :settingcategory2intsetting5_stg2) else if "%setting5_stg_whereyou%"=="stg0" (goto :settingcategory2intsetting5_stg0)
set setting5_stg_whereyou=stg3
title Cursor Changer Setting %debugmode%
call :settingcategory2intsetting5blockcheck
set selected=
Cls
Echo.
Echo                               設定メニュー Ver2!!
echo. 
echo O========================O                  O======O O====================O
echo I      カテゴリー        I                  I 設定 I I 設定5/...          I
echo O========================O==================O======O=O====================O
echo I                        I 1 起動アニメーション                I   %setting5onoff%   I
echo I  カーソル替え  機能系  I                                     O==========O
echo I                        I %sc2s5s1lock%2 リナックス風起動アニメーション%sc2s5s1lock2%    I   %setting5_s1onoff%   I
echo O========================I                                     O==========O
Echo O  カテゴリー  上か下か  I %sc2s5s2lock%3 シンプルな起動アニメーション%sc2s5s2lock2%      I   %setting5_s2onoff%   I
Echo O========================I                                     O==========O
Echo I%clr%                        %clr2%I %clr%4 生の起動アニメーション%clr2%            I   %setting5_s3onoff%   I
echo I%clr% カーソル替え  見た目系 %clr2%I                                     O==========O
echo I%clr%                        %clr2%I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%      ヘルプモード      %clrhelp2%I  I 移動 : W A S D 数字 I 戻る : B I 決定 : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 123wsabye4 /n /m "Specify what you want to change by number or by moving with wasd :"
if %ErrorLevel%==1 goto settingcategory2intsetting5_stg0
if %ErrorLevel%==2 goto settingcategory2intsetting5_stg1
if %ErrorLevel%==3 goto settingcategory2intsetting5_stg2
if %ErrorLevel%==4 goto settingcategory2intsetting5_stg2
if %ErrorLevel%==5 goto settingcategory2intsetting5_stg3
if %ErrorLevel%==6 goto settingcategory2intsetting1
if %ErrorLevel%==7 goto settingcategory2intsetting1
if %ErrorLevel%==8 goto setting5_3
if %ErrorLevel%==9 goto setting5_3
if %ErrorLevel%==10 goto settingcategory2intsetting5_stg3

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
    exit /b
)
if "%setting5_s2onoff%"=="有効" (
    if "%wmodetoggle%"=="true" (
    set sc2s5s1lock=[0m[107m&set sc2s5s1lock2=[0m[107m[30m
    set sc2s5s3lock=[0m[107m&set sc2s5s3lock2=[0m[107m[30m
    ) else (
    set sc2s5s1lock=[0m[90m&set sc2s5s1lock2=[0m
    set sc2s5s3lock=[0m[90m&set sc2s5s3lock2=[0m
    )
) 
if "%setting5_s3onoff%"=="有効" (
    if "%wmodetoggle%"=="true" (
    set sc2s5s1lock=[0m[107m&set sc2s5s1lock2=[0m[107m[30m
    set sc2s5s2lock=[0m[107m&set sc2s5s2lock2=[0m[107m[30m
    ) else (
    set sc2s5s1lock=[0m[90m&set sc2s5s1lock2=[0m
    set sc2s5s2lock=[0m[90m&set sc2s5s2lock2=[0m
    )
    exit /b
)
if "%setting5onoff%"=="無効" (
    if "%wmodetoggle%"=="true" (
    set sc2s5s1lock=[0m[107m&set sc2s5s1lock2=[0m[107m[30m
    set sc2s5s3lock=[0m[107m&set sc2s5s3lock2=[0m[107m[30m
    ) else (
    set sc2s5s1lock=[0m[90m&set sc2s5s1lock2=[0m
    set sc2s5s3lock=[0m[90m&set sc2s5s3lock2=[0m
    )
    exit /b
)
exit /b



:settingcategoryhelpmode
rem メモ ここの分岐のtrueのところに、clrの色を変える処理を追加したい。choiceの直後に分岐でもとに戻す処理も追加して
if {%settinghelptoggle%}=={true} (set settinghelp=有効)
if {%settinghelptoggle%}=={false} (set settinghelp=無効)
title カーソル設定 %debugmode%
set selected=
if not defined {%clrgra%} (set clrgra=[90m)
if {%settinghelptoggle%}=={true} (set clr=[46m)
Cls
echo.
Echo                               設定メニュー Ver2!!
echo. 
echo O========================O                  O======O
echo I      カテゴリー        I                  I 設定 I
echo O========================O==================O======O======================O
echo I                        I                                                I
echo I  カーソル替え  機能系  I  ヘルプモードです。この機能を選択した後、      I
echo I                        I  概要を見たい設定を選択すると、                I
echo O========================I  その設定の概要を見ることができます。          I
Echo O  カテゴリー  上か下か  I                                                I
Echo O========================I  ヘルプモードを無効にしたい場合は、            I
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
if {%wmodetoggle%}=={true} (set clr=[46m&set clrhelp=[100m[97m&set clrhelp2=[0m[107m[30m)
goto settingcategoryhelpmode





rem 設定の適用と確認
rem 設定が存在するかの検証
:setting1
if {%settinghelptoggle%}=={true} (goto setting1help)
find "rebootokey=false" カーソル替え設定.txt > nul
if %ErrorLevel%==0 set setting1setonoff=有効&goto setting1okey
if %ErrorLevel%==1 set setting1setonoff=修復し、正常な状態& goto setting1onoff

:setting1onoff
find "rebootokey=true" カーソル替え設定.txt > nul
if %ErrorLevel%==0 set setting1setonoff=無効

:setting1okey
cls
set selected=
echo カーソル変更後の再起動の確認を%setting1setonoff%にしますか？(Y=はい N=いいえ B=戻る)
SET /P selected= :
echo %selected% が選択されました。
if {%selected%}=={y} (goto :setting1y)
if {%selected%}=={n} (goto :setting1n)
if {%selected%}=={back} (goto :settingcategory1intsetting1)
if {%selected%}=={b} (goto :settingcategory1intsetting1)
goto setting1okey

:setting1y
find "rebootokey=false" カーソル替え設定.txt > nul
echo 設定を適用中...
if %ErrorLevel%==1 goto setting1ygo3test
if %ErrorLevel%==0 goto setting1ygo1

:setting1ygo3test
find "rebootokey=true" カーソル替え設定.txt > nul
if %ErrorLevel%==1 echo rebootokey=true >> カーソル替え設定.txt
if %ErrorLevel%==0 goto setting1ygo2

:setting1ygo2
powershell "(gc カーソル替え設定.txt) -replace 'rebootokey=true','rebootokey=false' | sc カーソル替え設定.txt"
goto setting1yokey

:setting1ygo1
powershell "(gc カーソル替え設定.txt) -replace 'rebootokey=false','rebootokey=true' | sc カーソル替え設定.txt"
goto setting1yokey

:setting1yokey
cls
Echo 正常に変更されました。
Pause
set wantload=setting1
call :MOBAS_Loader
Goto settingcategory1intsetting1

:setting1n
cls
Echo 設定を変更しませんでした
Pause
goto settingcategory1intsetting1

:setting2
if {%settinghelptoggle%}=={true} (goto setting2help)
find "admin=false" カーソル替え設定.txt > nul
if %ErrorLevel%==0 set setting2setonoff=有効&goto setting2okey
if %ErrorLevel%==1 set setting2setonoff=修復し、正常な状態&goto setting2onoff

:setting2onoff
find "admin=true" カーソル替え設定.txt > nul
if %ErrorLevel%==0 set setting2setonoff=無効

:setting2okey
cls
echo 起動時の管理者権限の要求を%setting2setonoff%にしますか？(Y=はい N=いいえ B=戻る)
SET /P selected= :
echo %selected% が選択されました。
if {%selected%}=={y} (goto :setting2y)
if {%selected%}=={n} (goto :setting2n)
if {%selected%}=={back} (goto :settingcategory1intsetting2)
if {%selected%}=={b} (goto :settingcategory1intsetting2)
goto setting2okey

:setting2y
find "admin=false" カーソル替え設定.txt > nul
echo 設定を適用中...
if %ErrorLevel%==1 goto setting2ygo3test
if %ErrorLevel%==0 goto setting2ygo1

:setting2ygo3test
find "admin=true" カーソル替え設定.txt > nul
if %ErrorLevel%==1 echo admin=true >> カーソル替え設定.txt
if %ErrorLevel%==0 goto setting2ygo2

:setting2ygo2
powershell "(gc カーソル替え設定.txt) -replace 'admin=true','admin=false' | sc カーソル替え設定.txt"
goto setting2yokey

:setting2ygo1
powershell "(gc カーソル替え設定.txt) -replace 'admin=false','admin=true' | sc カーソル替え設定.txt"
goto setting2yokey

:setting2yokey
cls
Echo 正常に変更されました。
Pause
set wantload=setting2
call :MOBAS_Loader
Goto settingcategory1intsetting2

:setting2n
cls
Echo 起動時の管理者権限の要求は%setting2onoff%になりませんでした
Pause
goto settingcategory1intsetting2

:setting3
if {%settinghelptoggle%}=={true} (goto setting3help)
find "CheckUpdate=false" カーソル替え設定.txt > nul
if %ErrorLevel%==0 set setting3setonoff=有効&goto setting3onoff
if %ErrorLevel%==1 set setting3setonoff=修復し、正常な状態&goto setting3onoff

:setting3onoff
find "CheckUpdate=true" カーソル替え設定.txt > nul
if %ErrorLevel%==0 set setting3setonoff=無効&set setting3warning=
:setting3okey
cls
echo 起動時に更新を確認する機能を%setting3setonoff%にしますか？(Y=はい N=いいえ B=戻る)
SET /P selected= :
echo %selected% が選択されました。
if {%selected%}=={y} (goto :setting3y)
if {%selected%}=={n} (goto :setting3n)
if {%selected%}=={back} (goto :settingcategory1intsetting3)
if {%selected%}=={b} (goto :settingcategory1intsetting3)
goto setting3okey

:setting3y
find "CheckUpdate=false" カーソル替え設定.txt > nul
echo 設定を適用中...
if %ErrorLevel%==1 goto setting3ygo3test
if %ErrorLevel%==0 goto setting3ygo1

:setting3ygo3test
find "CheckUpdate=true" カーソル替え設定.txt > nul
if %ErrorLevel%==1 echo CheckUpdate=false >> カーソル替え設定.txt
if %ErrorLevel%==0 goto setting3ygo2

:setting3ygo2
powershell "(gc カーソル替え設定.txt) -replace 'CheckUpdate=true','CheckUpdate=false' | sc カーソル替え設定.txt"
goto setting3yokey

:setting3ygo1
powershell "(gc カーソル替え設定.txt) -replace 'CheckUpdate=false','CheckUpdate=true' | sc カーソル替え設定.txt"
goto setting3yokey

:setting3n
cls
Echo 高速起動は有効になりませんでした
Pause
goto settingcategory1intsetting3

:setting3yokey
cls
Echo 高速起動を%setting3setonoff%にしました。
Pause
set wantload=setting3
call :MOBAS_Loader
Goto settingcategory1intsetting3

:setting4
if {%settinghelptoggle%}=={true} (goto setting4help)
find "hatenakeikoku=false" カーソル替え設定.txt > nul
if %ErrorLevel%==0 set setting4setonoff=有効&goto setting4okey
if %ErrorLevel%==1 set setting4setonoff=修復し、正常な状態&goto setting4onoff

:setting4onoff
find "hatenakeikoku=true" カーソル替え設定.txt > nul
if %ErrorLevel%==0 set setting4setonoff=無効

:setting4okey
cls
echo エンターキーの長押し検知機能を%setting4setonoff%にしますか？(Y=はい N=いいえ B=戻る)
SET /P selected= :
echo %selected% が選択されました。
if {%selected%}=={y} (goto :setting4y)
if {%selected%}=={n} (goto :setting4n)
if {%selected%}=={back} (goto :settingcategory1intsetting4)
if {%selected%}=={b} (goto :settingcategory1intsetting4)
goto setting4okey

:setting4y
find "hatenakeikoku=false" カーソル替え設定.txt > nul
echo 設定を適用中...
if %ErrorLevel%==1 goto setting4ygo3test
if %ErrorLevel%==0 goto setting4ygo1

:setting4ygo3test
find "hatenakeikoku=true" カーソル替え設定.txt > nul
if %ErrorLevel%==1 echo hatenakeikoku=true >> カーソル替え設定.txt
if %ErrorLevel%==0 goto setting4ygo2

:setting4ygo2
powershell "(gc カーソル替え設定.txt) -replace 'hatenakeikoku=true','hatenakeikoku=false' | sc カーソル替え設定.txt"
goto setting4yokey

:setting4ygo1
powershell "(gc カーソル替え設定.txt) -replace 'hatenakeikoku=false','hatenakeikoku=true' | sc カーソル替え設定.txt"
goto setting4yokey

:setting4yokey
cls
Echo 正常に適用されました。
Pause
set wantload=setting4
call :MOBAS_Loader
Goto settingcategory1intsetting4

:setting4n
cls
Echo 設定を変更しませんでした
Pause
goto settingcategory1intsetting4

:setting5
if {%settinghelptoggle%}=={true} (goto setting5help)
find "bootanimation=false" カーソル替え設定.txt > nul
if %ErrorLevel%==0 set setting5setonoff=有効&goto setting5okey
if %ErrorLevel%==1 set setting5setonoff=修復し、正常な状態&goto setting5onoff

:setting5onoff
find "bootanimation=true" カーソル替え設定.txt > nul
if %ErrorLevel%==0 set setting5setonoff=無効

:setting5okey
cls
echo 起動時のブートアニメーションを%setting5setonoff%にしますか？(Y=はい N=いいえ B=戻る)
SET /P selected= :
echo %selected% が選択されました。
if {%selected%}=={y} (goto :setting5y)
if {%selected%}=={n} (goto :setting5n)
if {%selected%}=={back} (Goto settingcategory2intsetting5_stg0)
if {%selected%}=={b} (Goto settingcategory2intsetting5_stg0)
goto setting5okey

:setting5y
find "bootanimation=false" カーソル替え設定.txt > nul
echo 設定を適用中...
if %ErrorLevel%==1 goto setting5ygo3test
if %ErrorLevel%==0 goto setting5ygo1

:setting5ygo3test
find "bootanimation=true" カーソル替え設定.txt > nul
if %ErrorLevel%==1 echo bootanimation=true >> カーソル替え設定.txt
if %ErrorLevel%==0 goto setting5ygo2

:setting5ygo2
powershell "(gc カーソル替え設定.txt) -replace 'bootanimation=true','bootanimation=false' | sc カーソル替え設定.txt"
goto setting5yokey

:setting5ygo1
powershell "(gc カーソル替え設定.txt) -replace 'bootanimation=false','bootanimation=true' | sc カーソル替え設定.txt"
goto setting5yokey

:setting5yokey
cls
Echo 設定を変更しました。
Pause
set wantload=setting5
call :MOBAS_Loader
Goto settingcategory2intsetting5_stg0


:setting5n
cls
Echo 設定を変更しませんでした
Pause
Goto settingcategory2intsetting5_stg0


:setting5_1
if {%settinghelptoggle%}=={true} (goto setting5_1help)
find "s5_linuxboot=false" カーソル替え.txt > nul
if %ErrorLevel%==0 set setting5_1setonoff=有効&goto setting5_1okey
if %ErrorLevel%==1 set setting5_1setonoff=修復し、正常な状態&goto setting5_1onoff

:setting5_1onoff
find "s5_linuxboot=true" カーソル替え.txt > nul
if %ErrorLevel%==0 set setting5_1setonoff=無効

:setting5_1okey
cls
echo 起動時のlinux風の起動アニメーションを%setting5_1setonoff%にしますか？(Y=はい N=いいえ B=戻る)
SET /P selected= :
echo %selected% が選択されました。
if {%selected%}=={y} (goto :setting5_1y)
if {%selected%}=={n} (goto :setting5_1n)
if {%selected%}=={back} (goto :settingcategory2intsetting5_stg0)
if {%selected%}=={b} (goto :settingcategory2intsetting5_stg0)
goto setting5_1okey

:setting5_1y
find "s5_linuxboot=false" カーソル替え.txt > nul
echo 設定を適用中...

if %ErrorLevel%==1 goto setting5_1ygo3test
if %ErrorLevel%==0 goto setting5_1ygo1

:setting5_1ygo3test
find "s5_linuxboot=true" カーソル替え.txt > nul
if %ErrorLevel%==1 echo s5_linuxboot=false >> カーソル替え.txt
if %ErrorLevel%==0 goto setting5_1ygo2

:setting5_1ygo2
powershell "(gc カーソル替え.txt) -replace 's5_linuxboot=true','s5_linuxboot=false' | sc カーソル替え.txt"
set linuxboot=false
goto setting5_1yokey

:setting5_1ygo1
powershell "(gc カーソル替え.txt) -replace 's5_linuxboot=false','s5_linuxboot=true' | sc カーソル替え.txt"
set linuxboot=true
goto setting5_1yokey

:setting5_1yokey
cls
Echo 設定を変更しました。
Pause
set wantload=setting5_1
call :MOBAS_Loader
Goto settingcategory2intsetting5_stg1

:setting5_1n
cls
Echo 設定を変更しませんでした
Pause
goto settingcategory2intsetting5_stg1


:setting5_2
if {%settinghelptoggle%}=={true} (goto setting5_2help)
find "s5_simpleboot=false" カーソル替え.txt > nul
if %ErrorLevel%==0 set setting5_2setonoff=有効&goto setting5_2okey
if %ErrorLevel%==1 set setting5_2setonoff=修復し、正常な状態&goto setting5_2onoff

:setting5_2onoff
find "s5_simpleboot=true" カーソル替え.txt > nul
if %ErrorLevel%==0 set setting5_2setonoff=無効

:setting5_2okey
cls
echo 起動時のシンプルなブートアニメーションを%setting5_2setonoff%にしますか？(Y=はい N=いいえ B=戻る)
SET /P selected= :
echo %selected% が選択されました。
if {%selected%}=={y} (goto :setting5_2y)
if {%selected%}=={n} (goto :setting5_2n)
if {%selected%}=={back} (goto :settingcategory2intsetting5_stg1)
if {%selected%}=={b} (goto :settingcategory2intsetting5_stg1)
goto setting5_2okey

:setting5_2y
find "s5_simpleboot=false" カーソル替え.txt > nul
echo 設定を適用中...
if %ErrorLevel%==1 goto setting5_2ygo3test
if %ErrorLevel%==0 goto setting5_2ygo1

:setting5_2ygo3test
find "s5_simpleboot=true" カーソル替え.txt > nul
if %ErrorLevel%==1 echo s5_simpleboot=false >> カーソル替え.txt
if %ErrorLevel%==0 goto setting5_2ygo2

:setting5_2ygo2
powershell "(gc カーソル替え.txt) -replace 's5_simpleboot=true','s5_simpleboot=false' | sc カーソル替え.txt"
set simpleboot=false
goto setting5_2yokey

:setting5_2ygo1
powershell "(gc カーソル替え.txt) -replace 's5_simpleboot=false','s5_simpleboot=true' | sc カーソル替え.txt"
set simpleboot=true
goto setting5_2yokey

:setting5_2yokey
cls
Echo 設定を変更しました。
Pause
set wantload=setting5_2
call :MOBAS_Loader
Goto settingcategory2intsetting5_stg2

:setting5_2n
cls
Echo 設定を変更しませんでした
Pause
goto settingcategory2intsetting5_stg2



:setting5_3
if {%settinghelptoggle%}=={true} (goto setting5_3help)
find "s5_rawboot=false" カーソル替え.txt > nul
if %ErrorLevel%==0 set setting5_3setonoff=有効&goto setting5_3okey
if %ErrorLevel%==1 set setting5_3setonoff=修復し、正常な状態&goto setting5_3onoff

:setting5_3onoff
find "s5_rawboot=true" カーソル替え.txt > nul
if %ErrorLevel%==0 set setting5_3setonoff=無効

:setting5_3okey
cls
echo 起動時の生アニメーションを%setting5_3setonoff%にしますか？(Y=はい N=いいえ B=戻る)
SET /P selected= :
echo %selected% が選択されました。
if {%selected%}=={y} (goto :setting5_3y)
if {%selected%}=={n} (goto :setting5_3n)
if {%selected%}=={back} (goto :settingcategory2intsetting5_stg3)
if {%selected%}=={b} (goto :settingcategory2intsetting5_stg3)
goto setting5_3okey

:setting5_3y
find "s5_rawboot=false" カーソル替え.txt > nul
echo 設定を適用中...

if %ErrorLevel%==1 goto setting5_3ygo3test
if %ErrorLevel%==0 goto setting5_3ygo1

:setting5_3ygo3test
find "s5_rawboot=true" カーソル替え.txt > nul
if %ErrorLevel%==1 echo s5_rawboot=false >> カーソル替え.txt
if %ErrorLevel%==0 goto setting5_3ygo2

:setting5_3ygo2
powershell "(gc カーソル替え.txt) -replace 's5_rawboot=true','s5_rawboot=false' | sc カーソル替え.txt"
set rawboot=false
goto setting5_3yokey

:setting5_3ygo1
powershell "(gc カーソル替え.txt) -replace 's5_rawboot=false','s5_rawboot=true' | sc カーソル替え.txt"
set rawboot=true
goto setting5_3yokey

:setting5_3yokey
cls
Echo 設定を変更しました。
Pause
set wantload=setting5_3
call :MOBAS_Loader
Goto settingcategory2intsetting5_stg3

:setting5_3n
cls
Echo 設定を変更しませんでした
Pause
goto settingcategory2intsetting5_stg3



:wmode
if {%settinghelptoggle%}=={true} (goto wmodehelp)
cd /d %batchmainpath%
:wmodetest
find "wmode=false" カーソル替え設定.txt > nul
if %ErrorLevel%==0 set wmodesetonoff=ホワイト
if %ErrorLevel%==1 set wmodesetonoff=テーマの設定を修復し、正常な& goto wmodeonoff

:wmodeonoff
find "wmode=true" カーソル替え設定.txt > nul
if %ErrorLevel%==0 set wmodesetonoff=ダーク

cls
echo カーソル替えのテーマを%wmodesetonoff%テーマにしますか？(Y=はい N=いいえ B=戻る)
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
goto wmode

:wmodey
find "wmode=false" カーソル替え設定.txt > nul
echo テーマを適用中...
if %ErrorLevel%==1 goto wmodeygo3test
if %ErrorLevel%==0 goto wmodeygo1

:wmodeygo3test
find "wmode=true" カーソル替え設定.txt > nul
if %ErrorLevel%==1 echo wmode=false >> カーソル替え設定.txt&goto wmodeygo1
if %ErrorLevel%==0 goto wmodeygo2

:wmodeygo2
powershell "(gc カーソル替え設定.txt) -replace 'wmode=true','wmode=false' | sc カーソル替え設定.txt"
goto wmodeyokey

:wmodeygo1
powershell "(gc カーソル替え設定.txt) -replace 'wmode=false','wmode=true' | sc カーソル替え設定.txt"
goto wmodeyokey

:wmodeyokey
Title カーソル替え
find "wmode=false" カーソル替え設定.txt > nul
if %ErrorLevel%==0 color 07
if %ErrorLevel%==1 goto wmodeonoffkenti
:wmodeonoffkenti
find "wmode=true" カーソル替え設定.txt > nul
if %ErrorLevel%==0 color f0
cls
echo %wmodesetonoff%テーマに変更しました。
Pause
set wantload=wmode
call :MOBAS_Loader
if {%wmodetoggle%}=={false} (set clr=[7m&set clr2=[0m)
if {%wmodetoggle%}=={true} (set clr=[100m[97m&set clr2=[0m[107m[30m)
Goto settingcategory2intsetting2

:no01
cls
echo %wmodesetonoff%テーマには変更しませんでした。
pause
Goto :settingcategory2intsetting2

rem 設定のヘルプ
:setting1help
cls
echo この設定は、ゆうまでもなくこのバッチ処理のメインでもあるカーソルを変更する機能を使用した後に一度再起動を確認するところがあるのですが、その部分を無効にし、シームレスに
echo カーソルを変えれるようにする設定です。まぁですがあまりカーソルを頻繁に変えたいという人は少ないと思いますので、おそらくあまり使われないであろう機能でしょう。
echo この設定はデフォルトでは有効です。
pause
goto settingcategory1intsetting1

:setting2help
cls
echo この設定は、管理者権限でカーソル替えを実行することによって、カーソルを変更する際にエラーが起きないようにするためにあります。
echo もし仮に、カーソルを変更する際にエラーもしくは変更できなかった場合のみにこの設定を有効にすることを推奨します。
echo この設定を有効にすることによって起動時間が短縮される場合があります。
echo この設定はデフォルトでは無効です。
pause
goto settingcategory1intsetting2

:setting3help
cls
echo この機能はカーソル替えの起動時に更新を確認するか否かの設定です。
echo この機能を有効にすると、毎起動時にアップデートの確認が行われます。
echo アップデートが利用可能なら適用することができます。
echo お使いのインターネットや環境の速度によっては起動時間が遅くなる可能性があります。
echo 一時間にだいたい50回以上連続して起動すると、githubのAPIレート制限に到達する可能性があります。(総合的に3~4回ほどAPIを利用するため、高負荷)
echo この設定はデフォルトでは無効です。
pause
goto settingcategory1intsetting3

:setting4help
cls
echo この設定は少々わかりにくいですが、簡単に言うとバッチを起動したときに表示される画面のままで何も入力せずにエンターを長押ししたときに出てくる
echo 警告メッセージをoff/onにできる機能です。
echo これは実際に体験してもらったほうがわかりやすいのですが、まぁ大体50回~250回くらいの間エンターを長押しか押していると、
echo 警告文が表示される感じになりますね。しかし時にはこれがうっとおしいと思う人もいるかと思いますので、この機能をオフにできる設定を追加しました。
echo この設定はデフォルトでは有効です。
pause
goto settingcategory1intsetting4

:setting5help
cls
echo この設定は、起動時に必ず毎回流れるブートアニメーション、いわば起動画面を無効にし非表示にする設定です。
echo この設定を無効にすることによって、起動時間の短縮やうっとうしさの軽減につながります。
echo この設定はデフォルトでは有効です。
pause
Goto settingcategory2intsetting5_stg0

:setting5_1help
cls
echo この設定はリナックス風の起動アニメーションを再生するようにする設定です。
echo 起動中なのがわかりやすく、見た目が良いです。また、起動中にエラーが発生した際に、エラーが発生した個所がわかりやすくなることがあります。
echo この設定はsimplebootおよびrawbootと併用できません。
echo この設定は標準ではfalseです。
pause
goto settingcategory2intsetting5_stg1

:setting5_2help
cls
echo この設定は起動時に"起動中..."というテキストのみで起動させるようにする設定です。
echo 高速かつ分かりやすく、シンプルです。ただしつまらなく見える可能性がありマス。
echo この設定はlinuxbootおよびrawbootと併用できません。
echo この設定は標準ではfalseです。
pause
goto settingcategory2intsetting5_stg2

:setting5_3help
cls
echo この設定は起動時にecho onの状態で起動するようにする設定です。
echo シンプルでわかりやすく、現在何が実行されているかが一目でわかります。また、ハッカー気分にもなれます。
echo この設定はlinuxbootおよびsimplebootと併用できません。
echo この設定は標準ではfalseです。
pause
goto settingcategory2intsetting5_stg3

:wmodehelp
cls
echo これはCMDの画面を白色または黒色に変える物です。
echo これを使用すると、例えば画面はホワイトテーマで統一させたり、またそのほうが好きという人にも対応できるようになります。
echo 標準では黒色ですが、白色にした後、今後起動したときに自動的に画面が白色になるようになります。
echo また、ちょっとした裏話ですがこの設定は、1.10以前まではホーム側に設置されていました。また、この機能は設定の内部構造のもとになっています。
echo 標準ではダークテーマです。
pause
goto settingcategory2intsetting2
 
:alldefhelp
cls
echo これはアンインストールメニューです。このメニューはカーソル替えのアンインストールを行います。
echo このメニューには設定ファイル（設定が記録されているテキストファイル）のパスを表示する機能、設定を初期化(デフォルトに)する機能が含まれています。
echo アンインストールを実行する場合、カーソル替え本体が削除され、（任意）カーソルもデフォルトに削除されます。（任意）設定、初回起動を検知するためのファイルも完全に削除されます。
echo 実行する際はくれぐれも自己責任で実行してください。
pause
goto settingcategory1intsetting5

rem バッチのバージョン
:batver
rem Version of batch
:batver
title カーソル替え バージョン (試験的)
if {%batverdev%}=={beta} (set batverdevshow=ベータ)
if {%batverdev%}=={stable} (set batverdevshow= 安定 )
echo.
echo.
echo     by tamago_1908   2021-2024
echo     O========================================O
echo     I                                        I
echo     I          カーソル替え %batverdevshow% 版        I
echo     I                                        I
echo     O========================================O 
echo           Version : %batver%  %batbuild%
echo.
echo アップデートを確認しますか？
set /p selected=Y or N : 
if {%selected%}=={y} (goto batverupdate) else if {%selected%}=={yes} (goto batverupdate) else if {%selected%}=={n} (goto hazime) else if {%selected%}=={no} (goto hazime) else (echo すみません。YかNのみを入力してください。&pause&cls&goto batver )
pause
cls
set batverdevshow=
goto hazime

:batverupdate
cd %~dp0
echo アップデートプロセスを開始しています...
:updatecode
set batbootpowershell=Fullupdater
call :batbootpowershell

pause
goto hazime

rem 電卓
:startcal
set q=0
set number1=0
set number2=0
set number3=0
cls
echo 2147483647の計算まで(int型の上限 仕様上これより上の計算は不可)
echo.
title カーソル電卓

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
if {%q%}=={back} (goto hazime)
if {%q%}=={b} (goto hazime)
if {%q%}=={1} (set whatnumber=足される側&goto startcal2)
if {%q%}=={2} (set whatnumber=引かれる側&goto startcal2) 
if {%q%}=={3} (goto advancemodecal) else (
echo 無効な選択です&pause&goto startcal)

:startcal2
echo.
set /p number1=%whatnumber%を入力 :
if {%q%}=={1} (goto pcal)
if {%q%}=={2} (goto mcal)

:pcal
set /p number3=足す側を入力 :
set /a number1=number1+number3
echo 結果 : %number1%
pause
cls
goto simplemodecal

:mcal
set /p number3=引く側を入力 :
set /a number1=number1-number3
echo 結果 : %number1%
pause
cls
goto simplemodecal

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
goto loopcal

:cursorchange
rem メモ　変数で分岐して、変更する。デフォルトをベースに作成
rem カーソル替えのメイン機能。これがなきゃ始まらない
cls
echo                              カーソル替え%batver% %debugmode%
title カーソル*替え* %debugmode%
echo.
SET /P selected=%cursorcolor%色に戻しますか？(Y=Yes / N=No / B=Back)
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
echo すみません。もう一度言っていただけませんか？
echo.
pause
goto cursorchange

:no0
echo 変更はされませんでした。
pause
goto hazime

:yes0
find "CursorChanged" 初回カーソル.txt > nul
if "%errorlevel%"=="0" goto changetodefault else goto FirstWarning
rem Write settings (default)
:FirstWarning
if not defined dummy (set clrfirstwarning=[40m[37m)
if {%wmodetoggle%}=={false} (set clrfirstwarning=[40m[37m)
if {%wmodetoggle%}=={true} (set clrfirstwarning=[107m[30m)
rem warning message, first-time startup only
cls
echo 初回変更時のみ
timeout /t 1 /nobreak >nul
cls
echo.
timeout /t 1 /nobreak >nul
if {%wmodetoggle%}=={true} (color f0) else (color 07)
echo 　　　                         　！注意！
timeout /t 1 /nobreak >nul
if {%wmodetoggle%}=={true} (color fc) else (color 0c)
timeout /t 1 /nobreak >nul
if {%wmodetoggle%}=={true} (color f4) else (color 04)
timeout /t 1 /nobreak >nul
echo.
echo %clrfirstwarning%このbatファイル（以下、スクリプト）は、カーソルをデフォルト、または黒色にするだけのスクリプトです。
timeout /t 2 /nobreak >nul
echo %clrfirstwarning%ないとは思いますが、このスクリプトを使用するにあたって発生した損害、またはコンピューターの損傷等の被害の責任は製作者であるそこら辺にある卵は一切の責任を取りません！
pause
echo.
echo.
rem 警告の分岐。noを入力するとカーソル替え設定.txtが削除される。
:warningfirstchenge
set clrfirstwarning=
SET /P selected=よろしいですか？(Y=Yes / N=No)
if {%selected%}=={n} (goto hazime)
if {%selected%}=={no} (goto hazime) 
if {%selected%}=={yes} (goto henkoudefo)
if {%selected%}=={y} (goto henkoudefo)
echo %selected% が選択されました。
echo.
echo ?
pause
echo.
echo すみません。もう一度言っていただけませんか？
pause
goto warningfirstchenge
:henkoudefo
find "CursorChanged" 初回カーソル.txt > nul
if "%errorlevel%"=="1" (
    find "nodogcheckforCheckUpdate" 初回カーソル.txt > nul
    if "%errorlevel%"=="1" (
    echo nodogcheckforfastboot > 初回カーソル.txt
    echo CursorChanged >> 初回カーソル.txt
    ) else echo CursorChanged >> 初回カーソル.txt
)
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
title すでに明るい
echo 
echo なに！？なぜだ！こんなことはあり得ないっ！！！俺のそばに近寄るなぁーっ！
goto exit

:kurogotest
reg query "HKEY_CURRENT_USER\Control Panel\Cursors" /v "Scheme Source" | find "0x2"
cls
if {%ErrorLevel%}=={0} (goto sudenikuro)
if {%ErrorLevel%}=={1} (goto kurogo)

:sudenikuro
rem 幻の警告メッセージ。今現在ではこれが表示される事はほぼあり得ない。
title すでに黒い
echo 
echo なに！？なぜだ！こんなことはあり得ないっ！！！俺のそばに近寄るなぁーっ！
goto exit

rem カーソルの色を白に変更する
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
echo デフォルトに戻しました。
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
echo 変更しました
pause
goto reboot

rem dogcheck。カーソル替え設定.txtが存在するかを検証
:AllDefult
cd /d %batchmainpath%
if {%settinghelptoggle%}=={true} (goto alldefhelp)
if exist カーソル替え設定.txt goto AllDefulttest
if not exist カーソル替え設定.txt goto Dogcheck

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
cd /d %batchmainpath% 
find "nodogcheckfor1234567890qwertyuiop" カーソル替え設定.txt
cls
if %ErrorLevel%==0 goto AllDefult1
if %ErrorLevel%==1 goto Dogcheck
rem アンインストールメニュー
:AllDefult1
title カーソル替えのアンインストール (試験的)
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
echo このメニューでは設定を初期化します。したがって、あなたが今までに設定したものはすべて初期設定に戻ります。（カーソル替えを初めて起動したときの設定に戻る）よろしいですか？(Y=Yes / N=No)
choice /c yn /n /m ""
if %ErrorLevel%==1 goto alldefsettingonlyokey2
if %ErrorLevel%==2 goto alldefsettingno
:alldefsettingonlyokey2
echo 本当に削除するのですね？(Y=Yes / N=No)
choice /c yn /n /m ""
if %ErrorLevel%==1 goto alldefsettingyes
if %ErrorLevel%==2 goto alldefsettingno
goto alldefsettingonly

:alldefsettingyes
echo 設定ファイルを初期化します。いままでの設定はすべて削除されます。
echo キャンセルする場合は、この時点でバッチ処理を終了してください。
pause
cls
call :Wipealldeta
title ...
echo 初期化が完了しました。変更を適用するため、カーソル替えを再起動します。何かキーを押して再起動...
pause >nul
goto :Rebootbatch
:alldefsettingno
cls
echo 設定は初期化されませんでした。
pause
:alldefsettingno2
cls
echo このままアンインストールメニューに行くか、もしくはホームに戻るか。
echo どっちにしますか？(設定に戻る=1 / アンインストールメニュー=2)
choice /c 12 /n /m ""
if %ErrorLevel%==1 goto settingcategory1intsetting5
if %ErrorLevel%==2 goto :alldefselect3
goto alldefsettingno2

:alldefshowsettingpass
cls
echo 設定ファイルが置かれているパスを表示します。
start explorer %batchmainpath%
powershell sleep 5
echo 環境にもよりますが、たいていの場合、下のほうまたは上のほうにカーソル替え設定.txtがあると思います。
pause
cls
:alldefshowsettingpass2
echo このままアンインストールメニューに行くか、もしくはホームに戻るか。
echo どっちにしますか？(設定に戻る=1 / アンインストールメニュー=2)
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
title カーソル替えのアンインストール %debugmode%
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
echo すみません。もう一度言っていただけませんか？
echo.
pause
cls
goto AllDefultOkey

:no2
cls
color 0B
echo [40m[3m[96m時を戻そう
timeout /t 3 /nobreak >nul
find "wmode=false" カーソル替え設定.txt > nul
if %ErrorLevel%==0 color 07
if %ErrorLevel%==1 goto wmodeonoffkenti
:wmodeonoffkentialldefno2
find "wmode=true" カーソル替え設定.txt > nul
if %ErrorLevel%==0 color f0
goto hazime

:yes2
rem アンインストールの最終確認
set selected=
SET /P selected=本当にいいですね？(Y=Yes / N=No / B=Back)
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
echo すみません。もう一度言っていただけませんか？
pause
cls
goto yes2


:yes2final
rem アンインストールの最終確認 シーズン２
set selected=
echo.
echo 
SET /P selected=%alldefclr%こうかい　しませんね？(もどせませんよ！)%alldefclr2%(Y=Yes / N=No / B=Back)
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
echo すみません。もう一度言っていただけませんか？
pause
cls
goto yes2final

:yes2go
rem 引き下がれない。来る...ッ！
cls
color 9f
echo 実行します。戻る場合はバッチファイルを停止してください。
pause

rem アンインストールメニューの例外処理 初回カーソルがない場合の。だけど冗長だから改善したい。
rem 例外処理をもうちょっと増やしたい。例えば、中身を改造しない限り絶対にありえない状態になった場合に、gotoして変数で分岐してメッセージを変更するみたいにして。
cd /d %batchmainpath%
if not exist 初回カーソル.txt set erroralldefwhatdelete=初回カーソル & goto BSOD_Errors
:testerroralldef
if not exist カーソル替え設定.txt set erroralldefwhatdelete=カーソル替え設定 & goto BSOD_Errors
set erroralldefwhatdelete=初回カーソル.txtと、カーソル替え設定.txt、その両方の
goto alldefnow

:BSOD_Errors
set runningfromfulldebug=
set FromREConsole=
timeout /t 1 /nobreak >nul
if not defined invisiblecursor (echo [?25l&set invisiblecursor=true)
title ブルースクリーン！
mode con: cols=97 lines=26
color 1f
rem message indication
echo 
cls
echo.
echo.
echo                            ###
echo                            ###
echo            ###          ###
echo            ###          ###
echo                         ###
echo                         ###
echo            ###          ###
echo            ###          ###
echo                            ###
echo                            ###
echo.
echo.
echo          カーソル替えがクラッシュしました！
echo.
echo          この画面は何らかの理由でカーソル替えがクラッシュした際に表示されます。
echo          サポートを得る際には以下の情報が役に立つかもしれません :
echo.
echo          エラーID : %1
echo.
echo          この画面についての詳細情報を得る際には以下のリンクにアクセスしてください (英語) :
echo.
echo          https://github.com/tamago1908/Cursor-Changer.bat/wiki/BSOD-Crash-(Error-Screen)
echo.
if {%1}=={0} (goto :BSOD_Errors0message)
if {%1}=={1} (goto :BSOD_Errors1message)
if {%1}=={2} (goto :BSOD_Errors2message)
if {%1}=={3} (goto :BSOD_Errors3message)
if {%1}=={4} (goto :BSOD_Errors4message)

if {%1}=={} (goto :BSOD_ErrorsABSOLUTYNO)

:BSOD_Errors0message
echo Dim answer:answer = MsgBox("不明かつ致命的なエラーが発生しました！",vbOKOnly,"致命的なエラー"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul
del /Q %TEMP%\msgbox.vbs

:BSOD_Errors0message2
echo Dim answer:answer = MsgBox("エラーの概要 : 不明なエラーが発生しました。 エラー ID : 0",vbokony,"エラー"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul

:BSOD_Errors0message3
echo Dim answer:answer = MsgBox("殆どの場合、開発者による致命的な構文エラーもしくはミスによって起こります。 (予期していないexit /bや構文エラーなど)",vbokonly,"エラー"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul

:BSOD_Errors0message4
echo Dim answer:answer = MsgBox("環境を見直したり、セキュリティーソフトなどを見直したのちに、再度エラーが起こった場所をやり直してください。",vbokonly,"どうすればいい？"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul

:BSOD_Errors0message5
echo Dim answer:answer = MsgBox("それでもなお改善しない場合、githubのissueにて報告してください。",vbokonly,"エラー"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul
goto :BSOD_ErrorsRorR


:BSOD_Errors1message
echo Dim answer:answer = MsgBox("起動中に致命的なエラーが発生しました！",vbOKOnly,"致命的なエラー"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul
del /Q %TEMP%\msgbox.vbs

:BSOD_Errors0message2
echo Dim answer:answer = MsgBox("エラーの概要 : 不明なエラーがMobas_LoaderまたはSetting_Loaderで発生しました。 エラー ID : 1",vbokony,"エラー"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul

:BSOD_Errors1message3
echo Dim answer:answer = MsgBox("このエラーは何らかの致命的なエラーがカーソル替えの起動中に発生した際に起こります。",vbokonly,"エラー"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul

:BSOD_Errors1message4
echo Dim answer:answer = MsgBox("環境を見直したり、セキュリティーソフトなどを見直したのちに、再度エラーが起こった場所をやり直してください。",vbokonly,"どうすればいい？"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul

:BSOD_Errors1message5
echo Dim answer:answer = MsgBox("それでもなお改善しない場合、githubのissueにて報告してください。",vbokonly,"エラー"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul
goto :BSOD_ErrorsRorR


:BSOD_Errors2message
echo Dim answer:answer = MsgBox("Mobas_Loaderでエラーが発生しました！",vbokonly,"エラー"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul
del /Q %TEMP%\msgbox.vbs

:BSOD_Errors2message2
echo Dim answer:answer = MsgBox("エラーの概要 : Mobas_Loaderがcallされる際に必要な変数の値が不適切な値でした。 %wantload% エラー ID : 2",vbokony,"エラー"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul

:BSOD_Errors2message3
echo Dim answer:answer = MsgBox("このエラーが起こるのは非常に珍しく、起こることは基本的にありません。ただし、デバッグ用途の機能を利用した際には起こる可能性があります。",vbokonly,"エラー"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul

:BSOD_Errors2message4
echo Dim answer:answer = MsgBox("環境を見直したり、セキュリティーソフトなどを見直したのちに、再度エラーが起こった場所をやり直してください。",vbokonly,"どうすればいい？"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul

:BSOD_Errors2message5
echo Dim answer:answer = MsgBox("それでもなお改善しない場合、githubのissueにて報告してください。",vbokonly,"エラー"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul
goto :BSOD_ErrorsRorR


:BSOD_Errors3message
echo Dim answer:answer = MsgBox("アンインストールの際にエラーが発生しました！",vbOKCancel,"エラー"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul

:BSOD_Errors3message2message
echo Dim answer:answer = MsgBox("エラーの概要 : アンインストールを実行する際に存在しているべきはずのファイルが存在していませんでした！ エラー ID : 3",vbOKCancel,"エラー"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul

:BSOD_Errors3message3message
echo Dim answer:answer = MsgBox("...まぁ、実際にはあなたが%erroralldefwhatdelete%を削除したのが原因だろうけどね。",vbYesno,""):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul
if {%invisiblecursor%}=={true} (echo [?25h&set invisiblecursor=)
if {%errorlevel%}=={6} (del /Q %TEMP%\msgbox.vbs&goto :BSOD_Errors3message3messageok)
if {%errorlevel%}=={7} (del /Q %TEMP%\msgbox.vbs&goto :BSOD_Errors3message3messageno)
goto BSOD_Errors3message3message

:BSOD_Errors3message3messageok
echo Dim answer:answer = MsgBox("しってた",vbOKCancel,""):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
del /Q %TEMP%\msgbox.vbs
goto :BSOD_ErrorsRorR

:BSOD_Errors3message3messageno
echo Dim answer:answer = MsgBox("えぇ...でももしファイルを削除していないのにこのエラーが出た場合には、環境を見直したり、セキュリティーソフトなどを見直したのちに、再度エラーが起こった場所をやり直してください。",vbOKCancel,"エラー"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %ERRORLEVEL% > nul
del /Q %TEMP%\msgbox.vbs

:BSOD_Errors3message4
echo Dim answer:answer = MsgBox("それでもなお改善しない場合、githubのissueにて報告してください。",vbokonly,"エラー"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul
goto :BSOD_ErrorsRorR


:BSOD_Errors4message
echo Dim answer:answer = MsgBox("お前のパソコンは今俺がぶっ壊した！！！！！！！",vbokonly,"マジ"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul
del /Q %TEMP%\msgbox.vbs

:BSOD_Errors4message2
echo Dim answer:answer = MsgBox("エラーの概要 : お前のパソコンはクソみたいにぶっ壊れた！！！ エラー ID : 9999999",vbokony,"エラー"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul

:BSOD_Errors4message3
echo Dim answer:answer = MsgBox("パソコンが破壊された！！それだけ！！！！！！！！！！！！！！",vbokonly,"エラー"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul

:BSOD_Errors4message4
echo Dim answer:answer = MsgBox("新しくパソコン買え！！！！！！！！！！！！！！！！！！！",vbokonly,"どうすればいい？"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul

:BSOD_Errors4message5
echo Dim answer:answer = MsgBox("もしこのエラーが引き続き出る場合は、とっととegg1を入力するのやめろ！！なんでこのエラーが出たかわかってんだろ！ふざけんな！",vbokonly,"エラー"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul
goto :BSOD_ErrorsRorR


:BSOD_ErrorsABSOLUTYNO
cls
echo THE SYSTEM HAS BEEN DESTROYED
echo.
echo エラー ID : 6 (bsod_errorsが引数なしにcallまたはgotoされました。)
pause
if {%invisiblecursor%}=={true} (echo [?25h&set invisiblecursor=)
if {%wmodetoggle%}=={true} (color f0) else (color 07)
goto hazime


:BSOD_ErrorsRorR
echo Dim answer:answer = MsgBox("はいを押すと今この時点で再起動し、いいえを押すとリカバリーメニューに移動します。",vbyesno,"どちらかを選択してください。"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul
if {%invisiblecursor%}=={true} (echo [?25h&set invisiblecursor=)
if {%errorlevel%}=={6} (del /Q %TEMP%\msgbox.vbs&goto :batrestart)
if {%errorlevel%}=={7} (del /Q %TEMP%\msgbox.vbs&goto :Cursor_Changer_REmenu)




rem アンインストールメニューの選択の判別
:alldefnow
cls
color 07
if %alldefselect%==1 goto alldefnowchangeit
if %alldefselect%==2 goto alldefnowsettingdel

rem アンインストールメニューの選択に応じての分岐
:alldefnowsettingdel
del 初回カーソル.txt
del カーソル替え設定.txt
goto alldefnowfinish

:alldefnowchangeit
del 初回カーソル.txt
del カーソル替え設定.txt
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
title さようなら！ %debugmode%
echo すべてをデフォルトに戻しました。
pause
echo これでお別れですね。さようなら。
pause
rem 自身のパスを取得して、自分自身を削除
del %batpath%
exit

:reboot
rem 設定に応じてrebootメッセージを再生するかどうかの判別
find "rebootokey=false" カーソル替え設定.txt
if {%errorlevel%}=={0} (goto rebootexit)
if {%errorlevel%}=={1} (goto rebootoktest)
cls

:rebootexit
exit

:rebootoktest
find "rebootokey=true" カーソル替え設定.txt
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
echo すみません。もう一度言っていただけませんか？
pause
goto rebootok

:nore
echo 再起動はされませんでした。
pause
echo ...
pause
goto higan

:yesre
echo 再起動します。
pause
shutdown /r /t 2
goto Rebootbatch

:higan
title 悲願 %debugmode%
SET /P selected=ならせめてサインアウトだけでもお願いします.....(Y=Yes / N=No / B=Back)
if {%selected%}=={egg} (goto :secret)
if {%selected%}=={y} (goto :yes)
if {%selected%}=={yes} (goto :yes)
if {%selected%}=={n} (goto :nohi)
if {%selected%}=={no} (goto :nohi)
if {%selected%}=={back} (goto :rebootok)
if {%selected%}=={b} (goto :rebootok)

echo ?
pause
echo すみません。もう一度言っていただけませんか？
pause
goto higan

:nohi
echo.
echo わかりました....
goto Rebootbatch

:yes
echo ありがとうございます。
goto Lock

:testwipmenu
echo wip menu with test function
echo
echo

:secret
rem イースターエッグ
rem btw this easteregg is little good quality so maybe i will delete this.
title why? %debugmode%
echo えっ？なんでその言葉を....
pause
SET /P selected=どこでこの言葉を知ったんですか？(ローマ字で入力)
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
echo すみません。もう一度言っていただけませんか？
pause
goto rebootok

:secretnormal
echo えっ？てことは直感でやったってことなの？
pause
echo うそでしょ...?
goto Rebootbatch
:secrethentai
echo キャーッ！%USERNAME%さんのエッチー！
goto Rebootbatch


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
if {%batargmentonly%}=={true} (
set clr=[7m&set clred=[91m&set clrgrn=[92m&set clryel=[93m&set clrmag=[95m&set clrgra=[90m&set clrcyan=[96m&set clr2=[0m
) else (おかしいな、そうに決まってる。だってbatargmentonlyが期待された値ではなかったんだから。だってよお、直近でsetしてるのにこうなるなんてありえねえよなぁ！？？！？！！？！？？！？！？！？！？！？&pause&exit)
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
echo [10;25H[44m┌───  パスワード 入力 ───┐ [0m
echo [11;25H[44m│                        │ [0m
echo [12;25H[44m│ ┃[0m                    ┃[44m │ [0m
echo [13;25H[44m│                        │ [0m
echo [14;25H[44m└────────────────────────┘ [0m
echo [15;25H[44m   B=削除  Y=決定  E=戻る  [0m
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
if %num%==11 if "%input%"=="1908" (echo [17;28H正しいパスワードです。&timeout /t 2 /nobreak >nul&echo [?25h&set invisiblecursor=&setlocal disabledelayedexpansion&set input=&set len=&set allcommandlock=false&goto allcommandsmain) else (echo [17;12H不正解！ 再度試す場合には、batchを再起動してください。&timeout /t 3 /nobreak >nul&set input=&set len=0&set allcommandlock=true&goto hazimemenu)
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
if not defined dummy (set clr=[7m&set clred=[91m&set clrgrn=[92m&set clryel=[93m&set clrmag=[95m&set clrcyan=[96m&set clrgra=[90m&set clr2=[0m)
if {%wmodetoggle%}=={false} (set clr=[7m&set clred=[91m&set clrgrn=[92m&set clryel=[93m&set clrmag=[95m&set clrgra=[90m&set clrcyan=[96m&set clr2=[0m)
if {%wmodetoggle%}=={true} (set clr=[100m[97m&set clred=[91m&set clrgrn=[92m&set clryel=[93m&set clrmag=[95m&set clrgra=[90m&set clrcyan=[96m&set clr2=[0m[107m[30m)
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
echo          %clryel%・%clr2%inspectentirecommandlist %clrgra%(Displays all available commands.)%clr2%
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
echo                            !警告!
echo.
echo この機能は開発者向けに作成されたものです。ですので、開発者以外の人が利用した場合、何らかのバグや問題を引き起こす可能性があります。
echo それでもこの機能を使用したい場合には、"y"を入力して下さい。
echo 戻るか、キャンセルしたい場合には、"n"を入力してください。
echo 一度yを入力した場合、このbatchを直接再起動するか、変数"fulldebug"を削除しない限りこのメッセージは再度表示されなくなります。
set /p selected=Y or N : 
if %selected%==n goto hazimemenu
if %selected%==y set fulldebug=true
if %selected%== echo what? "Y" or "N".&pause&goto fulldebug

:fulldebugmain
set fulldebugsetvariable=
set fulldebugvariableapply=
title ^(デバッグ用^) カーソル変数
echo.
echo fulldebug を起動しています...
powershell -command "&{$h=Get-Host;$w=$h.UI.RawUI;$s=$w.BufferSize;$s.height=150;$w.BufferSize=$s;}"
cls
:fulldebugtypevariable
set fulldebugsetvariable=
set fulldebugvariableapply=
set
set /p fulldebugsetvariable=変更するラベルを指定してください。 :
if {%fulldebugsetvariable%}=={back} (goto hazimemenu)
if {%fulldebugsetvariable%}=={exit} (goto hazimemenu)
if {%fulldebugsetvariable%}=={help} (echo goto&echo set&echo help&echo back&pause&cls&set fulldebugsetvariable=&goto fulldebugtypevariable)
if {%fulldebugsetvariable%}=={goto} (goto fulldebuggoto)
if {%fulldebugsetvariable%}=={set} (goto fulldebugsetnew)
if {%fulldebugsetvariable%}=={} (cls&goto fulldebugtypevariable)
if {%fulldebugsetvariable%}=={allcommandlock} (echo you cant chenge this variable, becouse this variable is locked.&pause&cls&goto fulldebugtypevariable)
if not defined %fulldebugsetvariable% (echo 変数 %fulldebugsetvariable% は存在しません。新たに作成するか、存在する物を指定して下さい。&pause&cls&goto fulldebugtypevariable)
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
set /p fulldebugsetvariable=どこにgotoしますか？:
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
if defined %fulldebugsetvariable% (echo %fulldebugsetvariable% という変数はすでに存在しています。存在しないラベルを指定してください。 &pause&cls&goto fulldebugsetnew)
if {%fulldebugsetvariable%}=={back} (goto fulldebugtypevariable)
if {%fulldebugsetvariable%}=={allcommandlock} (echo you cant chenge this variable, becouse this variable is locked.&pause&cls&goto fulldebugsetnew)
if {%fulldebugsetvariable%}=={} (echo 何か入力してください。&pause&cls&goto fulldebugsetnew)
:fulldebugsetnewenter
set /p fulldebugvariableapply=%fulldebugsetvariable%^=
if {%fulldebugvariableapply%}=={} (echo 空の値では変数を作成できません。 &pause&cls&goto fulldebugsetnewenter)
if {%fulldebugvariableapply%}=={back} (goto fulldebugerrorsetnew1)
set %fulldebugsetvariable%=%fulldebugvariableapply%
echo 変数 %fulldebugsetvariable% は、 %fulldebugvariableapply% という値で作成されました。(%fulldebugsetvariable%^=%fulldebugvariableapply%).
pause
cls
goto fulldebugtypevariable

:fulldebugerrorsetnew1
set /p fulldebugsetvariableerrornew=退出するか、その値で変数を作成しますか？ (1 or 2) : 
if {%fulldebugsetvariableerrornew%}=={1} (goto fulldebugtypevariable)
if {%fulldebugsetvariableerrornew%}=={2} (goto fulldebugerrorsetnew1if)
:fulldebugerrorsetnew1if
set %fulldebugsetvariable%=back
echo 変数 %fulldebugsetvariable% は、 %fulldebugvariableapply% という値で作成されました。 (%fulldebugsetvariable%^=%fulldebugvariableapply%).
pause
cls
goto fulldebugtypevariable


:fulldebugerrorsetvariable1
set /p fulldebugsetvariableerrorif=本当に変数 %fulldebugsetvariable%を削除しますか？ (y or n)
if {%fulldebugsetvariableerrorif%}=={y} (
set %fulldebugsetvariable%=
echo 変数 %fulldebugsetvariable% は削除されました。
pause
cls
goto fulldebugtypevariable
)
if {%fulldebugsetvariableerrorif%}=={n} (goto fulldebug)

:littleeasteregg
if {%hazimeeaster%}=={true} (goto hazimemenu)
cls&pause&echo hello! this is easteregg!&pause&cls&title 隠し機能でメインメニューとバージョン情報の部分でビルドナンバーが表示されるようになった&echo and bye!&pause&cls&set hazimeeaster=true&goto hazime


:Lock
set eggcount=0
:lockloop1908
rundll32.exe user32.dll, LockWorkStation
if "%eggcount%" gtr "5" (exit)
if {%looplockdownhorroreaster%}=={true} (set /a eggcount=eggcount+1&goto lockloop1908)
goto reboot

:Rebootbatch
cd %~dp0 &start "" ^"%~n0%~x0^"&Exit


:exit
pause
:reboot

rem 3500 line code, wtf?
rem I still dont have any idea why i did make it
rem uh anyway finally end of line