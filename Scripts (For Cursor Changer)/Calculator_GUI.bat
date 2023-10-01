@echo off
setlocal
mode con: cols=70 lines=31
if {%wmodetoggle%}=={false} (set clr=[7m&set clred=[91m&set clrgrn=[92m&set clryel=[93m&set clrmag=[95m&set clrgra=[90m&set clrcyan=[96m&set clr2=[0m)
if {%wmodetoggle%}=={true} (set clr=[100m[97m&set clred=[91m&set clrgrn=[92m&set clryel=[93m&set clrmag=[95m&set clrgra=[90m&set clrcyan=[96m&set clr2=[0m[107m[30m) else (set clr=[7m&set clred=[91m&set clrgrn=[92m&set clryel=[93m&set clrmag=[95m&set clrgra=[90m&set clrcyan=[96m&set clr2=[0m)
set calslctrn=0null0
:Calculator_main
cls
echo.
echo                           Calculator V2 test
echo.
echo     O=====================================O  O===================O
echo     I                                     I  I Move to Extention I 
echo     I   O=============================O   I  O menu : M          I
echo     I   I                             I   I  I exit menu : M     I
echo     I   I                             I   I  O===================O
echo     I   I                             I   I 
echo     I   O=============================O   I  O=================O
echo     I                                     I  I%calbex1% Exit Calculator %calbex1end%I
echo     I    O===========O                    I  O=================O
echo     I    I%calbac%    AC     %calbacend%I                    I  I %calbex2%Reset All%calbex2end% I
echo     I    O===========O                    I  O===========O
echo     I    O===O   O===O   O===O   O===O    I  I %calbex3%Settings %calbex3end%I
echo     I    I%calb1% 1 %calb1end%I   I%calb2% 2 %calb2end%I   I%calb3% 3 %calb3end%I   I%calbdiv% / %calbdivend%I    I  O==========O
echo     I    O===O   O===O   O===O   O===O    I  I%calbex4% About %calb4end%I
echo     I    O===O   O===O   O===O   O===O    I  O=======O
echo     I    I%calb4% 4 %calb4end%I   I%calb5% 5 %calb5end%I   I%calb6% 6 %calb6end%I   I%calbmult% X %calbmultend%I    I
echo     I    O===O   O===O   O===O   O===O    I
echo     I    O===O   O===O   O===O   I%calb% - %calb%I    I
echo     I    I%calb7% 7 %calb7end%I   I%calb8% 8 %calb8end%I   I%calb9% 9 %calb9end%I   O===O    I
echo     I    O===O   O===O   O===O   I%calb% + %calb%I    I
echo     I    O===O   ====O   O===O   O===O    I 
echo     I    I%calb0% 0 %calb0end%I   I%calbdot% . %calbdotend%I   I%calbdel% D %calbdelend%I   I%calbeq% = %calbeqend%I    I
echo     I    O===O   ====O   O===O   O===O    I
echo     I                                     I
echo     O=====================================O
echo.
rem MOST IDIOT CODE
rem AHHHHHHHHHH LEAVE ME ALONE!!
rem AHUGHHHHHH!!!
rem HORY SHITTTTTTTTTT
choice /c 1234567890wasdexm /n /m "wasd,1234567890, = =e.del=x"
if {%ErrorLevel%}=={1} (set calslctrn=1d&call :Calculator_Core)
if {%ErrorLevel%}=={2} (set calslctrn=2d&call :Calculator_Core)
if {%ErrorLevel%}=={3} (set calslctrn=3d&call :Calculator_Core)
if {%ErrorLevel%}=={4} (set calslctrn=4d&call :Calculator_Core)
if {%ErrorLevel%}=={5} (set calslctrn=5d&call :Calculator_Core)
if {%ErrorLevel%}=={6} (set calslctrn=6d&call :Calculator_Core)
if {%ErrorLevel%}=={7} (set calslctrn=7d&call :Calculator_Core)
if {%ErrorLevel%}=={8} (set calslctrn=8d&call :Calculator_Core)
if {%ErrorLevel%}=={9} (set calslctrn=9d&call :Calculator_Core)
if {%ErrorLevel%}=={10} (set calslctrn=0d&call :Calculator_Core)
if {%ErrorLevel%}=={11} (call :Calculator_Core w)
if {%ErrorLevel%}=={12} (call :Calculator_Core a)
if {%ErrorLevel%}=={13} (call :Calculator_Core s)
if {%ErrorLevel%}=={14} (call :Calculator_Core d)
if {%ErrorLevel%}=={15} (set calslctrn=equd&call :Calculator_Core)
if {%ErrorLevel%}=={16} (set calslctrn=deld&call :Calculator_Core)
if {%ErrorLevel%}=={17} (set calslctrn=exttn&call :Calculator_Core)
goto Calculator_main

:Calculator_Core
if {%calslctrn%}=={0null0} (set calslctrn=1&set calb1=%clr%&set calb1end=%clr2%)
if {%calslctrn%}=={1d} (set calb1=%clr%&set calb1end=%clr2%&goto Calculator_Core_Exit)
if {%calslctrn%}=={2d} (set calb1=%clr%&set calb1end=%clr2%&goto Calculator_Core_Exit)
if {%calslctrn%}=={3d} (set calb1=%clr%&set calb1end=%clr2%&goto Calculator_Core_Exit)
if {%calslctrn%}=={4d} (set calb1=%clr%&set calb1end=%clr2%&goto Calculator_Core_Exit)
if {%calslctrn%}=={5d} (set calb1=%clr%&set calb1end=%clr2%&goto Calculator_Core_Exit)
if {%calslctrn%}=={6d} (set calb1=%clr%&set calb1end=%clr2%&goto Calculator_Core_Exit)
if {%calslctrn%}=={7d} (set calb1=%clr%&set calb1end=%clr2%&goto Calculator_Core_Exit)
if {%calslctrn%}=={8d} (set calb1=%clr%&set calb1end=%clr2%&goto Calculator_Core_Exit)
if {%calslctrn%}=={9d} (set calb1=%clr%&set calb1end=%clr2%&goto Calculator_Core_Exit)
if {%calslctrn%}=={0d} (set calb1=%clr%&set calb1end=%clr2%&goto Calculator_Core_Exit)
if {%1}=={w} (
    if {%calslctrn%}=={1} (set calb1=&set calb1end=&set calslctrn=calac&set calbac=%clr%&set calbacend=%clr2%)
    if {%calslctrn%}=={2} (set calb2=&set calb2end=&set calslctrn=calac&set calbac=%clr%&set calbacend=%clr2%)
    if {%calslctrn%}=={3} (goto Calculator_Core_Exit)
    if {%calslctrn%}=={4} (set calb4=&set calb4end=&set calslctrn=1&set calb1=%clr%&set calb1end=%clr2%)
    if {%calslctrn%}=={5} (set calb5=&set calb5end=&set calslctrn=2&set calb2=%clr%&set calb2end=%clr2%)
    if {%calslctrn%}=={6} (set calb6=&set calb6end=&set calslctrn=3&set calb3=%clr%&set calb3end=%clr2%)
    if {%calslctrn%}=={7} (set calb7=&set calb7end=&set calslctrn=4&set calb4=%clr%&set calb4end=%clr2%)
    if {%calslctrn%}=={8} (set calb8=&set calb8end=&set calslctrn=5&set calb5=%clr%&set calb5end=%clr2%)
    if {%calslctrn%}=={9} (set calb9=&set calb9end=&set calslctrn=6&set calb6=%clr%&set calb6end=%clr2%)
    if {%calslctrn%}=={0} (set calb0=&set calb0end=&set calslctrn=7&set calb7=%clr%&set calb7end=%clr2%)
    if {%calslctrn%}=={calac} (goto Calculator_Core_Exit)
    if {%calslctrn%}=={caldot} (set calbdot=&set calbdotend=&set calslctrn=8&set calb8=%clr%&set calb8end=%clr2%)
    if {%calslctrn%}=={caldel} (set calbdel=&set calbdelend=&set calslctrn=9&set calb9=%clr%&set calb9end=%clr2%)
    if {%calslctrn%}=={} (set calb1=&set calb1end=&set calslctrn=calb&set calbac=%clr%&set calbacend=%clr2%)
    if {%calslctrn%}=={} (set calb1=&set calb1end=&set calslctrn=calb&set calbac=%clr%&set calbacend=%clr2%)
    if {%calslctrn%}=={} (set calb1=&set calb1end=&set calslctrn=calb&set calbac=%clr%&set calbacend=%clr2%)
    if {%calslctrn%}=={} (set calb1=&set calb1end=&set calslctrn=calb&set calbac=%clr%&set calbacend=%clr2%)
    if {%calslctrn%}=={} (set calb1=&set calb1end=&set calslctrn=calb&set calbac=%clr%&set calbacend=%clr2%)
    goto Calculator_Core_Exit
)
if {%1}=={a} (
        if {%calslctrn%}=={1} (goto Calculator_Core_Exit)
    if {%calslctrn%}=={2} (set calb2=&set calb2end=&set calslctrn=1&set calb1=%clr%&set calb1end=%clr2%)
    if {%calslctrn%}=={3} (set calb3=&set calb3end=&set calslctrn=2&set calb2=%clr%&set calb2end=%clr2%)
    if {%calslctrn%}=={4} (goto Calculator_Core_Exit)
    if {%calslctrn%}=={5} (set calb5=&set calb5end=&set calslctrn=4&set calb4=%clr%&set calb4end=%clr2%)
    if {%calslctrn%}=={6} (set calb6=&set calb6end=&set calslctrn=5&set calb5=%clr%&set calb5end=%clr2%)
    if {%calslctrn%}=={7} (goto Calculator_Core_Exit)
    if {%calslctrn%}=={8} (set calb8=&set calb8end=&set calslctrn=7&set calb7=%clr%&set calb7end=%clr2%)
    if {%calslctrn%}=={9} (set calb9=&set calb9end=&set calslctrn=8&set calb8=%clr%&set calb8end=%clr2%)
    if {%calslctrn%}=={0} (goto Calculator_Core_Exit)
    if {%calslctrn%}=={calac} (goto Calculator_Core_Exit)
    if {%calslctrn%}=={caldot} (set calbdot=&set caldotend=&set calslctrn=0&set calb0=%clr%&set calb0end=%clr2%)
    if {%calslctrn%}=={caldel} (set calbdel=&set calbdelend=&set calslctrn=caldot&set calbdot=%clr%&set calbdotend=%clr2%)
    if {%calslctrn%}=={} (set calb1=&set calb1end=&set calslctrn=calb&set calbac=%clr%&set calbacend=%clr2%)
    if {%calslctrn%}=={} (set calb1=&set calb1end=&set calslctrn=calb&set calbac=%clr%&set calbacend=%clr2%)
    if {%calslctrn%}=={} (set calb1=&set calb1end=&set calslctrn=calb&set calbac=%clr%&set calbacend=%clr2%)
    if {%calslctrn%}=={} (set calb1=&set calb1end=&set calslctrn=calb&set calbac=%clr%&set calbacend=%clr2%)
    if {%calslctrn%}=={} (set calb1=&set calb1end=&set calslctrn=calb&set calbac=%clr%&set calbacend=%clr2%)
    goto Calculator_Core_Exit
)
if {%1}=={s} (
        if {%calslctrn%}=={1} (set calb1=&set calb1end=&set calslctrn=4&set calb4=%clr%&set calb4end=%clr2%)
    if {%calslctrn%}=={2} (set calb2=&set calb2end=&set calslctrn=5&set calb5=%clr%&set calb5end=%clr2%)
    if {%calslctrn%}=={3} (set calb3=&set calb3end=&set calslctrn=6&set calb6=%clr%&set calb6end=%clr2%)
    if {%calslctrn%}=={4} (set calb4=&set calb4end=&set calslctrn=7&set calb7=%clr%&set calb7end=%clr2%)
    if {%calslctrn%}=={5} (set calb5=&set calb5end=&set calslctrn=8&set calb8=%clr%&set calb8end=%clr2%)
    if {%calslctrn%}=={6} (set calb6=&set calb6end=&set calslctrn=9&set calb9=%clr%&set calb9end=%clr2%)
    if {%calslctrn%}=={7} (set calb7=&set calb7end=&set calslctrn=0&set calb0=%clr%&set calb0end=%clr2%)
    if {%calslctrn%}=={8} (set calb8=&set calb8end=&set calslctrn=caldot&set calbdot=%clr%&set calbdotend=%clr2%)
    if {%calslctrn%}=={9} (set calb9=&set calb9end=&set calslctrn=caldel&set calbdel=%clr%&set calbdelend=%clr2%)
    if {%calslctrn%}=={0} (goto Calculator_Core_Exit)
    if {%calslctrn%}=={calac} (set calbac=&set calbacend=&set calslctrn=1&set calb1=%clr%&set calb1end=%clr2%)
    if {%calslctrn%}=={caldot} (goto Calculator_Core_Exit)
    if {%calslctrn%}=={caldel} (goto Calculator_Core_Exit)
    if {%calslctrn%}=={} (set calb1=&set calb1end=&set calslctrn=calb&set calbac=%clr%&set calbacend=%clr2%)
    if {%calslctrn%}=={} (set calb1=&set calb1end=&set calslctrn=calb&set calbac=%clr%&set calbacend=%clr2%)
    if {%calslctrn%}=={} (set calb1=&set calb1end=&set calslctrn=calb&set calbac=%clr%&set calbacend=%clr2%)
    if {%calslctrn%}=={} (set calb1=&set calb1end=&set calslctrn=calb&set calbac=%clr%&set calbacend=%clr2%)
    if {%calslctrn%}=={} (set calb1=&set calb1end=&set calslctrn=calb&set calbac=%clr%&set calbacend=%clr2%)
    goto Calculator_Core_Exit
)
if {%1}=={d} (
        if {%calslctrn%}=={1} (set calb1=&set calb1end=&set calslctrn=2&set calb2=%clr%&set calb2end=%clr2%)
    if {%calslctrn%}=={2} (set calb2=&set calb2end=&set calslctrn=3&set calb3=%clr%&set calb3end=%clr2%)
    if {%calslctrn%}=={3} (goto Calculator_Core_Exit)
    if {%calslctrn%}=={4} (set calb4=&set calb4end=&set calslctrn=5&set calb5=%clr%&set calb5end=%clr2%)
    if {%calslctrn%}=={5} (set calb5=&set calb5end=&set calslctrn=6&set calb6=%clr%&set calb6end=%clr2%)
    if {%calslctrn%}=={6} (set calb6=&set calb6end=&set calslctrn= &set calb =%clr%&set calb end=%clr2%)
    if {%calslctrn%}=={7} (set calb7=&set calb7end=&set calslctrn=8&set calb8=%clr%&set calb8end=%clr2%)
    if {%calslctrn%}=={8} (set calb8=&set calb8end=&set calslctrn=9&set calb9=%clr%&set calb9end=%clr2%)
    if {%calslctrn%}=={9} (set calb9=&set calb9end=&set calslctrn= &set calb =%clr%&set calb end=%clr2%)
    if {%calslctrn%}=={0} (set calb0=&set calb0end=&set calslctrn=caldot&set calbdot=%clr%&set calbdotend=%clr2%)
    if {%calslctrn%}=={calac} (goto Calculator_Core_Exit)
    if {%calslctrn%}=={caldot} (set calbdot=&set calbdotend=&set calslctrn=caldel&set calbdel=%clr%&set calbdelend=%clr2%)
    if {%calslctrn%}=={caldel} (set calbdel=&set calbdelend=&set calslctrn= &set calb =%clr%&set calb end=%clr2%)
    if {%calslctrn%}=={} (set calb1=&set calb1end=&set calslctrn=calb&set calbac=%clr%&set calbacend=%clr2%)
    if {%calslctrn%}=={} (set calb1=&set calb1end=&set calslctrn=calb&set calbac=%clr%&set calbacend=%clr2%)
    if {%calslctrn%}=={} (set calb1=&set calb1end=&set calslctrn=calb&set calbac=%clr%&set calbacend=%clr2%)
    if {%calslctrn%}=={} (set calb1=&set calb1end=&set calslctrn=calb&set calbac=%clr%&set calbacend=%clr2%)
    if {%calslctrn%}=={} (set calb1=&set calb1end=&set calslctrn=calb&set calbac=%clr%&set calbacend=%clr2%)
    goto Calculator_Core_Exit
)


:Calculator_Core_Exit
exit /b


:very_useable
@echo off
set input=
:loop
echo hi, enter a value
choice /c:0123456789b /n /m "here: "
set num=%errorlevel%
if not %num%==0 set /a num=num-1
if %num%==10 (
  if not "%input%"=="" (
    set input=%input:~0,-1%
    echo you deleted the last value
  ) else (
    echo nothing to delete
  )
) else (
  set input=%input%%num%
)
cls
echo you entered: %input%
goto loop






pause.