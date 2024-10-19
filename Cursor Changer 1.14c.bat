@echo off
setlocal
rem Specify size and change codepage to UTF-8
chcp 65001>nul || (echo Your computer doesn't support UTF-8!& echo.& echo Cursor Changer require UTF-8.& echo Press any key to exit...& pause > nul & exit)
mode con: | find "75" >nul && mode con: | find "25" >nul
if "%errorlevel%"=="1" (mode con: cols=75 lines=25& set boottime1=%time%)
if "%batbootargumentbad%"=="false" (title Cursor Changer ^| Preparing...) else if not "%1"=="BatBootErrorHandlerArgument1908" (title Cursor Changer)
if not defined dummy (set /p nothing=[?25h<nul)

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
rem VER v1.14b
set batver=1.14b
set batbuild=Build 91
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
        if not "%batbootargumentbad%"=="false" (echo Preparing Setup... 1/2)
    ) else (title Cursor Changer ^| Preparing...& echo Please wait a while... 1/2)
)
if exist %Settingsfile% if not "%linuxboot%"=="true" (if not "%batbootargumentbad%"=="false" (title Cursor Changer ^| Preparing...& echo Please wait a while... 1/2)) else (if not "%batbootargumentbad%"=="false" (title Cursor Changer ^| Preparing...))
rem chenge the boot message if it is the first time, or if a value is defined in batbotpowershell, or at boot up
if not exist %Settingsfile% set firststartbat=yes
if "%batbootargumentbad%"=="false" (
if not "%linuxboot%"=="true" (
if not "%firststartbat%"=="yes" (
if "%bootbatnow%"=="yes" (cls & echo Please wait a while... 2/2)
) else (
    if not defined Powersheller (
        if not exist %FirstSTFsfile% (
        cls & echo Preparing Setup... 2/2
        ) else (cls & echo Please wait a while... 2/2)
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
if not "%1"=="BatBootErrorHandlerArgument1908" (if "%errorlevel%"=="1" (call :BSOD_Errors 6 %errorlevel%) else (call :BSOD_Errors 0 %errorlevel%)
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
    if "!current!"=="help" (call :batstarthelp& set argmentserror=false)
    if "!current!"=="bypsvck" (echo winver check is bypassed.& set bypasswinvercheck=true& set argmentserror=false)
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
if "%batbootargumentbad%"=="false" (title Cursor Changer ^| Preparing...) else if not "%1"=="BatBootErrorHandlerArgument1908" if "%1"=="dynamic" (exit /b 1)
if "%bypasswinvercheck%"=="true" (goto :batbootcheckwinverbadwarning)
rem check windows 8.1 or lower
for /f "usebackq delims=" %%a in (`ver`) do set version2=%%a
echo %version2% | find /i "Version 10.0" > nul
if "%errorlevel%"=="0" (set windowsverfilter=windows 10, old build) else (set "windowsverfilter=too old! like windows xp?")
echo %version2% | find /i "Version 6.3." > nul
if "%errorlevel%"=="0" (set windowsverfilter=windows 8.1)
echo %version2% | find /i "Version 6.2." > nul
if "%errorlevel%"=="0" (set windowsverfilter=windows 8)
echo %version2% | find /i "Version 6.1." > nul
if "%errorlevel%"=="0" (set windowsverfilter=windows7)
echo %version2% | find /i "Version 6.0." > nul
if "%errorlevel%"=="0" (set windowsverfilter=windows vista)
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
cls
rem Warning message (when use bypsvck in violation of winvercheck)
set selected=
cls
echo.
echo                                  WARNING
echo.
echo Your version of Windows (%windowsverfilter%) does not seem to support Cursor Changer^^!
echo You seem to be using bypsvck as arguments, but if you continue, you are very likely to encounter fatal problems.
echo If you continue, tamago_1908, the developer of the Cursor Changer, will not be held responsible for any subsequent problems caused.
echo.
echo Do you still wish to continue?
set /p selected=Y or N : 
if %selected%==n call :exit 1
if %selected%==y goto :batbootcheckwinversafe
if %selected%== echo what? "Y" or "N".& pause & goto :batbootcheckwinverbadwarning


:batbootcheckwinversafe
setlocal disabledelayedexpansion
if "%batbootargumentbad%"=="false" (title Cursor Changer ^| Preparing...) else if not "%1"=="BatBootErrorHandlerArgument1908" if "%1"=="dynamic" (exit /b 0)
set batbootcheckwinversafe=& set version=& set version2=
if "%1"=="dynamic" (exit /b)
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] WinverCheck is done.)



rem main code, (like set variable)
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

rem code from startid~powershell must not be displaced code before or after that is ok If it's before or after that, it's ok
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

# Reapply cursor settings
[User32]::SystemParametersInfo($SPI_SETCURSORS, 0, [IntPtr]::Zero, $SPIF_SENDCHANGE) | Out-Null
}



function Updater {
    # Check for updates of Cursor Changer with GitHub API, But won't do update. Just check.
    $repo = "https://api.github.com/repos/tamago1908/Cursor-Changer.bat/releases/latest"
    try{$file = (Invoke-RestMethod -Uri $repo -Method Get -Headers @{'Accept'='application/vnd.github.v3+json'}).assets | Where-Object { $_.name -like "Cursor.Changer.*" }
    }catch{if($_.Exception.Response.StatusCode.Value__ -eq 403){Write-Host "[ERROR] You have exceeded the GitHub API rate limit. This may be because you have checked for updates too frequently. Please wait for an hour and try again." -foregroundcolor red}else{Write-Host "[ERROR] Oops, something went wrong. You can try again later. or check the internet connection. `nError log : $_" -foregroundcolor red};break}


    $fileVersion = $file.name -replace "Cursor\.Changer\.|\.bat", ""
    $batVersion = "$env:batverforpowersheller"
    $batName = Get-Item "Cursor.Changer.*.bat"

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
    Write-Host "Checking update...`n"
    # check the update of Cursor Changer with github api, and Update it.
    $repo = "https://api.github.com/repos/tamago1908/Cursor-Changer.bat/releases/latest"
    try{$file = (Invoke-RestMethod -Uri $repo -Method Get -Headers @{'Accept'='application/vnd.github.v3+json'}).assets | Where-Object { $_.name -like "Cursor.Changer.*" }
    }catch{if($_.Exception.Response.StatusCode.Value__ -eq 403){Write-Host "[ERROR] You have exceeded the GitHub API rate limit. This may be because you have checked for updates too frequently. Please wait for an hour and try again." -foregroundcolor red}else{Write-Host "[ERROR] Oops, something went wrong. You can try again later. or check the internet connection. `nError log : $_" -foregroundcolor red};break}


    $fileVersion = $file.name -replace "Cursor\.Changer\.|\.bat", ""
    $batVersion = "$env:batverforpowersheller"
    $batName = Get-Item "Cursor.Changer.*.bat"

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
                # The file version is newer
                Write-Host "An update is available. The current version is `"$($batVersion)`". The updated version is `"$($fileVersion)`".`n"
                Start-Sleep 1
                Changelog
                Start-Sleep 2

                if ($isFileBeta) {Write-Host "[TIP] This update is a beta version, so it may have bugs or issues.`n" -ForeGroundColor DarkGray}

                $answer = Read-Host "Do you want to update? (y or n)"
                if ($answer -eq "y") {
                    $downloadFolder = Join-Path $env:USERPROFILE "Downloads"
                    $downloadFile = Join-Path $downloadFolder $file.name
                    Invoke-WebRequest -Uri $file.url -OutFile $downloadFile -Headers @{'Accept'='application/octet-stream'}
                    $newBatName = "Cursor.Changer.$fileVersion.bat"
                    Move-Item $downloadFile (Join-Path (Split-Path $batName) "$newBatName") -Force
                    Remove-Item "Cursor.Changer.$batVersion.bat" -Force
                    Write-Host "The update is complete.`n"
                    Start-Sleep 2
                  Write-Host "Rebooting..."
                    PowerShell -WindowStyle Hidden -Command Exit
                    Start-process "Cursor.Changer.$fileVersion.bat"
                    Killwhole
                } else {
                    Write-Host "The update was canceled.`n"
                    Start-Sleep 2
                    return
                }
            } elseif ($comparisonResult -lt 0) {
                Write-Host "[ERROR] You have a newer version ($($batVersion)) than the update file ($($fileVersion))!`nPerhaps you changed the version manually... >:(`n" -ForegroundColor Red
                Start-Sleep 2
                return
            }
        }

        if ($i -eq [Math]::Max($fileverArray.Length, $batverArray.Length)) {
            Write-Host "You already have the latest version ($($batVersion)), so you don't need to update.`n"
            Start-Sleep 2
        }
    }
}



function Doupdate {
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
            Write-Host "Downloading music... $progress% " -NoNewline
        }

        $memoryStream.Position = 0
        $response.Close()
        Write-Host "`nDownload Complete!"
    } catch {
        $errorMsg = if ($_.Exception.Response.StatusCode.Value__ -eq 403) {
            "[ERROR] GitHub API rate limit exceeded. Please wait an hour and try again."
        } else {
            "[ERROR] Oops, something went wrong. Check the internet connection.`nError log: $_"
        }
        Write-Host $errorMsg -ForegroundColor Red
        Write-Host "Hit any key to exit..."
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
    Write-Host "Playing music... Don't mind this window. You can stop the music by closing this window."
} catch {
    Write-Host "[ERROR] Failed to play the audio. Ensure the file is in the correct format and not empty." -ForegroundColor Red
    Write-Host "Hit any key to exit..."
    $host.UI.RawUI.ReadKey() | Out-Null
    exit
}

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
    Write-Host "`nShutting down..."
    Start-Sleep 1
    $pid1 = (Get-WmiObject win32_process -filter "processid=$pid").parentprocessid
    $pid2 = (Get-WmiObject win32_process -filter "processid=$pid1").parentprocessid
    taskkill /pid $pid1 /pid $pid2 /pid $pid > $null 2>&1
}

Function Changelog {
    $h=Get-Host;$w=$h.UI.RawUI;$s=$w.BufferSize;$s.height=(irm -Uri "https://api.github.com/repos/tamago1908/Cursor-Changer.bat/releases/latest").body -split '\r\n' | Measure-Object | %{$_.Count + 22};$w.BufferSize=$s;
    try{if($env:wmodetoggle -eq "false"){Write-Host "Change Log :" -foregroundcolor white}elseif($env:wmodetoggle -eq "true"){Write-Host "Change Log :" -foregroundcolor black }else{Write-Host "Change Log :" -foregroundcolor white};$e=[char]27;$clr="$e[7m";$clred="$e[91m";$clrgrn="$e[92m";$clryel="$e[93m";$clrmag="$e[95m";$clrgra="$e[90m";$clrcyan="$e[96m";$c="$e[0m";if($env:wmodetoggle -eq "true"){$clr="$e[100m$e[97m";$c="$e[0m$e[107m$e[30m"};foreach($s in (irm -Uri "https://api.github.com/repos/tamago1908/Cursor-Changer.bat/releases/latest").body -split '\r\n'){if($s -match "####"){write-host "$clrcyan$e[1m$($s -replace '(^\#+)|(\#+$)', '')$c" `n -NoNewline}elseif($s -match ">"){write-host "$clred$($s -replace '\>', '')$c" `n -NoNewline}elseif($s -match "###"){write-host "$clryel$e[1m$($s -replace '(^\#+)|(\#+$)', '')$c" `n -NoNewline}elseif($s -match "___"){write-host "$clrgra--------------------------------------------------$c" `n -NoNewline}else{$s=$s -replace "\*{3}(.+?)\*{3}", "$e[3m`$1$c";$s=$s -replace "\*{2}(.+?)\*{2}", "$e[1m`$1$c";$s=$s -replace "^\s*-(\s+)(.*)", "$clred-$c`$1`$2";$s=$s -replace "\*+", "";write-host "$s" `n -NoNewline}};rv e,clr,clred,clrgrn,clryel,clrmag,clrgra,clrcyan,c,s}catch{if($_.Exception.Response.StatusCode.Value__ -eq 403){Write-Host "[ERROR] You have exceeded the GitHub API rate limit. This may be because you have checked for updates too frequently. Please wait for an hour and try again." -foregroundcolor red}else{Write-Host "[ERROR] Oops, something went worng. You can try again later. or check the internet connection. `nError log : $_" -foregroundcolor red};break}
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


rem MAIN PROCESS (FR)
:Powersheller_end
set startline=& set endline=& set Powersheller_passed=& set batverforpowersheller=
if "%bootbatnow%"=="no" (set Powersheller=& exit /b)
if "%Powersheller%"=="OOBEMusic" (set Powersheller=& exit /b)
set Powersheller=
set batverforpowersheller=

rem get updater variable
if "%checkupdatetoggle%"=="true" (goto :Powersheller_get_updater_variable) else (goto :Powersheller_get_updater_variable_end)

:Powersheller_get_updater_variable
rem conversion powershell return variable to batch variable
setlocal enabledelayedexpansion
if "%updateinfo%"=="null" (goto :Powersheller_get_updater_variable_end)
if "%updateinfo%"=="die" (set Punish=true& goto :Powersheller_get_updater_variable_end)
for /f "tokens=1-4 delims=," %%a in ("%updateinfo%") do (
  for /f "tokens=1-2 delims==" %%x in ("%%a") do set "%%x=%%y"& for /f "tokens=1-2 delims==" %%x in ("%%b") do set "%%x=%%y"& for /f "tokens=1-2 delims==" %%x in ("%%c") do set "%%x=%%y"& for /f "tokens=1-2 delims==" %%x in ("%%d") do set "%%x=%%y"
)
setlocal disabledelayedexpansion
set updatemyversion=%batver:ﾎｲ=.b%

:Powersheller_get_updater_variable_end
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Powersheller is Ended...)
set updateinfo=
set checkupdatetoggle=
cd /d %batchmainpath%


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
set "show=[2;23H[38;2;%clresc%mWelcome to Cursor Changer %batver% [0m"
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
    ping -n 1 -w 500 localhost >nul & goto :CursorChangerOOBE_Animation2
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
    ping -n 0 -w 500 localhost >nul & goto :CursorChangerOOBE_Animation3
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
    ping -n 0 -w 500 localhost >nul & goto :CursorChangerOOBE_Animation4
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


:CursorChangerOOBEdev
rem Now, it's the beginning of a fucking trashy long goofy ahh idiot code.
title Cursor Changer %batver% Setup
if not defined dummy (set clr=[3m[97m&set clrhigh=[7m&set clrhighend=[0m&set clrwhi=[48;5;250m[30m&set clr2=[0m&set clrgra=[90m)
if not defined dummy (set moveline=[22;0H) else (set moveline=[22;0H)
if not defined dummy (set /p nothing=[?25l<nul)
mode con: cols=80 lines=22
echo.
echo   Cursor Changer %batver% Setup
echo ================================O
echo.
echo     %clr% Welcome to Setup.%clr2%
echo.
echo     Welcome to the initial launch and setup of Cursor Changer.
echo     This protion of the Setup program prepares Tamago_1908
echo     Cursor Changer %batver% to run on your computer.
echo.
echo.
echo          ^・     To setup Cursor Changer now, press E.
echo.
echo          ^・     To skip the setup and use the Cursor Changer,
echo                 press S. (All settings are set to the default values)
echo.
echo          ^・     To quit setup without installing Cursor Changer, press B.
echo.
echo.
echo.
echo.
set /p nothing=%clrwhi%     E=Continue     S=Skip     B=Quit                                           %moveline%%clrwhi% <nul& choice /c ESB /n >nul
if %ErrorLevel%==1 goto :OOBEmain
if %ErrorLevel%==2 goto :OOBESkip
if %ErrorLevel%==3 call :OOBEmainshutdown& timeout /t 1 /nobreak >nul&call :exit 0

:OOBESkip
color 07
cls
echo.
echo   Cursor Changer %batver% Setup
echo ================================O
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
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     Y=Skip     N,B=Not Skip                                                    %moveline%%clrwhi% <nul& choice /c YNB /n >nul
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
echo   Cursor Changer %batver% Setup
echo ================================O
echo.
echo.
echo          Do you want to hear the Windows XP OOBE Music?
echo.
echo          if you want, press Y.
echo          if you don't, press N.
echo.
echo.
echo          %clrgra%(Pressing Y will download about 15MB of data.)%clr2%
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     Y=Continue     N=No                                                        %moveline%%clrwhi% <nul& choice /c YN /n >nul
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
echo   Cursor Changer %batver% Setup
echo ================================O
echo.
echo.
echo          Preparing download music. Please Wait a while...
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
echo   Cursor Changer %batver% Setup
echo ================================O
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
echo          Shutting down...
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
echo   Cursor Changer %batver% Setup
echo ================================O
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
echo   Cursor Changer %batver% Setup
echo ================================O
echo Setup progress : 1/5 (Check precautions)
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
set /p nothing=%clr2%%clrwhi%     Y=Continue                                                              1/3%moveline%%clrwhi% <nul&choice /c Y /n >nul
if %ErrorLevel%==1 goto :OOBEmain3


:OOBEmain3
color 07
cls
echo.
echo   Cursor Changer %batver% Setup
echo ================================O
echo Setup progress : 1/5 (Check precautions)
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
set /p nothing=%clr2%%clrwhi%     Y=Continue                                                              2/3%moveline%%clrwhi% <nul&choice /c Y /n >nul
if %ErrorLevel%==1 goto :OOBEmain4


:OOBEmain4
color 07
cls
echo.
echo   Cursor Changer %batver% Setup
echo ================================O
echo Setup progress : 1/5 (Check precautions)
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
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     Y=Continue                                                              3/3%moveline%%clrwhi% <nul&choice /c Y /n >nul
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul


:OOBEmain5
color 07
cls
echo.
echo   Cursor Changer %batver% Setup
echo ================================O
echo Setup progress : 2/5 (Confirm information)
echo.
echo.
echo          Currently, the English version of Cursor Changer is installed.
echo          Is this correct?
echo.
echo.
echo          (Y=Yes, Is this Correct.)
echo          (N=No, I dont Understand English.)
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     Y=Continue     N=No                                                        %moveline%%clrwhi% <nul&choice /c YN /n >nul
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto :OOBEmain5_1
if %ErrorLevel%==2 goto :OOBEmain5ifno


:OOBEmain5ifno
color 07
cls
echo.
echo   Cursor Changer %batver% Setup
echo ================================O
echo Setup progress : 2/5 (Confirm information)
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
echo.
echo.
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     Y=Continue     N=No                                                        %moveline%%clrwhi% <nul&choice /c YN /n >nul
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto :OOBEmain5_1
if %ErrorLevel%==2 call :OOBEmainshutdown & timeout /t 1 /nobreak >nul&call :exit 0


:OOBEmain5_1
color 07
cls
echo.
echo   Cursor Changer %batver% Setup
echo ================================O
echo Setup progress : 2/5 (Confirm information)
echo.
echo.
echo          You can enter what you want Cursor Changer to call you.
echo          By default, it will call you "%USERNAME%".
echo          Do you want to change it?
echo.
echo.
echo          (Y=Yes, I want change it.)
echo          (N=No, keep it.)
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     Y=Yes     N=No                                                             %moveline%%clrwhi% <nul&choice /c YN /n >nul
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto :OOBEmain5_2
if %ErrorLevel%==2 call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto :OOBEmain6


:OOBEmain5_2
set YourName=
color 07
cls
echo.
echo   Cursor Changer %batver% Setup
echo ================================O
echo Setup progress : 2/5 (Confirm information)
echo.
echo.
echo          Now, please enter below what you would like to be called.
echo.
echo.
echo          Input box :
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
set /p nothing=%clr2%%clrwhi%                                                                                %moveline%%clrwhi% <nul&set /p YourName=%clr2%[10;21H
)
if %ErrorLevel%==2 goto :OOBEmain5_2c


:OOBEmain5_2c
if not defined Yourname goto :OOBEmain5_2c_error
color 07
cls
echo.
echo   Cursor Changer %batver% Setup
echo ================================O
echo Setup progress : 2/5 (Confirm information)
echo.
echo.
echo          You Entered "%YourName%".
echo          Are you sure?
echo.
echo.
echo          (Y=Yes!)
echo          (N=No.)
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     Y=Yes     N=No                                                             %moveline%%clrwhi% <nul&choice /c YN /n >nul
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto :OOBEmain6
if %ErrorLevel%==2 goto :OOBEmain5_2


:OOBEmain5_2c_error
color 07
cls
echo.
echo   Cursor Changer %batver% Setup
echo ================================O
echo Setup progress : 2/5 (Confirm information)
echo.
echo.
echo          Please enter something in input box.
echo          You cannot continue without a name!
echo.
echo.
echo          (Hit Any key to Continue...)
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
echo   Cursor Changer %batver% Setup
echo ================================O
echo Setup progress : 3/5 (Set theme of Cursor Changer)
echo.
echo.
echo          Cursor Changer is able to choose
echo          between a white or dark theme.
echo          Do you want to choose? 
echo.
echo          (If not selected, the default dark theme will be used.)
echo.
echo.
echo          (Y=Yes, I want Choose the theme!)
echo          (N=No, I Dont want to.)
echo.
echo.
echo.
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     Y=Continue     N=No                                                        %moveline%%clrwhi% <nul&choice /c YN /n >nul
if %ErrorLevel%==1 goto :OOBEmain6theme1
if %ErrorLevel%==2 call :OOBEmainblank & timeout /t 1 /nobreak >nul&set oobetheme=dark&goto :OOBEmain7


:OOBEmain6theme1
if "%OOBEundiscard%"=="true" (call :OOBEmainblank & timeout /t 1 /nobreak >nul&set oobetheme=dark&set OOBEundiscard=&goto :OOBEmain7)
color 07
cls
echo.
echo   Cursor Changer %batver% Setup
echo ================================O
echo Setup progress : 3/5 (Set theme of Cursor Changer)
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
echo.
echo.
echo.
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     A,1=move to Left     D,2=move to right     B=Exit                          %moveline%%clrwhi% <nul&choice /c AD12B /n >nul
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
echo   Cursor Changer %batver% Setup
echo ================================O
echo Setup progress : 3/5 (Set theme of Cursor Changer)
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
echo.
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     A,1=move to Left     D,2=move to right     Y,E=Confirm     B=Exit          %moveline%%clrwhi% <nul&choice /c AD12BYE /n >nul
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
echo   Cursor Changer %batver% Setup
echo ================================O
echo Setup progress : 3/5 (Set theme of Cursor Changer)
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
echo     ^・   befully compatible with this theme.
echo.
echo          (A,D or 1,2 to move, Y or E to confirm.)
echo          (B to stop choosing the theme.)
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     A,1=move to Left     D,2=move to right     Y,E=Confirm     B=Exit          %moveline%%clrwhi% <nul&choice /c AD12BYE /n >nul
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
echo   Cursor Changer %batver% Setup
echo ================================O
echo Setup progress : 3/5 (Set theme of Cursor Changer)
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
echo.
echo.
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     Y,E=Confirm     B,N=Exit                                                   %moveline%%clrwhi% <nul&choice /c BNYE /n >nul
if %ErrorLevel%==1 goto :OOBEmain6theme2
if %ErrorLevel%==2 goto :OOBEmain6theme2
if %ErrorLevel%==3 call :OOBEmainblank & timeout /t 1 /nobreak >nul&set oobetheme=dark&goto :OOBEmain7
if %ErrorLevel%==4 call :OOBEmainblank & timeout /t 1 /nobreak >nul&set oobetheme=dark&goto :OOBEmain7



:OOBEmain6theme3confirm
color f0
cls
echo.
echo   Cursor Changer %batver% Setup
echo ================================O
echo Setup progress : 3/5 (Set theme of Cursor Changer)
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
echo.
echo.
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     Y,E=Confirm     B,N=Exit                                                   %moveline%%clrwhi% <nul&choice /c BNYE /n >nul
if %ErrorLevel%==1 goto :OOBEmain6theme3
if %ErrorLevel%==2 goto :OOBEmain6theme3
if %ErrorLevel%==3 set oobetheme=white&call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto :OOBEmain7
if %ErrorLevel%==4 set oobetheme=white&call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto :OOBEmain7


:OOBEmain6themeifback
if "%oobetheme%"=="white" (color f0) else (color 07)
cls
echo.
echo   Cursor Changer %batver% Setup
echo ================================O
echo Setup progress : 3/5 (Set theme of Cursor Changer)
echo.
echo.
echo          Do you want Discard theme selection and proceed?
echo          (If you discard, the default dark theme will be selected.)
echo.
echo.
echo          (Y= Yes, I want discard it.)
echo          (N= No, I want Choose the theme!)
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     Y=Yes     N=No                                                             %moveline%%clrwhi% <nul&choice /c YN /n >nul
if %ErrorLevel%==1 set OOBEundiscard=true&exit /b
if %ErrorLevel%==2 exit /b

:OOBEmain7
if "%oobetheme%"=="white" (color f0) else (color 07)
cls
echo.
echo   Cursor Changer %batver% Setup
echo ================================O
echo Setup progress : 4/5 (Customize of Settings)
echo.
echo.
echo          Cursor Changer is able to customize settings.
echo          Do you want to customize?
echo.
echo          (if you don't, The settings will set to default values.)
echo.
echo.
echo          (Y=Yes, I Want!)
echo          (N=No, That's just a pain in the ass.)
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     Y=Continue     N=No                                                        %moveline%%clrwhi% <nul&choice /c YN /n >nul
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto :OOBEmain7CustomizeSettings
if %ErrorLevel%==2 call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto :OOBEmain8

:OOBEmain7CustomizeSettingsdiscard
if "%oobetheme%"=="white" (color f0) else (color 07)
cls
echo.
echo   Cursor Changer %batver% Setup
echo ================================O
echo Setup progress : 4/5 (Customize of Settings)
echo.
echo.
echo          Do you really want to discard customize setting?
echo.
echo          (if you discard, the all settings is will be set to defaults.)
echo.
echo          (Y=Yes, I want to discard it!)
echo          (N=No, I want customize settings!)
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     Y=Yes     N=No                                                             %moveline%%clrwhi% <nul&choice /c YN /n >nul
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&set OOBEsetting1toggle=true&set OOBEsetting2toggle=false&set OOBEsetting3toggle=false&set OOBEsetting4toggle=true&set OOBEsetting5toggle=true&goto :OOBEmain8
if %ErrorLevel%==2 goto :OOBEmain7CustomizeSettings1

:OOBEmain7CustomizeSettings
if "%oobetheme%"=="white" (set OOBEsettingclr=[100m[97m&set OOBEsettingclr2=[0m[107m[30m)
if "%oobetheme%"=="dark" (set OOBEsettingclr=[7m&set OOBEsettingclr2=[0m)
set OOBEsetting1toggle=false&set OOBEsetting2toggle=false&set OOBEsetting3toggle=false&set OOBEsetting4toggle=false&set OOBEsetting5toggle=false
if "%oobetheme%"=="white" (color f0) else (color 07)
cls
echo.
echo   Cursor Changer %batver% Setup
echo ================================O
echo Setup progress : 4/5 (Customize of Settings)
echo.
echo.
echo          O================================O   Customize of Settings
echo          I 1 Boot as Cursor Changer       I
echo          O================================O   Nothing selected...
echo          I 2 Admin when boot              I
echo          O================================O   W or S and 1~5 to move.
echo          I 3 Check update at boot         I   Y to Toggle it, N or B to
echo          O================================O   Discard.
echo          I 4 Longpress detection of enter I   move to "OK" and enter Y to
echo          O================================O   confirm.
echo          I 5 Boot animation               I   
echo          O================================O
echo                       I  OK  I
echo                       O======O
echo.
echo.
set /p nothing=%clr2%%clrwhi%     W,S or 1~5=Move     Y=Toggle     N,B=Discard                               %moveline%%clrwhi% <nul&choice /c WS12345YNB6 /n >nul
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
echo   Cursor Changer %batver% Setup
echo ================================O
echo Setup progress : 4/5 (Customize of Settings)
echo.
echo.
echo          O================================O   Customize of Settings
echo          I%OOBEsettingclr% 1 Boot as Cursor Changer       %OOBEsettingclr2%I
echo          O================================O   Setting whether to
echo          I%OOBEsetting2clr% 2 Admin when boot              %OOBEsetting2clr2%I   transition to
echo          O================================O   Cursor Change (1 at Mainmenu)
echo          I%OOBEsetting3clr% 3 Check update at boot         %OOBEsetting3clr2%I   after startup.
echo          O================================O   you can change the cursor faster.
echo          I%OOBEsetting4clr% 4 Longpress detection of enter %OOBEsetting4clr2%I
echo          O================================O   %clrgra%disable is recommended.%OOBEsettingclr2%
echo          I%OOBEsetting5clr% 5 Boot animation               %OOBEsetting5clr2%I
echo          O================================O
echo                       I  OK  I
echo                       O======O
echo.
echo.
set /p nothing=%clr2%%clrwhi%     W,S or 1~5=Move     Y=Toggle     N,B=Discard                               %moveline%%clrwhi% <nul&choice /c WS12345YNB6 /n >nul
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
echo   Cursor Changer %batver% Setup
echo ================================O
echo Setup progress : 4/5 (Customize of Settings)
echo.
echo.
echo          O================================O   Customize of Settings
echo          I%OOBEsetting1clr% 1 Boot as Cursor Changer       %OOBEsetting1clr2%I
echo          O================================O   Attempts to obtain administrative
echo          I%OOBEsettingclr% 2 Admin when boot              %OOBEsettingclr2%I   privileges at startup.
echo          O================================O   Should be enabled in case of
echo          I%OOBEsetting3clr% 3 Check update at boot         %OOBEsetting3clr2%I   problems changing Cursors.
echo          O================================O   Enabling may also faster boot up.
echo          I%OOBEsetting4clr% 4 Longpress detection of enter %OOBEsetting4clr2%I   
echo          O================================O   %clrgra%disable is recommended.%OOBEsettingclr2%
echo          I%OOBEsetting5clr% 5 Boot animation               %OOBEsetting5clr2%I
echo          O================================O
echo                       I  OK  I
echo                       O======O
echo.
echo.
set /p nothing=%clr2%%clrwhi%     W,S or 1~5=Move     Y=Toggle     N,B=Discard                               %moveline%%clrwhi% <nul&choice /c WS12345YNB6 /n >nul
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
echo   Cursor Changer %batver% Setup
echo ================================O
echo Setup progress : 4/5 (Customize of Settings)
echo.
echo.
echo          O================================O   Customize of Settings
echo          I%OOBEsetting1clr% 1 Boot as Cursor Changer       %OOBEsetting1clr2%I
echo          O================================O   Check Update at boot up.
echo          I%OOBEsetting2clr% 2 Admin when boot              %OOBEsetting2clr2%I   Updates, if any, can be applied.
echo          O================================O   However, Boot time may be slower.
echo          I%OOBEsettingclr% 3 Check update at boot         %OOBEsettingclr2%I   API rate limit of github
echo          O================================O   may be reached.
echo          I%OOBEsetting4clr% 4 Longpress detection of enter %OOBEsetting4clr2%I
echo          O================================O   %clrgra%disable is recommended.%OOBEsettingclr2%
echo          I%OOBEsetting5clr% 5 Boot animation               %OOBEsetting5clr2%I
echo          O================================O
echo                       I  OK  I
echo                       O======O
echo.
echo.
set /p nothing=%clr2%%clrwhi%     W,S or 1~5=Move     Y=Toggle     N,B=Discard                               %moveline%%clrwhi% <nul&choice /c WS12345YNB6 /n >nul
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
echo   Cursor Changer %batver% Setup
echo ================================O
echo Setup progress : 4/5 (Customize of Settings)
echo.
echo.
echo          O================================O   Customize of Settings
echo          I%OOBEsetting1clr% 1 Boot as Cursor Changer       %OOBEsetting1clr2%I
echo          O================================O   You can toggle the message when
echo          I%OOBEsetting2clr% 2 Admin when boot              %OOBEsetting2clr2%I   you press and hold enter without
echo          O================================O   typing anything in the main menu.
echo          I%OOBEsetting3clr% 3 Check update at boot         %OOBEsetting3clr2%I   However, this setting may not be
echo          O================================O   meaningful.
echo          I%OOBEsettingclr% 4 Longpress detection of enter %OOBEsettingclr2%I
echo          O================================O   %clrgra%enable is recommended.%OOBEsettingclr2%
echo          I%OOBEsetting5clr% 5 Boot animation               %OOBEsetting5clr2%I
echo          O================================O
echo                       I  OK  I
echo                       O======O
echo.
echo.
set /p nothing=%clr2%%clrwhi%     W,S or 1~5=Move     Y=Toggle     N,B=Discard                               %moveline%%clrwhi% <nul&choice /c WS12345YNB6 /n >nul
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
echo   Cursor Changer %batver% Setup
echo ================================O
echo Setup progress : 4/5 (Customize of Settings)
echo.
echo.
echo          O================================O   Customize of Settings
echo          I%OOBEsetting1clr% 1 Boot as Cursor Changer       %OOBEsetting1clr2%I
echo          O================================O   You can toggle the startup
echo          I%OOBEsetting2clr% 2 Admin when boot              %OOBEsetting2clr2%I   animation after boot up
echo          O================================O   If disabled, boot up will be
echo          I%OOBEsetting3clr% 3 Check update at boot         %OOBEsetting3clr2%I   2 seconds faster, but
echo          O================================O   with less visual.
echo          I%OOBEsetting4clr% 4 Longpress detection of enter %OOBEsetting4clr2%I
echo          O================================O   %clrgra%enable is recommended.%OOBEsettingclr2%
echo          I%OOBEsettingclr% 5 Boot animation               %OOBEsettingclr2%I
echo          O================================O
echo                       I  OK  I
echo                       O======O
echo.
echo.
set /p nothing=%clr2%%clrwhi%     W,S or 1~5=Move     Y=Toggle     N,B=Discard                               %moveline%%clrwhi% <nul&choice /c WS12345YNB6 /n >nul
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
echo   Cursor Changer %batver% Setup
echo ================================O
echo Setup progress : 4/5 (Customize of Settings)
echo.
echo.
echo          O================================O   Customize of Settings
echo          I%OOBEsetting1clr% 1 Boot as Cursor Changer       %OOBEsetting1clr2%I
echo          O================================O   Confirms the setting.
echo          I%OOBEsetting2clr% 2 Admin when boot              %OOBEsetting2clr2%I
echo          O================================O   However, it is recommended that
echo          I%OOBEsetting3clr% 3 Check update at boot         %OOBEsetting3clr2%I   at least one setting be enabled.
echo          O================================O   All of these settings can be
echo          I%OOBEsetting4clr% 4 Longpress detection of enter %OOBEsetting4clr2%I   change later.
echo          O================================O   
echo          I%OOBEsetting5clr% 5 Boot animation               %OOBEsetting5clr2%I
echo          O================================O
echo                       I%OOBEsettingclr%  OK  %OOBEsettingclr2%I
echo                       O======O
echo.
echo.
set /p nothing=%clr2%%clrwhi%     W,S or 1~5=Move     Y=Toggle     N,B=Discard                               %moveline%%clrwhi% <nul&choice /c WS12345YNB6 /n >nul
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
echo   Cursor Changer %batver% Setup
echo ================================O
echo Setup progress : 4/5 (Customize of Settings)
echo.
echo.
echo          Customize of settings :
echo.
echo          1 Boot as Cursor Changer       : %OOBEsetting1toggle% %clrgra%(recommend false)%OOBEsettingclr2%
echo          2 Admin when boot              : %OOBEsetting2toggle% %clrgra%(recommend false)%OOBEsettingclr2%
echo          3 Check update at boot         : %OOBEsetting3toggle% %clrgra%(recommend false)%OOBEsettingclr2%
echo          4 Longpress Detection of enter : %OOBEsetting4toggle% %clrgra%(recommend true)%OOBEsettingclr2%
echo          5 Boot animation               : %OOBEsetting5toggle% %clrgra%(recommend true)%OOBEsettingclr2%
echo.
echo          If you continue, these settings will be written to the Setting file.
echo          Are you sure? %clrgra%(setting file is at "%batchmainpath%".) %OOBEsettingclr2%
echo.
echo          (Y=Yes, this is fine.)
echo          (N=No, I want change it.)
echo.
echo.
set /p nothing=%clr2%%clrwhi%     Y=Yes     N=No                                                             %moveline%%clrwhi% <nul&choice /c YN /n >nul
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
        echo typosWarning=false >> %Settingsfile%
    ) else if "%OOBEsetting4toggle%"=="true" (
        echo typosWarning=true >> %Settingsfile%
    ) else (echo typosWarning=true >> %Settingsfile%)

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
cls
echo.
echo   Cursor Changer %batver% Setup
echo ================================O
echo Setup progress : 5/5 (End of set up)
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
echo.
echo.
echo.
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     Y,E=Exit                                                                   %moveline%%clrwhi% <nul&choice /c YE /n >nul
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
if %ErrorLevel%==1 (
call :Wipealldeta
goto :Cursor_Changer_REWipeYippeee
)
if %ErrorLevel%==2 set rmsel=2& goto :Cursor_Changer_REmenu_main

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
set selected=
set FromREConsole=true
mode con: cols=75 lines=25
color 07
set bootbatnow=no
if not defined dummy (set clr=[7m&set clr2=[0m) else (set clr=[7m&set clr2=[0m)
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
if "%selected%"=="alldefnow1" (goto :AllDefult1)
if "%selected%"=="playdefboot" (set typosWarning=0&cls&goto :firstboot)
if "%selected%"=="debugyesnow" (goto :darkgo)
if "%selected%"=="fulldebug" (goto :fulldebug)
if "%selected%"=="getadmin" (goto :batstartadm)
if "%selected%"=="restoresetting" (
call :Wipealldeta
echo done. enter somethings to continue.
pause >nul
)
if "%selected%"=="alldefdeletebat" (set typosWarning=0&echo delete bat, confirm to type something...&pause&goto :alldefdeletefinish5)
if "%selected%"=="windowsfiltertest" (goto :batbootcheckwinverbad)
if "%selected%"=="funanimationdeb" (goto :batbootanimationfun)
if "%selected%"=="openie" (goto :openiedev)
if "%selected%"=="setenter" (echo.&set /p typosWarning=pls type:&goto :Mainmenuboot) else (set selected= &echo enter valid command.&goto :Cursor_Changer_REConsoleask)


rem O========================================= OOBE and Receovery Code Ended =================================================O


:Wipealldeta
rem Wipe Setting file
echo nodogcheckfor1234567890qwertyuiop > %Settingsfile%
echo YourName=%USERNAME% >> %Settingsfile%
echo BootAsCC=false >> %Settingsfile%
echo admin=false >> %Settingsfile%
echo CheckUpdate=false >> %Settingsfile%
echo typosWarning=true >> %Settingsfile%
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
if "%linuxboot%"=="false" (mode con: cols=75 lines=25)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   & set ??????=What are you doing here? I know you here. %username%.
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
if "%alldefentered%"=="true" (
set alldefno2clr=
set alldefno2clr2=
set alldefclr=
set alldefclr2=
set alldefentered=
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
set Die=%random%& set Die2=%random%
if "%Die%"=="%Die2%" (title & color 04
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
find "typosWarning=true" %Settingsfile% > nul
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
if "%ErrorLevel%"=="0" (set wmodeonoff=Change To Darkmode  &set wmodetoggle=true)
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
find "typosWarning=false" %Settingsfile% > nul
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
if "%ErrorLevel%"=="0" (set wmodeonoff=Change to white mode& set wmodetoggle=false& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Wmode Loaded as "false")) else if "%ErrorLevel%"=="1" (set wmodeonoff=Change to null theme&set wmodetoggle=false&set /a allsettingerror=allsettingerror+1& if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclred%ERROR%linuxishclr2%] Wmode is corrupted. Loaded as "null"))
if "%bootbatnow%"=="yes" (call :SAB_Manager 7)
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

if "%settingbypass%"=="true" (goto :mainmenuskipboot)
rem YAAAAAAAAAAAAAAAAAAY!!!!!!!!!!!!!!!!!!!!! I'M SO HAPPY RIGHT NOWWW!!!!!!!!!!!!!!!!
if "%linuxboot%"=="true" (setlocal enabledelayedexpansion & set /a yay=%random%*17/32767& set yayshow=AAA
for /l %%i in (0,1,!yay!) do (set yayshow=!yayshow!A)
setlocal disabledelayedexpansion)

if "%linuxboot%"=="true" (echo.&echo [%linuxishclr%info%linuxishclr2%] Boot Complete! Y%yayshow%Y :D&echo [%linuxishclr%info%linuxishclr2%] ^(Boot Time : %BootTime% seconds^)&title Cursor Changer ^| Y%yayshow%Y& set yay=& set yayshow=& timeout /t 2 /nobreak >nul& cls) else (cls)
if "%rawboot%"=="true" (echo off)
if "%firststartbat%"=="yes" (goto :batbootanimationbypassfun)
if "%setting5onoff%"=="false" (goto :checksum)
rem Play the boot animation, with a 1 in 64 chance or 1 in 256 chance or a 1 in 512 chance that another version will be played. The random specification(?) requires two consecutive random runs.
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
title Cursor Changer ^| WELCOME
if "%wmodetoggle%"=="true" (set welcomelineclr=[38;2;135;135;135m& set welcomelineclr2=[0m[107m[30m& set welcomelineclr3=[30m) else (set welcomelineclr=[38;2;120;120;120m& set welcomelineclr2=[0m& set welcomelineclr3=[39m)
if "%wmodetoggle%"=="true" (for /l %%i in (0,1,3) do (set /p nothing=[%%i;0H[48;2;230;230;230m                                                                           [0;0H<nul)) else (for /l %%i in (0,1,3) do (set /p nothing=[%%i;0H[48;2;20;20;20m                                                                           [0;0H<nul))
echo.
if not defined dummy (echo [28aCursor Changer %batver%)
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
if not defined dummy (echo [23a2021-2024 tamago_1908 %batbuild%)
set welcomelineclr=& set welcomelineclr2=& set welcomelineclr3=
timeout /t 2 /nobreak >nul
goto :checksum


:batbootanimationfun
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
if "%wmodetoggle%"=="true" (color f0) else (color 07)
if not defined dummy (set /p nothing=[?25h<nul)
if %allsettingerror% gtr 0 if %allsettingerror% lss 10 (set "allsettingerrorshow=   %allsettingerror%") else (set "allsettingerrorshow=  %allsettingerror%")
if %allsettingerror% gtr 0 (
    if not defined dummy (set clrgra=[90m&set clr2=[0m)
    if "%wmodetoggle%"=="false" (set clrgra=[90m&set clr2=[0m)
    if "%wmodetoggle%"=="true" (set clrgra=[0m[107m&set clr2=[90m[107m[30m)
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
if %allsettingerror% gtr 5 (goto :fixallsetting) else (if "%Setting1onoff%"=="true " (goto :cursorchange) else (goto :Mainmenu))
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
call :exit 1
)
if "%selected%"=="y" (
call :Wipealldeta
echo.
echo Fix Complete.
pause
call :exit 1
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
if "%setting6onoff%"=="false" (
    if "%wmodetoggle%"=="true" (set clr2=[0m[107m[30m& set ccmmul=) else (set ccmmul=)
    ) else (
    if "%wmodetoggle%"=="true" (set clr2=[0m[107m[30m)
)
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
    if "%wmodetoggle%"=="true" (set ccmmul=[107m[4m& set clr2=[0m[107m) else (set clr2=[0m[90m& set ccmmul=[90m[4m)
    ) else (
    if "%wmodetoggle%"=="true" (set ccmmul=& set clr2=[0m[107m) else (set clr2=[0m[90m& set ccmmul=))
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
if "%MenuRedrew%"=="true" (set MenuRedrew=& call :mainmenu_resetcolor & exit /b) else (call :MainmenuMessages)
if "%errorlevel%"=="1" (cls & set Updateavailable=& goto :Mainmenudrew) else if "%errorlevel%"=="0" (goto :Mainmenudrewend)
:Mainmenudrewend
set selected=
rem ask select
echo                Enter any number or commands you wish to run.
if "%FirstCursorisEdited%"=="true" (set /p "selected=[13;37H") else if "%MainmenuMessageshowed%"=="true" (set /p selected=[13;37H) else if not defined MainmenuMessageshowed (set /p selected=[11;37H)
echo.& if "%selected%"=="" (goto :typosMainmenu) else (echo %selected% was selected.)
set typosWarning=0


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

rem Debugging command references (SAO refarence)
if "%selected%"=="help" (goto :allcommands)

rem For debugging
if "%selected%"=="crashtest" (exit /b)
if "%selected%"=="checkmem" (call :checkmem& goto :mainmenu)
if "%selected%"=="boottime" (echo.& echo Boot time : %BootTime% Seconds& echo.& pause & goto :mainmenu)
if "%selected%"=="alldefnow1" (goto :AllDefult1)
if "%selected%"=="playdefboot" (cls&goto :CursorChangerOOBE_Animation)
if "%selected%"=="debugyesnow" (goto :darkgo)
if "%selected%"=="reload" (cls&set bootbatnow=yes&goto :batstart)
if "%selected%"=="fulldebug" (goto :fulldebug)
if "%selected%"=="getadmin" (goto :batstartadm)
if "%selected%"=="bypassfirstboot" (set firststartbat=&call :Wipealldeta)
if "%selected%"=="alldefdeletebat" (echo delete bat, confirm to type something...&pause&goto :alldefdeletefinish5)
if "%selected%"=="windowsfiltertest" (goto :batbootcheckwinverbad)
if "%selected%"=="funanimationdeb" (goto :batbootanimationfun)
if "%selected%"=="openie" (goto :openiedev)
if "%selected%"=="setenter" (echo.&set /p typosWarning=pls type:&goto :Mainmenuboot)

rem FUCK YOU!!!!!!
if "%selected%"=="fucku" (echo fuck you too&pause&goto :Mainmenuboot)
if "%selected%"=="fuckyou" (echo fuck you too&pause&goto :Mainmenuboot)
if "%selected%"=="fucu" (echo fuck you too&pause&goto :Mainmenuboot)
if "%selected%"=="fucyou" (echo fuck you too&pause&goto :Mainmenuboot)

rem Power Commands
if "%selected%"=="exit" (goto :exitmenu)
if "%selected%"=="shutdown" (goto :batshutdown)
if "%selected%"=="reboot" (echo.& echo Rebooting...& call :rebootbatch)
if "%selected%"=="counttestdeb" (set typosWarning=0&goto :stupidtest) else echo. &echo Invalid (or unusable) selection! Please enter a valid entry.&pause&goto :Mainmenudrew

rem Return process if no input is made
:typosMainmenu
echo ?
echo.
pause
echo Can you type somethings?
echo.
pause
if "%setting4onoff%"=="false" (goto :Mainmenu)

rem Mechanism for detecting long presses
set /a typosWarning=typosWarning+1
if %typosWarning% gtr 20  (goto :typosWarningtest1)
goto :Mainmenuboot

:typosWarningtest1
if not %typosWarning% gtr 50 (goto :typosWarning1)
if %typosWarning% gtr 50 (goto :typosWarningtest2)

:typosWarningtest2
if not %typosWarning% gtr 100 (goto :typosWarning2)
if %typosWarning% gtr 100 (goto :typosWarningtest3)

:typosWarningtest3
if not %typosWarning% gtr 130 (goto :typosWarning3)
if %typosWarning% gtr 130 (goto :typosWarningtest4)

:typosWarningtest4
if not %typosWarning% gtr 200 (goto :typosWarning4)
if %typosWarning% gtr 200 (goto :typosWarningtest5)

:typosWarningtest5
if not %typosWarning% gtr 250 (goto :typosWarning5)
if %typosWarning% gtr 250 (goto :typosWarning6)

rem Collection of long press warning messages
:typosWarning1
if %typosWarning% gtr 21 (goto :Mainmenuboot)
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"Uh, What are you doing...?\", '...', 'OK', 'none');exit $result;"
goto :Mainmenuboot

:typosWarning2
if %typosWarning% gtr 51 (goto :Mainmenuboot)
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"...Why did you hit enter without any inputs...?\", '>:/', 'OK', 'none');exit $result;"
goto :Mainmenuboot

:typosWarning3
if %typosWarning% gtr 101 (goto :Mainmenuboot)
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"You wouldn't make a hundred hit enter without any fucking inputs, You've got to be kidding me!\", '>:(', 'OK', 'none');exit $result;"
goto :Mainmenuboot

:typosWarning4
if %typosWarning% gtr 131 (goto :Mainmenuboot)
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"STOP.\", 'PLEASE STOP.', 'OK', 'none');exit $result;"
goto :Mainmenuboot

:typosWarning5
if %typosWarning% gtr 201 (goto :Mainmenuboot)
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"STOP, IT, NOW.\", 'FINAL WARNING', 'OK', 'Warning');exit $result;"
goto :Mainmenuboot

:typosWarning6
if %typosWarning% gtr 251 (goto :Mainmenuboot)
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"...\", '...', 'OK', 'Error');exit $result;"
shutdown /r /t 10 /c "REGRET IT"
call :exit 0


:MainmenuMessages
rem Display messages. FirstCursorisEdited message, and updateavailable message
Call :MainmenuMessagesTimecheck & set tcmrand=&set tcmrand2=
if not "%errorlevel%"=="1" (
if "%FirstCursorisEdited%"=="true" (echo [17aEasy to change the %FirstSTFsfile%, huh?&echo.)
) else (set MainmenuMessageshowed=true)
if "%Updateavailable%"=="true" (
    title Cursor Changer ^| Update Available! ^(Exprimental^)
    setlocal enabledelayedexpansion
    if "%batbeta%"=="True" (set batbetamessage=^(Tip : this version is beta, So it's probably have bugs.^))
  echo New update is available^^! ^(%updatemyversion% to %updateversion%^)
  echo do you want to update? !batbetamessage!
  set batbetamessage=
  SET /P updateselected=^(Y or N^) :
  if "!updateselected!"=="y" (set updateselected=&set updateavailable=&echo.&echo updating...&cd %~dp0&set Powersheller=Doupdate&call :Powersheller&cd %batchmainpath%&echo update complete successfully.&pause&call :exit 0)
if "!updateselected!"=="n" (set updateselected=&set updateavailable=&echo.&echo update is canceled.&echo.&echo If you wish to disable the function to check for updates at startup, you can do so in the settings.&pause&set checkupdatetoggle=false&cls&exit /b 1)
setlocal disabledelayedexpansion
)
exit /b 0

:MainmenuMessagesTimecheck
rem Display messages for specific dates
if "%timecheckmessageshowed%"=="true" (set MainmenuMessageshowed=& exit /b 0) else (set timecheckmessageshowed=true)
if "%date:~0,4%"=="1999" (echo [27aWhere is the axolotl?& echo.& exit /b 1)
if "%date:~5%"=="01/01" (echo [30aHappy New Year!& echo.& exit /b 1)
if "%date:~5%"=="04/01" (echo [21aYour Computer is Destroyed!!!!!!!& echo.& exit /b 1)
if "%date:~5%"=="10/31" (echo [30aHappy Halloween!& echo.& exit /b 1)
if "%date:~5%"=="12/25" (echo [30aHappy Holiday!& echo.& exit /b 1)
if "%date:~5%"=="12/31" (echo [20aDespite everything, it's still you.& echo.& exit /b 1)
set tcmrand=0& set tcmrand2=0
set /a tcmrand=%random%*33/32767& set /a tcmrand2=%random%*33/32767
setlocal enabledelayedexpansion
rem you're bit lucky if you see this.
if "!tcmrand!"=="!tcmrand2!" (
set tcmrand=0
set /a tcmrand=%random%*11/32767& set /a tcmrand=%random%*11/32767
if "!tcmrand!"=="0" (echo [26aThis is all meaningless.& echo.& exit /b 1) else if "!tcmrand!"=="1" (echo [19aWho is actually reading this message?& echo.& exit /b 1) else if "!tcmrand!"=="2" (echo [20aNobody don't care about this batch.& echo.& exit /b 1) else if "!tcmrand!"=="3" (echo [25aPlease don't uninstall me& echo.& exit /b 1) else if "!tcmrand!"=="4" (echo [28aThe cake is a lie&echo.&exit /b 1) else if "!tcmrand!"=="5" (echo [28aAre you really %YourName%?& echo.& exit /b 1) else if "!tcmrand!"=="6" (echo [19aAll your batches are belong to me ^>:D& echo.& exit /b 1) else if "!tcmrand!"=="7" (echo [30aHello world :D& echo.& exit /b 1) else if "!tcmrand!"=="8" (echo [30aAlso try Debios& echo.& exit /b 1) else if "!tcmrand!"=="9" (echo [27aAlso try Shivtanium OS& echo.& exit /b 1) else if "!tcmrand!"=="10" (goto :MainmenuMessagesTimecheckEASTEREGG)
)
setlocal disabledelayedexpansion
exit /b 0

:MainmenuMessagesTimecheckEASTEREGG
rem small test easter egg.
set name=& set namecount=
cls
color 04
title 
:MainmenuMessagesTimecheckEASTEREGG_ASK
cls
if not defined dummy (echo [19aWhat is the most GREATEST Batch file?)
set name=
if "%namecount%" gtr "2" start /min powershell -WindowStyle Hidden -Command "& {Add-Type -AssemblyName System.Windows.Forms; Start-Sleep -Milliseconds 100; $welcomeText = \"Cursor Changer\"; foreach ($char in $welcomeText.ToCharArray()) {[System.Windows.Forms.SendKeys]::SendWait($char); Start-Sleep -Milliseconds 125}; Start-Sleep -Milliseconds 500; [System.Windows.Forms.SendKeys]::SendWait('{ENTER}'); exit}"
rem where is my location code is below. maybe I'll use it someday.
rem powershell -Command "& { Add-Type -AssemblyName System.Windows.Forms; Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class KeyboardHelper { [DllImport(\"user32.dll\", SetLastError = true)] public static extern void keybd_event(byte bVk, byte bScan, uint dwFlags, UIntPtr dwExtraInfo); public const byte VK_LWIN = 0x5B; public const byte VK_S = 0x53; public const uint KEYEVENTF_KEYUP = 0x0002; public static void SendWinS() { keybd_event(VK_LWIN, 0, 0, UIntPtr.Zero); keybd_event(VK_S, 0, 0, UIntPtr.Zero); keybd_event(VK_S, 0, KEYEVENTF_KEYUP, UIntPtr.Zero); keybd_event(VK_LWIN, 0, KEYEVENTF_KEYUP, UIntPtr.Zero); } }'; Start-Sleep -Milliseconds 500; [KeyboardHelper]::SendWinS(); Start-Sleep -Milliseconds 250; $welcomeText = 'Where is my location?'; foreach ($char in $welcomeText.ToCharArray()) { [System.Windows.Forms.SendKeys]::SendWait($char); Start-Sleep -Milliseconds 50; }; Start-Sleep -Milliseconds 3500; [System.Windows.Forms.SendKeys]::SendWait('{ESC}') }"
if not defined dummy (set /p "name=[30a")
if not "%name%"=="Cursor Changer" (set /a namecount=namecount+1) else (goto :MainmenuMessagesTimecheckEASTEREGG_RIGHT)
if "%namecount%"=="1" (echo [29aThat's incorrect.)
if "%namecount%"=="2" (echo [29aTHAT'S INCORRECT.) else if %namecount% gtr 2 (echo [35a...)
ping -n 2 -w 500 localhost >nul
goto :MainmenuMessagesTimecheckEASTEREGG_ASK
:MainmenuMessagesTimecheckEASTEREGG_RIGHT
if not defined dummy (echo [30aThat's right :D)
if "%wmodetoggle%"=="true" (color f0) else (color 07)
timeout /t 2 /nobreak >nul
set name=& set namecount=
goto :mainmenu


:background_menu
rem Honestly, I have no idea HOW this is working.
if "%setting7onoff%"=="false" (exit /b)
if not defined dummy (set /p nothing=[?25l<nul)
setlocal enabledelayedexpansion
rem argument 1 is for OOBE. give 0~200 (every 10) value.
rem initialize variable
if "%wmodetoggle%"=="true" (
    if not defined dummy (set thmclr2=[107m[30m)
    set thml=26& set thml2=25
    set thmldrewb=255
) else (if not defined dummy (set thmclr2=[0m) & set thmldrewb=12)
if "%wmodetoggle%"=="true" (set thmlfor=194,9,243&set thmldred=155) else (set thmlfor=69,-9,12&set thmldred=155)
rem Drew bg. thml means theme line.
for /l %%i in (!thmlfor!) do (
    rem I think there is a simpler way to do this without having to bother with the calculations, but... well, it's working anyway.
    if "%wmodetoggle%"=="true" (set /a thml2-=1& set /a thml-=1) else (set /a thml=19+%%i/10& set /a thml2=thml-1)
    if "%1"=="1" (set /a thmldrew=^(%%i-57^)+^(!count!*^(61-12^)^)/170) else (set /a thmldrew=%%i-6)
    rem                                  ↑      and      ↑ Difference is must be 4. 170 is (100/) + 61+12. maybe.
    if !thmldrew! lss 12 (set thmldrew=12) 
    if not "%wmodetoggle%"=="true" (set /a thmldred=thmldred-21) else (set /a thmldred=thmldred+11)
    if !thmldred! lss 12 (set thmldred=18) else if !thmldred! gtr 220 (set /a thmldred=230)
    if not "%1"=="1" (set thmclr=[48;2;!thmldred!;!thmldrew!;!thmldrewb!m) else (set thmclr=[48;2;!thmldrew!;!thmldrew!;!thmldrew!m)
    for /l %%a in (1,1,3) do (set /p nothing=[!thml!d!thmclr!                         !thmclr2!<nul)
    echo [!thml2!d
)
rem delete variablesCC
set thml=& set thml2=& set thmclr=& set thmldrew=& set thmlfor=
if not "%1"=="1" (setlocal disabledelayedexpansion & set /p nothing=[?25h<nul)
if not defined dummy (set /p nothing=[0;0H<nul)
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


:exitmenu
rem Preparing of Menu and Variables
rem Smart Processing!!!! DO NOT CARE ABOUT SO MANY OF IF STATEMENTS. PLS
title Cursor Changer ^| Exit Menu 
set exitmenucurrent=0& call :exitmenu_exit
if not defined dummy (set clr=[7m&set clred=[41m&set clrgrn=[42m&set clrcyan=[46m&set clrgra=[90m&set clr2=[0m)
if "%wmodetoggle%"=="false" (set clr=[7m&set clred=[41m&set clrgrn=[42m&set clrgra=[90m&set clrcyan=[46m&set clr2=[0m)
if "%wmodetoggle%"=="true" (set clr=[100m[97m&set clred=[41m&set clrgrn=[42m&set clrgra=[0m[107m&set clrcyan=[46m&set clr2=[90m[107m[30m)
if not defined dummy (set /p nothing=[?25l<nul)

:exitmenu_main
rem Main Exit Menu
if "%exitmenuexit%"=="true" (set exitmenucurrent=& call :exitmenu_exit & goto :mainmenu)
if not defined exitmenuboot (set MenuRedrew=true& set /p nothing=%clrgra%<nul& call :Mainmenudrew & echo %clr2% & set exitmenuboot=true)
call :exitmenu_Core_Drew
rem I'm doing this because when I use ANSI ESC sequences in Virtual Studio Code, the parentheses are colored incorrectly and I don't like that
if not defined dummuy (set ccmmul=[4m)
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
if not defined dummy (set /p nothing=[?25l<nul)
title Cursor Changer ^| BYE
cls
if "%wmodetoggle%"=="true" (set welcomelineclr=[38;2;135;135;135m& set welcomelineclr2=[0m[107m[30m& set welcomelineclr3=[30m) else (set welcomelineclr=[38;2;120;120;120m& set welcomelineclr2=[0m& set welcomelineclr3=[39m)
if "%wmodetoggle%"=="true" (for /l %%i in (0,1,3) do (set /p nothing=[%%i;0H[48;2;230;230;230m                                                                           [0;0H<nul)) else (for /l %%i in (0,1,3) do (set /p nothing=[%%i;0H[48;2;20;20;20m                                                                           [0;0H<nul))
echo.
if not defined dummy (echo [28aCursor Changer %batver%)
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
if not defined dummy (echo [23a2021-2024 tamago_1908 %batbuild%)
set welcomelineclr=& set welcomelineclr2=& set welcomelineclr3=
call :exitmenuexit
call :exit 0

:mainmenu_resetcolor
if not defined dummy (set clr=[7m&set clred=[41m&set clrgrn=[42m&set clrcyan=[46m&set clrgra=[90m&set clr2=[0m)
if "%wmodetoggle%"=="false" (set clr=[7m&set clred=[41m&set clrgrn=[42m&set clrgra=[90m&set clrcyan=[46m&set clr2=[0m)
if "%wmodetoggle%"=="true" (set clr=[100m[97m&set clred=[41m&set clrgrn=[42m&set clrgra=[0m[107m&set clrcyan=[46m&set clr2=[0m[107m[30m)
exit /b

:exitmenuexit
set clrcyan=& set clrgra=& set clred=& set clrgrn=& set clryel=& set clrmag=& exit /b



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
Echo I                        I 4 Long press detection of enter     I  %setting4onoff%   I
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
Echo I                        I 4 Long press detection of enter     I  %setting4onoff%   I
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
if %ErrorLevel%==10 goto :setting1
if %ErrorLevel%==11 goto :setting1

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
Echo I                        I 4 Long press detection of enter     I  %setting4onoff%   I
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
if %ErrorLevel%==10 goto :setting2
if %ErrorLevel%==11 goto :setting2


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
Echo I                        I 4 Long press detection of enter     I  %setting4onoff%   I
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
if %ErrorLevel%==10 goto :setting3
if %ErrorLevel%==11 goto :setting3


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
Echo I                        I %clr%4 Long press detection of enter%clr2%     I  %setting4onoff%   I
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
if %ErrorLevel%==10 goto :setting4
if %ErrorLevel%==11 goto :setting4


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
Echo I                        I 4 Long press detection of enter     I  %setting4onoff%   I
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
if %ErrorLevel%==10 goto :AllDefult
if %ErrorLevel%==11 goto :AllDefult

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
Echo I%clr%                        %clr2%I 4 %wmodeonoff%                         I
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
Echo I%clr%                        %clr2%I 4 %wmodeonoff%                         I
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
Echo I%clr%                        %clr2%I 4 %wmodeonoff%                         I
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
if %ErrorLevel%==7 goto :setting6
if %ErrorLevel%==8 goto :setting6
if %ErrorLevel%==9 goto :settingcategory2intsetting3
if %ErrorLevel%==10 goto :settingcategory2intsetting4


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
Echo I%clr%                        %clr2%I 4 %wmodeonoff%                         I
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
if %ErrorLevel%==7 goto :setting7
if %ErrorLevel%==8 goto :setting7
if %ErrorLevel%==9 goto :settingcategory2intsetting3
if %ErrorLevel%==10 goto :settingcategory2intsetting4


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
Echo I%clr%                        %clr2%I %clr%4 %wmodeonoff%%clr2%                         I
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
if %ErrorLevel%==7 goto :wmode
if %ErrorLevel%==8 goto :wmode
if %ErrorLevel%==9 goto :settingcategory2intsetting3
if %ErrorLevel%==10 goto :settingcategory2intsetting4


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
if %ErrorLevel%==8 goto :setting5
if %ErrorLevel%==9 goto :setting5
if %ErrorLevel%==10 goto :settingcategory2intsetting5_stg3


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
if %ErrorLevel%==8 goto :setting5_1
if %ErrorLevel%==9 goto :setting5_1
if %ErrorLevel%==10 goto :settingcategory2intsetting5_stg3


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
if %ErrorLevel%==8 goto :setting5_2
if %ErrorLevel%==9 goto :setting5_2
if %ErrorLevel%==10 goto :settingcategory2intsetting5_stg3

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



:setting1
rem Apply and verify rem settings
rem Verifying the existence of rem settings:setting1
rem by the way, why this code is so goofy
rem i know why. becouse ITS OLD CODE!!!!!!!!

if "%settinghelptoggle%"=="true" (goto :setting1help)
find "BootAsCC=false" %Settingsfile% > nul
if %ErrorLevel%==0 set setting1setonoff=enable& goto :setting1okey
if %ErrorLevel%==1 set setting1setonoff=Repair& goto :setting1onoff

:setting1onoff
find "BootAsCC=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting1setonoff=disable

:setting1okey
cls
set selected=
echo Do you want to %setting1setonoff% Reboot as Cursor Changer? (Y=Yes N=No B=Back)
SET /P selected= :
echo %selected% has selected.
if "%selected%"=="y" (goto :setting1y)
if "%selected%"=="n" (goto :setting1n)
if "%selected%"=="back" (goto :settingcategory1intsetting1)
if "%selected%"=="b" (goto :settingcategory1intsetting1)
goto :setting1okey

:setting1y
find "BootAsCC=false" %Settingsfile% > nul
echo Applying settings...
if %ErrorLevel%==1 goto :setting1ygo3test
if %ErrorLevel%==0 goto :setting1ygo1

:setting1ygo3test
find "BootAsCC=true" %Settingsfile% > nul
if %ErrorLevel%==1 echo BootAsCC=false >> %Settingsfile%& goto :setting1yokey
if %ErrorLevel%==0 goto :setting1ygo2

:setting1ygo2
powershell "(gc %Settingsfile%) -replace 'BootAsCC=true','BootAsCC=false' | sc %Settingsfile%"
goto :setting1yokey

:setting1ygo1
powershell "(gc %Settingsfile%) -replace 'BootAsCC=false','BootAsCC=true' | sc %Settingsfile%"
goto :setting1yokey

:setting1yokey
cls
Echo The change was made successfully.
Pause
set wantload=setting1
call :SAB_Manager
goto :settingcategory1intsetting1

:setting1n
cls
Echo Did not change settings
Pause
goto :settingcategory1intsetting1

:setting2
if "%settinghelptoggle%"=="true" (goto :setting2help)
find "admin=false" %Settingsfile% > nul
if %ErrorLevel%==0 set setting2setonoff=enable& goto :setting2okey
if %ErrorLevel%==1 set setting2setonoff=Repair& goto :setting2onoff

:setting2onoff
find "admin=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting2setonoff=disable

:setting2okey
cls
echo Do you want to %setting2setonoff% the request for administrative privileges at startup? (Y=Yes N=No B=Back)
SET /P selected= :
echo %selected% has selected.
if "%selected%"=="y" (goto :setting2y)
if "%selected%"=="n" (goto :setting2n)
if "%selected%"=="back" (goto :settingcategory1intsetting2)
if "%selected%"=="b" (goto :settingcategory1intsetting2)
goto :setting2okey

:setting2y
find "admin=false" %Settingsfile% > nul
echo Applying settings...

if %ErrorLevel%==1 goto :setting2ygo3test
if %ErrorLevel%==0 goto :setting2ygo1

:setting2ygo3test
find "admin=true" %Settingsfile% > nul
if %ErrorLevel%==1 echo admin=true >> %Settingsfile%& goto :setting2yokey
if %ErrorLevel%==0 goto :setting2ygo2

:setting2ygo2
powershell "(gc %Settingsfile%) -replace 'admin=true','admin=false' | sc %Settingsfile%"
goto :setting2yokey

:setting2ygo1
powershell "(gc %Settingsfile%) -replace 'admin=false','admin=true' | sc %Settingsfile%"
goto :setting2yokey

:setting2yokey
cls
Echo The change was made successfully.

Pause
set wantload=setting2
call :SAB_Manager
goto :settingcategory1intsetting2

:setting2n
cls
Echo Did not change settings.
Pause
goto :settingcategory1intsetting2

:setting3
if "%settinghelptoggle%"=="true" (goto :setting3help)
find "CheckUpdate=false" %Settingsfile% > nul
if %ErrorLevel%==0 set setting3setonoff=enable& goto :setting3onoff
if %ErrorLevel%==1 set setting3setonoff=Repair&goto :setting3onoff

:setting3onoff
find "CheckUpdate=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting3setonoff=disable&set setting3warning=
:setting3okey
cls
echo Do you want to set Check update at boot to be %setting3setonoff%? (Y=Yes N=No B=Back)
SET /P selected= :
echo %selected% has selected
if "%selected%"=="y" (goto :setting3y)
if "%selected%"=="n" (goto :setting3n)
if "%selected%"=="back" (goto :settingcategory1intsetting3)
if "%selected%"=="b" (goto :settingcategory1intsetting3)
goto :setting3okey

:setting3y
find "CheckUpdate=false" %Settingsfile% > nul
echo Applying settings...

if %ErrorLevel%==1 goto :setting3ygo3test
if %ErrorLevel%==0 goto :setting3ygo1

:setting3ygo3test
find "CheckUpdate=true" %Settingsfile% > nul
if %ErrorLevel%==1 echo CheckUpdate=false >> %Settingsfile%& goto :setting3yokey
if %ErrorLevel%==0 goto :setting3ygo2

:setting3ygo2
powershell "(gc %Settingsfile%) -replace 'CheckUpdate=true','CheckUpdate=false' | sc %Settingsfile%"
goto :setting3yokey

:setting3ygo1
powershell "(gc %Settingsfile%) -replace 'CheckUpdate=false','CheckUpdate=true' | sc %Settingsfile%"
goto :setting3yokey

:setting3n
cls
Echo Did not change settings.
Pause
goto :settingcategory1intsetting3

:setting3yokey
cls
Echo The change was made successfully.
Pause
set wantload=setting3
call :SAB_Manager
goto :settingcategory1intsetting3

:setting4
if "%settinghelptoggle%"=="true" (goto :setting4help)
find "typosWarning=false" %Settingsfile% > nul
if %ErrorLevel%==0 set setting4setonoff=enable&goto :setting4okey
if %ErrorLevel%==1 set setting4setonoff=Repair&goto :setting4onoff

:setting4onoff
find "typosWarning=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting4setonoff=disable

:setting4okey
cls
echo Do you want to %setting4setonoff% the enter key long press detection function? (Y=Yes N=No B=Back)
SET /P selected= :
echo %selected% has selected.
if "%selected%"=="y" (goto :setting4y)
if "%selected%"=="n" (goto :setting4n)
if "%selected%"=="back" (goto :settingcategory1intsetting4)
if "%selected%"=="b" (goto :settingcategory1intsetting4)
goto :setting4okey

:setting4y
find "typosWarning=false" %Settingsfile% > nul
echo Applying settings...

if %ErrorLevel%==1 goto :setting4ygo3test
if %ErrorLevel%==0 goto :setting4ygo1

:setting4ygo3test
find "typosWarning=true" %Settingsfile% > nul
if %ErrorLevel%==1 echo typosWarning=true >> %Settingsfile%& goto :setting4yokey
if %ErrorLevel%==0 goto :setting4ygo2

:setting4ygo2
powershell "(gc %Settingsfile%) -replace 'typosWarning=true','typosWarning=false' | sc %Settingsfile%"
goto :setting4yokey

:setting4ygo1
powershell "(gc %Settingsfile%) -replace 'typosWarning=false','typosWarning=true' | sc %Settingsfile%"
goto :setting4yokey

:setting4yokey
cls
Echo The change was made successfully.
Pause
set wantload=setting4
call :SAB_Manager
goto :settingcategory1intsetting4

:setting4n
cls
Echo Did not change settings.
Pause
goto :settingcategory1intsetting4

:setting5
if "%settinghelptoggle%"=="true" (goto :setting5help)
find "bootanimation=false" %Settingsfile% > nul
if %ErrorLevel%==0 set setting5setonoff=enable&goto :setting5okey
if %ErrorLevel%==1 set setting5setonoff=Repair&goto :setting5onoff

:setting5onoff
find "bootanimation=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting5setonoff=disbale

:setting5okey
cls
echo Do you want the boot animation to be %setting5setonoff%? (Y=Yes N=No B=Back)
SET /P selected= :
echo %selected% has selected.
if "%selected%"=="y" (goto :setting5y)
if "%selected%"=="n" (goto :setting5n)
if "%selected%"=="back" (goto :settingcategory2intsetting5_stg0)
if "%selected%"=="b" (goto :settingcategory2intsetting5_stg0)
goto :setting5okey

:setting5y
find "bootanimation=false" %Settingsfile% > nul
echo Applying settings...

if %ErrorLevel%==1 goto :setting5ygo3test
if %ErrorLevel%==0 goto :setting5ygo1

:setting5ygo3test
find "bootanimation=true" %Settingsfile% > nul
if %ErrorLevel%==1 echo bootanimation=true >> %Settingsfile%& goto :setting5yokey
if %ErrorLevel%==0 goto :setting5ygo2

:setting5ygo2
powershell "(gc %Settingsfile%) -replace 'bootanimation=true','bootanimation=false' | sc %Settingsfile%"
goto :setting5yokey

:setting5ygo1
powershell "(gc %Settingsfile%) -replace 'bootanimation=false','bootanimation=true' | sc %Settingsfile%"
goto :setting5yokey

:setting5yokey
cls
Echo The change was made successfully.
Pause
set wantload=setting5
call :SAB_Manager
goto :settingcategory2intsetting5_stg0

:setting5n
cls
Echo Did not change settings.
Pause
goto :settingcategory2intsetting5_stg0


:setting5_1
if "%settinghelptoggle%"=="true" (goto :setting5_1help)
find "s5_linuxboot=false" %Settingsfile% > nul
if %ErrorLevel%==0 set setting5_1setonoff=enable&goto :setting5_1okey
if %ErrorLevel%==1 set setting5_1setonoff=Repair&goto :setting5_1onoff

:setting5_1onoff
find "s5_linuxboot=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting5_1setonoff=disbale

:setting5_1okey
cls
echo Do you want the linux-ish boot animation to be %setting5_1setonoff%? (Y=Yes N=No B=Back)
SET /P selected= :
echo %selected% has selected.
if "%selected%"=="y" (goto :setting5_1y)
if "%selected%"=="n" (goto :setting5_1n)
if "%selected%"=="back" (goto :settingcategory2intsetting5_stg0)
if "%selected%"=="b" (goto :settingcategory2intsetting5_stg0)
goto :setting5_1okey

:setting5_1y
find "s5_linuxboot=false" %Settingsfile% > nul
echo Applying settings...

if %ErrorLevel%==1 goto :setting5_1ygo3test
if %ErrorLevel%==0 goto :setting5_1ygo1

:setting5_1ygo3test
find "s5_linuxboot=true" %Settingsfile% > nul
if %ErrorLevel%==1 echo s5_linuxboot=false >> %Settingsfile%& goto :setting5_1yokey
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
Echo The change was made successfully.
Pause
set wantload=setting5_1
call :SAB_Manager
goto :settingcategory2intsetting5_stg1

:setting5_1n
cls
Echo Did not change settings.
Pause
goto :settingcategory2intsetting5_stg1


:setting5_2
if "%settinghelptoggle%"=="true" (goto :setting5_2help)
find "s5_simpleboot=false" %Settingsfile% > nul
if %ErrorLevel%==0 set setting5_2setonoff=enable&goto :setting5_2okey
if %ErrorLevel%==1 set setting5_2setonoff=Repair&goto :setting5_2onoff

:setting5_2onoff
find "s5_simpleboot=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting5_2setonoff=disbale

:setting5_2okey
cls
echo Do you want the simple boot animation to be %setting5_2setonoff%? (Y=Yes N=No B=Back)
SET /P selected= :
echo %selected% has selected.
if "%selected%"=="y" (goto :setting5_2y)
if "%selected%"=="n" (goto :setting5_2n)
if "%selected%"=="back" (goto :settingcategory2intsetting5_stg1)
if "%selected%"=="b" (goto :settingcategory2intsetting5_stg1)
goto :setting5_2okey

:setting5_2y
find "s5_simpleboot=false" %Settingsfile% > nul
echo Applying settings...

if %ErrorLevel%==1 goto :setting5_2ygo3test
if %ErrorLevel%==0 goto :setting5_2ygo1

:setting5_2ygo3test
find "s5_simpleboot=true" %Settingsfile% > nul
if %ErrorLevel%==1 echo s5_simpleboot=false >> %Settingsfile%& goto :setting5_2yokey
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
Echo The change was made successfully.
Pause
set wantload=setting5_2
call :SAB_Manager
goto :settingcategory2intsetting5_stg2

:setting5_2n
cls
Echo Did not change settings.
Pause
goto :settingcategory2intsetting5_stg2



:setting5_3
if "%settinghelptoggle%"=="true" (goto :setting5_3help)
find "s5_rawboot=false" %Settingsfile% > nul
if %ErrorLevel%==0 set setting5_3setonoff=enable&goto :setting5_3okey
if %ErrorLevel%==1 set setting5_3setonoff=Repair&goto :setting5_3onoff

:setting5_3onoff
find "s5_rawboot=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting5_3setonoff=disbale

:setting5_3okey
cls
echo Do you want the raw boot animation to be %setting5_3setonoff%? (Y=Yes N=No B=Back)
SET /P selected= :
echo %selected% has selected.
if "%selected%"=="y" (goto :setting5_3y)
if "%selected%"=="n" (goto :setting5_3n)
if "%selected%"=="back" (goto :settingcategory2intsetting5_stg3)
if "%selected%"=="b" (goto :settingcategory2intsetting5_stg3)
goto :setting5_3okey

:setting5_3y
find "s5_rawboot=false" %Settingsfile% > nul
echo Applying settings...

if %ErrorLevel%==1 goto :setting5_3ygo3test
if %ErrorLevel%==0 goto :setting5_3ygo1

:setting5_3ygo3test
find "s5_rawboot=true" %Settingsfile% > nul
if %ErrorLevel%==1 echo s5_rawboot=false >> %Settingsfile%& goto :setting5_3yokey
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
Echo The change was made successfully.
Pause
set wantload=setting5_3
call :SAB_Manager
goto :settingcategory2intsetting5_stg3

:setting5_3n
cls
Echo Did not change settings.
Pause
goto :settingcategory2intsetting5_stg3


:setting6
if "%settinghelptoggle%"=="true" (goto :setting6help)
find "Underline=false" %Settingsfile% > nul
if %ErrorLevel%==0 set setting6setonoff=enable&goto :setting6okey
if %ErrorLevel%==1 set setting6setonoff=Repair&goto :setting6onoff

:setting6onoff
find "Underline=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting6setonoff=disbale

:setting6okey
cls
echo Do you want the Show Underline at the mainmenu to be %setting6setonoff%? (Y=Yes N=No B=Back)
SET /P selected= :
echo %selected% has selected.
if "%selected%"=="y" (goto :setting6y)
if "%selected%"=="n" (goto :setting6n)
if "%selected%"=="back" (goto :settingcategory2intsetting2)
if "%selected%"=="b" (goto :settingcategory2intsetting2)
goto :setting6okey

:setting6y
find "Underline=false" %Settingsfile% > nul
echo Applying settings...

if %ErrorLevel%==1 goto :setting6ygo3test
if %ErrorLevel%==0 goto :setting6ygo1

:setting6ygo3test
find "Underline=true" %Settingsfile% > nul
if %ErrorLevel%==1 echo Underline=true >> %Settingsfile%& goto :setting6yokey
if %ErrorLevel%==0 goto :setting6ygo2

:setting6ygo2
powershell "(gc %Settingsfile%) -replace 'Underline=true','Underline=false' | sc %Settingsfile%"
goto :setting6yokey

:setting6ygo1
powershell "(gc %Settingsfile%) -replace 'Underline=false','Underline=true' | sc %Settingsfile%"
goto :setting6yokey

:setting6yokey
cls
Echo The change was made successfully.
Pause
set wantload=setting6
call :SAB_Manager
goto :settingcategory2intsetting2

:setting6n
cls
Echo Did not change settings.
Pause
goto :settingcategory2intsetting2


:setting7
if "%settinghelptoggle%"=="true" (goto :setting7help)
find "MainmenuBg=false" %Settingsfile% > nul
if %ErrorLevel%==0 set setting7setonoff=enable&goto :setting7okey
if %ErrorLevel%==1 set setting7setonoff=Repair&goto :setting7onoff

:setting7onoff
find "MainmenuBg=true" %Settingsfile% > nul
if %ErrorLevel%==0 set setting7setonoff=disbale

:setting7okey
cls
echo Do you want the Show Background at the mainmenu to be %setting7setonoff%? (Y=Yes N=No B=Back)
SET /P selected= :
echo %selected% has selected.
if "%selected%"=="y" (goto :setting7y)
if "%selected%"=="n" (goto :setting7n)
if "%selected%"=="back" (goto :settingcategory2intsetting3)
if "%selected%"=="b" (goto :settingcategory2intsetting3)
goto :setting7okey

:setting7y
find "MainmenuBg=false" %Settingsfile% > nul
echo Applying settings...

if %ErrorLevel%==1 goto :setting7ygo3test
if %ErrorLevel%==0 goto :setting7ygo1

:setting7ygo3test
find "MainmenuBg=true" %Settingsfile% > nul
if %ErrorLevel%==1 echo MainmenuBg=true >> %Settingsfile%& goto :setting7yokey
if %ErrorLevel%==0 goto :setting7ygo2

:setting7ygo2
powershell "(gc %Settingsfile%) -replace 'MainmenuBg=true','MainmenuBg=false' | sc %Settingsfile%"
goto :setting7yokey

:setting7ygo1
powershell "(gc %Settingsfile%) -replace 'MainmenuBg=false','MainmenuBg=true' | sc %Settingsfile%"
goto :setting7yokey

:setting7yokey
cls
Echo The change was made successfully.
Pause
set wantload=setting7
call :SAB_Manager
goto :settingcategory2intsetting3

:setting7n
cls
Echo Did not change settings.
Pause
goto :settingcategory2intsetting3


:wmode
if "%settinghelptoggle%"=="true" (goto :wmodehelp)
cd /d %batchmainpath%
:wmodetest
find "wmode=false" %Settingsfile% > nul
if %ErrorLevel%==0 set wmodesetonoff=white
if %ErrorLevel%==1 set wmodesetonoff=Repair the theme settings and restore the normal& goto :wmodeonoff

:wmodeonoff
find "wmode=true" %Settingsfile% > nul
if %ErrorLevel%==0 set wmodesetonoff=dark

cls
echo Do you want to change to %wmodesetonoff% theme? (Y=Yes N=No B=Back)
SET /P selected= :
rem theme branching
if "%selected%"=="y" (goto :wmodey)
if "%selected%"=="yes" (goto :wmodey)
if "%selected%"=="egg" (goto :secret)
if "%selected%"=="n" (goto :no01)
if "%selected%"=="no" (goto :no01)
if "%selected%"=="back" (goto :settingcategory2intsetting4)
if "%selected%"=="b" (goto :settingcategory2intsetting4)
if "%selected%"=="def" (goto :defultwok)
if "%selected%"=="defult" (goto :defultwok)
goto :wmode

:wmodey
find "wmode=false" %Settingsfile% > nul
echo Applying theme...
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
if %ErrorLevel%==1 goto :wmodeonoffdetect
:wmodeonoffdetect
find "wmode=true" %Settingsfile% > nul
if %ErrorLevel%==0 color f0
cls
echo Successfully Changed to %wmodesetonoff% theme.
Pause
set wantload=wmode
call :SAB_Manager
if "%wmodetoggle%"=="false" (set clr=[7m&set clr2=[0m)
if "%wmodetoggle%"=="true" (set clr=[100m[97m&set clr2=[0m[107m[30m)
if "%linuxboot%"=="true" (
    if "%wmodetoggle%"=="false" (set linuxishclr2=[0m)
    if "%wmodetoggle%"=="true" (set linuxishclr2=[107m[30m) else (set linuxishclr2=[0m)
)
goto :settingcategory2intsetting4

:no01
cls
echo No changes were made to the %wmodesetonoff% theme.
pause
goto :settingcategory2intsetting4

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
echo This setting is a little confusing, but simply put, it comes up when you press and hold enter without typing anything on the screen that appears when you start the batch,
echo This function allows you to turn off/on warning messages.
echo It is easier to understand this if you actually experience it, but, well, you have to press and hold enter for about 50~250 times,
echo It would be like a warning message being displayed. But sometimes people find this annoying, so we have added a setting that allows you to turn this feature off.
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
 
:alldefhelp
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
if "%wmodetoggle%"=="true" (set clr=[100m[97m&set clrgra=[0m[107m&set clr2=[90m[107m[30m)

:batver_main
rem Main Bat Version Menu
title Cursor Changer ^| Version Info
if "%batverexit%"=="true" (set batvercurrent=& call :batver_exit & goto :mainmenu)
if not defined batverboot (set MenuRedrew=true& set /p nothing=%clrgra%<nul& call :Mainmenudrew & echo %clr2% & set batverboot=true)
rem I'm doing this because when I use ANSI ESC sequences in Virtual Studio Code, the parentheses are colored incorrectly and I don't like that
call :batver_Core_Drew
if not defined dummuy (set ccmmul=[4m)
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
if not defined dummy (set /p nothing=[25;0H%clrgra%Developed by tamago_1908%clr2%<nul)
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
cd %~dp0
cls
title Cursor Changer ^| Updater
echo Starting Update Process...
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
if "%wmodetoggle%"=="true" (set clr=[100m[97m&set clrgra=[0m[107m&set clr2=[90m[107m[30m)
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
set Powersheller=RefreshCursor& call :Powersheller
set a=
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
set Powersheller=RefreshCursor& call :Powersheller
set a=
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
:AllDefult
cd /d %batchmainpath%
if "%settinghelptoggle%"=="true" (goto :alldefhelp)
if exist %Settingsfile% goto :AllDefulttest
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


rem alldef (i mean its uninstall menu)
:AllDefulttest
cd /d %batchmainpath% 
find "nodogcheckfor1234567890qwertyuiop" %Settingsfile%
cls
if %ErrorLevel%==0 goto :AllDefult1
if %ErrorLevel%==1 goto :Dogcheck
rem Uninstall menu
:AllDefult1
title Cursor Changer ^| Uninstall Menu (experimental)
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
echo 4 Display the file path of the Setting
echo.
echo Nothing is currently selected.
choice /c 1234wsb /n /m ""
if %ErrorLevel%==1 goto :alldefselect1
if %ErrorLevel%==2 goto :alldefselect2
if %ErrorLevel%==3 goto :alldefselect3
if %ErrorLevel%==4 goto :alldefselect4
if %ErrorLevel%==5 goto :alldefselect1
if %ErrorLevel%==6 goto :alldefselect1
if %ErrorLevel%==7 goto :settingcategory1intsetting5

rem Uninstall menu branching
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
echo 4 Display the file path of the Setting
echo.
echo 1 is currently selected. press y or e key to confirm.
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


rem Uninstall menu branching
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
echo 4 Display the file path of the Setting
echo.
echo 2 is currently selected. press y or e key to confirm.
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

rem Uninstall menu branching
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
echo 4 Display the file path of the Setting
echo.
echo 3 is currently selected. press y or e key to confirm.
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

rem Uninstall menu branching
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
echo %clr%4 Display the file path of the Setting%clr2%
echo.
echo 4 is currently selected. press y or e key to confirm.
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


rem Warning message when initializing settings
:alldefsettingonly
cls
:alldefsettingonlyokey
echo This menu will initialize your settings. Thus, everything you have ever set will be returned to its default settings. (Return to the settings you had when you first started Cursor Changer.) Are you sure? (Y=Yes / N=No)
choice /c yn /n /m ""
if %ErrorLevel%==1 goto :alldefsettingonlyokey2
if %ErrorLevel%==2 goto :alldefsettingno
:alldefsettingonlyokey2
echo Are you sure you want to delete it?(Y=Yes / N=No)
choice /c yn /n /m ""
if %ErrorLevel%==1 goto :alldefsettingyes
if %ErrorLevel%==2 goto :alldefsettingno
goto :alldefsettingonly

:alldefsettingyes
echo Initializes the Setting file. All previous settings will be deleted.
echo If you wish to cancel, exit the batch process at this point.
pause
cls
call :Wipealldeta
title Cursor Changer ^| ...
echo Initialization is complete. In order to apply the changes, Cursor Changer will Restart. Press Any Key to Continue...
pause >nul
call :rebootbatch

:alldefsettingno
cls
echo Settings were not initialized.
pause
:alldefsettingno2
cls
echo Do you want to keep going to the uninstall menu or go back to the home?
echo Which do you want to do? (return to settings=1 / uninstall menu=2)
choice /c 12 /n /m ""
if %ErrorLevel%==1 goto :settingcategory1intsetting5
if %ErrorLevel%==2 goto :alldefselect3
goto :alldefsettingno2

:alldefshowsettingpass
cls
echo Displays the path where the Setting file is located.
start explorer %batchmainpath%
timeout /t 3 /nobreak >nul
echo Depending on your environment, you will most likely find %Settingsfile% at the bottom or at the top.
pause
cls
:alldefshowsettingpass2
echo Do you want to keep going to the uninstall menu or go back to the home?
echo Which do you want to do? (return to settings=1 / uninstall menu=2)
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
title Cursor Changer ^| Uninstall of Cursor Changer 
echo This uninstall menu will restore all registry and first-time record files modified by this batch file and remove Cursor Changer itself.
pause
cls
echo In other words, using this feature will cause the mouse cursor to be initial white, and this batch file to be deleted completely, and Cursor Changer will have to be installed again in order to use it again!
echo (it does not initialize the OS)
pause
cls
echo In addition, the creator, tamago_1908, assumes no responsibility for any damage or disadvantage resulting from the execution of the uninstallation!
echo.
pause
:AllDefultOkey
SET /P selected=Are you sure?(Y=Yes / N=No / B=Back)
if "%selected%"=="y" (goto :yes2)
if "%selected%"=="yes" (goto :yes2)
if "%selected%"=="n" (goto :no2)
if "%selected%"=="no" (goto :no2)
if "%selected%"=="back" (color 07&goto :Mainmenuboot)
if "%selected%"=="b" (color 07&goto :Mainmenuboot)
if "%selected%"=="debugyesnow" (goto :yes2go)
echo ?
echo.
pause
echo Enter the valid choice.
echo.
pause
cls
goto :AllDefultOkey

:no2
cls
color 0B
echo [40m[3m[96mLet's turn back the clock...
timeout /t 3 /nobreak >nul
find "wmode=false" %Settingsfile% > nul
if %ErrorLevel%==0 color 07
if %ErrorLevel%==1 goto :wmodeonoffdetect
:wmodeonoffdetectalldefno2
find "wmode=true" %Settingsfile% > nul
if %ErrorLevel%==0 color f0
goto :Mainmenuboot

:yes2
rem Final confirmation of uninstallation
set selected=
SET /P selected=Really good?(Y=Yes / N=No / B=Back)
if "%selected%"=="y" (set alldefclr=[31m&set alldefclr2=[97m&goto :yes2final)
if "%selected%"=="yes" (setalldefclr=[31m&set alldefclr2=[97m&goto :yes2final)
if "%selected%"=="n" (goto :no2)
if "%selected%"=="no" (goto :no2)
if "%selected%"=="back" (color 07&goto :Mainmenuboot)
if "%selected%"=="b" (color 07&goto :Mainmenuboot)
if "%selected%"=="debugyesnow" (goto :yes2go)
echo.
echo ?
pause
echo.
echo Enter valid choice.
pause
cls
goto :yes2


:yes2final
rem Final confirmation of uninstallation Season 2
set selected=
echo.
echo 
SET /P selected=%alldefclr%You won't regret it, will you? (if you continue, You can't restore it!)%alldefclr2%(Y=Yes / N=No / B=Back)
if "%selected%"=="y" (goto :yes2go)
if "%selected%"=="yes" (goto :yes2go)
if "%selected%"=="n" (goto :no2)
if "%selected%"=="no" (goto :no2)
if "%selected%"=="back" (color 07&goto :Mainmenuboot)
if "%selected%"=="b" (color 07&goto :Mainmenuboot)
if "%selected%"=="debugyesnow" (goto :yes2go)
echo.
echo ?
pause
echo.
echo Enter valid choice.
pause
cls
goto :yes2final

:yes2go
rem I can't back down. They're coming...
cls
color 9f
echo Execute. If you want to return, stop the batch file.
pause

rem Uninstall menu exception handling FIrstCursor in the absence of FIrstCursor. But it is redundant and I want to improve it.
rem I want to add more exception handling. For example, if the message is never possible without modifying the contents, it should be able to do a goto, branch on a variable, and change the message.
cd /d %batchmainpath%
if not exist %FirstSTFsfile% if exist %Settingsfile% set erroralldefwhatdelete=%FirstSTFsfile%& call :BSOD_Errors 3
if exist %FirstSTFsfile% if not exist %Settingsfile% set erroralldefwhatdelete=%Settingsfile%& call :BSOD_Errors 3
if not exist %FirstSTFsfile% if not exist %Settingsfile% set "erroralldefwhatdelete=%FirstSTFsfile% and %Settingsfile%, both" & call :BSOD_Errors 3
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
title Cursor Changer ^| CRASHED!
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
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"Well, actually it was you who deleted %erroralldefwhatdelete% Right?\", '', [System.Windows.Forms.MessageBoxButtons]::'Yesno', 'Question');exit $result;"
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
set /a bootegg=%random%*17/32767
set /a bootegg2=%random%*17/32767
if "%bootegg%"=="%bootegg2%" (goto :bsod_errors_RANDOMFACEHAHA2)
set /a bootegg=%random%*129/32767
set /a bootegg2=%random%*129/32767
if "%bootegg%"=="%bootegg2%" (goto :bsod_errors_RANDOMFACEHAHA3)
rem :)
if not defined dummy (echo [16a▐█& echo [09a█▌[4a█▌& echo [15a█▌& echo [09a█▌[4a█▌& echo [16a▐█)
exit /b
:bsod_errors_RANDOMFACEHAHA2
rem :(
if not defined dummy (echo [13a▐█& echo [09a█▌[4a█▌& echo [15a█▌& echo [09a█▌[4a█▌& echo [13a▐█)
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
timeout /t 1 /nobreak >nul
mode con: cols=97 lines=21
rundll32 user32.dll,MessageBeep || echo 
color 07
cls
title Cursor Changer ^| CRASHED!
echo O=========================================== Crashed ===========================================O
echo.
echo.
echo          Oops! The Cursor Changer has Crashed!
echo.
echo          This screen is displayed when Cursor Changer crashes for some reason.
echo          The following information may be helpful in obtaining support.
echo          (WARNING : Cursor Changer does not support your windows version!)
echo.
echo          Batch Version : %batver% (%batbuild%)
echo          Windows Build : (Unsupported version)
echo          Error ID      : %1
echo          Error Level   : %2
echo.
echo          For more information about this screen and possible fixes, visit this link:
echo.
echo          https://github.com/tamago1908/Cursor-Changer.bat/wiki/BSOD-Crash-(Error-Screen)
echo.
echo          Hit Any key to Exit...
echo.
pause >nul
call :exit 1


:BSOD_Errors_NOERRORS
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
:alldefnow
cls
color 07
if %alldefselect%==1 goto :alldefnowchangeit
if %alldefselect%==2 goto :alldefnowsettingdel

rem Branching according to uninstall menu selection
:alldefnowsettingdel
del %FirstSTFsfile%
del %Settingsfile%
goto :alldefnowfinish

:alldefnowchangeit
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
:alldefnowfinish
rem Message after uninstallation is complete
cls
title Cursor Changer ^| Good bye!
echo Everything has been returned to default.
pause
echo I guess this is Goodbye... well Goodbye.
pause
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
set /p nothing=%clred%^/^/%clr2%[Type something to back to menu...]                              %clrgra%%batver%%clr2% <nul&pause >nul
set clrcyan=
set clrgra=
set clred=
set clrgrn=
set clryel=
set clrmag=
if "%batargmentonly%"=="true" (set batargmentonly= &cls&exit /b)
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
if "%1"=="1" (start "Cursor Changer" ^"%~dp0%~n0%~x0^" recovery& call :exit 0) else (start "Cursor Changer" ^"%~dp0%~n0%~x0^"& call :exit 0)

:exit
if "%1"=="1" (echo Shutting Down...)
if "%1"=="2" (goto :batshutdown)
powershell -command "$pid1 = Get-WmiObject win32_process -filter processid=$pid | ForEach-Object{$_.parentprocessid;}";$pid2 = "Get-WmiObject win32_process -filter processid=$pid1 | ForEach-Object{$_.parentprocessid;}";$pid3 = "Get-WmiObject win32_process -filter processid=$pid2 | ForEach-Object{$_.parentprocessid;};exit $pid3"
>nul 2>&1 taskkill /pid %errorlevel% >nul
exit
:reboot


rem Are you serious?
rem Anyways, congratulation. you readed all of codes.
rem Don't you have anything better to do?