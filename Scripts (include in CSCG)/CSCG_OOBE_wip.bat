@echo off
setlocal
set wmodetoggle=false
set batver=1.13

:CursorChangerOOBE
if {%wmodetoggle%}=={false} (set clr=[3m[97m&set clred=[91m&set clrgrn=[92m&set clryel=[93m&set clrmag=[95m&set clrgra=[90m&set clrcyan=[96m&set clrhigh=[7m&set clrhighend=[0m&set clrwhi=[48;5;250m[30m&set clr2=[0m)
if {%wmodetoggle%}=={false} (set moveline=[22;0H) else (set moveline=[33;0H)
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
echo          ^ÅE     To set up Cursor Changer now, press E.
echo.
echo          ^ÅE     To repair a Cursor Changer installation using
echo                 Recovery Console, press R.
echo.
echo          ^ÅE     To quit Setup without installing Cursor Changer, press B.
echo.
echo.
echo.
echo.
set /p nothing=%clrwhi%     E=Continue     R=Repair     B=Quit                                         %moveline%%clrwhi% <nul& choice /c ERB /n
if %ErrorLevel%==1 goto OOBEmain
if %ErrorLevel%==2 goto OOBERepair
if %ErrorLevel%==3 call :OOBEmainblank&timeout /t 1 /nobreak >nul&exit


:OOBEmain
cls
color 07
echo.
echo Cursor Changer %batver% Setup
echo ================================O
echo.
echo.
echo          Do you Want hear The Windows XP OOBE Music?
echo.
echo          if you yes, press Y.
echo          if you not, press N.
echo.
echo          by the way, this Feature has request Internet
echo          Connection. So if you don't have it, press N.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     Y=Continue     N=Repair                                                    %moveline%%clrwhi% <nul& choice /c YN /n
if %ErrorLevel%==1 goto OOBEmainmusic
if %ErrorLevel%==2 call :OOBEmainblank&timeout /t 1 /nobreak >nul&goto OOBEmain2


:OOBEmainmusic
call :OOBEmainmusicmassage
set runed=false
:: StartIDpsinbat
call :getLineNumber startLine StartIDoobemusic 0
goto ccodemusicend
:ccodemusicstart
set /a startline=startline+4&set /a endline=endline-3
start /min powershell.exe -windowstyle hidden -noexit -NoProfile -ExecutionPolicy Unrestricted "$s=[System.Management.Automation.ScriptBlock]::create((Get-Content \"%~f0\" -TotalCount $env:endline|Where-Object{$_.readcount -gt $env:startline }) -join \"`n\");&$s" %*&goto ccodemusicend

$webClient = New-Object System.Net.WebClient
$data = $webClient.DownloadData("https://raw.githubusercontent.com/tamago1908/Cursor-Changer.bat/main/resource/Windows_XP_OOBE_for_Cursor_Changer.wav")

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
Write-Host "playing music... dont care this pwsh window... but wait, how did you see this text????"
while ($true) {
$cmd = Get-Process -Name cmd -ErrorAction SilentlyContinue
if (-not $cmd) {
    $player.Stop()
    exit
     }
}
:ccodemusicend
:: EndIDoobemusic
call :getLineNumber endLine EndIDpsinbat 0
if {%runed%}=={false} (set runed=true&goto ccodemusicstart) else (goto :OOBEmainmusicmassage2)

:GetLineNumber <resultVar> <uniqueID> [LineOffset]

SETLOCAL
for /F "usebackq tokens=1 delims=:" %%L IN (`findstr /N "%~2" "%~f0"`) DO set /a lineNr=%~3 + %%L
(
ENDLOCAL
 set "%~1=%LineNr%"
 goto :eof
)

:OOBEmainmusicmassage
cls
color 07
echo.
echo Cursor Changer %batver% Setup
echo ================================O
echo.
echo.
echo          Preparing music. Please Wait a while...
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
cls
color 07
echo.
echo Cursor Changer %batver% Setup
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


:OOBEmainmusicmassage2
set batchpath=
cls
color 07
echo.
echo Cursor Changer %batver% Setup
echo ================================O
echo.
echo.
echo          Done,
echo.
echo          It may take some time for the music to fully play.
echo          And if you want stop the music, close this cmd.
echo.
echo          If music does not play, check the following : 
echo.
echo          You have an Internet connection.
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

:: oobeÇ≈Ç∑ÇÈÇ±Ç∆ÅBÉoÅ[ÉWÉáÉìÇÃëIëÅAåæåÍÇÃämîFÅAÉeÅ[É}ÇÃëIëÅAê›íËÇÃëIëÅAíçà”éñçÄÇÃämîFÅB
:OOBEmain2
cls
color 07
echo.
echo Cursor Changer %batver% Setup
echo ================================O
echo Setup progress : 1/5 (Check precautions)
echo.
echo.
echo          Cursor Changer.bat generates two files.
echo          CursorChangerSetting.txt and FirstCursor.txt.
echo.
echo          CursorChangerSetting.txt stores the settings of CursorChanger.bat,
echo          and plays a very important role.
echo.
echo          FirstCursor.txt is used to determine the initial Startup.
echo          and is also an important file.
echo.
echo          If the user (in this case %USERNAME%) deletes these files,
echo          this CursorChanger.bat may not work properly and should never be done.
echo          SO, DONT DELETE THESE FILE.
echo          (Y to Continue)
echo.
echo.
set /p nothing=%clr2%%clrwhi%     Y=Continue                                                              1/3%moveline%%clrwhi% <nul&choice /c Y /n
if %ErrorLevel%==1 goto OOBEmain3


:OOBEmain3
cls
color 07
echo.
echo Cursor Changer %batver% Setup
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
echo          (Y to Continue)
echo.
echo.
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     Y=Continue                                                              2/3%moveline%%clrwhi% <nul&choice /c Y /n
if %ErrorLevel%==1 goto OOBEmain4


:OOBEmain4
cls
color 07
echo.
echo Cursor Changer %batver% Setup
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
echo          (Y to Continue)
echo.
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     Y=Continue                                                              3/3%moveline%%clrwhi% <nul&choice /c Y /n
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul


:OOBEmain5
cls
color 07
echo.
echo Cursor Changer %batver% Setup
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
set /p nothing=%clr2%%clrwhi%     Y=Continue     N=No                                                        %moveline%%clrwhi% <nul&choice /c YN /n
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto OOBEmain6
if %ErrorLevel%==2 goto OOBEmain5ifno


:OOBEmain5ifno
cls
color 07
echo.
echo Cursor Changer %batver% Setup
echo ================================O
echo Setup progress : 2/5 (Confirm Cursor Changer)
echo.
echo.
echo          Sorry, Currently Cursor Changer is don't support
echo          Other Languages.
echo.
echo          If you want to use Cursor Changer in other languages,
echo          Wait for an update, or give up.
echo          Do you want to continue Setup?
echo.
echo.
echo          (Y=Yes, I want setup Cursor Chagner!)
echo          (N=No, I will Quit Setup.)
echo.
echo.
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     Y=Continue     N=No                                                        %moveline%%clrwhi% <nul&choice /c YN /n
if %ErrorLevel%==1 call :OOBEmainblank & timeout /t 1 /nobreak >nul&goto OOBEmain6
if %ErrorLevel%==2 call :OOBEmainblank & timeout /t 1 /nobreak >nul&exit



:OOBEmain6
cls
color 07
echo.
echo Cursor Changer %batver% Setup
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
set /p nothing=%clr2%%clrwhi%     Y=Continue     N=No                                                        %moveline%%clrwhi% <nul&choice /c YN /n
if %ErrorLevel%==1 goto OOBEmain6theme1
if %ErrorLevel%==2 goto OOBEmain7


:OOBEmain6theme1
if {%OOBEundiscard%}=={true} (call :OOBEmainblank & timeout /t 1 /nobreak >nul&set oobetheme=dark&set OOBEundiscard=&goto OOBEmain7)
cls
color 07
echo.
echo Cursor Changer %batver% Setup
echo ================================O
echo Setup progress : 3/5 (Set theme of Cursor Changer)
echo.
echo.
echo          O============O    O=============O
echo          I Dark theme I    I white theme I
echo          O============O    O=============O
echo.
echo.
echo    ^ÅE   Nothing Selected. A,D to chooce the theme.
echo.
echo          (A,D or 1,2 to move, Y or E to confirm.)
echo          (B to stop choosing the theme.)
echo.
echo.
echo.
echo.
echo.
echo.
set /p nothing=%clr2%%clrwhi%     A,1=move to Left     D,2=move to right     B=Exit                          %moveline%%clrwhi% <nul&choice /c AD12B /n
if %ErrorLevel%==1 goto OOBEmain6theme2
if %ErrorLevel%==2 goto OOBEmain6theme2
if %ErrorLevel%==3 goto OOBEmain6theme2
if %ErrorLevel%==4 goto OOBEmain6theme3
if %ErrorLevel%==5 call :OOBEmain6themeifback&goto OOBEmain6theme1


:OOBEmain6theme2
if {%OOBEundiscard%}=={true} (call :OOBEmainblank & timeout /t 1 /nobreak >nul&set oobetheme=dark&set OOBEundiscard=&goto OOBEmain7)
cls
color 07
echo.
echo Cursor Changer %batver% Setup
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
set /p nothing=%clr2%%clrwhi%     A,1=move to Left     D,2=move to right     Y,E=Confirm     B=Exit          %moveline%%clrwhi% <nul&choice /c AD12BYE /n
if %ErrorLevel%==1 goto OOBEmain6theme2
if %ErrorLevel%==2 goto OOBEmain6theme3
if %ErrorLevel%==3 goto OOBEmain6theme2
if %ErrorLevel%==4 goto OOBEmain6theme3
if %ErrorLevel%==5 call :OOBEmain6themeifback&goto OOBEmain6theme2
if %ErrorLevel%==6 goto OOBEmain6theme2confirm
if %ErrorLevel%==7 goto OOBEmain6theme2confirm


:OOBEmain6theme3
if {%OOBEundiscard%}=={true} (call :OOBEmainblank & timeout /t 1 /nobreak >nul&set oobetheme=dark&set OOBEundiscard=&goto OOBEmain7)
cls
color 07
echo.
echo Cursor Changer %batver% Setup
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
set /p nothing=%clr2%%clrwhi%     A,1=move to Left     D,2=move to right     Y,E=Confirm     B=Exit          %moveline%%clrwhi% <nul&choice /c AD12BYE /n
if %ErrorLevel%==1 goto OOBEmain6theme2
if %ErrorLevel%==2 goto OOBEmain6theme3
if %ErrorLevel%==3 goto OOBEmain6theme2
if %ErrorLevel%==4 goto OOBEmain6theme3
if %ErrorLevel%==5 call :OOBEmain6themeifback&goto OOBEmain6theme3
if %ErrorLevel%==6 goto OOBEmain6theme3confirm
if %ErrorLevel%==7 goto OOBEmain6theme3confirm


:OOBEmain6theme2confirm
cls
color 07
echo.
echo Cursor Changer %batver% Setup
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
set /p nothing=%clr2%%clrwhi%     Y,E=Confirm     B,N=Exit                                                   %moveline%%clrwhi% <nul&choice /c BNYE /n
if %ErrorLevel%==1 goto OOBEmain6theme2
if %ErrorLevel%==2 goto OOBEmain6theme2
if %ErrorLevel%==3 call :OOBEmainblank & timeout /t 1 /nobreak >nul&set oobetheme=white&goto OOBEmain7
if %ErrorLevel%==4 call :OOBEmainblank & timeout /t 1 /nobreak >nul&set oobetheme=white&goto OOBEmain7



:OOBEmain6theme3confirm
cls
color 07
echo.
echo Cursor Changer %batver% Setup
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
set /p nothing=%clr2%%clrwhi%     Y,E=Confirm     B,N=Exit                                                   %moveline%%clrwhi% <nul&choice /c BNYE /n
if %ErrorLevel%==1 goto OOBEmain6theme3
if %ErrorLevel%==2 goto OOBEmain6theme3
if %ErrorLevel%==3 call :OOBEmainblank & timeout /t 1 /nobreak >nul&set oobetheme=dark&goto OOBEmain7
if %ErrorLevel%==4 call :OOBEmainblank & timeout /t 1 /nobreak >nul&set oobetheme=dark&goto OOBEmain7


:OOBEmain6themeifback
cls
color 07
echo.
echo Cursor Changer %batver% Setup
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
set /p nothing=%clr2%%clrwhi%     Y=Yes     N=No                                                   %moveline%%clrwhi% <nul&choice /c YN /n
if %ErrorLevel%==1 set OOBEundiscard=true&exit /b
if %ErrorLevel%==2 exit /b





if {%invisiblecursor%}=={true} (echo [?25h&set invisiblecursor=)



First of all, Cursor Changer.bat works as a so-called "Batch OS" and "cursor changer".
What this means is that it does not have the full OS-like functions of other major Batch OSs, such as Debios, but actually has functions which are not possible with a pure stand-alone batch. Most of the functions are things like calculators, update functions, etc. that test how well a relatively advanced function can run on its own, which is not possible with pure, stand-alone batch. In short, Cursor Changer.bat is the culmination of "how advanced Batch can be on its own," and does not have the functionality of a complete Batch OS.

Please check the github wiki to see how it came to be.