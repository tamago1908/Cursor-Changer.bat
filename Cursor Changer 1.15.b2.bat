@echo off & setlocal
rem Specify size and change codepage to UTF-8
chcp 65001>nul || (echo Your computer doesn't support UTF-8!& echo.& echo Cursor Changer require UTF-8.& echo Press any key to exit...& pause > nul & exit)
mode con: | find "75" >nul && mode con: | find "25" >nul
if "%errorlevel%"=="1" (mode con: cols=75 lines=25& set boottime1=%time%& set batbeta=& set updateavailable=& set updatemyversion=& set updateversion=)
if "%batbootargumentbad%"=="false" (title Cursor Changer ^| Preparing...) else if not "%1"=="BatBootErrorHandlerArgument1908" (title Cursor Changer)
if not defined dummy (set /p nothing=[?25h<nul)

rem add "true" if you want to bypass windows version check (bypasswinvercheck=true)
rem O======================O
set bypasswinvercheck=
rem O======================O

rem Cursor Changer by tamago_1908
rem English version.

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



rem environment setting, It is not recommended to change.
rem VER v1.15β2
set batver=1.15β2
set batbuild=Build 111
set batverdev=beta
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
if "%1"=="BatBootErrorHandlerArgument1908" (goto :batbootVerifyerrorhandler)
:batbootVerifyerrorhandler
echo %0 | find "%~dp0%~n0%~x0" >nul
if "%errorlevel%"=="0" if "%1"=="BatBootErrorHandlerArgument1908" (set batbootargumentbad=true) else (set batbootargumentbad=)
if "%errorlevel%"=="1" (set batbootargumentbad=false)
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
if "%1"=="BatBootErrorHandlerArgument1908" if "%batbootargumentbad%"=="false" (goto :batbootcheckwinversafe)
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
if not exist %Settingsfile%  (
    if not exist %FirstSTFsfile% (
        if not "%batbootargumentbad%"=="false" (echo Preparing Setup...)
    ) else (title Cursor Changer ^| Starting...& echo Starting Cursor Changer...)
)
if exist %Settingsfile% if not "%linuxboot%"=="true" (if not "%batbootargumentbad%"=="false" (title Cursor Changer ^| Starting...& echo Starting Cursor Changer...)) else (if not "%batbootargumentbad%"=="false" (title Cursor Changer ^| Starting...))
if not exist %Settingsfile% set firststartbat=yes
if "%1"=="BatBootErrorHandlerArgument1908" (if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] No more boot message!!!))


rem check powershell is available
if "%batbootargumentbad%"=="false" (goto :batbootcheckpowershellsafe)
:batbootcheckpowershell
>nul 2>&1 powershell exit && goto :batbootcheckpowershellsafe
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
if not "%1"=="BatBootErrorHandlerArgument1908" (cd "%~dp0" & start /b /wait /realtime cmd.exe /c "%~n0%~x0" BatBootErrorHandlerArgument1908 %* || call :BSOD_Errors 6)
if not "%1"=="BatBootErrorHandlerArgument1908" (call :BSOD_Errors 0 %errorlevel%
    pause >nul
    echo ERROR HANDLER IS COMPLETELY MESSED UP. WHAT DID YOU DO!!!
    exit
)
set batbootargumentbad=
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Error_Handler is Working! :D)


:Arguments_Loader
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Arguments_Loader is Started...)
if "%~1"=="" goto :Arguments_Loaderend
if not "%~1"=="BatBootErrorHandlerArgument1908" (title Cursor Changer ^| argment checking...)
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
    if "!current!"=="BatBootErrorHandlerArgument1908" (set Arguments_Loaderbreaked=true& goto :Arguments_Loaderbreak)
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
call :batbootErrorHandlerCall
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
if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Powersheller is started...)
if not "%Powersheller%"=="OOBEMusic" (set "batverforpowersheller=%batver:β=.b%")
if not "%1"=="BatBootErrorHandlerArgument1908" (
    if not "%bootbatnow%"=="yes" (
        if "%1"=="CheckUpdate" (set Powersheller=CheckUpdate& set checkupdatetoggle=true) else (set Powersheller=%1& set checkupdatetoggle=)
    )
)

rem code from startid~powershell must not be displaced code before or after that is ok If it's before or after that, it's ok
:: StartID1908
call :getLineNumber startLine StartID1908 0
goto :Powershellerendcode
:Powershellercodestart
set /a startline=startline+5& set /a endline=endline-3
if "%Powersheller%"=="OOBEMusic" (start /min powershell.exe -noexit -NoProfile -ExecutionPolicy Unrestricted "$s=[System.Management.Automation.ScriptBlock]::create((Get-Content \"%~f0\" -TotalCount $env:endline|Where-Object{$_.readcount -gt $env:startline }) -join \"`n\");&$s" %*&goto :Powersheller_end)
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
Write-Host "The update is complete.`n"
Start-Sleep 2
Write-Host "Rebooting..."
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
            Write-Host "Downloading music... $([math]::Round(($totalRead / $totalBytes) * 100))% " -NoNewline
        }
        $memoryStream.Position = 0; $response.Close(); Write-Host "`nDownload Complete!"
    } catch {
        # Error handling for download failures
        $errorMsg = if ($_.Exception.Response.StatusCode.Value__ -eq 403) {
            "[ERROR] GitHub API rate limit exceeded. Please wait an hour and try again."
        } else { "[ERROR] Oops, something went wrong. Check the internet connection.`nError log: $_" }
        Write-Host $errorMsg -ForegroundColor Red
        Write-Host "Hit any key to exit..."; $host.UI.RawUI.ReadKey() | Out-Null; exit
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
        if (data == null || data.Length == 0) throw new ArgumentException("Buffer cannot be null or empty.", "data");
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
    cls; Write-Host "Playing music... Don't mind this window. You can stop the music by closing this window."
} catch {
    Write-Host "[ERROR] Failed to play the audio. Ensure the file is in the correct format." -ForegroundColor Red
    Write-Host "Hit any key to exit..."; $host.UI.RawUI.ReadKey() | Out-Null; exit
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
# Get cmd's PID, and Kill them. >:D
Write-Host "`nShutting down..."
Start-Sleep 1
$pid1 = (Get-WmiObject win32_process -filter "processid=$pid").parentprocessid
$pid2 = (Get-WmiObject win32_process -filter "processid=$pid1").parentprocessid
taskkill /pid $pid1 /pid $pid2 /pid $pid > $null 2>&1
}

Function Changelog {
# Get latest Changelog from Github, and format it, then show it.
try {$h=Get-Host;$w=$h.UI.RawUI;$s=$w.BufferSize;$s.height=(irm -Uri "https://api.github.com/repos/tamago1908/Cursor-Changer.bat/releases/latest").body -split '\r\n' | Measure-Object | %{$_.Count + 22};$w.BufferSize=$s;} catch {}
try{if($env:wmodetoggle -eq "false"){Write-Host "Change Log :" -foregroundcolor white}elseif($env:wmodetoggle -eq "true"){Write-Host "Change Log :" -foregroundcolor black }else{Write-Host "Change Log :" -foregroundcolor white};$e=[char]27;$clr="$e[7m";$clred="$e[91m";$clrgrn="$e[92m";$clryel="$e[93m";$clrmag="$e[95m";$clrgra="$e[90m";$clrcyan="$e[96m";$c="$e[0m";if($env:wmodetoggle -eq "true"){$clr="$e[100m$e[97m";$c="$e[0m$e[107m$e[30m"};foreach($s in (irm -Uri "https://api.github.com/repos/tamago1908/Cursor-Changer.bat/releases/latest").body -split '\r\n'){if($s -match "####"){write-host "$clrcyan$e[1m$($s -replace '(^\#+)|(\#+$)', '')$c" `n -NoNewline}elseif($s -match ">"){write-host "$clred$($s -replace '\>', '')$c" `n -NoNewline}elseif($s -match "###"){write-host "$clryel$e[1m$($s -replace '(^\#+)|(\#+$)', '')$c" `n -NoNewline}elseif($s -match "___"){write-host "$clrgra--------------------------------------------------$c" `n -NoNewline}else{$s=$s -replace "\*{3}(.+?)\*{3}", "$e[3m`$1$c";$s=$s -replace "\*{2}(.+?)\*{2}", "$e[1m`$1$c";$s=$s -replace "^\s*-(\s+)(.*)", "$clred-$c`$1`$2";$s=$s -replace "\*+", "";write-host "$s" `n -NoNewline}};rv e,clr,clred,clrgrn,clryel,clrmag,clrgra,clrcyan,c,s}catch{if($_.Exception.Response.StatusCode.Value__ -eq 403){Write-Host "[ERROR] You have exceeded the GitHub API rate limit. This may be because you have checked for updates too frequently. Please wait for an hour and try again." -foregroundcolor red}else{Write-Host "[ERROR] Oops, something went worng. You can try again later. or check the internet connection. `nError log : $_" -foregroundcolor red};break}
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
if exist %Settingsfile% (find "PlaySound=false" %Settingsfile% > nul) else (exit /b)
if not %ErrorLevel%==0 (
    if "%1"=="1" (start /b /realtime powershell -NoProfile -ExecutionPolicy Bypass -Command "[System.Reflection.Assembly]::LoadWithPartialName('System.Media') > $null; $file=\"%~dp0%~n0%~x0\"; $lines=Get-Content -Path $file -Encoding UTF8; $index=($lines | Select-String -Pattern ':: Base64ID_Sound_Tada$').LineNumber; if ($index -and $index -lt $lines.Length) { $b64=$lines[$index].Trim(); try { $bytes=[Convert]::FromBase64String($b64); $stream=New-Object System.IO.MemoryStream; $stream.Write($bytes, 0, $bytes.Length); $stream.Position=0; $player=New-Object System.Media.SoundPlayer; $player.Stream=$stream; $player.PlaySync(); $stream.Close(); $stream.Dispose() } catch { Write-Host \"Error decoding Base64 or playing sound: $^($_.Exception.Message^)\"; Write-Host \"Press any key to continue...\"; $null = $host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown') } } else { Write-Host \"Marker ':: Base64ID_Sound_Tada' not found or no data in next line.\" }")
    if "%1"=="2" (start /b /realtime powershell -NoProfile -ExecutionPolicy Bypass -Command "[System.Reflection.Assembly]::LoadWithPartialName('System.Media') > $null; $file=\"%~dp0%~n0%~x0\"; $lines=Get-Content -Path $file -Encoding UTF8; $index=($lines | Select-String -Pattern ':: Base64ID_Sound_Shutdown$').LineNumber; if ($index -and $index -lt $lines.Length) { $b64=$lines[$index].Trim(); try { $bytes=[Convert]::FromBase64String($b64); $stream=New-Object System.IO.MemoryStream; $stream.Write($bytes, 0, $bytes.Length); $stream.Position=0; $player=New-Object System.Media.SoundPlayer; $player.Stream=$stream; $player.PlaySync(); $stream.Close(); $stream.Dispose() } catch { Write-Host \"Error decoding Base64 or playing sound: $^($_.Exception.Message^)\"; Write-Host \"Press any key to continue...\"; $null = $host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown') } } else { Write-Host \"Marker ':: Base64ID_Sound_Shutdown' not found or no data in next line.\" }")
)
if "%1"=="3" (powershell -command "$parentProcessId = (Get-CimInstance -Query \"SELECT ParentProcessId FROM Win32_Process WHERE ProcessId = $PID\").ParentProcessId;$processGroup = Get-CimInstance -Query \"SELECT ProcessId FROM Win32_Process WHERE ParentProcessId = $parentProcessId AND Name = 'powershell.exe'\";$processGroup | Where-Object { $_.ProcessId -ne $PID } | ForEach-Object { Stop-Process -Id $_.ProcessId -Force }")
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
ping -n 1 -w 500 localhost >nul
setlocal enabledelayedexpansion
title Welcome to Cursor Changer
cls


:CursorChangerOOBE_Animation
rem Play CursorChangerOOBE_Animations that appear slowly
if not defined dummy (set /p nothing=[?25l<nul)
set /a count+=10
set clresc=%count%;%count%;%count%
set "show=[2;23H[38;2;%clresc%mWelcome to Cursor Changer %batver% [0m"
echo.
echo %show%
rem call background_menu to drew bg
call :Background_menu 1
if "%count%" == "200" (ping -n 2 -w 500 localhost >nul& set count=& goto :CursorChangerOOBE_Animation2) else (
    for /l %%. in (0,1,5000) do rem
)
goto :CursorChangerOOBE_Animation

:CursorChangerOOBE_Animation2
rem Play CursorChangerOOBE_Animations that appear slowly but more darker
set /a count+=10
set clresc=%count%;%count%;%count%
set "show2=[5;26H[38;2;%clresc%m[PRESS ANY KEY TO BEGIN] [0m"
echo.
echo %show%
echo.& echo.
echo %show2%
if "%count%" == "120" (
    set clresc=& pause >nul& echo.& echo %show%& ping -n 1 -w 500 localhost >nul
    set count=200& set count2=120& set clresc=204;204;204
    goto :CursorChangerOOBE_Animation3
) else (
    for /l %%. in (0,1,5000) do rem
    goto :CursorChangerOOBE_Animation2
)

:CursorChangerOOBE_Animation3
rem live together, die together.
set /a count-=10& set /a count2-=6
set clresc=%count2%;%count2%;%count2%
set "show2=[5;26H[38;2;%clresc%m[PRESS ANY KEY TO BEGIN] [0m"
echo.
echo %show%
echo.& echo.
echo %show2%
rem call background_menu to drew bg
call :Background_menu 1
if !count2! leq 12 (
    if !count! leq 20 (ping -n 1 -w 500 localhost >nul& set count=& set count2=0& set clresc=200;200;200& set clrmove=22& goto :CursorChangerOOBE_Animation4)
) else (
    ping -n 0 -w 500 localhost >nul
    goto :CursorChangerOOBE_Animation3
)

:CursorChangerOOBE_Animation4
echo %show%
rem Play CursorChangerOOBE_Animations that move left
set "show=[2;%clrmove%H[38;2;%clresc%mWelcome to Cursor Changer %batver%      [0m"
echo %show%
set /a clrmove-=1
if %clrmove% equ 2 (
    goto :CursorChangerOOBE_Animation5
) else (
    for /l %%. in (0,1,2500) do rem
    goto :CursorChangerOOBE_Animation4
)

:CursorChangerOOBE_Animation5
rem WOW IT CHANGED INTO SETUP!!!!!!!!!
ping -n 2 -w 500 localhost >nul & cls
set "show=[38;2;%clresc%m  Cursor Changer %batver% Setup [0m"
echo.
echo %show%
ping -n 2 -w 500 localhost >nul
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
echo.& echo   Cursor Changer %batver% Setup& echo ================================O
if "%1"=="1" (set /p nothing=Setup progress : 1/5 ^(Check precautions^)<nul& title Cursor Changer %batver% Setup ^| Progress : 1/5
) else if "%1"=="2" (set /p nothing=Setup progress : 2/5 ^(Confirm information^)<nul& title Cursor Changer %batver% Setup ^| Progress : 2/5
) else if "%1"=="3" (set /p nothing=Setup progress : 3/5 ^(Set theme of Cursor Changer^)<nul& title Cursor Changer %batver% Setup ^| Progress : 3/5
) else if "%1"=="4" (set /p nothing=Setup progress : 4/5 ^(Customize of Settings^)<nul& title Cursor Changer %batver% Setup ^| Progress : 4/5
) else if "%1"=="5" (set /p nothing=Setup progress : 5/5 ^(End of set up^)<nul& title Cursor Changer %batver% Setup ^| Progress : 5/5)
if not "%1"=="0" (if not defined dummy (set /p nothing=[0K<nul) & echo.)
exit /b

:Underbar_Drawer
rem Drawing Underbar of OOBE
rem I didn't know ESC[0K is so useful
if not defined dummy (set /p nothing=[22;0H<nul)
if "%1"=="0" (set /p nothing=%clr2%%clrwhi%[0K%moveline%%clrwhi%<nul& exit /b
) else if "%1"=="1" (set /p nothing=%clrwhi%[0K     Y=Continue     S=Skip     B=Quit     %moveline%%clrwhi%<nul& exit /b
) else if "%1"=="2" (set /p nothing=%clr2%%clrwhi%[0K     Y=Skip     N,B=Not Skip     %moveline%%clrwhi%<nul& exit /b
) else if "%1"=="3" (set /p nothing=%clr2%%clrwhi%[0K     Y=Continue     N=No     %moveline%%clrwhi%<nul& exit /b
) else if "%1"=="4" (set /p nothing=%clr2%%clrwhi%[0K     Y=Yes     N=No     %moveline%%clrwhi%<nul& exit /b
) else if "%1"=="5" (set /p nothing=%clr2%%clrwhi%[0K     Y=Continue     [22;78H1/3%moveline%%clrwhi%<nul& exit /b
) else if "%1"=="6" (set /p nothing=%clr2%%clrwhi%[0K     Y=Continue     [22;78H2/3%moveline%%clrwhi%<nul& exit /b
) else if "%1"=="7" (set /p nothing=%clr2%%clrwhi%[0K     Y=Continue     [22;78H3/3%moveline%%clrwhi%<nul& exit /b
) else if "%1"=="8" (set /p nothing=%clr2%%clrwhi%[0K     A,1=move to Left     D,2=move to right     B=Exit     %moveline%%clrwhi%<nul& exit /b
) else if "%1"=="9" (set /p nothing=%clr2%%clrwhi%[0K     A,1=move to Left     D,2=move to right     Y,E=Confirm     B=Exit     %moveline%%clrwhi%<nul& exit /b
) else if "%1"=="10" (set /p nothing=%clr2%%clrwhi%[0K     Y,E=Confirm     B,N=Exit     %moveline%%clrwhi%<nul& exit /b
) else if "%1"=="11" (set /p nothing=%clr2%%clrwhi%[0K     W,S or 1~5=Move     Y=Toggle     N,B=Discard     %moveline%%clrwhi%<nul& exit /b
) else if "%1"=="12" (set /p nothing=%clr2%%clrwhi%[0K     Y,E=Exit     %moveline%%clrwhi%<nul& exit /b)
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
call :Underbar_Drawer 1 & call :Header_Drawer 0
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
call :Underbar_Drawer 2 & call :Header_Drawer 0
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
call :Underbar_Drawer 0 & call :Header_Drawer 0
echo.
echo.
echo          Preparing download music. Please Wait a while...
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
echo          Shutting down...
call :OOBE_EndLine
exit /b


:OOBEmainmusicmessage2
set batchpath=
call :Underbar_Drawer 0 & call :Header_Drawer 0
echo.
echo.
echo          Done.
echo.
echo          It may take some time for the music to fully play.
echo          And if you want stop the music, Close the powershell.
echo.
echo          If music does not play, Check the following : 
echo.
echo          Check your anti-virus software
echo          Check that github is available
echo          Make sure you do not have API rate limitation from github
echo          Make sure powershell is available
echo.
echo          (Continue setup after 5 seconds.)
call :OOBE_EndLine
timeout /t 5 /nobreak >nul
call :OOBEmainblank
timeout /t 1 /nobreak >nul
goto :OOBEmain2


:OOBEmain2
call :Underbar_Drawer 5 & call :Header_Drawer 1
echo.
echo.
echo          Cursor Changer.bat is will generates two files.
echo          CursorChangerSetting.txt and %FirstSTFsfile%.
echo.
echo          CursorChangerSetting.txt stores the all settings of CursorChanger.bat,
echo          This file is very inportant file.
echo.
echo          %FirstSTFsfile% is used to determine the initial Chenge Cursor.
echo          and is also an important file.
echo.
echo          If the user (in this case %USERNAME%) deletes these files,
echo          this CursorChanger.bat may not work properly and should never be done.
echo          SO, DON'T DELETE THESE FILE.
echo.
echo          (Y to Continue)
echo.
choice /c Y /n >nul
if %ErrorLevel%==1 goto :OOBEmain3


:OOBEmain3
call :Underbar_Drawer 6 & call :Header_Drawer 1
echo.
echo.
echo          Tamago_1908, the creator of this Cursor Changer.bat,
echo          assumes no responsibility for any damage or injury caused by
echo          Cursor Changer.bat.
echo.
echo          In other words, all responsibility for downloading and executing this
echo          batch belongs to the person who downloaded and executed it.
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
call :Underbar_Drawer 7 & call :Header_Drawer 1
echo.
echo.
echo          This batch is intended to run on windows 10 1803 or later. 
echo          It is not guaranteed to work on anything lower than that.
echo          It also requires Powershell to be available.
echo.
echo          An internet connection is also required, although not required.
echo          (Necessary for checking for updates, etc. )
echo.
echo          A PC with as fast a CPU as possible is also recommended.
echo          Extremely fast or slow speeds may cause some problems
echo          or deterioration of the animation scenery.
echo.
echo          (Y to Continue)
call :OOBE_EndLine
choice /c Y /n >nul
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul


:OOBEmain5
call :Underbar_Drawer 4 & call :Header_Drawer 2
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
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto :OOBEmain5_1
if %ErrorLevel%==2 goto :OOBEmain5ifno


:OOBEmain5ifno
call :Underbar_Drawer 4 & call :Header_Drawer 2
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
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto :OOBEmain5_1
if %ErrorLevel%==2 call :OOBEmainshutdown & timeout /t 1 /nobreak >nul&call :exit 0


:OOBEmain5_1
call :Underbar_Drawer 4 & call :Header_Drawer 2
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
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto :OOBEmain5_2
if %ErrorLevel%==2 call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto :OOBEmain6


:OOBEmain5_2
set YourName=
call :Underbar_Drawer 0 & call :Header_Drawer 2
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
call :Underbar_Drawer 4 & call :Header_Drawer 2
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
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto :OOBEmain6
if %ErrorLevel%==2 goto :OOBEmain5_2


:OOBEmain5_2c_error
call :Underbar_Drawer 0 & call :Header_Drawer 2
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
call :Underbar_Drawer 0 & call :Header_Drawer 2
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
call :Underbar_Drawer 4 & call :Header_Drawer 3
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
if %ErrorLevel%==1 goto :OOBEmain6theme1
if %ErrorLevel%==2 call :OOBEmainblank & timeout /t 1 /nobreak >nul&set oobetheme=dark&goto :OOBEmain7


:OOBEmain6theme1
if "%OOBEundiscard%"=="true" (call :OOBEmainblank & timeout /t 1 /nobreak >nul&set oobetheme=dark&set OOBEundiscard=&goto :OOBEmain7)
call :Underbar_Drawer 8 & call :Header_Drawer 3
echo.
echo.
echo          O============O    O=============O
echo          I Dark theme I    I white theme I
echo          O============O    O=============O
echo.
echo.
echo    ^・   Nothing Selected. A,D or 1,2 to chooce the theme.
echo.
echo          (A,D or 1,2 to move, Y or E to confirm.)
echo          (B to stop choosing the theme.)
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
echo          O============O    O=============O
echo          I%clrhigh% Dark theme %clrhighend%I    I white theme I
echo          O============O    O=============O
echo.
echo.
echo     ^・   The most ordinary theme and most suitable.
echo     ^・   and optimized theme for using Cursor Changer.
echo     ^・   This is usually recommended.
echo.
echo          (A,D or 1,2 to move, Y or E to confirm.)
echo          (B to stop choosing the theme.)
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
echo          O============O    O=============O
echo          I Dark theme I    I%clrhigh% white theme %clrhighend%I
echo          O============O    O=============O
echo.
echo.
echo     ^・   This theme has a special atmosphere.
echo     ^・   It displays more brightly than the dark theme.
echo     ^・   Some functions of Cursor Changer may not
echo          befully compatible with this theme.
echo.
echo          (A,D or 1,2 to move, Y or E to confirm.)
echo          (B to stop choosing the theme.)
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
echo          O============O    O=============O
echo          I%clrhigh% Dark theme %clrhighend%I    I white theme I
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
if %ErrorLevel%==1 goto :OOBEmain6theme2
if %ErrorLevel%==2 goto :OOBEmain6theme2
if %ErrorLevel%==3 call :OOBEmainblank & timeout /t 1 /nobreak >nul&set oobetheme=dark&goto :OOBEmain7
if %ErrorLevel%==4 call :OOBEmainblank & timeout /t 1 /nobreak >nul&set oobetheme=dark&goto :OOBEmain7



:OOBEmain6theme3confirm
call :Underbar_Drawer 10 & call :Header_Drawer 3 true
echo.
echo.
echo          O============O    O=============O
echo          I Dark theme I    I%clrhigh% white theme %clrhighend%I
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
if %ErrorLevel%==1 goto :OOBEmain6theme3
if %ErrorLevel%==2 goto :OOBEmain6theme3
if %ErrorLevel%==3 set oobetheme=white&call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto :OOBEmain7
if %ErrorLevel%==4 set oobetheme=white&call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto :OOBEmain7


:OOBEmain6themeifback
call :Underbar_Drawer 4 & if "%1"=="true" (call :Header_Drawer 3 true) else (call :Header_Drawer 3 false)
echo.
echo.
echo          Do you want Discard theme selection and proceed?
echo          (If you discard, the default dark theme will be selected.)
echo.
echo.
echo          (Y= Yes, I want to discard it.)
echo          (N= No, I want to Choose the theme!)
call :OOBE_EndLine
choice /c YN /n >nul
if %ErrorLevel%==1 set OOBEundiscard=true&exit /b
if %ErrorLevel%==2 exit /b

:OOBEmain7
call :Underbar_Drawer 4 & call :Header_Drawer 4
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
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto :OOBEmain7CustomizeSettings
if %ErrorLevel%==2 call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto :OOBEmain8


:OOBEmain7CustomizeSettingsdiscard
call :Underbar_Drawer 4 & call :Header_Drawer 4
echo.
echo.
echo          Do you really want to discard customize setting?
echo.
echo          (if you discard, the all settings is will be set to defaults.)
echo.
echo          (Y=Yes, I want to discard it!)
echo          (N=No, I want customize settings!)
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
echo          O================================O   Customize of Settings
echo          I 1 Boot as Cursor Changer       I
echo          O================================O   Nothing selected...
echo          I 2 Admin when boot              I
echo          O================================O   W or S and 1~5 to move.
echo          I 3 Check update at boot         I   Y to Toggle it, N or B to
echo          O================================O   Discard.
echo          I 4 Allow sound to play          I   move to "OK" and enter Y to
echo          O================================O   confirm.
echo          I 5 Boot animation               I   
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
echo          O================================O   Customize of Settings
echo          I%OOBEsettingclr% 1 Boot as Cursor Changer       %OOBEsettingclr2%I
echo          O================================O   Setting whether to
echo          I%OOBEsetting2clr% 2 Admin when boot              %OOBEsetting2clr2%I   transition to
echo          O================================O   Cursor Change (1 at Mainmenu)
echo          I%OOBEsetting3clr% 3 Check update at boot         %OOBEsetting3clr2%I   after startup.
echo          O================================O   you can change the cursor faster.
echo          I%OOBEsetting4clr% 4 Allow sound to play          %OOBEsetting4clr2%I
echo          O================================O   %clrgra%disable is recommended.%OOBEsettingclr2%
echo          I%OOBEsetting5clr% 5 Boot animation               %OOBEsetting5clr2%I
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
echo          O================================O   Customize of Settings
echo          I%OOBEsetting1clr% 1 Boot as Cursor Changer       %OOBEsetting1clr2%I
echo          O================================O   Attempts to obtain administrative
echo          I%OOBEsettingclr% 2 Admin when boot              %OOBEsettingclr2%I   privileges at startup.
echo          O================================O   Should be enabled in case of
echo          I%OOBEsetting3clr% 3 Check update at boot         %OOBEsetting3clr2%I   problems changing Cursors.
echo          O================================O   Enabling may also faster boot up.
echo          I%OOBEsetting4clr% 4 Allow sound to play          %OOBEsetting4clr2%I   
echo          O================================O   %clrgra%disable is recommended.%OOBEsettingclr2%
echo          I%OOBEsetting5clr% 5 Boot animation               %OOBEsetting5clr2%I
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
echo          O================================O   Customize of Settings
echo          I%OOBEsetting1clr% 1 Boot as Cursor Changer       %OOBEsetting1clr2%I
echo          O================================O   Check Update at boot up.
echo          I%OOBEsetting2clr% 2 Admin when boot              %OOBEsetting2clr2%I   Updates, if any, can be applied.
echo          O================================O   However, Boot time may be slower.
echo          I%OOBEsettingclr% 3 Check update at boot         %OOBEsettingclr2%I   API rate limit of github
echo          O================================O   may be reached.
echo          I%OOBEsetting4clr% 4 Allow sound to play          %OOBEsetting4clr2%I
echo          O================================O   %clrgra%disable is recommended.%OOBEsettingclr2%
echo          I%OOBEsetting5clr% 5 Boot animation               %OOBEsetting5clr2%I
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
echo          O================================O   Customize of Settings
echo          I%OOBEsetting1clr% 1 Boot as Cursor Changer       %OOBEsetting1clr2%I
echo          O================================O   You can toggle whether or not to
echo          I%OOBEsetting2clr% 2 Admin when boot              %OOBEsetting2clr2%I   play sounds such as when boot up.
echo          O================================O   If this is enabled, sounds will
echo          I%OOBEsetting3clr% 3 Check update at boot         %OOBEsetting3clr2%I   be played at boot up, etc.
echo          O================================O   
echo          I%OOBEsettingclr% 4 Allow sound to play          %OOBEsettingclr2%I
echo          O================================O   %clrgra%enable is recommended.%OOBEsettingclr2%
echo          I%OOBEsetting5clr% 5 Boot animation               %OOBEsetting5clr2%I
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
echo          O================================O   Customize of Settings
echo          I%OOBEsetting1clr% 1 Boot as Cursor Changer       %OOBEsetting1clr2%I
echo          O================================O   You can toggle the startup
echo          I%OOBEsetting2clr% 2 Admin when boot              %OOBEsetting2clr2%I   animation after boot up
echo          O================================O   If disabled, boot up will be
echo          I%OOBEsetting3clr% 3 Check update at boot         %OOBEsetting3clr2%I   2 seconds faster, but
echo          O================================O   with less visual.
echo          I%OOBEsetting4clr% 4 Allow sound to play          %OOBEsetting4clr2%I
echo          O================================O   %clrgra%enable is recommended.%OOBEsettingclr2%
echo          I%OOBEsettingclr% 5 Boot animation               %OOBEsettingclr2%I
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
echo          O================================O   Customize of Settings
echo          I%OOBEsetting1clr% 1 Boot as Cursor Changer       %OOBEsetting1clr2%I
echo          O================================O   Confirms the setting.
echo          I%OOBEsetting2clr% 2 Admin when boot              %OOBEsetting2clr2%I
echo          O================================O   However, it is recommended that
echo          I%OOBEsetting3clr% 3 Check update at boot         %OOBEsetting3clr2%I   at least one setting be enabled.
echo          O================================O   All of these settings can be
echo          I%OOBEsetting4clr% 4 Allow sound to play          %OOBEsetting4clr2%I   change later.
echo          O================================O   
echo          I%OOBEsetting5clr% 5 Boot animation               %OOBEsetting5clr2%I
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
echo          Customize of settings :
echo.
echo          1 Boot as Cursor Changer       : %OOBEsetting1toggle% %clrgra%(recommend false)%OOBEsettingclr2%
echo          2 Admin when boot              : %OOBEsetting2toggle% %clrgra%(recommend false)%OOBEsettingclr2%
echo          3 Check update at boot         : %OOBEsetting3toggle% %clrgra%(recommend false)%OOBEsettingclr2%
echo          4 Allow sound to play          : %OOBEsetting4toggle% %clrgra%(recommend true)%OOBEsettingclr2%
echo          5 Boot animation               : %OOBEsetting5toggle% %clrgra%(recommend true)%OOBEsettingclr2%
echo.
echo          If you continue, these settings will be written to the Setting file.
echo          Are you sure? %clrgra%(setting file is at "%batchmainpath%".) %OOBEsettingclr2%
echo.
echo          (Y=Yes, this is fine.)
echo          (N=No, I want to change it.)
echo.
echo.
choice /c YN /n >nul
if %ErrorLevel%==1 if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto :OOBEmain8
if %ErrorLevel%==2 goto :OOBEmain7CustomizeSettings1

:OOBEmain8
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
)
)
call :Underbar_Drawer 12 & call :Header_Drawer 5
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
echo          (Leave setup and goto mainmenu with Y or E)
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
set clr1=& set clresc=& set clrmove=& set clr2=&set clr=
call :Core_Powershell 3
exit /b



:Cursor_Changer_REmenu
cls
mode con: cols=75 lines=25
rem GUI type 3
rem recovery menu for Cursor Changer, and recovery console
set DynamicWinverCheck=true& call :batbootcheckwinver dynamic & set DynamicWinverCheck=
if "%errorlevel%"=="1" (goto :batbootcheckwinverbad)
if not defined dummy (set clr=[7m&set clrgra=[90m&set clr2=[0m)
if "%wmodetoggle%"=="false" (set clr=[7m&set clrgra=[90m&set clr2=[0m)
if "%wmodetoggle%"=="true" (set clr=[100m[97m&set clrgra=[107m[38;2;140;140;140m&set clr2=[90m[107m[30m)
if not defined dummy (set /p nothing=[?25l<nul)
set bootbatnow=no& set rmsel=0
echo Preparing Recovery menu, Please wait a while...& timeout /t 1 /nobreak >nul

:Cursor_Changer_REmenu_main
cls
title Cursor Changer ^| Recovery Menu
:Cursor_Changer_REmenu_main_loop
if not defined dummy (set /p nothing=[?25l<nul)
if not defined dummy (set /p nothing=[H<nul)
for /l %%i in (9,1,10) do (set /p nothing=[%%i;7H                                                            [H<nul)
if %rmsel%==0 (set /p nothing=[9;22H Currently nothing is selected.[H<nul)
if %rmsel%==1 (set /p nothing=[9;26H Reboot Cursor Changer.[10;22H ^(Usually this is recommended.^)[H<nul)
if %rmsel%==2 (set /p nothing=[9;31H Wipe setting.[10;27H ^(Reset all settings.^)[H<nul)
if %rmsel%==3 (set /p nothing=[9;29H Recovery Console.[10;8H ^(Enter to the Recovery menu. you can use debug commands.^)[H<nul)
if %rmsel%==4 (set /p nothing=[9;30H Exit this menu.[10;32H ^(Shutdown^)[H<nul)
echo                     Cursor Changer %batver% Recovery Menu                
echo.
echo                              %rmcb1%      Reboot      %clr2%
echo                              %rmcb2%   Wipe Setting   %clr2%
echo                              %rmcb3% Recovery Console %clr2%
echo                              %rmcb4%    Exit Menu     %clr2%
echo.
echo                    1~4 or WS to select, E or Y to Enter.
echo.
echo.
choice /c 1234WSYE /n >nul
if %Errorlevel% geq 1 if %Errorlevel% leq 4 (set rmsel=%Errorlevel%)
if %rmsel%==0 (set rmsel=1& set rmcb1=%clr%& goto :Cursor_Changer_REmenu_main_loop)
if %ErrorLevel%==5 (if not %rmsel%==1 (set /a rmsel-=1))
if %ErrorLevel%==6 (if not %rmsel%==4 (set /a rmsel+=1))
if %ErrorLevel%==7 (goto :Cursor_Changer_REmenu_main_Core)
if %ErrorLevel%==8 (goto :Cursor_Changer_REmenu_main_Core)
set rmcb1=& set rmcb2=& set rmcb3=& set rmcb4=& set rmcb%rmsel%=%clr%
goto :Cursor_Changer_REmenu_main_loop

:Cursor_Changer_REmenu_main_Core
if %rmsel%==1 (set runningfromfulldebug=& set FromREConsole=& call :rebootbatch)
if %rmsel%==2 (goto :Cursor_Changer_REWipe)
if %rmsel%==3 (call :Cursor_Changer_REConsole& cls & goto :Cursor_Changer_REmenu_main_loop)
if %rmsel%==4 (goto :batshutdown)


:Cursor_Changer_REWipe
cls
title Cursor Changer ^| Recovery Menu
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
if %ErrorLevel%==2 (set rmsel=2& goto :Cursor_Changer_REmenu_main)

:Cursor_Changer_REWipeYippeee
cls
title Cursor Changer ^| Recovery Menu
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
set rmsel=2& goto :Cursor_Changer_REmenu_main


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
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
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
rem SAB_Manager mean is `S`ettings `A`nd `B`oot Manager. I guess it's kinda cool
rem Windows 2000 Windows is loading files reference. google it if you don't know about it
if "%bootbatnow%"=="no" (cls & title Cursor Changer ^| Cursor Setting Processing... & echo Processing... & goto :whatload) else (title Cursor Changer ^| Booting up...)
if "%simpleboot%"=="true" (cls & echo Booting up...& exit /b)
if "%wmodetoggle%"=="false" (set loadscrnprgsclr=[7m&set loadscrnprgsclrgra=[48;5;244m&set loadscrnprgsclr2=[0m&set back_to_the_firstline=[18;0H&set back_to_the_loadline=[23;12H)
if "%wmodetoggle%"=="true" (set loadscrnprgsclr=[47m[97m&set loadscrnprgsclrgra=[48;5;244m&set loadscrnprgsclr2=[0m[107m[30m&set back_to_the_firstline=[18;0H&set back_to_the_loadline=[23;12H) else (set loadscrnprgsclr=[7m&set loadscrnprgsclrgra=[48;5;244m&set loadscrnprgsclr2=[0m&set back_to_the_firstline=[18;0H&set back_to_the_loadline=[23;12H)
if not defined dummy if not "%linuxboot%"=="true" (set /p nothing=[?25l<nul)
if defined linuxboot if "%linuxboot%"=="true" (exit /b)

rem Progress Bar UI
if not defined SAB_Manager_Drewed (set SAB_Manager_Drewed=true& set batloadprgsDrewrn=12& set batloadprgsDrew=0) else if defined SAB_Manager_Drewed (goto :SAB_Manager_Main_Bar)
set /p nothing=%back_to_the_loadline%%loadscrnprgsclr2%<nul
echo %back_to_the_firstline%
echo O=========================================================================O
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
set batloadprgsdelete=&set back_to_the_firstline=&set back_to_the_loadline=
set SAB_Manager_Drewed=
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
if "%wmodetoggle%"=="true" (for /l %%i in (0,1,3) do (set /p nothing=[%%i;0H[48;2;230;230;230m                                                                           [0;0H<nul)) else (for /l %%i in (0,1,3) do (set /p nothing=[%%i;0H[48;2;20;20;20m                                                                           [0;0H<nul))
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
if "%wmodetoggle%"=="true" (for /l %%i in (22,1,25) do (set /p nothing=[%%i;0H[48;2;230;230;230m                                                                           [22;0H<nul)) else (for /l %%i in (22,1,25) do (set /p nothing=[%%i;0H[48;2;20;20;20m                                                                           [22;0H<nul))
echo %welcomelineclr%O=========================================================================O%welcomelineclr3%
echo.
if not defined dummy (echo [23C2021-2024 tamago_1908 %batbuild%)
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
if "%wmodetoggle%"=="true" (for /l %%i in (26,1,29) do (set /p nothing=[%%i;0H[48;2;230;230;230m                                                                                     [26;0H<nul)) else (for /l %%i in (26,1,29) do (set /p nothing=[%%i;0H[48;2;20;20;20m                                                                                     [26;0H<nul))
echo %welcomelineclr%O===================================================================================O%welcomelineclr3%
echo.
echo                         Cursor Changer %batver% Welcome. 2021-2024 
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
if "%wmodetoggle%"=="true" (for /l %%i in (26,1,29) do (set /p nothing=[%%i;0H[48;2;230;230;230m                                                                                     [26;0H<nul)) else (for /l %%i in (26,1,29) do (set /p nothing=[%%i;0H[48;2;20;20;20m                                                                                     [26;0H<nul))
echo %welcomelineclr%O===================================================================================O%welcomelineclr3%
echo.
echo                         Cursor Changer %batver% Welcome. 2021-2024 
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
    if %boottime% geq 15 if %boottime% leq 999 (call :Mainmenu_Boottime_WarningMSG)
    if "%Setting1onoff%"=="true " (goto :cursorchange) else (goto :Mainmenu))
echo.
:fixallsetting
rem auto fix
timeout /t 2 /nobreak >nul
mode con: cols=75 lines=25
echo.
SET /P selected=Automatic Repair is available. When you run Auto Repair, all previous settings are initialized and reset to default settings. Do you wish to continue? (yes or no):
if "%selected%"=="yes" (
call :Wipealldeta
echo.
echo Fix Complete.
pause
echo Rebooting...
call :Rebootbatch
)
if "%selected%"=="y" (
call :Wipealldeta
echo.
echo Fix Complete.
pause
echo Rebooting...
call :Rebootbatch
)
if "%selected%"=="no" (Mainmenuskipboot)
if "%selected%"=="n" (Mainmenuskipboot)

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
:Mainmenudrew
cls
if "%MenuRedrew%"=="true" (if "%setting6onoff%"=="true " (
    if "%wmodetoggle%"=="true" (set ccmmul=[107m[4m& set clr2=[0m[107m[38;2;140;140;140m) else (set clr2=[0m[90m& set ccmmul=[90m[4m)
    ) else (
    if "%wmodetoggle%"=="true" (set ccmmul=& set clr2=[0m[38;2;140;140;140m) else (set clr2=[0m[90m& set ccmmul=))
) else (call :background_menu)
rem To center the text, insert a number of spaces equal to half of cols minus half the number of characters in the text
echo                             Cursor Changer %batver%  %Mainmenubuild%
echo.
echo   O=====================================================================O
echo   I      1 %ccmmul%C%clr2%ursor Changer          2 %ccmmul%A%clr2%pplications          3 %ccmmul%E%clr2%xit       I
echo   I                                                                     I
echo   I                  4 %ccmmul%B%clr2%atch version           5 %ccmmul%S%clr2%ettings               I
echo   O=====================================================================O
echo.
if "%MenuRedrew%"=="true" (call :background_menu 2 & set MenuRedrew=& call :mainmenu_resetcolor & exit /b) else (call :MainmenuMessages)
if "%errorlevel%"=="1" (cls & set Updateavailable=& goto :Mainmenudrew) else if "%errorlevel%"=="0" (goto :Mainmenudrewend)
:Mainmenudrewend
set selected=
rem ask select
echo                Enter any number or commands you wish to run.
if "%FirstCursorisEdited%"=="true" (set /p "selected=[13;37H") else if "%MainmenuMessageshowed%"=="true" (set /p selected=[13;37H) else if not defined MainmenuMessageshowed (set /p selected=[11;37H)
echo.& if "%selected%"=="" (goto :typosMainmenu) else (echo %selected% was selected.)
set Typoswarning=0


rem Selection Branching
if "%selected%"=="1" (goto :cursorchange)
if "%selected%"=="c" (goto :cursorchange)
if "%selected%"=="2" (goto :Appmenu)
if "%selected%"=="a" (goto :Appmenu)
if "%selected%"=="3" (goto :exitmenu)
if "%selected%"=="e" (goto :exitmenu)
if "%selected%"=="4" (goto :batver)
if "%selected%"=="b" (goto :batver)
if "%selected%"=="5" (goto :setting)
if "%selected%"=="s" (goto :setting)

rem Eastereggs
if "%selected%"=="egg1" (color 1f&call :BSOD_Errors 4)
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
if "%selected%"=="uninstallnow1" (goto :Uninstall1)
if "%selected%"=="playdefboot" (cls&goto :CursorChangerOOBE_Animation)
if "%selected%"=="debugyesnow" (goto :darkgo)
if "%selected%"=="reload" (cls&set bootbatnow=yes&goto :batstart)
if "%selected%"=="fulldebug" (goto :fulldebug)
if "%selected%"=="labellist" (call :AllLabelList& goto :mainmenu)
if "%selected%"=="getadmin" (goto :batstartadm)
if "%selected%"=="bypassfirstboot" (set firststartbat=&call :Wipealldeta)
if "%selected%"=="uninstalldeletebat" (echo delete bat, confirm to type something...&pause&goto :uninstalldeletefinish5)
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
if "%selected%"=="shutdown" (goto :batshutdown)
if "%selected%"=="reboot" (echo.& echo Rebooting...& call :rebootbatch)
if "%selected%"=="counttestdeb" (goto :stupidtest) else echo. &echo Invalid (or unusable) selection! Please enter a valid entry.&pause&goto :Mainmenudrew

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
if %Typoswarning% gtr 20  (goto :Typoswarningtest1)
goto :Mainmenuboot

:Typoswarningtest1
if not %Typoswarning% gtr 50 (goto :Typoswarning1)
if %Typoswarning% gtr 50 (goto :Typoswarningtest2)

:Typoswarningtest2
if not %Typoswarning% gtr 100 (goto :Typoswarning2)
if %Typoswarning% gtr 100 (goto :Typoswarningtest3)

:Typoswarningtest3
if not %Typoswarning% gtr 130 (goto :Typoswarning3)
if %Typoswarning% gtr 130 (goto :Typoswarningtest4)

:Typoswarningtest4
if not %Typoswarning% gtr 200 (goto :Typoswarning4)
if %Typoswarning% gtr 200 (goto :Typoswarningtest5)

:Typoswarningtest5
if not %Typoswarning% gtr 250 (goto :Typoswarning5)
if %Typoswarning% gtr 250 (goto :Typoswarning6)

rem Collection of long press warning messages
:Typoswarning1
if %Typoswarning% gtr 21 (goto :Mainmenuboot)
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"Uh, What are you doing...?\", '...', 'OK', 'none');exit $result;"
goto :Mainmenuboot

:Typoswarning2
if %Typoswarning% gtr 51 (goto :Mainmenuboot)
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"...Why did you hit enter without any inputs...?\", '>:/', 'OK', 'none');exit $result;"
goto :Mainmenuboot

:Typoswarning3
if %Typoswarning% gtr 101 (goto :Mainmenuboot)
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"You wouldn't make a hundred hit enter without any fucking inputs, You've got to be kidding me!\", '>:(', 'OK', 'none');exit $result;"
goto :Mainmenuboot

:Typoswarning4
if %Typoswarning% gtr 131 (goto :Mainmenuboot)
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"STOP.\", 'PLEASE STOP.', 'OK', 'none');exit $result;"
goto :Mainmenuboot

:Typoswarning5
if %Typoswarning% gtr 201 (goto :Mainmenuboot)
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"STOP, IT, NOW.\", 'FINAL WARNING', 'OK', 'Warning');exit $result;"
goto :Mainmenuboot

:Typoswarning6
if %Typoswarning% gtr 251 (goto :Mainmenuboot)
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"...\", '...', 'OK', 'Error');exit $result;"
shutdown /r /t 10 /c "REGRET IT"
call :exit 0


:MainmenuMessages
rem Display messages. FirstCursorisEdited message, and updateavailable message
Call :MainmenuMessagesTimecheck & set tcmrand=&set tcmrand2=
if not "%errorlevel%"=="1" (
if "%FirstCursorisEdited%"=="true" (echo [17CEasy to change the %FirstSTFsfile%, huh?&echo.)
) else (set MainmenuMessageshowed=true)
if "%Updateavailable%"=="true" (call :UpdateAvailable& exit /b 1)
exit /b 0

:MainmenuMessagesTimecheck
rem Display messages for specific dates
if "%timecheckmessageshowed%"=="true" (set MainmenuMessageshowed=& exit /b 0) else (set timecheckmessageshowed=true)
if "%date:~0,4%"=="1999" (echo [27CWhere is the axolotl?& echo.& exit /b 1)
if "%date:~5%"=="01/01" (echo [30CHappy New Year!& echo.& exit /b 1)
if "%date:~5%"=="04/01" (echo [21CYour Computer is Destroyed!!!!!!!& echo.& exit /b 1)
if "%date:~5%"=="10/01" (echo [25CIT IS DA SPOOKY MONTH!!!& echo.& exit /b 1)
if "%date:~5%"=="10/31" (echo [30CHappy Halloween!& echo.& exit /b 1)
if "%date:~5%"=="12/25" (echo [30CHappy Holiday!& echo.& exit /b 1)
if "%date:~5%"=="12/31" (echo [20CDespite everything, it's still you.& echo.& exit /b 1)
rem you're bit lucky if you see this.
call :RandomDecisioner 24
if "%errorlevel%"=="1" (set tcmrand=0& set /a tcmrand=%random%*12/32767& set /a tcmrand=%random%*12/32767)
if defined tcmrand (if "%tcmrand%"=="0" (echo [26CThis is all meaningless.& echo.& exit /b 1) else if "%tcmrand%"=="1" (echo [19CWho is actually reading this message?& echo.& exit /b 1) else if "%tcmrand%"=="2" (echo [20CNobody don't care about this batch.& echo.& exit /b 1) else if "%tcmrand%"=="3" (echo [25CPlease don't uninstall me& echo.& exit /b 1) else if "%tcmrand%"=="4" (echo [28CThe cake is a lie&echo.&exit /b 1) else if "%tcmrand%"=="5" (echo [28CAre you really %YourName%?& echo.& exit /b 1) else if "%tcmrand%"=="6" (echo [19CAll your batches are belong to me ^>:D& echo.& exit /b 1) else if "%tcmrand%"=="7" (echo [30CHello world :D& echo.& exit /b 1) else if "%tcmrand%"=="8" (echo [30CAlso try Debios& echo.& exit /b 1) else if "%tcmrand%"=="9" (echo [27CAlso try Shivtanium OS& echo.& exit /b 1) else if "%tcmrand%"=="10" (set /p nothing=[21C<nul& call :RainbowDrawer WOW!!! You're so lucky today!!! :D& echo.& echo.& exit /b 1) else if "%tcmrand%"=="11" (goto :MainmenuMessagesTimecheckEASTEREGG))
set tcmrand=
exit /b 0

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
rem where is my location code is below. maybe I'll use it someday.
rem powershell -Command "& { Add-Type -AssemblyName System.Windows.Forms; Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class KeyboardHelper { [DllImport(\"user32.dll\", SetLastError = true)] public static extern void keybd_event(byte bVk, byte bScan, uint dwFlags, UIntPtr dwExtraInfo); public const byte VK_LWIN = 0x5B; public const byte VK_S = 0x53; public const uint KEYEVENTF_KEYUP = 0x0002; public static void SendWinS() { keybd_event(VK_LWIN, 0, 0, UIntPtr.Zero); keybd_event(VK_S, 0, 0, UIntPtr.Zero); keybd_event(VK_S, 0, KEYEVENTF_KEYUP, UIntPtr.Zero); keybd_event(VK_LWIN, 0, KEYEVENTF_KEYUP, UIntPtr.Zero); } }'; Start-Sleep -Milliseconds 500; [KeyboardHelper]::SendWinS(); Start-Sleep -Milliseconds 250; $welcomeText = 'Where is my location?'; foreach ($char in $welcomeText.ToCharArray()) { [System.Windows.Forms.SendKeys]::SendWait($char); Start-Sleep -Milliseconds 50; }; Start-Sleep -Milliseconds 3500; [System.Windows.Forms.SendKeys]::SendWait('{ESC}') }"
if not defined dummy (set /p "name=[30C")
if not "%name%"=="Cursor Changer" (set /a namecount=namecount+1) else (goto :MainmenuMessagesTimecheckEASTEREGG_RIGHT)
if "%namecount%"=="1" (echo [29CThat's incorrect.)
if "%namecount%"=="2" (echo [29CTHAT'S INCORRECT.) else if %namecount% gtr 2 (echo [35C...)
ping -n 2 -w 500 localhost >nul
goto :MainmenuMessagesTimecheckEASTEREGG_ASK
:MainmenuMessagesTimecheckEASTEREGG_RIGHT
if not defined dummy (echo [30CThat's right :D)
if "%wmodetoggle%"=="true" (color f0) else (color 07)
timeout /t 2 /nobreak >nul
set name=& set namecount=
goto :mainmenu


:background_menu
rem Honestly, I have no idea HOW this is working.
if "%setting7onoff%"=="false" (exit /b)
if not defined dummy (set /p nothing=[?25l<nul)
setlocal enabledelayedexpansion
rem argument 1 is for OOBE. give 0~200 (every 10) value. argument 2 is for ovarlay background.
rem initialize variable
set thml=26& set thml2=25& set thmldrewb=12& set thmldred=155
if "%wmodetoggle%"=="true" (if not defined dummy (set thmclr2=[107m[30m& set thmldrewb=255)
) else (if not defined dummy (set thmclr2=[0m))
if "%wmodetoggle%"=="true" (set thmlfor=194,9,243) else (set thmlfor=61,-9,12)
if "%1"=="2" (if "%wmodetoggle%"=="true" (set thmlfor=216,5,243& set thmldrewb=225) else (set thmlfor=39,-5,12))

rem Drew bg. thml means theme line.
for /l %%i in (!thmlfor!) do (set /a thml2-=1& set /a thml-=1 & rem < Line position (26-1)
    if "%setting7_1onoff%"=="true" ( rem Halloween theme
        if "%1"=="1" (set /a thmldrew=^(%%i-57^)+^(!count!*^(61-12^)^)/170) else (set /a thmldrew=%%i-6)
        if !thmldrew! lss 12 (set thmldrew=12) & rem < Value correction
        if not "%1"=="2" (if not "%wmodetoggle%"=="true" (set /a thmldred-=21) else (set /a thmldred+=11)) else (
            if not "%wmodetoggle%"=="true" (set /a thmldred-=21& set /a thmldrew-=4) else (set /a thmldred+=16& set /a thmldrew+=16))
        if !thmldred! lss 30 (set thmldred=27) else if not "%1"=="2" (if !thmldred! gtr 220 (set /a thmldred=230)) else if !thmldred! geq 245 (set /a thmldred=242& set thmldrew=242& set thmldrewb=242)
    ) else ( rem Normal theme
    if "%1"=="1" (set /a thmldrew=^(%%i-57^)+^(!count!*^(61-12^)^)/170 & if !thmldrew! lss 12 (set thmldrew=12)) else (set thmldrew=%%i))
    if not "%setting7_1onoff%"=="true" (set thmclr=[48;2;!thmldrew!;!thmldrew!;!thmldrew!m) else (set thmclr=[48;2;!thmldred!;!thmldrew!;!thmldrewb!m)
    for /l %%a in (1,1,3) do (set /p nothing=[!thml!d!thmclr!                         !thmclr2!<nul) & rem < Draw lines
    echo [!thml2!d
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
    if defined rbdark (for %%a in (r,g,b) do (set /a "value=!%%a!-rbdark" & if !value! lss 12 (set "%%a=12") else (set "%%a=!value!")))
    set /p nothing=[38;2;!r!;!g!;!b!m!char!%rbclr%<nul& rem ^ Ensure RGB values are within bounds and apply dark adjustment, And show
)
setlocal disabledelayedexpansion
set text=& set length=& set rbphase=& set i=& set char=& set ratio=& set r=& set g=& set b=& set section=& set value=& set rbclr=& exit /b


:Mainmenu_Boottime_WarningMSG
rem GUI type 3
rem Preparing of Menu and Variables
if not defined dummy (set clr=[7m&set clrgra=[90m&set clryel=[93m&set clrwhi=[97m&set clr2=[0m)
if "%wmodetoggle%"=="false" (set clr=[7m&set clrgra=[90m&set clryel=[93m&set clrwhi=[97m&set clr2=[0m)
if "%wmodetoggle%"=="true" (set clr=[100m[97m&set clrgra=[107m[38;2;140;140;140m&set clryel=[93m&set clrwhi=[30m&set clr2=[90m[107m[30m)
rem Draw Update Available UI
title Cursor Changer ^| Boottime Warning!
if %boottime% leq 100 (set "BoottimeTEMP=%boottime% ") else (set BoottimeTEMP=%boottime%)
if not defined dummy (set /p nothing=[?25l%clr2%<nul& set MenuRedrew=true& set /p nothing=%clrgra%<nul& call :Mainmenudrew & echo %clr2%)
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
rem GUI type 1
rem Preparing of Menu and Variables
rem Smart Processing!!!! DO NOT CARE ABOUT SO MANY OF IF STATEMENTS. PLS
title Cursor Changer ^| Exit Menu 
set exitmenucurrent=0& call :exitmenu_exit
if not defined dummy (set clr=[7m&set clred=[41m&set clrgrn=[42m&set clrcyan=[46m&set clrgra=[90m&set clr2=[0m)
if "%wmodetoggle%"=="false" (set clr=[7m&set clred=[41m&set clrgrn=[42m&set clrgra=[90m&set clrcyan=[46m&set clr2=[0m)
if "%wmodetoggle%"=="true" (set clr=[100m[97m&set clred=[41m&set clrgrn=[42m&set clrgra=[107m[38;2;140;140;140m&set clrcyan=[46m&set clr2=[90m[107m[30m)
if not defined dummy (set /p nothing=[?25l<nul)

:exitmenu_main
rem Main Exit Menu
if "%exitmenuexit%"=="true" (set exitmenucurrent=& call :exitmenu_exit & goto :mainmenu)
if not defined exitmenuboot (set MenuRedrew=true& set /p nothing=%clrgra%<nul& call :Mainmenudrew & echo %clr2% & set exitmenuboot=true)
call :exitmenu_Core_Drew
rem I'm doing this because when I use ANSI ESC sequences in Virtual Studio Code, the parentheses are colored incorrectly and I don't like that
if not defined dummy (
echo.
echo.
echo [3;22H O================O 
echo [4;22H I Turn off batch I 
echo [5;22H O==========O====%ccmmul%===%clr2%===O===========O 
echo [6;22H I%emb%     ^|    %clr2%I%emb2%   ╱   ╲  %clr2%I%emb3%           %clr2%I 
echo [7;22H I%emb%   ╱ ^| ╲  %clr2%I%emb2%  ⋁     ⋀ %clr2%I%emb3%  ^-^-^-^-^-^-^>  %clr2%I 
echo [8;22H I%emb%   ╲___╱  %clr2%I%emb2%   ╲___╱  %clr2%I%emb3%           %clr2%I 
echo [9;22H O==========O==========O===========O 
echo [10;22H I[10;57HI 
echo [11;22H O=================================O 
echo [12;18H%clrgra%1~3 or A,D to move, Y,E to Select, B to Exit%clr2%
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
if "%Exitmenucurrent%"=="0" (echo [10;24H Nothing Selected...& exit /b)
if "%Exitmenucurrent%"=="1" (echo [10;24H Shutdown& set emb=%clred%& set emb2=& set emb3=& exit /b)
if "%Exitmenucurrent%"=="2" (echo [10;24H Reboot& set emb2=%clrgrn%& set emb=& set emb3=& exit /b)
if "%Exitmenucurrent%"=="3" (echo [10;24H Back to mainmenu& set emb3=%clrcyan%& set emb2=& set emb=& exit /b)
if "%Exitmenucurrent%"=="1c" (echo [10;24H Are you sure?& exit /b)
if "%Exitmenucurrent%"=="2c" (echo [10;24H Are you sure?& exit /b)
exit /b

:exitmenu_exit
rem initialize of variable
set exitmenuexit=& set emb=& set emb2=& set emb3=& set exitmenuboot=& set clred=& set clrgrn=& set clrcyan=& set clrgra=
if not defined dummy (set /p nothing=[?25h<nul)
exit /b



:batshutdown
call :Core_Powershell 2
if not defined dummy (set /p nothing=[?25l<nul)
title Cursor Changer ^| BYE
cls
if "%wmodetoggle%"=="true" (set welcomelineclr=[38;2;135;135;135m& set welcomelineclr2=[0m[107m[30m& set welcomelineclr3=[30m) else (set welcomelineclr=[38;2;120;120;120m& set welcomelineclr2=[0m& set welcomelineclr3=[39m)
if "%wmodetoggle%"=="true" (for /l %%i in (0,1,3) do (set /p nothing=[%%i;0H[48;2;230;230;230m                                                                           [0;0H<nul)) else (for /l %%i in (0,1,3) do (set /p nothing=[%%i;0H[48;2;20;20;20m                                                                           [0;0H<nul))
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
echo.
echo                                             Shutting Down...
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
if not defined dummy (echo [23C2021-2024 tamago_1908 %batbuild%)
set welcomelineclr=& set welcomelineclr2=& set welcomelineclr3=
call :exitmenuexit
timeout /t 1 /nobreak >nul
call :exit 0

:mainmenu_resetcolor
if not defined dummy (set clr=[7m&set clred=[41m&set clrgrn=[42m&set clrcyan=[46m&set clrgra=[90m&set clr2=[0m& set ccmmul=[4m)
if "%wmodetoggle%"=="false" (set clr=[7m&set clred=[41m&set clrgrn=[42m&set clrgra=[90m&set clrcyan=[46m&set clr2=[0m)
if "%wmodetoggle%"=="true" (set clr=[100m[97m&set clred=[41m&set clrgrn=[42m&set clrgra=[107m[38;2;140;140;140m&set clrcyan=[46m&set clr2=[0m[107m[30m)
exit /b

:exitmenuexit
set clrcyan=& set clrgra=& set clred=& set clrgrn=& set clryel=& set clrmag=& exit /b


:UpdateAvailable
rem GUI type 3
rem Preparing of Menu and Variables
if not defined dummy (set clr=[7m&set clrgra=[90m&set clryel=[93m&set clrwhi=[97m&set clr2=[0m)
if "%wmodetoggle%"=="false" (set clr=[7m&set clrgra=[90m&set clryel=[93m&set clrwhi=[97m&set clr2=[0m)
if "%wmodetoggle%"=="true" (set clr=[100m[97m&set clrgra=[107m[38;2;140;140;140m&set clryel=[93m&set clrwhi=[30m&set clr2=[90m[107m[30m)
set UAsel=0
:UpdateAvailable_main
rem Draw Update Available UI
title Cursor Changer ^| New Update is Available!
if not defined dummy (set /p nothing=[?25l%clr2%<nul)
if not defined UAboot (set MenuRedrew=true& set /p nothing=%clrgra%<nul& call :Mainmenudrew & echo %clr2% & set UAboot=true)
if "%UAexit%"=="true" (goto :UpdateAvailable_exit)
if not "%UAsel%"=="3" (set UAselPre=%UAsel%)
if not defined dummy (
echo [5;16H O=========================================O 
echo [6;16H I                                         I 
echo [7;16H I         New Update is Available!        I 
echo [8;16H I                                         I 
echo [9;16H I[9;35H%clryel%-----^>%clr2%[9;59HI 
echo [10;16H I         %clrgra%^(Current^)    ^(Updated^)%clr2%          I 
echo [11;16H I                                         I 
echo [12;16H I         Do you want to Update?          I 
echo [13;16H I[13;59HI 
echo [14;16H I                                         I 
echo [15;16H I    O=============O    O============O    I 
echo [16;16H I    I%UAcb1%     Yes     %clr2%I    I%UAcb2%     No     %clr2%I    I 
echo [17;16H I    O=============O    O============O    I 
echo [18;16H I            O================O           I 
echo [19;16H I            I%UAcb3% See Change log %clr2%I           I 
echo [20;17HI            O================O           I
echo [21;17HI                                         I
echo [22;17HI %clrgra%Move: WASD or 1~3 Select: Y,E Exit: B,N%clr2% I
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
if %ErrorLevel%==8 (call :UpdateAvailable_Core)
if %ErrorLevel%==9 (call :UpdateAvailable_Core)
set UAcb1=& set UAcb2=& set UAcb3=& set UAcb%UAsel%=%clr%& goto :UpdateAvailable_main

:UpdateAvailable_Core
rem Processing of Confirm key, like Y and E.
set /p nothing=%clr2%<nul
if %UAsel%==1 (cls & title Cursor Changer ^| Updating...& echo Updating...& call :Powersheller Doupdate)
if %UAsel%==2 (set UAexit=true& exit /b)
if %UAsel%==3 (cls & title Cursor Changer ^| Change log& echo Loading Change log...& echo. & call :Powersheller Changelog& pause & set UAboot=& mode con: cols=75 lines=25 & exit /b)

:UpdateAvailable_VersionDraw
rem Detect version
set /p nothing=%clr2%<nul
if "%batbeta%"=="True" (set /p nothing=[13;18H %clrgra%This update is beta, and maybe unstable%clr2%<nul)
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
set UAexit=& set UAboot=& set UAsel=& set UAselpre=& set UAPre=& set UAcb1=& set UAcb2=& set UAcb3=& set clrgra=& set clryel=
set batbeta=& set updateavailable=& set updatemyversion=& set updateversion=
set checkupdatetoggle=false
if not defined dummy (set /p nothing=[?25h<nul)
exit /b



rem Depiction of the settings menu
:setting
set wantload=
set settinghelptoggle=false
if not defined dummy (set clr=[7m&set clr2=[0m)
if "%wmodetoggle%"=="false" (set clr=[7m&set clr2=[0m)
if "%wmodetoggle%"=="true" (set clr=[100m[97m&set clr2=[0m[107m[30m)
rem Detect if a Setting file exists
cd /d %batchmainpath%
rem Location The drive where the OS is located C:\Users\Username
rem (e.g. if the user's name is "test" and the OS is in drive "C:\" C:\Users\Test)
if not exist %Settingsfile% (goto :dogcheck)
title Cursor Changer ^| Setting Menu
set selected=
if not defined "%clrgra%" (set clrgra=[90m)
Cls
echo.
Echo                                Setting Menu
echo. 
echo O========================O                 O=========O
echo I        Category        I                 I Setting I
echo O========================O=================O=========O====================O
echo I                        I                                                I
echo I Cursor Changer Feature I  Category is currently not selected...         I
echo I                        I                                                I
echo I========================I                                                I
echo I  Category  up or down  I                                                I
echo I========================I                                                I
Echo I                        I  %clrgra%Press either [W S] or [1 2] to select the%clr2%     I
echo I Cursor Changer Visuals I  %clrgra%category.%clr2%                                     I
echo I                        I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%       Help  Mode       %clrhelp2%I  I  Move: W A S D  Num I Back : B I Slct : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12wsdbye3 /n /m "Specify what you want to change by number or by moving with wasd :"
set clrgra=
if %ErrorLevel%==1 goto :settingcategory1
if %ErrorLevel%==2 goto :settingcategory2
if %ErrorLevel%==3 goto :settingcategory1
if %ErrorLevel%==4 goto :settingcategory1
if %ErrorLevel%==5 goto :settingcategory1
if %ErrorLevel%==6 goto :Mainmenuboot
if %ErrorLevel%==7 goto :settingcategory1
if %ErrorLevel%==8 goto :settingcategory1
if %ErrorLevel%==9 goto :settingcategoryhelpmode

:settingcategory1
title Cursor Changer ^| Setting Menu
set selected=
Cls
echo.
Echo                                Setting Menu
echo. 
echo O========================O                 O=========O
echo I        Category        I                 I Setting I
echo O========================O=================O=========O====================O
echo I%clr%                        %clr2%I                                                I
echo I%clr% Cursor Changer Feature %clr2%I  This Category is related to the functionality I
echo I%clr%                        %clr2%I  setting of the Cursor Changer.                I
echo I========================I                                                I
echo I  Category  up or down  I                                                I
echo I========================I                                                I
Echo I                        I                                                I
echo I Cursor Changer Visuals I                                                I
echo I                        I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%       Help  Mode       %clrhelp2%I  I  Move: W A S D  Num I Back : B I Slct : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12wsdbye3 /n /m "Specify what you want to change by number or by moving with wasd :"
if %ErrorLevel%==1 goto :settingcategory1
if %ErrorLevel%==2 goto :settingcategory2
if %ErrorLevel%==3 goto :settingcategory1
if %ErrorLevel%==4 goto :settingcategory2
if %ErrorLevel%==5 goto :settingcategory1int
if %ErrorLevel%==6 goto :Mainmenuboot
if %ErrorLevel%==7 goto :settingcategory1int
if %ErrorLevel%==8 goto :settingcategory1int
if %ErrorLevel%==9 goto :settingcategoryhelpmode

:settingcategory2
rem Detect if a Setting file exists
cd /d %batchmainpath%
rem Location The drive where the OS is located C:\Users\Username
rem (e.g. if the user's name is "test" and the OS is in drive "C:\" C:\Users\Test)
if not exist %Settingsfile% (goto :dogcheck)
title Cursor Changer ^| Setting Menu
set selected=
if not defined "%clrgra%" (set clrgra=[90m)
Cls
echo.
Echo                                Setting Menu
echo. 
echo O========================O                 O=========O
echo I        Category        I                 I Setting I
echo O========================O=================O=========O====================O
echo I                        I                                                I
echo I Cursor Changer Feature I  This Category is related to the visuality     I
echo I                        I  setting of the Cursor Changer.                I
echo I========================I  %clrgra%(like theme)%clr2%                                  I
echo I  Category  up or down  I                                                I
echo I========================I                                                I
Echo I%clr%                        %clr2%I                                                I
echo I%clr% Cursor Changer Visuals %clr2%I                                                I
echo I%clr%                        %clr2%I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%       Help  Mode       %clrhelp2%I  I  Move: W A S D  Num I Back : B I Slct : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12wsdbye3 /n /m "Specify what you want to change by number or by moving with wasd :"
set clrgra=
if %ErrorLevel%==1 goto :settingcategory1
if %ErrorLevel%==2 goto :settingcategory2
if %ErrorLevel%==3 goto :settingcategory1
if %ErrorLevel%==4 goto :settingcategoryhelpmode
if %ErrorLevel%==5 goto :settingcategory2int
if %ErrorLevel%==6 goto :Mainmenuboot
if %ErrorLevel%==7 goto :settingcategory2int
if %ErrorLevel%==8 goto :settingcategory2int
if %ErrorLevel%==9 goto :settingcategoryhelpmode

rem category

:settingcategory1int
title Cursor Changer ^| Setting Menu
set selected=
Cls
echo.
Echo                                Setting Menu
echo. 
echo O========================O                 O=========O
echo I        Category        I                 I Setting I
echo O========================O=================O=========O=========O==========O
echo I%clr%                        %clr2%I 1 Boot as Cursor Changer            I  %setting1onoff%   I
echo I%clr% Cursor Changer Feature %clr2%I                                     O==========O
echo I%clr%                        %clr2%I 2 Admin When Boot                   I  %setting2onoff%   I
echo I========================I                                     O==========O
echo I  Category  up or down  I 3 Check Update at boot              I  %setting3onoff%   I
echo I========================I                                     O==========O
Echo I                        I 4 Allow sound to play               I  %setting4onoff%   I
echo I Cursor Changer Visuals I                                     O==========O
echo I                        I 5 Initialization or Uninstallation             I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%       Help  Mode       %clrhelp2%I  I  Move: W A S D  Num I Back : B I Slct : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12wsdbye3 /n /m "Specify what you want to change by number or by moving with wasd :"
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
title Cursor Changer ^| Setting Menu
set selected=
Cls
echo.
Echo                                Setting Menu
echo. 
echo O========================O                 O=========O
echo I        Category        I                 I Setting I
echo O========================O=================O=========O=========O==========O
echo I%clr%                        %clr2%I %clr%1 Boot as Cursor Changer%clr2%            I  %setting1onoff%   I
echo I%clr% Cursor Changer Feature %clr2%I                                     O==========O
echo I%clr%                        %clr2%I 2 Admin When Boot                   I  %setting2onoff%   I
echo I========================I                                     O==========O
echo I  Category  up or down  I 3 Check Update at boot              I  %setting3onoff%   I
echo I========================I                                     O==========O
Echo I                        I 4 Allow sound to play               I  %setting4onoff%   I
echo I Cursor Changer Visuals I                                     O==========O
echo I                        I 5 Initialization or Uninstallation             I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%       Help  Mode       %clrhelp2%I  I  Move: W A S D  Num I Back : B I Slct : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12345wsabye /n /m "Specify what you want to change by number or by moving with wasd :"
if %ErrorLevel%==1 goto :settingcategory1intsetting1
if %ErrorLevel%==2 goto :settingcategory1intsetting2
if %ErrorLevel%==3 goto :settingcategory1intsetting3
if %ErrorLevel%==4 goto :settingcategory1intsetting4
if %ErrorLevel%==5 goto :settingcategory1intsetting5
if %ErrorLevel%==6 goto :settingcategory1intsetting1
if %ErrorLevel%==7 goto :settingcategory1intsetting2
if %ErrorLevel%==8 goto :settingcategory1int
if %ErrorLevel%==9 goto :settingcategory1int
if %ErrorLevel%==10 Call :SettingApplyer 1
if %ErrorLevel%==11 Call :SettingApplyer 1
goto :settingcategory1intsetting1

:settingcategory1intsetting2
title Cursor Changer ^| Setting Menu
set selected=
Cls
echo.
Echo                                Setting Menu
echo. 
echo O========================O                 O=========O
echo I        Category        I                 I Setting I
echo O========================O=================O=========O=========O==========O
echo I%clr%                        %clr2%I 1 Boot as Cursor Changer            I  %setting1onoff%   I
echo I%clr% Cursor Changer Feature %clr2%I                                     O==========O
echo I%clr%                        %clr2%I %clr%2 Admin When Boot%clr2%                   I  %setting2onoff%   I
echo I========================I                                     O==========O
echo I  Category  up or down  I 3 Check Update at boot              I  %setting3onoff%   I
echo I========================I                                     O==========O
Echo I                        I 4 Allow sound to play               I  %setting4onoff%   I
echo I Cursor Changer Visuals I                                     O==========O
echo I                        I 5 Initialization or Uninstallation             I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%       Help  Mode       %clrhelp2%I  I  Move: W A S D  Num I Back : B I Slct : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12345wsabye /n /m "Specify what you want to change by number or by moving with wasd :"
if %ErrorLevel%==1 goto :settingcategory1intsetting1
if %ErrorLevel%==2 goto :settingcategory1intsetting2
if %ErrorLevel%==3 goto :settingcategory1intsetting3
if %ErrorLevel%==4 goto :settingcategory1intsetting4
if %ErrorLevel%==5 goto :settingcategory1intsetting5
if %ErrorLevel%==6 goto :settingcategory1intsetting1
if %ErrorLevel%==7 goto :settingcategory1intsetting3
if %ErrorLevel%==8 goto :settingcategory1int
if %ErrorLevel%==9 goto :settingcategory1int
if %ErrorLevel%==10 Call :SettingApplyer 2
if %ErrorLevel%==11 Call :SettingApplyer 2
goto :settingcategory1intsetting2


:settingcategory1intsetting3
title Cursor Changer ^| Setting Menu
set selected=
Cls
echo.
Echo                                Setting Menu
echo. 
echo O========================O                 O=========O
echo I        Category        I                 I Setting I
echo O========================O=================O=========O=========O==========O
echo I%clr%                        %clr2%I 1 Boot as Cursor Changer            I  %setting1onoff%   I
echo I%clr% Cursor Changer Feature %clr2%I                                     O==========O
echo I%clr%                        %clr2%I 2 Admin When Boot                   I  %setting2onoff%   I
echo I========================I                                     O==========O
echo I  Category  up or down  I %clr%3 Check Update at boot%clr2%              I  %setting3onoff%   I
echo I========================I                                     O==========O
Echo I                        I 4 Allow sound to play               I  %setting4onoff%   I
echo I Cursor Changer Visuals I                                     O==========O
echo I                        I 5 Initialization or Uninstallation             I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%       Help  Mode       %clrhelp2%I  I  Move: W A S D  Num I Back : B I Slct : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12345wsabye /n /m "Specify what you want to change by number or by moving with wasd :"
if %ErrorLevel%==1 goto :settingcategory1intsetting1
if %ErrorLevel%==2 goto :settingcategory1intsetting2
if %ErrorLevel%==3 goto :settingcategory1intsetting3
if %ErrorLevel%==4 goto :settingcategory1intsetting4
if %ErrorLevel%==5 goto :settingcategory1intsetting5
if %ErrorLevel%==6 goto :settingcategory1intsetting2
if %ErrorLevel%==7 goto :settingcategory1intsetting4
if %ErrorLevel%==8 goto :settingcategory1int
if %ErrorLevel%==9 goto :settingcategory1int
if %ErrorLevel%==10 Call :SettingApplyer 3
if %ErrorLevel%==11 Call :SettingApplyer 3
goto :settingcategory1intsetting3


:settingcategory1intsetting4
title Cursor Changer ^| Setting Menu
set selected=
Cls
echo.
Echo                                Setting Menu
echo. 
echo O========================O                 O=========O
echo I        Category        I                 I Setting I
echo O========================O=================O=========O=========O==========O
echo I%clr%                        %clr2%I 1 Boot as Cursor Changer            I  %setting1onoff%   I
echo I%clr% Cursor Changer Feature %clr2%I                                     O==========O
echo I%clr%                        %clr2%I 2 Admin When Boot                   I  %setting2onoff%   I
echo I========================I                                     O==========O
echo I  Category  up or down  I 3 Check Update at boot              I  %setting3onoff%   I
echo I========================I                                     O==========O
Echo I                        I %clr%4 Allow sound to play%clr2%               I  %setting4onoff%   I
echo I Cursor Changer Visuals I                                     O==========O
echo I                        I 5 Initialization or Uninstallation             I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%       Help  Mode       %clrhelp2%I  I  Move: W A S D  Num I Back : B I Slct : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12345wsabye /n /m "Specify what you want to change by number or by moving with wasd :"
if %ErrorLevel%==1 goto :settingcategory1intsetting1
if %ErrorLevel%==2 goto :settingcategory1intsetting2
if %ErrorLevel%==3 goto :settingcategory1intsetting3
if %ErrorLevel%==4 goto :settingcategory1intsetting4
if %ErrorLevel%==5 goto :settingcategory1intsetting5
if %ErrorLevel%==6 goto :settingcategory1intsetting3
if %ErrorLevel%==7 goto :settingcategory1intsetting5
if %ErrorLevel%==8 goto :settingcategory1int
if %ErrorLevel%==9 goto :settingcategory1int
if %ErrorLevel%==10 Call :SettingApplyer 4
if %ErrorLevel%==11 Call :SettingApplyer 4
goto :settingcategory1intsetting4


:settingcategory1intsetting5
title Cursor Changer ^| Setting Menu
set selected=
Cls
echo.
Echo                                Setting Menu
echo. 
echo O========================O                 O=========O
echo I        Category        I                 I Setting I
echo O========================O=================O=========O=========O==========O
echo I%clr%                        %clr2%I 1 Boot as Cursor Changer            I  %setting1onoff%   I
echo I%clr% Cursor Changer Feature %clr2%I                                     O==========O
echo I%clr%                        %clr2%I 2 Admin When Boot                   I  %setting2onoff%   I
echo I========================I                                     O==========O
echo I  Category  up or down  I 3 Check Update at boot              I  %setting3onoff%   I
echo I========================I                                     O==========O
Echo I                        I 4 Allow sound to play               I  %setting4onoff%   I
echo I Cursor Changer Visuals I                                     O==========O
echo I                        I %clr%5 Initialization or Uninstallation%clr2%             I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%       Help  Mode       %clrhelp2%I  I  Move: W A S D  Num I Back : B I Slct : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12345wsabye /n /m "Specify what you want to change by number or by moving with wasd :"
if %ErrorLevel%==1 goto :settingcategory1intsetting1
if %ErrorLevel%==2 goto :settingcategory1intsetting2
if %ErrorLevel%==3 goto :settingcategory1intsetting3
if %ErrorLevel%==4 goto :settingcategory1intsetting4
if %ErrorLevel%==5 goto :settingcategory1intsetting5
if %ErrorLevel%==6 goto :settingcategory1intsetting4
if %ErrorLevel%==7 goto :settingcategory1intsetting5
if %ErrorLevel%==8 goto :settingcategory1int
if %ErrorLevel%==9 goto :settingcategory1int
if %ErrorLevel%==10 goto :Uninstall
if %ErrorLevel%==11 goto :Uninstall
goto :settingcategory1intsetting5

:settingcategory2int
title Cursor Changer ^| Setting Menu
set selected=
Cls
echo.
Echo                                Setting Menu
echo. 
echo O========================O                 O=========O
echo I        Category        I                 I Setting I
echo O========================O=================O=========O=========O==========O
echo I                        I 1 Boot animation Settings           I     ^>    I
echo I Cursor Changer Feature I                                     O==========O
echo I                        I 2 Show Underline at main menu       I  %setting6onoff%   I
echo I========================I                                     O==========O
echo I  Category  up or down  I 3 Show Background at main menu      I  %setting7onoff%   I
echo I========================I                                     O==========O
Echo I%clr%                        %clr2%I 4 %wmodeonoff%                        I
echo I%clr% Cursor Changer Visuals %clr2%I                                                I
echo I%clr%                        %clr2%I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%       Help  Mode       %clrhelp2%I  I  Move: W A S D  Num I Back : B I Slct : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12wsdbye3 /n /m "Specify what you want to change by number or by moving with wasd :"
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
title Cursor Changer ^| Setting Menu
set selected=
Cls
echo.
Echo                                Setting Menu
echo. 
echo O========================O                 O=========O
echo I        Category        I                 I Setting I
echo O========================O=================O=========O=========O==========O
echo I                        I %clr%1 Boot animation Settings%clr2%           I     ^>    I
echo I Cursor Changer Feature I                                     O==========O
echo I                        I 2 Show Underline at main menu       I  %setting6onoff%   I
echo I========================I                                     O==========O
echo I  Category  up or down  I 3 Show Background at main menu      I  %setting7onoff%   I
echo I========================I                                     O==========O
Echo I%clr%                        %clr2%I 4 %wmodeonoff%                        I
echo I%clr% Cursor Changer Visuals %clr2%I                                                I
echo I%clr%                        %clr2%I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%       Help  Mode       %clrhelp2%I  I  Move: W A S D  Num I Back : B I Slct : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12wsabyed34 /n /m "Specify what you want to change by number or by moving with wasd :"
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
if %ErrorLevel%==11 goto :settingcategory2intsetting4

:settingcategory2intsetting2
title Cursor Changer ^| Setting Menu
set selected=
Cls
echo.
Echo                                Setting Menu
echo. 
echo O========================O                 O=========O
echo I        Category        I                 I Setting I
echo O========================O=================O=========O=========O==========O
echo I                        I 1 Boot animation Settings           I     ^>    I
echo I Cursor Changer Feature I                                     O==========O
echo I                        I %clr%2 Show Underline at main menu%clr2%       I  %setting6onoff%   I
echo I========================I                                     O==========O
echo I  Category  up or down  I 3 Show Background at main menu      I  %setting7onoff%   I
echo I========================I                                     O==========O
Echo I%clr%                        %clr2%I 4 %wmodeonoff%                        I
echo I%clr% Cursor Changer Visuals %clr2%I                                                I
echo I%clr%                        %clr2%I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%       Help  Mode       %clrhelp2%I  I  Move: W A S D  Num I Back : B I Slct : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12wsabye34 /n /m "Specify what you want to change by number or by moving with wasd :"
if %ErrorLevel%==1 goto :settingcategory2intsetting1
if %ErrorLevel%==2 goto :settingcategory2intsetting2
if %ErrorLevel%==3 goto :settingcategory2intsetting1
if %ErrorLevel%==4 goto :settingcategory2intsetting3
if %ErrorLevel%==5 goto :settingcategory2int
if %ErrorLevel%==6 goto :settingcategory2int
if %ErrorLevel%==7 Call :SettingApplyer 6
if %ErrorLevel%==8 Call :SettingApplyer 6
if %ErrorLevel%==9 goto :settingcategory2intsetting3
if %ErrorLevel%==10 goto :settingcategory2intsetting4
goto :settingcategory2intsetting2


:settingcategory2intsetting3
title Cursor Changer ^| Setting Menu
set selected=
Cls
echo.
Echo                                Setting Menu
echo. 
echo O========================O                 O=========O
echo I        Category        I                 I Setting I
echo O========================O=================O=========O=========O==========O
echo I                        I 1 Boot animation Settings           I     ^>    I
echo I Cursor Changer Feature I                                     O==========O
echo I                        I 2 Show Underline at main menu       I  %setting6onoff%   I
echo I========================I                                     O==========O
echo I  Category  up or down  I %clr%3 Show Background at main menu%clr2%      I  %setting7onoff%   I
echo I========================I                                     O==========O
Echo I%clr%                        %clr2%I 4 %wmodeonoff%                        I
echo I%clr% Cursor Changer Visuals %clr2%I                                                I
echo I%clr%                        %clr2%I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%       Help  Mode       %clrhelp2%I  I  Move: W A S D  Num I Back : B I Slct : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12wsabye34 /n /m "Specify what you want to change by number or by moving with wasd :"
if %ErrorLevel%==1 goto :settingcategory2intsetting1
if %ErrorLevel%==2 goto :settingcategory2intsetting2
if %ErrorLevel%==3 goto :settingcategory2intsetting2
if %ErrorLevel%==4 goto :settingcategory2intsetting4
if %ErrorLevel%==5 goto :settingcategory2int
if %ErrorLevel%==6 goto :settingcategory2int
if %ErrorLevel%==7 Call :SettingApplyer 7
if %ErrorLevel%==8 Call :SettingApplyer 7
if %ErrorLevel%==9 goto :settingcategory2intsetting3
if %ErrorLevel%==10 goto :settingcategory2intsetting4
goto :settingcategory2intsetting3


:settingcategory2intsetting4
title Cursor Changer ^| Setting Menu
set selected=
Cls
echo.
Echo                                Setting Menu
echo. 
echo O========================O                 O=========O
echo I        Category        I                 I Setting I
echo O========================O=================O=========O=========O==========O
echo I                        I 1 Boot animation Settings           I     ^>    I
echo I Cursor Changer Feature I                                     O==========O
echo I                        I 2 Show Underline at main menu       I  %setting6onoff%   I
echo I========================I                                     O==========O
echo I  Category  up or down  I 3 Show Background at main menu      I  %setting7onoff%   I
echo I========================I                                     O==========O
Echo I%clr%                        %clr2%I %clr%4 %wmodeonoff%%clr2%                        I
echo I%clr% Cursor Changer Visuals %clr2%I                                                I
echo I%clr%                        %clr2%I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%       Help  Mode       %clrhelp2%I  I  Move: W A S D  Num I Back : B I Slct : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12wsabye34 /n /m "Specify what you want to change by number or by moving with wasd :"
if %ErrorLevel%==1 goto :settingcategory2intsetting1
if %ErrorLevel%==2 goto :settingcategory2intsetting2
if %ErrorLevel%==3 goto :settingcategory2intsetting3
if %ErrorLevel%==4 goto :settingcategory2intsetting4
if %ErrorLevel%==5 goto :settingcategory2int
if %ErrorLevel%==6 goto :settingcategory2int
if %ErrorLevel%==7 Call :SettingApplyer wmode
if %ErrorLevel%==8 Call :SettingApplyer wmode
if %ErrorLevel%==9 goto :settingcategory2intsetting3
if %ErrorLevel%==10 goto :settingcategory2intsetting4
goto :settingcategory2intsetting4


:settingcategory2intsetting5_stg0
set setting5_stg_whereyou=stg0
title Cursor Changer ^| Setting Menu
call :settingcategory2intsetting5blockcheck
set selected=
Cls
echo.
Echo                                Setting Menu
echo. 
echo O========================O                 O=========O O==================O
echo I        Category        I                 I Setting I I Setting5/...     I
echo O========================O=================O=========O=O=======O==========O
echo I                        I %clr%1 Boot animation%clr2%                    I  %setting5onoff%   I
echo I Cursor Changer Feature I                                     O==========O
echo I                        I %sc2s5s1lock%2 Linux-ish Boot animation%sc2s5s1lock2%          I  %setting5_s1onoff%   I
echo I========================I                                     O==========O
echo I  Category  up or down  I %sc2s5s2lock%3 Simple boot animation%sc2s5s2lock2%             I  %setting5_s2onoff%   I
echo I========================I                                     O==========O
Echo I%clr%                        %clr2%I %sc2s5s3lock%4 Raw Boot animation%sc2s5s3lock2%                I  %setting5_s3onoff%   I
echo I%clr% Cursor Changer Visuals %clr2%I                                     O==========O
echo I%clr%                        %clr2%I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%       Help  Mode       %clrhelp2%I  I  Move: W A S D  Num I Back : B I Slct : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 123wsabye4 /n /m "Specify what you want to change by number or by moving with wasd :"
if %ErrorLevel%==1 goto :settingcategory2intsetting5_stg0
if %ErrorLevel%==2 goto :settingcategory2intsetting5_stg1
if %ErrorLevel%==3 goto :settingcategory2intsetting5_stg2
if %ErrorLevel%==4 goto :settingcategory2intsetting5_stg0
if %ErrorLevel%==5 goto :settingcategory2intsetting5_stg1
if %ErrorLevel%==6 goto :settingcategory2intsetting1
if %ErrorLevel%==7 goto :settingcategory2intsetting1
if %ErrorLevel%==8 Call :SettingApplyer 5
if %ErrorLevel%==9 Call :SettingApplyer 5
if %ErrorLevel%==10 goto :settingcategory2intsetting5_stg3
goto :settingcategory2intsetting5_stg0


:settingcategory2intsetting5_stg1
if "%setting5onoff%"=="false" if "%linuxboot%"=="false" if "%setting5_stg_whereyou%"=="stg1" (goto :settingcategory2intsetting5_stg0)
if "%setting5onoff%"=="false" if "%setting5_stg_whereyou%"=="stg2" (goto :settingcategory2intsetting5_stg0) else if "%linuxboot%"=="false" if "%setting5onoff%"=="false" if "%setting5_stg_whereyou%"=="stg0" (goto :settingcategory2intsetting5_stg2)
if "%simpleboot%"=="true" if "%setting5_stg_whereyou%"=="stg0" (goto :settingcategory2intsetting5_stg2) else if "%setting5_stg_whereyou%"=="stg2" (goto :settingcategory2intsetting5_stg0)
if "%rawboot%"=="true" if "%setting5_stg_whereyou%"=="stg3" (goto :settingcategory2intsetting5_stg3) else if "%setting5_stg_whereyou%"=="stg0" (goto :settingcategory2intsetting5_stg3)
set setting5_stg_whereyou=stg1
title Cursor Changer ^| Setting Menu
call :settingcategory2intsetting5blockcheck
set selected=
Cls
echo.
Echo                                Setting Menu
echo. 
echo O========================O                 O=========O O==================O
echo I        Category        I                 I Setting I I Setting5/...     I
echo O========================O=================O=========O=O=======O==========O
echo I                        I 1 Boot animation                    I  %setting5onoff%   I
echo I Cursor Changer Feature I                                     O==========O
echo I                        I %clr%2 Linux-ish Boot animation%clr2%          I  %setting5_s1onoff%   I
echo I========================I                                     O==========O
echo I  Category  up or down  I %sc2s5s2lock%3 Simple boot animation%sc2s5s2lock2%             I  %setting5_s2onoff%   I
echo I========================I                                     O==========O
Echo I%clr%                        %clr2%I %sc2s5s3lock%4 Raw Boot animation%sc2s5s3lock2%                I  %setting5_s3onoff%   I
echo I%clr% Cursor Changer Visuals %clr2%I                                     O==========O
echo I%clr%                        %clr2%I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%       Help  Mode       %clrhelp2%I  I  Move: W A S D  Num I Back : B I Slct : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 123wsabye4 /n /m "Specify what you want to change by number or by moving with wasd :"
if %ErrorLevel%==1 goto :settingcategory2intsetting5_stg0
if %ErrorLevel%==2 goto :settingcategory2intsetting5_stg1
if %ErrorLevel%==3 goto :settingcategory2intsetting5_stg2
if %ErrorLevel%==4 goto :settingcategory2intsetting5_stg0
if %ErrorLevel%==5 goto :settingcategory2intsetting5_stg2
if %ErrorLevel%==6 goto :settingcategory2intsetting1
if %ErrorLevel%==7 goto :settingcategory2intsetting1
if %ErrorLevel%==8 Call :SettingApplyer 5_1
if %ErrorLevel%==9 Call :SettingApplyer 5_1
if %ErrorLevel%==10 goto :settingcategory2intsetting5_stg3
goto :settingcategory2intsetting5_stg1


:settingcategory2intsetting5_stg2
if "%linuxboot%"=="true" if "%setting5_stg_whereyou%"=="stg1" (goto :settingcategory2intsetting5_stg1) else if "%setting5_stg_whereyou%"=="stg0" (goto :settingcategory2intsetting5_stg0)
if "%rawboot%"=="true" if "%setting5_stg_whereyou%"=="stg3" (goto :settingcategory2intsetting5_stg0) else if "%setting5_stg_whereyou%"=="stg0" (goto :settingcategory2intsetting5_stg3)
set setting5_stg_whereyou=stg2
title Cursor Changer ^| Setting Menu
call :settingcategory2intsetting5blockcheck
set selected=
Cls
echo.
Echo                                Setting Menu
echo. 
echo O========================O                 O=========O O==================O
echo I        Category        I                 I Setting I I Setting5/...     I
echo O========================O=================O=========O=O=======O==========O
echo I                        I 1 Boot animation                    I  %setting5onoff%   I
echo I Cursor Changer Feature I                                     O==========O
echo I                        I %sc2s5s1lock%2 Linux-ish Boot animation%sc2s5s1lock2%          I  %setting5_s1onoff%   I
echo I========================I                                     O==========O
echo I  Category  up or down  I %clr%3 Simple boot animation%clr2%             I  %setting5_s2onoff%   I
echo I========================I                                     O==========O
Echo I%clr%                        %clr2%I %sc2s5s3lock%4 Raw Boot animation%sc2s5s3lock2%                I  %setting5_s3onoff%   I
echo I%clr% Cursor Changer Visuals %clr2%I                                     O==========O
echo I%clr%                        %clr2%I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%       Help  Mode       %clrhelp2%I  I  Move: W A S D  Num I Back : B I Slct : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 123wsabye4 /n /m "Specify what you want to change by number or by moving with wasd :"
if %ErrorLevel%==1 goto :settingcategory2intsetting5_stg0
if %ErrorLevel%==2 goto :settingcategory2intsetting5_stg1
if %ErrorLevel%==3 goto :settingcategory2intsetting5_stg2
if %ErrorLevel%==4 goto :settingcategory2intsetting5_stg1
if %ErrorLevel%==5 goto :settingcategory2intsetting5_stg3
if %ErrorLevel%==6 goto :settingcategory2intsetting1
if %ErrorLevel%==7 goto :settingcategory2intsetting1
if %ErrorLevel%==8 Call :SettingApplyer 5_2
if %ErrorLevel%==9 Call :SettingApplyer 5_2
if %ErrorLevel%==10 goto :settingcategory2intsetting5_stg3
goto :settingcategory2intsetting5_stg2

:settingcategory2intsetting5_stg3
if "%setting5onoff%"=="false" if "%setting5_stg_whereyou%"=="stg0" (goto :settingcategory2intsetting5_stg0) else if "%setting5_stg_whereyou%"=="stg2" (goto :settingcategory2intsetting5_stg2)
if "%linuxboot%"=="true" if "%setting5_stg_whereyou%"=="stg1" (goto :settingcategory2intsetting5_stg1) else if "%setting5_stg_whereyou%"=="stg0" (goto :settingcategory2intsetting5_stg0)
if "%simpleboot%"=="true" if "%setting5_stg_whereyou%"=="stg2" (goto :settingcategory2intsetting5_stg2) else if "%setting5_stg_whereyou%"=="stg0" (goto :settingcategory2intsetting5_stg0)
set setting5_stg_whereyou=stg3
title Cursor Changer ^| Setting Menu
call :settingcategory2intsetting5blockcheck
set selected=
Cls
echo.
Echo                                Setting Menu
echo. 
echo O========================O                 O=========O O==================O
echo I        Category        I                 I Setting I I Setting5/...     I
echo O========================O=================O=========O=O=======O==========O
echo I                        I 1 Boot animation                    I  %setting5onoff%   I
echo I Cursor Changer Feature I                                     O==========O
echo I                        I %sc2s5s1lock%2 Linux-ish Boot animation%sc2s5s1lock2%          I  %setting5_s1onoff%   I
echo I========================I                                     O==========O
echo I  Category  up or down  I %sc2s5s2lock%3 Simple boot animation%sc2s5s2lock2%             I  %setting5_s2onoff%   I
echo I========================I                                     O==========O
Echo I%clr%                        %clr2%I %clr%4 Raw Boot animation%clr2%                I  %setting5_s3onoff%   I
echo I%clr% Cursor Changer Visuals %clr2%I                                     O==========O
echo I%clr%                        %clr2%I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%       Help  Mode       %clrhelp2%I  I  Move: W A S D  Num I Back : B I Slct : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 123wsabye4 /n /m "Specify what you want to change by number or by moving with wasd :"
if %ErrorLevel%==1 goto :settingcategory2intsetting5_stg0
if %ErrorLevel%==2 goto :settingcategory2intsetting5_stg1
if %ErrorLevel%==3 goto :settingcategory2intsetting5_stg2
if %ErrorLevel%==4 goto :settingcategory2intsetting5_stg2
if %ErrorLevel%==5 goto :settingcategory2intsetting5_stg3
if %ErrorLevel%==6 goto :settingcategory2intsetting1
if %ErrorLevel%==7 goto :settingcategory2intsetting1
if %ErrorLevel%==8 Call :SettingApplyer 5_3
if %ErrorLevel%==9 Call :SettingApplyer 5_3
if %ErrorLevel%==10 goto :settingcategory2intsetting5_stg3
goto :settingcategory2intsetting5_stg3

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
    if "%setting5onoff%"=="false" (
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
if "%setting5onoff%"=="false" (
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
rem note I want to add a process to change the color of clr at true in the branch here, and also add a process to change it back in the branch right after CHOICE.
if "%settinghelptoggle%"=="true" (set settinghelp=enabled. )
if "%settinghelptoggle%"=="false" (set settinghelp=disabled.)
title Cursor Changer ^| Setting Menu
set selected=
if not defined "%clrgra%" (set clrgra=[90m)
if "%settinghelptoggle%"=="true" (set clr=[46m)
Cls
echo.
Echo                                Setting Menu
echo. 
echo O========================O                 O=========O
echo I        Category        I                 I Setting I
echo O========================O=================O=========O====================O
echo I                        I                                                I
echo I Cursor Changer Feature I  Help Mode. After selecting this function,     I
echo I                        I  Select the you want to see an overview of it, I
echo I========================I  You can see an overview of it.                I
echo I  Category  up or down  I                                                I
echo I========================I  If you want to disable help mode,             I
Echo I                        I  select this feature again.                    I
echo I Cursor Changer Visuals I                                                I
echo I                        I  %clrgra%Help mode is %settinghelp%%clr2%                        I
echo O========================O==O=====================O==========O============O
echo I%clr%       Help  Mode       %clr2%I  I  Move: W A S D  Num I Back : B I Slct : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12wsbye3 /n /m "Specify what you want to change by number or by moving with wasd :"
set clrgra=
if "%wmodetoggle%"=="false" (set clr=[7m&set clr2=[0m)
if "%wmodetoggle%"=="true" (set clr=[100m[97m&set clr2=[0m[107m[30m)
if %ErrorLevel%==1 goto :settingcategory1
if %ErrorLevel%==2 goto :settingcategory2
if %ErrorLevel%==3 goto :settingcategory2
if %ErrorLevel%==4 goto :settingcategoryhelpmode
if %ErrorLevel%==5 goto :Mainmenuboot
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
goto :settingcategory1intsetting1

:setting2help
cls
echo This setting is intended to prevent errors when changing cursors by running Cursor Changer with administrative privileges.
echo It is recommended that this setting be set to true only if there is an error or failure to change the cursor.
echo Setting this to true may reduce startup time.
echo This setting is false by default.
pause
goto :settingcategory1intsetting2

:setting3help
cls
echo This setting enables or disables the ability to check for updates when Cursor Changer is booted.
echo If this feature is turned on, updates will be checked every time this batch is booted, and if updates are available, they will be applied as they are.
echo However, this feature is not available when there is no Internet connection, and depending on the speed of the Internet connection, the boot up speed may be reduced.
echo In addition, the hourly If you repeat launching more than 50 times, you may reach the API rate limit of github.
echo This setting is false by default.
pause
goto :settingcategory1intsetting3

:setting4help
cls
echo This setting determines whether Cursor Changer is allowed to play sound.
echo If this setting is on, sound effects and other sounds will be played at startup, etc.
echo These sounds are played by Powershell when it is launched from Cursor Changer from the background.
echo This setting is true by default.
pause
goto :settingcategory1intsetting4

:setting5help
cls
echo This setting is a setting that makes the boot animation that always plays at each startup, so to speak, false and hidden.
echo Setting this setting to false will reduce startup time and annoyance.
echo This setting is true by default.
pause
goto :settingcategory2intsetting5_stg0

:setting5_1help
cls
echo This setting allows a Linux-like startup animation to be played.
echo it is easy to see that the system is starting up and looks good. Also, when an error occurs during startup, it may be easier to see where the error occurred.
echo This setting cannot be used with simpleboot and rawboot.
echo This setting is false by default.
pause
goto :settingcategory2intsetting5_stg1

:setting5_2help
cls
echo This setting allows only "booting up" to be displayed at startup.
echo It is very fast, simple and unobtrusive. However, it can be makes you little boring.
echo This setting is false by default.
pause
goto :settingcategory2intsetting5_stg2

:setting5_3help
cls
echo This setting is to start within the "echo on" state at startup.
echo It is simple, easy to understand, and shows at a glance what is currently being executed. It also makes you feel like a hacker.
echo This setting cannot be used with linuxboot and rawboot.
echo This setting is false by default.
pause
goto :settingcategory2intsetting5_stg3

:setting6help
cls
echo This setting allows you to change whether or not the first letter
echo of the main menu choice is Underlined.
echo This setting is true by default.
pause
goto :settingcategory2intsetting2

:setting7help
cls
echo This setting allows you to toggle the background in the main menu.
echo Enabling this will result in a better look.
echo However, depending on your computer's spec, the main menu may not be as responsive as it could be.
echo This setting is true by default.
pause
goto :settingcategory2intsetting3

:wmodehelp
cls
echo This changes the CMD screen to white or black.
echo This will allow, for example, the screen to be unified with a white theme, and also accommodate those who prefer it that way.
echo The standard color is black, but after setting it to white, the screen will automatically turn white when it is started up in the future.
echo Also, as a bit of backstory, this setting was placed on the home side until 1.10 or earlier. This feature is also the source of the internal structure of the setting.
echo By default, it is a dark theme.
pause
goto :settingcategory2intsetting4
 
:uninstallhelp
cls
echo This is the uninstall menu. This menu uninstalls Cursor Changer.
echo This menu contains functions to display the path to the Setting file (the text file in which the settings are recorded) and to initialize (set to default) the settings.
echo If uninstallation is performed, the Cursor Changer itself will be removed and (optional) cursors will be removed by default. (Optional) The Setting and files for detecting the first startup will also be completely removed.
echo Please do so at your own risk.
pause
goto :settingcategory1intsetting5



rem Version of batch
:batver
set batvercurrent=0& call :batver_exit
if "%batverdev%"=="dev" (set batverdevshow=Dev)
if "%batverdev%"=="beta" (set batverdevshow=Beta)
if "%batverdev%"=="stable" (set batverdevshow=Stable)
if not defined dummy (set /p nothing=[?25l<nul)
if not defined dummy (set clr=[7m&set clrgra=[90m&set clr2=[0m)
if "%wmodetoggle%"=="false" (set clr=[7m&set clrgra=[90m&set clr2=[0m)
if "%wmodetoggle%"=="true" (set clr=[100m[97m&set clrgra=[107m[38;2;140;140;140m&set clr2=[90m[107m[30m)

:batver_main
rem GUI type 1
rem Main Bat Version Menu
title Cursor Changer ^| Version Info
if "%batverexit%"=="true" (set batvercurrent=& call :batver_exit & goto :mainmenu)
if not defined batverboot (set MenuRedrew=true& set /p nothing=%clrgra%<nul& call :Mainmenudrew & echo %clr2% & set batverboot=true)
rem I'm doing this because when I use ANSI ESC sequences in Virtual Studio Code, the parentheses are colored incorrectly and I don't like that
call :batver_Core_Drew
if not defined dummy (
echo [6;12H O=================================================O 
echo [7;12H I             Cursor Changer  Version             I 
echo [8;12H I                                                 I 
echo [9;12H I          Current Version :[9;63HI 
echo [10;12H I          Current Build   :[10;63HI 
echo [11;12H I                                                 I 
echo [12;12H I          O==============O    O=======O          I 
echo [13;12H I          I%bvb% Check Update %clr2%I    I%bvb2% Close %clr2%I          I 
echo [14;12H I          O==============O    O=======O          I 
echo [15;12H I                                                 I 
echo [16;12H O=================================================O 
echo [17;16H %clrgra%1~2 or A,D to move, Y,E to Select, B to Exit%clr2%
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
if not defined dummy (echo [9;41H %batver% ^(%batverdevshow%^))
if not defined dummy (echo [10;41H %batbuild:~6%)
if "%batvercurrent%"=="0" (echo [18;29H %clrgra%Nothing Selected...%clr2%) else (echo [18;29H                                 )
if "%batvercurrent%"=="1" (set bvb=%clr%& set bvb2=& exit /b)
if "%batvercurrent%"=="2" (set bvb2=%clr%& set bvb=& exit /b)
exit /b

:batver_exit
rem initialize of variable
set batverexit=& set bvb=& set bvb2=& set batverboot=& set batverdevshow=& set clrgra=
if not defined dummy (set /p nothing=[?25h<nul)
exit /b

:batverupdate
rem Update process
title Cursor Changer ^| Updater
for /l %%i in (7,1,15) do (set /p nothing=[%%i;14H                                                 <nul)
if not defined dummy (set /p nothing=[8;15H Checking Update...<nul)
call :Powersheller CheckUpdate
set TempErrorlevel=%errorlevel%
rem Update messages
if "%TempErrorlevel%"=="0" (set /p nothing=[?25l<nul& set TempErrorlevel=& exit /b)
if not defined dummy (for /l %%i in (7,1,15) do (set /p nothing=[%%i;14H                                                 <nul))
if not "%TempErrorlevel%"=="0" if not "%TempErrorlevel%"=="1" (set /p nothing=[8;15H [91mAn error occurred while checking updates!%clr2%[13;15H %clrgra%^(Press any key to continue...^)%clr2%<nul)
if "%TempErrorlevel%"=="1" (
if not defined dummy (set /p nothing=[8;15H You already have the latest version![9;15H There is no need to update.[11;15H %clrgra%^(Press any key to continue...^)%clr2%<nul)
pause >nul
) else if "%TempErrorlevel%"=="2" (
if not defined dummy (set /p nothing=[10;15H You have a newer version than the update file![11;15H Perhaps you changed the version manually ^>:/<nul)
pause >nul
) else if "%TempErrorlevel%"=="3" (
if not defined dummy (set /p nothing=[10;15H Github API rate limit has been reached![11;15H Please wait an hour or so and try again.<nul)
pause >nul
) else if "%TempErrorlevel%"=="4" (
if not defined dummy (set /p nothing=[10;15H Something went wrong.[11;15H Check your internet connection and try again.<nul)
pause >nul
)
if not defined dummy (set /p nothing=[?25l<nul)
set TempErrorlevel=& exit /b



:Appmenu
cls
rem GUI type 1
rem initialize variable
mode con: cols=67 lines=20
if not defined dummy (set clr=[7m&set clrgra=[90m&set clr2=[0m)
if "%wmodetoggle%"=="false" (set clr=[7m&set clrgra=[90m&set clr2=[0m)
if "%wmodetoggle%"=="true" (set clr=[100m[97m&set clrgra=[107m[38;2;140;140;140m&set clr2=[90m[107m[30m)
if not defined dummy (set /p nothing=[?25l<nul)
set Appmenucurrent=0

:Appmenu_main
title Cursor Changer ^| Application Menu (beta)
if "%Appmenuexit%"=="true" (call :Appmenu_exit& goto :mainmenu)
call :Appmenu_Core_Drew
if not defined dummy (set /p nothing=[0;0H<nul)
if not defined dummy (
echo.
echo                          Application Menu                     
echo.
echo      O==============================O========================O     
echo      I                              I          Info          I
echo      I   1 : %amb1%Simple Calculator%clr2%      I[6;62HI
echo      I                              I[7;62HI
echo      I   2 : %amb2%2048 Game%clr2%              I[8;62HI
echo      I                              I[9;62HI
echo      I   3 : %amb3%Internet Explorer 11%clr2%   I[10;62HI
echo      I                              I[11;62HI
echo      O==============================O========================O
echo      I   Control :                                           I
echo      I   W,S or 1~3 to move, Y or E to start.                I
echo      I   N or B to exit.                                     I
echo      O=======================================================O
echo.
echo             %clrgra%Specify the application you want to launch...%clr2%
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
if "%Appmenucurrent%"=="0" (echo [7;41H Nothing Selected) else (for /l %%i in (6,1,10) do (echo [%%i;38H                        ))
if "%Appmenucurrent%"=="1" (echo [7;41H Simple Calculator.& echo [8;44H Easy to use.)
if "%Appmenucurrent%"=="2" (echo [7;45H 2048 Game.& echo [8;43H You can play& echo [9;47H 2048.& echo [10;41H %clrgra%it's maybe laggy%clr2%)
if "%Appmenucurrent%"=="3" (echo [7;38H Open Internet Explorer& echo [8;41H It will open IE.)
if "%Appmenucurrent%"=="1" (set amb1=%clr%& set amb2=& set amb3=& exit /b)
if "%Appmenucurrent%"=="2" (set amb2=%clr%& set amb1=& set amb3=& exit /b)
if "%Appmenucurrent%"=="3" (set amb3=%clr%& set amb1=& set amb2=& exit /b)
exit /b

:Appmenu_exit
rem initialize of variable
set Appmenucurrent=& set Appmenuexit=& set amb1=& set amb2=& set amb3=& set Appmenuboot=& set clrgra=
if not defined dummy (set /p nothing=[?25h<nul)
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
ping -n 2 127.0.0.1 > nul 2>&1
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




:cursorchange
cls
rem initialize variable
mode con: cols=75 lines=20
if not defined dummy (set clr=[7m&set clrgra=[90m&set clr2=[0m)
if "%wmodetoggle%"=="false" (set clr=[7m&set clrgra=[90m&set clr2=[0m)
if "%wmodetoggle%"=="true" (set clr=[100m[97m&set clrgra=[107m[38;2;140;140;140m&set clr2=[90m[107m[30m)
if not defined dummy (set /p nothing=[?25l<nul)
set cursorchangecurrent=0

:cursorchange_loop
rem main menu of cursor change
title Cursor Changer
if "%cursorchangeexit%"=="true" (set cursorchangecurrent=& call :cursorchange_exit& goto :mainmenu)
if "%cursorchangeexit%"=="true1y" (call :cursorchange_main_cfm)
if "%cursorchangeexit%"=="true2" (call :cursorchange_Drew& goto :cursorchange_loop)
call :cursorchange_Drew
if not defined dummy (set /p nothing=[0;0H<nul)
if "%cursorchangecurrent%"=="0" (call :cursorchange_Drew boot)
if not "%cursorchangeexit%"=="true1" (
echo                             Cursor Changer %batver%
echo.
echo           O================================O=====================O
echo           I              Menu              I        About        I
echo           I                                I[5;66HI
echo           I   %ccm1%1 Change to %cursorcolor% Cursor %ccm1e%    I[6;66HI
echo           I                                I[7;66HI
echo           I   %ccm2%2 Change to Custom Cursor%ccm2e%    I[8;66HI
echo           I                                I[9;66HI
echo           O================================O=====================O
echo.
echo.
echo              1~2 or W,D to select, Y,E to Confirm, B,N to exit.
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
    set /p nothing=[6;46H Nothing Selected.[0;0H<nul
    exit /b
)
if "%cursorchangecurrent%"=="0" (
    echo [6;46H Nothing Selected.
    exit /b
)

if "%cursorchangecurrent%"=="1" (
    if "%cursorchangeexit%"=="true1" (
        rem confirm messages
        call :cursorchange_clear
        set /p nothing=[5;13H Do you really want to chenge the cursor<nul& set /p nothing=[6;13H to %cursorcolor%?<nul& set /p nothing=[8;13H %clrgra%^(Y,E or B,N^)%clr2%<nul
        exit /b
    )
    if not "%cursorchangeexit%"=="true1y" (
    echo [6;46H Change to %cursorcolor%
    echo [7;51H Cursor.
    set ccm2=& set ccm2e=& set ccm1=%clr%& set ccm1e=%clr2%
    exit /b
    )
)
if "%cursorchangecurrent%"=="2" (
    if "%cursorchangeexit%"=="true2" (
        rem confirm messages (Ughhhhh)
        set cursorchangeexit=
        call :cursorchange_clear
        set /p nothing=[5;13H This feature is not available at now.<nul& set /p nothing=[7;13H %clrgra%hit any key to back...%clr2%<nul
        pause >nul
        call :cursorchange_clear
        exit /b
    )
    echo [6;46H Change to Custom
    echo [7;51H Cursor.
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
rem First Warning messages
call :cursorchange_clear
if not defined dummy (
    set /p nothing=[5;13H %clrgra%^(Only at First Changing Cursor^)%clr2%<nul
)
timeout /t 2 /nobreak >nul
call :cursorchange_clear
if not defined dummy (
    set /p nothing=[5;13H This feature changes the windows cursor. If you do <nul
    set /p nothing=[6;13H not wish to make the change, go back at this point. <nul
    set /p nothing=[8;13H %clrgra%hit any key to continue...%clr2%<nul
    pause >nul
)
call :cursorchange_clear
if not defined dummy (
    set /p nothing=[5;13H The creator, tamago_1908, is not responsible for <nul
    set /p nothing=[6;13H any problems that may result from the changes. <nul
    set /p nothing=[8;13H %clrgra%hit any key to continue...%clr2%<nul
    pause >nul
)
call :cursorchange_clear
if not defined dummy (
    set /p nothing=[5;13H Do you really want to continue?<nul
    set /p nothing=[8;13H %clrgra%^(Y or N^)%clr2%<nul
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
if "%5"=="1" (for /l %%i in (%1,1,%3) do (set /p nothing=[%4;%%iH[48;5;244m <nul))
rem progress bar fg
for /l %%i in (%1,1,%2) do (set /p nothing=[%4;%%iH%pbdclr% <nul) & set pbdclr=
exit /b


rem Change cursor color to white
:defgo
set a=13
if "%wmodetoggle%"=="true" (color f0) else (color 07)
if not defined dummy (set /p nothing=[5;13H %clrgra%hit any key to apply...%clr2%<nul& pause >nul)
if not defined dummy (call :cursorchange_clear& set /p nothing=[5;13H Applying... %clrgra%^(Do not close the Cursor Changer!^)%clr2%<nul)
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
if "%wmodetoggle%"=="true" (color f0) else (color 07)
if not defined dummy (call :cursorchange_clear& set /p nothing=[5;13H Refreshing the Cursor...<nul)
call :Powersheller RefreshCursor & set a=
if not defined dummy (call :cursorchange_clear& set /p nothing=[5;13H Cursor Color changed to white.<nul& timeout /t 3 /nobreak >nul)
goto :cursorchange_afterchange



rem Change the cursor color to black.
:darkgo
set a=13
if "%wmodetoggle%"=="true" (color f0) else (color 07)
if not defined dummy (set /p nothing=[5;13H %clrgra%hit any key to apply...%clr2%<nul& pause >nul)
if not defined dummy (call :cursorchange_clear& set /p nothing=[5;13H Applying... %clrgra%^(Do not close the Cursor Changer!^)%clr2%<nul)
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
if "%wmodetoggle%"=="true" (color f0) else (color 07)
if not defined dummy (call :cursorchange_clear& set /p nothing=[5;13H Refreshing the Cursor...<nul)
call :Powersheller RefreshCursor & set a=
if not defined dummy (call :cursorchange_clear& set /p nothing=[5;13H Cursor Color changed to black.<nul& timeout /t 3 /nobreak >nul)
goto :cursorchange_afterchange



:cursorchange_afterchange
rem Determining whether or not to play reboot message depending on settings
reg query "HKEY_CURRENT_USER\Control Panel\Cursors" /v "" | find "Windows Black" >nul
if "%ErrorLevel%"=="0" (set cursorcolor=White)
if "%ErrorLevel%"=="1" (set cursorcolor=White)
reg query "HKEY_CURRENT_USER\Control Panel\Cursors" /v "" | find "Windows Default" >nul
if "%ErrorLevel%"=="0" (set cursorcolor=Black)
set cursorchangeexit=& exit /b




rem dogcheck. verify if %Settingsfile% exists
:Uninstall
cd /d %batchmainpath%
if "%settinghelptoggle%"=="true" (goto :uninstallhelp)
if exist %Settingsfile% goto :Uninstalltest
if not exist %Settingsfile% goto :Dogcheck

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
start chrome.exe --window-size=0,0 --incognito -- https://www.youtube.com/watch?v=kO77pZFJp1o
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
taskkill /im chrome.exe
call :exit 0


rem uninstall (i mean its uninstall menu)
:Uninstalltest
cd /d %batchmainpath% 
find "nodogcheckfor1234567890qwertyuiop" %Settingsfile% >nul
cls
if %ErrorLevel%==0 call :UninstallMenu & goto :settingcategory1intsetting5
if %ErrorLevel%==1 goto :Dogcheck
goto :settingcategory1intsetting5

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
title Cursor Changer ^| Uninstall Menu
if not defined dummy (set /p nothing=[0;0H[?25l%clr2%<nul)
if "%UMexit%"=="true" (goto :UninstallMenu_exit)
echo.
echo                                Uninstall Menu
echo                       O=============================O
call :UninstallMenu_Textdraw
echo                   O======================================O
echo                   I%UMcb1%       Uninstall Cursor Changer       %clr2%I
echo                   O======================================O
echo                   I%UMcb2%    Management Cursor Changer File    %clr2%I
echo                   O======================================O
echo                   I%UMcb3%         Exit Uninstall Menu          %clr2%I
echo                   O======================================O
echo.
echo             %clrgra%W,S or 1~3 to move, Y or E to select, B or N to exit.%clr2%
choice /c 123WSYEBN /n >nul
rem Processing of each move
if %Errorlevel%==8 (set UMexit=true) else if %Errorlevel%==9 (set UMexit=true)
if %Errorlevel% geq 1 if %Errorlevel% leq 3 (set UMsel=%Errorlevel%)
if %UMsel%==0 (set UMsel=1& set UMcb1=%clr%& goto :UninstallMenu_main)
if %ErrorLevel%==4 (if not %UMsel%==1 (set /a UMsel-=1))
if %ErrorLevel%==5 (if not %UMsel%==3 (set /a UMsel+=1))
if %ErrorLevel%==6 (call :UninstallMenu_Core)
if %ErrorLevel%==7 (call :UninstallMenu_Core)
set UMcb1=& set UMcb2=& set UMcb3=& set UMcb%UMsel%=%clr%& goto :UninstallMenu_main

:UninstallMenu_Core
rem Processing of Confirm key, like Y and E.
set /p nothing=%clr2%<nul
if %UMsel%==1 (call :UninstallMenu_Uninstall & cls & exit /b)
if %UMsel%==2 (call :UninstallMenu_Management & cls & exit /b)
if %UMsel%==3 (set UMexit=true& exit /b)

:UninstallMenu_exit
rem initialize of variable
set UMexit=& set UMsel=& set UMcb1=& set UMcb2=& set UMcb3=& set clrgra=
if not defined dummy (set /p nothing=[?25h<nul)
cls
mode con: cols=75 lines=25
if "%Uninstall_Shutdown%"=="true" (set Uninstall_Shutdown=& call :exit 1) else (exit /b)

:UninstallMenu_Textdraw
rem Drew texts
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
rem GUI type 3
rem Preparing of Menu and Variables
if not defined dummy (set clr=[7m&set clrgra=[90m&set clrwhi=[97m&set clr2=[0m)
if "%wmodetoggle%"=="false" (set clr=[7m&set clrgra=[90m&set clrwhi=[97m&set clr2=[0m)
if "%wmodetoggle%"=="true" (set clr=[100m[97m&set clrgra=[107m[38;2;140;140;140m&set clrwhi=[30m&set clr2=[90m[107m[30m)
set UMUsel=0
:UninstallMenu_Uninstall_main
rem Draw Update Available UI
title Cursor Changer ^| Uninstall of Cursor Changer
if not defined dummy (set /p nothing=[0;0H[?25l%clr2%<nul)
if "%UMUexit%"=="true" (goto :UninstallMenu_Uninstall_exit)
if defined UMUcb2 if "%wmodetoggle%"=="true" (set clrgra=[107m[48;2;180;180;180m) else (set clrgra=[90m)
echo.
echo                        Uninstall of Cursor Changer
echo.
echo.          O==================================================O
echo           I                                                  I
echo           I             Cursor Changer Unistaller            I
echo           I                                                  I
if not defined dummy (echo           I[50CI)
if not defined dummy (echo           I[50CI)
echo           I                                                  I
echo           I   O==========================================O   I
echo           I   I%UMUcb1%       Uninstall this batch normaly       %clr2%I   I
echo           I   O==========================================O   I
echo           I   I%UMUcb2%%clrgra% Uninstall and Restore Cursor from backup %clr2%I   I
echo           I   O==========================================O   I
echo           I                                                  I
echo           O==================================================O
echo.
if not defined dummy (set clrgra=[90m) & if "%wmodetoggle%"=="false" (set clrgra=[90m) & if "%wmodetoggle%"=="true" (set clrgra=[107m[38;2;140;140;140m)
echo           %clrgra%W,S or 1~2 to move, Y or E to select, B or N to exit.%clr2%
echo.
call :UninstallMenu_Uninstall_Textdraw
choice /c 12WSYEBN /n >nul
rem Processing of each move
if %Errorlevel%==7 (set UMUexit=true) else if %Errorlevel%==8 (set UMUexit=true)
if %Errorlevel% geq 1 if %Errorlevel% leq 2 (set UMUsel=%Errorlevel%)
if %UMUsel%==0 (set UMUsel=1& set UMUcb1=%clr%& goto :UninstallMenu_Uninstall_main)
if %ErrorLevel%==3 (if %UMUsel%==2 (set UMUsel=1))
if %ErrorLevel%==4 (if %UMUsel%==1 (set UMUsel=2))
if %ErrorLevel%==5 (call :UninstallMenu_Uninstall_Core)
if %ErrorLevel%==6 (call :UninstallMenu_Uninstall_Core)
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
if %UMUsel%==0 (set /p nothing=[8;16HPlease select how to uninstall this batch.[9;19HB or N to cancel the uninstallation.<nul)
if %UMUsel%==1 (set /p nothing=[8;21HYou can uninstall Cursor Changer.[9;18HDelete setting files, and batch itself.<nul)
if %UMUsel%==2 (set /p nothing=[8;19HUninstall Cursor Changer, and restore[9;21HYour cursor settings from backup.<nul)
if not defined dummy (set /p nothing=[22;0H<nul)
exit /b

:UninstallMenu_Uninstall_THISISWIP!!!!!
title Cursor Changer ^| This Feature is not implemented!
echo.
echo                        Uninstall of Cursor Changer
echo.
echo          O=====================================================O     
echo          I                                                     I
echo          I        This feature is not available at now!        I
echo          I                                                     I
echo          I      This feature is currently not implemented.     I
echo          I             Please select other option.             I
echo          I                                                     I
echo          I              %clrgra%(Hit any key to Exit...)%clr2%               I
echo          I                                                     I
echo          O=====================================================O
echo.
pause >nul
exit /b


:UninstallMenu_Uninstall_Confirm
cls
mode con: cols=72 lines=21
if "%1"=="2" (goto :UninstallMenu_Uninstall_THISISWIP!!!!!) else (set Uninstall_way=%1)
rem GUI type 3
rem Preparing of Menu and Variables
if not defined dummy (set clr=[7m&set clrgra=[90m&set clrwhi=[97m&set clred=[91m&set clr2=[0m)
if "%wmodetoggle%"=="false" (set clr=[7m&set clrgra=[90m&set clrwhi=[97m&set clred=[91m&set clr2=[0m)
if "%wmodetoggle%"=="true" (set clr=[100m[97m&set clrgra=[107m[38;2;140;140;140m&set clrwhi=[30m&set clred=[91m&set clr2=[90m[107m[30m)
set UOCsel=0
:UninstallMenu_Uninstall_Confirm_main
rem Draw Update Available UI
title Cursor Changer ^| Confirmation of Uninstall
if not defined dummy (set /p nothing=[0;0H[?25l%clr2%<nul)
if "%UOCexit%"=="true" (goto :UninstallMenu_Uninstall_Confirm_exit)
if not "%UOCsel%"=="0" if not "%UOCsel%"=="1" (set UOCcb2=[48;2;214;174;174m[30m)
echo.
echo                        Uninstall of Cursor Changer
echo.
echo         O======================================================O     
echo         I                                                      I
echo         I               Confirmation of Uninstall              I
echo         I                                                      I
call :UninstallMenu_Uninstall_Confirm_DrawText
echo         I                                                      I
echo         I        O============O      %clred%O================O%clr2%        I
echo         I        I%UOCcb1% No, Cancel %clr2%I      %clred%I%clr2%%UOCcb2% Yes, Uninstall %clr2%%clred%I%clr2%        I
echo         I        O============O      %clred%O================O%clr2%        I
echo         I                                                      I
echo         O======================================================O
echo.
echo           %clrgra%A,D or 1~2 to move, Y or E to select, B or N to exit.%clr2%
choice /c 12ADYEBN /n >nul
rem Processing of each move
if %Errorlevel%==7 (if %UOCsel%==3 (set UOCsel=2) else (set UOCexit=true)) else if %Errorlevel%==8 (if %UOCsel%==3 (set UOCsel=2) else (set UOCexit=true))
if %Errorlevel% geq 1 if %Errorlevel% leq 2 (set UOCsel=%Errorlevel%)
if %UOCsel%==0 (set UOCsel=1& set UOCcb1=%clr%& goto :UninstallMenu_Uninstall_Confirm_main)
if %ErrorLevel%==3 (if %UOCsel%==1 (set UOCsel=1) else if %UOCsel%==2 (set UOCsel=1) else (set UOCsel=1))
if %ErrorLevel%==4 (if %UOCsel%==1 (set UOCsel=2) else if %UOCsel%==2 (set UOCsel=2) else (set UOCsel=2))
if %ErrorLevel%==5 (call :UninstallMenu_Uninstall_Confirm_Core)
if %ErrorLevel%==6 (call :UninstallMenu_Uninstall_Confirm_Core)
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
mode con: cols=75 lines=22
exit /b

:UninstallMenu_Uninstall_Confirm_DrawText
if not "%UOCsel%"=="3" ( 
echo         I   Do you really want to uninstall Cursor Changer?    I
echo         I   If you uninstalled it, you'll need to Reinstall    I
echo         I  to use this batch again. and it cannot be undone!   I
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
echo                        Uninstall of Cursor Changer
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
for /f "tokens=6 delims=. " %%i in ('ver') do set bsodwinver=%%i
set runningfromfulldebug=
set FromREConsole=

rem message indication
timeout /t 1 /nobreak >nul
cls
if "%1"=="" (goto :BSOD_Errors_Error) else if "%1"=="BatBootErrorHandlerArgument1908" (goto :BSOD_Errors_Error)
if "%2"=="" (set bsoderrorlevel=Undefined) else (set bsoderrorlevel=%2)
if "%1"=="THERE_IS_NO_PROBLEMS" (goto :BSOD_Errors_NOERRORS)
set DynamicWinverCheck=true& call :batbootcheckwinver dynamic & set DynamicWinverCheck=
if "%errorlevel%"=="1" (call :BSOD_Errors_OG %1) else (set /p nothing=[?25l<nul)
title Cursor Changer ^| CRASHED!
mode con: cols=97 lines=25
rundll32 user32.dll,MessageBeep || echo 
color 1f
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
echo WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I WHERE AM I 
pause


:bsod_errors_RANDOMFACEHAHA
call :RandomDecisioner 16
if "%errorlevel%"=="1" (goto :bsod_errors_RANDOMFACEHAHA2)
call :RandomDecisioner 128
if "%errorlevel%"=="1" (goto :bsod_errors_RANDOMFACEHAHA3)
rem :)
if not defined dummy (echo [16C▐█& echo [09C█▌[4a█▌& echo [15C█▌& echo [09C█▌[4a█▌& echo [16C▐█)
exit /b
:bsod_errors_RANDOMFACEHAHA2
rem :(
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
color 1f
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
call :exit 1

rem Branching according to uninstall menu selection
:uninstallnowsettingdel
del %FirstSTFsfile%
del %Settingsfile%
goto :uninstallnowfinish

:uninstallnowchangeit
del %FirstSTFsfile%
del %Settingsfile%
rem Initialize cursor for uninstallation. Return to white.
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /ve /f /d "Windows Default" >nul
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
call :Powersheller RefreshCursor
:uninstallnowfinish
rem Message after uninstallation is complete
title Cursor Changer ^| Good bye!
for /l %%i in (5,1,9) do (set /p nothing=[%%i;11H                                                      <nul)
if not defined dummy (set /p nothing=[6;13H Uninstall Complete![8;13H %clrgra%^(Hit any key to continue...^)%clr2%<nul)
pause >nul
for /l %%i in (5,1,9) do (set /p nothing=[%%i;11H                                                      <nul)
if not defined dummy (set /p nothing=[6;13H Goodbye for now, %YourName%![8;13H %clrgra%^(Hit any key to continue...^)%clr2%<nul)
pause >nul
rem Get own path, delete own
del "%~dp0%~n0%~x0" & exit



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
    ping -n 0 -w 500 localhost >nul
)
echo.& echo HELLO WORLD!!! (hit any key to exit...)
pause >nul
exit /b


:AllLabelList
cls
title Cursor Changer ^| All label list
echo All label list :
set count=0
powershell -command "&{$h=Get-Host;$w=$h.UI.RawUI;$s=$w.BufferSize;$s.height=1000;$w.BufferSize=$s;}"
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
set "input=" & set len=0
:allcommandslockloop
rem drew UI
if "%wmodetoggle%"=="true" (echo [97m)
if not defined dummy (
echo [10;25H[44m┌───  Enter  Passcode ───┐ [0m
echo [11;25H[44m│                        │ [0m
echo [12;25H[44m│ ┃[0m                    ┃[44m │ [0m
echo [13;25H[44m│                        │ [0m
echo [14;25H[44m└────────────────────────┘ [0m
echo [15;25H[44m  B=Delete Y=Enter E=Exit  [0m
)
if "%input%" neq "" (
    if %len% equ 19 (
        echo [12;29H%input%
    ) else (
        echo [12;29H%input%[5m▂[0m
    )
)
if not defined input (
  echo [12;29H[5m▂[0m
)
if not defined dummy (echo [0;0H)
if "%wmodetoggle%"=="true" (echo [107;30m)
choice /c:0123456789bye /n >nul
set num=%errorlevel%
rem Check inputs
if %num% neq 0 set /a num=num-1
if %num%==10 if "%input%" neq "" set input=%input:~0,-1%&set /a len=len-1
if %num%==11 if "%input%"=="1908" (echo [17;30HCorrect passcode.&timeout /t 2 /nobreak >nul&echo [?25h&set invisiblecursor=&setlocal disabledelayedexpansion&set input=&set len=&set allcommandlock=false&goto :allcommandsmain) else (echo [17;10HWrong password. You need restart the batch to try again.&timeout /t 3 /nobreak >nul&set input=&set len=0&set allcommandlock=true&setlocal disabledelayedexpansion&goto :mainmenu)
if %num%==12 (
    if not defined dummy (
        setlocal disabledelayedexpansion&echo [?25h&set invisiblecursor=&set input=&set len=& goto :mainmenu
    )
)
if %num% lss 10 if not defined input (set "input=%num%"&set "len=1") else if !len! gtr 18 (goto :allcommandslockloop) else set input=%input%%num%&set /a len=len+1
goto :allcommandslockloop

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
powershell -command "&{$h=Get-Host;$w=$h.UI.RawUI;$s=$w.BufferSize;$s.height=64;$w.BufferSize=$s;}"
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
echo           %clrcyan%-%clr2% uninstallnow1        %clrgra%(forced to enter uninstallault.)%clr2%
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
if "%batargmentonly%"=="true" (set batargmentonly=& if exist %Settingsfile% (if not "%linuxboot%"=="true" (cls &echo Please wait a while... 2/2& exit /b) else (exit /b)) else (cls &echo Preparing Setup... 2/2& exit /b))
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
powershell -command "&{$h=Get-Host;$w=$h.UI.RawUI;$s=$w.BufferSize;$s.height=150;$w.BufferSize=$s;}"
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
if "%1"=="2" (goto :batshutdown)
powershell -command "$pid1 = Get-WmiObject win32_process -filter processid=$pid | ForEach-Object{$_.parentprocessid;}";$pid2 = "Get-WmiObject win32_process -filter processid=$pid1 | ForEach-Object{$_.parentprocessid;}";exit $pid2"
>nul 2>&1 taskkill /pid %errorlevel% >nul
exit
:reboot


rem Are you serious?
rem Anyways, congratulation. you readed all of codes.
rem Don't you have anything better to do?