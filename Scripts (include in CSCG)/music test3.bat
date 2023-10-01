@echo off
setlocal
set batchpath=%~f0
:OOBEmainmusic
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
if {%runed%}=={false} (set runed=true&goto ccodemusicstart) else (goto :end)

:GetLineNumber <resultVar> <uniqueID> [LineOffset]

SETLOCAL
for /F "usebackq tokens=1 delims=:" %%L IN (`findstr /N "%~2" "%~f0"`) DO set /a lineNr=%~3 + %%L
(
ENDLOCAL
 set "%~1=%LineNr%"
 goto :eof
)
:end
echo hello world.
pause
taskkill /im powershell.exe
exit

