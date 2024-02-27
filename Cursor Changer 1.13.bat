@echo off
setlocal
rem Specify size
mode con: cols=75 lines=25
title Cursor Changer

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


rem Make sure to fill in the build number and version! Also, don't forget to put it in the archive!
rem environment setting, It is not recommended to change.
rem VER v1.13
set batver=1.13
set batbuild=build 64
set batverdev=stable
set Mainmenueaster=false
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
if exist CursorChangerSettings.txt (
find "wmode=true" CursorChangerSettings.txt > nul 
if {!errorlevel!}=={0} (color f0&set wmodetoggle=true) else (set wmodetoggle=false)
) else (set wmodetoggle=false)

>nul 2>&1 find "bootanimation=true" CursorChangerSettings.txt
if "!errorlevel!"=="0" (
    >nul 2>&1 find "s5_rawboot=true" CursorChangerSettings.txt
if not "!errorlevel!"=="0" (
>nul 2>&1 find "s5_linuxboot=true" CursorChangerSettings.txt
if "!errorlevel!"=="0" (
    set linuxboot=true
        echo [%time: =%] Cursor Changer %batver% Bootloader - by tamago_1908&echo.&echo O================ Boot Start Here ================O&echo.
>nul 2>&1 find "wmode=true" CursorChangerSettings.txt
if "!errorlevel!"=="0" (set linuxishclr=[92m&set linuxishclr2=[107m[30m) 
>nul 2>&1 find "wmode=false" CursorChangerSettings.txt
if "!errorlevel!"=="0" (set linuxishclr=[92m&set linuxishclr2=[0m)
)
)
)

if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Linux-ish Boot Loader is just now started.)
>nul 2>&1 find "bootanimation=true" CursorChangerSettings.txt
if "!errorlevel!"=="0" (
>nul 2>&1 find "s5_simpleboot=true" CursorChangerSettings.txt
if "!errorlevel!"=="0" (
    if not "%linuxboot%"=="true" (
    set simpleboot=true
    )
)
)
>nul 2>&1 find "bootanimation=true" CursorChangerSettings.txt
if "!errorlevel!"=="0" (
>nul 2>&1 find "s5_rawboot=true" CursorChangerSettings.txt
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
if not exist CursorChangerSettings.txt set firststartbat=yes
if not "%linuxboot%"=="true" (
if not "%firststartbat%"=="yes" (
if {%bootbatnow%}=={yes} (title Cursor Changer Preparing...&echo Please wait a while...)
) else (
    if not defined batbootpowershell (
        if not exist FirstCursor.txt (
        echo Preparing Setup...
        ) else (title Cursor Changer Preparing...&echo Please wait a while...)
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
rem Exit without argument
if "%~1"=="" set argmentloaded=true& goto Argments_Loaderend
title Cursor Changer argment checking...
rem Stores arguments in an array
setlocal enabledelayedexpansion
set i=0
for %%a in (%*) do (
  set /a i+=1
  set arg[!i!]=%%a
)

rem Get the number of array elements
set n=%i%
rem Process array elements in order
for /l %%i in (1,1,%n%) do (
  rem Initialize variables for exception handling. Used later.
  set argmentserror=
  rem Get current element
  set current=!arg[%%i]!
  rem Process if current element is not empty
  if not "!current!"=="" (
    rem Empty elements that match the current element (deduplication)
    for /l %%j in (%%i,1,%n%) do (
      if "!arg[%%j]!"=="!current!" set arg[%%j]=
    )
    rem Process according to the current element.
    if "!current!"=="bypsdisexit" (echo disableexitbutton is bypassed.&set disableexit=false&set argmentserror=false)
    if "!current!"=="enablesimpleboot" (echo simpleboot is enabled.&set simpleboot=true&set argmentserror=false)
    if "!current!"=="devmode" (call :developermenu&set argmentserror=false)
    if "!current!"=="recovery" (call :batbootcheckwinver dynamic&echo recovery mode is enabled.&set argmentserror=false&goto Cursor_Changer_REmenu)
    if "!current!"=="help" (call :batbootcheckwinver dynamic&call :batstarthelp&set argmentserror=false)
    if "!current!"=="bypsvck" (echo winver check is bypassed.&set bypasswinvercheck=true&set argmentserror=false)
    if "!current!"=="bypsadm" (echo getadmin is bypassed.&set adminbypass=true&set adminbypass=false&set argmentserror=false)
    if "!current!"=="bypsloadsg" (echo setting load is bypassed.&set settingbypass=true&set argmentserror=false)
   rem exception handling
   if "!argmentserror!"=="" (title Cursor Changer argment error&echo unvalid argment or something went worng ^(!current!^) error. please set valid argment. ^(or use ^"help^" ^)
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
rem checking windows version
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
    set "windowsverfilter=too old! like windows xp?"
    goto batbootcheckwinverbad
)

:batbootcheckwinverbad
if "%bypasswinvercheck%"=="true" (goto :batbootcheckwinverbadwarning)
rem winver check failed message
echo Cursor Changer is does not support Your version of windows^^! (%windowsverfilter%)
pause
cls
echo Cursor Changer is compatible with windows 10 version 1511 or later.
pause
cls
echo Older versions (like windows 7, windows 8, 8.1, etc.) are not supported.
pause
cls
echo Please update your windows, or use Cursor Changer version 1.12 earlier (like 1.11a).
pause
exit


:batbootcheckwinverbadwarning
cls
rem Warning message (when use bypsvck in violation of winvercheck)
set selected=
cls
echo.
echo                                  WARNING
echo.
echo Your version of Windows (%windowsverfilter%) does not seem to support cursor changer^^!
echo You seem to be using bypsvck with arguments, but if you continue, you are very likely to encounter fatal problems.
echo If you continue, tamago_1908, the developer of the cursor swap, will not be held responsible for any subsequent problems caused.
echo.
echo Do you still wish to continue?
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
echo Powershell check failed!
pause
cls
echo It appears that powershell is not installed on your PC.
pause
cls
echo Powershell is required for Cursor Changer to work.
echo Since Powershell comes standard with Windows 10 1511 and later, it is likely intentionally uninstalled or unavailable due to an error.
pause
cls
echo Please download Powershell 5.1 or later separately or try reinstalling it.
pause
cls
echo If the problem persists (the message continues to appear), please report it in an issue on Github.
pause
cls
exit
:batbootcheckpowershellsafe
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Powershell Check is done.)


rem main code, (like set variable)
set version=
set bootbatnow=yes
set exitbuttondisabled=false
rem check admin permission
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
rem If the exit button is set to false while holding administrator privileges, it may be detected as a virus in rare cases. Therefore, the process is bypassed when the user has administrative privileges and when the variable "disableexit" is false.
rem By the way, the reason why it is named disableexit is because this feature was a feature to disable the exit button in the beta version. After leaving beta, it was changed to disable maximization.
if exist CursorChangerSettings.txt find "CheckUpdate=true" CursorChangerSettings.txt > nul
if {%errorlevel%}=={0} (set checkupdatetoggle=true&set batverforpowershell=%batver:É¿=.b%) else (set checkupdatetoggle=false)
if {%disableexit%}=={false} (goto batbootdisabledexitbutton)

:batbootpowershell
if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Batbootpowershell is started...)
set exitbuttondisabled=false

rem code from startid~powershell must not be displaced code before or after that is ok If it's before or after that, it's ok
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

# Define the function to check the update of Cursor Changer with github api
function Updater {
$repo = "https://api.github.com/repos/tamago1908/Cursor-Changer.bat/releases/latest"
try{$file = (Invoke-RestMethod -Uri $repo -Method Get -Headers @{'Accept'='application/vnd.github.v3+json'}).assets | Where-Object { $_.name -like "Cursor.Changer.*" }
}catch{if($_.Exception.Response.StatusCode.Value__ -eq 403){Write-Host "[ERROR] You have exceeded the GitHub API rate limit. This may be because you have checked for updates too frequently. Please wait for an hour and try again." -foregroundcolor red}else{Write-Host "[ERROR] Oops, something went wrong. You can try again later. or check the internet connection. `nError log : $_" -foregroundcolor red};break}
$fileVersion = $file.name -replace "Cursor\.Changer\.|\.bat", ""
$batVersion = "$env:batverforpowershell", ""
$batName = Get-Item "Cursor.Changer.*.bat"

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
Write-Host "Checking update..."
#check the update of Cursor Changer with github api, and Update it.
$repo = "https://api.github.com/repos/tamago1908/Cursor-Changer.bat/releases/latest"
try{$file = (Invoke-RestMethod -Uri $repo -Method Get -Headers @{'Accept'='application/vnd.github.v3+json'}).assets | Where-Object { $_.name -like "Cursor.Changer.*" }
}catch{if($_.Exception.Response.StatusCode.Value__ -eq 403){Write-Host "[ERROR] You have exceeded the GitHub API rate limit. This may be because you have checked for updates too frequently. Please wait for an hour and try again." -foregroundcolor red}else{Write-Host "[ERROR] Oops, something went worng. You can try again later. or check the internet connection. `nError log : $_" -foregroundcolor red};break}
$fileVersion = $file.name -replace "Cursor\.Changer\.|\.bat", ""
$batVersion = (Get-Item "Cursor.Changer.*.bat").name -replace "Cursor\.Changer\.|\.bat", ""
$batName = Get-Item "Cursor.Changer.*.bat"

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
            Write-Host "An update is available. The current version is `"$($batVersion)`". The updated version is `"$($fileVersion)`"." `n
            Start-Sleep 1
            powershell {$h=Get-Host;$w=$h.UI.RawUI;$s=$w.BufferSize;$s.height=62;$w.BufferSize=$s;}
try{if($env:wmodetoggle -eq "false"){Write-Host "Change Log :" -foregroundcolor white}elseif($env:wmodetoggle -eq "true"){Write-Host "Change Log :" -foregroundcolor black }else{Write-Host "Change Log :" -foregroundcolor white};$e=[char]27;$clr="$e[7m";$clred="$e[91m";$clrgrn="$e[92m";$clryel="$e[93m";$clrmag="$e[95m";$clrgra="$e[90m";$clrcyan="$e[96m";$c="$e[0m";if($env:wmodetoggle -eq "true"){$clr="$e[100m$e[97m";$c="$e[0m$e[107m$e[30m"};foreach($s in (irm -Uri "https://api.github.com/repos/tamago1908/Cursor-Changer.bat/releases/latest").body -split '\r\n'){if($s -match "####"){write-host "$clrcyan$e[1m$($s -replace '(^\#+)|(\#+$)', '')$c" `n -NoNewline}elseif($s -match ">"){write-host "$clred$($s -replace '\>', '')$c" `n -NoNewline}elseif($s -match "###"){write-host "$clryel$e[1m$($s -replace '(^\#+)|(\#+$)', '')$c" `n -NoNewline}elseif($s -match "___"){write-host "$clrgra--------------------------------------------------$c" `n -NoNewline}else{$s=$s -replace "\*{3}(.+?)\*{3}", "$e[3m;1m`$1$c";$s=$s -replace "\*{2}(.+?)\*{2}", "$e[1m`$1$c";$s=$s -replace "^\s*-(\s+)(.*)", "$clred-$c`$1`$2";$s=$s -replace "\*+", "";write-host "$s" `n -NoNewline}};write-host "";rv e,clr,clred,clrgrn,clryel,clrmag,clrgra,clrcyan,c,s}catch{if($_.Exception.Response.StatusCode.Value__ -eq 403){Write-Host "[ERROR] You have exceeded the GitHub API rate limit. This may be because you have checked for updates too frequently. Please wait for an hour and try again." -foregroundcolor red}else{Write-Host "[ERROR] Oops, something went worng. You can try again later. or check the internet connection. `nError log : $_" -foregroundcolor red};break}

            Start-Sleep 2
             if ($isFileBeta -eq "true") {
            $e=[char]27
            $clrgra="$e[90m"
            $c="$e[0m"
            Write-Host "$clrgra[TIP] this update is beta version, so this version is incomplete and may have bugs and problems.$c"
            rv clrgra,c,e
            }
                $answer = Read-Host "Do you want to update? (y or n)"
                if ($answer -eq "y") {
                $downloadFolder = Join-Path $env:USERPROFILE "Downloads"
                $downloadFile = Join-Path $downloadFolder $file.name
                Invoke-WebRequest -Uri $file.url -OutFile $downloadFile -Headers @{'Accept'='application/octet-stream'}
                $newBatName = "Cursor.Changer.$fileVersion.bat"
                Move-Item $downloadFile (Join-Path (Split-Path $batName) ("$newBatName")) -Force
                Remove-Item "Cursor.Changer.$batVersion.bat" -Force

                    Write-Host "The update is complete."
                    Start-Sleep 2

                    break
                }
                else {
                    Write-Host "The update was canceled."
                    Start-Sleep 2
                    break
                }
            }
            elseif ($fileElement -lt $batElement) {
                Write-Host "[ERROR] You have a newer version (`"$($batVersion)`") than the update file (`"$($fileVersion)`")! Meybe you change the Version..." -ForegroundColor Red 
                Start-Sleep 2
                break
            }
        }
        elseif ($isFileBeta -and -not $isBatBeta) {
            cls
            # The file version is beta and the bat version is not, so the file version is newer
            Write-Host "An update is available. The current version is `"$($batVersion)`". The updated version is `"$($fileVersion)`"." `n
            Start-Sleep 1
            powershell {$h=Get-Host;$w=$h.UI.RawUI;$s=$w.BufferSize;$s.height=62;$w.BufferSize=$s;}
try{if($env:wmodetoggle -eq "false"){Write-Host "Change Log :" -foregroundcolor white}elseif($env:wmodetoggle -eq "true"){Write-Host "Change Log :" -foregroundcolor black }else{Write-Host "Change Log :" -foregroundcolor white};$e=[char]27;$clr="$e[7m";$clred="$e[91m";$clrgrn="$e[92m";$clryel="$e[93m";$clrmag="$e[95m";$clrgra="$e[90m";$clrcyan="$e[96m";$c="$e[0m";if($env:wmodetoggle -eq "true"){$clr="$e[100m$e[97m";$c="$e[0m$e[107m$e[30m"};foreach($s in (irm -Uri "https://api.github.com/repos/tamago1908/Cursor-Changer.bat/releases/latest").body -split '\r\n'){if($s -match "####"){write-host "$clrcyan$e[1m$($s -replace '(^\#+)|(\#+$)', '')$c" `n -NoNewline}elseif($s -match ">"){write-host "$clred$($s -replace '\>', '')$c" `n -NoNewline}elseif($s -match "###"){write-host "$clryel$e[1m$($s -replace '(^\#+)|(\#+$)', '')$c" `n -NoNewline}elseif($s -match "___"){write-host "$clrgra--------------------------------------------------$c" `n -NoNewline}else{$s=$s -replace "\*{3}(.+?)\*{3}", "$e[3m;1m`$1$c";$s=$s -replace "\*{2}(.+?)\*{2}", "$e[1m`$1$c";$s=$s -replace "^\s*-(\s+)(.*)", "$clred-$c`$1`$2";$s=$s -replace "\*+", "";write-host "$s" `n -NoNewline}};write-host "";rv e,clr,clred,clrgrn,clryel,clrmag,clrgra,clrcyan,c,s}catch{if($_.Exception.Response.StatusCode.Value__ -eq 403){Write-Host "[ERROR] You have exceeded the GitHub API rate limit. This may be because you have checked for updates too frequently. Please wait for an hour and try again." -foregroundcolor red}else{Write-Host "[ERROR] Oops, something went worng. You can try again later. or check the internet connection. `nError log : $_" -foregroundcolor red};break}

            Start-Sleep 2
             if ($isFileBeta -eq "true") {
            $e=[char]27
            $clrgra="$e[90m"
            $c="$e[0m"
            Write-Host "$clrgra[TIP] this update is beta version, so this version is incomplete and may have bugs and problems.$c"
            rv clrgra,c,e
            }

            $answer = Read-Host "Do you want to update? (y or n)"
            if ($answer -eq "y") {
                $downloadFolder = Join-Path $env:USERPROFILE "Downloads"
                $downloadFile = Join-Path $downloadFolder $file.name
                Invoke-WebRequest -Uri $file.url -OutFile $downloadFile -Headers @{'Accept'='application/octet-stream'}
                $newBatName = "Cursor.Changer.$fileVersion.bat"
                Move-Item $downloadFile (Join-Path (Split-Path $batName) ("$newBatName")) -Force
                Remove-Item "Cursor.Changer.$batVersion.bat" -Force

                Write-Host "The update is complete."
                Start-Sleep 2

                break
            }
            else {
                Write-Host "The update was canceled."
                Start-Sleep 2
                break
            }
        }
        elseif (-not $isFileBeta -and $isBatBeta) {
            # The file version is not beta and the bat version is beta, so the bat version is newer
            Write-Host "[ERROR] You have a newer version (`"$($batVersion)`") than the update file (`"$($fileVersion)`"), Maybe you change the Version..." -ForegroundColor Red 
            Start-Sleep 2
            break
        }
    }
}

    if ($i -eq [Math]::Max($fileverArray.Length, $batverArray.Length)) {
        Write-Host "You already have latest Version (`"$($batVersion)`"), so you don't need to update."
        Start-Sleep 2
    }
}

function OOBEMusic {
$webClient = New-Object System.Net.WebClient
Write-Host "Downloading Music... Wait a while, or EAT BANANA"
try{$data = $webClient.DownloadData("https://raw.githubusercontent.com/tamago1908/Cursor-Changer.bat/main/resource/Windows_XP_OOBE_for_Cursor_Changer.wav")
}catch{if($_.Exception.Response.StatusCode.Value__ -eq 403){Write-Host "[ERROR] You have exceeded the GitHub API rate limit. This may be because you are doing playing music too frequently. Please wait for an hour and try again." -foregroundcolor red}else{Write-Host "[ERROR] Oops, something went wrong. You can try again later. or check the internet connection. `nError log : $_" -foregroundcolor red};write-host "enter something to exit...";$host.UI.RawUI.ReadKey();exit}
Write-Host "Download Complete!   ...Probably"
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
Write-Host "Playing music... dont care this pwsh window...`nBtw, You can stop the music with close this pwsh window."
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

rem MAIN PROCESS (FR)
:batbootdisabledexitbutton
set startline=&set endline=&set exitbuttondisabled=
if {%bootbatnow%}=={no} (set batbootpowershell=&exit /b)
if "%batbootpowershell%"=="OOBEMusic" (set batbootpowershell=&exit /b)
set batbootpowershell=

rem get updater variable
if "%checkupdatetoggle%"=="true" (goto batbootpowershell_get_updater_variable) else (goto batbootpowershell_get_updater_variable_end)

:batbootpowershell_get_updater_variable
rem conversion powershell return variable to batch variable
setlocal enabledelayedexpansion
if "%updateinfo%"=="null" (goto batbootpowershell_get_updater_variable_end)
for /f "tokens=1-4 delims=," %%a in ("%updateinfo%") do (
  for /f "tokens=1-2 delims==" %%x in ("%%a") do set "%%x=%%y"&for /f "tokens=1-2 delims==" %%x in ("%%b") do set "%%x=%%y"&for /f "tokens=1-2 delims==" %%x in ("%%c") do set "%%x=%%y"&for /f "tokens=1-2 delims==" %%x in ("%%d") do set "%%x=%%y"
)
setlocal disabledelayedexpansion
set updatemyversion=%batver:É¿=.b% & rem this is so idiot. guess powershell should have used this method to handle the bat version, but it is what it is. However, it is something that needs to be fixed, so I may fix it soon, maybe.
set batverforpowershell=
:batbootpowershell_get_updater_variable_end

set updateinfo=
set checkupdatetoggle=

:batbootpowershell_get_updater_variable_end
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Batbootpowershell is Ended...)
cd /d %batchmainpath%


rem ############################################################################################################################

:CursorChangerOOBE
if not "%bootbatnow%"=="true" (
if "%linuxboot%"=="true" (
echo [%linuxishclr%info%linuxishclr2%] Bootloader ended.&echo.
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Mobas_Loader Calling...&echo.)
)
)
rem Detects whether this is the first start
if exist CursorChangerSettings.txt set firststartbat=no&set bootbatnow=yes&goto :batstart
if not exist CursorChangerSettings.txt (
if exist FirstCursor.txt goto settingloads
)


:CursorChangerOOBE_Animation
setlocal enabledelayedexpansion
rem Play CursorChangerOOBE_Animations that appear slowly
if not defined invisiblecursor (echo [?25l&set invisiblecursor=true)
cls
set /a clr+=10
set clresc=%clr%;%clr%;%clr%
set "clr1=[38;2;%clresc%m                      Welcome to Cursor Changer %batver% [0m"
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
set "clr2=[38;2;%clresc%m                         [PRESS ANY KEY TO BEGIN] [0m"
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
set "clr1=[2;%clrmove%H[38;2;%clresc%mWelcome to Cursor Changer %batver% [0m"
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
set "clr1=[38;2;%clresc%m  Cursor Changer %batver% Setup [0m"
echo.
echo %clr1%
ping -n 2 localhost>nul


:CursorChangerOOBEdev
rem Now, it's the beginning of a fucking trashy long goofy ahh idiot code.
title Cursor Changer %batver% Setup
if not defined dummy (set clr=[3m[97m&set clrhigh=[7m&set clrhighend=[0m&set clrwhi=[48;5;250m[30m&set clr2=[0m&set clrgra=[90m)
if not defined dummy (set moveline=[22;0H) else (set moveline=[22;0H)
if not defined invisiblecursor (echo [?25l&set invisiblecursor=true)
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
echo          ^ÅE     To setup Cursor Changer now, press E.
echo.
echo          ^ÅE     To skip the setup and use the Cursor Changer,
echo                 press S. (All settings are set to the default values)
echo.
echo          ^ÅE     To quit setup without installing Cursor Changer, press B.
echo.
echo.
echo.
echo.
set /p nothing=%clrwhi%     E=Continue     S=Skip     B=Quit                                           %moveline%%clrwhi% <nul& choice /c ESB /n >nul
if %ErrorLevel%==1 goto OOBEmain
if %ErrorLevel%==2 goto OOBESkip
if %ErrorLevel%==3 call :OOBEmainblank&timeout /t 1 /nobreak >nul&exit

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
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&set oobetheme=dark&set OOBEsetting1toggle=true&set OOBEsetting2toggle=false&set OOBEsetting3toggle=false&set OOBEsetting4toggle=true&set OOBEsetting5toggle=true&goto OOBEmain8
if %ErrorLevel%==2 color 07&cls&goto CursorChangerOOBEdev
if %ErrorLevel%==3 color 07&cls&goto CursorChangerOOBEdev

:OOBEmain
color 07
cls
echo.
echo   Cursor Changer %batver% Setup
echo ================================O
echo.
echo.
echo          Do you Want hear The Windows XP OOBE Music?
echo.
echo          if you yes, press Y.
echo          if you not, press N.
echo.
echo          By the way, This feature has require internet
echo          Connection. So if you don't have it, Press N.
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


:OOBEmainmusicmessage2
set batchpath=
color 07
cls
echo.
echo   Cursor Changer %batver% Setup
echo ================================O
echo.
echo.
echo          Done,
echo.
echo          It may take some time for the music to fully play.
echo          And if you want stop the music, Close the powershell.
echo.
echo          If music does not play, Check the following : 
echo.
echo          You have an Internet connection
echo          Check your anti-virus software
echo          Check that github is available
echo          Make sure you do not have API rate limitation from github
echo          Make sure powershell is available
echo.
echo          (Continue setup after 5 seconds.)
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
echo          Cursor Changer.bat generates two files.
echo          CursorChangerSetting.txt and FirstCursor.txt.
echo.
echo          CursorChangerSetting.txt stores the settings of CursorChanger.bat,
echo          This file is Very inportant file.
echo.
echo          FirstCursor.txt is used to determine the initial Chenge Cursor.
echo          and is also an important file.
echo.
echo          If the user (in this case %USERNAME%) deletes these files,
echo          this CursorChanger.bat may not work properly and should never be done.
echo          SO, DON'T DELETE THESE FILE.
echo.
echo          (Y to Continue)
echo.
set /p nothing=%clr2%%clrwhi%     Y=Continue                                                              1/3%moveline%%clrwhi% <nul&choice /c Y /n >nul
if %ErrorLevel%==1 goto OOBEmain3


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
if %ErrorLevel%==1 goto OOBEmain4


:OOBEmain4
color 07
cls
echo.
echo   Cursor Changer %batver% Setup
echo ================================O
echo Setup progress : 1/5 (Check precautions)
echo.
echo.
echo          This batch is intended to run on Windows 10 1511 or later. 
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
echo Setup progress : 2/5 (Confirm Cursor Changer)
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
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto OOBEmain6
if %ErrorLevel%==2 goto OOBEmain5ifno


:OOBEmain5ifno
color 07
cls
echo.
echo   Cursor Changer %batver% Setup
echo ================================O
echo Setup progress : 2/5 (Confirm Cursor Changer)
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
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto OOBEmain6
if %ErrorLevel%==2 call :OOBEmainblank & timeout /t 1 /nobreak >nul&exit



:OOBEmain6
color 07
cls
echo.
echo   Cursor Changer %batver% Setup
echo ================================O
echo Setup progress : 3/5 (Set theme of Cursor Changer)
echo.
echo.
echo          Cursor Changer allows you to choose
echo          between a light or dark theme.
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
if %ErrorLevel%==1 goto OOBEmain6theme1
if %ErrorLevel%==2 call :OOBEmainblank & timeout /t 1 /nobreak >nul&set oobetheme=dark&goto OOBEmain7


:OOBEmain6theme1
if {%OOBEundiscard%}=={true} (call :OOBEmainblank & timeout /t 1 /nobreak >nul&set oobetheme=dark&set OOBEundiscard=&goto OOBEmain7)
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
echo    ^ÅE   Nothing Selected. A,D or 1,2 to chooce the theme.
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
echo     ^ÅE   The most ordinary theme and most suitable.
echo     ^ÅE   and optimized theme for using Cursor Changer.
echo     ^ÅE   This is usually recommended.
echo.
echo          (A,D or 1,2 to move, Y or E to confirm.)
echo          (B to stop choosing the theme.)
echo.
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     A,1=move to Left     D,2=move to right     Y,E=Confirm     B=Exit          %moveline%%clrwhi% <nul&choice /c AD12BYE /n >nul
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
echo     ^ÅE   This theme has a special atmosphere.
echo     ^ÅE   It displays more brightly than the dark theme.
echo     ^ÅE   Some functions of Cursor Changer may not
echo     ^ÅE   befully compatible with this theme.
echo.
echo          (A,D or 1,2 to move, Y or E to confirm.)
echo          (B to stop choosing the theme.)
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     A,1=move to Left     D,2=move to right     Y,E=Confirm     B=Exit          %moveline%%clrwhi% <nul&choice /c AD12BYE /n >nul
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
echo   Cursor Changer %batver% Setup
echo ================================O
echo Setup progress : 3/5 (Set theme of Cursor Changer)
echo.
echo.
echo          O============O    O=============O
echo          I%clrhigh% Dark theme %clrhighend%I    I white theme I
echo          O============O    O=============O
echo.
echo     ^ÅE   Are you sure you want to select this theme?
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
if %ErrorLevel%==1 goto OOBEmain6theme2
if %ErrorLevel%==2 goto OOBEmain6theme2
if %ErrorLevel%==3 call :OOBEmainblank & timeout /t 1 /nobreak >nul&set oobetheme=dark&goto OOBEmain7
if %ErrorLevel%==4 call :OOBEmainblank & timeout /t 1 /nobreak >nul&set oobetheme=dark&goto OOBEmain7



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
echo     ^ÅE   Are you sure you want to select this theme?
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
if %ErrorLevel%==1 goto OOBEmain6theme3
if %ErrorLevel%==2 goto OOBEmain6theme3
if %ErrorLevel%==3 set oobetheme=white&call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto OOBEmain7
if %ErrorLevel%==4 set oobetheme=white&call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto OOBEmain7


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
echo          Cursor Changer has able to customize settings.
echo          Do you want to customize?
echo.
echo          (if you don't, The setting will set to default values.)
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
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto OOBEmain7CustomizeSettings
if %ErrorLevel%==2 call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto OOBEmain8

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
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&set OOBEsetting1toggle=true&set OOBEsetting2toggle=false&set OOBEsetting3toggle=false&set OOBEsetting4toggle=true&set OOBEsetting5toggle=true&goto OOBEmain8
if %ErrorLevel%==2 goto OOBEmain7CustomizeSettings1

:OOBEmain7CustomizeSettings
if {%oobetheme%}=={white} (set OOBEsettingclr=[100m[97m&set OOBEsettingclr2=[0m[107m[30m)
if {%oobetheme%}=={dark} (set OOBEsettingclr=[7m&set OOBEsettingclr2=[0m)
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
echo          I 1 Confirm reboot when Changed  I
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
set /p nothing=%clr2%%clrwhi%     W,S or 1~5=Move     Y=Toggle     N,B=Discard                               %moveline%%clrwhi% <nul&choice /c WS12345YNB /n >nul
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
echo   Cursor Changer %batver% Setup
echo ================================O
echo Setup progress : 4/5 (Customize of Settings)
echo.
echo.
echo          O================================O   Customize of Settings
echo          I%OOBEsettingclr% 1 Confirm reboot when Changed  %OOBEsettingclr2%I
echo          O================================O   Change whether or not to confirm
echo          I%OOBEsetting2clr% 2 Admin when boot              %OOBEsetting2clr2%I   restart
echo          O================================O   after changing the cursor with
echo          I%OOBEsetting3clr% 3 Check update at boot         %OOBEsetting3clr2%I   the Cursor Changer function.
echo          O================================O   If on, restart will be confirmed.
echo          I%OOBEsetting4clr% 4 Longpress detection of enter %OOBEsetting4clr2%I
echo          O================================O   %clrgra%enable is recommended.%OOBEsettingclr2%
echo          I%OOBEsetting5clr% 5 Boot animation               %OOBEsetting5clr2%I
echo          O================================O
echo                       I  OK  I
echo                       O======O
echo.
echo.
set /p nothing=%clr2%%clrwhi%     W,S or 1~5=Move     Y=Toggle     N,B=Discard                               %moveline%%clrwhi% <nul&choice /c WS12345YNB /n >nul
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
echo   Cursor Changer %batver% Setup
echo ================================O
echo Setup progress : 4/5 (Customize of Settings)
echo.
echo.
echo          O================================O   Customize of Settings
echo          I%OOBEsetting1clr% 1 Confirm reboot when Changed  %OOBEsetting1clr2%I
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
set /p nothing=%clr2%%clrwhi%     W,S or 1~5=Move     Y=Toggle     N,B=Discard                               %moveline%%clrwhi% <nul&choice /c WS12345YNB /n >nul
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
echo   Cursor Changer %batver% Setup
echo ================================O
echo Setup progress : 4/5 (Customize of Settings)
echo.
echo.
echo          O================================O   Customize of Settings
echo          I%OOBEsetting1clr% 1 Confirm reboot when Changed  %OOBEsetting1clr2%I
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
set /p nothing=%clr2%%clrwhi%     W,S or 1~5=Move     Y=Toggle     N,B=Discard                               %moveline%%clrwhi% <nul&choice /c WS12345YNB /n >nul
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
echo   Cursor Changer %batver% Setup
echo ================================O
echo Setup progress : 4/5 (Customize of Settings)
echo.
echo.
echo          O================================O   Customize of Settings
echo          I%OOBEsetting1clr% 1 Confirm reboot when Changed  %OOBEsetting1clr2%I
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
set /p nothing=%clr2%%clrwhi%     W,S or 1~5=Move     Y=Toggle     N,B=Discard                               %moveline%%clrwhi% <nul&choice /c WS12345YNB /n >nul
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
echo   Cursor Changer %batver% Setup
echo ================================O
echo Setup progress : 4/5 (Customize of Settings)
echo.
echo.
echo          O================================O   Customize of Settings
echo          I%OOBEsetting1clr% 1 Confirm reboot when Changed  %OOBEsetting1clr2%I
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
set /p nothing=%clr2%%clrwhi%     W,S or 1~5=Move     Y=Toggle     N,B=Discard                               %moveline%%clrwhi% <nul&choice /c WS12345YNB /n >nul
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
echo   Cursor Changer %batver% Setup
echo ================================O
echo Setup progress : 4/5 (Customize of Settings)
echo.
echo.
echo          O================================O   Customize of Settings
echo          I%OOBEsetting1clr% 1 Confirm reboot when Changed  %OOBEsetting1clr2%I
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
set /p nothing=%clr2%%clrwhi%     W,S or 1~5=Move     Y=Toggle     N,B=Discard                               %moveline%%clrwhi% <nul&choice /c WS12345YNB /n >nul
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
echo   Cursor Changer %batver% Setup
echo ================================O
echo Setup progress : 4/5 (Customize of Settings)
echo.
echo.
echo          Customize of settings :
echo.
echo          1 Confirm reboot when Changed  : %OOBEsetting1toggle% %clrgra%(recommend true)%OOBEsettingclr2%
echo          2 Admin when boot              : %OOBEsetting2toggle% %clrgra%(recommend false)%OOBEsettingclr2%
echo          3 Check update at boot         : %OOBEsetting3toggle% %clrgra%(recommend false)%OOBEsettingclr2%
echo          4 Longpress Detection of enter : %OOBEsetting4toggle% %clrgra%(recommend true)%OOBEsettingclr2%
echo          5 Boot animation               : %OOBEsetting5toggle% %clrgra%(recommend true)%OOBEsettingclr2%
echo.
echo          If you continue, these settings will be written to the Setting file.
echo          Are you sure? %clrgra%(setting file pass is at "%batchmainpath%".) %OOBEsettingclr2%
echo.
echo          (Y=Yes, this is fine.)
echo          (N=No, I want change it.)
echo.
echo.
set /p nothing=%clr2%%clrwhi%     Y=Yes     N=No                                                             %moveline%%clrwhi% <nul&choice /c YN /n >nul
if %ErrorLevel%==1 if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto OOBEmain8
if %ErrorLevel%==2 goto OOBEmain7CustomizeSettings1

:OOBEmain8
if "%oobetheme%"=="white" (color f0) else (color 07)
rem setting written, well, wtf is this?? so many goofy ahh if statement. hell no NOT AGAIN!!!!!!!!!!!!
if not exist CursorChangerSettings.txt (
    type nul > CursorChangerSettings.txt
    echo nodogcheckfor1234567890qwertyuiop >> CursorChangerSettings.txt 

    if "%OOBEsetting1toggle%"=="false" (
echo rebootokey=false >> CursorChangerSettings.txt
    ) else if "%OOBEsetting1toggle%"=="true" (
        echo rebootokey=true >> CursorChangerSettings.txt
    ) else (echo rebootokey=true >> CursorChangerSettings.txt)

    if "%OOBEsetting2toggle%"=="false" (
echo admin=false >> CursorChangerSettings.txt
    ) else if "%OOBEsetting2toggle%"=="true" (
        echo admin=true >> CursorChangerSettings.txt
    ) else (echo admin=false >> CursorChangerSettings.txt)

    if "%OOBEsetting3toggle%"=="false" (
echo CheckUpdate=false >> CursorChangerSettings.txt
    ) else if "%OOBEsetting3toggle%"=="true" (
        echo CheckUpdate=true >> CursorChangerSettings.txt
    ) else (echo CheckUpdate=false >> CursorChangerSettings.txt)

    if "%OOBEsetting4toggle%"=="false" (
echo typosWarning=false >> CursorChangerSettings.txt
    ) else if "%OOBEsetting4toggle%"=="true" (
        echo typosWarning=true >> CursorChangerSettings.txt
    ) else (echo typosWarning=true >> CursorChangerSettings.txt)

    if "%OOBEsetting5toggle%"=="false" (
echo bootanimation=false >> CursorChangerSettings.txt
    ) else if "%OOBEsetting5toggle%"=="true" (
        echo bootanimation=true >> CursorChangerSettings.txt
    ) else (echo bootanimation=true >> CursorChangerSettings.txt)
    
    if "%OOBEtheme%"=="dark" (
echo wmode=false >> CursorChangerSettings.txt
    ) else if "%OOBEtheme%"=="white" (
        echo wmode=true >> CursorChangerSettings.txt
    ) else (echo wmode=false >> CursorChangerSettings.txt)
    echo s5_linuxboot=false >> CursorChangerSettings.txt
    echo s5_simpleboot=false >> CursorChangerSettings.txt
    echo s5_rawboot=false >> CursorChangerSettings.txt

if not exist FirstCursor.txt (
type nul > FirstCursor.txt
echo nodogcheckforfastboot >> FirstCursor.txt
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
echo          (Leave setup and goto mainmenu with Y or E.)
echo.
echo.
echo.
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     Y,E=Exit                                                                   %moveline%%clrwhi% <nul&choice /c YE /n >nul
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
rem recovery menu for Cursor Changer, and recovery console
cls
mode con: cols=75 lines=25
color 07
set bootbatnow=no
if defined bootbatnow (set clr=[7m&set clr2=[0m) else (set clr=[7m&set clr2=[0m)
echo Preparing Recovery menu, Please wait a while...
timeout /t 2 /nobreak >nul
title Cursor Changer Recovery Menu
cls
echo                     Cursor Changer %batver% Recovery Menu %debugmode%               
echo.
echo                                    Reboot
echo                                 Wipe Setting  
echo                               Recovery Console 
echo                                   Exit Menu    
echo.
echo                    1~4 or WS to select, E or Y to Enter.
echo                       Currently nothing is selected.
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
title Cursor Changer Recovery Menu
echo                     Cursor Changer %batver% Recovery Menu %debugmode%               
echo.
echo                              %clr%      Reboot      %clr2%
echo                                 Wipe Setting    
echo                               Recovery Console 
echo                                   Exit Menu    
echo.
echo                    1~4 or WS to select, E or Y to Enter.
echo                       Reboot Cursor Changer. This is
echo                            usually recommended.
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
title Cursor Changer Recovery Menu
echo                     Cursor Changer %batver% Recovery Menu %debugmode%               
echo.
echo                                    Reboot       
echo                              %clr%   Wipe Setting   %clr2%
echo                               Recovery Console 
echo                                   Exit Menu    
echo.
echo                    1~4 or WS to select, E or Y to Enter.
echo            It is can to restore settings to their default vaule.
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
title Cursor Changer Recovery Menu
echo                     Cursor Changer %batver% Recovery Menu %debugmode%               
echo.
echo                                    Reboot       
echo                                 Wipe Setting    
echo                              %clr% Recovery Console %clr2%
echo                                   Exit Menu    
echo.
echo                    1~4 or WS to select, E or Y to Enter.
echo                       Access to the recovery console.
echo         This provides access to almost all of the debugging commands
echo                        available in the main menu.
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
title Cursor Changer Recovery Menu
echo                     Cursor Changer %batver% Recovery Menu %debugmode%               
echo.
echo                                    Reboot       
echo                                 Wipe Setting    
echo                               Recovery Console   
echo                              %clr%     Exit Menu    %clr2%
echo.
echo                    1~4 or WS to select, E or Y to Enter.
echo                        Exit from the recovery menu (shutdown).
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
title Cursor Changer Recovery Menu
echo                     Cursor Changer %batver% Recovery Menu %debugmode%               
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
if %ErrorLevel%==2 goto :Cursor_Changer_REmenu2

:Cursor_Changer_REWipeYippeee
cls
title Cursor Changer Recovery Menu
echo                     Cursor Changer %batver% Recovery Menu %debugmode%               
echo.
echo.  
echo                               Wipe Setting
echo                                    is
echo                             Successfully Done.
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
echo Preparing Recovery Console, Please wait a while...
timeout /t 2 /nobreak >nul
cls
:Cursor_Changer_REConsolemain
title Cursor Changer Recovery Console
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
echo                                         inspectentirecommandlist
echo                                         to inspect commandlists.
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
if {%selected%}=={inspectentirecommandlist} (goto :allcommands)
if {%selected%}=={exit} (set FromREConsole=&exit /b)
if {%selected%}=={alldefnow1} (goto :AllDefult1)
if {%selected%}=={playdefboot} (set typosWarning=0&cls&goto :firstboot)
if {%selected%}=={debugyesnow} (goto :darkgo)
if {%selected%}=={fulldebug} (goto fulldebug)
if {%selected%}=={getadmin} (goto :batstartadm)
if {%selected%}=={restoresetting} (
call :Wipealldeta
echo done. enter somethings to continue.
pause >nul
)
if {%selected%}=={alldefdeletebat} (set typosWarning=0&echo delete bat, confirm to type something...&pause&goto alldefdeletefinish5)
if {%selected%}=={windowsfiltertest} (goto :batbootcheckwinverbad)
if {%selected%}=={funanimationdeb} (goto :batbootanimationfun)
if {%selected%}=={openie} (goto :openiedev)
if {%selected%}=={setenter} (echo.&set /p typosWarning=pls type:&goto :Mainmenuboot) else (set selected= &echo enter valid command.&goto Cursor_Changer_REConsoleask)


rem O========================================= OOBE and Receovery Code Ended =================================================O


:Wipealldeta
rem Wipe Setting file
echo nodogcheckfor1234567890qwertyuiop > CursorChangerSettings.txt
echo CheckUpdate=false >> CursorChangerSettings.txt
echo wmode=false >> CursorChangerSettings.txt
echo admin=false >> CursorChangerSettings.txt
echo rebootokey=true >> CursorChangerSettings.txt
echo typosWarning=true >> CursorChangerSettings.txt
echo bootanimation=true >> CursorChangerSettings.txt
echo s5_linuxboot=false >> CursorChangerSettings.txt
echo s5_simpleboot=false >> CursorChangerSettings.txt
echo s5_rawboot=false >> CursorChangerSettings.txt
exit /b


rem Detects settings related to prompts for administrative privileges,
:batstart
if "%linuxboot%"=="false" (mode con: cols=75 lines=25)
if {%settingbypass%}=={true} (goto Mainmenuskipboot)
if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] admin checked.) else (cls)
rem Detection of administrative permission settings
find "admin=true" CursorChangerSettings.txt > nul
if {%adminbypass%}=={true} (goto gotadmin)
if {%errorlevel%}=={0} (goto batstartadm)
if {%errorlevel%}=={1} (
set batloadprgs=0
call :MOBAS_Loader
goto batstarttest2
)

:batstarttest2
if "%linuxboot%"=="false" (cls)
find "admin=false" CursorChangerSettings.txt > nul
set batloadprgs=0
call :MOBAS_Loader
if {%errorlevel%}=={0} (goto Mainmenuboot)
if {%errorlevel%}=={1} (goto batstartadm)


:batstartadm
cls
rem Obtaining administrative privileges
echo copyright.Cursor Changer %batver% by tamago_1908
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
powershell -NoProfile -Command "Start-Process '%batpath%' -Verb RunAs" >nul && exit
echo.
echo Request for administrative privileges denied.
echo ^(Tip : You can disable this furture at setting.^)
timeout /t 2 /nobreak >nul
:gotAdmin
cls
pushd "%CD%"
goto Mainmenuboot


:Mainmenuboot
if {%alldefentered%}=={true} (
set alldefno2clr=
set alldefno2clr2=
set alldefclr=
set alldefclr2=
set alldefentered=
)
if {%settingbypass%}=={true} (goto hazimemenuskipboot)
rem There is a difference between a goto Mainmenuboot and a direct goto to the menu. The difference is whether you go to the menu via the settings loading section or not.
rem Basically, it is better to go through the settings, but if speed is important, you can go directly.

rem setting and other loading
rem need to assign variables to what to load and where to goto after loading set wantload=setting1 set whatloadgoto=Mainmenuboot etc. only if it is Mainmenuboot related
rem The cursor color is not implemented in the main change section. It is not designed so that you can come back to Mainmenuboot after changing it.
rem If you want to add a setting, you can copy and paste it. However, you may need to add some code if you want to change the look of the menu.
:settingloads
cd /d %batchmainpath%
if not exist CursorChangerSettings.txt (
cls
title Cursor Error
echo setting file has does not exist.
pause
echo Perhaps it is because You moved it, or just a bug. OR, you intentionally erased the Setting file... At least it is true that the Setting file does not exist.
pause
cls
echo Regenerate the Setting file. All previous settings will be deleted.
pause
cls
call :Wipealldeta
title ...
echo Regenerate has Complete.
pause
echo Restart Cursor Changer to apply the changes.
pause
exit
)
if not exist FirstCursor.txt (
type nul > FirstCursor.txt
echo nodogcheckforfastboot >> FirstCursor.txt
)
if {%bootbatnow%}=={no} (goto whatload) else (goto setting1load)
:setting1load
set allsettingerror=0
find "rebootokey=true" CursorChangerSettings.txt > nul
if %ErrorLevel%==0 set setting1onoff=true 
if %ErrorLevel%==1 goto setting1load2
if {%bootbatnow%}=={yes} (
        if "%linuxboot%"=="true" if not "%bootbatnow%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Setting1 Loaded.)
set batloadprgs=1
call :MOBAS_Loader
goto setting2load
)
goto whatloadgoto


:setting2load
find "admin=true" CursorChangerSettings.txt > nul
if %ErrorLevel%==0 set setting2onoff=true 
if %ErrorLevel%==1 goto setting2load2
if {%bootbatnow%}=={yes} (
    if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Setting2 Loaded.)
set batloadprgs=2
call :MOBAS_Loader
goto setting3load
) 
goto whatloadgoto

:setting3load
find "CheckUpdate=true" CursorChangerSettings.txt > nul
if %ErrorLevel%==0 set setting3onoff=true 
if %ErrorLevel%==1 goto setting3load2
if {%bootbatnow%}=={yes} (
    if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Setting3 Loaded.)
set batloadprgs=3
call :MOBAS_Loader
goto setting4load
) 
goto whatloadgoto

:setting4load
find "typosWarning=true" CursorChangerSettings.txt > nul
if %ErrorLevel%==0 set setting4onoff=true 
if %ErrorLevel%==1 goto setting4load2
if {%bootbatnow%}=={yes} (
    if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Setting4 Loaded.)
set batloadprgs=4
call :MOBAS_Loader
goto setting5load
) 
goto whatloadgoto

:setting5load
find "bootanimation=true" CursorChangerSettings.txt > nul
if %ErrorLevel%==0 set setting5onoff=true 
if %ErrorLevel%==1 goto setting5load2
if {%bootbatnow%}=={yes} (
    if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Setting5 Loaded.)
set batloadprgs=5
call :MOBAS_Loader
goto setting5_s1load
) 
goto whatloadgoto

:setting5_s1load
find "s5_linuxboot=true" CursorChangerSettings.txt > nul
if %ErrorLevel%==0 set setting5_s1onoff=true 
if %ErrorLevel%==1 goto setting5_s1load2
if {%bootbatnow%}=={yes} (
    if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Setting5_1 Loaded.)
set batloadprgs=5
call :MOBAS_Loader
goto setting5_s2load
) 
goto whatloadgoto

:setting5_s2load
find "s5_simpleboot=true" CursorChangerSettings.txt > nul
if %ErrorLevel%==0 set setting5_s2onoff=true 
if %ErrorLevel%==1 goto setting5_s2load2
if {%bootbatnow%}=={yes} (
    if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Setting5_2 Loaded.)
set batloadprgs=5
call :MOBAS_Loader
goto setting5_s3load
) 
goto whatloadgoto

:setting5_s3load
find "s5_rawboot=true" CursorChangerSettings.txt > nul
if %ErrorLevel%==0 set setting5_s3onoff=true 
if %ErrorLevel%==1 goto setting5_s3load2
if {%bootbatnow%}=={yes} (
    if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Setting5_3 Loaded.)
set batloadprgs=5
call :MOBAS_Loader
goto wmodeload
) 
goto whatloadgoto

:wmodeload
find "wmode=true" CursorChangerSettings.txt > nul
if {%ErrorLevel%}=={0} (set wmodeonoff=Change To Darkmode  &set wmodetoggle=true)
if {%ErrorLevel%}=={1} (goto wmodeload2)
if {%bootbatnow%}=={yes} (
    if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Wmode Loaded.)
set batloadprgs=6
call :MOBAS_Loader
goto loads
) 
goto whatloadgoto

:allsettingtest
rem Verify missing settings
:setting1load2
    if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting1 is not the true. Loaded.)
find "rebootokey=false" CursorChangerSettings.txt > nul
if %ErrorLevel%==0 (set setting1onoff=false) else if %ErrorLevel%==1 set setting1onoff= null&set /a allsettingerror=allsettingerror+1
if {%bootbatnow%}=={yes} (set batloadprgs=1&call :MOBAS_Loader)
if {%bootbatnow%}=={yes} (goto setting2load) else (goto whatloadgoto)

:setting2load2
if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting2 is not the true. Loaded.)
find "admin=false"  CursorChangerSettings.txt > nul
if %ErrorLevel%==0 (set setting2onoff=false) else if %ErrorLevel%==1 set setting2onoff=null&set /a allsettingerror=allsettingerror+1
if {%bootbatnow%}=={yes} (set batloadprgs=2&call :MOBAS_Loader)
if {%bootbatnow%}=={yes} (goto setting3load) else (goto whatloadgoto)

:setting3load2
if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting3 is not the true. Loaded.)
find "CheckUpdate=false"  CursorChangerSettings.txt > nul
if %ErrorLevel%==0 (set setting3onoff=false) else if %ErrorLevel%==1 set setting3onoff=null&set /a allsettingerror=allsettingerror+1
if {%bootbatnow%}=={yes} (set batloadprgs=3&call :MOBAS_Loader)
if {%bootbatnow%}=={yes} (goto setting4load) else (goto whatloadgoto)

:setting4load2
if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting4 is not the true. Loaded.)
find "typosWarning=true" CursorChangerSettings.txt > nul
if %ErrorLevel%==0 (set setting4onoff=false) else if %ErrorLevel%==1 set setting4onoff=null&set /a allsettingerror=allsettingerror+1
if {%bootbatnow%}=={yes} (set batloadprgs=4&call :MOBAS_Loader)
if {%bootbatnow%}=={yes} (goto setting5load) else (goto whatloadgoto)

:setting5load2
    if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting5 is not the true. Loaded.)
find "bootanimation=false" CursorChangerSettings.txt > nul
if %ErrorLevel%==0 (set setting5onoff=false) else if %ErrorLevel%==1 set setting5onoff= null&set /a allsettingerror=allsettingerror+1
if {%bootbatnow%}=={yes} (set batloadprgs=5&call :MOBAS_Loader)
if {%bootbatnow%}=={yes} (goto setting5_s1load) else (goto whatloadgoto)

:setting5_s1load2
    if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting5_1 is not the true. Loaded.)
find "s5_linuxboot=false" CursorChangerSettings.txt > nul
if %ErrorLevel%==0 (set setting5_s1onoff=false) else if %ErrorLevel%==1 set setting5_s1onoff= null&set /a allsettingerror=allsettingerror+1
if {%bootbatnow%}=={yes} (set batloadprgs=5&call :MOBAS_Loader)
if {%bootbatnow%}=={yes} (goto setting5_s2load) else (goto whatloadgoto)

:setting5_s2load2
    if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting5_2 is not the true. Loaded.)
find "s5_simpleboot=false" CursorChangerSettings.txt > nul
if %ErrorLevel%==0 (set setting5_s2onoff=false) else if %ErrorLevel%==1 set setting5_s2onoff= null&set /a allsettingerror=allsettingerror+1
if {%bootbatnow%}=={yes} (set batloadprgs=5&call :MOBAS_Loader)
if {%bootbatnow%}=={yes} (goto setting5_s3load) else (goto whatloadgoto)

:setting5_s3load2
    if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting5_3 is not the true. Loaded.)
find "s5_rawboot=false" CursorChangerSettings.txt > nul
if %ErrorLevel%==0 (set setting5_s3onoff=false) else if %ErrorLevel%==1 set setting5_s3onoff= null&set /a allsettingerror=allsettingerror+1
if {%bootbatnow%}=={yes} (set batloadprgs=5&call :MOBAS_Loader)
if {%bootbatnow%}=={yes} (goto wmodeload) else (goto whatloadgoto)

:wmodeload2
    if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Setting6 is not the true. Loaded.)
find "wmode=false" CursorChangerSettings.txt > nul
if {%ErrorLevel%}=={0} (set wmodeonoff=Change to white mode&set wmodetoggle=false) else if {%ErrorLevel%}=={1} (set wmodeonoff=Change to null theme&set wmodetoggle=false&set /a allsettingerror=allsettingerror+1)
if {%bootbatnow%}=={yes} (set batloadprgs=6&call :MOBAS_Loader)
if {%bootbatnow%}=={yes} (goto loads) else (goto whatloadgoto)

:loads
:wmodeMainmenuload
rem Detects white mode and changes color
find "wmode=true" CursorChangerSettings.txt > nul
if {%errorlevel%}=={0} (color f0)
if {%bootbatnow%}=={no} (echo Processing...) else (
    if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] mainmenu theme loaded.)
set batloadprgs=6
call :MOBAS_Loader
goto debugMainmenuload
)
if {%whatloadgoto%}=={Mainmenuboot} (goto Mainmenu)
goto debugMainmenuload

:debugMainmenuload
rem  Debug mode detection (Warning!!! ITS OLD CODE!!!)
find "debug=true" CursorChangerSettings.txt > nul
if {%errorlevel%}=={0} (echo on&set debugmode=debugmode)
if {%errorlevel%}=={1} (echo off&set debugmode=)
if {%bootbatnow%}=={no} (echo Processing...) else (
    if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Debug mode Loaded.)
set batloadprgs=7
call :MOBAS_Loader
goto :firststarttest
)
if {%1}=={devmode} (set devmode=true&goto :firststarttest)
if {%whatloadgoto%}=={Mainmenuboot} (goto Mainmenu)
goto :firststarttest

:firststarttest
rem detect firstcursor.txt
setlocal enabledelayedexpansion
if exist FirstCursor.txt (
find "nodogcheckforfastboot" FirstCursor.txt > nul
if "!ErrorLevel!"=="1" (
set FirstCursorisEdited=true
    )
)
setlocal disabledelayedexpansion
if {%bootbatnow%}=={no} (echo Processing...) else (
    if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] FirstCursor.txt is Loaded.)
set batloadprgs=8
call :MOBAS_Loader
goto cursorcolorload
)
if {%whatloadgoto%}=={Mainmenuboot} (goto Mainmenu)
goto cursorcolorload

:cursorcolorload
rem Detect cursor color
rem 0x0 is white
rem 0x2 is black
reg query "HKEY_CURRENT_USER\Control Panel\Cursors" /v "Scheme Source" | find "0x0" > nul

if {%ErrorLevel%}=={0} (set cursorcolor=black)
if {%ErrorLevel%}=={1} (set cursorcolor=white)
if {%bootbatnow%}=={no} (echo Processing...) else (
    if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Cursor Color is Loaded.)
set batloadprgs=9
call :MOBAS_Loader
goto Mainmenucursorcolor2
)
if {%whatloadgoto%}=={Mainmenuboot} (goto Mainmenu)

:Mainmenucursorcolor2
reg query "HKEY_CURRENT_USER\Control Panel\Cursors" /v "Scheme Source" | find "0x2" > nul

if {%ErrorLevel%}=={0} (set cursorcolor=white)
if {%bootbatnow%}=={no} (echo Processing...) else (
    if "%linuxboot%"=="true" (echo [%linuxishclr%info%linuxishclr2%] Menu stuff All Loaded.)
set batloadprgs=10
call :MOBAS_Loader
goto :MOBAS_Loader_initializeVaribale
)
if {%whatloadgoto%}=={Mainmenuboot} (goto Mainmenu)
goto Mainmenu


:MOBAS_Loader
if "%linuxboot%"=="true" if "%bootbatnow%"=="yes" (echo [%linuxishclr%info%linuxishclr2%] Mobas_Loader Running...)
rem Boot animation.
rem MOBAS_Loader mean is "Management Of Boot Animation and Setting load"
rem Below is a text branch on loading.
rem loadsscrnprgsclrgra = 808080, windows is loading files (windows 2000) is 838383. wow its close
if {%bootbatnow%}=={no} (cls & title Cursor Setting Processing... & echo Processing... & goto whatload) else (title Booting up...)
if {%simpleboot%}=={true} (cls & echo Booting up...& exit /b)
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
echo                        Booting up Cursor Changer...
echo           O=====================================================O
echo           I%loadscrnprgs0%%loadscrnprgs1%%loadscrnprgs2%%loadscrnprgs3%%loadscrnprgs4%%loadscrnprgs5%%loadscrnprgs6%%loadscrnprgs7%%loadscrnprgs8%%loadscrnprgs9%%loadscrnprgs10%I
echo           O=====================================================O
rem 37 full-width
rem 74 half-width
rem btw, its windows 2000 reference
)
exit /b

:MOBAS_Loader_initializeVaribale
set loadscrnprgs9=&set loadscrnprgs10=&set loadscrnprgsclr=&set loadscrnprgsclr2=&set loadscrnprgsclrgra=
set batloadprgsdelete=&set back_to_the_firstline=
goto Mainmenu

:whatload

rem I'm not sure if I need the process here. If you just want the value of setting as usual, I think it would work if you did a goto to setting1load or something and then assigned the destination to whatloadgoto....
if {%wantload%}=={setting1} (goto setting1load) 
if {%wantload%}=={setting2} (goto setting2load)
if {%wantload%}=={setting3} (goto setting3load)
if {%wantload%}=={setting4} (goto setting4load)
if {%wantload%}=={setting5} (goto setting5load)
if {%wantload%}=={setting5_1} (goto setting5_s1load&set animationrecheck=true)
if {%wantload%}=={setting5_2} (goto setting5_s2load&set animationrecheck=true)
if {%wantload%}=={setting5_3} (goto setting5_s3load&set animationrecheck=true)
if {%wantload%}=={wmode} (goto wmodeload)
if {%wantload%}=={wmodeMainmenu} (goto wmodeMainmenuload) 
if {%wantload%}=={debugMainmenu} (goto debugMainmenuload)
if {%wantload%}=={FirstMainmenu} (goto FirstMainmenuload)
if {%wantload%}=={cursorcolor} (goto cursorcolorload)
if {%wantload%}=={} (goto Mainmenu)
call :BSOD_Errors 2
pause
exit

:whatloadgoto
rem I don't see why this label is necessary. But it is necessary anyway
if "%animationrecheck%"=="true" (call :batbootloader_animationcheck)
set wantload=
exit /b



:batbootanimation
if "%linuxboot%"=="true" (echo.&echo [%time: =%] O================ Boot End Here ================O&echo.&echo [%linuxishclr%info%linuxishclr2%] Boot Complete.&timeout /t 2 /nobreak >nul)
cls
if {%firststartbat%}=={yes} (goto batbootanimationbypassfun)
find "bootanimation=false" CursorChangerSettings.txt > nul
if {%errorlevel%}=={0} (goto checksum)
rem Play the boot animation, with a 1 in 50 chance that another version will be played. The random specification(?) requires two consecutive random runs.
set /a bootegg=%random%*51/32767
set /a bootegg2=%random%*51/32767
if {%firststartbat%}=={yes} (goto batbootanimationbypassfun)
if {%bootegg%}=={%bootegg2%} (goto batbootanimationfun)
set bootegg=
set bootegg2=
:batbootanimationbypassfun
title WELCOME
echo.
echo                            Cursor Changer %batver% %debugmode%
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
echo                         2021-2024 tamago1908 %batbuild%
timeout /t 3 /nobreak >nul
cls
goto checksum


:batbootanimationfun
set bootegg=
set bootegg2=
mode con: cols=85 lines=29
find "wmode=true" CursorChangerSettings.txt >nul
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
echo                         Cursor Changer %batver% Welcome. 2021-2024 %debugmode%
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

rem Check for missing settings

:checksum
if {%invisiblecursor%}=={true} (echo [?25h&set invisiblecursor=)
if not {%allsettingerror%} equ {0} (
    title Cursor Loss
    echo %allsettingerror% setting is missing.
    echo.
    echo Make sure you have not previously used Cursor Changer version 1.5 through version 1.9.
    echo Or check the contents of Cursor Changer Setting.txt.
    echo The file path is %batchmainpath%
    echo To repair, go to Settings and toggle the setting true/false for the damaged area. It will be automatically completed and repaired. ^(When repairing, the settings will be set to the default default values. ^)
    pause
    )
    if {%allsettingerror%} gtr {3} (goto fixallsetting) else (goto Mainmenu)
echo.
:fixallsetting
rem auto fix
timeout /t 2 /nobreak >nul
SET /P selected=Automatic Repair is available. When you run Auto Repair, all previous settings are initialized and reset to default settings. Do you wish to continue? (yes or no):
if {%selected%}=={yes} (
call :Wipealldeta
echo.
echo Fix Complete.
pause
exit
)
if {%selected%}=={y} (
:overwritesetting
call :Wipealldeta
echo.
echo Fix Complete.
pause
exit
)
if {%selected%}=={no} (Mainmenuskipboot)
if {%selected%}=={n} (Mainmenuskipboot)

goto :Mainmenu


rem Preparation for menu depiction
:Mainmenu
if {%bootbatnow%}=={no} (goto Mainmenuskipboot)
if {%bootbatnow%}=={yes} (set bootbatnow=no&goto batbootanimation)
:Mainmenuskipboot
cls
setlocal disabledelayedexpansion
set wantload=
if {%runningfromfulldebug%}=={true} (set runningfromfulldebug=& exit /b)
if {%FromREConsole%}=={true} (cls&goto Cursor_Changer_REConsolemain)
set clrhelp=& set clrhelp2=
set settinghelptoggle=false
mode con: cols=75 lines=25
if {%Mainmenueaster%}=={true} (set Mainmenubuild=%batbuild%)
if {%invisiblecursor%}=={true} (echo [?25h&set invisiblecursor=&cls)
set selected=
rem menu depiction
title Cursor Changer %debugmode% 
echo                              Cursor Changer %batver% %debugmode% %Mainmenubuild%
echo.
echo   O=====================================================================O
echo   I      1Make the cursor %cursorcolor%         2calculator        3exit        I
echo   I                                                                     I
echo   I                4batch version             5settings                 I
echo   O=====================================================================O
echo.
call :MainmenuMessages
SET /P selected=Enter any number or alphabet you wish to run...:
echo.
if {%selected%}=={} (goto typosMainmenu)
if not {%selected%}=={} (echo %selected% was selected.)

rem Selection Branching
if {%selected%}=={1} (set typosWarning=0&goto :cursorchange)
if {%selected%}=={a} (set typosWarning=0&goto :cursorchange)
if {%selected%}=={2} (set typosWarning=0&goto :startcal)
if {%selected%}=={b} (set typosWarning=0&goto :startcal)
if {%selected%}=={3} (set typosWarning=0&goto :exitmenu)
if {%selected%}=={c} (set typosWarning=0&goto :exitmenu)
if {%selected%}=={4} (set typosWarning=0&goto :batver)
if {%selected%}=={d} (set typosWarning=0&goto :batver)
if {%selected%}=={5} (set typosWarning=0&goto :setting)
if {%selected%}=={e} (set typosWarning=0&goto :setting)

rem Eastereggs
if {%selected%}=={easteregg} (goto :easteregg)
if {%selected%}=={egg} (goto :secret)
if {%selected%}=={egg1} (color 1f&call :BSOD_Errors 4)
if {%selected%}=={egg2} (goto :Dogcheck)
if {%selected%}=={wwssdadaba} (set typosWarning=0&goto littleeasteregg)
if {%selected%}=={tamago1908} (echo :P&pause&goto Mainmenuboot)
if {%selected%}=={himazinnoob1908} (echo :D&pause&goto Mainmenuboot)
if {%selected%}=={mskg1908} (echo xD&pause&goto Mainmenuboot)
if {%selected%}=={1908} (goto :1908hell)
if {%selected%}=={toxic} (start chrome.exe --window-size=0,0 --incognito -- https://www.youtube.com/watch?v=N6ael_DEPcs&goto Mainmenuboot)
if {%selected%}=={abcdefu} (start chrome.exe --window-size=0,0 --incognito -- https://www.youtube.com/watch?v=qgRx58oItTk&goto Mainmenuboot)
if {%selected%}=={dogsong} (start chrome.exe --window-size=0,0 --incognito -- https://www.youtube.com/watch?v=H4wptBuM6zs&goto Mainmenuboot)
if {%selected%}=={Im tired} (echo you too&pause& goto Mainmenuboot)

rem Debugging command references (SAO refarence)
if {%selected%}=={inspectentirecommandlist} (goto :allcommands)

rem For debugging
if {%selected%}=={crashtest} (exit /b)
if {%selected%}=={alldefnow1} (goto :AllDefult1)
if {%selected%}=={playdefboot} (set typosWarning=0&cls&goto :CursorChangerOOBEdev)
if {%selected%}=={debugyesnow} (goto :darkgo)
if {%selected%}=={reload} (set bootbatnow=yes&goto batstart)
if {%selected%}=={fulldebug} (goto fulldebug)
if {%selected%}=={getadmin} (goto :batstartadm)
if {%selected%}=={bypassfirstboot} (set typosWarning=0&set firststartbat=&goto overwritesetting)
if {%selected%}=={alldefdeletebat} (set typosWarning=0&echo delete bat, confirm to type something...&pause&goto alldefdeletefinish5)
if {%selected%}=={windowsfiltertest} (goto :batbootcheckwinverbad)
if {%selected%}=={funanimationdeb} (goto :batbootanimationfun)
if {%selected%}=={openie} (goto :openiedev)
if {%selected%}=={setenter} (echo.&set /p typosWarning=pls type:&goto :Mainmenuboot)

rem FUCK YOU!!!!!!
if {%selected%}=={fucku} (echo fuck you too&pause&goto Mainmenuboot)
if {%selected%}=={fuckyou} (echo fuck you too&pause&goto Mainmenuboot)
if {%selected%}=={fucu} (echo fuck you too&pause&goto Mainmenuboot)
if {%selected%}=={fucyou} (echo fuck you too&pause&goto Mainmenuboot)

if {%selected%}=={exit} (goto :exitmenu)
if {%selected%}=={counttestdeb} (set typosWarning=0&goto :testinthecalbeep) else echo. &echo Invalid (or unusable) selection! Please enter a valid entry.&pause&goto Mainmenuboot

rem Return process if no input is made
:typosMainmenu
echo ?
echo.
pause
echo Can you type somethings?
echo.
pause
if "%setting4onoff%"=="false" (goto Mainmenuboot)

rem Mechanism for detecting long presses
set /a typosWarning=typosWarning+1
if %typosWarning% gtr 20  (goto :typosWarningtest1)
goto :Mainmenuboot

:typosWarningtest1
if not %typosWarning% gtr 50 (goto typosWarning1)
if %typosWarning% gtr 50 (goto typosWarningtest2)

:typosWarningtest2
if not %typosWarning% gtr 100 (goto typosWarning2)
if %typosWarning% gtr 100 (goto typosWarningtest3)

:typosWarningtest3
if not %typosWarning% gtr 130 (goto typosWarning3)
if %typosWarning% gtr 130 (goto typosWarningtest4)

:typosWarningtest4
if not %typosWarning% gtr 200 (goto typosWarning4)
if %typosWarning% gtr 200 (goto typosWarningtest5)

:typosWarningtest5
if not %typosWarning% gtr 250 (goto typosWarning5)
if %typosWarning% gtr 250 (goto typosWarning6)

rem Collection of long press warning messages (btw, its old code too.)
:typosWarning1
if %typosWarning% gtr 21 (goto :Mainmenuboot)
echo Dim answer:answer = MsgBox("uh, What are you doing?",vbOKCancel,"huh?"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
rem delete files, btw i found a way to dont use these vbs script, its powershell. using at easteregg.
del /Q %TEMP%\msgbox.vbs
goto :Mainmenuboot

:typosWarning2
if %typosWarning% gtr 51 (goto :Mainmenuboot)
echo Dim answer:answer = MsgBox("oh hell nah how the fuck make that many typos!",vbOKCancel,"wait..."):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
rem file delete
del /Q %TEMP%\msgbox.vbs
goto :Mainmenuboot

:typosWarning3
if %typosWarning% gtr 101 (goto :Mainmenuboot)
echo Dim answer:answer = MsgBox("Bruh you wouldn't make a hundred typing mistakes, You've got to be kidding me!",vbOKCancel,"premeditated crime"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
rem file delete
del /Q %TEMP%\msgbox.vbs
goto :Mainmenuboot

:typosWarning4
if %typosWarning% gtr 131 (goto :Mainmenuboot)
echo Dim answer:answer = MsgBox("Hey Stop Doing That!",vbOKCancel,"..."):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
rem file delete
del /Q %TEMP%\msgbox.vbs
goto :Mainmenuboot

:typosWarning5
if %typosWarning% gtr 201 (goto :Mainmenuboot)
echo Dim answer:answer = MsgBox("Do this any more and I will make you regret it. 200 times...",vbOKCancel,"Final Warning"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
rem file delete
del /Q %TEMP%\msgbox.vbs
goto :Mainmenuboot

:typosWarning6
if %typosWarning% gtr 251 (goto :Mainmenuboot)
echo Dim answer:answer = MsgBox("..........",vbOKCancel,""):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
del /Q %TEMP%\msgbox.vbs
shutdown /r /t 5 /c "REGRET IT"
taskkill /im cmd.exe
goto :reboot

:MainmenuMessages
if "%messagealreadyshowed%"=="false" (set messagealreadyshowed=true) else (exit /b)
if "%FirstCursorisEdited%"=="true" (echo                   Easy to change the FirstCursor.txt, huh?&echo.&set FirstCursorisEdited=)

if "%Updateavailable%"=="true" (
    title Cursor Changer Update Available! ^(Exprimental^)
    setlocal enabledelayedexpansion
    if "%batbeta%"=="True" (set batbetamessage=^(Tip : this version is beta, So it's probably have bugs.^))
  echo New update is available^^! ^(%updatemyversion%to %updateversion%^)
  echo do you want to update? !batbetamessage!
  set batbetamessage=
  SET /P updateselected=^(Y or N^) :
  if {!updateselected!}=={y} (set updateselected=&set updateavailable=&echo.&echo updating...&set batbootpowershell=Doupdate&call :batbootpowershell&echo update complete successfully.&pause&exit)
if {!updateselected!}=={n} (set updateselected=&set updateavailable=&echo.&echo update is canceled.&echo.&echo If you wish to disable the function to check for updates at startup, you can do so in the settings.&pause&set checkupdatetoggle=false&set messagealreadyshowed=false&exit /b)
setlocal disabledelayedexpansion
)
exit /b

:exitmenu
cls
if not defined dummy (set clr=[7m&set clred=[41m&set clrgrn=[42m&set clryel=[43m&set clrmag=[45m&set clrcyan=[46m&set clrgra=[90m&set clr2=[0m)
if {%wmodetoggle%}=={false} (set clr=[7m&set clred=[41m&set clrgrn=[42m&set clryel=[43m&set clrmag=[46m&set clrgra=[90m&set clrcyan=[46m&set clr2=[0m)
if {%wmodetoggle%}=={true} (set clr=[100m[97m&set clred=[41m&set clrgrn=[42m&set clryel=[43m&set clrmag=[45m&set clrgra=[0m[107m&set clrcyan=[46m&set clr2=[90m[107m[30m)
title Cursor Changer Shutdown %debugmode% 
set selected=
echo                              %clrgra%Cursor Changer %batver% %debugmode% %Mainmenubuild%%clr2%
echo.
echo   %clrgra%O================== %clr2%O================O%clrgra% ===============================O%clr2%
echo   %clrgra%I      1Make the cu %clr2%I Turn off batch I%clrgra% calculator        3exit        I%clr2%
echo   %clrgra%I                   %clr2%O==========O==========O===========O%clrgra%               I%clr2%
echo   %clrgra%I                4b %clr2%I     ^|    I   /~~~\  I           I%clrgra%               I%clr2%
echo   %clrgra%O================== %clr2%I   / ^| \  I  V    Å» I  ^-^-^-^-^-^-^>  I%clrgra% ==============O%clr2%
echo                       I   \___/  I   \___/  I           I       
echo                       O==========O==========O===========O
echo                       I Nothing selected...             I
echo                       O=================================O
echo.
choice /c 123adyeb /n /m "Enter the "1,2,3" or "a,d". and then press "y,e" :"
if %ErrorLevel%==1 goto exitmenu1
if %ErrorLevel%==2 goto exitmenu2
if %ErrorLevel%==3 goto exitmenu3
if %ErrorLevel%==4 goto exitmenu1
if %ErrorLevel%==5 goto exitmenu1
if %ErrorLevel%==6 goto exitmenu1
if %ErrorLevel%==7 goto exitmenu1
if %ErrorLevel%==8 goto :Mainmenu
goto :Mainmenu

:exitmenu1
cls
set selected=
echo                              %clrgra%Cursor Changer %batver% %debugmode% %Mainmenubuild%%clr2%
echo.
echo   %clrgra%O================== %clr2%O================O%clrgra% ===============================O%clr2%
echo   %clrgra%I      1Make the cu %clr2%I Turn off batch I%clrgra% calculator        3exit        I%clr2%
echo   %clrgra%I                   %clr2%O==========O==========O===========O%clrgra%               I%clr2%
echo   %clrgra%I                4b %clr2%I%clred%     ^|    %clr2%I   /~~~\  I           I%clrgra%               I%clr2%
echo   %clrgra%O================== %clr2%I%clred%   / ^| \  %clr2%I  V    Å» I  ^-^-^-^-^-^-^>  I%clrgra% ==============O%clr2%
echo                       I%clred%   \___/  %clr2%I   \___/  I           I       
echo                       O==========O==========O===========O
echo                       I Shutdown selected.              I
echo                       O=================================O
echo.
choice /c 123adyeb /n /m "Enter the "1,2,3" or "a,d". and then press "y,e" :"
if %ErrorLevel%==1 goto exitmenu1
if %ErrorLevel%==2 goto exitmenu2
if %ErrorLevel%==3 goto exitmenu3
if %ErrorLevel%==4 goto exitmenu1
if %ErrorLevel%==5 goto exitmenu2
if %ErrorLevel%==6 goto exitmenu1y
if %ErrorLevel%==7 goto exitmenu1y
if %ErrorLevel%==8 goto :Mainmenu
goto :Mainmenu

:exitmenu2
cls
set selected=
echo                              %clrgra%Cursor Changer %batver% %debugmode% %Mainmenubuild%%clr2%
echo.
echo   %clrgra%O================== %clr2%O================O%clrgra% ===============================O%clr2%
echo   %clrgra%I      1Make the cu %clr2%I Turn off batch I%clrgra% calculator        3exit        I%clr2%
echo   %clrgra%I                   %clr2%O==========O==========O===========O%clrgra%               I%clr2%
echo   %clrgra%I                4b %clr2%I     ^|    I%clrgrn%   /~~~\  %clr2%I           I%clrgra%               I%clr2%
echo   %clrgra%O================== %clr2%I   / ^| \  I%clrgrn%  V    Å» %clr2%I  ^-^-^-^-^-^-^>  I%clrgra% ==============O%clr2%
echo                       I   \___/  I%clrgrn%   \___/  %clr2%I           I       
echo                       O==========O==========O===========O
echo                       I Reboot selected.                I
echo                       O=================================O
echo.
choice /c 123adyeb /n /m "Enter the "1,2,3" or "a,d". and then press "y,e" :"
if %ErrorLevel%==1 goto exitmenu1
if %ErrorLevel%==2 goto exitmenu2
if %ErrorLevel%==3 goto exitmenu3
if %ErrorLevel%==4 goto exitmenu1
if %ErrorLevel%==5 goto exitmenu3
if %ErrorLevel%==6 goto exitmenu2y
if %ErrorLevel%==7 goto exitmenu2y
if %ErrorLevel%==8 goto :Mainmenu
goto :Mainmenu

:exitmenu3
cls
set selected=
echo                              %clrgra%Cursor Changer %batver% %debugmode% %Mainmenubuild%%clr2%
echo.
echo   %clrgra%O================== %clr2%O================O%clrgra% ===============================O%clr2%
echo   %clrgra%I      1Make the cu %clr2%I Turn off batch I%clrgra% calculator        3exit        I%clr2%
echo   %clrgra%I                   %clr2%O==========O==========O===========O%clrgra%               I%clr2%
echo   %clrgra%I                4b %clr2%I     ^|    I   /~~~\  I%clrcyan%           %clr2%I%clrgra%               I%clr2%
echo   %clrgra%O================== %clr2%I   / ^| \  I  V    Å» I%clrcyan%  ^-^-^-^-^-^-^>  %clr2%I%clrgra% ==============O%clr2%
echo                       I   \___/  I   \___/  I%clrcyan%           %clr2%I       
echo                       O==========O==========O===========O
echo                       I Exit selected.                  I
echo                       O=================================O
echo.
choice /c 123adyeb /n /m "Enter the "1,2,3" or "a,d". and then press "y,e" :"
if %ErrorLevel%==1 goto exitmenu1
if %ErrorLevel%==2 goto exitmenu2
if %ErrorLevel%==3 goto exitmenu3
if %ErrorLevel%==4 goto exitmenu2
if %ErrorLevel%==5 goto exitmenu3
if %ErrorLevel%==6 call :exitmenuexit&goto mainmenuboot
if %ErrorLevel%==7 call :exitmenuexit&goto mainmenuboot
if %ErrorLevel%==8 goto :Mainmenu
goto :Mainmenu


rem confirm

:exitmenu1y
cls
set selected=
echo                              %clrgra%Cursor Changer %batver% %debugmode% %Mainmenubuild%%clr2%
echo.
echo   %clrgra%O================== %clr2%O================O%clrgra% ===============================O%clr2%
echo   %clrgra%I      1Make the cu %clr2%I Turn off batch I%clrgra% calculator        3exit        I%clr2%
echo   %clrgra%I                   %clr2%O==========O==========O===========O%clrgra%               I%clr2%
echo   %clrgra%I                4b %clr2%I%clred%     ^|    %clr2%I   /~~~\  I           I%clrgra%               I%clr2%
echo   %clrgra%O================== %clr2%I%clred%   / ^| \  %clr2%I  V    Å» I  ^-^-^-^-^-^-^>  I%clrgra% ==============O%clr2%
echo                       I%clred%   \___/  %clr2%I   \___/  I           I       
echo                       O==========O==========O===========O
echo                       I Confirm?                        I
echo                       O=================================O
echo.
choice /c 123adyeb /n /m "Enter the "1,2,3" or "a,d". and then press "y,e" :"
if %ErrorLevel%==1 goto exitmenu1
if %ErrorLevel%==2 goto exitmenu2
if %ErrorLevel%==3 goto exitmenu3
if %ErrorLevel%==4 goto exitmenu1
if %ErrorLevel%==5 goto exitmenu2
if %ErrorLevel%==6 goto batshutdown
if %ErrorLevel%==7 goto batshutdown
if %ErrorLevel%==8 goto exitmenu1
goto :Mainmenu

:exitmenu2y
cls
set selected=
echo                              %clrgra%Cursor Changer %batver% %debugmode% %Mainmenubuild%%clr2%
echo.
echo   %clrgra%O================== %clr2%O================O%clrgra% ===============================O%clr2%
echo   %clrgra%I      1Make the cu %clr2%I Turn off batch I%clrgra% calculator        3exit        I%clr2%
echo   %clrgra%I                   %clr2%O==========O==========O===========O%clrgra%               I%clr2%
echo   %clrgra%I                4b %clr2%I     ^|    I%clrgrn%   /~~~\  %clr2%I           I%clrgra%               I%clr2%
echo   %clrgra%O================== %clr2%I   / ^| \  I%clrgrn%  V    Å» %clr2%I  ^-^-^-^-^-^-^>  I%clrgra% ==============O%clr2%
echo                       I   \___/  I%clrgrn%   \___/  %clr2%I           I       
echo                       O==========O==========O===========O
echo                       I Confirm?                        I
echo                       O=================================O
echo.
choice /c 123adyeb /n /m "Enter the "1,2,3" or "a,d". and then press "y,e" :"
if %ErrorLevel%==1 goto exitmenu1
if %ErrorLevel%==2 goto exitmenu2
if %ErrorLevel%==3 goto exitmenu3
if %ErrorLevel%==4 goto exitmenu1
if %ErrorLevel%==5 goto exitmenu3
if %ErrorLevel%==6 (call :exitmenuexit &goto :Rebootbatch)
if %ErrorLevel%==7 (call :exitmenuexit &goto :Rebootbatch)
if %ErrorLevel%==8 goto exitmenu2
goto :Mainmenu


:batshutdown
if not defined invisiblecursor (echo [?25l&set invisiblecursor=true)
title BYE
cls
echo.
echo                            Cursor Changer %batver% %debugmode%
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
echo                                                Shut Down...
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



rem Depiction of the settings menu
:setting
set wantload=
set settinghelptoggle=false
if not defined dummy (set clr=[7m&set clr2=[0m)
if {%wmodetoggle%}=={false} (set clr=[7m&set clr2=[0m)
if {%wmodetoggle%}=={true} (set clr=[100m[97m&set clr2=[0m[107m[30m)
rem Detect if a Setting file exists
cd /d %batchmainpath%
rem Location The drive where the OS is located C:\Users\Username
rem (e.g. if the user's name is "test" and the OS is in drive "C:\" C:\Users\Test)
if not exist CursorChangerSettings.txt (goto dogcheck)
title Cursor Changer Setting %debugmode%
set selected=
if not defined {%clrgra%} (set clrgra=[90m)
Cls
Echo.
Echo                               Setting menu ver2!!!
echo. 
echo O========================O                 O=========O
echo I        Category        I                 I setting I
echo O========================O=================O=========O====================O
echo I                        I                                                I
echo I Cursor Changer Feature I  Category has not selected...                  I
echo I                        I                                                I
echo O========================I                                                I
Echo O  Category  up or down  I                                                I
Echo O========================I                                                I
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
if %ErrorLevel%==1 goto settingcategory1
if %ErrorLevel%==2 goto settingcategory2
if %ErrorLevel%==3 goto settingcategory1
if %ErrorLevel%==4 goto settingcategory1
if %ErrorLevel%==5 goto settingcategory1
if %ErrorLevel%==6 goto Mainmenuboot
if %ErrorLevel%==7 goto settingcategory1
if %ErrorLevel%==8 goto settingcategory1
if %ErrorLevel%==9 goto settingcategoryhelpmode

:settingcategory1
title Cursor Changer Setting %debugmode%
set selected=
Cls
Echo.
Echo                               Setting menu ver2!!!
echo. 
echo O========================O                 O=========O
echo I        Category        I                 I setting I
echo O========================O=================O=========O====================O
echo I%clr%                        %clr2%I                                                I
echo I%clr% Cursor Changer Feature %clr2%I  This Category is related to the functionality I
echo I%clr%                        %clr2%I  setting of the Cursor Changer.                I
echo O========================I                                                I
Echo O  category  up or down  I                                                I
Echo O========================I                                                I
Echo I                        I                                                I
echo I Cursor Changer Visuals I                                                I
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
if %ErrorLevel%==6 goto Mainmenuboot
if %ErrorLevel%==7 goto settingcategory1int
if %ErrorLevel%==8 goto settingcategory1int
if %ErrorLevel%==9 goto settingcategoryhelpmode

:settingcategory2
rem Detect if a Setting file exists
cd /d %batchmainpath%
rem Location The drive where the OS is located C:\Users\Username
rem (e.g. if the user's name is "test" and the OS is in drive "C:\" C:\Users\Test)
if not exist CursorChangerSettings.txt (goto dogcheck)
title Cursor Changer Setting %debugmode%
set selected=
if not defined {%clrgra%} (set clrgra=[90m)
Cls
Echo.
Echo                               Setting menu ver2!!!
echo. 
echo O========================O                 O=========O
echo I        Category        I                 I setting I
echo O========================O=================O=========O====================O
echo I                        I                                                I
echo I Cursor Changer Feature I  This Category is related to the visuality     I
echo I                        I  setting of the Cursor Changer.                I
echo O========================I  %clrgra%(like theme)%clr2%                                  I
Echo O  category  up or down  I                                                I
Echo O========================I                                                I
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
if %ErrorLevel%==1 goto settingcategory1
if %ErrorLevel%==2 goto settingcategory2
if %ErrorLevel%==3 goto settingcategory1
if %ErrorLevel%==4 goto settingcategoryhelpmode
if %ErrorLevel%==5 goto settingcategory2int
if %ErrorLevel%==6 goto Mainmenuboot
if %ErrorLevel%==7 goto settingcategory2int
if %ErrorLevel%==8 goto settingcategory2int
if %ErrorLevel%==9 goto settingcategoryhelpmode

rem categoryì‡ïî

:settingcategory1int
title Cursor Changer Setting %debugmode%
set selected=
Cls
Echo.
Echo                               Setting menu ver2!!!
echo. 
echo O========================O                 O=========O
echo I        Category        I                 I setting I
echo O========================O=================O=========O=========O==========O
echo I%clr%                        %clr2%I 1 Confirm reboot when Changed       I  %setting1onoff%   I
echo I%clr% Cursor Changer Feature %clr2%I                                     O==========O
echo I%clr%                        %clr2%I 2 Admin When Boot                   I  %setting2onoff%   I
echo O========================I                                     O==========O
Echo O  category  up or down  I 3 Check Update at boot              I  %setting3onoff%   I
Echo O========================I                                     O==========O
Echo I                        I 4 Long press detection of enter     I  %setting4onoff%   I
echo I Cursor Changer Visuals I                                     O==========O
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
title Cursor Changer Setting %debugmode%
set selected=
Cls
Echo.
Echo                               Setting menu ver2!!!
echo. 
echo O========================O                 O=========O
echo I        Category        I                 I setting I
echo O========================O=================O=========O=========O==========O
echo I%clr%                        %clr2%I %clr%1 Confirm reboot when Changed%clr2%       I  %setting1onoff%   I
echo I%clr% Cursor Changer Feature %clr2%I                                     O==========O
echo I%clr%                        %clr2%I 2 Admin When Boot                   I  %setting2onoff%   I
echo O========================I                                     O==========O
Echo O  category  up or down  I 3 Check Update at boot              I  %setting3onoff%   I
Echo O========================I                                     O==========O
Echo I                        I 4 Long press detection of enter     I  %setting4onoff%   I
echo I Cursor Changer Visuals I                                     O==========O
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
title Cursor Changer Setting %debugmode%
set selected=
Cls
Echo.
Echo                               Setting menu ver2!!!
echo. 
echo O========================O                 O=========O
echo I        Category        I                 I setting I
echo O========================O=================O=========O=========O==========O
echo I%clr%                        %clr2%I 1 Confirm reboot when Changed       I  %setting1onoff%   I
echo I%clr% Cursor Changer Feature %clr2%I                                     O==========O
echo I%clr%                        %clr2%I %clr%2 Admin When Boot%clr2%                   I  %setting2onoff%   I
echo O========================I                                     O==========O
Echo O  category  up or down  I 3 Check Update at boot              I  %setting3onoff%   I
Echo O========================I                                     O==========O
Echo I                        I 4 Long press detection of enter     I  %setting4onoff%   I
echo I Cursor Changer Visuals I                                     O==========O
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
title Cursor Changer Setting %debugmode%
set selected=
Cls
Echo.
Echo                               Setting menu ver2!!!
echo. 
echo O========================O                 O=========O
echo I        Category        I                 I setting I
echo O========================O=================O=========O=========O==========O
echo I%clr%                        %clr2%I 1 Confirm reboot when Changed       I  %setting1onoff%   I
echo I%clr% Cursor Changer Feature %clr2%I                                     O==========O
echo I%clr%                        %clr2%I 2 Admin When Boot                   I  %setting2onoff%   I
echo O========================I                                     O==========O
Echo O  category  up or down  I %clr%3 Check Update at boot%clr2%              I  %setting3onoff%   I
Echo O========================I                                     O==========O
Echo I                        I 4 Long press detection of enter     I  %setting4onoff%   I
echo I Cursor Changer Visuals I                                     O==========O
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
title Cursor Changer Setting %debugmode%
set selected=
Cls
Echo.
Echo                               Setting menu ver2!!!
echo. 
echo O========================O                 O=========O
echo I        Category        I                 I setting I
echo O========================O=================O=========O=========O==========O
echo I%clr%                        %clr2%I 1 Confirm reboot when Changed       I  %setting1onoff%   I
echo I%clr% Cursor Changer Feature %clr2%I                                     O==========O
echo I%clr%                        %clr2%I 2 Admin When Boot                   I  %setting2onoff%   I
echo O========================I                                     O==========O
Echo O  category  up or down  I 3 Check Update at boot              I  %setting3onoff%   I
Echo O========================I                                     O==========O
Echo I                        I %clr%4 Long press detection of enter%clr2%     I  %setting4onoff%   I
echo I Cursor Changer Visuals I                                     O==========O
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
title Cursor Changer Setting %debugmode%
set selected=
Cls
Echo.
Echo                               Setting menu ver2!!!
echo. 
echo O========================O                 O=========O
echo I        Category        I                 I setting I
echo O========================O=================O=========O=========O==========O
echo I%clr%                        %clr2%I 1 Confirm reboot when Changed       I  %setting1onoff%   I
echo I%clr% Cursor Changer Feature %clr2%I                                     O==========O
echo I%clr%                        %clr2%I 2 Admin When Boot                   I  %setting2onoff%   I
echo O========================I                                     O==========O
Echo O  category  up or down  I 3 Check Update at boot              I  %setting3onoff%   I
Echo O========================I                                     O==========O
Echo I                        I 4 Long press detection of enter     I  %setting4onoff%   I
echo I Cursor Changer Visuals I                                     O==========O
echo I                        I %clr%5 Initialization or Uninstallation%clr2%             I
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
title Cursor Changer Setting %debugmode%
set selected=
Cls
Echo.
Echo                               Setting menu ver2!!!
echo. 
echo O========================O                 O=========O
echo I        Category        I                 I setting I
echo O========================O=================O=========O=========O==========O
echo I                        I 1 Boot animation Settings           I     ^>    I
echo I Cursor Changer Feature I                                     O==========O
echo I                        I 2 %wmodeonoff%                         I
echo O========================I                                                I
Echo O  category  up or down  I                                                I
Echo O========================I                                                I
Echo I%clr%                        %clr2%I                                                I
echo I%clr% Cursor Changer Visuals %clr2%I                                                I
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
set sc2s5s1lock=&set sc2s5s2lock=&set sc2s5s3lock=&set sc2s5s1lock2=&set sc2s5s2lock2=&set sc2s5s3lock2=&set setting5_stg_whereyou=
title Cursor Changer Setting %debugmode%
set selected=
Cls
Echo.
Echo                               Setting menu ver2!!!
echo. 
echo O========================O                 O=========O
echo I        Category        I                 I setting I
echo O========================O=================O=========O=========O==========O
echo I                        I %clr%1 Boot animation Settings%clr2%           I     ^>    I
echo I Cursor Changer Feature I                                     O==========O
echo I                        I 2 %wmodeonoff%                         I
echo O========================I                                                I
Echo O  category  up or down  I                                                I
Echo O========================I                                                I
Echo I%clr%                        %clr2%I                                                I
echo I%clr% Cursor Changer Visuals %clr2%I                                                I
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
if %ErrorLevel%==7 goto settingcategory2intsetting5_stg0
if %ErrorLevel%==8 goto settingcategory2intsetting5_stg0

:settingcategory2intsetting2
title Cursor Changer Setting %debugmode%
set selected=
Cls
Echo.
Echo                               Setting menu ver2!!!
echo. 
echo O========================O                 O=========O
echo I        Category        I                 I setting I
echo O========================O=================O=========O=========O==========O
echo I                        I 1 Boot animation Settings           I     ^>    I
echo I Cursor Changer Feature I                                     O==========O
echo I                        I %clr%2 %wmodeonoff%%clr2%                         I
echo O========================I                                                I
Echo O  category  up or down  I                                                I
Echo O========================I                                                I
Echo I%clr%                        %clr2%I                                                I
echo I%clr% Cursor Changer Visuals %clr2%I                                                I
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



:settingcategory2intsetting5_stg0
set setting5_stg_whereyou=stg0
title Cursor Changer Setting %debugmode%
call :settingcategory2intsetting5blockcheck
set selected=
Cls
Echo.
Echo                               Setting menu ver2!!!
echo. 
echo O========================O                 O=========O O==================O
echo I        Category        I                 I setting I I Setting5/...     I
echo O========================O=================O=========O=O=======O==========O
echo I                        I %clr%1 Boot animation%clr2%                    I   %setting5onoff%  I
echo I Cursor Changer Feature I                                     O==========O
echo I                        I %sc2s5s1lock%2 Linux-ish Boot animation%sc2s5s1lock2%          I   %setting5_s1onoff%  I
echo O========================I                                     O==========O
Echo O  category  up or down  I %sc2s5s2lock%3 Simple boot animation%sc2s5s2lock2%             I   %setting5_s2onoff%  I
Echo O========================I                                     O==========O
Echo I%clr%                        %clr2%I %sc2s5s3lock%4 Raw Boot animation%sc2s5s3lock2%                I   %setting5_s3onoff%  I
echo I%clr% Cursor Changer Visuals %clr2%I                                     O==========O
echo I%clr%                        %clr2%I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%       Help  Mode       %clrhelp2%I  I  Move: W A S D  Num I Back : B I Slct : Y E I
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
if "%setting5onoff%"=="false" if "%setting5_stg_whereyou%"=="stg2" (goto :settingcategory2intsetting5_stg0) else if "%setting5onoff%"=="false" if "%setting5_stg_whereyou%"=="stg0" (goto :settingcategory2intsetting5_stg2)
if "%simpleboot%"=="true" if "%setting5_stg_whereyou%"=="stg0" (goto :settingcategory2intsetting5_stg2) else if "%setting5_stg_whereyou%"=="stg2" (goto :settingcategory2intsetting5_stg0)
if "%rawboot%"=="true" if "%setting5_stg_whereyou%"=="stg3" (goto :settingcategory2intsetting5_stg3) else if "%setting5_stg_whereyou%"=="stg0" (goto :settingcategory2intsetting5_stg3)
set setting5_stg_whereyou=stg1
title Cursor Changer Setting %debugmode%
call :settingcategory2intsetting5blockcheck
set selected=
Cls
Echo.
Echo                               Setting menu ver2!!!
echo. 
echo O========================O                 O=========O O==================O
echo I        Category        I                 I setting I I Setting5/...     I
echo O========================O=================O=========O=O=======O==========O
echo I                        I 1 Boot animation                    I   %setting5onoff%  I
echo I Cursor Changer Feature I                                     O==========O
echo I                        I %clr%2 Linux-ish Boot animation%clr2%          I   %setting5_s1onoff%  I
echo O========================I                                     O==========O
Echo O  category  up or down  I %sc2s5s2lock%3 Simple boot animation%sc2s5s2lock2%             I   %setting5_s2onoff%  I
Echo O========================I                                     O==========O
Echo I%clr%                        %clr2%I %sc2s5s3lock%4 Raw Boot animation%sc2s5s3lock2%                I   %setting5_s3onoff%  I
echo I%clr% Cursor Changer Visuals %clr2%I                                     O==========O
echo I%clr%                        %clr2%I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%       Help  Mode       %clrhelp2%I  I  Move: W A S D  Num I Back : B I Slct : Y E I
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
Echo                               Setting menu ver2!!!
echo. 
echo O========================O                 O=========O O==================O
echo I        Category        I                 I setting I I Setting5/...     I
echo O========================O=================O=========O=O=======O==========O
echo I                        I 1 Boot animation                    I   %setting5onoff%  I
echo I Cursor Changer Feature I                                     O==========O
echo I                        I %sc2s5s1lock%2 Linux-ish Boot animation%sc2s5s1lock2%          I   %setting5_s1onoff%  I
echo O========================I                                     O==========O
Echo O  category  up or down  I %clr%3 Simple boot animation%clr2%             I   %setting5_s2onoff%  I
Echo O========================I                                     O==========O
Echo I%clr%                        %clr2%I %sc2s5s3lock%4 Raw Boot animation%sc2s5s3lock2%                I   %setting5_s3onoff%  I
echo I%clr% Cursor Changer Visuals %clr2%I                                     O==========O
echo I%clr%                        %clr2%I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%       Help  Mode       %clrhelp2%I  I  Move: W A S D  Num I Back : B I Slct : Y E I
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
if "%setting5onoff%"=="false" if "%setting5_stg_whereyou%"=="stg0" (goto :settingcategory2intsetting5_stg0) else if "%setting5_stg_whereyou%"=="stg2" (goto :settingcategory2intsetting5_stg2)
if "%linuxboot%"=="true" if "%setting5_stg_whereyou%"=="stg1" (goto :settingcategory2intsetting5_stg1)
if "%simpleboot%"=="true" if "%setting5_stg_whereyou%"=="stg2" (goto :settingcategory2intsetting5_stg2) else if "%setting5_stg_whereyou%"=="stg0" (goto :settingcategory2intsetting5_stg0)
set setting5_stg_whereyou=stg3
title Cursor Changer Setting %debugmode%
call :settingcategory2intsetting5blockcheck
set selected=
Cls
Echo.
Echo                               Setting menu ver2!!!
echo. 
echo O========================O                 O=========O O==================O
echo I        Category        I                 I setting I I Setting5/...     I
echo O========================O=================O=========O=O=======O==========O
echo I                        I 1 Boot animation                    I   %setting5onoff%  I
echo I Cursor Changer Feature I                                     O==========O
echo I                        I %sc2s5s1lock%2 Linux-ish Boot animation%sc2s5s1lock2%          I   %setting5_s1onoff%  I
echo O========================I                                     O==========O
Echo O  category  up or down  I %sc2s5s2lock%3 Simple boot animation%sc2s5s2lock2%             I   %setting5_s2onoff%  I
Echo O========================I                                     O==========O
Echo I%clr%                        %clr2%I %clr%4 Raw Boot animation%clr2%                I   %setting5_s3onoff%  I
echo I%clr% Cursor Changer Visuals %clr2%I                                     O==========O
echo I%clr%                        %clr2%I                                                I
echo O========================O==O=====================O==========O============O
echo I%clrhelp%       Help  Mode       %clrhelp2%I  I  Move: W A S D  Num I Back : B I Slct : Y E I
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
if {%settinghelptoggle%}=={true} (set settinghelp=enabled. )
if {%settinghelptoggle%}=={false} (set settinghelp=disabled.)
title Cursor Changer Setting %debugmode%
set selected=
if not defined {%clrgra%} (set clrgra=[90m)
if {%settinghelptoggle%}=={true} (set clr=[46m)
Cls
echo.
Echo                               Setting menu ver2!!!
echo. 
echo O========================O                 O=========O
echo I        Category        I                 I setting I
echo O========================O=================O=========O====================O
echo I                        I                                                I
echo I Cursor Changer Feature I  Help Mode. After selecting this function,     I
echo I                        I  Select the you want to see an overview of it, I
echo O========================I  You can see an overview of it.                I
Echo O  category  up or down  I                                                I
Echo O========================I  If you want to disable help mode,             I
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
if {%wmodetoggle%}=={false} (set clr=[7m&set clr2=[0m)
if {%wmodetoggle%}=={true} (set clr=[100m[97m&set clr2=[0m[107m[30m)
if %ErrorLevel%==1 goto settingcategory1
if %ErrorLevel%==2 goto settingcategory2
if %ErrorLevel%==3 goto settingcategory2
if %ErrorLevel%==4 goto settingcategoryhelpmode
if %ErrorLevel%==5 goto Mainmenuboot
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



:setting1
rem Apply and verify rem settings
rem Verifying the existence of rem settings:setting1
rem by the way, why this code is so goofy
rem i know why. becouse ITS OLD CODE!!!!!!!!

if {%settinghelptoggle%}=={true} (goto setting1help)
find "rebootokey=false" CursorChangerSettings.txt > nul
if %ErrorLevel%==0 set setting1setonoff=enable& goto setting1okey
if %ErrorLevel%==1 set setting1setonoff=Repair& goto setting1onoff

:setting1onoff
find "rebootokey=true" CursorChangerSettings.txt > nul
if %ErrorLevel%==0 set setting1setonoff=disable

:setting1okey
cls
set selected=
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
call :MOBAS_Loader
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
call :MOBAS_Loader
Goto settingcategory1intsetting2

:setting2n
cls
Echo Did not change settings.
Pause
goto settingcategory1intsetting2

:setting3
if {%settinghelptoggle%}=={true} (goto setting3help)
find "CheckUpdate=false" CursorChangerSettings.txt > nul
if %ErrorLevel%==0 set setting3setonoff=enable& goto setting3onoff
if %ErrorLevel%==1 set setting3setonoff=Repair&goto setting3onoff

:setting3onoff
find "CheckUpdate=true" CursorChangerSettings.txt > nul
if %ErrorLevel%==0 set setting3setonoff=disable&set setting3warning=
:setting3okey
cls
echo Do you want to set Check update at boot to be %setting3setonoff%? (Y=Yes N=No B=Back)
SET /P selected= :
echo %selected% has selected
if {%selected%}=={y} (goto :setting3y)
if {%selected%}=={n} (goto :setting3n)
if {%selected%}=={back} (goto :settingcategory1intsetting3)
if {%selected%}=={b} (goto :settingcategory1intsetting3)
goto setting3okey

:setting3y
find "CheckUpdate=false" CursorChangerSettings.txt > nul
echo Applying settings...

if %ErrorLevel%==1 goto setting3ygo3test
if %ErrorLevel%==0 goto setting3ygo1

:setting3ygo3test
find "CheckUpdate=true" CursorChangerSettings.txt > nul
if %ErrorLevel%==1 echo CheckUpdate=false >> CursorChangerSettings.txt
if %ErrorLevel%==0 goto setting3ygo2

:setting3ygo2
powershell "(gc CursorChangerSettings.txt) -replace 'CheckUpdate=true','CheckUpdate=false' | sc CursorChangerSettings.txt"
goto setting3yokey

:setting3ygo1
powershell "(gc CursorChangerSettings.txt) -replace 'CheckUpdate=false','CheckUpdate=true' | sc CursorChangerSettings.txt"
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
call :MOBAS_Loader
Goto settingcategory1intsetting3

:setting4
if {%settinghelptoggle%}=={true} (goto setting4help)
find "typosWarning=false" CursorChangerSettings.txt > nul
if %ErrorLevel%==0 set setting4setonoff=enable&goto setting4okey
if %ErrorLevel%==1 set setting4setonoff=Repair&goto setting4onoff

:setting4onoff
find "typosWarning=true" CursorChangerSettings.txt > nul
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
find "typosWarning=false" CursorChangerSettings.txt > nul
echo Applying settings...

if %ErrorLevel%==1 goto setting4ygo3test
if %ErrorLevel%==0 goto setting4ygo1

:setting4ygo3test
find "typosWarning=true" CursorChangerSettings.txt > nul
if %ErrorLevel%==1 echo typosWarning=true >> CursorChangerSettings.txt
if %ErrorLevel%==0 goto setting4ygo2

:setting4ygo2
powershell "(gc CursorChangerSettings.txt) -replace 'typosWarning=true','typosWarning=false' | sc CursorChangerSettings.txt"
goto setting4yokey

:setting4ygo1
powershell "(gc CursorChangerSettings.txt) -replace 'typosWarning=false','typosWarning=true' | sc CursorChangerSettings.txt"
goto setting4yokey

:setting4yokey
cls
Echo The change was made successfully.
Pause
set wantload=setting4
call :MOBAS_Loader
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
if {%selected%}=={back} (goto :settingcategory2intsetting5_stg0)
if {%selected%}=={b} (goto :settingcategory2intsetting5_stg0)
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
call :MOBAS_Loader
Goto settingcategory2intsetting5_stg0

:setting5n
cls
Echo Did not change settings.
Pause
goto settingcategory2intsetting5_stg0


:setting5_1
if {%settinghelptoggle%}=={true} (goto setting5_1help)
find "s5_linuxboot=false" CursorChangerSettings.txt > nul
if %ErrorLevel%==0 set setting5_1setonoff=enable&goto setting5_1okey
if %ErrorLevel%==1 set setting5_1setonoff=Repair&goto setting5_1onoff

:setting5_1onoff
find "s5_linuxboot=true" CursorChangerSettings.txt > nul
if %ErrorLevel%==0 set setting5_1setonoff=disbale

:setting5_1okey
cls
echo Do you want the linux-ish boot animation to be %setting5_1setonoff%? (Y=Yes N=No B=Back)
SET /P selected= :
echo %selected% has selected.
if {%selected%}=={y} (goto :setting5_1y)
if {%selected%}=={n} (goto :setting5_1n)
if {%selected%}=={back} (goto :settingcategory2intsetting5_stg0)
if {%selected%}=={b} (goto :settingcategory2intsetting5_stg0)
goto setting5_1okey

:setting5_1y
find "s5_linuxboot=false" CursorChangerSettings.txt > nul
echo Applying settings...

if %ErrorLevel%==1 goto setting5_1ygo3test
if %ErrorLevel%==0 goto setting5_1ygo1

:setting5_1ygo3test
find "s5_linuxboot=true" CursorChangerSettings.txt > nul
if %ErrorLevel%==1 echo s5_linuxboot=false >> CursorChangerSettings.txt
if %ErrorLevel%==0 goto setting5_1ygo2

:setting5_1ygo2
powershell "(gc CursorChangerSettings.txt) -replace 's5_linuxboot=true','s5_linuxboot=false' | sc CursorChangerSettings.txt"
set linuxboot=false
goto setting5_1yokey

:setting5_1ygo1
powershell "(gc CursorChangerSettings.txt) -replace 's5_linuxboot=false','s5_linuxboot=true' | sc CursorChangerSettings.txt"
set linuxboot=true
goto setting5_1yokey

:setting5_1yokey
cls
Echo The change was made successfully.
Pause
set wantload=setting5_1
call :MOBAS_Loader
Goto settingcategory2intsetting5_stg1

:setting5_1n
cls
Echo Did not change settings.
Pause
goto settingcategory2intsetting5_stg1


:setting5_2
if {%settinghelptoggle%}=={true} (goto setting5_2help)
find "s5_simpleboot=false" CursorChangerSettings.txt > nul
if %ErrorLevel%==0 set setting5_2setonoff=enable&goto setting5_2okey
if %ErrorLevel%==1 set setting5_2setonoff=Repair&goto setting5_2onoff

:setting5_2onoff
find "s5_simpleboot=true" CursorChangerSettings.txt > nul
if %ErrorLevel%==0 set setting5_2setonoff=disbale

:setting5_2okey
cls
echo Do you want the simple boot animation to be %setting5_2setonoff%? (Y=Yes N=No B=Back)
SET /P selected= :
echo %selected% has selected.
if {%selected%}=={y} (goto :setting5_2y)
if {%selected%}=={n} (goto :setting5_2n)
if {%selected%}=={back} (goto :settingcategory2intsetting5_stg1)
if {%selected%}=={b} (goto :settingcategory2intsetting5_stg1)
goto setting5_2okey

:setting5_2y
find "s5_simpleboot=false" CursorChangerSettings.txt > nul
echo Applying settings...

if %ErrorLevel%==1 goto setting5_2ygo3test
if %ErrorLevel%==0 goto setting5_2ygo1

:setting5_2ygo3test
find "s5_simpleboot=true" CursorChangerSettings.txt > nul
if %ErrorLevel%==1 echo s5_simpleboot=false >> CursorChangerSettings.txt
if %ErrorLevel%==0 goto setting5_2ygo2

:setting5_2ygo2
powershell "(gc CursorChangerSettings.txt) -replace 's5_simpleboot=true','s5_simpleboot=false' | sc CursorChangerSettings.txt"
set simpleboot=false
goto setting5_2yokey

:setting5_2ygo1
powershell "(gc CursorChangerSettings.txt) -replace 's5_simpleboot=false','s5_simpleboot=true' | sc CursorChangerSettings.txt"
set simpleboot=true
goto setting5_2yokey

:setting5_2yokey
cls
Echo The change was made successfully.
Pause
set wantload=setting5_2
call :MOBAS_Loader
Goto settingcategory2intsetting5_stg2

:setting5_2n
cls
Echo Did not change settings.
Pause
goto settingcategory2intsetting5_stg2



:setting5_3
if {%settinghelptoggle%}=={true} (goto setting5_3help)
find "s5_rawboot=false" CursorChangerSettings.txt > nul
if %ErrorLevel%==0 set setting5_3setonoff=enable&goto setting5_3okey
if %ErrorLevel%==1 set setting5_3setonoff=Repair&goto setting5_3onoff

:setting5_3onoff
find "s5_rawboot=true" CursorChangerSettings.txt > nul
if %ErrorLevel%==0 set setting5_3setonoff=disbale

:setting5_3okey
cls
echo Do you want the raw boot animation to be %setting5_3setonoff%? (Y=Yes N=No B=Back)
SET /P selected= :
echo %selected% has selected.
if {%selected%}=={y} (goto :setting5_3y)
if {%selected%}=={n} (goto :setting5_3n)
if {%selected%}=={back} (goto :settingcategory2intsetting5_stg3)
if {%selected%}=={b} (goto :settingcategory2intsetting5_stg3)
goto setting5_3okey

:setting5_3y
find "s5_rawboot=false" CursorChangerSettings.txt > nul
echo Applying settings...

if %ErrorLevel%==1 goto setting5_3ygo3test
if %ErrorLevel%==0 goto setting5_3ygo1

:setting5_3ygo3test
find "s5_rawboot=true" CursorChangerSettings.txt > nul
if %ErrorLevel%==1 echo s5_rawboot=false >> CursorChangerSettings.txt
if %ErrorLevel%==0 goto setting5_3ygo2

:setting5_3ygo2
powershell "(gc CursorChangerSettings.txt) -replace 's5_rawboot=true','s5_rawboot=false' | sc CursorChangerSettings.txt"
set rawboot=false
goto setting5_3yokey

:setting5_3ygo1
powershell "(gc CursorChangerSettings.txt) -replace 's5_rawboot=false','s5_rawboot=true' | sc CursorChangerSettings.txt"
set rawboot=true
goto setting5_3yokey

:setting5_3yokey
cls
Echo The change was made successfully.
Pause
set wantload=setting5_3
call :MOBAS_Loader
Goto settingcategory2intsetting5_stg3

:setting5_3n
cls
Echo Did not change settings.
Pause
goto settingcategory2intsetting5_stg3


:wmode
if {%settinghelptoggle%}=={true} (goto wmodehelp)
cd /d %batchmainpath%
:wmodetest
find "wmode=false" CursorChangerSettings.txt > nul
if %ErrorLevel%==0 set wmodesetonoff=white
if %ErrorLevel%==1 set wmodesetonoff=Repair the theme settings and restore the normal& goto wmodeonoff

:wmodeonoff
find "wmode=true" CursorChangerSettings.txt > nul
if %ErrorLevel%==0 set wmodesetonoff=dark

cls
echo Do you want to change to %wmodesetonoff% theme? (Y=Yes N=No B=Back)
SET /P selected= :
rem theme branching
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
if %ErrorLevel%==1 goto wmodeonoffdetect
:wmodeonoffdetect
find "wmode=true" CursorChangerSettings.txt > nul
if %ErrorLevel%==0 color f0
cls
echo Successfully Changed to %wmodesetonoff% theme.
Pause
set wantload=wmode
call :MOBAS_Loader
if {%wmodetoggle%}=={false} (set clr=[7m&set clr2=[0m)
if {%wmodetoggle%}=={true} (set clr=[100m[97m&set clr2=[0m[107m[30m)
Goto settingcategory2intsetting2

:no01
cls
echo No changes were made to the %wmodesetonoff% theme.
pause
Goto :settingcategory2intsetting2

rem setting help txt 
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
echo This setting enables or disables the ability to check for updates when Cursor Changer is booted.
echo If this feature is turned on, updates will be checked every time this batch is booted, and if updates are available, they will be applied as they are.
echo However, this feature is not available when there is no Internet connection, and depending on the speed of the Internet connection, the boot up speed may be reduced.
echo In addition, the hourly If you repeat launching more than 50 times, you may reach the API rate limit of github.
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
goto settingcategory2intsetting5_stg0

:setting5_1help
cls
echo This setting allows a Linux-like startup animation to be played.
echo it is easy to see that the system is starting up and looks good. Also, when an error occurs during startup, it may be easier to see where the error occurred.
echo This setting cannot be used with simpleboot and rawboot.
echo This setting is false by default.
pause
goto settingcategory2intsetting5_stg1

:setting5_2help
cls
echo This setting allows only "booting up" to be displayed at startup.
echo It is very fast, simple and unobtrusive. However, it can be makes you little boring.
echo This setting is false by default.
pause
goto settingcategory2intsetting5_stg2

:setting5_3help
cls
echo This setting is to start within the "echo on" state at startup.
echo It is simple, easy to understand, and shows at a glance what is currently being executed. It also makes you feel like a hacker.
echo This setting cannot be used with linuxboot and rawboot.
echo This setting is false by default.
pause
goto settingcategory2intsetting5_stg3

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
echo This menu contains functions to display the path to the Setting file (the text file in which the settings are recorded) and to initialize (set to default) the settings.
echo If uninstallation is performed, the Cursor Changer itself will be removed and (optional) cursors will be removed by default. (Optional) The Setting and files for detecting the first startup will also be completely removed.
echo Please do so at your own risk.
pause
goto settingcategory1intsetting5

rem Version of batch
:batver
title Cursor Changer version (experimental)
if {%batverdev%}=={beta} (set batverdevshow= Beta )
if {%batverdev%}=={stable} (set batverdevshow=Stable)
echo.
echo.
echo     by tamago_1908   2021-2024
echo     O========================================O
echo     I                                        I
echo     I      Cursor Changer %batverdevshow% Version     I
echo     I                                        I
echo     O========================================O 
echo           Version : %batver%  %batbuild%
echo.
echo do you want to check the update?
set /p selected=Y or N : 
if {%selected%}=={y} (goto batverupdate) else if {%selected%}=={yes} (goto batverupdate) else if {%selected%}=={n} (goto mainmenu) else if {%selected%}=={no} (goto mainmenu) else (echo what??? y or n &pause&cls&goto batver )
pause
cls
set batverdevshow=
goto Mainmenuboot

:batverupdate
cd %~dp0
echo starting update process...
:updatecode
set batbootpowershell=Fullupdater
call :batbootpowershell
pause
goto mainmenu

rem calculator
:startcal
set q=0
set number1=0
set number2=0
set number3=0
cls
echo Calculations up to the value of 2147483647 (upper limit for int type. Calculations above this limit are not allowed due to the specification)
echo.
title Cursor calculator

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
if {%q%}=={back} (goto Mainmenuboot)
if {%q%}=={b} (goto Mainmenuboot)
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

rem advancemode
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
rem note Branch by variable and change. Created based on defaults.
rem Main function of Cursor Changer. Can't start without it.
rem and yea this "CURSOR CHANGER" code is old too! its fucking old
rem This code has existed since the first version of Cursor Changer (1.0.2, maybe. at least since 1.0).
cls
echo                              Cursor Changer %batver% %debugmode%
title Cursor *Changer* (VERY OLD CODE! MAY HAVE SOME ISSUE)%debugmode%
echo.
SET /P selected=Would you like to revert to %cursorcolor% color?(Y=Yes / N=No / B=Back)
if {%selected%}=={y} (goto :yes0)
if {%selected%}=={yes} (goto :yes0)
if {%selected%}=={egg} (goto :secret)
if {%selected%}=={n} (goto :no0)
if {%selected%}=={no} (goto :no0)
if {%selected%}=={back} (goto :Mainmenuboot)
if {%selected%}=={b} (goto :Mainmenuboot)
if {%selected%}=={debugyesnow} (goto :defgo)

echo ?
echo.
pause
echo Please provide valid input.
echo.
pause
goto cursorchange

:no0
echo Change has been canceled.
pause
goto Mainmenuboot

:yes0
find "CursorChanged" FirstCursor.txt > nul
if "%errorlevel%"=="0" goto changetodefault else goto FirstWarning
rem Write settings (default)
:FirstWarning
if not defined dummy (set clrfirstwarning=[37m[40m)
if {%wmodetoggle%}=={false} (set clrfirstwarning=[37m[40m)
if {%wmodetoggle%}=={true} (set clrfirstwarning=[30m[107m)
rem warning message, first-time startup only
cls
echo only at first changing Cursor
timeout /t 1 /nobreak >nul
cls
echo.
timeout /t 1 /nobreak >nul
if {%wmodetoggle%}=={true} (color f0) else (color 07)
echo                                  !Warning!
timeout /t 1 /nobreak >nul
if {%wmodetoggle%}=={true} (color fc) else (color 0c)
timeout /t 1 /nobreak >nul
if {%wmodetoggle%}=={true} (color f4) else (color 04)
timeout /t 1 /nobreak >nul
echo.
echo %clrfirstwarning%This feature changes the windows cursor. If you do not wish to make the change, go back at this point.
timeout /t 2 /nobreak >nul
echo %clrfirstwarning%The creator, tamago_1908, is not responsible for any problems that may result from the changes.
pause
echo.
echo.
rem Warning branch, entering "no" will delete CursorChangerSettings.txt.
:warningfirstChange
set clrfirstwarning=
SET /P selected=Do you understand?(Y=YES! / N=NO!) :
if {%selected%}=={n} (goto mainmenu)
if {%selected%}=={no} (goto mainmenu) 
if {%selected%}=={yes} (goto changetodefault)
if {%selected%}=={y} (goto changetodefault)
echo %selected% was selected.
echo.
echo ?
pause
echo.
echo Please provide valid input.
pause
goto warningfirstChange
:changetodefault
find "CursorChanged" FirstCursor.txt > nul
if "%errorlevel%"=="1" (
    find "nodogcheckforfastboot" FirstCursor.txt > nul
    if "%errorlevel%"=="1" (
    echo nodogcheckforfastboot > FirstCursor.txt
    echo CursorChanged >> FirstCursor.txt
    ) else echo CursorChanged >> FirstCursor.txt
)
if {%cursorcolor%}=={black} (goto darkgotest)
if {%selected%}=={white} (goto defgotest)
cls

:defgotest
reg query "HKEY_CURRENT_USER\Control Panel\Cursors" /v "Scheme Source" | find "0x0"
cls
if {%ErrorLevel%}=={0} (goto alreadydef)
if {%ErrorLevel%}=={1} (goto defgo)

:alreadydef
rem phantom warning message. Nowadays it is almost impossible to see this message.
title alrady white
echo 
rem and its little JOJO refarence, yea im nerd so there is many anime things, hahhahaahahahahahahha
echo WHAT, HOW!! WHAT THE, NO AWAY ITS IMPOSSIBLE!! UHH Don't come close to meeee!
goto exit

:darkgotest
reg query "HKEY_CURRENT_USER\Control Panel\Cursors" /v "Scheme Source" | find "0x2"
cls
if {%ErrorLevel%}=={0} (goto alreadydark)
if {%ErrorLevel%}=={1} (goto darkgo)

:alreadydark
rem fucking same, but its black. wait what "black"?????
title alrady black
echo 
echo WHAT, HOW!! WHAT THE, NO AWAY ITS IMPOSSIBLE!! UHH Don't come close to meeee!
goto exit

rem Change cursor color to white
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
echo Defaults have been restored.
pause
goto reboot

rem Change the cursor color to black.
:darkgo
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
rem uhhhhhhhhhhh

cls
echo.
echo Changed.
pause
goto reboot

rem dogcheck. verify if CursorChangerSettings.txt exists
:AllDefult
cd /d %batchmainpath%
if {%settinghelptoggle%}=={true} (goto alldefhelp)
if exist CursorChangerSettings.txt goto AllDefulttest
if not exist CursorChangerSettings.txt goto Dogcheck

:Dogcheck
rem dogcheck, respect tobyfox and dog
rem AND I LOVE HIM 
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

rem alldef (i mean its uninstall menu)
:AllDefulttest
cd /d %batchmainpath% 
find "nodogcheckfor1234567890qwertyuiop" CursorChangerSettings.txt
cls
if %ErrorLevel%==0 goto AllDefult1
if %ErrorLevel%==1 goto Dogcheck
rem Uninstall menu
:AllDefult1
title Cursor Changer Uninstall Menu (experimental)
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
if %ErrorLevel%==1 goto alldefselect1
if %ErrorLevel%==2 goto alldefselect2
if %ErrorLevel%==3 goto alldefselect3
if %ErrorLevel%==4 goto alldefselect4
if %ErrorLevel%==5 goto alldefselect1
if %ErrorLevel%==6 goto alldefselect1
if %ErrorLevel%==7 goto settingcategory1intsetting5

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
if %ErrorLevel%==1 goto alldefselect1
if %ErrorLevel%==2 goto alldefselect2
if %ErrorLevel%==3 goto alldefselect3
if %ErrorLevel%==4 goto alldefselect4
if %ErrorLevel%==5 goto alldefselect1
if %ErrorLevel%==6 goto alldefselect2
if %ErrorLevel%==7 set alldefselect=1&goto :alldefselectokey
if %ErrorLevel%==8 set alldefselect=1&goto :alldefselectokey
if %ErrorLevel%==9 goto settingcategory1intsetting5


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
if %ErrorLevel%==1 goto alldefselect1
if %ErrorLevel%==2 goto alldefselect2
if %ErrorLevel%==3 goto alldefselect3
if %ErrorLevel%==4 goto alldefselect4
if %ErrorLevel%==5 goto alldefselect1
if %ErrorLevel%==6 goto alldefselect3
if %ErrorLevel%==7 set alldefselect=2&goto :alldefselectokey
if %ErrorLevel%==8 set alldefselect=2&goto :alldefselectokey
if %ErrorLevel%==9 goto settingcategory1intsetting5

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
if %ErrorLevel%==1 goto alldefselect1
if %ErrorLevel%==2 goto alldefselect2
if %ErrorLevel%==3 goto alldefselect3
if %ErrorLevel%==4 goto alldefselect4
if %ErrorLevel%==5 goto alldefselect2
if %ErrorLevel%==6 goto alldefselect4
if %ErrorLevel%==7 set alldefselect=3&goto :alldefselectokey
if %ErrorLevel%==8 set alldefselect=3&goto :alldefselectokey
if %ErrorLevel%==9 goto settingcategory1intsetting5

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
if %ErrorLevel%==1 goto alldefselect1
if %ErrorLevel%==2 goto alldefselect2
if %ErrorLevel%==3 goto alldefselect3
if %ErrorLevel%==4 goto alldefselect4
if %ErrorLevel%==5 goto alldefselect3
if %ErrorLevel%==6 goto alldefselect4
if %ErrorLevel%==7 set alldefselect=4&goto :alldefselectokey
if %ErrorLevel%==8 set alldefselect=4&goto :alldefselectokey
if %ErrorLevel%==9 goto settingcategory1intsetting5


rem Warning message when initializing settings
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
echo Initializes the Setting file. All previous settings will be deleted.
echo If you wish to cancel, exit the batch process at this point.
pause
cls
call :Wipealldeta
title ...
echo Initialization is complete. In order to apply the changes, Cursor Changer will Restart. Press Any Key to Continue...
pause >nul
goto :Rebootbatch

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
echo Displays the path where the Setting file is located.
start explorer %batchmainpath%
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
set alldefentered=true
title Uninstall of Cursor Changer %debugmode%
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
if {%selected%}=={back} (color 07&goto :Mainmenuboot)
if {%selected%}=={b} (color 07&goto :Mainmenuboot)
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
cls
color 0B
echo [40m[3m[96mLet's turn back the clock...
timeout /t 3 /nobreak >nul
find "wmode=false" CursorChangerSettings.txt > nul
if %ErrorLevel%==0 color 07
if %ErrorLevel%==1 goto wmodeonoffdetect
:wmodeonoffdetectalldefno2
find "wmode=true" CursorChangerSettings.txt > nul
if %ErrorLevel%==0 color f0
goto Mainmenuboot

:yes2
rem Final confirmation of uninstallation
set selected=
SET /P selected=Really good?(Y=Yes / N=No / B=Back)
if {%selected%}=={y} (set alldefclr=[31m&set alldefclr2=[97m&goto :yes2final)
if {%selected%}=={yes} (setalldefclr=[31m&set alldefclr2=[97m&goto :yes2final)
if {%selected%}=={n} (goto :no2)
if {%selected%}=={no} (goto :no2)
if {%selected%}=={back} (color 07&goto :Mainmenuboot)
if {%selected%}=={b} (color 07&goto :Mainmenuboot)
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
rem Final confirmation of uninstallation Season 2
set selected=
echo.
echo 
SET /P selected=%alldefclr%You won't regret it, will you? (if you continue, You can't restore it!)%alldefclr2%(Y=Yes / N=No / B=Back)
if {%selected%}=={y} (goto :yes2go)
if {%selected%}=={yes} (goto :yes2go)
if {%selected%}=={n} (goto :no2)
if {%selected%}=={no} (goto :no2)
if {%selected%}=={back} (color 07&goto :Mainmenuboot)
if {%selected%}=={b} (color 07&goto :Mainmenuboot)
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
rem I can't back down. They're coming...
cls
color 9f
echo Execute. If you want to return, stop the batch file.
pause

rem Uninstall menu exception handling FIrstCursor in the absence of FIrstCursor. But it is redundant and I want to improve it.
rem I want to add more exception handling. For example, if the message is never possible without modifying the contents, it should be able to do a goto, branch on a variable, and change the message.
cd /d %batchmainpath%
if not exist FirstCursor.txt set erroralldefwhatdelete=FirstCursor & goto BSOD_Errors
:testerroralldef
if not exist CursorChangerSettings.txt set erroralldefwhatdelete=CursorChangerSettings & goto BSOD_Errors
set erroralldefwhatdelete=FirstCursor.txt,CursorChangerSettings.txt,
goto alldefnow

:BSOD_Errors
set runningfromfulldebug=
set FromREConsole=
timeout /t 1 /nobreak >nul
if not defined invisiblecursor (echo [?25l&set invisiblecursor=true)
title Cursor Changer is CRASHED!
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
echo          Oops! The Cursor Changer is Crashed!
echo.
echo          This screen is displayed when Cursor Changer crashes for some reason.
echo          The following information may be helpful in obtaining support.
echo.
echo          Error ID : %1
echo.
echo          For more information about this screen and possible fixes, visit this link:
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
echo Dim answer:answer = MsgBox("An unknown critical error has occurred!",vbOKOnly,"CRITICAL ERROR"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul
del /Q %TEMP%\msgbox.vbs

:BSOD_Errors0message2
echo Dim answer:answer = MsgBox("Error Description : Unknown error occurred. Error ID : 0",vbokony,"Error"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul

:BSOD_Errors0message3
echo Dim answer:answer = MsgBox("In most cases, this is due to a serious mistake caused by a syntax error by the developer. (like unexpected exit /b, syntax error.)",vbokonly,"Error"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul

:BSOD_Errors0message4
echo Dim answer:answer = MsgBox("Please check your environment, security software, etc., and try again where the error occurred.",vbokonly,"What should i do?"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul

:BSOD_Errors0message5
echo Dim answer:answer = MsgBox("If the error still occurs, please report it in a github issue.",vbokonly,"Error"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul
goto :BSOD_ErrorsRorR


:BSOD_Errors1message
echo Dim answer:answer = MsgBox("A critical error occurred during booting up!",vbOKOnly,"CRITICAL ERROR"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul
del /Q %TEMP%\msgbox.vbs

:BSOD_Errors0message2
echo Dim answer:answer = MsgBox("Error Description : Unknown error occurred at Mobas_loader or Setting_loader Error ID : 1",vbokony,"Error"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul

:BSOD_Errors1message3
echo Dim answer:answer = MsgBox("This error occurs when some serious error occurs during the startup process.",vbokonly,"Error"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul

:BSOD_Errors1message4
echo Dim answer:answer = MsgBox("Please check your environment, security software, etc., and try again where the error occurred.",vbokonly,"what should i do?"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul

:BSOD_Errors1message5
echo Dim answer:answer = MsgBox("If the error still occurs, please report it in a github issue.",vbokonly,"Error"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul
goto :BSOD_ErrorsRorR


:BSOD_Errors2message
echo Dim answer:answer = MsgBox("Error occurred in Mobas_loader!",vbokonly,"Error"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul
del /Q %TEMP%\msgbox.vbs

:BSOD_Errors2message2
echo Dim answer:answer = MsgBox("Error Description : The value of the variable wantload which is required when calling Mobas_loader, is an invalid value. %wantload% Error ID : 2",vbokony,"Error"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul

:BSOD_Errors2message3
echo Dim answer:answer = MsgBox("This error rarely occurs. However, it can occur when using some development or recovery function.",vbokonly,"Error"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul

:BSOD_Errors2message4
echo Dim answer:answer = MsgBox("Please check your environment, security software, etc., and try again where the error occurred.",vbokonly,"What should i do?"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul

:BSOD_Errors2message5
echo Dim answer:answer = MsgBox("If the error still occurs, please report it in a github issue.",vbokonly,"Error"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul
goto :BSOD_ErrorsRorR


:BSOD_Errors3message
echo Dim answer:answer = MsgBox("Error occurred during uninstallation!",vbOKCancel,"Error"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul

:BSOD_Errors3message2message
echo Dim answer:answer = MsgBox("Error Description : A file that should be present when performing uninstallation is not present! Error ID : 3",vbOKCancel,"Error"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul

:BSOD_Errors3message3message
echo Dim answer:answer = MsgBox("Well, actually it was you who deleted %erroralldefwhatdelete%",vbYesno,""):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul
if {%invisiblecursor%}=={true} (echo [?25h&set invisiblecursor=)
if {%errorlevel%}=={6} (del /Q %TEMP%\msgbox.vbs&goto :BSOD_Errors3message3messageok)
if {%errorlevel%}=={7} (del /Q %TEMP%\msgbox.vbs&goto :BSOD_Errors3message3messageno)
goto BSOD_Errors3message3message

:BSOD_Errors3message3messageok
echo Dim answer:answer = MsgBox("I knew it.",vbOKCancel,""):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
del /Q %TEMP%\msgbox.vbs
goto :BSOD_ErrorsRorR

:BSOD_Errors3message3messageno
echo Dim answer:answer = MsgBox("Oh really? well, if you didnt delete the file but this error happen, Please check your environment, security software, etc., and try again where the error occurred.",vbOKCancel,"Error"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %ERRORLEVEL% > nul
del /Q %TEMP%\msgbox.vbs

:BSOD_Errors3message4
echo Dim answer:answer = MsgBox("If the error still occurs, please report it in a github issue.",vbokonly,"Error"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul
goto :BSOD_ErrorsRorR


:BSOD_Errors4message
echo Dim answer:answer = MsgBox("OMG UR SYSTEM HAS BEEN DESTROYED!!!!!!!!!!!",vbokonly,"OMG"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul
del /Q %TEMP%\msgbox.vbs

:BSOD_Errors4message2
echo Dim answer:answer = MsgBox("Error Description : UR SYSTEM HAS BEEN FUCKING DESTORYED LIKE A TRASH!!! Error ID : 9999999",vbokony,"Error"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul

:BSOD_Errors4message3
echo Dim answer:answer = MsgBox("This error IS JUST TELLING UR SYSTEM HAS BEEN DESTROYED SO THERE IS NOTHING TO DO!!",vbokonly,"Error"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul

:BSOD_Errors4message4
echo Dim answer:answer = MsgBox("BUY NEW PC AND JUST SHUT UP!!!",vbokonly,"What should i do?"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul

:BSOD_Errors4message5
echo Dim answer:answer = MsgBox("If the error still occurs, JUST STOP TYPING EGG1!!!! U KNOW WHY THIS ERROR HAPPEN",vbokonly,"Error"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul
goto :BSOD_ErrorsRorR

:BSOD_ErrorsABSOLUTYNO
cls
echo THE SYSTEM HAS BEEN DESTROYED
echo.
echo error id : 6 (you cant call bsod_errors without argment, or goto.)
pause
if {%invisiblecursor%}=={true} (echo [?25h&set invisiblecursor=)
if {%wmodetoggle%}=={true} (color f0) else (color 07)
goto mainmenu



:BSOD_ErrorsRorR
echo Dim answer:answer = MsgBox("Press Yes to restart Cursor Changer at this point, or No to enter the recovery menu.",vbyesno,"Witch one?"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul
if {%invisiblecursor%}=={true} (echo [?25h&set invisiblecursor=)
if {%errorlevel%}=={6} (del /Q %TEMP%\msgbox.vbs&goto :batrestart)
if {%errorlevel%}=={7} (del /Q %TEMP%\msgbox.vbs&goto :Cursor_Changer_REmenu)




rem Discriminate between uninstall menu selections
:alldefnow
cls
color 07
if %alldefselect%==1 goto alldefnowchangeit
if %alldefselect%==2 goto alldefnowsettingdel

rem Branching according to uninstall menu selection
:alldefnowsettingdel
del FirstCursor.txt
del CursorChangerSettings.txt
goto alldefnowfinish

:alldefnowchangeit
del FirstCursor.txt
del CursorChangerSettings.txt
rem Initialize cursor for uninstallation. Return to white.
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
rem Message after uninstallation is complete
cls
title Good bye! %debugmode%.
echo Everything has been returned to default.
pause
echo I guess this is Goodbye... well Goodbye.
pause
rem Get own path, delete own
del %batpath%
goto exit

rem      ==============HEY!!! IF YOU SEE THIS, WATCH OUT!!! THESE CODE IS SO OLD AND TRASH AF!!============================================
:reboot
rem Determining whether or not to play reboot message depending on settings
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
rem Confirm restart
title Confirm restart %debugmode%
cls
SET /P selected=Do you want to restart? If not, changes will not be applied (Y=Yes / N=No / S=Skip)
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
exit

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
goto :Rebootbatch

:yes
echo thank you...
goto Lock

:testwipmenu
echo wip menu with test function
echo
echo

:secret
rem easteregg
rem btw this easteregg is little good quality so maybe i will delete this.
title how %debugmode%
echo What? how you know that word?
pause
SET /P selected=Where did you learn this word?
if {%selected%}=={hack} (goto :secrethentai)
if {%selected%}=={idk} (goto :secretnormal)
if {%selected%}=={i dont know} (goto :secretnormal)
if {%selected%}=={I looked inside} (goto :secrethentai)
if {%selected%}=={intuition} (goto :secretnormal)

if {%selected%}=={fuckyou} (goto :secretnormal) else (goto secretnormal)

echo.
echo ?
pause
echo.
echo Enter the valid choice.
pause
goto rebootok

:secretnormal
echo What? Does that mean you did it on a hunch?
pause
echo No way...?
goto :Rebootbatch
:secrethentai
echo Crikey! %USERNAME%!
goto :Rebootbatch


:testinthecalbeep
rem Test Functions
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
if {%selected%}=={b} (goto :Mainmenuboot) 
if {%selected%}=={n} (goto :testinthecalbeep) else goto testinthecalbeep
goto finishcalbeep
exit


:easteregg
rem A true Easter egg?
PowerShell -WindowStyle Hidden -Command Exit
title 
cls
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"\", '', 'OK', 'none');exit $result;"
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"DID YOU SEE THE...\", '', 'OK', 'none');exit $result;"
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"Contents of batch file...\", '', 'OK', 'Warning');exit $result;"
PowerShell -WindowStyle Normal -Command Exit
cls
title  Did you see it?
:eastereggh
cls
set ealoop=0
:eastereggloop
echo  Did you see it?
set /a ealoop=%ealoop+1
if %ealoop% gtr 10 (goto eastereggloopout)
goto eastereggloop
:eastereggloopout
powershell sleep 0.5
PowerShell -WindowStyle Hidden -Command Exit
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\" D I D   Y O U   S E E   I T   ???? \", ' Did you see it?', 'yesno', 'Warning');exit $result;"
if {%errorlevel%}=={6} (goto eastereggif1yes) else if {%errorlevel%}=={7} (goto eastereggif1no)

:eastereggif1yes
cls
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"AHAHAHAAHAHAHAHAH\", '', 'OK', 'Exclamation');exit $result;"
set eaif1loop=0
:eastereggif1yesloop
start cmd.exe
set /a eaif1loop=eaif1loop+1
if %eaif1loop% gtr 5 (goto eastereggif1yesloopout)
goto eastereggif1yesloop
:eastereggif1yesloopout
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"WHY?\", '', 'OK', 'Question');exit $result;"
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"WHY??\", '', 'OK', 'Question');exit $result;"
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"WHYWHYWHYWHYWHYWHYWHYWHYWHYWHYYYYYYYYYYYYWHYYYYYYYYY????????????????????????????\", '', 'OK', 'Question');exit $result;"
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"I won't allow it.\", '', 'OK', 'Warning');exit $result;"
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"Access to the webcam has been denied.\", 'Accessory not available', 'OK', 'Error');exit $result;"
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"I won't allow it, I won't allow it, I won't allow it, I won't allow it.\", '', 'OK', 'warning');exit $result;"
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"Unable to access "C:/" Access denied.\", 'Location is not available.', 'OK', 'Error');exit $result;"
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"\", 'Place was not available.', 'OK', 'Error');exit $result;"
powershell -Command "Add-Type -AssemblyName System.Windows.Forms;$result = [System.Windows.Forms.MessageBox]::Show(\"U N F O R G I V A B L E\", '', 'OK', 'warning');exit $result;"
taskkill /f /im explorer.exe
PowerShell -WindowStyle normal -Command Exit
start explorer.exe
title ????????????????????????????????
color 47
cls
pause
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo Yo
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo You
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo You sh
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo You sou
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo You shoul
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo You shoud re
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo You should regr
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo You should regret
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo You should regret th
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo You should regret this.
ping -n 1 127.0.0.1 > nul 2>&1
powershell sleep 2.5
cls
echo Executing lockdown phase...
powershell sleep 0.5
cls
title If you want to get out of infinite lockdown, please reboot from the lock screen...
echo After a few seconds, a forced infinite lockdown will be executed...
powershell sleep 0.25
set looplockdownhorroreaster=true
PowerShell -WindowStyle Hidden -Command Exit
goto lock

:eastereggif1no
cls
echo Dim answer:answer = MsgBox(".....",vbExclamation,""):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
PowerShell -WindowStyle normal -Command Exit
goto Mainmenuboot



:1908hell
rem Test Functions and Easter Eggs
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
if %eggloop% gtr 1908 (pause&echo 1 9 0 8 :D :D :D :D :D :D&pause&goto Mainmenuboot)
goto loop1908

:developermenu
echo devloper menuuuuusdsdafwefuwbibhwiewbiofhwiofw
pause
exit /b

:batstarthelp
set batargmentonly=true
if {%batargmentonly%}=={true} (
set clr=[7m&set clred=[91m&set clrgrn=[92m&set clryel=[93m&set clrmag=[95m&set clrgra=[90m&set clrcyan=[96m&set clr2=[0m
) else (wtf its inpossble bro. batargmentonly has not expect value. like true.&pause&exit)
goto acbatargmentsonly

:openiedev
cls
echo InternetExplorer is will open.
echo CreateObject("InternetExplorer.Application").Visible=true > %TEMP%\openie.vbs & %TEMP%\openie.vbs
del %temp%\openie.vbs
powershell sleep 0.2
goto Mainmenuboot

:allcommands
cls
rem Sword art online War of Underworld refarence
set selected=
if {%allcommandlock%}=={true} (goto Mainmenuboot) else if {%allcommandlock%}=={false} (goto allcommandsmain)
title enter the password!
setlocal enabledelayedexpansion
if not defined invisiblecursor (echo [?25l&set invisiblecursor=true)
mode con: cols=75 lines=25
set "input=" & set len=0
:allcommandslockloop
if {%wmodetoggle%}=={true} (echo [97m)
echo [10;25H[44mÑ°ÑüÑüÑü  Enter  Password ÑüÑüÑüÑ¢ [0m
echo [11;25H[44mÑ†                        Ñ† [0m
echo [12;25H[44mÑ† Ñ´[0m                    Ñ´[44m Ñ† [0m
echo [13;25H[44mÑ†                        Ñ† [0m
echo [14;25H[44mÑ§ÑüÑüÑüÑüÑüÑüÑüÑüÑüÑüÑüÑüÑüÑüÑüÑüÑüÑüÑüÑüÑüÑüÑüÑüÑ£ [0m
echo [15;25H[44m  B=Delete Y=Enter E=Exit  [0m
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
if %num%==11 if "%input%"=="1908" (echo [17;30HCorrect password.&timeout /t 2 /nobreak >nul&echo [?25h&set invisiblecursor=&setlocal disabledelayedexpansion&set input=&set len=&set allcommandlock=false&goto allcommandsmain) else (echo [17;10HWrong password. You need restart the batch to try again.&timeout /t 3 /nobreak >nul&set input=&set len=0&set allcommandlock=true&setlocal disabledelayedexpansion&goto mainmenu)
if %num%==12 (
    if {%invisiblecursor%}=={true} (
      setlocal disabledelayedexpansion&echo [?25h&set invisiblecursor=&set input=&set len=& goto :mainmenu
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
echo          %clryel%ÅE%clr2%inspectentirecommandlist %clrgra%(Displays all available commands.)%clr2%
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
goto Mainmenu


:fulldebug
set selected=
if defined fulldebug (goto fulldebugmain)
cls
echo.
echo                            !Warning!
echo.
echo This feature was created for developers. If you are not a developer, it may cause some bugs or problems.
echo If you still want to use this feature, type "y".
echo If you want to go back or cancel, type "n".
echo Once you enter "y", this message will not appear again unless you restart this batch directly or delete the "fulldebug" variable.
set /p selected=Y or N : 
if %selected%==n goto Mainmenu
if %selected%==y set fulldebug=true
if %selected%== echo what? "Y" or "N".&pause&goto fulldebug

:fulldebugmain
set fulldebugsetvariable=
set fulldebugvariableapply=
title ^(for debug^) cursor variable
echo.
echo start up fulldebug...
powershell -command "&{$h=Get-Host;$w=$h.UI.RawUI;$s=$w.BufferSize;$s.height=150;$w.BufferSize=$s;}"
cls
:fulldebugtypevariable
set fulldebugsetvariable=
set fulldebugvariableapply=
set
set /p fulldebugsetvariable=Enter the variable to change :
if {%fulldebugsetvariable%}=={back} (goto Mainmenuboot)
if {%fulldebugsetvariable%}=={exit} (goto Mainmenuboot)
if {%fulldebugsetvariable%}=={help} (echo goto&echo set&echo help&echo back&pause&cls&set fulldebugsetvariable=&goto fulldebugtypevariable)
if {%fulldebugsetvariable%}=={goto} (goto fulldebuggoto)
if {%fulldebugsetvariable%}=={set} (goto fulldebugsetnew)
if {%fulldebugsetvariable%}=={} (cls&goto fulldebugtypevariable)
if {%fulldebugsetvariable%}=={allcommandlock} (echo you cant Change this variable, becouse this variable is locked.&pause&cls&goto fulldebugtypevariable)
if not defined %fulldebugsetvariable% (echo %fulldebugsetvariable% is not exist. please type exist variable or create it. &pause&cls&goto fulldebugtypevariable)
set /p fulldebugvariableapply=%fulldebugsetvariable%^=
if {%fulldebugvariableapply%}=={back} (goto fulldebugerrorsetnew1)
if {%fulldebugvariableapply%}=={} (goto fulldebugerrorsetvariable1)
set %fulldebugsetvariable%=%fulldebugvariableapply%
echo %fulldebugsetvariable%^=%fulldebugvariableapply% Changed.
pause
cls
goto fulldebugtypevariable

:fulldebuggoto
set fulldebugsetvariable=
set /p fulldebugsetvariable=goto where ?:
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
if defined %fulldebugsetvariable% (echo %fulldebugsetvariable% is already exist. please type not exist variable. &pause&cls&goto fulldebugsetnew)
if {%fulldebugsetvariable%}=={back} (goto fulldebugtypevariable)
if {%fulldebugsetvariable%}=={allcommandlock} (echo you cant Change this variable, becouse this variable is locked.&pause&cls&goto fulldebugsetnew)
if {%fulldebugsetvariable%}=={} (echo please enter something.&pause&cls&goto fulldebugsetnew)
:fulldebugsetnewenter
set /p fulldebugvariableapply=%fulldebugsetvariable%^=
if {%fulldebugvariableapply%}=={} (echo You cannot create a variable with no content. &pause&cls&goto fulldebugsetnewenter)
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
if {%Mainmenueaster%}=={true} (goto Mainmenu)
cls&pause&echo hello! this is easteregg!&pause&cls&title Now you can see the build num at title&echo and bye!&pause&cls&set Mainmenueaster=true&goto Mainmenuboot


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

rem 5000 line code, wtf?
rem uh anyway finally end of line