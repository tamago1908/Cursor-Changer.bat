@echo off & setlocal
rem Specify size and change codepage to UTF-8
chcp 65001>nul || (echo Your computer doesn't support UTF-8!& echo.& echo Cursor Changer require UTF-8.& echo Press any key to exit...& pause > nul & exit)
mode con: | find "75" >nul && mode con: | find "25" >nul
if "%errorlevel%"=="1" (mode con: cols=75 lines=25& set boottime1=%time%& set batbeta=& set updateavailable=& set updatemyversion=& set updateversion=)
if "%batbootargumentbad%"=="false" (title Cursor Changer ^| Preparing...) else if not "%1"=="BatBootErrorHandlerArgument1908␍␊" (title Cursor Changer)
if not defined dummy (set /p nothing=[?25h<nul)

rem add "true" if you want to bypass windows version check (bypasswinvercheck=true)
rem O======================O
set bypasswinvercheck=
rem O======================O

rem Cursor Changer by tamago_1908
rem English version

rem https://github.com/tamago1908/cursor-changer.bat 

rem A stand-alone batch with OS-like functionality, named "Cursor Changer"
rem See github for details.

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
rem                         Cursor Changer.bat

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


rem Someone : You know what? Why don't you try combining other batches? Don't be tied to a single batch!
rem Me : >:(


rem Reboot this batch   : call :rebootbatch (1 is will reboot as recovery menu)
rem Shutdown this batch : call :exit 0 or 1 (0 is nothing, 1 is will show "Shutting down..." message)

rem How to add settings :
rem Add Setting load label and wantload
rem Add Setting and settingapplyer, and description



rem environment setting, It is not recommended to change.
rem VER v1.15
set batver=1.15
set batbuild=Build 155
set batverdev=stable
set Mainmenueaster=false
set firststartbat=no
set bootbatnow=yes


rem Here you can change the path to the location where configuration files and other files are placed and loaded, and names.
rem Example : 
rem %HOMEDRIVE%%HOMEPATH% (default)
rem %HOMEDRIVE%%HOMEPATH%\desktop (desktop)
rem %0 (batch placed path)
rem O===================================O
set "batchmainpath=%HOMEDRIVE%%HOMEPATH%"
rem O===================================O
rem settings file
set "Settingsfile=CursorChangerSettings.txt"
rem O===================================O
rem First Stuffs file
set "FirstSTFsfile=FirstCursor.txt"
rem O===================================O
cd /d %batchmainpath%



rem detect user argument
:batbootVerifyerrorhandler
echo %0 | find "%~dp0%~n0%~x0" >nul
if "%1"=="BatBootErrorHandlerArgument1908␍␊" (
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
if "%errorlevel%"=="0" (set windowsverfilter=Windows 10, old build) else (set "windowsverfilter=Too old! like Windows XP?")
echo %version2% | find /i "Version 6.3." > nul
if "%errorlevel%"=="0" (set windowsverfilter=Windows 8.1)
echo %version2% | find /i "Version 6.2." > nul
if "%errorlevel%"=="0" (set windowsverfilter=Windows 8)
echo %version2% | find /i "Version 6.1." > nul
if "%errorlevel%"=="0" (set windowsverfilter=Windows 7)
echo %version2% | find /i "Version 6.0." > nul
if "%errorlevel%"=="0" (set windowsverfilter=Windows vista)
if "%bypasswinvercheck%"=="true" (goto :batbootcheckwinverbadwarning)
rem winver check failed message
title Cursor Changer ^| Windows version error^^!
cls
echo Cursor Changer is does not support Your version of windows^^!
echo (%windowsverfilter%)
pause
cls
echo Cursor Changer is compatible with windows 10 version 1803 or later^^!
echo (build 17134 or later. Your windows is build %version%^^!)
pause
cls
echo Older versions (like windows 7, windows 8, 8.1, etc.) are not supported.
pause
cls
echo Please update your windows.
echo If you are using Windows 10 1803 or later and this message appears, please report it in a Github issue.
pause
call :exit 1

:batbootcheckwinverbadwarning
if "%1"=="BatBootErrorHandlerArgument1908␍␊" if "%batbootargumentbad%"=="false" (goto :batbootcheckwinversafe)
cls
rem Warning message (when use bypsvck in violation of winvercheck)
set selected=
cls
echo.
echo                                  WARNING
echo.
echo Your version of Windows (%windowsverfilter%) does not seem to support Cursor Changer^^!
echo You seem to be using bypasswinvercheck=true, but if you continue, you are very likely to encounter fatal problems.
echo If you continue, tamago_1908, the developer of the Cursor Changer, will not be held responsible for any subsequent problems caused.
echo.
echo Do you still wish to continue?
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
        if "%batbootargumentbad%"=="false" (echo [%time: =%] Cursor Changer %batver% Error_Handler - by tamago_1908&echo.) else (echo [%time: =%] Starting Error_Handler...)
        >nul 2>&1 find "wmode=false" %Settingsfile%
        if "!errorlevel!"=="0" (set linuxishclr2=[0m)
        >nul 2>&1 find "wmode=true" %Settingsfile%
        if "!errorlevel!"=="0" (set linuxishclr2=[107m[30m) else (set linuxishclr2=[0m)
        set linuxishclred=[91m& set linuxishclr=[92m
    ) else (set linuxboot=false)
)

rem check simpleboot
if "%linuxboot%"=="true" if "%batbootargumentbad%"=="false" ((echo [%linuxishclr%info%linuxishclr2%] Linux-ish Boot Loader is just now started.))
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
if not "%batbootargumentbad%"=="false" (
    if not exist %Settingsfile%  (
        if not exist %FirstSTFsfile% (
            echo Preparing Setup...
        ) else (title Cursor Changer ^| Starting...& echo Starting Cursor Changer...)
    )
)
if exist %Settingsfile% if not "%linuxboot%"=="true" (if not "%batbootargumentbad%"=="false" (title Cursor Changer ^| Starting...& echo Starting Cursor Changer...)) else (if not "%batbootargumentbad%"=="false" (title Cursor Changer ^| Starting...))
if not exist %Settingsfile% set firststartbat=yes
if "%1"=="BatBootErrorHandlerArgument1908␍␊" (if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] No more boot message!!!))


rem check powershell is available
if "%batbootargumentbad%"=="false" (goto :batbootcheckpowershellsafe)
:batbootcheckpowershell
>nul 2>&1 where powershell.exe && goto :batbootcheckpowershellsafe
cls
echo Powershell check failed!
pause
cls
echo It appears that powershell is not installed on your PC.
pause
cls
echo Powershell is required for Cursor Changer to work.
echo Since Powershell comes standard with windows 10 1803 and later, it is likely intentionally uninstalled or unavailable due to an error.
pause
cls
echo Please download Powershell 5.1 or later separately or try reinstalling it.
pause
cls
echo If the problem persists ^(the message continues to appear^), please report it in an issue on Github.
pause
cls
exit
:batbootcheckpowershellsafe



:batbootVerifyerrorhandlersafe
rem Start Error Handler
if not "%1"=="BatBootErrorHandlerArgument1908␍␊" (cd "%~dp0" & start /b /wait /realtime cmd.exe /c "%~n0%~x0" BatBootErrorHandlerArgument1908␍␊ %* || call :BSOD_Errors 6)
if not "%1"=="BatBootErrorHandlerArgument1908␍␊" (call :BSOD_Errors 0 %errorlevel%
    pause >nul
    echo ERROR HANDLER IS COMPLETELY MESSED UP. WHAT DID YOU DO!!!
    exit
)
set batbootargumentbad=
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Error_Handler is Working! :D)


:Arguments_Loader
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Arguments_Loader is Started...)
if "%~1"=="" goto :Arguments_Loaderend
if not "%~1"=="BatBootErrorHandlerArgument1908␍␊" (title Cursor Changer ^| argment checking...)
setlocal enabledelayedexpansion
set i=0
for %%a in (%*) do (
  set /a i+=1
  set arg[!i!]=%%a
)
set n=%i%

:Arguments_Loaderbreak
for /l %%i in (1,1,%n%) do (
  set argmentserror=
  set current=!arg[%%i]!
  if not "!current!"=="" (
    for /l %%j in (%%i,1,%n%) do (
      if "!arg[%%j]!"=="!current!" set arg[%%j]=
    )
    rem Process according to the current element
    if "!current!"=="BatBootErrorHandlerArgument1908␍␊" (set Arguments_Loaderbreaked=true& goto :Arguments_Loaderbreak)
    set Arguments_Loaderbreaked=false
    if "!current!"=="bypsbootpwsh" (echo batbootpowershell is bypassed.& set disableexit=false& set argmentserror=false)
    if "!current!"=="enablesimpleboot" (echo simpleboot is enabled.& set simpleboot=true& set argmentserror=false)
    if "!current!"=="devmode" (call :developermenu& set argmentserror=false)
    if "!current!"=="recovery" (echo recovery menu is enabled.& set argmentserror=false& goto :Cursor_Changer_REmenu)
    if "!current!"=="uninstall" (setlocal disabledelayedexpansion & set Uninstall_Shutdown=true& goto :Uninstall)
    if "!current!"=="help" (call :batstarthelp& set argmentserror=false)
    if "!current!"=="bypsadm" (echo getadmin is bypassed.& set adminbypass=true& set adminbypass=false& set argmentserror=false)
    if "!current!"=="bypsloadsg" (echo setting load is bypassed.& set settingbypass=true& set argmentserror=false)
    rem exception handling
    if "!argmentserror!"=="" (title Cursor Changer ^| argment error& echo unvalid argment or something went worng ^(!current!^) error. please set valid argment. ^(or use ^"help^" ^)
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
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Arguments_Loader is done.)

rem Error Hander call
call :batbootErrorHandlerCall %1
call :BSOD_Errors 1 %errorlevel%

:batbootErrorHandlerCall
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Error_Handler_Call is Started.)


rem main code, (like set variable)
set version=
set bootbatnow=yes
set Powersheller_passed=false
if not exist %Settingsfile% set checkupdatetoggle=false& goto :Powersheller
if exist %Settingsfile% find "CheckUpdate=true" %Settingsfile% > nul
if "%errorlevel%"=="0" (set checkupdatetoggle=true) else (set checkupdatetoggle=false)
if "%disableexit%"=="false" (goto :Powersheller_end)

:Powersheller
cd %~dp0 & set Powersheller=& set Powersheller_passed=false
set Powersheller=%1
if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Powersheller is started...)
if not "%Powersheller%"=="OOBEMusic" (set "batverforpowersheller=%batver:β=.b%")
if not "%1"=="BatBootErrorHandlerArgument1908␍␊" (
    if not "%bootbatnow%"=="yes" (
        if "%Powersheller%"=="CheckUpdate" (set Powersheller=CheckUpdate& set checkupdatetoggle=true) else (set checkupdatetoggle=)
    )
)

rem code from startid~powershell must not be displaced code before or after that is ok If it's before or after that, it's ok
:: StartID1908
call :getLineNumber startLine StartID1908 0
goto :Powershellerendcode
:Powershellercodestart
set /a startline=startline+5& set /a endline=endline-3
if "%Powersheller%"=="OOBEMusic" (start /b /wait powershell.exe -NoExit -NoProfile -ExecutionPolicy Unrestricted "$s=[System.Management.Automation.ScriptBlock]::create((Get-Content \"%~f0\" -TotalCount $env:endline|Where-Object{$_.readcount -gt $env:startline }) -join \"`n\");&$s" %*&goto :Powersheller_end)
if "%checkupdatetoggle%"=="true" (for /f "delims=" %%a in ('powershell -NoProfile "$s=[System.Management.Automation.ScriptBlock]::create((Get-Content \"%~f0\" -TotalCount $env:endline|Where-Object{$_.readcount -gt $env:startline }) -join \"`n\");&$s" %*') do set Updateinfo=%%a&goto :Powersheller_end) else (powershell -NoProfile -ExecutionPolicy Unrestricted "$s=[System.Management.Automation.ScriptBlock]::create((Get-Content \"%~f0\" -TotalCount $env:endline|Where-Object{$_.readcount -gt $env:startline }) -join \"`n\");&$s" %*&goto :Powersheller_end)

function Disablemax {
# Function to disable the maximize button
$code = @'
using System;
using System.Runtime.InteropServices;

namespace MaximizeButtonToggle {
    // Interacting with Windows API to manipulate window styles
    internal static class WinAPI {
        [DllImport("kernel32.dll")] 
        internal static extern IntPtr GetConsoleWindow();  // Get the console window handle
        [DllImport("user32.dll")] 
        internal static extern bool DrawMenuBar(IntPtr hWnd);  // Refresh the window menu
        [DllImport("user32.dll")] 
        internal static extern int GetWindowLong(IntPtr hWnd, int nIndex);  // Get window attributes
        [DllImport("user32.dll")] 
        internal static extern int SetWindowLong(IntPtr hWnd, int nIndex, int dwNewLong);  // Set window attributes
        // Constants for window style attributes
        const int GWL_STYLE = -16, WS_MAXIMIZEBOX = 0x00010000;
        // Method to enable or disable the maximize button based on the 'state' parameter
        internal static void ChangeMaximizeState(bool state) {
            IntPtr hWnd = GetConsoleWindow();  // Get the current console window handle
            // Enable or disable the maximize button by updating window styles
            SetWindowLong(hWnd, GWL_STYLE, state ? GetWindowLong(hWnd, GWL_STYLE) | WS_MAXIMIZEBOX : GetWindowLong(hWnd, GWL_STYLE) & ~WS_MAXIMIZEBOX);
            DrawMenuBar(hWnd);  // Redraw the window to reflect changes
        }
    }
    // Public method to disable the maximize button
    public static class ButtonStatus { 
        public static void DisableMaximize() {
            WinAPI.ChangeMaximizeState(false); // Disable the maximize button, change it to true if you want to enable it
        } 
    }
}
'@
# Compile the C# code and disable the maximize button
Add-Type $code
[MaximizeButtonToggle.ButtonStatus]::DisableMaximize()
}


function RefreshCursor {
# Refresh the Cursor setting.
Add-Type @"
using System;
using System.Runtime.InteropServices;
public class User32 {
    [DllImport("user32.dll", SetLastError = true)]
    public static extern bool SystemParametersInfo(int uAction, int uParam, IntPtr lpvParam, int fuWinIni);
}
"@
# 0x0057 = Refresh Cursor, using winapi. 0x02 = Send Change (Apply)
# Reapply cursor
[User32]::SystemParametersInfo(0x0057, 0, [IntPtr]::Zero, 0x02) | Out-Null
}



function Updater {
# Check for updates of Cursor Changer with GitHub API. Just check.
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
# Get latest code from github, and directy replace it.
$repo = "https://api.github.com/repos/tamago1908/Cursor-Changer.bat/releases/latest"
try{$file = (Invoke-RestMethod -Uri $repo -Method Get -Headers @{'Accept'='application/vnd.github.v3+json'}).assets | Where-Object { $_.name -like "Cursor.Changer.*" }
}catch{if($_.Exception.Response.StatusCode.Value__ -eq 403){Write-Host "[ERROR] You have exceeded the GitHub API rate limit. This may be because you have checked for updates too frequently. Please wait for an hour and try again." -foregroundcolor red}else{Write-Host "[ERROR] Oops, something went worng. You can try again later. or check the internet connection. `nError log : $_" -foregroundcolor red};break}
$fileVersion = $file.name -replace "Cursor\.Changer\.|\.bat", ""
$batVersion = "$env:batverforpowersheller"
$batName = Get-Item "Cursor.Changer.*.bat"
$downloadFolder = Join-Path $env:USERPROFILE "Downloads"
$downloadFile = Join-Path $downloadFolder $file.name
Invoke-WebRequest -Uri $file.url -OutFile $downloadFile -Headers @{'Accept'='application/octet-stream'}
$newBatName = "Cursor.Changer.$fileVersion.bat"
Move-Item $downloadFile (Join-Path (Split-Path $batName) ("$newBatName")) -Force
Remove-Item "Cursor.Changer.$batVersion.bat" -Force
if ($env:Doupdate_Text -eq $null) {Write-Host "The update is complete.`n"} else {Write-Host "$env:Doupdate_Text`n"}
Start-Sleep 2
Write-Host "Rebooting..."
PowerShell -WindowStyle Hidden -Command Exit
Start-process "Cursor.Changer.$fileVersion.bat"
Killwhole
}



function OOBEMusic {
# Initialize variables for terminal control and memory mapping
$esc=[char]0x1B; $initialCol=[Console]::CursorLeft+1; $script:messageOffset=0; Write-Host "${esc}[s" -NoNewline

function Write-Aligned {
    param([string]$Message,[ConsoleColor]$Color,[switch]$NoNewLine,[int]$Lines=0)
    # Calculate where the message should be displayed in the terminal and apply color and formatting
    $total=$script:messageOffset+$Lines; $seq="${esc}[u${esc}[${total}B${esc}[${initialCol}G"
    if($PSBoundParameters.ContainsKey('Color')) {$par=@{ForegroundColor=$Color}} else {$par=@{}}
    if($NoNewLine){Write-Host $seq -NoNewline; Write-Host $Message @par -NoNewline}
    else {Write-Host $seq -NoNewline; Write-Host $Message @par; $script:messageOffset+=$Lines+($Message -split "`n").Count}
}

# Check if music is already playing by trying to access the memory-mapped file
$mapName="AudioDataMap"
try {
    $exMMF=[System.IO.MemoryMappedFiles.MemoryMappedFile]::OpenExisting($mapName); $exMMF.Dispose()
    Write-Aligned "[ERROR] Music is already playing!" -Color Red; Start-Sleep 3; exit 1
} catch [System.IO.FileNotFoundException] { } catch { Write-Aligned "[ERROR] Pre-check failed: $_" -Color Red; Start-Sleep 3; exit 1 }

# Prepare to download the audio file
$wc=New-Object System.Net.WebClient; $wc.Proxy=$null; $wc.Headers.Add("Cache-Control","no-cache")
try { $ms=New-Object System.IO.MemoryStream -ArgumentList 1048576 } catch { Write-Aligned "[ERROR] Failed to initialize memory: $_" -Color Red; Start-Sleep 3; exit 1 }

try {
    # Download the audio file and show progress
    Write-Host "${esc}[2K" -NoNewline
    $resp=$wc.OpenRead("https://raw.githubusercontent.com/tamago1908/Cursor-Changer.bat/main/resource/Windows_XP_OOBE_for_Cursor_Changer.wav")
    $totalBytes=[int]$wc.ResponseHeaders["Content-Length"]; $buf=New-Object byte[] 65536; $lastProg=-1; $lastLen=0; $pref="Downloading music..."
    Write-Host $pref -NoNewline; Write-Host "${esc}[${pref.Length}C" -NoNewline
    while(($r=$resp.Read($buf,0,$buf.Length)) -gt 0) {
        $ms.Write($buf,0,$r); $prog=[math]::Round(($ms.Length/$totalBytes)*100)
        if($prog -ne $lastProg){
            # Display download progress percentage
            $perc="$prog%"; $curLen=$perc.Length+1
            if($lastProg -ge 0){$back=$lastLen}else{$back=0}
            if($curLen -lt $lastLen){$pad=" " * ($lastLen-$curLen)}else{$pad=""}
            Write-Host "${esc}[${back}D ${perc}${pad}" -NoNewline; $lastProg=$prog; $lastLen=$curLen
        }
    }
    Write-Aligned "Download Complete!" -Lines 1
} catch {
    # Handle download errors
    if ($_.Exception.Response.StatusCode.Value__ -eq 403) {
        $errMsg="[ERROR] You have reached the GitHub API rate limit. Please wait for an hour before trying again."
    } else { $errMsg="[ERROR] Something went wrong. Please try again later. Error : $_" }
    Write-Aligned $errMsg -Color Red -Lines 1; Start-Sleep 3; exit 1
}
try {
    # Write the audio to a memory-mapped file
    $audio=$ms.ToArray(); $mapSize=[Math]::Ceiling($audio.Length/4096.0)*4096
    $mmf=[System.IO.MemoryMappedFiles.MemoryMappedFile]::CreateNew($mapName,$mapSize)
    $view=$mmf.CreateViewAccessor(0,$audio.Length); $view.WriteArray(0,$audio,0,$audio.Length)
} catch [System.IO.IOException] { Write-Aligned "[ERROR] Memory mapping failed: $_" -Color Red -Lines 1; Start-Sleep 3; exit 1 }
catch { Write-Aligned "[ERROR] Memory mapping failed: $_" -Color Red -Lines 1; Start-Sleep 3; exit 1 }

# C# code for playing the audio in the background using the memory-mapped file
$csharp=@"
    using System;
    using System.IO;
    using System.IO.MemoryMappedFiles;
    using System.Media;
    using System.Threading;
    namespace ConsoleApp { public static class Program {
    public static SoundPlayer player; private static MemoryMappedFile mmf; private static Stream viewStream; private static MemoryStream memStream;
    public static void PlayAudioFromMemoryMap(string mapName,int dataLength,string syncEventName){
    try { mmf=MemoryMappedFile.OpenExisting(mapName); viewStream=mmf.CreateViewStream(0,dataLength);
        byte[] data=new byte[dataLength]; viewStream.Read(data,0,dataLength); memStream=new MemoryStream(data);
        player=new SoundPlayer(memStream); player.PlayLooping();
        using(var syncEvent=EventWaitHandle.OpenExisting(syncEventName)){ syncEvent.Set(); }
    } catch(Exception ex){ Console.Error.WriteLine("[ERROR] Playback failed: "+ex.Message); Environment.Exit(1); }
}
public static void StopAudio(){ if(player!=null){ player.Stop(); player.Dispose();
    if(memStream!=null) memStream.Dispose(); if(viewStream!=null) viewStream.Dispose(); if(mmf!=null) mmf.Dispose(); } }
} }
"@

# Create background process to play the audio
$sb= @"
    param([string]`$mapName,[int]`$dataLength,[string]`$syncEventName,[int]`$cmdPid)
    try {
    `$esc=[char]0x1B
    Add-Type -TypeDefinition @'
$csharp
'@ -ReferencedAssemblies System.Windows.Forms
    [ConsoleApp.Program]::PlayAudioFromMemoryMap(`$mapName,`$dataLength,`$syncEventName)
    Write-Host "`${esc}[2J`${esc}[H" -NoNewline
    Write-Host 'Playing music... Don''t mind this window.`nClose this window, or close the Cursor Changer to stop music...'
    while(`$true){
        if(-not (Get-Process -Id `$cmdPid -ErrorAction SilentlyContinue)){ [ConsoleApp.Program]::StopAudio(); exit }
        Start-Sleep -Milliseconds 250
    }
} catch {
    `$cur=[Console]::CursorLeft; Write-Host "`${esc}[1B`${esc}[`${cur}G[ERROR] Playback failed: $_" -ForegroundColor Red;
    Write-Host "Press any key to exit..." -ForegroundColor Red; `$host.UI.RawUI.ReadKey()|Out-Null; exit 1
}
"@

# Setup synchronization and start the background process
$syncName="Global\AudioSync_"+[guid]::NewGuid().ToString("N")
$cmdPid=(Get-CimInstance -ClassName Win32_Process -Filter "ProcessId = $pid").ParentProcessId
Write-Aligned "Starting music player..." -Lines 1
Add-Type -TypeDefinition @"
    using System;
    using System.Runtime.InteropServices;
    public class ForegroundHelper {
    [DllImport("user32.dll")]
    public static extern bool AttachThreadInput(uint idAttach,uint idAttachTo,bool fAttach);
    [DllImport("user32.dll")]
    public static extern uint GetWindowThreadProcessId(IntPtr hWnd,IntPtr ProcessId);
    [DllImport("kernel32.dll")]
    public static extern uint GetCurrentThreadId();
    [DllImport("user32.dll")]
    public static extern bool SetForegroundWindow(IntPtr hWnd);
    [DllImport("user32.dll")]
    public static extern bool BringWindowToTop(IntPtr hWnd);
    [DllImport("user32.dll")]
    public static extern bool ShowWindow(IntPtr hWnd,int nCmdShow);
    [DllImport("user32.dll")]
    public static extern IntPtr GetForegroundWindow();
}
"@ -PassThru | Out-Null

# Attach the audio process window to the foreground
$origHWND=[ForegroundHelper]::GetForegroundWindow()
try {
    $sync=New-Object System.Threading.EventWaitHandle($false,[System.Threading.EventResetMode]::ManualReset,$syncName)
    $argsArr=@("-NoProfile","-Command","& { $($sb -replace '""','\""') }","-mapName",$mapName,"-dataLength",$audio.Length,"-syncEventName",$syncName,"-cmdPid",$cmdPid,"-CURSOR_CHANGER_OOBEMUSIC_PLAYER") -join " "
    $psi=New-Object System.Diagnostics.ProcessStartInfo; $psi.FileName="powershell.exe"; $psi.Arguments=$argsArr; $psi.WindowStyle=[System.Diagnostics.ProcessWindowStyle]::Minimized
    [System.Diagnostics.Process]::Start($psi)|Out-Null; Start-Sleep -Milliseconds 500
    $curr=[ForegroundHelper]::GetCurrentThreadId(); $origT=[ForegroundHelper]::GetWindowThreadProcessId($origHWND,[IntPtr]::Zero)
    [ForegroundHelper]::AttachThreadInput($curr,$origT,$true)|Out-Null; [ForegroundHelper]::BringWindowToTop($origHWND)|Out-Null
    [ForegroundHelper]::ShowWindow($origHWND,9)|Out-Null; [ForegroundHelper]::SetForegroundWindow($origHWND)|Out-Null
    [ForegroundHelper]::AttachThreadInput($curr,$origT,$false)|Out-Null
    Write-Aligned "Waiting for music..."
    if(-not $sync.WaitOne(5000)){
        Write-Aligned "[ERROR] Player initialization timeout! :(" -Color Red -Lines 1;
        Write-Aligned "Check minimized window for details..." -Color Red; Start-Sleep 3; exit 1
    }
} catch { Write-Aligned "[ERROR] Failed to start player: $_" -Color Red -Lines 1; Start-Sleep 3; exit 1 }
finally { try { if($view){$view.Dispose()}; if($mmf){$mmf.Dispose()}; if($ms){$ms.Dispose()}; if($sync){$sync.Dispose()} } catch {} ; exit }
}



Function Killwhole {
# Get cmd's PID, and Kill them. >:D
Write-Host "`nShutting down..."
Start-Sleep 1
$pid1 = (Get-WmiObject win32_process -filter "processid=$pid").parentprocessid
$pid2 = (Get-WmiObject win32_process -filter "processid=$pid1").parentprocessid
taskkill /pid $pid1 /pid $pid2 /pid $pid > $null 2>&1
}

Function Changelog {
# Get latest Changelog from Github, and format it, then show it.
try {$h=Get-Host;$w=$h.UI.RawUI;$s=$w.BufferSize;$r=irm -Uri "https://api.github.com/repos/tamago1908/Cursor-Changer.bat/releases/latest";$s.height=$r.body -split '\r\n' | Measure-Object | %{$_.Count + 22};$w.BufferSize=$s;if($env:wmodetoggle -eq "false"){Write-Host "Change Log :" -foregroundcolor white}elseif($env:wmodetoggle -eq "true"){Write-Host "Change Log :" -foregroundcolor black }else{Write-Host "Change Log :" -foregroundcolor white};$e=[char]27;$clr="$e[7m";$clred="$e[91m";$clrgrn="$e[92m";$clryel="$e[93m";$clrmag="$e[95m";$clrgra="$e[90m";$clrcyan="$e[96m";$c="$e[0m";if($env:wmodetoggle -eq "true"){$clr="$e[100m$e[97m";$c="$e[0m$e[107m$e[30m"};foreach($s in $r.body -split '\r\n'){if($s -match "####"){write-host "$clrcyan$e[1m$($s -replace '(^\#+)|(\#+$)', '')$c" `n -NoNewline}elseif($s -match ">"){write-host "$clred$($s -replace '\>', '')$c" `n -NoNewline}elseif($s -match "###"){write-host "$clryel$e[1m$($s -replace '(^\#+)|(\#+$)', '')$c" `n -NoNewline}elseif($s -match "___"){write-host "$clrgra--------------------------------------------------$c" `n -NoNewline}else{$s=$s -replace "\*{3}(.+?)\*{3}", "$e[3m`$1$c";$s=$s -replace "\*{2}(.+?)\*{2}", "$e[1m`$1$c";$s=$s -replace "^\s*-(\s+)(.*)", "$clred-$c`$1`$2";$s=$s -replace "\*+", "";write-host "$s" `n -NoNewline}};rv e,clr,clred,clrgrn,clryel,clrmag,clrgra,clrcyan,c,s}catch{if($_.Exception.Response.StatusCode.Value__ -eq 403){Write-Host "[ERROR] You have exceeded the GitHub API rate limit. This may be because you have checked for updates too frequently. Please wait for an hour and try again." -foregroundcolor red}else{Write-Host "[ERROR] Oops, something went worng. You can try again later. or check the internet connection. `nError log : $_" -foregroundcolor red};break}
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
for /F "usebackq tokens=1 delims=:" %%L IN (`findstr /N "%~2" "%~f0"`) DO set /a lineNr=%~3 + %%L
set "%~1=%LineNr%" & set LineNr=& exit /b


:Powersheller_end
set startline=& set endline=& set Powersheller_passed=& set batverforpowersheller=
cd %batchmainpath%
if "%Powersheller%"=="OOBEMusic" (set Powersheller=& exit /b)
if "%bootbatnow%"=="no" if not "%Powersheller%"=="Updater" if not "%Powersheller%"=="CheckUpdate" (set Powersheller=& exit /b)

rem get updater variable
if not "%checkupdatetoggle%"=="true" (goto :Powersheller_get_updater_variable_end)
rem conversion powershell return variable to batch variable
if "%updateinfo%"=="null" (goto :Powersheller_get_updater_variable_end)
if "%updateinfo%"=="die" (if not "%Powersheller%"=="CheckUpdate" (set Punish=true) & goto :Powersheller_get_updater_variable_end)
setlocal enabledelayedexpansion
for /f "tokens=1-4 delims=," %%a in ("%updateinfo%") do (
    for /f "tokens=1-2 delims==" %%x in ("%%a") do set "%%x=%%y"& for /f "tokens=1-2 delims==" %%x in ("%%b") do set "%%x=%%y"& for /f "tokens=1-2 delims==" %%x in ("%%c") do set "%%x=%%y"& for /f "tokens=1-2 delims==" %%x in ("%%d") do set "%%x=%%y"
)
setlocal disabledelayedexpansion
set updatemyversion=%batver:β=.b%


:Powersheller_get_updater_variable_end
if "%Powersheller%"=="CheckUpdate" (if "%Updateinfo%"=="null" (set Powersheller=& exit /b 1) else if "%Updateinfo%"=="die" (set Powersheller=& exit /b 2) else if "%Updateinfo%"=="APIErr" (set Powersheller=& exit /b 3) else if "%Updateinfo%"=="GNErr" (set Powersheller=& exit /b 4) else (call :UpdateAvailable & set Powersheller=& exit /b 0))
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Powersheller is Ended...)
set updateinfo=& set checkupdatetoggle=
goto :CursorChangerOOBE



:Core_Powershell
rem %1=1 : Tada sound
rem %1=2 : Shutdown sound
rem %1=3 : Kill Powershell scripts executed from this Batch. Other Powershell scripts are not affected ;)
if exist %Settingsfile% (find "PlaySound=false" %Settingsfile% > nul)
if "%errorlevel%"=="0" (if %1 geq 1 if %1 leq 2 (exit /b))
if "%1"=="1" (set Core_Powershell_Playsound_Name=Base64ID_Sound_Tada) else if "%1"=="2" (set Core_Powershell_Playsound_Name=Base64ID_Sound_Shutdown)
if not %ErrorLevel%==0 (if %1 geq 1 if %1 leq 2 (start /b /realtime powershell -NoProfile -ExecutionPolicy Bypass -Command "[System.Reflection.Assembly]::LoadWithPartialName('System.Media') > $null; $file=\"%~dp0%~n0%~x0\"; $lines=Get-Content -Path $file -Encoding UTF8; $index=($lines | Select-String -Pattern '%Core_Powershell_Playsound_Name%$').LineNumber; if ($index -and $index -lt $lines.Length) { $b64=$lines[$index].Trim(); try { $bytes=[Convert]::FromBase64String($b64); $stream=New-Object System.IO.MemoryStream; $stream.Write($bytes, 0, $bytes.Length); $stream.Position=0; $player=New-Object System.Media.SoundPlayer; $player.Stream=$stream; $player.PlaySync(); $stream.Close(); $stream.Dispose() } catch { Write-Host \"Error decoding Base64 or playing sound: $^($_.Exception.Message^)\"; Write-Host \"Press any key to continue...\"; $null = $host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown') } } else { Write-Host \"Marker '%Core_Powershell_Playsound_Name%' not found or no data in next line.\" }"))
if "%1"=="3" (powershell -command "Get-CimInstance -Query \"SELECT ProcessId FROM Win32_Process WHERE Name = 'powershell.exe' AND CommandLine LIKE '%%CURSOR_CHANGER_OOBEMUSIC_PLAYER%%'\" | ForEach-Object { Stop-Process -Id $_.ProcessId -Force }")
if "%1"=="4" (powershell -command "&{$h=Get-Host;$w=$h.UI.RawUI;$s=$w.BufferSize;$s.height=%2;$w.BufferSize=$s;}")
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
pathping 127.0.0.1 -n -q 1 -p 100 1>nul
setlocal enabledelayedexpansion
title Welcome to Cursor Changer
cls


:CursorChangerOOBE_Animation
for /l %%i in (0,1,512) do if not "!forloopexit!"=="true" (
    rem Play CursorChangerOOBE_Animations that appear slowly
    if not defined dummy (set /p nothing=[?25l<nul)
    set /a count+=10
    set clresc=!count!;!count!;!count!
    set "show=[2;23H[38;2;!clresc!mWelcome to Cursor Changer %batver% [0m"
    echo.
    echo !show!
    rem call background_menu to draw bg
    call :Background_menu 1
    if "!count!" == "200" (pathping 127.0.0.1 -n -q 1 -p 500 1>nul & set count=& set forloopexit=true) else (
        pathping 127.0.0.1 -n -q 1 -p 0 1>nul
    )
) else (set forloopexit=& goto :CursorChangerOOBE_Animation2)

:CursorChangerOOBE_Animation2
for /l %%i in (0,1,512) do if not "!forloopexit!"=="true" (
    rem Play CursorChangerOOBE_Animations that appear slowly but more darker
    set /a count+=10
    set clresc=!count!;!count!;!count!
    set "show2=[5;26H[38;2;!clresc!m[PRESS ANY KEY TO BEGIN] [0m"
    echo.
    echo !show!
    echo.& echo.
    echo !show2!
    if "!count!" == "120" (
        set clresc=& pause >nul& echo.& echo !show!& pathping 127.0.0.1 -n -q 1 -p 250 1>nul
        set count=200& set count2=120& set clresc=204;204;204
        set forloopexit=true
    ) else (
        pathping 127.0.0.1 -n -q 1 -p 50 1>nul
    )
) else (set forloopexit=& goto :CursorChangerOOBE_Animation3)

:CursorChangerOOBE_Animation3
for /l %%i in (0,1,512) do if not "!forloopexit!"=="true" (
    rem live together, die together.
    set /a count-=10& set /a count2-=6
    set clresc=!count2!;!count2!;!count2!
    set "show2=[5;26H[38;2;!clresc!m[PRESS ANY KEY TO BEGIN] [0m"
    echo.
    echo !show!
    echo.& echo.
    echo !show2!
    rem call background_menu to draw bg
    call :Background_menu 1
    if !count2! leq 12 (
        if !count! leq 20 (pathping 127.0.0.1 -n -q 1 -p 500 1>nul& set count=& set count2=0& set clresc=200;200;200& set clrmove=22& set forloopexit=true)
    ) else (
        pathping 127.0.0.1 -n -q 1 -p 0 1>nul
    )
) else (set forloopexit=& goto :CursorChangerOOBE_Animation4)

:CursorChangerOOBE_Animation4
for /l %%i in (0,1,512) do if not "!forloopexit!"=="true" (
    rem Play CursorChangerOOBE_Animations that move left
    echo !show!
    set "show=[2;!clrmove!H[38;2;!clresc!mWelcome to Cursor Changer %batver% [0m"
    echo !show!
    set /a clrmove-=1
    if !clrmove! equ 2 (
        set forloopexit=true
    ) else (
        pathping 127.0.0.1 -n -q 1 -p 25 1>nul
    )
) else (set forloopexit=& goto :CursorChangerOOBE_Animation5)

:CursorChangerOOBE_Animation5
rem WOW IT CHANGED INTO SETUP!!!!!!!!!
pathping 127.0.0.1 -n -q 1 -p 750 1>nul & cls
set "show=[2;!clrmove!H[38;2;!clresc!m Cursor Changer %batver% Setup [0m"
echo.
echo !show!
pathping 127.0.0.1 -n -q 1 -p 750 1>nul
set show=& set show2=& set clresc=& set clrmove=& set count2=& set count=
setlocal disabledelayedexpansion
goto :CursorChangerOOBEdev



:OOBE_Drawer
rem Drawing OOBE
rem Draw underbar
if not defined dummy (set /p nothing=[22;0H<nul)
if "%1"=="0" (set /p nothing=%clr2%%clrwhi%[0K%moveline%%clrwhi%<nul
) else if "%1"=="1" (set /p nothing=%clrwhi%[0K     Y=Continue     S=Skip     B=Quit     %moveline%%clrwhi%<nul
) else if "%1"=="2" (set /p nothing=%clr2%%clrwhi%[0K     Y=Skip     N,B=Not Skip     %moveline%%clrwhi%<nul
) else if "%1"=="3" (set /p nothing=%clr2%%clrwhi%[0K     Y=Continue     N=No     %moveline%%clrwhi%<nul
) else if "%1"=="4" (set /p nothing=%clr2%%clrwhi%[0K     Y=Yes     N=No     %moveline%%clrwhi%<nul
) else if "%1"=="5" (set /p nothing=%clr2%%clrwhi%[0K     Y=Continue     [22;78H1/3%moveline%%clrwhi%<nul
) else if "%1"=="6" (set /p nothing=%clr2%%clrwhi%[0K     Y=Continue     [22;78H2/3%moveline%%clrwhi%<nul
) else if "%1"=="7" (set /p nothing=%clr2%%clrwhi%[0K     Y=Continue     [22;78H3/3%moveline%%clrwhi%<nul
) else if "%1"=="8" (set /p nothing=%clr2%%clrwhi%[0K     A,1=move to Left     D,2=move to right     B=Exit     %moveline%%clrwhi%<nul
) else if "%1"=="9" (set /p nothing=%clr2%%clrwhi%[0K     A,1=move to Left     D,2=move to right     Y,E=Confirm     B=Exit     %moveline%%clrwhi%<nul
) else if "%1"=="10" (set /p nothing=%clr2%%clrwhi%[0K     Y,E=Confirm     B,N=Exit     %moveline%%clrwhi%<nul
) else if "%1"=="11" (set /p nothing=%clr2%%clrwhi%[0K     W,S or 1~6=Move     Y=Toggle     N,B=Discard     %moveline%%clrwhi%<nul
) else if "%1"=="12" (set /p nothing=%clr2%%clrwhi%[0K     Y,E=Exit     %moveline%%clrwhi%<nul)
rem Draw Topbar 
if "%3"=="true" (set /p nothing=[107m[30m<nul& for /l %%i in (0,1,5) do (set /p nothing=[%%i;0H[0K<nul)) else if "%3"=="false" (set /p nothing=%clr2%<nul& for /l %%i in (0,1,5) do (set /p nothing=[%%i;0H[0K<nul)) else if "%oobetheme%"=="white" (set /p nothing=[107m[30m<nul) else (set /p nothing=%clr2%<nul)
if not defined dummy (for /l %%i in (5,1,21) do (set /p nothing=[%%i;0H[0K<nul))
if not defined dummy (set /p nothing=[0;0H<nul)
if not "%2"=="null" ( echo.& echo   Cursor Changer %batver% Setup& echo ================================O
    if "%2"=="1" (set /p nothing=Setup progress : 1/5 ^(Check precautions^)<nul& title Cursor Changer %batver% Setup ^| Progress : 1/5
    ) else if "%2"=="2" (set /p nothing=Setup progress : 2/5 ^(Confirm informations^)<nul& title Cursor Changer %batver% Setup ^| Progress : 2/5
    ) else if "%2"=="3" (set /p nothing=Setup progress : 3/5 ^(Set theme of Cursor Changer^)<nul& title Cursor Changer %batver% Setup ^| Progress : 3/5
    ) else if "%2"=="4" (set /p nothing=Setup progress : 4/5 ^(Customize of Settings^)<nul& title Cursor Changer %batver% Setup ^| Progress : 4/5
    ) else if "%2"=="5" (set /p nothing=Setup progress : 5/5 ^(End of set up^)<nul& title Cursor Changer %batver% Setup ^| Progress : 5/5)
    if not "%2"=="0" (if not defined dummy (set /p nothing=[0K<nul) & echo.)
)
exit /b

:OOBE_EndLine
if not defined dummy (set /p nothing=[22;0H<nul& exit /b)

:CursorChangerOOBEdev
rem Now, it's the beginning of a fucking trashy long goofy ahh idiot code.
rem Note : After using of Underbar_Drawer, You should use %clr2% and ESC[0;0H. Underbar_Drawer don't reset it.
title Cursor Changer %batver% Setup
if not defined dummy (set clr=[3m[97m&set clrhigh=[7m&set clrhighend=[0m&set clrwhi=[48;5;250m[30m&set clr2=[0m&set clrgra=[90m)
if not defined dummy (set moveline=[22;0H)
if not defined dummy (set /p nothing=[?25l<nul)
mode con: cols=80 lines=22
call :OOBE_Drawer 1 0
echo.
echo      %clr% Welcome to Setup.%clr2%
echo.
echo      Welcome to the initial launch and setup of Cursor Changer.
echo      This protion of the Setup program prepares
echo      Cursor Changer %batver% to run on your computer.
echo.
echo.
echo        ^・   To setup Cursor Changer now, press Y.
echo.
echo        ^・   To skip the setup and use the Cursor Changer,
echo             press S. (All settings are set to the default values)
echo.
echo        ^・   To quit setup without setup Cursor Changer, press B.
call :OOBE_EndLine
choice /c YSB /n >nul
if %ErrorLevel%==1 call :OOBEmainblank & goto :OOBEmain
if %ErrorLevel%==2 goto :OOBESkip
if %ErrorLevel%==3 call :OOBEmainshutdown& timeout /t 1 /nobreak >nul&call :exit 0

:OOBESkip
call :OOBE_Drawer 2 0
echo.
echo.
echo          Skip the setup
echo.
echo          if you skip the setup, the all settings
echo          and theme are will be set to default value.
echo          and You're going to miss out on reading precautions.
echo          Is that okay?
echo.
echo          (Y=Yes, I feel hassle to setup it.)
echo          (N=No, I wanna set up Cursor Changer!)
call :OOBE_EndLine
choice /c YNB /n >nul
if %ErrorLevel%==1 call :OOBEmainblank&set oobetheme=dark&set OOBESettingtoggle_1=false&set OOBESettingtoggle_2=false&set OOBESettingtoggle_3=false&set OOBESettingtoggle_4=true&set OOBESettingtoggle_5=true&set YourName=%Username%& goto :OOBEmain8
if %ErrorLevel%==2 goto :CursorChangerOOBEdev
if %ErrorLevel%==3 goto :CursorChangerOOBEdev

:OOBEmain
curl -silent http://www.msftconnecttest.com/connecttest.txt | find "Microsoft Connect Test" >nul
if "%errorlevel%"=="1" (call :OOBEmainblank & goto :OOBEmain2)
curl -silent http://www.msftncsi.com/ncsi.txt | find "Microsoft NCSI" >nul
if "%errorlevel%"=="1" (call :OOBEmainblank & goto :OOBEmain2)
ping -n 1 google.com >nul
if "%errorlevel%"=="1" (call :OOBEmainblank & goto :OOBEmain2)
call :OOBE_Drawer 3 0 
echo.
echo.
echo          Do you want to hear the Windows XP OOBE Music?
echo.
echo          if you want, press Y.
echo          if you don't, press N.
echo.
echo.
echo          %clrgra%(Pressing Y will download about 15MB of data.)%clr2%
call :OOBE_EndLine
choice /c YN /n >nul
if %ErrorLevel%==1 goto :OOBEmainmusic
if %ErrorLevel%==2 call :OOBEmainblank&timeout /t 1 /nobreak >nul&goto :OOBEmain2


:OOBEmainmusic
call :OOBE_Drawer 0 0
echo.
echo.
echo          Preparing download music. Please wait a while...
if not defined dummy (set /p nothing=[1A[9C<nul)
call :Powersheller OOBEMusic
call :OOBEmainblank
goto :OOBEmain2

:OOBEmainblank
call :OOBE_Drawer 0 0
echo.
echo.
call :OOBE_EndLine
pathping 127.0.0.1 -n -q 1 -p 500 1>nul
exit /b

:OOBEmainshutdown
call :OOBE_Drawer 0 0
echo.
echo.
echo.
echo          Shutting down...
call :OOBE_EndLine
exit /b


:OOBEmain2
call :OOBE_Drawer 5 1
echo.
echo.
echo          Cursor Changer.bat is will generates two files.
echo          CursorChangerSetting.txt and %FirstSTFsfile%.
echo.
echo          CursorChangerSetting.txt stores the all settings of Cursor Changer,
echo          This file is very inportant file.
echo.
echo          %FirstSTFsfile% is used to store other values.
echo          and is also an important file.
echo          If the user (in this case %USERNAME%) deletes these files,
echo          this Cursor Changer.bat may not work properly.
echo          SO, DO NOT DELETE THESE FILE(s).
echo.
echo          (Y to Continue)
echo.
echo.
choice /c Y /n >nul
if %ErrorLevel%==1 goto :OOBEmain3


:OOBEmain3
call :OOBE_Drawer 6 1
echo.
echo.
echo          Tamago_1908, the creator of this Cursor Changer.bat,
echo          assumes no responsibility for any damage or injury caused by
echo          Cursor Changer.bat.
echo.
echo          In other words, all responsibility for downloading and executing
echo          this batch belongs to the person who downloaded and executed it.
echo.
echo          However, Tamago_1908 will provide patches to fix bugs
echo          and defects that may be included in this batch.
echo          The above disclaimer has the same meaning as the one in the Readme 
echo          disclaimer at Cursor Changer Github.
echo.
echo          (Y to Continue)
echo.
echo.
choice /c Y /n >nul
if %ErrorLevel%==1 goto :OOBEmain4


:OOBEmain4
call :OOBE_Drawer 7 1
echo.
echo.
echo          Do not modify the contents of Cursor Changer 
echo          or redistribute copies or modified versions.
echo          (Unless otherwise agreed by the developer)
echo          These are prohibited in accordance with Aperture licese 2.0. 
echo.
echo          The developer of this batch is tamago_1908, and can
echo          be contacted via Github or SNS if you wish to contact
echo          me in any way.
echo          (For example, when you have bugs, problems, improvements or
echo           questions about this batch)
echo.
echo          (Y to Continue)
call :OOBE_EndLine
choice /c Y /n >nul
if %ErrorLevel%==1 call :OOBEmainblank


:OOBEmain5
call :OOBE_Drawer 4 2
echo.
echo.
echo          Currently, the English version of Cursor Changer is installed.
echo          Is this correct?
echo.
echo.
echo          (Y=Yes, That's Correct.)
echo          (N=No, I don't Understand English.)
call :OOBE_EndLine
choice /c YN /n >nul
if %ErrorLevel%==1 call :OOBEmainblank&goto :OOBEmain5_1
if %ErrorLevel%==2 goto :OOBEmain5ifno


:OOBEmain5ifno
call :OOBE_Drawer 4 2
echo.
echo.
echo          Sorry, Currently Cursor Changer does not support
echo          Other languages.
echo.
echo          If you want to use Cursor Changer with other languages,
echo          Wait for an update, or give up.
echo          Do you want to continue setup?
echo.
echo.
echo          (Y=Yes, I want setup Cursor Changer!)
echo          (N=No, I will quit setup.)
call :OOBE_EndLine
choice /c YN /n >nul
if %ErrorLevel%==1 call :OOBEmainblank&goto :OOBEmain5_1
if %ErrorLevel%==2 call :OOBEmainshutdown & timeout /t 1 /nobreak >nul&call :exit 0


:OOBEmain5_1
call :OOBE_Drawer 4 2
echo.
echo.
echo          You can enter what you want Cursor Changer to call you.
echo          By default, it will call you "%USERNAME%".
echo          Do you want to change it?
echo.
echo.
echo          (Y=Yes, I want to change it.)
echo          (N=No, keep it.)
call :OOBE_EndLine
choice /c YN /n >nul
if %ErrorLevel%==1 call :OOBEmainblank&goto :OOBEmain5_2
if %ErrorLevel%==2 call :OOBEmainblank&goto :OOBEmain6


:OOBEmain5_2
set YourName=
call :OOBE_Drawer 0 2
echo.
echo.
echo          Now, please enter below what you would like to be called.
echo.
echo.
echo          Input box :
call :OOBE_EndLine
if not defined dummy (set /p YourName=%clr2%[10;21H[?25h& set /p nothing=[?25l<nul)
if %ErrorLevel%==2 goto :OOBEmain5_2c


:OOBEmain5_2c
if not defined Yourname goto :OOBEmain5_2c_error
call :OOBEmain5_2c_Easteregg
if "%errorlevel%"=="1" (goto :OOBEmain5_2) else if "%errorlevel%"=="2" (cls & mode con: cols=75 lines=25 & title Cursor Changer& goto :CursorChangerOOBE)
call :OOBE_Drawer 4 2
echo.
echo.
echo          You entered "%YourName%".
echo          Are you sure?
echo.
echo.
echo          (Y=Yes!)
echo          (N=No.)
call :OOBE_EndLine
choice /c YN /n >nul
if %ErrorLevel%==1 call :OOBEmainblank&goto :OOBEmain6
if %ErrorLevel%==2 goto :OOBEmain5_2


:OOBEmain5_2c_error
call :OOBE_Drawer 0 2
echo.
echo.
echo          Please enter something in input box.
echo          You cannot continue without a name!
echo.
echo.
echo          (Hit Any key to Continue...)
call :OOBE_EndLine
pause >nul
goto :OOBEmain5_2


:OOBEmain5_2c_Easteregg
if "%YourName%"=="tamago_1908" (set "OOBEmain5_2c_Easteregg_TextTemp=Hey, That's my name!!!!!!!! ^>:("
) else if "%YourName%"=="Kinito" (set "OOBEmain5_2c_Easteregg_TextTemp=I know you."
) else if "%YourName%"=="Boykisser" (set "OOBEmain5_2c_Easteregg_TextTemp=A furry!?"
) else if "%YourName%"=="Sigma" (set "OOBEmain5_2c_Easteregg_TextTemp=NO."
) else if "%YourName%"=="Cake" (set "OOBEmain5_2c_Easteregg_TextTemp=Cake is a lie."
) else if "%YourName%"=="Hello_World" (set "OOBEmain5_2c_Easteregg_TextTemp='Hello_World' is not recognized as an internal or external command,[8;10Hoperable program or batch file."
) else if "%YourName%"=="Shivter" (set "OOBEmain5_2c_Easteregg_TextTemp=My God. Your holy name is too much for me to bear. [8;10HPlease, Give me another name."
) else if "%YourName%"=="sambubo" (set "OOBEmain5_2c_Easteregg_TextTemp=I KNOW YOU HERE SAMBUBO"
) else if "%YourName%"=="AAAAAA" (set "OOBEmain5_2c_Easteregg_TextTemp=Not very creative... I won't allow it."
) else if "%YourName%"=="Sans" (set "OOBEmain5_2c_Easteregg_TextTemp=Nope."
) else if "%YourName%"=="egg" (exit /b 2) else (exit /b 0)
call :OOBE_Drawer 0 2
echo.
echo.
echo          %OOBEmain5_2c_Easteregg_TextTemp%
echo.
echo.
echo          (Hit any key to Continue...)
call :OOBE_EndLine
pause >nul
set OOBEmain5_2c_Easteregg_TextTemp=
exit /b 1



:OOBEmain6
call :OOBE_Drawer 4 3
echo.
echo.
echo          Cursor Changer is able to choose
echo          between a white or dark theme.
echo          Do you want to choose? 
echo.
echo          (If not selected, the default dark theme will be used.)
echo.
echo.
echo          (Y=Yes, I want to Choose the theme!)
echo          (N=No, I don't want to.)
call :OOBE_EndLine
choice /c YN /n >nul
if %ErrorLevel%==1 goto :OOBEmain6Theme
if %ErrorLevel%==2 call :OOBEmainblank&set oobetheme=dark&goto :OOBEmain7


:OOBEmain6Theme
setlocal enabledelayedexpansion
set OOBEmain6ThemeCurrent=0
if not defined dummy (set clrO6theme=[7m& set clrO6theme2=[0m)

:OOBEmain6Theme_Main
set OOBE6THexit=false
if not defined dummy (set /p nothing=[5;0H[2K<nul)
for /l %%i in (1,1,512) do if "!OOBE6THexit!"=="false" ( if not defined dummy (set /p nothing=[5;0H<nul)
if !OOBEmain6ThemeCurrent! geq 0 if !OOBEmain6ThemeCurrent! leq 1 (call :OOBE_Drawer 10 3 false) else (call :OOBE_Drawer 10 3 true)
echo.
echo.
echo          O============O    O=============O
echo          I!OOBEmain6ThemeButton1! Dark theme !clrO6theme2!I    I!OOBEmain6ThemeButton2! white theme !clrO6theme2!I
echo          O============O    O=============O
echo.
echo.
call :OOBEmain6Theme_Draw
echo.
echo          ^(A,D or 1,2 to move, Y or E to confirm.^)
echo          ^(B to stop choosing the theme.^)
call :OOBE_EndLine
choice /c 12ADYEBN /n >nul
if !Errorlevel! geq 7 if !Errorlevel! leq 8 (set OOBE6THexit=discard)
if !Errorlevel! geq 1 if !Errorlevel! leq 2 (set OOBEmain6ThemeCurrent=!Errorlevel!)
if !OOBEmain6ThemeCurrent!==0 (set OOBEmain6ThemeCurrent=1& set OOBEmain6ThemeButton1=!clrO6theme!) else (
if !ErrorLevel!==3 (if not !OOBEmain6ThemeCurrent!==1 (set /a OOBEmain6ThemeCurrent-=1))
if !ErrorLevel!==4 (if not !OOBEmain6ThemeCurrent!==2 (set /a OOBEmain6ThemeCurrent+=1))
if !Errorlevel! geq 5 if !Errorlevel! leq 6 (set OOBE6THexit=true)
if !OOBEmain6ThemeCurrent! geq 0 if !OOBEmain6ThemeCurrent! leq 1 (set clrO6theme=[7m& set clrO6theme2=[0m) else (set clrO6theme=[100m[97m& set clrO6theme2=[0m[107m[30m)
set OOBEmain6ThemeButton1=& set OOBEmain6ThemeButton2=& set OOBEmain6ThemeButton!OOBEmain6ThemeCurrent!=!clrO6theme!))
if "!OOBE6THexit!"=="false" (set /p nothing=[5;0HLag spike :3<nul& goto :OOBEmain6Theme_Main
) else (if "!OOBE6THexit!"=="true" (goto :OOBEmain6Theme_Confirm) else (if "!OOBE6THexit!"=="discard" (goto :OOBEmain6Theme_Discard)))

:OOBEmain6Theme_Draw
if "!OOBEmain6ThemeCurrent!"=="0" (
    echo    ^・   Nothing Selected. A,D or 1,2 to chooce the theme.
)
if "!OOBEmain6ThemeCurrent!"=="1" (
    echo     ^・   The most ordinary theme and most suitable.
    echo     ^・   and optimized theme for using Cursor Changer.
    echo     ^・   This is usually recommended.
)
if "!OOBEmain6ThemeCurrent!"=="2" (
    echo     ^・   This theme has a special atmosphere.
    echo     ^・   It displays more brightly than the dark theme.
    echo     ^・   Some functions of Cursor Changer may not
    echo          befully compatible with this theme.
)
exit /b

:OOBEmain6Theme_Confirm
if !OOBEmain6ThemeCurrent! geq 0 if !OOBEmain6ThemeCurrent! leq 1 (call :OOBE_Drawer 10 3 false) else (call :OOBE_Drawer 10 3 true)
echo.
echo.
echo          O============O    O=============O
echo          I!OOBEmain6ThemeButton1! Dark theme !clrO6theme2!I    I!OOBEmain6ThemeButton2! white theme !clrO6theme2!I
echo          O============O    O=============O
echo.
echo     ^・   Are you sure you want to select this theme?
echo           (Hint: You can change the theme later. )
echo.
echo.
echo          (Y=Yes! I like this theme.)
echo          (N=Nuh uh)
call :OOBE_EndLine
choice /c BNYE /n >nul
if !Errorlevel! geq 1 if !Errorlevel! leq 2 (goto :OOBEmain6Theme_Main)
if !Errorlevel! geq 3 if !Errorlevel! leq 4 (
if !OOBEmain6ThemeCurrent!==1 (set oobetheme=dark) else (set oobetheme=white)
    call :OOBEmain6Theme_exit & call :OOBEmainblank & goto :OOBEmain7
)

:OOBEmain6Theme_Discard
if !OOBEmain6ThemeCurrent! geq 0 if !OOBEmain6ThemeCurrent! leq 1 (call :OOBE_Drawer 10 3 false) else (call :OOBE_Drawer 10 3 true)
echo.
echo.
echo          Do you want Discard theme selection and proceed?
echo          (If you discard, the default dark theme will be selected.)
echo.
echo.
echo          (Y= Yes, I want to discard it.)
echo          (N= No, I want to Choose the theme^^!)
call :OOBE_EndLine
choice /c YN /n >nul
if !ErrorLevel!==1 (set oobetheme=dark& call :OOBE_Drawer 10 3 false & call :OOBEmain6Theme_exit & call :OOBEmainblank & goto :OOBEmain7)
if !ErrorLevel!==2 (goto :OOBEmain6Theme_Main)

:OOBEmain6Theme_exit
setlocal disabledelayedexpansion
rem initialize of variable
set OOBEmain6ThemeCurrent=& set OOBEmain6ThemeButton1=& set OOBEmain6ThemeButton2=& set OOBE6THexit=
set clrO6theme=& set clrO6theme2=
exit /b



:OOBEmain7
call :OOBE_Drawer 4 4
echo.
echo.
echo          Cursor Changer is able to customize settings.
echo          Do you want to customize?
echo.
echo          (if you don't, The settings will set to default values.)
echo.
echo.
echo          (Y=Yes, I want to!)
echo          (N=No, That's just a pain in the ass.)
call :OOBE_EndLine
choice /c YN /n >nul
if %ErrorLevel%==1 call :OOBEmainblank&goto :OOBEmain7CustomizeSettings
if %ErrorLevel%==2 call :OOBEmainblank&goto :OOBEmain8


:OOBEmain7CustomizeSettingsdiscard
call :OOBE_Drawer 4 4
echo.
echo.
echo          Do you really want to discard customize setting?
echo.
echo          (if you discard, all settings will be set to defaults.)
echo.
echo          (Y=Yes, I want to discard it!)
echo          (N=No, I want customize settings!)
call :OOBE_EndLine
choice /c YN /n >nul
if %ErrorLevel%==1 call :OOBEmain7CustomizeSettings_exit & call :OOBEmainblank&set OOBESettingtoggle_1=true&set OOBESettingtoggle_2=false&set OOBESettingtoggle_3=false&set OOBESettingtoggle_4=true&set OOBESettingtoggle_5=true&goto :OOBEmain8
if %ErrorLevel%==2 call :OOBE_Drawer 11 4 & goto :OOBEmain7CustomizeSettings_Main


:OOBEmain7CustomizeSettings
rem GUI Type 4
setlocal enabledelayedexpansion
if "%oobetheme%"=="white" (set OOBEsettingclr=[100m[97m&set OOBEsettingclr2=[0m[107m[30m)
if "%oobetheme%"=="dark" (set OOBEsettingclr=[7m&set OOBEsettingclr2=[0m)
for /l %%i in (1,1,5) do (set OOBESettingtoggle_%%i=false)
set OOBE7CSsel_Temp=0
set OOBE7CSsel=0
call :OOBE_Drawer 11 4

:OOBEmain7CustomizeSettings_Main
set OOBE7CSexit=false
if not defined dummy (set /p nothing=[5;0H[2K<nul)
for /l %%i in (1,1,512) do if "!OOBE7CSexit!"=="false" ( if not defined dummy (set /p nothing=[5;0H<nul)
echo.
echo.
echo          O================================O   Customize of Settings
echo          I!OOBE7CSButton1! 1 Boot as Cursor Changer       %OOBEsettingclr2%I   
echo          O================================O   
echo          I!OOBE7CSButton2! 2 Admin when boot              %OOBEsettingclr2%I   
echo          O================================O   
echo          I!OOBE7CSButton3! 3 Check update at boot         %OOBEsettingclr2%I   
echo          O================================O   
echo          I!OOBE7CSButton4! 4 Allow sound to play          %OOBEsettingclr2%I   
echo          O================================O   
echo          I!OOBE7CSButton5! 5 Boot animation               %OOBEsettingclr2%I   
echo          O================================O   
echo                       I!OOBE7CSButton6!  OK  %OOBEsettingclr2%I
echo                       O======O
echo.
echo.
call :OOBEmain7CustomizeSettings_Main_Draw
choice /c 123456WSYENB /n >nul
set OOBE7CSsel_Temp=!OOBE7CSsel!
if !Errorlevel! geq 11 if !Errorlevel! leq 12 (set OOBE7CSexit=discard)
if !Errorlevel! geq 1 if !Errorlevel! leq 6 (set OOBE7CSsel=!Errorlevel!)
if !OOBE7CSsel!==0 (set OOBE7CSsel=1& set OOBE7CSButton1=%OOBEsettingclr%) else (
if !ErrorLevel!==7 (if not !OOBE7CSsel!==1 (set /a OOBE7CSsel-=1) else (set OOBE7CSsel=1))
if !ErrorLevel!==8 (if not !OOBE7CSsel!==6 (set /a OOBE7CSsel+=1) else (set OOBE7CSsel=6))
if !Errorlevel! geq 9 if !Errorlevel! leq 10 (if !OOBE7CSsel!==6 (set OOBE7CSexit=true) else ( for %%a in (!OOBE7CSsel!) do ( rem < Button toggle
if not "!OOBE7CSsel!"=="6" if "!OOBESettingtoggle_%%a!"=="false" (set OOBESettingtoggle_!OOBE7CSsel!=true) else (set OOBESettingtoggle_!OOBE7CSsel!=false))))
rem Button press processing
for %%a in (!OOBE7CSsel!) do for %%b in (!OOBE7CSsel_Temp!) do ( rem < Blue highlight processing
    if "!OOBESettingtoggle_%%a!"=="true" (
        if "!OOBESettingtoggle_%%b!"=="true" ( set OOBE7CSButton!OOBE7CSsel_Temp!=%OOBEsettingclr%
            ) else (set OOBE7CSButton!OOBE7CSsel_Temp!=)
        set OOBE7CSButton!OOBE7CSsel!=[100m[46m
    ) else ( for /l %%i in (1,1,6) do ( rem < Normal highlight processing
        if "!OOBESettingtoggle_%%i!"=="true" (
            if "%%i"=="!OOBE7CSsel!" ( set OOBE7CSButton%%i=%OOBEsettingclr%
            ) else (set OOBE7CSButton%%i=%OOBEsettingclr%)
        ) else (if "%%i"=="!OOBE7CSsel!" (set OOBE7CSButton!OOBE7CSsel!=%OOBEsettingclr%) else (set OOBE7CSButton%%i=))
      )
    )
)))
if "!OOBE7CSexit!"=="false" (set /p nothing=[5;0HLag spike :3<nul& goto :OOBEmain7CustomizeSettings_Main
) else (if "!OOBE7CSexit!"=="true" (goto :OOBEmain7CustomizeSettingsOKconfirm) else (if "!OOBE7CSexit!"=="discard" (goto :OOBEmain7CustomizeSettingsdiscard)))

:OOBEmain7CustomizeSettings_Main_Draw
rem Draw deskription of settings
for /l %%i in (9,1,17) do (set /p nothing=[%%i;46H                                   <nul)
if "!OOBE7CSsel!"=="0" (set /p nothing=[9;46H Nothing selected...[11;46H W or S and 1~6 to move.[12;46H Y to Toggle it, N or B to[13;46H Discard.[14;46H move to "OK" and enter Y to[15;46H confirm.<nul)
if "!OOBE7CSsel!"=="1" (set /p nothing=[9;46H Setting whether to transition to[10;46H Cursor Change after startup.[11;46H You can change the[12;46H cursor faster.[15;46H %clrgra%disable is recommended.%OOBEsettingclr2%<nul)
if "!OOBE7CSsel!"=="2" (set /p nothing=[9;46H Attempts to obtain administrative[10;46H privileges at startup.[11;46H Should be enabled in case of[12;46H problems changing Cursors.[13;46H Enabling may also faster boot up.[15;46H %clrgra%disable is recommended.%OOBEsettingclr2%<nul)
if "!OOBE7CSsel!"=="3" (set /p nothing=[9;46H Check Update at boot up.[10;46H Updates, if any, can be applied.[11;46H However, Boot time may be slower.[12;46H API rate limit of github[13;46H may be reached.[15;46H %clrgra%disable is recommended.%OOBEsettingclr2%<nul)
if "!OOBE7CSsel!"=="4" (set /p nothing=[9;46H You can toggle whether or not to[10;46H play sounds such as when boot up.[11;46H If this is enabled, sounds will[12;46H be played at boot up, etc.[15;46H %clrgra%enable is recommended.%OOBEsettingclr2%<nul)
if "!OOBE7CSsel!"=="5" (set /p nothing=[9;46H You can toggle the startup[10;46H animation after boot up[11;46H If disabled, boot up will be[12;46H 2 seconds faster, but[13;46H with less visual.[15;46H %clrgra%enable is recommended.%OOBEsettingclr2%<nul)
if "!OOBE7CSsel!"=="6" (set /p nothing=[9;46H Confirms the setting.[10;46H However, it is recommended that[11;46H at least one setting be enabled.[12;46H All of these settings can be[13;46H change later.<nul)
if not defined dummy (set /p nothing=[20;0H<nul)
exit /b


:OOBEmain7CustomizeSettingsOKconfirm
call :OOBE_Drawer 4 4
echo.
echo.
echo          Customize of settings :
echo.
echo          1 Boot as Cursor Changer       : %OOBESettingtoggle_1% %clrgra%(recommend false)%OOBEsettingclr2%
echo          2 Admin when boot              : %OOBESettingtoggle_2% %clrgra%(recommend false)%OOBEsettingclr2%
echo          3 Check update at boot         : %OOBESettingtoggle_3% %clrgra%(recommend false)%OOBEsettingclr2%
echo          4 Allow sound to play          : %OOBESettingtoggle_4% %clrgra%(recommend true)%OOBEsettingclr2%
echo          5 Boot animation               : %OOBESettingtoggle_5% %clrgra%(recommend true)%OOBEsettingclr2%
echo.
echo          If you continue, these settings will be written to the Setting file.
echo          Are you sure? %clrgra%(setting file is at "%batchmainpath%")%OOBEsettingclr2%
echo.
echo          (Y=Yes, this is fine.)
echo          (N=No, I want to change it.)
echo.
echo.
choice /c YN /n >nul
if %ErrorLevel%==1 call :OOBEmainblank & goto :OOBEmain8
if %ErrorLevel%==2 call :OOBE_Drawer 11 4 & goto :OOBEmain7CustomizeSettings_Main

:OOBEmain8
setlocal disabledelayedexpansion
for /l %%i in (1,1,5) do (set OOBE7CSButton%%i=)
set OOBE7CSexit=& set OOBE7CSsel=& set OOBE7CSsel_Temp=
set OOBEsettingclr=& set OOBEsettingclr2=

rem setting written, well, wtf is this?? so many goofy ahh if statement. hell no NOT AGAIN!!!!!!!!!!!!
if not exist %Settingsfile% (
    type nul > %Settingsfile%
    echo nodogcheckfor1234567890qwertyuiop >> %Settingsfile% 

    if defined YourName (
        echo YourName=%YourName% >> %Settingsfile%
    ) else if not defined YourName (echo YourName=%USERNAME% >> %Settingsfile%)

    if "%OOBESettingtoggle_1%"=="false" (
        echo BootAsCC=false >> %Settingsfile%
    ) else if "%OOBESettingtoggle_1%"=="true" (
        echo BootAsCC=true >> %Settingsfile%
    ) else (echo BootAsCC=false >> %Settingsfile%)

    if "%OOBESettingtoggle_2%"=="false" (
        echo admin=false >> %Settingsfile%
    ) else if "%OOBESettingtoggle_2%"=="true" (
        echo admin=true >> %Settingsfile%
    ) else (echo admin=false >> %Settingsfile%)

    if "%OOBESettingtoggle_3%"=="false" (
        echo CheckUpdate=false >> %Settingsfile%
    ) else if "%OOBESettingtoggle_3%"=="true" (
        echo CheckUpdate=true >> %Settingsfile%
    ) else (echo CheckUpdate=false >> %Settingsfile%)

    if "%OOBESettingtoggle_4%"=="false" (
        echo PlaySound=false >> %Settingsfile%
    ) else if "%OOBESettingtoggle_4%"=="true" (
        echo PlaySound=true >> %Settingsfile%
    ) else (echo PlaySound=true >> %Settingsfile%)

    if "%OOBESettingtoggle_5%"=="false" (
        echo bootanimation=false >> %Settingsfile%
    ) else if "%OOBESettingtoggle_5%"=="true" (
        echo bootanimation=true >> %Settingsfile%
    ) else (echo bootanimation=true >> %Settingsfile%)

    echo s5_linuxboot=false >> %Settingsfile%
    echo s5_simpleboot=false >> %Settingsfile%
    echo s5_rawboot=false >> %Settingsfile%
    echo Underline=true >> %Settingsfile%
    echo MainmenuBg=true >> %Settingsfile%
    
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
))

call :OOBE_Drawer 12 5
echo.
echo.
echo          Setup is complete.
echo.
echo          Finally, if you find any errors, bugs or problems
echo          on Cursor Changer, please create an issue on github.
echo.
echo          Cursor Changer is still incomplete and unpolished.
echo          Please understand that.
echo.
echo          (Press Y or E to leave setup and goto Main Menu)
call :OOBE_EndLine
choice /c YE /n >nul
if %Errorlevel% geq 1 if %Errorlevel% leq 2 call :OOBEmainblank & call :OOBEinitialization & set bootbatnow=yes& goto :batstart


:OOBEinitialization
mode con: cols=75 lines=25
if "%oobetheme%"=="white" (color f0) else (color 07)
if not defined dummy (set /p nothing=[0;0H[?25h<nul)
for /l %%i in (1,1,5) do (set set OOBESettingtoggle_%%i=& set OOBEsetting%%i=& set OOBEsetting%%iclr2=)
set OOBEsettingclr=& set OOBEsettingclr2=
set clrgra=& set clrhigh=& set clrhighend=& set clrwhi=& set moveline=
set clr1=& set clresc=& set clrmove=& set clr2=& set clr=
set oobetheme=
set boottime1=%time%
call :Core_Powershell 3
exit /b



:Cursor_Changer_REmenu
cls
mode con: cols=75 lines=25
rem GUI Type 4 (No skipping drawing buttons)
rem recovery menu for Cursor Changer, and recovery console
set DynamicWinverCheck=true& call :batbootcheckwinver dynamic & set DynamicWinverCheck=
if "%errorlevel%"=="1" (goto :batbootcheckwinverbad)
if not defined dummy (set clr=[7m&set clrgra=[90m&set clr2=[0m)
if "%wmodetoggle%"=="false" (set clr=[7m&set clrgra=[90m&set clr2=[0m)
if "%wmodetoggle%"=="true" (set clr=[100m[97m&set clrgra=[107m[38;2;140;140;140m&set clr2=[90m[107m[30m)
if not defined dummy (set /p nothing=[?25l<nul)
set bootbatnow=no& set rmsel=0&
set Remenu_Redraw=true
echo Preparing Recovery menu, Please wait a while...& timeout /t 1 /nobreak >nul
cls
title Cursor Changer ^| Recovery Menu
setlocal enabledelayedexpansion

:Cursor_Changer_REmenu_loop
if not defined dummy (set /p nothing=[H[2K<nul)
for /l %%i in (1,1,512) do ( if not defined dummy (set /p nothing=[?25l[25;0H%clrgra%%batbuild%%clr2%[H<nul)
rem Draw menu
echo                     Cursor Changer %batver% Recovery Menu
echo.
echo                         !rmcb1!          Reboot          %clr2%
echo                         !rmcb2!       Wipe Setting       %clr2%
echo                         !rmcb3!     Recovery Console     %clr2%
echo                         !rmcb4! Reinstall Cursor Changer %clr2%
echo                         !rmcb5!        Exit Menu         %clr2%
echo.
echo.
echo.
echo.
echo                   %clrgra%1~5 or WS to select, E or Y to Enter.%clr2%
rem Draw description
for /l %%i in (9,1,10) do (set /p nothing=[%%i;7H[2K<nul)
if !rmsel!==0 (set /p nothing=[9;22H Currently nothing is selected.<nul)
if !rmsel!==1 (set /p nothing=[9;26H Reboot Cursor Changer.[10;22H ^(Usually this is recommended.^)<nul)
if !rmsel!==2 (set /p nothing=[9;31H Wipe setting.[10;27H ^(Reset all settings.^)<nul)
if !rmsel!==3 (set /p nothing=[9;29H Recovery Console.[10;8H ^(Enter to the Recovery menu. you can use debug commands.^)<nul)
if !rmsel!==4 (set /p nothing=[9;25H Reinstall Cursor Changer.[10;13H Download the latest version from the Internet.<nul)
if !rmsel!==5 (set /p nothing=[9;30H Exit this menu.[10;32H ^(Shutdown^)<nul)

rem Ask for input, and process the move inputs
choice /c 12345WSYE /n >nul
set rmsel_Temp=!rmsel!
if !Errorlevel! geq 1 if !Errorlevel! leq 5 (set rmsel=!Errorlevel!)
if !rmsel!==0 (set rmsel=1& set rmcb1=%clr%) else (
if !ErrorLevel!==6 (if not !rmsel!==1 (set /a rmsel-=1) else (set rmsel=5))
if !ErrorLevel!==7 (if not !rmsel!==5 (set /a rmsel+=1) else (set rmsel=1))
if !Errorlevel! geq 8 if !Errorlevel! leq 9 (call :Cursor_Changer_REmenu_Core)
for /l %%i in (1,1,5) do (set rmcb%%i=) & set rmcb!rmsel!=%clr%))
if not defined dummy (set /p nothing=[0;0HLag spike :3<nul& goto :Cursor_Changer_REmenu_loop)

:Cursor_Changer_REmenu_Core
rem Process select
if !rmsel!==1 (call :Cursor_Changer_REmenu_Exit & call :PowerScreen reboot)
if !rmsel!==2 (call :Cursor_Changer_REWipe)
if !rmsel!==3 (call :Cursor_Changer_REConsole)
if !rmsel!==4 (call :Cursor_Changer_Reinstall)
if !rmsel!==5 (call :Cursor_Changer_REmenu_Exit & call :PowerScreen)
title Cursor Changer ^| Recovery Menu
cls & exit /b

:Cursor_Changer_REmenu_Exit
setlocal disabledelayedexpansion
rem initialize variables
set runningfromfulldebug=& set FromREConsole=& set Remenuexit=&
for /l %%i in (1,1,5) do (set rmcb%%i=) & set rmcb!rmsel!=%clr%
exit /b


:Cursor_Changer_REWipe
cls
title Cursor Changer ^| Wipe Setting
echo                     Cursor Changer %batver% Recovery Menu                
echo.
echo.  
echo                     Wipe Setting (back to default value) 
echo                                 Are you sure?
echo.
echo.
echo                           Y to confirm, N to back.
echo.
choice /c YN /n 
if %ErrorLevel%==1 (call :Wipealldeta & goto :Cursor_Changer_REWipeYippeee)
if %ErrorLevel%==2 (set rmsel=2& exit /b)

:Cursor_Changer_REWipeYippeee
cls
title Cursor Changer ^| Setting Wiped!
echo                     Cursor Changer %batver% Recovery Menu                
echo.
echo.  
echo                               Wipe Setting
echo                                    is
echo                             Successfully Done.
echo.
echo.
echo.
timeout /t 3 /nobreak >nul
set rmsel=2& exit /b

:Cursor_Changer_Reinstall
cls
title Cursor Changer ^| Reinstall Cursor Changer
echo                     Cursor Changer %batver% Recovery Menu                
echo.
echo.  
echo                           Reinstall Cursor Changer
echo                  This will download the latest version of
echo                    Cursor Changer from Github repository. 
echo                  This will not affect the setting file(s).
echo.
echo                           Y to confirm, N to back.
echo.
choice /c YN /n 
if %ErrorLevel%==1 (cls & echo Reinstalling...& set Doupdate_Text=Reinstall complete.& call :Powersheller Doupdate & exit)
if %ErrorLevel%==2 (set rmsel=4& exit /b)


:Cursor_Changer_REConsole
cls
mode con: cols=75 lines=25
set selected=
set FromREConsole=true
set bootbatnow=no
if not defined dummy (set /p nothing=[?25h<nul)
echo Preparing Recovery Console, Please wait a while...
timeout /t 2 /nobreak >nul
cls
:Cursor_Changer_REConsolemain
if not defined dummy (set /p nothing=[?25h<nul)
title Cursor Changer ^| Recovery Console
echo tamago_1908 Cursor Changer [Version %batver%]
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
echo                                                hello :)
echo                                      Enter the your commands to use.
echo                                                Hit "help"
echo                                           to Show commandlists.
echo                                 You can use debbuging purposes commands.
echo                                    (restoresetting to reset settings)
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
if "%selected%"=="debugyesnow" (goto :darkgo)
if "%selected%"=="fulldebug" (goto :fulldebug)
if "%selected%"=="getadmin" (goto :batstartadm)
if "%selected%"=="restoresetting" (
call :Wipealldeta
echo done. enter somethings to continue.
pause >nul
)
if "%selected%"=="uninstalldeletebat" (echo delete bat, confirm to type something...&pause&goto :uninstalldeletefinish5)
if "%selected%"=="windowsfiltertest" (goto :batbootcheckwinverbad)
if "%selected%"=="funanimationdeb" (goto :batbootanimationfun)
if "%selected%"=="openie" (goto :openiedev)
if "%selected%"=="setenter" (echo.&set /p PlaySound=pls type:&goto :Mainmenuboot) else (set selected= &echo enter valid command.&goto :Cursor_Changer_REConsoleask)


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
echo Underline=true >> %Settingsfile%
echo MainmenuBg=true >> %Settingsfile%
echo wmode=false >> %Settingsfile%
exit /b


rem Detects settings related to prompts for administrative privileges,
:batstart
if "%linuxboot%"=="false" (mode con: cols=75 lines=25)
if "%settingbypass%"=="true" (goto :Mainmenuskipboot)
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] admin checked.) else (cls)
rem Detection of administrative permission settings
find "admin=true" %Settingsfile% > nul
if "%adminbypass%"=="true" (goto :gotadmin)
if "%errorlevel%"=="0" (goto :batstartadm) else (
call :SAB_Manager 0
goto :Mainmenuboot
)

:batstartadm
if not "%linuxboot%"=="true" (cls)
rem Obtaining administrative privileges
if not "%linuxboot%"=="true" (echo copyright.Cursor Changer %batver% by tamago_1908)
>nul 2>&1 "%SYSTEMROOT%\system32\icacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    goto :UACPrompt
) else ( goto :gotAdmin )
:UACPrompt
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Requesting Administrative privileges...)
powershell -NoProfile -Command "Start-Process '%~dp0%~n0%~x0' -Verb RunAs" >nul && PowerShell -WindowStyle Hidden -Command Exit && call :exit 0
echo.
if "%linuxboot%"=="true" (echo [%linuxishclred%ERROR%linuxishclr2%] Request for administrative privileges denied. & echo.) else (
echo Request for administrative privileges denied.
echo ^(Tip : You can disable this furture at setting.^)
)
timeout /t 2 /nobreak >nul
:gotAdmin
if not "%linuxboot%"=="true" (cls)
pushd "%CD%"
goto :Mainmenuboot



:Mainmenuboot
if "%uninstallentered%"=="true" (
set uninstallno2clr=
set uninstallno2clr2=
set uninstallclr=
set uninstallclr2=
set uninstallentered=
)
if "%settingbypass%"=="true" (goto :mainmenuskipboot)
rem There is a difference between a goto :Mainmenuboot and a direct goto :to the menu. The difference is whether you go to the menu via the settings loading section or not.
rem Basically, it is better to go through the settings, but if speed is important, you can go directly.

rem setting and other loading
rem need to assign variables to what to load and where to goto :after loading set wantload=setting1 set whatloadgoto=Mainmenuboot etc. only if it is Mainmenuboot related
rem The cursor color is not implemented in the main change section. It is not designed so that you can come back to Mainmenuboot after changing it.
rem If you want to add a setting, you can copy and paste it. However, you may need to add some code if you want to change the look of the menu.
:settingloads
cd /d %batchmainpath%
if not exist %Settingsfile% (
cls
title Cursor Changer ^| Setting Error
echo setting file is does not exist.
pause
echo Perhaps it is because You moved it, or just a bug. OR, you intentionally erased the Setting file... At least it is true that the Setting file does not exist.
pause
cls
echo Regenerate the Setting file. All previous settings will be deleted.
pause
cls
call :Wipealldeta
title Cursor Changer ^| ...
echo Regenerate has Complete.
pause
echo Restart Cursor Changer to apply the changes.
pause
call :exit 1
)
if not exist %FirstSTFsfile% (
type nul > %FirstSTFsfile%
echo nodogcheckforfastboot >> %FirstSTFsfile%
)


rem uh oh :)
call :RandomDecisioner 32768
if "%errorlevel%"=="1" (title & color 04
    if not defined dummy (echo [0;0H)
    for /l %%i in (0,1,1000) do (set /p nothing= CLOSE NOW <nul)
timeout 2 /nobreak >nul & call :exit)
set die=& set die2=


rem loading settings
if "%bootbatnow%"=="no" (goto :whatload) else (goto :setting1load)
:setting1load
set allsettingerror=0
find "BootAsCC=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting1onoff=true 
if %ErrorLevel%==1 goto :setting1load2
if "%bootbatnow%"=="yes" (
if "%linuxboot%"=="true" if not "%bootbatnow%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Setting1 Loaded as "true")
call :SAB_Manager 1
goto :setting2load
)
goto :whatloadgoto


:setting2load
find "admin=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting2onoff=true 
if %ErrorLevel%==1 goto :setting2load2
if "%bootbatnow%"=="yes" (
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Setting2 Loaded as "true")
call :SAB_Manager 2
goto :setting3load
) 
goto :whatloadgoto

:setting3load
find "CheckUpdate=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting3onoff=true 
if %ErrorLevel%==1 goto :setting3load2
if "%bootbatnow%"=="yes" (
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Setting3 Loaded as "true")
call :SAB_Manager 3
goto :setting4load
) 
goto :whatloadgoto

:setting4load
find "PlaySound=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting4onoff=true 
if %ErrorLevel%==1 goto :setting4load2
if "%bootbatnow%"=="yes" (
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Setting4 Loaded as "true")
call :SAB_Manager 4
goto :setting5load
) 
goto :whatloadgoto

:setting5load
find "bootanimation=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting5onoff=true 
if %ErrorLevel%==1 goto :setting5load2
if "%bootbatnow%"=="yes" (
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Setting5 Loaded as "true")
call :SAB_Manager 5
goto :setting5_s1load
) 
goto :whatloadgoto

:setting5_s1load
find "s5_linuxboot=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting5_s1onoff=true 
if %ErrorLevel%==1 goto :setting5_s1load2
if "%bootbatnow%"=="yes" (
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Setting5_1 Loaded as "true")
call :SAB_Manager 5
goto :setting5_s2load
) 
goto :whatloadgoto

:setting5_s2load
find "s5_simpleboot=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting5_s2onoff=true 
if %ErrorLevel%==1 goto :setting5_s2load2
if "%bootbatnow%"=="yes" (
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Setting5_2 Loaded as "true")
call :SAB_Manager 5
goto :setting5_s3load
) 
goto :whatloadgoto

:setting5_s3load
find "s5_rawboot=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting5_s3onoff=true 
if %ErrorLevel%==1 goto :setting5_s3load2
if "%bootbatnow%"=="yes" (
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Setting5_3 Loaded as "true")
call :SAB_Manager 5
goto :setting6load
) 
goto :whatloadgoto

:setting6load
find "Underline=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting6onoff=true 
if %ErrorLevel%==1 goto :setting6load2
if "%bootbatnow%"=="yes" (
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Setting6 Loaded as "true")
call :SAB_Manager 6
goto :setting7load
) 
goto :whatloadgoto

:setting7load
find "MainmenuBg=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting7onoff=true 
if %ErrorLevel%==1 goto :setting7load2
if "%bootbatnow%"=="yes" (
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Setting7 Loaded as "true")
call :SAB_Manager 6
goto :wmodeload
) 
goto :whatloadgoto

:wmodeload
find "wmode=true" %Settingsfile% > nul
if "%ErrorLevel%"=="0" (set wmodeonoff=Change to dark theme &set wmodetoggle=true)
if "%ErrorLevel%"=="1" (goto :wmodeload2)
if "%bootbatnow%"=="yes" (
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Wmode Loaded as "true")
call :SAB_Manager 7
goto :loads
) 
goto :whatloadgoto

:allsettingtest
rem Verify missing settings
:setting1load2
find "BootAsCC=false" %Settingsfile% > nul
if %ErrorLevel%==0 (set setting1onoff=false& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting1 Loaded as "false")) else if %ErrorLevel%==1 set setting1onoff= null&set /a allsettingerror=allsettingerror+1& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclred%ERROR%linuxishclr2%] Setting1 is corrupted. Loaded as "null")
if "%bootbatnow%"=="yes" (call :SAB_Manager 1)
if "%bootbatnow%"=="yes" (goto :setting2load) else (goto :whatloadgoto)

:setting2load2
find "admin=false"  %Settingsfile% > nul
if %ErrorLevel%==0 (set setting2onoff=false& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting2 Loaded as "false")) else if %ErrorLevel%==1 set setting2onoff= null&set /a allsettingerror=allsettingerror+1& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclred%ERROR%linuxishclr2%] Setting2 is corrupted. Loaded as "null")
if "%bootbatnow%"=="yes" (call :SAB_Manager 2)
if "%bootbatnow%"=="yes" (goto :setting3load) else (goto :whatloadgoto)

:setting3load2
find "CheckUpdate=false"  %Settingsfile% > nul
if %ErrorLevel%==0 (set setting3onoff=false& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting3 Loaded as "false")) else if %ErrorLevel%==1 set setting3onoff= null&set /a allsettingerror=allsettingerror+1& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclred%ERROR%linuxishclr2%] Setting3 is corrupted. Loaded as "null")
if "%bootbatnow%"=="yes" (call :SAB_Manager 3)
if "%bootbatnow%"=="yes" (goto :setting4load) else (goto :whatloadgoto)

:setting4load2
find "PlaySound=false" %Settingsfile% > nul
if %ErrorLevel%==0 (set setting4onoff=false& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting4 Loaded as "false")) else if %ErrorLevel%==1 set setting4onoff= null&set /a allsettingerror=allsettingerror+1& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclred%ERROR%linuxishclr2%] Setting4 is corrupted. Loaded as "null")
if "%bootbatnow%"=="yes" (call :SAB_Manager 4)
if "%bootbatnow%"=="yes" (goto :setting5load) else (goto :whatloadgoto)

:setting5load2
find "bootanimation=false" %Settingsfile% > nul
if %ErrorLevel%==0 (set setting5onoff=false& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting5 Loaded as "false")) else if %ErrorLevel%==1 set setting5onoff= null&set /a allsettingerror=allsettingerror+1& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclred%ERROR%linuxishclr2%] Setting5 is corrupted. Loaded as "null")
if "%bootbatnow%"=="yes" (call :SAB_Manager 5)
if "%bootbatnow%"=="yes" (goto :setting5_s1load) else (goto :whatloadgoto)

:setting5_s1load2
find "s5_linuxboot=false" %Settingsfile% > nul
if %ErrorLevel%==0 (set setting5_s1onoff=false& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting5_1 Loaded as "false")) else if %ErrorLevel%==1 set setting5_s1onoff= null&set /a allsettingerror=allsettingerror+1& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclred%ERROR%linuxishclr2%] Setting5_1 is corrupted. Loaded as "null")
if "%bootbatnow%"=="yes" (call :SAB_Manager 5)
if "%bootbatnow%"=="yes" (goto :setting5_s2load) else (goto :whatloadgoto)

:setting5_s2load2
find "s5_simpleboot=false" %Settingsfile% > nul
if %ErrorLevel%==0 (set setting5_s2onoff=false& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting5_2 Loaded as "false")) else if %ErrorLevel%==1 set setting5_s2onoff= null&set /a allsettingerror=allsettingerror+1& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclred%ERROR%linuxishclr2%] Setting5_2 is corrupted. Loaded as "null")
if "%bootbatnow%"=="yes" (call :SAB_Manager 5)
if "%bootbatnow%"=="yes" (goto :setting5_s3load) else (goto :whatloadgoto)

:setting5_s3load2
find "s5_rawboot=false" %Settingsfile% > nul
if %ErrorLevel%==0 (set setting5_s3onoff=false& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting5_3 Loaded as "false")) else if %ErrorLevel%==1 set setting5_s3onoff= null&set /a allsettingerror=allsettingerror+1& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclred%ERROR%linuxishclr2%] Setting5_3 is corrupted. Loaded as "null")
if "%bootbatnow%"=="yes" (call :SAB_Manager 5)
if "%bootbatnow%"=="yes" (goto :setting6load) else (goto :whatloadgoto)

:setting6load2
find "Underline=false" %Settingsfile% > nul
if %ErrorLevel%==0 (set setting6onoff=false& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting6 Loaded as "false")) else if %ErrorLevel%==1 set setting6onoff= null&set /a allsettingerror=allsettingerror+1& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclred%ERROR%linuxishclr2%] Setting6 is corrupted. Loaded as "null")
if "%bootbatnow%"=="yes" (call :SAB_Manager 6)
if "%bootbatnow%"=="yes" (goto :setting7load) else (goto :whatloadgoto)

:setting7load2
find "MainmenuBg=false" %Settingsfile% > nul
if %ErrorLevel%==0 (set setting7onoff=false& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting7 Loaded as "false")) else if %ErrorLevel%==1 set setting7onoff= null&set /a allsettingerror=allsettingerror+1& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclred%ERROR%linuxishclr2%] Setting7 is corrupted. Loaded as "null")
if "%bootbatnow%"=="yes" (call :SAB_Manager 6)
if "%bootbatnow%"=="yes" (goto :wmodeload) else (goto :whatloadgoto)

:wmodeload2
find "wmode=false" %Settingsfile% > nul
if "%ErrorLevel%"=="0" (set wmodeonoff=Change to white theme& set wmodetoggle=false& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Wmode Loaded as "false")) else if "%ErrorLevel%"=="1" (set wmodeonoff=Change to null theme &set wmodetoggle=false&set /a allsettingerror=allsettingerror+1& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclred%ERROR%linuxishclr2%] Wmode is corrupted. Loaded as "null"))
if "%bootbatnow%"=="yes" (call :SAB_Manager 7)
if "%bootbatnow%"=="yes" (goto :loads) else (goto :whatloadgoto)



:loads
rem load your name
for /f "tokens=2 delims==" %%a in ('type %Settingsfile% ^| findstr /r "YourName=."') do (
    set "YourName=%%a"
)
set "YourName=%YourName: =%"
if defined YourName (
    if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo.& echo [%linuxishclr%Info%linuxishclr2%] Hello %YourName%!)
) else if not defined YourName (
    set "YourName=%USERNAME%"
    if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo.& echo [%linuxishclred%ERROR%linuxishclr2%] Your Name is does not exist. Who are you?)
)
call :SAB_Manager 8

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
if "%bootbatnow%"=="no" (echo Processing...) else (
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] %FirstSTFsfile% is Loaded.)
call :SAB_Manager 9
goto :cursorcolorload
)
if "%whatloadgoto%"=="Mainmenuboot" (goto :Mainmenu)
goto :cursorcolorload

:cursorcolorload
reg query "HKEY_CURRENT_USER\Control Panel\Cursors" /v "" | find "Windows Black" >nul
if "%ErrorLevel%"=="0" (set cursorcolor=White)
if "%ErrorLevel%"=="1" (set cursorcolor=White)
if "%bootbatnow%"=="no" (echo Processing...) else (
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Cursor Color is Loaded.)
call :SAB_Manager 10
goto :Mainmenucursorcolor2
)
if "%whatloadgoto%"=="Mainmenuboot" (goto :Mainmenu)

:Mainmenucursorcolor2
reg query "HKEY_CURRENT_USER\Control Panel\Cursors" /v "" | find "Windows Default" >nul
if "%ErrorLevel%"=="0" (set cursorcolor=Black)
if "%bootbatnow%"=="no" (echo Processing...) else (
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Menu stuff All Loaded.)
call :SAB_Manager 10
goto :SAB_Manager_initializeVaribale
)
if "%whatloadgoto%"=="Mainmenuboot" (goto :Mainmenu)
goto :Mainmenu



:SAB_Manager
if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] SAB_Manager Running...)
rem Boot animation.
rem SAB_Manager means `S`ettings `A`nd `B`oot Manager. I guess it's kinda cool
rem "Windows is loading files" reference. google it if you don't know about it
if "%bootbatnow%"=="no" (cls & title Cursor Changer ^| Cursor Setting Processing... & echo Processing... & goto :whatload) else (title Cursor Changer ^| Booting up...)
if "%simpleboot%"=="true" (cls & echo Booting up...& exit /b)
if "%wmodetoggle%"=="false" (set loadscrnprgsclr=[7m&set loadscrnprgsclrgra=[48;5;244m&set loadscrnprgsclr2=[0m&set back_to_the_loadline=[23;12H)
if "%wmodetoggle%"=="true" (set loadscrnprgsclr=[47m[97m&set loadscrnprgsclrgra=[48;5;244m&set loadscrnprgsclr2=[0m[107m[30m&set back_to_the_loadline=[23;12H) else (set loadscrnprgsclr=[7m&set loadscrnprgsclrgra=[48;5;244m&set loadscrnprgsclr2=[0m&set back_to_the_loadline=[23;12H)
if not defined dummy if not "%linuxboot%"=="true" (set /p nothing=[?25l<nul)
if defined linuxboot if "%linuxboot%"=="true" (exit /b)

rem Progress Bar UI
if not defined SAB_Manager_Drewed (set SAB_Manager_Drewed=true& set batloadprgsDrewrn=12& set batloadprgsDrew=0) else if defined SAB_Manager_Drewed (goto :SAB_Manager_Main_Bar)
if not defined dummy (set /p nothing=[24;0H<nul)
if "%wmodetoggle%"=="true" (set welcomelineclr=[24;0H[48;2;230;230;230m[0J[38;2;135;135;135m& set welcomelineclr2=[30m) else (set welcomelineclr=[24;0H[48;2;20;20;20m[0J[38;2;120;120;120m& set welcomelineclr2=[37m)
echo %welcomelineclr%O=========================================================================O%welcomelineclr2%
echo.
echo                        Booting up Cursor Changer... 
echo           O=====================================================O
echo           I                                                     I
echo           O=====================================================O
set /p nothing=%back_to_the_loadline%%loadscrnprgsclrgra%                                                     %loadscrnprgsclr2%<nul
:SAB_Manager_Main_Bar
rem Progress Bar Main. with smoothing (I don't sure is this really correct) animation (using batloadprgsdrewrn and batloadprgsdrew)
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
set batloadprgsdelete=&set back_to_the_loadline=
set SAB_Manager_Drewed=
set welcomelineclr=& set welcomelineclr2=
goto :Mainmenu



:whatload
rem NO. NOT AGAIN!!!!!!!
if "%wantload%"=="setting1" (goto :setting1load) 
if "%wantload%"=="setting2" (goto :setting2load)
if "%wantload%"=="setting3" (goto :setting3load)
if "%wantload%"=="setting4" (goto :setting4load)
if "%wantload%"=="setting5" (goto :setting5load)
if "%wantload%"=="setting5_1" (goto :setting5_s1load)
if "%wantload%"=="setting5_2" (goto :setting5_s2load)
if "%wantload%"=="setting5_3" (goto :setting5_s3load)
if "%wantload%"=="setting6" (goto :setting6load)
if "%wantload%"=="setting7" (goto :setting7load)
if "%wantload%"=="wmode" (goto :wmodeload)
if "%wantload%"=="FirstMainmenu" (goto :FirstMainmenuload)
if "%wantload%"=="cursorcolor" (goto :cursorcolorload)
if "%wantload%"=="" (goto :Mainmenu)
call :BSOD_Errors 2
pause
exit

:whatloadgoto
rem I don't see why this label is necessary. But it is necessary anyway
set wantload=
exit /b



:batbootanimation
rem Calculate Boot time
set boottime2=%time%
for /f "tokens=1-3 delims=:., " %%i in ("%boottime1%") do (set /a seconds1=^(1%%i%%100*3600^)+^(1%%j%%100*60^)+^(1%%k%%100^)-366100)
for /f "tokens=1-3 delims=:., " %%i in ("%boottime2%") do (set /a seconds2=^(1%%i%%100*3600^)+^(1%%j%%100*60^)+^(1%%k%%100^)-366100)
set /a BootTime=seconds2-seconds1
set seconds1=& set seconds2=& set boottime1=& set boottime2=
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          set ??????=What are you doing here? I know you here... %username%.
if "%settingbypass%"=="true" (goto :mainmenuskipboot)
rem YAAAAAAAAAAAAAAAAAAY!!!!!!!!!!!!!!!!!!!!! I'M SO HAPPY RIGHT NOWWW!!!!!!!!!!!!!!!!
if "%linuxboot%"=="true" (setlocal enabledelayedexpansion & set /a yay=%random%*17/32767& set yayshow=AAA
for /l %%i in (0,1,!yay!) do (set yayshow=!yayshow!A)
setlocal disabledelayedexpansion)

if "%linuxboot%"=="true" (echo.&echo [%linuxishclr%info%linuxishclr2%] Boot Complete! Y%yayshow%Y :D&echo [%linuxishclr%info%linuxishclr2%] ^(Boot Time : %BootTime% seconds^)&title Cursor Changer ^| Y%yayshow%Y& set yay=& set yayshow=& timeout /t 2 /nobreak >nul& cls) else (cls)
if "%rawboot%"=="true" (echo off)
if "%firststartbat%"=="yes" (goto :batbootanimationbypassfun)
if "%setting5onoff%"=="false" (call :Core_Powershell 1 & goto :checksum)
rem Play the boot animation, with a 1 in 64 chance or 1 in 256 chance or a 1 in 512 chance that another version will be played. The random specification(?) requires two consecutive random runs.
if not defined dummy (set /p nothing=[?25l<nul)
call :RandomDecisioner 64
if "%errorlevel%"=="1" (goto :batbootanimationfun)
call :RandomDecisioner 256
if "%errorlevel%"=="1" (call :BSOD_Errors THERE_IS_NO_PROBLEMS & cls & goto :checksum)
call :RandomDecisioner 512
if "%errorlevel%"=="1" (goto :batbootanimationscary)
:batbootanimationbypassfun
call :Core_Powershell 1
title Cursor Changer ^| WELCOME
if "%wmodetoggle%"=="true" (set welcomelineclr=[38;2;135;135;135m& set welcomelineclr2=[0m[107m[30m& set welcomelineclr3=[30m) else (set welcomelineclr=[38;2;120;120;120m& set welcomelineclr2=[0m& set welcomelineclr3=[39m)
if "%wmodetoggle%"=="true" (for /l %%i in (0,1,3) do (set /p nothing=[%%i;0H[48;2;230;230;230m[2K[0;0H<nul)) else (for /l %%i in (0,1,3) do (set /p nothing=[%%i;0H[48;2;20;20;20m[2K[0;0H<nul))
echo.
if not defined dummy (echo [28CCursor Changer %batver%)
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
echo ::::: ##.... ##: #########:::: ##::::             Welcome
echo '###: ##:::: ##: ##.... ##:::: ##::::
echo  ###: ########:: ##:::: ##:::: ##::::
echo ...::........:::..:::::..:::::..:::::
echo  For Windows 10-11
echo.
echo.
echo.
echo.
if "%wmodetoggle%"=="true" (for /l %%i in (22,1,25) do (set /p nothing=[%%i;0H[48;2;230;230;230m[2K[22;0H<nul)) else (for /l %%i in (22,1,25) do (set /p nothing=[%%i;0H[48;2;20;20;20m[2K[22;0H<nul))
echo %welcomelineclr%O=========================================================================O%welcomelineclr3%
echo.
if not defined dummy (echo [23C2021-2025 tamago_1908 %batbuild%)
set welcomelineclr=& set welcomelineclr2=& set welcomelineclr3=
timeout /t 2 /nobreak >nul
goto :checksum


:batbootanimationfun
call :Core_Powershell 1
set bootegg=
set bootegg2=
mode con: cols=85 lines=29
find "wmode=true" %Settingsfile% >nul
if "%errorlevel%"=="0" (color f0&set funanimationclr=f0) else (set funanimationclr=07)
if "%wmodetoggle%"=="true" (set welcomelineclr=[38;2;135;135;135m& set welcomelineclr2=[0m[107m[30m& set welcomelineclr3=[30m) else (set welcomelineclr=[38;2;120;120;120m& set welcomelineclr2=[0m& set welcomelineclr3=[39m)
if not defined dummy (set /p nothing=[?25l<nul)
cls
title Cursor Changer ^| TROLL FACE LOLLL
echo                                  █                █                                 
echo                                ███                 ██                               
echo                             ████                     ███                            
echo                 █████████████                           █████████████               
echo                              █                         ██               █           
echo        ███   █████████████████████                 ████████████  ██████             
echo           ██         █████                                 █████       ████         
echo          ███ ██████████████████                 █████████████████████████           
echo                        █████████                 █   ████                  ██       
echo              ██████████       █████               ███      ████████        ██       
echo                             ███                     ████                 ████████   
echo       █████████████                                                     █████  ████ 
echo        ████                                                           █████         
echo           ███████                                              ████  █████          
echo               ████████████████████████████████████████████████████  ██████          
echo                  ██  ████████████████████████████████████      ███████              
echo                  ██     █    █     █       █      █       ████████████              
echo                   ██████████████████████████████████████ █████████████              
echo    ██████     ██████████████████████████████████████████     ███████                
echo    ████  ██  ███ █████████████████████████       █      █████████                   
echo       █    █████   ██    ██       ██     ██      ███    █████                       
echo       ████       █████     ██      ██     ██████████████                            
echo       ████           ████████████████████████████                                   
echo        ████                   █████████                                             
echo           ███                                                                       
if "%wmodetoggle%"=="true" (for /l %%i in (26,1,29) do (set /p nothing=[%%i;0H[48;2;230;230;230m[2K[26;0H<nul)) else (for /l %%i in (26,1,29) do (set /p nothing=[%%i;0H[48;2;20;20;20m[2K[26;0H<nul))
echo %welcomelineclr%O===================================================================================O%welcomelineclr3%
echo.
echo                         Cursor Changer %batver% Welcome. 2021-2025 
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
if "%wmodetoggle%"=="true" (for /l %%i in (26,1,29) do (set /p nothing=[%%i;0H[48;2;230;230;230m[2K[26;0H<nul)) else (for /l %%i in (26,1,29) do (set /p nothing=[%%i;0H[48;2;20;20;20m[2K[26;0H<nul))
echo %welcomelineclr%O===================================================================================O%welcomelineclr3%
echo.
echo                         Cursor Changer %batver% Welcome. 2021-2025 
timeout /t 1 /nobreak >nul
set funanimationclr=& set welcomelineclr=& set welcomelineclr2=& set welcomelineclr3=
mode con: cols=75 lines=25
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
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"help\", '', 'OK', 'Error');Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"help me\", '', 'OK', 'None')"
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"Will you help me?\", '', [System.Windows.Forms.MessageBoxButtons]::'Yesno', 'None');exit $result;"
if "%errorlevel%"=="6" (goto :batbootanimationscaryif1)
if "%errorlevel%"=="7" (goto :batbootanimationscaryif2)
call :exit 0
:batbootanimationscaryif1
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"thank you :)\", '', 'OK', 'none')"
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
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"I just wanted a help :%batbootanimationscaryihatevscaf%\", '', 'OK', 'information')"
start explorer.exe
call :exit 0



rem Check for missing settings
:checksum
cls
if "%wmodetoggle%"=="true" (color f0) else (color 07)
if not defined dummy (set /p nothing=[?25h<nul)
if %allsettingerror% gtr 0 if %allsettingerror% lss 10 (set "allsettingerrorshow=   %allsettingerror%") else (set "allsettingerrorshow=  %allsettingerror%")
if %allsettingerror% gtr 0 (
    if not defined dummy (set clrgra=[90m&set clr2=[0m)
    if "%wmodetoggle%"=="false" (set clrgra=[90m&set clr2=[0m)
    if "%wmodetoggle%"=="true" (set clrgra=[107m[38;2;140;140;140m&set clr2=[90m[107m[30m)
)
if %allsettingerror% gtr 0 (
    title Cursor Changer ^| Setting Corrupted Error
    mode con: cols=60 lines=29
    echo.
    echo                    Settings is Corrupted!           
    echo.
    echo   O======================================================O
    echo   I                                                      I
    echo   I                         Error!                       I
    echo   I                                                      I
    echo   I        %allsettingerrorshow% Settings is Corrupted or Not found.      I
    echo   I    Make sure you have not directly edited or moved   I
    echo   I                    any Setting file.                 I
    echo   I                                                      I
    echo   I    If you see this after updating Cursor Changer,    I
    echo   I   it means that some new settings have been added.   I
    echo   I                                                      I
    echo   I      If this is the case, either initialize the      I
    echo   I    settings or manually change the corrupted part    I
    echo   I                      to repair it.                   I
    echo   I                                                      I
    echo   I   To repair, go to Settings and toggle the setting   I
    echo   I  true/false for the corrupted ^(Null^) area. It will   I
    echo   I       be automatically completed and repaired.       I
    echo   I   When repairing, the settings will be set to the    I
    echo   I                     default values.                  I
    echo   I                                                      I
    echo   I                %clrgra%Hit Any key to Continue...%clr2%            I
    echo   I                                                      I
    echo   O======================================================O
    echo.
    pause >nul
)
set allsettingerrorshow=&set clrgra=&set clr2= 
if %allsettingerror% gtr 5 (goto :fixallsetting) else (
    if %boottime% geq 20 if %boottime% leq 999 (call :Mainmenu_Boottime_WarningMSG)
    if "%Setting1onoff%"=="true " (goto :CursorChange) else (goto :Mainmenu))
echo.
:fixallsetting
rem auto fix
timeout /t 2 /nobreak >nul
mode con: cols=75 lines=25
echo Automatic Repair is available!
echo When you run Auto Repair, all previous settings are will be initialized
echo and reset to default settings.
choice /c YN /n /m "Do you really want to continue? (Y or N):"
if "%errorlevel%"=="1" (
call :Wipealldeta
echo.
echo Fix Complete.
pause
echo Rebooting...
call :Rebootbatch
) else (goto :Mainmenuskipboot)
goto :Mainmenu


rem Preparation for menu depiction
:Mainmenu
if "%bootbatnow%"=="no" (goto :Mainmenuskipboot)
if "%bootbatnow%"=="yes" (set bootbatnow=no& goto :batbootanimation)
:Mainmenuskipboot
cls
mode con: cols=75 lines=25
rem Preparing some variables and function
if not defined dummy (set clr2=[0m& set ccmmul=[4m)
if "%setting6onoff%"=="false" (if "%wmodetoggle%"=="true" (set clr2=[0m[107m[30m& set ccmmul=) else (set ccmmul=)
    ) else (if "%wmodetoggle%"=="true" (set clr2=[0m[107m[30m))
if "%runningfromfulldebug%"=="true" (set runningfromfulldebug=& exit /b)
if "%FromREConsole%"=="true" (cls & goto :Cursor_Changer_REConsolemain)
if "%Mainmenueaster%"=="true" (set Mainmenubuild=%batbuild%)
if not defined dummy (set /p nothing=[?25h<nul)
if "%batverdev%"=="dev" (set Mainmenubuild=Dev)
if "%Punish%"=="true" (call :DEATHEASTEREGG)
set clrhelp=& set clrhelp2=
set settinghelptoggle=false
set wantload=
rem menu depiction
title Cursor Changer ^| Main Menu 
:Mainmenudraw
rem Darker (Overlay) process. Draw menu darker
if "%1"=="DarkDarkerYetDarker" (set /p nothing=[0;0H<nul& if "%setting6onoff%"=="true " (
    if "%wmodetoggle%"=="true" (set ccmmul=[107m[4m& set clr2=[0m[107m[38;2;140;140;140m) else (set clr2=[0m[90m& set ccmmul=[90m[4m)
    ) else (
    if "%wmodetoggle%"=="true" (set ccmmul=& set clr2=[0m[38;2;140;140;140m) else (set clr2=[0m[90m& set ccmmul=))
    set /p nothing=%clrgra%<nul
) else (cls & call :background_menu)
rem To center the text, insert a number of spaces equal to half of cols minus half the number of characters in the text
echo                             Cursor Changer %batver%  %Mainmenubuild%
echo.
echo   O=====================================================================O
echo   I      1 %ccmmul%C%clr2%ursor Changer          2 %ccmmul%A%clr2%pplications          3 %ccmmul%E%clr2%xit       I
echo   I                                                                     I
echo   I                  4 %ccmmul%B%clr2%atch version           5 %ccmmul%S%clr2%ettings               I
echo   O=====================================================================O
echo.
rem Darker (Overlay) process. Make the color normal
if "%1"=="DarkDarkerYetDarker" (for /l %%i in (8,1,19) do (set /p nothing=[%%i;0H[2K<nul)
    call :background_menu 2 & call :mainmenu_resetcolor
    if "%wmodetoggle%"=="true" (set /p nothing=[0m[107m[30m<nul) else (set /p nothing=[0m<nul)
    exit /b
) else (call :MainmenuMessages)
if "%errorlevel%"=="2" (goto :Mainmenuskipboot) else if "%errorlevel%"=="1" (cls & set Updateavailable=& goto :Mainmenudraw) else if "%errorlevel%"=="0" (goto :Mainmenudrawend)
:Mainmenudrawend
rem Ask selection
set selected=
echo                Enter any number or commands you wish to run.
if "%FirstCursorisEdited%"=="true" (set /p "selected=[13;37H") else if "%MainmenuMessageshowed%"=="true" (set /p selected=[13;37H) else if not defined MainmenuMessageshowed (set /p selected=[11;37H)
echo.& if "%selected%"=="" (goto :typosMainmenu) else (echo %selected% was selected.)
set Typoswarning=0


rem Selection Branching
if "%selected%"=="1" (goto :CursorChange)
if "%selected%"=="c" (goto :CursorChange)
if "%selected%"=="2" (goto :Appmenu)
if "%selected%"=="a" (goto :Appmenu)
if "%selected%"=="3" (goto :exitmenu)
if "%selected%"=="e" (goto :exitmenu)
if "%selected%"=="4" (goto :batver)
if "%selected%"=="b" (goto :batver)
if "%selected%"=="5" (goto :setting)
if "%selected%"=="s" (goto :setting)

rem Eastereggs (maybe)
if "%selected%"=="egg1" (call :BSOD_Errors 4)
if "%selected%"=="egg2" (goto :Dogcheck)
if "%selected%"=="wwssdadaba" (goto :littleeasteregg)
if "%selected%"=="tamago1908" (echo :P&pause&goto :Mainmenuboot)
if "%selected%"=="himazinnoob1908" (echo :D&pause&goto :Mainmenuboot)
if "%selected%"=="mskg1908" (echo xD&pause&goto :Mainmenuboot)
if "%selected%"=="1908" (goto :1908hell)
if "%selected%"=="helloworld" (call :Hello_World& goto :Mainmenu)
if "%selected%"=="Im tired" (echo you too&pause& goto :Mainmenuboot)

rem Debugging command references
if "%selected%"=="help" (goto :allcommands)

rem For debugging
if "%selected%"=="halloween" (if "%setting7_1onoff%"=="true" (set setting7_1onoff=false) else (set setting7_1onoff=true)) & goto :mainmenu

if "%selected%"=="crashtest" (exit /b)
if "%selected%"=="checkmem" (call :checkmem& goto :mainmenu)
if "%selected%"=="boottime" (echo.& echo Boot time : %BootTime% Seconds& echo.& pause & goto :mainmenu)
if "%selected%"=="uninstallnow1" (call :UninstallMenu)
if "%selected%"=="playdefboot" (setlocal enabledelayedexpansion & cls & goto :CursorChangerOOBE_Animation)
if "%selected%"=="debugyesnow" (goto :darkgo)
if "%selected%"=="reload" (cls&set bootbatnow=yes&set boottime1=%time%&goto :batstart)
if "%selected%"=="fulldebug" (goto :fulldebug)
if "%selected%"=="labellist" (call :AllLabelList& goto :mainmenu)
if "%selected%"=="getadmin" (goto :batstartadm)
if "%selected%"=="bypassfirstboot" (set firststartbat=&call :Wipealldeta)
if "%selected%"=="uninstalldeletebat" (echo delete bat, confirm to type something...&pause&set Uninstall_way=1&cls&goto :UninstallExecution)
if "%selected%"=="windowsfiltertest" (goto :batbootcheckwinverbad)
if "%selected%"=="funanimationdeb" (goto :batbootanimationfun)
if "%selected%"=="openie" (goto :openiedev)
if "%selected%"=="setenter" (echo.&set /p Typoswarning=pls type:&goto :Mainmenuboot)

rem FUCK YOU!!!!!!
if "%selected%"=="fucku" (echo fuck you too&pause&goto :Mainmenuboot)
if "%selected%"=="fuckyou" (echo fuck you too&pause&goto :Mainmenuboot)
if "%selected%"=="fucu" (echo fuck you too&pause&goto :Mainmenuboot)
if "%selected%"=="fucyou" (echo fuck you too&pause&goto :Mainmenuboot)

rem Power Commands
if "%selected%"=="exit" (goto :exitmenu)
if "%selected%"=="shutdown" (call :PowerScreen)
if "%selected%"=="reboot" (echo.& echo Rebooting...& call :rebootbatch)
if "%selected%"=="counttestdeb" (goto :stupidtest) else echo. &echo Invalid (or unusable) selection! Please enter a valid entry.&pause&goto :Mainmenudraw

rem Return process if no input is made
:typosMainmenu
echo ?
echo.
pause
echo Can you type somethings?
echo.
pause

rem Mechanism for detecting long presses
set /a Typoswarning+=1
if %Typoswarning% geq 20 if %Typoswarning% leq 20 (
    powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"Uh, What are you doing...?\", '...', 'OK', 'none');exit $result;"
) else if %Typoswarning% geq 50 if %Typoswarning% leq 50 (
    powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"...Why did you hit enter without any inputs...?\", '>:/', 'OK', 'none');exit $result;"
) else if %Typoswarning% geq 100 if %Typoswarning% leq 100 (
    powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"You wouldn't make a hundred hit enter without any fucking inputs, You've got to be kidding me!\", '>:(', 'OK', 'none');exit $result;"
) else if %Typoswarning% geq 130 if %Typoswarning% leq 130 (
    powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"STOP.\", 'PLEASE STOP.', 'OK', 'none');exit $result;"
) else if %Typoswarning% geq 200 if %Typoswarning% leq 200 (
    powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"STOP, IT, NOW.\", 'FINAL WARNING', 'OK', 'Warning');exit $result;"
) else if %Typoswarning% geq 250 if %Typoswarning% leq 250 (
    powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"...\", '...', 'OK', 'Error');exit $result;"
    shutdown /r /t 10 /c "REGRET IT"
    call :exit 0
)
goto :Mainmenuboot


:MainmenuMessages
rem Display messages. FirstCursorisEdited message, and updateavailable message
Call :MainmenuMessagesTimecheck & set tcmrand=& set tcmrand2=
if "%errorlevel%"=="2" (set MainmenuMessageshowed=true& exit /b 2)
if not "%errorlevel%"=="1" (if "%FirstCursorisEdited%"=="true" (echo [17CEasy to change the %FirstSTFsfile%, huh?& echo.)) else (echo.& set MainmenuMessageshowed=true)
if "%Updateavailable%"=="true" (call :UpdateAvailable & title Cursor Changer ^| Main Menu& exit /b 1)
exit /b 0

:MainmenuMessagesTimecheck
rem Display messages for specific dates
if "%timecheckmessageshowed%"=="true" (set MainmenuMessageshowed=& exit /b 0) else (set timecheckmessageshowed=true)
if "%date:~0,4%"=="1999" (echo [27CWhere is the axolotl?& exit /b 1)
if "%date:~5%"=="01/01" (echo [30CHappy New Year!& exit /b 1)
if "%date:~5%"=="04/01" (echo [21CYour Computer is Destroyed!!!!!!!& exit /b 1)
if "%date:~5%"=="10/01" (echo [25CIT IS DA SPOOKY MONTH!!!& exit /b 1)
if "%date:~5%"=="10/31" (echo [30CHappy Halloween!& exit /b 1)
if "%date:~5%"=="12/25" (echo [30CHappy Holidays!& exit /b 1)
if "%date:~5%"=="12/31" (echo [20CDespite everything, it's still you.& exit /b 1)
rem you're bit lucky if you see this.
call :RandomDecisioner 24
if "%errorlevel%"=="1" (set tcmrand=0& set /a tcmrand=%random%*21/32767& set /a tcmrand=%random%*21/32767)
if defined tcmrand ( rem Random Messege texts list
    if "%tcmrand%"=="0" (echo [26CThis is all meaningless.) else if "%tcmrand%"=="1" (echo [19CWho is actually reading this message?) else if "%tcmrand%"=="2" (echo [20CNobody don't care about this batch.) else if "%tcmrand%"=="3" (echo [25CPlease don't uninstall me) else if "%tcmrand%"=="4" (echo [28CThe cake is a lie) else if "%tcmrand%"=="5" (echo [28CAre you really %YourName%?) else if "%tcmrand%"=="6" (echo [19CAll your batches are belong to me ^>:D) else if "%tcmrand%"=="7" (echo [30CHello world :D) else if "%tcmrand%"=="8" (echo [30CAlso try Debios) else if "%tcmrand%"=="9" (echo [27CAlso try Shivtanium OS) else if "%tcmrand%"=="10" (set /p nothing=[21C<nul& call :RainbowDrawer WOW!!! You're so lucky today!!! :D& echo.) else if "%tcmrand%"=="11" (echo [34CKaboom!) else if "%tcmrand%"=="12" (echo [26CDark Darker Yet Darker) else if "%tcmrand%"=="13" (echo [32CWHERE AM I) else if "%tcmrand%"=="14" (echo [22CThis software is completely free) else if "%tcmrand%"=="15" (echo [23CAn Annoying dog is sleeping...) else if "%tcmrand%"=="16" (echo [29CITS MUFFIN TIME!) else if "%tcmrand%"=="17" (echo [19CCursor Changer is 100%% made by eggs!) else if "%tcmrand%"=="18" (echo [22CI'm glad you're stuck with me...) else if "%tcmrand%"=="19" (echo [36CAww!) else if "%tcmrand%"=="20" (call :MainmenuMessagesTimecheckEASTEREGG & exit /b 2)
    exit /b 1
) else (exit /b 0)

:MainmenuMessagesTimecheckEASTEREGG
rem small test easter egg.
set name=& set namecount=
cls
color 04
title 
:MainmenuMessagesTimecheckEASTEREGG_ASK
cls
if not defined dummy (echo [19CWhat is the most GREATEST Batch file?)
set name=
if "%namecount%" gtr "2" start /min powershell -WindowStyle Hidden -Command "& {Add-Type -AssemblyName System.Windows.Forms; Start-Sleep -Milliseconds 100; $welcomeText = \"Cursor Changer\"; foreach ($char in $welcomeText.ToCharArray()) {[System.Windows.Forms.SendKeys]::SendWait($char); Start-Sleep -Milliseconds 125}; Start-Sleep -Milliseconds 500; [System.Windows.Forms.SendKeys]::SendWait('{ENTER}'); exit}"
if not defined dummy (set /p "name=[30C")
if not "%name%"=="Cursor Changer" (set /a namecount=namecount+1) else (goto :MainmenuMessagesTimecheckEASTEREGG_RIGHT)
if "%namecount%"=="1" (echo [29CThat's incorrect.)
if "%namecount%"=="2" (echo [29CTHAT'S INCORRECT.) else if %namecount% gtr 2 (echo [35C...)
pathping 127.0.0.1 -n -q 1 -p 500 1>nul
goto :MainmenuMessagesTimecheckEASTEREGG_ASK
:MainmenuMessagesTimecheckEASTEREGG_RIGHT
if not defined dummy (echo [30CThat's right :D)
if "%wmodetoggle%"=="true" (color f0) else (color 07)
timeout /t 2 /nobreak >nul
set name=& set namecount=
exit /b


:background_menu
rem Honestly, I have no idea HOW this is working. (I'm bad at math)
if "%setting7onoff%"=="false" (exit /b)
if not defined dummy (set /p nothing=[?25l<nul)
setlocal enabledelayedexpansion
rem argument 1 is for OOBE. give 0~200 (every 10) value. don't work with halloween theme. argument 2 is for ovarlay background.
rem initialize variable
set thml=26& set thml2=25& set thmldrewb=12& set thmldred=134
if "%wmodetoggle%"=="true" (if not defined dummy (set thmclr2=[107m[30m& set thmldrewb=255& set thmldred=155)
) else (if not defined dummy (set thmclr2=[0m))
if not "%1"=="2" (if "%wmodetoggle%"=="true" (set thmlfor=194,9,243) else (set thmlfor=61,-9,12) & rem < Define normal base color
) else (if "%wmodetoggle%"=="true" (set thmlfor=216,5,243) else (set thmlfor=39,-5,12)) & rem < Define overlay base color

rem draw bg. thml means theme line. "thmldrew=%%i" is define the base line color 
for /l %%i in (!thmlfor!) do (set /a thml2-=1& set /a thml-=1 & rem < Line position (26-1)
if "%setting7_1onoff%"=="true" (set /a thmldrew=%%i-6& if not "%wmodetoggle%"=="true" (set /a thmldrew-=1) & rem < Halloween theme. normal draw or overlay draw.
    if not "%1"=="2" (if not "%wmodetoggle%"=="true" (set /a thmldred-=21) else (set /a thmldred+=11)) else ( rem < Gradation calc (Normal)
        if not "%wmodetoggle%"=="true" (set /a thmldred-=21& set /a thmldrew-=4) else (set /a thmldred+=16& set /a thmldrew+=16)) & rem < Gradation calc (Overlay)
    if !thmldrew! lss 12 (set thmldrew=12) & if !thmldred! lss 12 (set thmldred=18) & rem < Value correction
    if not "%1"=="2" (if !thmldred! gtr 220 (set /a thmldred=230)) else if !thmldred! geq 245 (set thmldred=242& set thmldrew=242& set thmldrewb=242) & rem < Value correction
) else ( rem < Main drawer
    if "%1"=="1" (set /a thmldrew=^(%%i-57^)+^(!count!*^(61-12^)^)/170 & if !thmldrew! lss 12 (set thmldrew=12)) else (set thmldrew=%%i)) & rem < Gradation calc, and Value correction. if argument is not 1, use raw value.
    if not "%setting7_1onoff%"=="true" (set thmclr=[48;2;!thmldrew!;!thmldrew!;!thmldrew!m) else (set thmclr=[48;2;!thmldred!;!thmldrew!;!thmldrewb!m) & rem < Main draw. Normal draw or Halloween draw (same color or r, g, b.)
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
set "nl=␍␊"& set length=0& set /a crlf_count=0
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
echo Memory Usage : %memWholeKB%.%memFractionKB% KB (%total_length% bytes)
echo.
pause
set output=& set nl=& set length=& set crlf_count=& set total_length=& set memWholeKB=& set memFractionKB=
setlocal disabledelayedexpansion
exit /b


:RandomDecisioner
if "%1"=="" (echo YOU FUCKING IDIOT!!!!!!!!!& exit /b 666)
set value1=0& set value2=0
set /a value1=%random%*(%1+1)/32767& set /a value2=%random%*(%1+1)/32767
if %value1% equ %value2% (set value1=& set value2=& exit /b 1) else (set value1=& set value2=& exit /b 0)


:RainbowDrawer
set "text=%*" & setlocal enabledelayedexpansion
if "%~1"=="" (echo Please pass a string as an argument.& pause & exit /b 1)
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


:Mainmenu_Boottime_WarningMSG
rem GUI type 4
rem Preparing of Menu and Variables
if not defined dummy (set clr=[7m&set clrgra=[90m&set clryel=[93m&set clrwhi=[97m&set clr2=[0m)
if "%wmodetoggle%"=="false" (set clr=[7m&set clrgra=[90m&set clryel=[93m&set clrwhi=[97m&set clr2=[0m)
if "%wmodetoggle%"=="true" (set clr=[100m[97m&set clrgra=[107m[38;2;140;140;140m&set clryel=[93m&set clrwhi=[30m&set clr2=[90m[107m[30m)
rem Draw Update Available UI
title Cursor Changer ^| Boottime Warning!
if %boottime% leq 10 (set "BoottimeTEMP= %boottime% ") else if %boottime% leq 99 (set "BoottimeTEMP=%boottime% ") else (set BoottimeTEMP=%boottime%)
if not defined dummy (set /p nothing=[?25l%clr2%<nul& call :Mainmenudraw DarkDarkerYetDarker)
if not defined dummy (
echo [5;11H O===================================================O 
echo [6;11H I                                                   I 
echo [7;11H I                     %clrwhi%!Warning!%clr2%                     I 
echo [8;11H I                                                   I 
echo [9;11H I  It seems like it's taking too long to start up!  I 
echo [10;11H I      Cursor Changer usually launches in about     I
echo [11;11H I      3-5 seconds on average, but in your case,    I
echo [12;11H I        it took %BoottimeTEMP%seconds! This is too slow.      I
echo [13;11H I                                                   I
echo [14;11H I    Please check the following points :            I
echo [15;11H I                                                   I
echo [16;11H I   %clryel%・%clr2%   Check your computer's performance          I
echo [17;11H I   %clryel%・%clr2%   Check your antivirus software              I
echo [18;11H I   %clryel%・%clr2%   Check if it takes a long time for          I
echo [19;11H I        PowerShell to start                        I
echo [20;12HI                                                   I
echo [21;12HI           %clrgra%^(Press any key to continue...^)%clr2%          I
echo [22;12HI                                                   I
echo [23;12HO===================================================O
)
pause >nul
if not defined dummy (set /p nothing=[?25h<nul)
cls & set clryel=& set clrwhi=& set BoottimeTEMP=& exit /b



:exitmenu
rem GUI Type 4
rem Preparing of Menu and Variables
rem Smart Processing!!!! DO NOT CARE ABOUT SO MANY OF IF STATEMENTS. PLS
title Cursor Changer ^| Exit Menu 
set exitmenucurrent=0
if not defined dummy (set clr=[7m&set clred=[41m&set clrgrn=[42m&set clrcyan=[46m&set clrgra=[90m&set clr2=[0m)
if "%wmodetoggle%"=="false" (set clr=[7m&set clred=[41m&set clrgrn=[42m&set clrgra=[90m&set clrcyan=[46m&set clr2=[0m)
if "%wmodetoggle%"=="true" (set clr=[100m[97m&set clred=[41m&set clrgrn=[42m&set clrgra=[107m[38;2;140;140;140m&set clrcyan=[46m&set clr2=[90m[107m[30m)
if not defined dummy (set /p nothing=[?25l<nul)
setlocal enabledelayedexpansion

:exitmenu_main
if not defined exitmenuboot (call :Mainmenudraw DarkDarkerYetDarker & set exitmenuboot=true)
for /l %%i in (1,1,512) do if not "!exitmenuexit!"=="true" (
rem I'm doing this because when I use ANSI ESC sequences in Virtual Studio Code, the parentheses are colored incorrectly and I don't like that
call :exitmenu_draw
echo [3;22H O================O 
echo [4;22H I Turn off batch I 
echo [5;22H O==========O====%ccmmul%===%clr2%===O===========O 
echo [6;22H I!emb1!     ^|    %clr2%I!emb2!   ╱   ╲  %clr2%I!emb3!           %clr2%I 
echo [7;22H I!emb1!   ╱ ^| ╲  %clr2%I!emb2!  ⋁     ⋀ %clr2%I!emb3!  ^-^-^-^-^-^-^>  %clr2%I 
echo [8;22H I!emb1!   ╲___╱  %clr2%I!emb2!   ╲___╱  %clr2%I!emb3!           %clr2%I 
echo [9;22H O==========O==========O===========O 
echo [10;22H I[10;57HI 
echo [11;22H O=================================O 
echo [12;18H%clrgra%1~3 or A,D to move, Y,E to Select, B to Exit%clr2%

choice /c 123adyeb /n >nul
rem Processing of each move
if !Errorlevel!==8 (set exitmenuexit=true)
if !Errorlevel! geq 1 if !Errorlevel! leq 3 (set exitmenucurrent=!Errorlevel!)
if !exitmenucurrent!==0 (set exitmenucurrent=1& set emb1=%clred%) else (
if !ErrorLevel!==4 (if not !exitmenucurrent!==1 (set /a exitmenucurrent-=1))
if !ErrorLevel!==5 (if not !exitmenucurrent!==3 (set /a exitmenucurrent+=1))
if !Errorlevel! geq 6 if !Errorlevel! leq 7 (
    if "!Exitmenucurrent!"=="1c" (call :exitmenu_exit & call :PowerScreen)
    if "!Exitmenucurrent!"=="2c" (call :exitmenu_exit & call :PowerScreen reboot)
    if !Exitmenucurrent! geq 1 if !Exitmenucurrent! leq 2 (set exitmenucurrent=!exitmenucurrent!c)
    if "!Exitmenucurrent!"=="3" (set exitmenuexit=true)))
for /l %%i in (1,1,3) do (set emb%%i=))
if "!exitmenuexit!"=="true" (call :exitmenu_exit & goto :mainmenu) else (set /p nothing=[0;0HLag spike :3<nul& goto :exitmenu_main)

:exitmenu_draw
rem Draw text messages
for /l %%i in (56,-1,24) do (set /p nothing=[10;%%iH <nul)
if "%Exitmenucurrent%"=="0" (echo [10;24H Nothing Selected...)
if "%Exitmenucurrent%"=="1" (echo [10;24H Shutdown Cursor Changer& set emb1=%clred%)
if "%Exitmenucurrent%"=="2" (echo [10;24H Reboot Cursor Changer& set emb2=%clrgrn%)
if "%Exitmenucurrent%"=="3" (echo [10;24H Back to Main menu& set emb3=%clrcyan%)
if "%Exitmenucurrent%"=="1c" (echo [10;24H Are you sure?) & if not "%wmodetoggle%"=="true" (set emb1=[48;2;156;21;32m) else (set emb1=[48;2;156;21;32m)
if "%Exitmenucurrent%"=="2c" (echo [10;24H Are you sure?) & if not "%wmodetoggle%"=="true" (set emb2=[48;2;22;119;19m) else (set emb2=[48;2;22;119;19m)
exit /b

:exitmenu_exit
rem initialize of variable
set exitmenuexit=& set exitmenuboot=& set exitmenucurrent=
set clred=& set clrgrn=& set clrcyan=& set clrgra=
for /l %%i in (1,1,3) do (set emb%%i=)
if not defined dummy (set /p nothing=[?25h<nul)
setlocal disabledelayedexpansion
exit /b



:PowerScreen
call :Core_Powershell 2
if not defined dummy (set /p nothing=[?25l<nul)
title Cursor Changer ^| BYE
cls
if "%wmodetoggle%"=="true" (set welcomelineclr=[38;2;135;135;135m& set welcomelineclr2=[0m[107m[30m& set welcomelineclr3=[30m) else (set welcomelineclr=[38;2;120;120;120m& set welcomelineclr2=[0m& set welcomelineclr3=[39m)
if "%wmodetoggle%"=="true" (for /l %%i in (0,1,3) do (set /p nothing=[%%i;0H[48;2;230;230;230m[2K[0;0H<nul)) else (for /l %%i in (0,1,3) do (set /p nothing=[%%i;0H[48;2;20;20;20m[2K[0;0H<nul))
echo.
if not defined dummy (echo [28CCursor Changer %batver%)
echo.
echo %welcomelineclr%O=========================================================================O%welcomelineclr2%
echo.
echo.
echo.
echo.
echo. 
echo.
echo.
if not defined dummy (if not "%1"=="reboot" (set /p nothing=%welcomelineclr2%[13;43H[2KShutting down...%welcomelineclr3%<nul) else (if not defined dummy (set /p nothing=%welcomelineclr2%[13;48H[2KRebooting...%welcomelineclr3%<nul)))
echo.
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
if not defined dummy (echo [23C2021-2025 tamago_1908 %batbuild%)
timeout /t 2 /nobreak >nul
if not "%1"=="reboot" if not defined dummy (set /p nothing=%welcomelineclr2%[13;38H[2KTerminating Cursor Changer...%welcomelineclr3%<nul)
call :exitmenuexit
if not "%1"=="reboot" (call :exit 0) else (call :rebootbatch)

:mainmenu_resetcolor
if not defined dummy (set clr=[7m&set clred=[41m&set clrgrn=[42m&set clrcyan=[46m&set clrgra=[90m&set clr2=[0m& set ccmmul=[4m)
if "%wmodetoggle%"=="false" (set clr=[7m&set clred=[41m&set clrgrn=[42m&set clrgra=[90m&set clrcyan=[46m&set clr2=[0m)
if "%wmodetoggle%"=="true" (set clr=[100m[97m&set clred=[41m&set clrgrn=[42m&set clrgra=[107m[38;2;140;140;140m&set clrcyan=[46m&set clr2=[0m[107m[30m)
exit /b

:exitmenuexit
set clrcyan=& set clrgra=& set clred=& set clrgrn=& set clryel=& set clrmag=
set welcomelineclr=& set welcomelineclr2=& set welcomelineclr3=& exit /b


:UpdateAvailable
rem GUI type 4
rem Preparing of Menu and Variables
if not defined dummy (set clr=[7m&set clrgra=[90m&set clryel=[93m&set clrwhi=[97m&set clr2=[0m)
if "%wmodetoggle%"=="false" (set clr=[7m&set clrgra=[90m&set clryel=[93m&set clrwhi=[97m&set clr2=[0m)
if "%wmodetoggle%"=="true" (set clr=[100m[97m&set clrgra=[107m[38;2;140;140;140m&set clryel=[93m&set clrwhi=[30m&set clr2=[90m[107m[30m)
set UAsel=0
setlocal enabledelayedexpansion

:UpdateAvailable_main
rem Draw Update Available UI
for /l %%i in (1,1,512) do if not "!UAexit!"=="true" (
if not defined UAboot (
    title Cursor Changer ^| New Update is Available^^!
    set /p nothing=[?25l%clr2%<nul
    call :Mainmenudraw DarkDarkerYetDarker & set UAboot=true)
echo [5;16H O=========================================O 
echo [6;16H I                                         I 
echo [7;16H I         New Update is Available^^!        I 
echo [8;16H I                                         I 
echo [9;16H I[9;35H%clryel%-----^>%clr2%[9;59HI 
echo [10;16H I         %clrgra%^(Current^)    ^(Updated^)%clr2%          I 
echo [11;16H I                                         I 
echo [12;16H I         Do you want to Update?          I 
echo [13;16H I[13;59HI 
echo [14;16H I                                         I 
echo [15;16H I    O=============O    O============O    I 
echo [16;16H I    I!UAcb1!     Yes     %clr2%I    I!UAcb2!     No     %clr2%I    I 
echo [17;16H I    O=============O    O============O    I 
echo [18;16H I            O================O           I 
echo [19;16H I            I!UAcb3! See Change log %clr2%I           I 
echo [20;17HI            O================O           I
echo [21;17HI                                         I
echo [22;17HI %clrgra%Move: WASD or 1~3 Select: Y,E Exit: B,N%clr2% I
echo [23;17HO=========================================O
call :UpdateAvailable_VersionDraw

choice /c 123WASDYEBN /n >nul
rem Processing of each move
if not "!UAsel!"=="3" (set UAselPre=!UAsel!)
if !Errorlevel!==10 (set UAexit=true) else if !Errorlevel!==11 (set UAexit=true)
if !Errorlevel! geq 1 if !Errorlevel! leq 3 (set UAsel=!Errorlevel!)
if !UAsel!==0 (set UAsel=1& set UAcb1=%clr%) else (
if !ErrorLevel!==4 (if !UAsel!==3 (if "!UAselPre!"=="1" (set UAsel=1) else if "!UAselPre!"=="2" (set UAsel=2) else (set UAsel=2)))
if !ErrorLevel!==5 (if not !UAsel!==3 (set UAsel=1))
if !ErrorLevel!==6 (if not !UAsel!==3 (set UAsel=3))
if !ErrorLevel!==7 (if not !UAsel!==3 (set UAsel=2))
if !Errorlevel! geq 8 if !Errorlevel! leq 9 (
    set /p nothing=%clr2%<nul
    if !UAsel!==1 (cls & title Cursor Changer ^| Updating...& echo Updating...& call :Powersheller Doupdate)
    if !UAsel!==2 (set UAexit=true& exit /b)
    if !UAsel!==3 (cls & title Cursor Changer ^| Change log& echo Loading Change log...& echo. & call :Powersheller Changelog & pause & set UAboot=& mode con: cols=75 lines=25)
))
for /l %%i in (1,1,3) do (set UAcb%%i=) & set UAcb!UAsel!=%clr%)
if "!UAexit!"=="true" (call :UpdateAvailable_exit & exit /b
) else (set /p nothing=[0;0HLag spike :3<nul& goto :UpdateAvailable_main)

:UpdateAvailable_VersionDraw
rem Detect version
set /p nothing=%clr2%<nul
if "%batbeta%"=="True" (set /p nothing=[13;18H %clrgra%This update is beta, and maybe unstable%clr2%<nul)
if not defined updatemyversion (set /p nothing=[9;30H%clrwhi%Null%clr2%<nul)
if not defined updateversion (set /p nothing=[9;42H%clrwhi%Null%clr2%<nul& exit /b)
rem Calculete version length
for /l %%i in (0,1,10) do (set "char=!updatemyversion:~%%i,1!" & if not "!char!"=="" (set /a length+=1))
rem Show version text
set /a showlen=34-length
if not defined dummy (set /p nothing=[9;%showlen%H%clrwhi%%updatemyversion%%clr2%<nul)
if not defined dummy (set /p nothing=[9;42H%clrwhi%%updateversion%%clr2%<nul)
set length=& set showlen=
exit /b

:UpdateAvailable_exit
rem initialize of variable
set UAexit=& set UAboot=& set UAsel=& set UAselpre=& set UAPre=& set UAcb1=& set UAcb2=& set UAcb3=& set clrgra=& set clryel=
set batbeta=& set updateavailable=& set updatemyversion=& set updateversion=
set checkupdatetoggle=false
if not defined dummy (set /p nothing=[?25h<nul)
setlocal disabledelayedexpansion
exit /b



rem Depiction of the settings menu
:setting
cls
title Cursor Changer ^| Setting Menu
cd /d %batchmainpath%
if not exist %Settingsfile% (goto :dogcheck)
rem ccg=current category, csl=current select
if not defined dummy (set clr=[7m&set clrgra=[90m&set clr2=[0m)
if "%wmodetoggle%"=="false" (set clr=[7m&set clrgra=[90m&set clr2=[0m)
if "%wmodetoggle%"=="true" (set clr=[100m[97m&set clrgra=[90m&set clr2=[0m[107m[30m)
set STG_CCG=0& set STG_CCG_Temp=1 & rem < Temp values are must be different from the original value
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
if not "%SettingDebug%"=="true" (title Cursor Changer ^| Setting Menu) else (title EL: !errorlevel! CCG: !STG_CCG! CSL: !STG_CSL! SCT: !STG_Section! LoopCT: %%i ^| CCG_Temp: !STG_CCG_Temp! CSL_Temp: !STG_CSL_Temp!)
rem Main Screen draw
if "!STG_CSL!"=="true" (if not "!STG_CSL_Temp!"=="true" (call :Setting_Main_Drawer redraw)) else (call :Setting_Main_Drawer)
if !STG_CCG! neq !STG_CCG_Temp! (call :Setting_Main_CUI) else (set /p nothing=[22;0H<nul)
rem Ask
choice /c 12345WASDBYE /n >nul
call :Setting_Main_Core !Errorlevel!
)
if "!Settingexit!" neq "true" (set /p nothing=[0;0HLag spike :3<nul& goto :Setting_Main) else (setlocal disabledelayedexpansion & call :Setting_Exit & goto :Mainmenu)

:Setting_Main_CUI
if not defined "%clrgrabg%" (if "%wmodetoggle%"=="true" (set clrgrabg=[48;2;215;215;215m) else (set clrgrabg=[48;2;40;40;40m))
if not defined dummy (set /p nothing=[?25l[0;0H<nul& set SCB_1=& set SCB_2=& set SCB_3=& set SCB_%STG_CCG%=%clr%)
if not defined dummy (
echo.
Echo                                Setting Menu
echo. 
echo O========================O                 O=========O
echo I        Category        I                 I Setting I
echo O========================O=================O=========O====================O
echo I%SCB_1%                        %clr2%I [48CI
echo I%SCB_1% Cursor Changer Feature %clr2%I [48CI
echo I%SCB_1%                        %clr2%I [48CI
echo I========================I[48CI
echo I%clrgrabg%                        %clr2%I[48CI
echo I========================I[48CI
Echo I%SCB_2%                        %clr2%I [48CI
echo I%SCB_2% Cursor Changer Visuals %clr2%I [48CI
echo I%SCB_2%                        %clr2%I [48CI
echo O========================O==O=====================O==========O============O
echo I%SCB_Help%       Help  Mode       %clr2%I  I Move : W A S D, 1~5 I Back : B I Slct : Y E I
echo O========================O  O=====================O==========O============O
echo [2B[5C %clrgra%Select what you want to change by number or by moving with wasd%clr2%
)
exit /b


:Setting_Main_Core
set STG_CSL_Temp=%STG_CSL%& set STG_CCG_Temp=%STG_CCG%
rem initial value move, 1~3 = move, else set Category to 1
if "%STG_CSL%"=="0" (
    if "%1"=="10" (set Settingexit=true& exit /b)
    if "%STG_CCG%"=="0" (if %1 geq 1 if %1 leq 3 (set STG_CCG=%1) else (set STG_CCG=1) & set STG_CSL=0& exit /b)
) else (if "%1"=="10" (if "%STG_CSL%"=="true" (set STG_CSL=0& exit /b) else if not "%STG_Section%"=="2" (if %STG_CSL% geq 1 if %STG_CSL% leq 5 (set STG_CSL=true& exit /b)) else (set STG_Section=1& set STG_CSL=1& call :Setting_Main_Drawer redraw & exit /b))) & rem < return to previous point

rem Process 1~3, WS categoly movements
if "%STG_CCG%"=="1" (set MaxSTG=5) else if "%STG_CCG%"=="2" (set MaxSTG=4) else (set MaxSTG=0) & rem < Max setting buttons
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
        if "%STG_CCG%"=="2" (if not "%STG_Section%"=="2" (if "%STG_CSL%"=="1" (set STG_Section=2& call :Setting_Main_Drawer redraw & exit /b) else if "%STG_CSL%"=="2" (call :SettingApplyer 6) else if "%STG_CSL%"=="3" (call :SettingApplyer 7) else if "%STG_CSL%"=="4" (call :SettingApplyer wmode)) else (
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
if "%STG_CSL_Temp%"=="true" (set STG_CSL_Temp=1)
if "%1"=="redraw" (set ForTemp=1,1,5) else (if %STG_CSL% leq %STG_CSL_Temp% (set ForTemp=%STG_CSL_Temp%,-1,%STG_CSL%) else if %STG_CSL% geq %STG_CSL_Temp% (set ForTemp=%STG_CSL_Temp%,1,%STG_CSL%)) & rem < Skip drawing unupdated button
if "%STG_CCG%"=="1" (set ForTemp_button=14) else if "%STG_CCG%"=="2" (if "%STG_Section%"=="2" (set ForTemp_button=14) else (set ForTemp_button=12))
if "%STG_CSL%"=="0" (for /l %%i in (15,-1,7) do (set /p nothing=[%%i;27H                                                <nul)) else if "%STG_CSL%"=="true" (for /l %%i in (15,-1,7) do (set /p nothing=[%%i;27H                                                <nul)) else if "%1"=="redraw" (for /l %%i in (15,-1,7) do (set /p nothing=[%%i;27H                                                <nul)) & rem < Clear texts
for /l %%i in (1,1,5) do (set STG_B%%i=) & if %STG_CSL% geq 1 if %STG_CSL% leq 5 (set STG_B%STG_CSL%=%clr%) & rem < Update Button highlight
if "%STG_CSL%"=="0" ( rem < Draw description
    if "%STG_CCG%"=="0" (set /p nothing=[8;28H Currently, Category is not selected...[9;28H Please select category.[14;28H %clrgra%[W,S] or [1~3] to select category%clr2%<nul)
    if "%STG_CCG%"=="1" (set /p nothing=[8;28H This Category is related to the functionality[9;28H setting of the Cursor Changer.<nul)
    if "%STG_CCG%"=="2" (set /p nothing=[8;28H This Category is related to the visuality[9;28H setting of the Cursor Changer.[10;28H %clrgra%^(like theme^)%clr2%<nul)
    if "%STG_CCG%"=="3" (set /p nothing=[8;28H Help Mode. After selecting this function,[9;28H Select the you want to see an overview of it,[10;28H You can see an overview of it.[12;28H If you want to disable help mode,[13;28H select this feature again.[15;28H %clrgra%Help mode is %settinghelptoggle%%clr2%<nul
    if "%settinghelptoggle%"=="true" (set SCB_Help=[46m& set /p nothing=[17;0HI[46m       Help  Mode       %clr2%I<nul) else (set SCB_Help=%clr%& set /p nothing=[17;0HI%clr%       Help  Mode       %clr2%I<nul& set SCB_3=) & rem < Help mode toggle
    ) else (if "%settinghelptoggle%"=="true" (set SCB_Help=%clr%) else (set SCB_Help=))
) else (if "%1"=="redraw" (for /l %%i in (8,2,%ForTemp_button%) do (set /p nothing=[%%i;64HO==========<nul))
    if "%STG_CCG%"=="1" ( rem < Draw Category 1 buttons
        for /l %%i in (%ForTemp%) do (
            if "%%i"=="1" (set /p nothing=[7;27H 1 %STG_B1%Boot as Cursor Changer%clr2%<nul
            ) else (if "%%i"=="2" (set /p nothing=[9;27H 2 %STG_B2%Admin When Boot%clr2%<nul
            ) else (if "%%i"=="3" (set /p nothing=[11;27H 3 %STG_B3%Check Update at boot%clr2%<nul
            ) else (if "%%i"=="4" (set /p nothing=[13;27H 4 %STG_B4%Allow sound to play%clr2%<nul
            ) else (if "%%i"=="5" (set /p nothing=[15;27H 5 %STG_B5%Initialization or Uninstallation%clr2%<nul)
            set /p nothing=[7;64HI  %setting1onoff%<nul& set /p nothing=[9;64HI  %setting2onoff%<nul& set /p nothing=[11;64HI  %setting3onoff%<nul& set /p nothing=[13;64HI  %setting4onoff%<nul
        )))))
    ) else if "%STG_CCG%"=="2" ( rem < Draw Category 2 buttons
    if not "%STG_Section%"=="2" (
        set /p nothing=[4;56H[0K[5;56H[0K<nul
        for /l %%i in (%ForTemp%) do (
            if "%%i"=="1" (set /p nothing=[7;27H 1 %STG_B1%Boot animation Settings%clr2%<nul
            ) else (if "%%i"=="2" (set /p nothing=[9;27H 2 %STG_B2%Show Underline at main menu%clr2%<nul
            ) else (if "%%i"=="3" (set /p nothing=[11;27H 3 %STG_B3%Show Background at main menu%clr2%<nul
            ) else (if "%%i"=="4" (set /p nothing=[13;27H 4 %STG_B4%%wmodeonoff%%clr2%<nul)
            set /p nothing=[7;64HI    ^>   <nul& set /p nothing=[9;64HI  %setting6onoff%<nul& set /p nothing=[11;64HI  %setting7onoff%<nul
        )))))
    if "%STG_Section%"=="2" ( rem < Draw Category 2 Section 2 buttons
        set /p nothing=[4;56HO==================O[5;56HI Setting5/...     I<nul
        for /l %%i in (%ForTemp%) do (
            call :Setting_Main_STGSection_2_Grayout
            if "%%i"=="1" (set /p nothing=[7;27H !STG_B1_gray!1 !STG_B1!Boot animation%clr2%<nul
            ) else (if "%%i"=="2" (set /p nothing=[9;27H !STG_B2_gray!2 !STG_B2!Linux-ish Boot animation%clr2%<nul
            ) else (if "%%i"=="3" (set /p nothing=[11;27H !STG_B3_gray!3 !STG_B3!Simple boot animation%clr2%<nul
            ) else (if "%%i"=="4" (set /p nothing=[13;27H !STG_B4_gray!4 !STG_B4!Raw Boot animation%clr2%<nul)
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
if "%setting5onoff%"=="false" (
    if "%wmodetoggle%"=="true" (
    set STG_B2_gray=[107m[38;2;140;140;140m& set STG_B4_gray=[107m[38;2;140;140;140m
    ) else (set STG_B2_gray=[0m[90m& set STG_B4_gray=[0m[90m)
    exit /b
)
exit /b


:Setting_Exit
rem delete variables
set STG_CCG=& set STG_CSL=& set STG_CCG_Temp=& set STG_CSL_Temp=& set MaxSTG=& set Settingexit=& set SCB_Help=& set settinghelptoggle=
set clrgrabg=& set STG_Section=
for /l %%i in (0,1,3) do (set SCB_%%i=)
exit /b



:Settingapplyer
rem Setting applyer
rem Setting lists 
if not "%1"=="" (set "SGApplyer_SettingNum=%1") else (echo SettingApplyer : Please gimme a argument :3& pause & exit /b 1)
if "%SGApplyer_SettingNum%"=="1" (set "SGApplyer_Applytext=Reboot as Cursor Changer" & set "SGApplyer_Settingname=BootAsCC")
if "%SGApplyer_SettingNum%"=="2" (set "SGApplyer_Applytext=request for administrative privileges at startup" & set "SGApplyer_Settingname=admin")
if "%SGApplyer_SettingNum%"=="3" (set "SGApplyer_Applytext=Check update at boot" & set "SGApplyer_Settingname=CheckUpdate")
if "%SGApplyer_SettingNum%"=="4" (set "SGApplyer_Applytext=allow sound to play" & set "SGApplyer_Settingname=PlaySound")
if "%SGApplyer_SettingNum%"=="5" (set "SGApplyer_Applytext=boot animation" & set "SGApplyer_Settingname=bootanimation")
if "%SGApplyer_SettingNum%"=="5_1" (set "SGApplyer_Applytext=linux-ish boot animation" & set "SGApplyer_Settingname=s5_linuxboot")
if "%SGApplyer_SettingNum%"=="5_2" (set "SGApplyer_Applytext=simple boot animation" & set "SGApplyer_Settingname=s5_simpleboot")
if "%SGApplyer_SettingNum%"=="5_3" (set "SGApplyer_Applytext=raw boot animation" & set "SGApplyer_Settingname=s5_rawboot")
if "%SGApplyer_SettingNum%"=="6" (set "SGApplyer_Applytext=Show Underline at the mainmenu" & set "SGApplyer_Settingname=Underline")
if "%SGApplyer_SettingNum%"=="7" (set "SGApplyer_Applytext=Show Background at the mainmenu" & set "SGApplyer_Settingname=MainmenuBg")
if "%SGApplyer_SettingNum%"=="wmode" (set "SGApplyer_Applytext=Unused text" & set "SGApplyer_Settingname=wmode")
goto :SettingApplyer_Main


:SettingApplyer_Main
rem Detect settings and decide toggle text (like "enable" and "disable")
if "%SGApplyer_Settingname%"=="" (echo SettingApplyer : Argument "%SGApplyer_SettingNum%" is Invalid argument or undefined setting!& pause & exit /b 1)
if "%settinghelptoggle%"=="true" (if not "%SGApplyer_SettingNum%"=="wmode" (goto :setting%1help) else if "%SGApplyer_SettingNum%"=="wmode" (goto :wmodehelp))
find "%SGApplyer_Settingname%=false" %Settingsfile% > nul
if not "%SGApplyer_SettingNum%"=="wmode" (
    if %ErrorLevel%==0 set "SGApplyer_ToggleText=enable" & goto :SettingApplyer_Ask
    if %ErrorLevel%==1 set "SGApplyer_ToggleText=repair" & goto :SettingApplyer_DetectTrue
) else (
    if %ErrorLevel%==0 set "SGApplyer_ToggleText=White theme" & goto :SettingApplyer_Ask
    if %ErrorLevel%==1 set "SGApplyer_ToggleText=Default theme" & goto :SettingApplyer_DetectTrue
)
:SettingApplyer_DetectTrue
find "%SGApplyer_Settingname%=true" %Settingsfile% > nul
if not "%SGApplyer_SettingNum%"=="wmode" (
if %ErrorLevel%==0 set "SGApplyer_ToggleText=disable"
) else (if %ErrorLevel%==0 set "SGApplyer_ToggleText=Dark theme" & goto :SettingApplyer_Ask)


:SettingApplyer_Ask
rem ask enbale / disable setting or not
cls
set selected=
if not "%SGApplyer_SettingNum%"=="wmode" (echo Do you want to %SGApplyer_ToggleText% the %SGApplyer_Applytext%?
) else (echo Do you want to change the theme of Cursor Changer to %SGApplyer_ToggleText%?)
echo ^(Y=Yes N=No B=Back^)
SET /P selected= :
echo %selected% has selected.
if "%selected%"=="yes" (goto :SettingApplyer_Apply)
if "%selected%"=="y" (goto :SettingApplyer_Apply)
if "%selected%"=="no" (goto :SettingApplyer_Sad)
if "%selected%"=="n" (goto :SettingApplyer_Sad)
if "%selected%"=="back" (goto :SettingApplyer_Sad)
if "%selected%"=="b" (goto :SettingApplyer_Sad)
goto :SettingApplyer_Ask


:SettingApplyer_Apply
rem main applyer
echo.& echo Applying setting...
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
    if "%SGApplyer_Settingname%"=="Underline" (echo Underline=true >> %Settingsfile%)
    if "%SGApplyer_Settingname%"=="MainmenuBg" (echo MainmenuBg=true >> %Settingsfile%)
    if "%SGApplyer_Settingname%"=="wmode" (echo wmode=false >> %Settingsfile%)
    goto :SettingApplyer_Apply_Complete
)
if %ErrorLevel%==0 goto :SettingApplyer_Apply_TrueToFalse

:SettingApplyer_Apply_TrueToFalse
rem change the setting true to false
powershell "(gc %Settingsfile%) -replace '%SGApplyer_Settingname%=true','%SGApplyer_Settingname%=false' | sc %Settingsfile%"
if "%SGApplyer_Settingname%"=="s5_linuxboot" (set linuxboot=false) else if "%SGApplyer_Settingname%"=="s5_simpleboot" (set simpleboot=false) else if "%SGApplyer_Settingname%"=="s5_rawboot" (set rawboot=false)
if "%SGApplyer_Settingname%"=="wmode" (set wmodetoggle=false)
goto :SettingApplyer_Apply_Complete

:SettingApplyer_Apply_FalseToTrue
rem change the setting to false to true
powershell "(gc %Settingsfile%) -replace '%SGApplyer_Settingname%=false','%SGApplyer_Settingname%=true' | sc %Settingsfile%"
if "%SGApplyer_Settingname%"=="s5_linuxboot" (set linuxboot=true) else if "%SGApplyer_Settingname%"=="s5_simpleboot" (set simpleboot=true) else if "%SGApplyer_Settingname%"=="s5_rawboot" (set rawboot=true)
if "%SGApplyer_Settingname%"=="wmode" (set wmodetoggle=true)
goto :SettingApplyer_Apply_Complete


:SettingApplyer_Apply_Complete
call :SettingApplyer_Theme_Apply
rem Yaaay it changed
cls
Echo The change was made successfully.
Pause
if "%SGApplyer_SettingNum%"=="wmode" (set "wantload=wmode") else (set "wantload=setting%SGApplyer_SettingNum%")
call :SAB_Manager
call :SettingApplyer_Exit
exit /b 0

:SettingApplyer_Sad
rem nooo you didn't change the setting :(
cls
echo Setting were not changed.
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



rem setting help txt 
:setting1help
cls
echo This setting can toggle the transition to Cursor Changer (1 in Main Menu) instead of Main Menu after startup.
echo If enabled, you can change the cursor immediately after starting Cursor Changer.
echo This setting is false by default.
pause
exit /b

:setting2help
cls
echo This setting is intended to prevent errors when changing cursors by running Cursor Changer with administrative privileges.
echo It is recommended that this setting be set to true only if there is an error or failure to change the cursor.
echo Setting this to true may reduce startup time.
echo This setting is false by default.
pause
exit /b

:setting3help
cls
echo This setting enables or disables the ability to check for updates when Cursor Changer is booted.
echo If this feature is turned on, updates will be checked every time this batch is booted, and if updates are available, they will be applied as they are.
echo However, this feature is not available when there is no Internet connection, and depending on the speed of the Internet connection, the boot up speed may be reduced.
echo In addition, the hourly If you repeat launching more than 50 times, you may reach the API rate limit of github.
echo This setting is false by default.
pause
exit /b

:setting4help
cls
echo This setting determines whether Cursor Changer is allowed to play sound.
echo If this setting is on, sound effects and other sounds will be played at startup, etc.
echo These sounds are played by Powershell when it is launched from Cursor Changer from the background.
echo This setting is true by default.
pause
exit /b

:setting5help
cls
echo This setting is a setting that makes the boot animation that always plays at each startup, so to speak, false and hidden.
echo Setting this setting to false will reduce startup time and annoyance.
echo This setting is true by default.
pause
exit /b

:setting5_1help
cls
echo This setting allows a Linux-like startup animation to be played.
echo it is easy to see that the system is starting up and looks good. Also, when an error occurs during startup, it may be easier to see where the error occurred.
echo This setting cannot be used with simpleboot and rawboot.
echo This setting is false by default.
pause
exit /b

:setting5_2help
cls
echo This setting allows only "booting up" to be displayed at startup.
echo It is very fast, simple and unobtrusive. However, it can be makes you little boring.
echo This setting is false by default.
pause
exit /b

:setting5_3help
cls
echo This setting is to start within the "echo on" state at startup.
echo It is simple, easy to understand, and shows at a glance what is currently being executed. It also makes you feel like a hacker.
echo This setting cannot be used with linuxboot and rawboot.
echo This setting is false by default.
pause
exit /b

:setting6help
cls
echo This setting allows you to change whether or not the first letter
echo of the main menu choice is Underlined.
echo This setting is true by default.
pause
exit /b

:setting7help
cls
echo This setting allows you to toggle the background in the main menu.
echo Enabling this will result in a better look.
echo However, depending on your computer's spec, the main menu may not be as responsive as it could be.
echo This setting is true by default.
pause
exit /b

:wmodehelp
cls
echo This changes the CMD screen to white or black.
echo This will allow, for example, the screen to be unified with a white theme, and also accommodate those who prefer it that way.
echo The standard color is black, but after setting it to white, the screen will automatically turn white when it is started up in the future.
echo Also, as a bit of backstory, this setting was placed on the home side until 1.10 or earlier. This feature is also the source of the internal structure of the setting.
echo By default, it is a dark theme.
pause
exit /b
 
:uninstallhelp
cls
echo This is the uninstall menu. This menu uninstalls Cursor Changer.
echo This menu contains functions to display the path to the Setting file (the text file in which the settings are recorded) and to initialize (set to default) the settings.
echo If uninstallation is performed, the Cursor Changer itself will be removed and (optional) cursors will be removed by default. (Optional) The Setting and files for detecting the first startup will also be completely removed.
echo Please do so at your own risk.
pause
exit /b



rem Version of batch
:batver
set batvercurrent=0
if "%batverdev%"=="dev" (set batverdevshow=Dev)
if "%batverdev%"=="beta" (set batverdevshow=Beta)
if "%batverdev%"=="stable" (set batverdevshow=Stable)
if not defined dummy (set /p nothing=[?25l<nul)
if not defined dummy (set clr=[7m&set clrgra=[90m&set clr2=[0m)
if "%wmodetoggle%"=="false" (set clr=[7m&set clrgra=[90m&set DarkDarkerYetDarker=[48;2;17;17;17m&set clr2=[0m)
if "%wmodetoggle%"=="true" (set clr=[100m[97m&set clrgra=[107m[38;2;140;140;140m&set DarkDarkerYetDarker=[48;2;237;237;237m&set clr2=[90m[107m[30m)
if "%wmodetoggle%"=="false" (set DarkDarkerYetDarker2=%DarkDarkerYetDarker%[38;2;110;110;110m)
if "%wmodetoggle%"=="true" (set DarkDarkerYetDarker2=%DarkDarkerYetDarker%[38;2;155;155;155m)
setlocal enabledelayedexpansion

:batver_main
rem GUI type 4
rem Main Bat Version Menu
title Cursor Changer ^| Version Info
for /l %%i in (1,1,512) do if not "!batverexit!"=="true" (
if not defined batverboot (call :Mainmenudraw DarkDarkerYetDarker & set batverboot=true)
if not defined dummy (echo [12;35H %batver% ^(%batverdevshow%^))
if not defined dummy (echo [13;35H %batbuild:~6%)
if not defined dummy (echo [14;35H %YourName%)
echo [5;15H O============================================O 
echo [6;15H I%DarkDarkerYetDarker%                Version info                %clr2%I 
echo [7;15H I%DarkDarkerYetDarker%                                            %clr2%I 
echo [8;15H I%DarkDarkerYetDarker%           - Cursor Changer.bat -           %clr2%I
echo [9;15H I%DarkDarkerYetDarker%                                            %clr2%I
echo [10;15H I%DarkDarkerYetDarker2%============================================%clr2%I
echo [11;15H I                                            I
echo [12;15H I         Version : [25CI
echo [13;15H I         Build   : [25CI
echo [14;15H I         User    : [25CI
echo [15;15H I                                            I
echo [16;15H I       O==============O     O=======O       I
echo [17;15H I       I!bvb1! Check Update %clr2%I     I!bvb2! Close %clr2%I       I
echo [18;15H I       O==============O     O=======O       I
echo [19;15H I                                            I
echo [20;16HI                                            I
echo [21;16HI   %clrgra%1~2 or A,D: Move, Y,E: Select, B: Exit%clr2%   I
echo [22;16HO============================================O
if "!batvercurrent!"=="0" (echo [20;30H %clrgra%Nothing Selected...%clr2%) else (set /p nothing=[20;17H                                            <nul)

choice /c 12adyeb /n >nul
if !Errorlevel!==7 (set batverexit=true)
if !Errorlevel! geq 1 if !Errorlevel! leq 2 (set batvercurrent=!Errorlevel!)
if !batvercurrent!==0 (set batvercurrent=1& set bvb1=%clr%) else (
if !ErrorLevel!==3 (if not !batvercurrent!==1 (set /a batvercurrent-=1))
if !ErrorLevel!==4 (if not !batvercurrent!==2 (set /a batvercurrent+=1))
if !Errorlevel! geq 5 if !Errorlevel! leq 6 (
if "!batvercurrent!"=="1" (call :batverupdate & set batverboot=)
if "!batvercurrent!"=="2" (set batverexit=true)))
set bvb1=& set bvb2=& set bvb!batvercurrent!=%clr%)
if "!batverexit!"=="true" (call :batver_exit & goto :mainmenu
) else (set /p nothing=[0;0HLag spike :3<nul& goto :batver_main)

:batver_exit
rem initialize of variable
set batverexit=& set bvb1=& set bvb2=& set batverboot=& set batverdevshow=& set clrgra=
set DarkDarkerYetDarker=& set DarkDarkerYetDarker2=
if not defined dummy (set /p nothing=[?25h<nul)
setlocal disabledelayedexpansion
exit /b

:batverupdate
setlocal disabledelayedexpansion
rem Update process
title Cursor Changer ^| Updater
for /l %%i in (6,1,21) do (set /p nothing=[%%i;17H                                            <nul)
if not defined dummy (set /p nothing=[7;18H Checking Update...<nul)
call :Powersheller CheckUpdate
set TempErrorlevel=%errorlevel%
rem Update messages
if "%TempErrorlevel%"=="0" (set /p nothing=[?25l<nul& set TempErrorlevel=& exit /b)
if not defined dummy (for /l %%i in (6,1,21) do (set /p nothing=[%%i;17H                                            <nul))
if not "%TempErrorlevel%"=="0" if not "%TempErrorlevel%"=="1" (set /p nothing=[7;18H [91mAn error occurred while checking update!%clr2%[20;18H %clrgra%^(Press any key to continue...^)%clr2%<nul)
if "%TempErrorlevel%"=="1" (
if not defined dummy (set /p nothing=[7;18H You already have the latest version![8;18H There is no need to update.[20;18H %clrgra%^(Press any key to continue...^)%clr2%<nul)
pause >nul
) else if "%TempErrorlevel%"=="2" (
if not defined dummy (set /p nothing=[9;18H You have a newer version than the update[10;18H file![11;18H Perhaps you changed the version manually[12;18H ^>:/<nul)
pause >nul
) else if "%TempErrorlevel%"=="3" (
if not defined dummy (set /p nothing=[9;18H Github API rate limit has been reached![10;18H Please wait an hour or so and try again.[12;18H %clrgra%^(Pwease no more...^)%clr2%<nul)
pause >nul
) else if "%TempErrorlevel%"=="4" (
if not defined dummy (set /p nothing=[9;18H Something went wrong.[10;18H Check your internet connection and try [11;18H again.<nul)
pause >nul
)
if not defined dummy (set /p nothing=[?25l<nul)
setlocal enabledelayedexpansion
set TempErrorlevel=& exit /b



:Appmenu
cls
rem GUI type 4
rem initialize variable
mode con: cols=67 lines=20
if not defined dummy (set clr=[7m&set clrgra=[90m&set clr2=[0m)
if "%wmodetoggle%"=="false" (set clr=[7m&set clrgra=[90m&set clr2=[0m)
if "%wmodetoggle%"=="true" (set clr=[100m[97m&set clrgra=[107m[38;2;140;140;140m&set clr2=[90m[107m[30m)
if not defined dummy (set /p nothing=[?25l<nul)
set Appmenucurrent=0
setlocal enabledelayedexpansion

:Appmenu_main
title Cursor Changer ^| Application Menu (beta)
for /l %%i in (1,1,512) do if not "!Appmenuexit!"=="true" (
if "!Appmenucurrent!"=="0" (echo [7;41H Nothing Selected) else (for /l %%i in (6,1,10) do (echo [%%i;38H                        ))
if "!Appmenucurrent!"=="1" (echo [7;41H Simple Calculator.& echo [8;44H Easy to use.)
if "!Appmenucurrent!"=="2" (echo [7;45H 2048 Game.& echo [8;43H You can play& echo [9;47H 2048.& echo [10;41H %clrgra%it's maybe laggy%clr2%)
if "!Appmenucurrent!"=="3" (echo [7;38H Open Internet Explorer& echo [8;41H It will open IE.)
if not defined dummy (set /p nothing=[0;0H<nul)
echo.
echo                          Application Menu                     
echo.
echo      O==============================O========================O     
echo      I                              I          Info          I
echo      I   1 : !amb1!Simple Calculator%clr2%      I[6;62HI
echo      I                              I[7;62HI
echo      I   2 : !amb2!2048 Game%clr2%              I[8;62HI
echo      I                              I[9;62HI
echo      I   3 : !amb3!Internet Explorer 11%clr2%   I[10;62HI
echo      I                              I[11;62HI
echo      O==============================O========================O
echo      I   Control :                                           I
echo      I   W,S or 1~3 to move, Y or E to start.                I
echo      I   N or B to exit.                                     I
echo      O=======================================================O
echo.
echo             %clrgra%Specify the application you want to launch...%clr2%
echo.

choice /c 123wsyebn /n >nul
if !Errorlevel! geq 8 if !Errorlevel! leq 9 (set Appmenuexit=true)
if !Errorlevel! geq 1 if !Errorlevel! leq 3 (set Appmenucurrent=!Errorlevel!)
if !Appmenucurrent!==0 (set Appmenucurrent=1& set amb1=%clr%) else (
if !ErrorLevel!==4 (if not !Appmenucurrent!==1 (set /a Appmenucurrent-=1))
if !ErrorLevel!==5 (if not !Appmenucurrent!==3 (set /a Appmenucurrent+=1))
if !Errorlevel! geq 6 if !Errorlevel! leq 7 (
    if "!Appmenucurrent!"=="1" (call :Startcal)
    if "!Appmenucurrent!"=="2" (call :2048_game)
    if "!Appmenucurrent!"=="3" (call :Openie)
    mode con: cols=67 lines=20 & cls))
for /l %%i in (1,1,3) do (set amb%%i=) & set amb!Appmenucurrent!=%clr%)
if "!Appmenuexit!"=="true" (call :Appmenu_exit & goto :mainmenu
) else (set /p nothing=[0;0HLag spike :3<nul& goto :Appmenu_main)

:Appmenu_exit
rem initialize of variable
set Appmenucurrent=& set Appmenuexit=& set amb1=& set amb2=& set amb3=& set Appmenuboot=& set clrgra=
if not defined dummy (set /p nothing=[?25h<nul)
setlocal disabledelayedexpansion
exit /b



rem calculator
:startcal
set q=0
set number1=0
set number2=0
set number3=0
cls
echo Calculations up to the value of 2147483647 (upper limit for int type. Calculations above this limit are not allowed due to the specification)
echo.
title Cursor Changer ^| Simple Calculator

rem Simple mode
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
rem calculator branch
if "%q%"=="back" (exit /b)
if "%q%"=="b" (exit /b)
if "%q%"=="1" (set whatnumber=addressee&goto :startcal2)
if "%q%"=="2" (set whatnumber=subtracter&goto :startcal2) 
if "%q%"=="3" (goto :advancemodecal) else (
echo Invalid select.&pause&goto :startcal)

:startcal2
echo.
set /p number1=Enter the %whatnumber% :
if "%q%"=="1" (goto :pcal)
if "%q%"=="2" (goto :mcal)

:pcal
set /p number3=Enter the side to be added :
set /a number1=number1+number3
echo result : %number1%
pause
cls
goto :simplemodecal

:mcal
set /p number3=Enter the side to be subtracted :
set /a number1=number1-number3
echo result : %number1%
pause
cls
goto :simplemodecal

rem advancemode
:advancemodecal

:loopcal
cls
echo To end, type back.
SET /P formula="Enter the formula to be calculated."
SET /A result=%formula%
if "%formula%"=="back" goto :startcal
echo result : %Result%
pause
goto :loopcal


:openie
title Cursor Changer ^| Open Internet Explorer
cls
echo InternetExplorer is will open.
powershell -command "$ie = New-Object -ComObject InternetExplorer.Application; $ie.Visible = $true"
pathping 127.0.0.1 -n -q 1 -p 500 1>nul
exit /b


:2048_game
setlocal enabledelayedexpansion
title Cursor Changer ^| 2048 Game
mode con: cols=33 lines=31
set bestscore=0
:2048_startgame
set /a score=0,winstate=0&for /l %%g in (0,1,15)do set board[%%g]=0
set /a moves=0,h=0&for /l %%g in (0,1,15)do if !board[%%g]!==0 set /a h+=1
if %h%==16 call :2048_tilespawn&call :2048_tilespawn
:2048_startloop
if %score% gtr %bestscore% set bestscore=%score%
call :2048_drawboard 0&choice /c wasdbn /n /m ""
echo Processing...
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
cls&echo   ___     ___    _  _      ___&echo  ^|__ ╲   / _ ╲  ^| ^|^| ^|    / _ ╲&echo     ) ^| ^| ^| ^| ^| ^| ^|^| ^|_  ^| (_) ^|&echo    / /  ^| ^| ^| ^| ^|__   _^|  ^> _ ^<&echo   / /_  ^| ^|_^| ^|    ^| ^|   ^| (_) ^|&echo  ^|____^|  ╲___/     ^|_^|    ╲___/&echo(&echo       Add the tiles together,  &echo      Let's create 2048 tiles^^!&echo(&if %1==0 echo     (Press N to start new game)&echo             (B to exit)&&echo(
if %1==1 echo             You win!&echo Press C to continue or N to reset.
if %1==2 echo            Game Over!&echo        Press N to reset...
echo   Score: %score%&echo   High score: %bestscore%&echo   O======O======O======O======O&echo   I%board2[0]%I%board2[1]%I%board2[2]%I%board2[3]%I&echo   O======O======O======O======O&echo   I%board2[4]%I%board2[5]%I%board2[6]%I%board2[7]%I&echo   O======O======O======O======O&echo   I%board2[8]%I%board2[9]%I%board2[10]%I%board2[11]%I&echo   O======O======O======O======O&echo   I%board2[12]%I%board2[13]%I%board2[14]%I%board2[15]%I&echo   O======O======O======O======O&echo How to play: Use WASD keys to move tiles. Two tiles with the same number will merge into one when touched&exit /b
exit /b
:2048_end
cls
echo exitting 2048...
set score=,bestscore=,winstate=,board=,moves=,h=,randtile=,boardchanged=,tiles=,2048_youlost=,v=,w=,x=,y=,z=,tmparray=,i=,board2=,
setlocal disabledelayedexpansion
exit /b




:CursorChange
cls
rem GUI type 4
rem initialize variable
mode con: cols=75 lines=20
setlocal enabledelayedexpansion
if not defined dummy (set clr=[7m&set clrgra=[90m&set clr2=[0m)
if "%wmodetoggle%"=="false" (set clr=[7m&set clrgra=[90m&set clr2=[0m)
if "%wmodetoggle%"=="true" (set clr=[100m[97m&set clrgra=[107m[38;2;140;140;140m&set clr2=[90m[107m[30m)
if not defined dummy (set /p nothing=[?25l<nul)
set CursorChange_Current=0& set CursorChange_Exit=false

:CursorChange_main
rem main menu of cursor change
for /l %%i in (1,1,512) do if not "!CursorChange_Exit!"=="true" ( set /p nothing=[0;0H<nul
title Cursor Changer
if not "!CursorChange_Exit!"=="confirm1" (
echo                             Cursor Changer %batver%
echo.
echo           O================================O=====================O
echo           I              Menu              I        About        I
echo           I                                I[5;66HI
echo           I   !ccm1!1 Change to !cursorcolor! Cursor %clr2%    I[6;66HI
echo           I                                I[7;66HI
echo           I   !ccm2!2 Backup Cursor Settings %clr2%    I[8;66HI
echo           I                                I[9;66HI
echo           O================================O=====================O
echo.
echo.
echo              %clrgra%1~2 or W,S to select, Y,E to Confirm, B,N to exit.%clr2%
echo.
call :CursorChange_Draw
)
choice /c 12wsyebn /n >nul
if "!CursorChange_Exit!"=="confirm1" ( if !Errorlevel! geq 5 if !Errorlevel! leq 8 (
    if !Errorlevel! geq 5 if !Errorlevel! leq 6 (call :CursorChange_main_cfm & setlocal enabledelayedexpansion)
    if !Errorlevel! geq 7 if !Errorlevel! leq 8 (call :CursorChange_clear)
    set CursorChange_Exit=false 
)) else (
if !Errorlevel! geq 7 if !Errorlevel! leq 8 (set CursorChange_Exit=true)
if !Errorlevel! geq 1 if !Errorlevel! leq 2 (set CursorChange_Current=!Errorlevel!)
if !CursorChange_Current!==0 (set CursorChange_Current=1& set ccm1=%clr%) else (
if !ErrorLevel!==3 (if not !CursorChange_Current!==1 (set /a CursorChange_Current-=1))
if !ErrorLevel!==4 (if not !CursorChange_Current!==2 (set /a CursorChange_Current+=1))
if !Errorlevel! geq 5 if !Errorlevel! leq 6 (
    if "!CursorChange_Current!"=="1" (set CursorChange_Exit=confirm1& call :CursorChange_Draw)
    if "!CursorChange_Current!"=="2" (call :CursorChange_main_backup))))
for /l %%i in (1,1,2) do (set ccm%%i=) & set ccm!CursorChange_Current!=%clr%)
if "!CursorChange_Exit!"=="true" (call :CursorChange_exit & goto :mainmenu
) else (set /p nothing=[0;0HLag spike :3<nul& goto :CursorChange_main)

:CursorChange_Draw
rem drawer of Text and Colors.
if not defined dummy (for /l %%i in (5,1,7) do (set /p nothing=[%%i;46H                   <nul))
if "%CursorChange_Current%"=="0" (echo [6;46H Nothing Selected.)
if "%CursorChange_Current%"=="1" (
    if "%CursorChange_Exit%"=="confirm1" (
        call :CursorChange_clear
        set /p nothing=[5;13H Do you really want to chenge the cursor[6;13H to %cursorcolor%?[8;13H %clrgra%^(Y,E or B,N^)%clr2%<nul
    ) else (echo [6;47H Change to %cursorcolor%[7;51H Cursor.)
)
if "%CursorChange_Current%"=="2" (echo [6;47H You can backup[7;49H the Cursor.)
exit /b


:CursorChange_clear
rem clear box
if not defined dummy (set /p nothing=[3;44H=[10;44H=<nul)
for /l %%i in (4,1,9) do (set /p nothing=[%%i;12H                                                      <nul)
exit /b

:CursorChange_exit
rem initialize of variable
set CursorChange_Exit=& set CursorChange_Current=& set ccm1=& set ccm2=& set clrgra=
if not defined dummy (set /p nothing=[?25h<nul)
setlocal disabledelayedexpansion
exit /b




:CursorChange_main_cfm
setlocal disabledelayedexpansion
find "CursorChanged" %FirstSTFsfile% > nul
if "%errorlevel%"=="0" (goto :CursorChange_main_cfm_apply)

:CursorChange_main_cfm_FirstWarning
rem First Warning messages
call :CursorChange_clear
if not defined dummy (
    set /p nothing=[5;13H %clrgra%^(Only at First Changing Cursor^)%clr2%<nul
)
timeout /t 2 /nobreak >nul
call :CursorChange_clear
if not defined dummy (
    set /p nothing=[5;13H This feature changes the windows cursor. If you do <nul
    set /p nothing=[6;13H not wish to make the change, go back at this point. <nul
    set /p nothing=[8;13H %clrgra%hit any key to continue...%clr2%<nul
    pause >nul
)
call :CursorChange_clear
if not defined dummy (
    set /p nothing=[5;13H The creator, tamago_1908, is not responsible for <nul
    set /p nothing=[6;13H any problems that may result from the changes. <nul
    set /p nothing=[8;13H %clrgra%hit any key to continue...%clr2%<nul
    pause >nul
)
call :CursorChange_clear
if not defined dummy (
    set /p nothing=[5;13H Do you really want to continue?<nul
    set /p nothing=[8;13H %clrgra%^(Y or N^)%clr2%<nul
)
choice /c YN /n >nul
if "%errorlevel%"=="1" (
    find "nodogcheckforfastboot" %FirstSTFsfile% >nul || echo nodogcheckforfastboot > %FirstSTFsfile%
    echo CursorChanged >> %FirstSTFsfile%
    goto :CursorChange_main_cfm_apply
)
if "%ErrorLevel%"=="2" (set cursorchangeexit=& exit /b)


:CursorChange_main_cfm_apply
call :CursorChange_clear
:defgotest
rem determine black or white by the name of the cursor
reg query "HKEY_CURRENT_USER\Control Panel\Cursors" /v "" | find "Windows Default" >nul
if "%ErrorLevel%"=="0" (goto :darkgo)
if "%ErrorLevel%"=="1" (goto :darkgotest)

:darkgotest
reg query "HKEY_CURRENT_USER\Control Panel\Cursors" /v "" | find "Windows Black" >nul
if "%ErrorLevel%"=="0" (goto :defgo)
if "%ErrorLevel%"=="1" (goto :defgo)
call :exit 0


:Progress_bar_drawer
if "%wmodetoggle%"=="true" (set pbdclr=[47m[97m) else (set pbdclr=[7m)
rem startline(x),current,endline,y,background(0 or 1)
rem progress bar bg
if "%5"=="1" (for /l %%i in (%1,1,%3) do (set /p nothing=[%4;%%iH[48;5;244m %clr2%<nul))
rem progress bar fg
for /l %%i in (%1,1,%2) do (set /p nothing=[%4;%%iH%pbdclr% %clr2%<nul) & set pbdclr=
exit /b


rem Change cursor color to white
:defgo
set a=13
if not defined dummy (set /p nothing=[5;13H %clrgra%hit any key to apply...%clr2%<nul& pause >nul)
if not defined dummy (call :CursorChange_clear & set /p nothing=[5;13H Applying... %clrgra%^(Do not close the Cursor Changer!^)%clr2%<nul)
call :Progress_bar_drawer 14 %a% 63 8 1
timeout /t 1 /nobreak >nul
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /ve /f /d "Windows Default" >nul
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
if not defined dummy (call :CursorChange_clear & set /p nothing=[5;13H Refreshing the Cursor...<nul)
call :Powersheller RefreshCursor & set a=
if not defined dummy (call :CursorChange_clear & set /p nothing=[5;13H Cursor Color changed to white.<nul& timeout /t 3 /nobreak >nul)
goto :CursorChange_afterchange



rem Change the cursor color to black.
:darkgo
set a=13
if not defined dummy (set /p nothing=[5;13H %clrgra%hit any key to apply...%clr2%<nul& pause >nul)
if not defined dummy (call :CursorChange_clear & set /p nothing=[5;13H Applying... %clrgra%^(Do not close the Cursor Changer!^)%clr2%<nul)
call :Progress_bar_drawer 14 %a% 63 8 1
timeout /t 1 /nobreak >nul
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /ve /f /d "Windows Black" >nul
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
if not defined dummy (call :CursorChange_clear & set /p nothing=[5;13H Refreshing the Cursor...<nul)
call :Powersheller RefreshCursor & set a=
if not defined dummy (call :CursorChange_clear & set /p nothing=[5;13H Cursor Color changed to black.<nul& timeout /t 3 /nobreak >nul)
goto :CursorChange_afterchange

:CursorChange_afterchange
rem Determining whether or not to play reboot message depending on settings
reg query "HKEY_CURRENT_USER\Control Panel\Cursors" /v "" | find "Windows Black" >nul
if "%ErrorLevel%"=="0" (set cursorcolor=White)
if "%ErrorLevel%"=="1" (set cursorcolor=White)
reg query "HKEY_CURRENT_USER\Control Panel\Cursors" /v "" | find "Windows Default" >nul
if "%ErrorLevel%"=="0" (set cursorcolor=Black)
set cursorchangeexit=& exit /b



:CursorChange_main_backup
call :CursorChange_clear
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

:CursorChange_main_backup_loop
rem GUI Type 4
title Cursor Changer Backup
for /l %%i in (1,1,512) do ( if not "!cursorbackupexit!"=="true" (
if !backedupcount! lss 2 (echo [12;21H Cursor is not currently backed up.<nul) else (echo [12;24H Cursor is already backed up^^!)
if not defined dummy (set /p nothing=[?25l[H<nul)
if not defined dummy (
if not "!backupmenucurrent!"=="2" (if !backedupcount! lss 2 (set bumb2=%clrgra%))
echo                             Cursor Changer %batver%
echo.
echo           O=======================O==============================O
echo           I                       I         information          I
echo           I   !bumb1!1 : Backup/Restore!clr2!  I[30CI
echo           I                       I[30CI
echo           I   !bumb2!2 : Delete Backup !clr2!  I[30CI
echo           I                       I[30CI
echo           I   !bumb3!3 : Exit Menu     !clr2!  I[30CI
echo           I                       I[30CI
echo           O=======================O==============================O
echo           I[54CI
echo           O======================================================O
echo.
echo.
if "%wmodetoggle%"=="false" (set clrgra=[90m) & if "%wmodetoggle%"=="true" (set clrgra=[107m[38;2;140;140;140m)
echo              %clrgra%1~3 or W,S to select, Y,E to Confirm, B,N to exit.%clr2%
echo.
)
for /l %%i in (5,1,10) do (echo [%%i;36H                              )
if "!backupmenucurrent!"=="0" (echo [6;41H Nothing Selected.& echo [7;38H Please select something.& echo [9;38H %clrgra%[W,S] or [1~3] to select%clr2%)
if "!backupmenucurrent!"=="1" (echo [6;37H You can backup or restore& echo [7;39H Cursor registry keys.)
if "!backupmenucurrent!"=="2" (echo [6;39H You can delete current& echo [7;43H cursor backup.& if !backedupcount! lss 2 (set /p nothing=[9;38H %clrgra%Backup the Cursor first^^!%clr2%<nul))
if "!backupmenucurrent!"=="3" (echo [6;39H You can exit this menu& echo [7;39H without doing anything.)

choice /c 123wsyebn /n >nul
if !Errorlevel!==8 (set cursorbackupexit=true)
if !Errorlevel! geq 1 if !Errorlevel! leq 3 (set backupmenucurrent=!Errorlevel!)
if !backupmenucurrent!==0 (set backupmenucurrent=1& set bumb1=%clr%) else (
if !ErrorLevel!==4 (if not !backupmenucurrent!==1 (set /a backupmenucurrent-=1))
if !ErrorLevel!==5 (if not !backupmenucurrent!==3 (set /a backupmenucurrent+=1))
if !Errorlevel! geq 6 if !Errorlevel! leq 7 (call :CursorChange_main_backup_Core)
for /l %%i in (1,1,4) do (set bumb%%i=)
if "!backupmenucurrent!"=="2" (if !backedupcount! lss 2 (if "%wmodetoggle%"=="true" (set bumb2=%clr%[107m[48;2;180;180;180m) else (set bumb2=%clr%%clrgra%)) else (set bumb2=%clr%)) else (set bumb!backupmenucurrent!=%clr%)
)))
if "%cursorbackupexit%"=="true" (setlocal disabledelayedexpansion & call :CursorChange_main_backup_exit & cls & exit /b) else (set /p nothing=[0;0HLag spike :3<nul& goto :Cursor_Changer_REmenu_loop)

:CursorChange_main_backup_Core
rem Processing of Confirm key, like Y and E.
if "!backupmenucurrent!"=="0" (set backupmenucurrent=1& exit /b)
if "!backupmenucurrent!"=="1" (call :Cursor_Backupper)
if "!backupmenucurrent!"=="2" ( if !backedupcount! lss 2 (exit /b)
    for /l %%i in (4,1,12) do (set /p nothing=[%%i;12H                                                      <nul)
    set /p nothing=[3;35H=[11;11HI[11;66HI<nul
    echo [5;13H Are you sure you want to delete the current backup?<nul
    echo [7;13H %clrgra%^(Y or N^)%clr2%<nul
    choice /c YNB /n >nul
    if !ErrorLevel!==1 (
        for /l %%i in (4,1,12) do (set /p nothing=[%%i;12H                                                      <nul)
        echo [5;13H Deleting the current backup...<nul
        set backedupcount=0 & call :Cursor_Buckupper_Delete
        for /l %%i in (4,1,12) do (set /p nothing=[%%i;12H                                                      <nul)
        echo [5;13H Backup deleted^^!<nul
        timeout /t 2 /nobreak >nul
        exit /b
        ) else (exit /b)
    )
if "!backupmenucurrent!"=="3" (set cursorbackupexit=true& exit /b)
exit /b


:CursorChange_main_backup_exit
for /l %%i in (1,1,4) do (set bumb%%i=)
set backupmenucurrent=& set cursorbackupexit=& set backedupcount=
cls & exit /b




:Cursor_Backupper
set REGISTRY_KEY="HKEY_CURRENT_USER\Control Panel\Cursors"
for /l %%i in (4,1,12) do (set /p nothing=[%%i;12H                                                      <nul)
if not defined dummy (
set /p nothing=[3;35H=[11;11HI[11;66HI<nul
echo [5;13H Please select : 
echo [7;13H 1 : Save Cursor Settings & if "%backedupcount%" geq "2" (echo [7;39H%clrgra%^(Rewrite saved data^)%clr2%<nul)
echo [9;13H 2 : Restore Cursor Settings
echo [11;13H %clrgra%[1~2] to select. B to cancel.%clr2%
)
choice /c 12bn /n >nul
if %ErrorLevel%==1 (goto :Cursor_Backupper_Save)
if %ErrorLevel%==2 (goto :Cursor_Backupper_Restore)
if %Errorlevel% geq 3 if %Errorlevel% leq 4 (set REGISTRY_KEY= & exit /b)
exit /b

:Cursor_Backupper_Save
rem Registry names with two or more spaces cause problems in saving
rem Registry with some special characters causes problems
rem Initialize the output file if it exists
for /l %%i in (4,1,12) do (set /p nothing=[%%i;12H                                                      <nul)
if not defined dummy (echo [5;13H Saving registry keys to "%FirstSTFsfile%"...)
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
if not defined dummy (echo [5;13H Registry keys saved to "%FirstSTFsfile%".)
if not defined dummy (echo [7;13H %clrgra%^(Hit any key to continue...^)%clr2%& pause >nul)
set backedupcount=%count%
call :Cursor_Backupper_Exit & exit /b

:Cursor_Backupper_Restore
rem Check if there are at least 2 values to restore
if not "%1"=="Dynamic" (
if %backedupcount% lss 2 (
    for /l %%i in (4,1,12) do (set /p nothing=[%%i;12H                                                      <nul)
    if not defined dummy (echo [5;13H You have to save at least 2 values to restore^^!)
    if not defined dummy (echo [7;13H %clrgra%^(Hit any key to continue...^)%clr2%& pause >nul)
    call :Cursor_Backupper_Exit & exit /b
)
)

rem Restore the registry keys from the output file
if not "%1"=="Dynamic" (
for /l %%i in (4,1,12) do (set /p nothing=[%%i;12H                                                      <nul)
if not defined dummy (echo [5;13H Restoring registry keys from "%FirstSTFsfile%"...)
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
if not defined dummy (echo [5;13H Refreshing the Cursor...<nul)
call :Powersheller RefreshCursor
for /l %%i in (4,1,12) do (set /p nothing=[%%i;12H                                                      <nul)
if not defined dummy (echo [5;13H Restoration complete.)
if not defined dummy (echo [7;13H %clrgra%^(Hit any key to continue...^)%clr2%& pause >nul)
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




rem dogcheck. verify if %Settingsfile% exists
:Dogcheck
rem dogcheck, respect tobyfox and dog
rem AND I LOVE HIM 
title Cursor Changer ^| Dogcheck 
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
if %dogcheckcount% gtr 5 if %dogcheckcount% lss 7 (title Cursor Changer ^| Dogcheck respect tobyfox)
if %dogcheckcount% gtr 8 (title Cursor Changer ^| Dogcheck)
if %dogcheckcount% gtr 30 if %dogcheckcount% lss 32 (title Cursor Changer ^| dogrune chapter 1)
if %dogcheckcount% gtr 33 (title Cursor Changer ^| Dogcheck)
echo.
echo.
echo                     ██████████████████████████████
echo              ████████████████████████████████████████████
echo           █████████████████████████████████████████████████████████
echo           █████████   ███████   ███████████████████████████████████
echo        ████████████   ███████   ██████████████████████████████████████
echo        ████████████   ██████████   ███████████████████████████████████
echo        ████████████   ████         ██████████   ██████████████████████
echo        ███████████████████         ██████████   ██████████████████████
echo     ███████████████   ████   ███   ██████████      ███████████████████
echo        ████████████   ████   ███   ██████████      ███████████████████
echo        ████████████   ██████████   █████████████   ███████████████████
echo           ███████████████████   ██████████         █████████████████████████
echo           ███████████████████   ██████████         █████████████████████████
echo        █████████████████████████████████████████   ████████████████      ████████████
echo.
echo.
timeout /t 1 /nobreak >nul
cls
goto :dogcheckanimation1f

:dogcheckanimation1f
echo.
echo.
echo.
echo              ████████████████████████████████████████████
echo           █████████████████████████████████████████████████████████
echo           █████████   ███████   ███████████████████████████████████
echo        ████████████   ███████   ██████████████████████████████████████
echo        ████████████   ██████████   ███████████████████████████████████
echo        ████████████   ████         █████████████   ███████████████████
echo        ███████████████████         █████████████   ███████████████████
echo     ███████████████   ████   ███   █████████████      ████████████████      ███
echo        ████████████   ████   ███   █████████████      ████████████████      ███
echo        ████████████   ██████████   ████████████████   ████████████████      ███
echo           ███████████████████   █████████████         ██████████████████████
echo           ███████████████████   █████████████         ██████████████████████
echo        ████████████████████████████████████████████   █████████████
echo.
echo.
timeout /t 1 /nobreak >nul
cls
goto :dogcheckanimation0f
call :exit 0



rem uninstall (i mean its uninstall menu)
:Uninstall
if "%settinghelptoggle%"=="true" (goto :uninstallhelp)
cd /d %batchmainpath% 
find "nodogcheckfor1234567890qwertyuiop" %Settingsfile% >nul 2>&1
cls
if %ErrorLevel%==0 call :UninstallMenu & exit /b
if %ErrorLevel%==1 goto :Dogcheck
exit /b

:UninstallMenu
cls
mode con: cols=75 lines=22
rem GUI type 4
rem Preparing of Menu and Variables
if not defined dummy (set clr=[7m&set clrgra=[90m&set clrwhi=[97m&set clr2=[0m)
if "%wmodetoggle%"=="false" (set clr=[7m&set clrgra=[90m&set clrwhi=[97m&set clr2=[0m)
if "%wmodetoggle%"=="true" (set clr=[100m[97m&set clrgra=[107m[38;2;140;140;140m&set clrwhi=[30m&set clr2=[90m[107m[30m)
set UMsel=0
setlocal enabledelayedexpansion

:UninstallMenu_main
rem Draw Update Available UI
title Cursor Changer ^| Uninstall Menu
for /l %%i in (1,1,512) do if not "!UMexit!"=="true" (
if not defined dummy (set /p nothing=[0;0H[2K[?25l%clr2%<nul)
echo.
echo                                Uninstall Menu
echo                       O=============================O
call :UninstallMenu_Textdraw
echo                   O======================================O
echo                   I!UMcb1!       Uninstall Cursor Changer       %clr2%I
echo                   O======================================O
echo                   I!UMcb2!    Management Cursor Changer File    %clr2%I
echo                   O======================================O
echo                   I!UMcb3!         Exit Uninstall Menu          %clr2%I
echo                   O======================================O
echo.
echo             %clrgra%W,S or 1~3 to move, Y or E to select, B or N to exit.%clr2%

choice /c 123WSYEBN /n >nul
rem Processing of each move
if !Errorlevel! geq 8 if !Errorlevel! leq 9 (set UMexit=true)
if !Errorlevel! geq 1 if !Errorlevel! leq 3 (set UMsel=!Errorlevel!)
if !UMsel!==0 (set UMsel=1& set UMcb1=%clr%) else (
if !ErrorLevel!==4 (if not !UMsel!==1 (set /a UMsel-=1))
if !ErrorLevel!==5 (if not !UMsel!==3 (set /a UMsel+=1))
if !Errorlevel! geq 6 if !Errorlevel! leq 7 (
    set /p nothing=%clr2%<nul
    if !UMsel!==1 (call :UninstallMenu_Uninstall & cls)
    if !UMsel!==2 (call :UninstallMenu_Management & cls)
    if !UMsel!==3 (set UMexit=true)
    title Cursor Changer ^| Uninstall Menu)
for /l %%i in (1,1,3) do (set UMcb%%i=) & set UMcb!UMsel!=%clr%))
if "!UMexit!"=="true" (call :UninstallMenu_exit & exit /b
) else (set /p nothing=[0;0HLag spike :3<nul& goto :UninstallMenu_main)

:UninstallMenu_exit
rem initialize of variable
set UMexit=& set UMsel=& set UMcb1=& set UMcb2=& set UMcb3=
if not defined dummy (set /p nothing=[?25h<nul)
cls & mode con: cols=75 lines=25
setlocal disabledelayedexpansion
if "%Uninstall_Shutdown%"=="true" (set Uninstall_Shutdown=& call :exit 1) else (exit /b)

:UninstallMenu_Textdraw
rem draw texts
for /l %%i in (6,1,12) do (set /p nothing=[%%i;0H[0K<nul)
if not defined dummy (set /p nothing=[6;0H<nul)
if "%UMsel%"=="0" (
echo                        %clrwhi%Welcome to the Uninstall Menu.%clr2%
echo.
echo          In this menu, you can access into some uninstall features.
echo                   Select the feature that you wish to use.
echo.
echo           %clrgra%Currently, Nothing is selected. Please select something.%clr2%
) else if "%UMsel%"=="1" (
echo                           %clrwhi%Uninstall Cursor Changer%clr2%
echo.
echo         You can uninstall this batch ^(Cursor Changer^) in this feature.
echo                Several uninstallation options are also available.
) else if "%UMsel%"=="2" (
echo                       %clrwhi%Management Cursor Changer File%clr2%
echo.
echo             You can manage some Cursor Changer necessary file.
echo            like %Settingsfile%, and %FirstSTFsfile%.
) else if "%UMsel%"=="3" (
echo                              %clrwhi%Exit Uninstall Menu%clr2%
echo.
echo                Exit the Uninstall Menu without doing anything.
)
if not defined dummy (set /p nothing=[13;0H<nul)
exit /b

:UninstallMenu_Management
cls
title Cursor Changer ^| Management Files
echo Management of Cursor Changer files
echo.
echo In this feature, you can check or show Cursor Changer files.
echo Please select the feature from blow.
echo.
echo 1 : Open the %Settingsfile% in notepad
echo 2 : Open the %FirstSTFsfile% in notepad
echo 3 : Open in Explorer where the file is located
echo 4 : Initialize the Setting file
echo 5 : Exit this feature
echo.
set /p selected=Input :
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
echo Setting file will open...
start notepad.exe %Settingsfile%
timeout /t 1 /nobreak >nul
exit /b

:UninstallMenu_Management_OpenFSTFSF_inNotepad
cls
echo FistSTFs file will open...
start notepad.exe %FirstSTFsfile%
timeout /t 1 /nobreak >nul
exit /b

:UninstallMenu_Management_OpenSetting
cls
echo Cursor Changer files path will open...
start explorer %batchmainpath%
timeout /t 2 /nobreak >nul
exit /b


:UninstallMenu_Management_InitializeSetting
cls
echo This feature initializes the settings. (All settings will be at their default values).
echo Anything you have set up so far will disappear.
echo Do you really want to initialize? (Y or N)
choice /c yn /n /m ""
if %ErrorLevel%==1 goto :UninstallMenu_Management_InitializeSetting_ask
if %ErrorLevel%==2 goto :UninstallMenu_Management_InitializeSetting_ask_no
cls
goto :UninstallMenu_Management_InitializeSetting

:UninstallMenu_Management_InitializeSetting_ask
echo Are you sure? (Y or N)
choice /c yn /n /m ""
if %ErrorLevel%==1 goto :UninstallMenu_Management_InitializeSetting_ask_yes
if %ErrorLevel%==2 goto :UninstallMenu_Management_InitializeSetting_ask_no
cls
goto :UninstallMenu_Management_InitializeSetting_ask

:UninstallMenu_Management_InitializeSetting_ask_yes
echo Initializes the setting file. All previous settings will be deleted.
echo If you wish to cancel, exit the Cursor Changer at this point.
pause
cls
call :Wipealldeta
title Cursor Changer ^| Setting initialize is complete
echo Initialization is complete. Restart Cursor Changer to apply changes. press any key to reboot...
pause >nul
set UMexit=& set UMsel=& set UMcb1=& set UMcb2=& set UMcb3=& set clrgra=& set Uninstall_Shutdown=
call :rebootbatch
exit /b

:UninstallMenu_Management_InitializeSetting_ask_no
cls
echo Settings were not initialized.
pause
exit /b


:UninstallMenu_Uninstall
cls
mode con: cols=72 lines=21
rem GUI type 4
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
setlocal enabledelayedexpansion

:UninstallMenu_Uninstall_main
rem Draw Update Available UI
title Cursor Changer ^| Uninstall Cursor Changer
for /l %%i in (1,1,512) do if not "!UMUexit!"=="true" ( set /p nothing=[0;0H[2K[?25l%clr2%<nul
if not %backedupcount% geq 2 (if defined UMUcb2 (if "%wmodetoggle%"=="true" (set clrgra=[107m[48;2;180;180;180m) else (set clrgra=[90m))) else (set clrgra=)
echo.
echo                          Uninstall Cursor Changer
echo.
echo.          O==================================================O
echo           I                                                  I
echo           I             Cursor Changer Unistaller            I
echo           I                                                  I
echo           I[50CI
echo           I[50CI
echo           I                                                  I
echo           I   O==========================================O   I
echo           I   I!UMUcb1!       Uninstall this batch normaly       %clr2%I   I
echo           I   O==========================================O   I
echo           I   I!UMUcb2!!clrgra! Uninstall and Restore Cursor from backup %clr2%I   I
echo           I   O==========================================O   I
echo           I                                                  I
echo           O==================================================O
echo.
set clrgra=[90m& if "%wmodetoggle%"=="false" (set clrgra=[90m) & if "%wmodetoggle%"=="true" (set clrgra=[107m[38;2;140;140;140m)
echo           %clrgra%W,S or 1~2 to move, Y or E to select, B or N to exit.%clr2%
echo.
call :UninstallMenu_Uninstall_Textdraw

choice /c 12WSYEBN /n >nul
rem Processing of each move
if !Errorlevel! geq 7 if !Errorlevel! leq 8 (set UMUexit=true)
if !Errorlevel! geq 1 if !Errorlevel! leq 2 (set UMUsel=!Errorlevel!)
if !UMUsel!==0 (set UMUsel=1& set UMUcb1=%clr%) else (
if !ErrorLevel!==3 (if !UMUsel!==2 (set UMUsel=1))
if !ErrorLevel!==4 (if !UMUsel!==1 (set UMUsel=2))
if !Errorlevel! geq 5 if !Errorlevel! leq 6 ( set /p nothing=%clr2%<nul
    if !UMUsel!==1 (setlocal disabledelayedexpansion & call :UninstallMenu_Uninstall_Confirm 1 & cls & setlocal enabledelayedexpansion)
    if !UMUsel!==2 (setlocal disabledelayedexpansion & call :UninstallMenu_Uninstall_Confirm 2 & cls & setlocal enabledelayedexpansion)
    title Cursor Changer ^| Uninstall Cursor Changer))
for /l %%i in (1,1,3) do (set UMUcb%%i=) & set UMUcb!UMUsel!=%clr%)
if "!UMUexit!"=="true" (call :UninstallMenu_Uninstall_exit & exit /b
) else (set /p nothing=[0;0HLag spike :3<nul& goto :UninstallMenu_Uninstall_main)

:UninstallMenu_Uninstall_exit
rem initialize of variable
set UMUexit=& set UMUsel=& set UMUcb1=& set UMUcb2=
mode con: cols=75 lines=22
setlocal disabledelayedexpansion
exit /b

:UninstallMenu_Uninstall_Textdraw
for /l %%i in (8,1,9) do (set /p nothing=[%%i;12H                                                  <nul)
if %UMUsel%==0 (set /p nothing=[8;16HPlease select how to uninstall this batch.[9;19HB or N to cancel the uninstallation.<nul)
if %UMUsel%==1 (set /p nothing=[8;21HYou can uninstall Cursor Changer.[9;18HDelete setting files, and batch itself.<nul)
if %UMUsel%==2 (set /p nothing=[8;19HUninstall Cursor Changer, and restore[9;21HYour cursor settings from backup.<nul)
if not defined dummy (set /p nothing=[22;0H<nul)
exit /b


:UninstallMenu_Uninstall_isCursorSaved
if %backedupcount% geq 2 (exit /b 0)
title Cursor Changer ^| You must save Cursor!
echo.
echo                          Uninstall Cursor Changer
echo.
echo         O======================================================O     
echo         I                                                      I
echo         I       %clrwhi%You must save Cursor to use this feature!%clr2%      I
echo         I                                                      I
echo         I         Cursor is seems to be not backed up!         I
echo         I   Please backup it. or Please select other option.   I
echo         I                                                      I
echo         I               %clrgra%(Hit any key to Exit...)%clr2%               I
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
rem GUI type 4
rem Preparing of Menu and Variables
if not defined dummy (set clr=[7m&set clrgra=[90m&set clrwhi=[97m&set clred=[91m&set clr2=[0m)
if "%wmodetoggle%"=="false" (set clr=[7m&set clrgra=[90m&set clrwhi=[97m&set clred=[91m&set clr2=[0m)
if "%wmodetoggle%"=="true" (set clr=[100m[97m&set clrgra=[107m[38;2;140;140;140m&set clrwhi=[30m&set clred=[91m&set clr2=[90m[107m[30m)
set UOCsel=0
setlocal enabledelayedexpansion

:UninstallMenu_Uninstall_Confirm_main
rem Draw Update Available UI
title Cursor Changer ^| Confirmation of Uninstall
for /l %%i in (1,1,512) do if not "!UOCexit!"=="true" if not "!UOCexit!"=="3true" ( set /p nothing=[0;0H[2K[?25l%clr2%<nul
if not "!UOCsel!"=="0" if not "!UOCsel!"=="1" (set UOCcb2=[48;2;214;174;174m[30m)
echo.
echo                          Uninstall Cursor Changer
echo.
echo         O======================================================O     
echo         I                                                      I
echo         I               Confirmation of Uninstall              I
echo         I                                                      I
call :UninstallMenu_Uninstall_Confirm_DrawText
echo         I                                                      I
echo         I        O============O      %clred%O================O%clr2%        I
echo         I        I!UOCcb1! No, Cancel %clr2%I      %clred%I%clr2%!UOCcb2! Yes, Uninstall %clr2%%clred%I%clr2%        I
echo         I        O============O      %clred%O================O%clr2%        I
echo         I                                                      I
echo         O======================================================O
echo.
echo           %clrgra%A,D or 1~2 to move, Y or E to select, B or N to exit.%clr2%

choice /c 12ADYEBN /n >nul
rem Processing of each move
if !Errorlevel! geq 7 if !Errorlevel! leq 8 (if !UOCsel!==3 (set UOCsel=2) else (set UOCexit=true))
if !Errorlevel! geq 1 if !Errorlevel! leq 2 (set UOCsel=!Errorlevel!)
if !UOCsel!==0 (set UOCsel=1& set UOCcb1=%clr%) else (
if !ErrorLevel!==3 (if !UOCsel!==1 (set UOCsel=1) else if !UOCsel!==2 (set UOCsel=1) else (set UOCsel=1))
if !ErrorLevel!==4 (if !UOCsel!==1 (set UOCsel=2) else if !UOCsel!==2 (set UOCsel=2) else (set UOCsel=2))
if !Errorlevel! geq 5 if !Errorlevel! leq 6 ( set /p nothing=%clr2%<nul
    if !UOCsel!==1 (set UOCexit=true)
    if !UOCsel!==2 (set UOCsel=3) else if !UOCsel!==3 (set UOCexit=3true)))
if not "!UOCsel!"=="3true" (set UOCcb1=& set UOCcb2=& set UOCcb!UOCsel!=%clr%))
if "!UOCexit!"=="true" (call :UninstallMenu_Uninstall_Confirm_exit & exit /b
) else if not "!UOCexit!"=="2true" if not "!UOCexit!"=="3true" (set /p nothing=[0;0HLag spike :3<nul& goto :UninstallMenu_Uninstall_Confirm_main) else (goto :UninstallExecution)

:UninstallMenu_Uninstall_Confirm_exit
rem initialize of variable
set UOCexit=& set UOCsel=& set UOCcb1=& set UOCcb2=& set clred=& set Uninstall_way=
setlocal disabledelayedexpansion
exit /b

:UninstallMenu_Uninstall_Confirm_DrawText
if not "%UOCsel%"=="3" ( 
echo         I   Do you really want to uninstall Cursor Changer?    I
echo         I   If you uninstalled it, you'll need to Reinstall    I
echo         I  to use this batch again. and it cannot be undone^^!   I
exit /b
) else if "%UOCsel%"=="3" (
echo         I                 %clrwhi%Are you really sure?%clr2%                 I
echo         I                                                      I
echo         I                                                      I
exit /b
)


:UninstallExecution
cls
echo.
echo                          Uninstall Cursor Changer
echo.
echo          O======================================================O     
echo          I                                                      I
echo          I   %clrgra%Hit any key to execute uninstall...%clr2%                I
echo          I                                                      I
echo          I                                                      I
echo          I                                                      I
echo          O======================================================O
pause >nul
for /l %%i in (5,1,9) do (set /p nothing=[%%i;11H                                                      <nul)
if not defined dummy (set /p nothing=[6;13H Uninstalling... %clrgra%^(DO NOT close the batch!^)%clr2%<nul)
timeout /t 1 /nobreak >nul

rem Uninstall menu exception handling FIrstCursor in the absence of FIrstCursor. But it is redundant and I want to improve it.
rem I want to add more exception handling. For example, if the message is never possible without modifying the contents, it should be able to do a goto, branch on a variable, and change the message.
cd /d %batchmainpath%
if not exist %FirstSTFsfile% if exist %Settingsfile% set erroruninstallwhatdelete=%FirstSTFsfile%& call :BSOD_Errors 3
if exist %FirstSTFsfile% if not exist %Settingsfile% set erroruninstallwhatdelete=%Settingsfile%& call :BSOD_Errors 3
if not exist %FirstSTFsfile% if not exist %Settingsfile% set "erroruninstallwhatdelete=%FirstSTFsfile% and %Settingsfile%, both" & call :BSOD_Errors 3
goto :uninstallnow


:BSOD_Errors
if not defined dummy (set bsod_errors_clrforsad=[44m[7m&set bsod_errors_clrforsad2=[0m[44m[97m)
for /f "tokens=6 delims=.] " %%i in ('ver') do set bsodwinver=%%i
set runningfromfulldebug=& set FromREConsole=

rem message indication
timeout /t 1 /nobreak >nul
cls
if "%1"=="" (goto :BSOD_Errors_Error) else if "%1"=="BatBootErrorHandlerArgument1908␍␊" (goto :BSOD_Errors_Error)
if "%2"=="" (set bsoderrorlevel=Undefined) else (set bsoderrorlevel=%2)
if "%1"=="THERE_IS_NO_PROBLEMS" (goto :BSOD_Errors_NOERRORS)
set DynamicWinverCheck=true& call :batbootcheckwinver dynamic & set DynamicWinverCheck=
if "%errorlevel%"=="1" (call :BSOD_Errors_OG %1) else (set /p nothing=[?25l<nul)
title Cursor Changer ^| CRASHED!
mode con: cols=97 lines=25
rundll32 user32.dll,MessageBeep || echo 
if not defined dummy (set /p nothing=[97m[48;2;0;61;146m[2J<nul)
echo.
echo.
call :BSOD_Errors_RANDOMFACEHAHA
echo.
echo.
echo          Oops! The Cursor Changer has Crashed!
echo.
echo          This screen is displayed when Cursor Changer crashes for some reason.
echo          The following information may be helpful in obtaining support.
echo.
echo          Batch Version : %batver% (%batbuild%)
echo          Windows Build : %bsodwinver%
echo          Error ID      : %1
echo          Error Level   : %bsoderrorlevel%
echo.
echo          For more information about this screen and possible fixes, visit this link:
echo.
echo          https://github.com/tamago1908/Cursor-Changer.bat/wiki/BSOD-Crash-(Error-Screen)
echo.

if %1 geq 0 if %1 leq 6 (goto :BSOD_Errors%1message) else (goto :BSOD_Errors_Error)


:BSOD_Errors0message
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"An unknown critical error has occurred!\", 'CRITICAL ERROR', 'OK', 'Warning');Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"Error Description : Unknown error occurred. Error ID : 0\", 'Error', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"In most cases, this is due to a serious mistake caused by a syntax error by the developer. (like syntax error.)\", 'Error', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"Please check your environment, security software, etc., and try again where the error occurred.\", 'What Should I Do?', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"If the error still occurs, please report it in a github issue.\", 'Error', 'OK', 'None')"
goto :BSOD_ErrorsRorR

:BSOD_Errors1message
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"An critical error has occurred!\", 'CRITICAL ERROR', 'OK', 'Warning');Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"Error Description : Unknown error occurred. Error ID : 1\", 'Error', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"This error occurs with an unexpected Exit /b or an invalid subroutine, or goto :or call to a label that does not exist, etc. \", 'Error', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"Please check your environment, security software, etc., and try again where the error occurred.\", 'What Should I Do?', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"If the error still occurs, please report it in a github issue.\", 'Error', 'OK', 'None')"
goto :BSOD_ErrorsRorR

:BSOD_Errors2message
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"Error occurred in SAB_Manager!\", 'CRITICAL ERROR', 'OK', 'Warning');Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"Error Description : The value of the variable wantload which is required when calling SAB_Manager, is an invalid value. %wantload% Error ID : 2\", 'Error', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"This error rarely occurs. However, it can occur when using some development or recovery function.\", 'Error', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"Please check your environment, security software, etc., and try again where the error occurred.\", 'What Should I Do?', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"If the error still occurs, please report it in a github issue.\", 'Error', 'OK', 'None')"
goto :BSOD_ErrorsRorR

:BSOD_Errors3message
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"Error occurred during uninstallation!\", 'CRITICAL ERROR', 'OK', 'Warning');Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"Error Description : A file that should be present when performing uninstallation is not present! Error ID : 3\", 'Error', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"Please check your environment, security software, etc., and try again where the error occurred.\", 'What Should I Do?', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"If the error still occurs, please report it in a github issue.\", 'Error', 'OK', 'None')"


:BSOD_Errors3message3message
cls
color 04
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"Well, actually it was you who deleted %erroruninstallwhatdelete% Right?\", '', [System.Windows.Forms.MessageBoxButtons]::'Yesno', 'Question');exit $result;"
if "%errorlevel%"=="6" (goto :BSOD_Errors3message3messageok)
if "%errorlevel%"=="7" (goto :BSOD_Errors3message3messageno)
goto :BSOD_Errors3message3message

:BSOD_Errors3message3messageok
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"I knew it ^>:^)\", '', 'OK', 'None')
goto :BSOD_ErrorsRorR

:BSOD_Errors3message3messageno
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"Oh really? well, if you didnt delete the file but this error happen, Please check your environment, security software, etc., and try again where the error occurred.\", 'Error?', 'OK', 'None');Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"If the error still occurs, please report it in a github issue.\", 'Error?', 'OK', 'None')"
goto :BSOD_ErrorsRorR


:BSOD_Errors4message
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"OMG UR SYSTEM HAS BEEN DESTROYED!!!!!!!!!!!\", 'OMG', 'OK', 'Warning');Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"Error Description : UR SYSTEM HAS BEEN FUCKING DESTORYED LIKE A TRASH!!! Error ID : 9999999\", 'Error', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"This error IS JUST TELLING UR SYSTEM HAS BEEN DESTROYED SO THERE IS NOTHING TO DO!!\", 'Error', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"BUY NEW PC AND JUST SHUT UP!!!\", 'What Should I Do?', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"If the error still occurs, JUST STOP TYPING EGG1!!!! U KNOW WHY THIS ERROR HAPPEN\", 'Error', 'OK', 'None')"
goto :BSOD_ErrorsRorR

:BSOD_Errors5message
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"Critical Argument Error has occurred!\", 'CRITICAL ERROR', 'OK', 'Warning');Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"Error Description : Batch reserved arguments were used as user arguments! Error ID : 5\", 'Error', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"This error occurs when the user runs cmd directly with arguments for this batch.\", 'Error', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"Do not execute with reserved arguments.\", 'What Should I Do?', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"If the error still occurs, please report it in a github issue.\", 'Error', 'OK', 'None')"
goto :BSOD_ErrorsRorR

:BSOD_Errors6message
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"Critical Error occurred at ErrorHandler!\", 'CRITICAL ERROR', 'OK', 'Warning');Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"Error Description : An Critical error occurred at ErrorHandler! Error ID : 6\", 'Error', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"This error can occur for a variety of reasons. For example, an incorrect batch name, the use of Ctrl+C, or improper startup. or unknown errors.\", 'Error', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"Try reinstalling Cursor Changer, check powershell and the name of this batch, or start the batch from the desktop. or just don't do something stupid.\", 'What Should I Do?', 'OK', 'None')";Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"If the error still occurs, please report it in a github issue.\", 'Error', 'OK', 'None')"
goto :BSOD_ErrorsRorR


:BSOD_Errors_Error
cls
echo BSOD_Errors is called with invalid way!
pause
if not defined dummy (set /p nothing=[?25h<nul)
if "%wmodetoggle%"=="true" (color f0) else (color 07)
exit /b


:BSOD_ErrorsRorR
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"Press [Yes] to reboot Cursor Changer at this point, or [No] to Reboot as the recovery menu.\", 'Witch one?', [System.Windows.Forms.MessageBoxButtons]::'Yesno', 'Question');exit $result;"
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
rem :(
if not defined dummy (echo [16C▐█& echo [09C█▌[4a█▌& echo [15C█▌& echo [09C█▌[4a█▌& echo [16C▐█)
exit /b
:bsod_errors_RANDOMFACEHAHA2
rem :)
if not defined dummy (echo [13C▐█& echo [09C█▌[4a█▌& echo [15C█▌& echo [09C█▌[4a█▌& echo [13C▐█)
exit /b
:bsod_errors_RANDOMFACEHAHA3
echo.
echo                                     ====OPEN====THIS====LINK====
echo   https://github.com/tamago1908/Cursor-Changer.bat/blob/main/resource/it's just qr.png?raw=true
echo.
echo.
exit /b


:BSOD_Errors_OG
rem Alternative version of BSOD displayed when Windows version is not supported
rundll32 user32.dll,MessageBeep || echo 
color 07
title Cursor Changer ^| CRASHED!
echo.
echo [ERROR] Cursor Changer has Crashed!
echo.
echo Error information : 
echo.
echo Cursor Changer Version  : %batver% (%batbuild%)
echo Windows Build           : %bsodwinver%
echo Error ID                : %1
echo Errorlevel              : %bsoderrorlevel%
echo.
echo It appears that you are using a version of Windows
echo that is not supported by the Cursor Changer!
echo This crash is very likely caused by that.
echo To avoid the crash, please use a supported version of Windows.
echo.
echo Press any key to exit...
echo.
pause >nul
if "%wmodetoggle%"=="true" (color f0) else (color 07)
call :exit 1


:BSOD_Errors_NOERRORS
mode con: cols=97 lines=25
rundll32 user32.dll,MessageBeep || echo 
if not defined dummy (set /p nothing=[97m[48;2;0;61;146m[2J<nul)
rem Your Cursor Changer is running perfectly fine :)
title Cursor Changer ^| NOT CRASHED!
echo.
echo.
call :bsod_errors_RANDOMFACEHAHA2
echo.
echo.
echo          Woah! The Cursor Changer is working without problems!
echo.
echo          This screen is displayed when Cursor Changer is okey with no problems whatsoever.
echo          The following information may be helpful to know Cursor Changer is okey :D
echo.
echo          Batch Version : I don't know
echo          Windows Build : I have no idea
echo          Error ID      : %1
echo          Error Level   : What?
echo.
echo          For more information about this screen and possible fixes, visit this link:
echo.
echo          https://www.youtube.com/watch?v=dQw4w9WgXcQ
echo.
echo          Hit any key to Continue...
pause >nul
if "%wmodetoggle%"=="true" (color f0) else (color 07)
exit /b



rem Discriminate between uninstall menu selections
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
title Cursor Changer ^| Good bye!
for /l %%i in (5,1,9) do (set /p nothing=[%%i;11H                                                      <nul)
if not defined dummy (set /p nothing=[6;13H Uninstall Complete![8;13H %clrgra%^(Hit any key to continue...^)%clr2%<nul)
pause >nul
for /l %%i in (5,1,9) do (set /p nothing=[%%i;11H                                                      <nul)
if not defined dummy (set /p nothing=[6;13H Goodbye for now, %YourName%![8;13H %clrgra%^(Hit any key to continue...^)%clr2%<nul)
pause >nul
rem Get own path, delete own
>nul 2>&1 del "%~dp0%~n0%~x0" & taskkill /pid %PID% >nul & exit




:DEATHEASTEREGG
rem :(
set "Mainmenubuild=[0;22HMy version shouldn't be like this."
exit /B



:1908hell
rem Test Functions and Easter Eggs
cls
set eggloop=0
:loop1908
set /a eggrandom=%random%*5/32767
title Cursor Changer ^| %eggloop%

if "%eggrandom%"=="0" (echo 1908 :D)
if "%eggrandom%"=="1" (echo 1908 :P)
if "%eggrandom%"=="2" (echo 1908 xD)
if "%eggrandom%"=="3" (echo 1908 :C)
if "%eggrandom%"=="4" (echo 1908 :O)
set /a eggloop=eggloop+1
if %eggloop% gtr 1908 (pause&echo 1 9 0 8 :D :D :D :D :D :D&pause&goto :Mainmenuboot)
goto :loop1908

:developermenu
title Cursor Changer ^| devloper menu
echo axolotl is my best friend
pause
exit /b

:Hello_World
rem Hello world!! Yippeeeee :D
cls
for /l %%i in (1,1,1000) do (
    title Cursor Changer ^| Hello world!! ^(%%i / 1000^)
    set /p nothing=Hello world!! <nul
    pathping 127.0.0.1 -n -q 1 -p 0 1>nul
)
echo.& echo HELLO WORLD!!! (hit any key to exit...)
pause >nul
exit /b


:AllLabelList
cls
title Cursor Changer ^| All label list
echo All label list :
set count=0
call :Core_Powershell 4 1000
for /f "tokens=1 delims=:" %%a in ('findstr /r "^:[a-zA-Z0-9_]*" "%~dp0%~n0%~x0"') do (echo :%%a& set /a count+=1)
echo.& echo Number of label : %count%& pause
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
if "%allcommandlock%"=="true" (goto :Mainmenuboot) else if "%allcommandlock%"=="false" (goto :allcommandsmain)
title Cursor Changer ^| Please Enter the passcode! (hint : developer name)
setlocal enabledelayedexpansion
if not defined dummy (set /p nothing=[?25l<nul)
mode con: cols=75 lines=25
set "input=" & set len=0& set allcommands_exit=false

:allcommands_loop
for /l %%i in (1,1,512) do if "!allcommands_exit!"=="false" (
rem draw UI
if "%wmodetoggle%"=="true" (set /p nothing=[37m<nul)
if not defined dummy (set /p nothing=[0;0H[2K<nul
echo [10;25H[44m┌───  Enter  Passcode ───┐ [0m
echo [11;25H[44m│                        │ [0m
echo [12;25H[44m│ ┃[0m                    ┃[44m │ [0m
echo [13;25H[44m│                        │ [0m
echo [14;25H[44m└────────────────────────┘ [0m
echo [15;25H[44m  B=Delete Y=Enter E=Exit  [0m
)
if "!input!" neq "" (if !len! equ 19 (set /p nothing=[12;29H!input![?25l<nul) else (set /p nothing=[12;29H!input![?25h<nul))
if not defined input (set /p nothing=[12;29H[?25h<nul)
if "%wmodetoggle%"=="true" (set /p nothing=[107;30m<nul)
choice /c:0123456789bye /n >nul& set num=!errorlevel!
if not defined dummy (set /p nothing=[?25l<nul)
rem Check inputs
if !num! neq 0 set /a num=num-1
if !num!==10 if "!input!" neq "" set input=!input:~0,-1!& set /a len=len-1
if !num!==11 if "!input!"=="1908" (echo [17;30HCorrect passcode.& timeout /t 2 /nobreak >nul& set /p nothing=[?25h<nul& set invisiblecursor=& set input=& set len=& set allcommandlock=false& set allcommands_exit=correct) else (echo [17;10HWrong password. You need restart the batch to try again.& timeout /t 3 /nobreak >nul& set input=& set len=0& set allcommandlock=true& set allcommands_exit=true)
if !num!==12 (set /p nothing=[?25h<nul& set invisiblecursor=& set input=& set len=& set allcommands_exit=true)
if !num! lss 10 if not defined input (set "input=!num!"& set "len=1") else if not !len! gtr 18 set input=!input!!num!& set /a len=len+1)
if "!allcommands_exit!"=="false" (set /p nothing=[0;0HLag spike :3<nul& goto :allcommands_loop
) else (if "!allcommands_exit!"=="true" (setlocal disabledelayedexpansion& set allcommands_exit=& goto :mainmenu) else (if "!allcommands_exit!"=="correct" (setlocal disabledelayedexpansion& set allcommands_exit=& goto :allcommandsmain)))

:allcommandsmain
title Cursor Changer ^| All Commands
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
call :Core_Powershell 4 64
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
set /p nothing=%clred%^/^/%clr2%[Type something to back to menu...]                              %clrgra%%batver%%clr2% <nul&pause >nul
set clrcyan=& set clrgra=& set clred=& set clrgrn=& set clryel=& set clrmag=
if "%batargmentonly%"=="true" (set batargmentonly=& if exist %Settingsfile% (if not "%linuxboot%"=="true" (cls & echo Starting Cursor Changer...& exit /b) else (exit /b)) else (cls & echo Preparing Setup...& exit /b))
goto :Mainmenu


:fulldebug
setlocal disabledelayedexpansion
set selected=
if defined fulldebug (goto :fulldebugmain)
cls
echo.
echo                                  !Warning!
echo.
echo This feature was created for developers. If you are not a developer, it may cause some bugs or problems.
echo If you still want to use this feature, type "y".
echo If you want to go back or cancel, type "n".
echo Once you enter "y", this message will not appear again unless you restart this batch directly or delete the "fulldebug" variable.
set /p selected=Y or N : 
if %selected%==n goto :Mainmenu
if %selected%==y set fulldebug=true
if %selected%== echo what? "Y" or "N".&pause&goto :fulldebug

:fulldebugmain
set fulldebugsetvariable=
set fulldebugvariableapply=
title Cursor Changer ^| ^(for debug^) cursor variable
echo.
echo start up fulldebug...
call :Core_Powershell 4 150
cls
:fulldebugtypevariable
set fulldebugsetvariable=
set fulldebugvariableapply=
set
set /p fulldebugsetvariable=Enter the variable to change :
if "%fulldebugsetvariable%"=="back" (goto :Mainmenu)
if "%fulldebugsetvariable%"=="exit" (goto :Mainmenu)
if "%fulldebugsetvariable%"=="help" (echo goto&echo set&echo run&echo help&echo back&pause&cls&set fulldebugsetvariable=&goto :fulldebugtypevariable)
if "%fulldebugsetvariable%"=="goto" (goto :fulldebuggoto)
if "%fulldebugsetvariable%"=="set" (goto :fulldebugsetnew)
if "%fulldebugsetvariable%"=="run" (goto :fulldebugrun)
if "%fulldebugsetvariable%"=="" (cls&goto :fulldebugtypevariable)
if not defined %fulldebugsetvariable% (echo %fulldebugsetvariable% is not exist. please type exist variable or create it. &pause&cls&goto :fulldebugtypevariable)
set /p fulldebugvariableapply=%fulldebugsetvariable%^=
if "%fulldebugvariableapply%"=="back" (goto :fulldebugerrorsetnew1)
if "%fulldebugvariableapply%"=="" (goto :fulldebugerrorsetvariable1)
set %fulldebugsetvariable%=%fulldebugvariableapply%
echo %fulldebugsetvariable%^=%fulldebugvariableapply% Changed.
pause
cls
goto :fulldebugtypevariable

:fulldebuggoto
set fulldebugsetvariable=
set /p fulldebugsetvariable=goto where? :
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
echo A nonexistent label was specified.
echo ^(or almost goto a nonexistent label... ^). 
echo Please specify a label that exists.
pause
  )
 )
cls
goto :fulldebuggoto

:fulldebugsetnew
cls
set fulldebugsetvariable=
set fulldebugvariableapply=
set /p fulldebugsetvariable=Enter the currently undefined variable you wish to create.  :
if defined %fulldebugsetvariable% (echo %fulldebugsetvariable% is already exist. please type not exist variable. &pause&cls&goto :fulldebugsetnew)
if "%fulldebugsetvariable%"=="back" (goto :fulldebugtypevariable)
if "%fulldebugsetvariable%"=="" (echo please enter something.&pause&cls&goto :fulldebugsetnew)
:fulldebugsetnewenter
set /p fulldebugvariableapply=%fulldebugsetvariable%^=
if "%fulldebugvariableapply%"=="" (echo You cannot create a variable with no content. &pause&cls&goto :fulldebugsetnewenter)
if "%fulldebugvariableapply%"=="back" (goto :fulldebugerrorsetnew1)
set %fulldebugsetvariable%=%fulldebugvariableapply%
echo variable %fulldebugsetvariable% has created with %fulldebugvariableapply% (%fulldebugsetvariable%^=%fulldebugvariableapply%).
pause
cls
goto :fulldebugtypevariable

:fulldebugerrorsetnew1
set /p fulldebugsetvariableerrornew=Exit menu or set as variable? (1 or 2) : 
if "%fulldebugsetvariableerrornew%"=="1" (goto :fulldebugtypevariable)
if "%fulldebugsetvariableerrornew%"=="2" (goto :fulldebugerrorsetnew1if)
:fulldebugerrorsetnew1if
set %fulldebugsetvariable%=back
echo variable %fulldebugsetvariable% has created with %fulldebugvariableapply% (%fulldebugsetvariable%^=%fulldebugvariableapply%).
pause
cls
goto :fulldebugtypevariable


:fulldebugerrorsetvariable1
set /p fulldebugsetvariableerrorif=do you really want delete %fulldebugsetvariable%? (y or n)
if "%fulldebugsetvariableerrorif%"=="y" (
set %fulldebugsetvariable%=
echo %fulldebugsetvariable% has deleted.
pause
cls
goto :fulldebugtypevariable
)
if "%fulldebugsetvariableerrorif%"=="n" (goto :fulldebug)


:fulldebugrun
cls
set fulldebugrun=
set /p fulldebugrun=Enter the command that you wish to run. :
if "%fulldebugrun%"=="" (echo please enter valid command that you with to run. ^(like echo^)& pause & goto :fulldebugrun)
if "%fulldebugrun%"=="back" (set fulldebugrun=& goto :fulldebugtypevariable)
if "%fulldebugrun%"=="b" (set fulldebugrun=& goto :fulldebugtypevariable)
%fulldebugrun% || echo That command is unvalid command or include misses.
echo.
pause
set fulldebugrun=
goto :fulldebugtypevariable


:littleeasteregg
if "%Mainmenueaster%"=="true" (goto :Mainmenu)
cls&pause&echo hello! this is easteregg!&pause&cls&title Cursor Changer ^| Now you can see the build num at title Cursor Changer ^|&echo and bye!&pause&cls&set Mainmenueaster=true&goto :Mainmenuboot




:Rebootbatch
PowerShell -WindowStyle Hidden -Command Exit
if "%1"=="1" (start "Cursor Changer" conhost.exe cmd.exe /c ^"%~dp0%~n0%~x0^" recovery& call :exit 0) else (start "Cursor Changer" conhost.exe cmd.exe /c ^"%~dp0%~n0%~x0^"& call :exit 0)

:exit
if "%1"=="1" (echo Shutting Down...)
if "%1"=="2" (call :PowerScreen)
powershell -command "$pid1 = Get-WmiObject win32_process -filter processid=$pid | ForEach-Object{$_.parentprocessid;}";$pid2 = "Get-WmiObject win32_process -filter processid=$pid1 | ForEach-Object{$_.parentprocessid;}";exit $pid2"
>nul 2>&1 taskkill /pid %errorlevel% >nul
exit
:reboot


rem Are you serious?
rem Anyways, congratulations. you readed all of codes.
rem Don't you have anything better to do?