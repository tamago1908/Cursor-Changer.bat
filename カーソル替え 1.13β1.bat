@echo off
setlocal

rem カーソル替え by tamago_1908
rem Cursor Changer by tamago_1908

rem Japanese version

rem https://github.com/tamago1908/cursor-changer.bat 


rem サイズの指定
mode con: cols=75 lines=25

rem メモ cd %~dp0 &start %~n0%~x0&exit 有効活用できるかも (bat再起動)
rem コードの最初に入れれる処理の数は限られています(入れすぎると起動が遅くなる可能性) (遅くなった (手遅れ(何とかなった)) )
rem ビルドナンバーとバージョンの記入は必ずしてください！あとアーカイブに入れるのを忘れずに！
rem そして最近、このバッチ処理に英語を多く含めるようにしている。なぜなら、将来的にこのバッチ処理を翻訳することになった時、日本語が多いと面倒だから。
title カーソル変え
rem VER v1.13β1
set batver=1.13β1
set batbuild=build 45.5
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
    if "!current!"=="enablesimpleboot" (echo simpleboot is enabled.&set simpleboot=true&set argmentserror=false)
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
rem wmicコマンドで正確にバージョンを取得
for /f "tokens=2 delims==" %%a in ('wmic os get version /value') do set version=%%a
rem windows10 1511以降かどうか判定
if %version% geq 10.0.10586 (goto batbootcheckwinversafe)
rem windows10 1511未満かどうか判定
if %version% geq 10.0 (set windowsverfilter=windows10 1509&goto batbootcheckwinverbad)
rem windows8.1以前かどうか判定
if %version% geq 6.0 (set windowsverfilter=windows8.1以前&goto batbootcheckwinverbad) else set windowsverfilter=windows vista以前（古すぎます！）&goto batbootcheckwinverbad

:batbootcheckwinverbad
rem wmicコマンドがサポートされていない場合は従来の方法で再判定
ver | find /i "Version 10.0.102" > nul
if %errorlevel% == 0 (set windowsverfilter=windows10 1509&goto batbootcheckwinverbad2)
ver | find /i "Version 6.1" > nul
if %errorlevel% == 0 (set windowsverfilter=windows7&goto batbootcheckwinverbad2)
ver | find /i "Version 6.2" > nul
if %errorlevel% == 0 (set windowsverfilter=windows8&goto batbootcheckwinverbad2)
ver | find /i "Version 6.3" > nul
if %errorlevel% == 0 (set windowsverfilter=windows8.1&goto batbootcheckwinverbad2)

:batbootcheckwinverbad2
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

:batbootcheckwinversafe
rem カーソル替え処理を実行


rem 本処理 (変数のセットとか、前段階)
set bootbatnow=yes
set exitbuttondisabled=false
rem 管理者権限を保有しているかの確認
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
rem 管理者権限を保有している状態で、exitボタンを無効にすると、稀にウイルスとして検出されてしまう場合がある。なので、管理者権限保有時と、disableexitという変数がfalseの場合は、処理をバイパスしている。
if {%disableexit%}=={false} (goto batbootdisabledexitbutton)

:batbootdisableexitbutton
rem startid~powershell までのコードはずらしてはいけない　それ以前かそれ以後ならok
:: StartID1908
call :getLineNumber startLine StartID1908 0
goto batbootdisableexitbuttonendcode
:batbootdisableexitbuttoncodestart
set /a startline=startline+4&set /a endline=endline-3
title カーソル替えを起動中...&echo しばらくお待ちください...&powershell -NoProfile -ExecutionPolicy Unrestricted "$s=[System.Management.Automation.ScriptBlock]::create((Get-Content \"%~f0\" -TotalCount $env:endline|Where-Object{$_.readcount -gt $env:startline }) -join \"`n\");&$s" %*&goto batbootdisabledexitbutton
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
find "fastboot=true" カーソル替え設定.txt
cls
if {%errorlevel%}=={0} (goto batstart) else (goto nofastboot)
:nofastboot

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
rem バージョン 1.12β1 最初の1.13のベータ版。このバージョンでは、英語版での英訳の修正と、ウィンドウズのバージョンを確認する機構が少し変更され、また英語版ではeastereggが解放された。また、バグも修正された。とりあえず、主に英語版でのアップデートになる。


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
:fastboot

rem 最初の起動なのかを検知
:syokaicolorlogo
cd /d %HOMEDRIVE%%HOMEPATH%
if exist 初回カーソル.txt set firststartbat=no&set bootbatnow=yes&goto :batstart
if exist カーソル替え設定.txt title &echo テメェ！！！お前はもうおしまいだアアッ！！&pause&cls&echo いたずらに初回カーソルだけを消したな！？！？！？&pause&cls&echo なんでカーソル替え設定.txtがあんのに初回カーソル.txtは存在しねえんだよ！！おかしいだろ！？？&pause&cls&echo お前は後悔するべきだあッ！%username%！&pause&cls&echo なんてのは冗談です......が、初回カーソル.txtが存在しないのは確かです。&pause&cls&echo このメッセージを再度聞きたくない場合は、設定ファイルも消すか、初回カーソル.txtをご自身で作成し直してください。&pause&cls&goto exit
if not exist 初回カーソル.txt set firststartbat=yes& goto :syokaiboot

rem 初回起動限定のアニメーションを再生
:syokaiboot
title welcome to my bat file!
powershell sleep -m 500
cls
echo WELCOME TO
powershell sleep -m 200
cls

color 09
echo カ
powershell sleep -m 100
cls

color 0a
echo 　ー
powershell sleep -m 100
cls

color 0b
echo 　　ソ
powershell sleep -m 100
cls

color 0c
echo 　　　ル
powershell sleep -m 100
cls

color 0d
echo 　　　　替
powershell sleep -m 100
cls

color 0e
echo 　　　　  え
powershell sleep -m 100
cls
color 07
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo カ
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo カー
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo カーソル
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo カーソル替
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo カーソル替え
ping -n 1 127.0.0.1 > nul 2>&1
powershell sleep -m 500
cls
echo カーソル替え by tamago_1908
powershell sleep -m 1000
cls
goto saisyonokidou


cls
rem 初期起動処理

rem 管理者権限のプロンプトに関する設定を検知、
:batstart
if {%settingbypass%}=={true} (goto hazimemenuskipboot)
cls
rem 管理者権限設定の検知
find "admin=true" カーソル替え設定.txt > nul
if {%adminbypass%}=={true} (goto gotadmin)
if {%errorlevel%}=={0} (goto batstartadm)
if {%errorlevel%}=={1} (
set batloadprgs=0
call :batbootprogress
goto batstarttest2
)

:batstarttest2
cls
find "admin=false" カーソル替え設定.txt > nul
set batloadprgs=0
call :batbootprogress
if {%errorlevel%}=={0} (goto hazime)
if {%errorlevel%}=={1} (goto batstartadm)



:batstartadm
cls
rem 管理者権限の取得
rem このコード、冗長すぎる気がする。もしかしたらpowershellを使ってもっと短縮できるかも。
echo copyright.カーソル替え%batver% by tamago_1908
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
if exist 初回カーソル.txt goto hazime
if not exist 初回カーソル.txt goto saisyonokidou

rem 初回起動時のメッセージ
:saisyonokidou
title このバッチファイルの紹介
type nul > 初回カーソル.txt
echo nodogcheckforfastboot >> 初回カーソル.txt
cls
color 01
powershell sleep -m 100
color 08
echo こんにちは！
powershell sleep -m 100
color 07
powershell sleep -m 100
color 07
powershell sleep -m 500
cls
mode con: cols=148 lines=14
echo ようこそ！
powershell sleep -m 100
echo ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■＿■■■■■＿■■■■■■■■■■■■■■
echo ■■■＿＿■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■＿＿＿＿＿＿＿＿＿＿＿■■■■■＿＿＿■■■■
echo ■■■＿＿■■■■■■■■■■■■■■■■■■■■■＿＿■■■■■■＿■■■■■＿■■＿■■■■■■■■■＿■■■■■＿■■■■■■■■■■＿■■■
echo ■■■＿＿＿＿＿＿■■■■■■■■■■■■■■■■■■＿■■■■■＿＿■■■■■＿＿■＿■■■■■■■＿＿＿＿＿＿＿＿＿＿＿■■■■■■■■■■■■
echo ＿＿＿＿■■■■＿■■■■■■■■■■■■■■■■■■＿＿■■■■＿■■■■■■＿■■＿■■■■■■■■■＿＿■■■＿＿■■■■■■＿＿＿＿＿＿■■
echo ■■■＿■■■■＿■■■■■■■■■■■■■■■■■■■■■■■■＿■■■■■■＿■■＿■■■■■■■＿＿■■＿■＿■■＿＿■■■■■■■＿＿■■■
echo ■■■＿■■■＿＿■■■＿＿＿＿＿＿＿＿＿＿＿■■■■■■■■■＿■■■■■■■＿■■＿■■■■＿■■■＿＿＿＿＿＿＿＿＿■■■■■■■■＿■■■■
echo ■■■＿■■■＿＿■■■■■■■■■■■■■■■■■■■■■■＿＿■■■■■■■＿■■＿■■■＿■■■■＿■■■■■■■＿■■■■■■■＿＿＿■■■
echo ■■＿■■■■＿＿■■■■■■■■■■■■■■■■■■■■■＿＿■■■■■■■＿＿■■＿■■＿＿■■■■＿＿＿＿＿＿＿＿＿■■■■■■＿■■＿■■■
echo ■＿＿■■■■＿■■■■■■■■■■■■■■■■■■■■■＿＿■■■■■■■■＿■■■＿＿＿■■■■■■＿■■■■■■■＿■■■■■＿■■■＿■■■
echo ＿＿■■■＿＿＿■■■■■■■■■■■■■■■■■■■■＿＿■■■■■■■■＿■■■■■＿■■■■■■■＿＿＿＿＿＿＿＿＿■■■■＿■■■■＿＿＿＿
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
echo へ！
powershell sleep -m 350
cls
mode con: cols=75 lines=25
color 07
powershell sleep -m 300
echo 初めまして！
pause
cls
echo %~n0です！
pause
cls
echo このバッチ処理は、カーソルを黒色と白色に変えるほかに、
pause
cls
echo ちょっとした機能が詰め込まれた物です！
pause
cls
echo 他にもバッチ処理でできることを模索する為にも使っています。
pause 
cls
echo また、こんなにも行数があるバッチ処理を作ったのはこれが初めてなので、もし変なところがあったとしても許してください。
pause 
cls
echo それで、注意点です。
pause
cls
echo このバッチ処理、 %~n0を実行する場合は必ずpowershellとvbsが実行可能であることを確認してください。
pause 
cls
echo 利用できない場合、 %~n0を正常に実行できなくなります。
pause 
cls
echo 対応OSはWindowsのみで、実行がある程度保証されているのはwindows 10 バージョン1511以降です。
pause 
cls
echo それ以外のバージョンは動作を保証しません。
pause
cls
echo また、 %~n0を実行する際はにはインターネットに接続されているのを推奨しています。
pause 
cls
echo そしてこのバッチ処理でカーソルを変更すると、カーソルの名称が、(無) になる場合があります。
pause 
cls
echo その際には正規の方法でカーソルを変更しなおしていただくと正常に表記されるようになります。
pause 
cls
echo それ以外のカーソルに関連する問題も、ほとんどの場合はそれで修正されると思います。（そうでない場合の責任は作成者であるtamago1908は取りません。）
pause 
cls
echo このバッチ処理の使用は%username%およびあなたの自己責任で使用してください。
pause 
cls
echo そして稀に、%~n0がウイルスとして検知される場合がありますが、%~n0はウイルスとして作成されたものではありません。
pause 
cls
echo このバッチ処理がウイルスとして検知された場合、それは誤検知ですので、例外に設定するなどして回避してください。
pause 
cls
echo このバッチ処理を終了する際は、なるべくメインメニューの、3 終了 から行ってください。それ以外での終了は不具合の原因になる可能性があります。
pause 
cls
echo 注意点は以上です。
pause
echo それではメニューを開きます。
pause
cls
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo                     カ
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo                     カー
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo                     カーソル
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo                     カーソル替
ping -n 1 127.0.0.1 > nul 2>&1
cls
echo                     カーソル替え
ping -n 1 127.0.0.1 > nul 2>&1
goto loads

:batbootanimationfun
mode con: cols=85 lines=29
find "wmode=true" カーソル替え設定.txt
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
echo                         カーソル替え%batver% ようこそ 2021-2023 %debugmode%
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
find "bootanimation=false" カーソル替え設定.txt > nul
if {%errorlevel%}=={0} (goto checksum)
cls
rem ブートアニメーションを再生。5分の1の確率で別バージョンが再生される。ramdomの仕様(？)によって二回連続でrandomをしないといけない。
set /a bootegg=%random%*6/32767
set /a bootegg=%random%*6/32767
if {%firststartbat%}=={yes} (goto batbootanimationbypassfun)
if {%bootegg%}=={1} (goto batbootanimationfun)
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
echo                      2021-2023 tamago1908 %batbuild%
powershell sleep 1
cls
rem 設定の欠損を確認

:checksum
if {%firststartbat%}=={yes} (goto loads)
if not exist カーソル替え設定.txt (
title カーソルエラー
echo 設定ファイルが存在しません。
pause
echo 恐らく、初回起動をした際にそのままカーソル替えを閉じてから再起動してしまったのが原因でしょう。それか、故意に設定ファイルを消去したか...少なくとも、設定ファイルが存在しないのは事実です。
pause
cls
echo 設定ファイルを再生成します。いままでの設定はすべて削除されます。
pause
cls
type nul > カーソル替え設定.txt
echo nodogcheckfor1234567890qwertyuiop >> カーソル替え設定.txt
echo fastboot=false >> カーソル替え設定.txt
echo wmode=false >> カーソル替え設定.txt
echo admin=false >> カーソル替え設定.txt
echo rebootokey=true >> カーソル替え設定.txt
echo hatenakeikoku=true >> カーソル替え設定.txt
echo bootanimation=true >> カーソル替え設定.txt
title ...
echo 再生成が完了しました。
pause
echo 変更を適用するため、カーソル替えを再起動してください。
pause
exit
)
if not {%allsettingerror%} equ {0} (
    title カーソル欠損
    echo 設定が%allsettingerror%個欠損しています。%allstgerroreastereggmassage%
    echo.
    echo カーソル替えバージョン1.5からバージョン1.9までのバージョンを以前に使用していないことを確認してください。
    echo もしくはカーソル設定.txtの中身を確認してください。
    echo ファイルパスは%HOMEDRIVE%%HOMEPATH%です。
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
echo nodogcheckfor1234567890qwertyuiop > カーソル替え設定.txt
echo fastboot=false >> カーソル替え設定.txt
echo wmode=false >> カーソル替え設定.txt
echo admin=false >> カーソル替え設定.txt
echo rebootokey=true >> カーソル替え設定.txt
echo hatenakeikoku=true >> カーソル替え設定.txt
echo bootanimation=true >> カーソル替え設定.txt
echo.
echo 修復が完了しました。
pause
exit
)
if {%selected%}=={y} (
:overwritesetting
echo nodogcheckfor1234567890qwertyuiop > カーソル替え設定.txt
echo fastboot=false >> カーソル替え設定.txt
echo wmode=false >> カーソル替え設定.txt
echo admin=false >> カーソル替え設定.txt
echo rebootokey=true >> カーソル替え設定.txt
echo hatenakeikoku=true >> カーソル替え設定.txt
echo bootanimation=true >> カーソル替え設定.txt
echo.
echo 修復が完了しました。
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
echo うそだっ！！こんなのありえないっっっ！
pause
goto exit
:setting1load
rem ホワイトモードの検知と色の変更。変更の高速化のため序盤に配置。
find "wmode=true" カーソル替え設定.txt > nul
if {%errorlevel%}=={0} (color f0)
set allsettingerror=0
cls
find "rebootokey=true" カーソル替え設定.txt > nul
cls
if {%bootbatnow%}=={no} (echo 処理中...)
if %ErrorLevel%==0 set setting1onoff=有効
if %ErrorLevel%==1 goto setting1load2
if {%bootbatnow%}=={yes} (
set batloadprgs=1
call :batbootprogress
goto setting2load
)
goto whatloadgoto


:setting2load
find "admin=true" カーソル替え設定.txt > nul
cls
if {%bootbatnow%}=={no} (echo 処理中...)
if %ErrorLevel%==0 set setting2onoff=有効
if %ErrorLevel%==1 goto setting2load2
if {%bootbatnow%}=={yes} (
set batloadprgs=2
call :batbootprogress
goto setting3load
) 
goto whatloadgoto

:setting3load
find "fastboot=true" カーソル替え設定.txt > nul
if {%bootbatnow%}=={no} (echo 処理中...)
if %ErrorLevel%==0 set setting3onoff=有効
if %ErrorLevel%==1 goto setting3load2
if {%bootbatnow%}=={yes} (
set batloadprgs=3
call :batbootprogress
goto setting4load
) 
goto whatloadgoto

:setting4load
find "hatenakeikoku=true" カーソル替え設定.txt > nul
cls
if {%bootbatnow%}=={no} (echo 処理中...)
if %ErrorLevel%==0 set setting4onoff=有効
if %ErrorLevel%==1 goto setting4load2
if {%bootbatnow%}=={yes} (
set batloadprgs=4
call :batbootprogress
goto setting5load
) 
goto whatloadgoto

:setting5load
find "bootanimation=true" カーソル替え設定.txt > nul
cls
if {%bootbatnow%}=={no} (echo 処理中...)
if %ErrorLevel%==0 set setting5onoff=有効
if %ErrorLevel%==1 goto setting5load2
if {%bootbatnow%}=={yes} (
set batloadprgs=5
call :batbootprogress
goto wmodeload
) 
goto whatloadgoto

:wmodeload
find "wmode=true" カーソル替え設定.txt > nul
cls
if {%bootbatnow%}=={no} (echo 処理中...)
if {%ErrorLevel%}=={0} (set wmodeonoff=ダークテーマに変更  &set wmodetoggle=true)
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
find "rebootokey=false" カーソル替え設定.txt > nul
cls
if {%bootbatnow%}=={no} (echo 処理中...)
if %ErrorLevel%==0 (set setting1onoff=無効) else if %ErrorLevel%==1 set setting1onoff=null&set /a allsettingerror=allsettingerror+1
if {%bootbatnow%}=={yes} (set batloadprgs=1&call :batbootprogress)
if {%bootbatnow%}=={yes} (goto setting2load) else (goto whatloadgoto)

:setting2load2
find "admin=false" カーソル替え設定.txt > nul
cls
if {%bootbatnow%}=={no} (echo 処理中...)
if %ErrorLevel%==0 (set setting2onoff=無効) else if %ErrorLevel%==1 set setting2onoff=null&set /a allsettingerror=allsettingerror+1
if {%bootbatnow%}=={yes} (set batloadprgs=2&call :batbootprogress)
if {%bootbatnow%}=={yes} (goto setting3load) else (goto whatloadgoto)

:setting3load2
find "fastboot=false" カーソル替え設定.txt > nul
cls
if {%bootbatnow%}=={no} (echo 処理中...)
if %ErrorLevel%==0 (set setting3onoff=無効) else if %ErrorLevel%==1 set setting3onoff=null&set /a allsettingerror=allsettingerror+1
if {%bootbatnow%}=={yes} (set batloadprgs=3&call :batbootprogress)
if {%bootbatnow%}=={yes} (goto setting4load) else (goto whatloadgoto)

:setting4load2
find "hatenakeikoku=false" カーソル替え設定.txt > nul
cls
if {%bootbatnow%}=={no} (echo 処理中...)
if %ErrorLevel%==0 (set setting4onoff=無効) else if %ErrorLevel%==1 set setting4onoff=null&set /a allsettingerror=allsettingerror+1
if {%bootbatnow%}=={yes} (set batloadprgs=4&call :batbootprogress)
if {%bootbatnow%}=={yes} (goto setting5load2) else (goto whatloadgoto)

:setting5load2
find "bootanimation=false" カーソル替え設定.txt
cls
if {%bootbatnow%}=={no} (echo 処理中...)
if %ErrorLevel%==0 (set setting5onoff=無効) else if %ErrorLevel%==1 set setting5onoff=null&set /a allsettingerror=allsettingerror+1
if {%bootbatnow%}=={yes} (set batloadprgs=5&call :batbootprogress)
if {%bootbatnow%}=={yes} (goto wmodeload) else (goto whatloadgoto)

:wmodeload2
find "wmode=false" カーソル替え設定.txt > nul
cls
if {%bootbatnow%}=={no} (echo 処理中...)
if {%ErrorLevel%}=={0} (set wmodeonoff=ホワイトテーマに変更&set wmodetoggle=false) else if {%ErrorLevel%}=={1} (set wmodeonoff=  null  テーマに変更&set wmodetoggle=false&set /a allsettingerror=allsettingerror+1)
if {%bootbatnow%}=={yes} (set batloadprgs=6&call :batbootprogress)
if {%bootbatnow%}=={yes} (goto loads) else (goto whatloadgoto)

:loads
:wmodehazimeload
rem ホワイトモードを検知して色を変更
find "wmode=true" カーソル替え設定.txt > nul
if {%errorlevel%}=={0} (color f0)
cls
if {%bootbatnow%}=={no} (echo 処理中...) else (
set batloadprgs=6
call :batbootprogress
goto debughazimeload
)
if {%whatloadgoto%}=={hazime} (goto hazimemenu)
goto debughazimeload

:debughazimeload
rem デバックモードの検知
find "debug=true" カーソル替え設定.txt > nul
cls
if {%errorlevel%}=={0} (echo on&set debugmode=debugmode)
if {%errorlevel%}=={1} (echo off&set debugmode=)
if {%bootbatnow%}=={no} (echo 処理中...) else (
set batloadprgs=7
call :batbootprogress
goto firststarttest
)
if {%1}=={devmode} (set devmode=true&goto firststarttest)
if {%whatloadgoto%}=={hazime} (goto hazimemenu)
goto firststarttest

:firststarttest
rem 初回カーソルの検知
find "nodogcheckforfastboot" 初回カーソル.txt > nul
cls
if {%ErrorLevel%}=={1} (goto itazurasyokai)
if {%bootbatnow%}=={no} (echo 処理中...) else (
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
if {%ErrorLevel%}=={0} (set cursorcolor=黒)
if {%ErrorLevel%}=={1} (set cursorcolor=白)
if {%bootbatnow%}=={no} (echo 処理中...) else (
set batloadprgs=9
call :batbootprogress
goto hazimecursorcolor2
)
if {%whatloadgoto%}=={hazime} (goto hazimemenu)

:hazimecursorcolor2
reg query "HKEY_CURRENT_USER\Control Panel\Cursors" /v "Scheme Source" | find "0x2"
cls
if {%ErrorLevel%}=={0} (set cursorcolor=白)
if {%bootbatnow%}=={no} (echo 処理中...) else (
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
if {%bootbatnow%}=={no} (title カーソル設定 処理中... & echo 処理中... & goto whatload) else (title 起動中...)
if {%simpleboot%}=={true} (echo 起動中...& exit /b)
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
echo                       カーソル替えを読み込んでいます...
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
echo                              カーソル替え%batver% %debugmode% %hazimebuild%
title カーソル替え %debugmode% 
set selected=0nul0
echo.
echo   O=====================================================================O
echo   I     1カーソルを%cursorcolor%色にする           2電卓              3終了        I
echo   I                                                                     I
echo   I                   4バージョン情報          5設定                    I
echo   O=====================================================================O
echo.
SET /P selected=任意の実行したい数字、もしくはアルファベットを入力してください... :
echo.
if {%selected%}=={0nul0} (goto hatenahazime)
if not {%selected%}=={3} (echo %selected% が選択されました。)

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
if {%selected%}=={私は眠いです} (echo me too&pause& goto hazime)

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
if {%selected%}=={counttestdeb} (set hatenaita=0&goto :testinthecalbeep) else echo. &echo 無効な（もしくは使用不可な）選択です！有効な入力をしてください。&pause&goto hazime

rem 何も入力しなかった場合の帰還処理
:hatenahazime
echo ?
echo.
pause
echo すみません。何か入力してくれませんか？
echo.
pause
find "hatenakeikoku=false" カーソル替え設定.txt > nul
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
shutdown /s /t 5 /c "後悔するがよい。"
taskkill /im cmd.exe
goto :reboot

:itazurasyokai
rem メッセージ表示
echo Dim answer:answer = MsgBox("イタズラに初回カーソル.txtの中身消しただろ!!!全部お見通しだ！",vbOKCancel,"さっさと戻せ、じゃないと永遠に流れるぞ"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
rem ファイル削除
del /Q %TEMP%\msgbox.vbs
rem メッセージ表示
echo Dim answer:answer = MsgBox("もし直したければ、nodogcheckforfastbootを初回カーソル.txtに入れるんだな。",vbOKCancel,"さっさと戻せ"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
rem ファイル削除
del /Q %TEMP%\msgbox.vbs
exit


rem 終了処理とそれの確認
rem todolist, ここの部分にGUIを実装して、再起動とかの機能を付ける。
:exitmenu
title 終了確認 %debugmode% 
set selected=0nul0
echo.
SET /P selected=本当に終了しますか？（yesまたはno）:
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
if not exist カーソル替え設定.txt (goto dogcheck)
title カーソル設定 %debugmode%
set selected=0nul0
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
Echo I                        I  [W S] か [1 2] どちらかを押してカテゴリーを   I
echo I カーソル替え  見た目系 I  選択してください。                            I
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
if %ErrorLevel%==4 goto settingcategory1
if %ErrorLevel%==5 goto settingcategory1
if %ErrorLevel%==6 goto hazime
if %ErrorLevel%==7 goto settingcategory1
if %ErrorLevel%==8 goto settingcategory1
if %ErrorLevel%==9 goto settingcategoryhelpmode

:settingcategory1
title カーソル設定 %debugmode%
set selected=0nul0
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
cd /d %HOMEDRIVE%%HOMEPATH%
rem 場所 OSが入ったドライブ:\Users\ユーザー名
rem (例 ユーザーの名前がtestだった場合と、OSが入った場所がCドライブだった場合だと C:\Users\Test)
if not exist カーソル替え設定.txt (goto dogcheck)
title カーソル設定 %debugmode%
set selected=0nul0
Cls
Echo.
Echo                               設定メニュー Ver2!!
echo. 
echo O========================O                  O======O
echo I      カテゴリー        I                  I 設定 I
echo O========================O==================O======O======================O
echo I                        I                                                I
echo I  カーソル替え  機能系  I  カーソル替えの見た目に関する設定です。        I
echo I                        I （テーマなど）                                 I
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
set selected=0nul0
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
Echo O  カテゴリー  上か下か  I 3 高速起動機能                      I   %setting3onoff%   I
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
set selected=0nul0
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
Echo O  カテゴリー  上か下か  I 3 高速起動機能                      I   %setting3onoff%   I
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
set selected=0nul0
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
Echo O  カテゴリー  上か下か  I 3 高速起動機能                      I   %setting3onoff%   I
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
set selected=0nul0
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
Echo O  カテゴリー  上か下か  I %clr%3 高速起動機能%clr2%                      I   %setting3onoff%   I
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
set selected=0nul0
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
Echo O  カテゴリー  上か下か  I 3 高速起動機能                      I   %setting3onoff%   I
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
set selected=0nul0
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
Echo O  カテゴリー  上か下か  I 3 高速起動機能                      I   %setting3onoff%   I
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
set selected=0nul0
Cls
Echo.
Echo                               設定メニュー Ver2!!
echo. 
echo O========================O                  O======O
echo I      カテゴリー        I                  I 設定 I
echo O========================O==================O======O======================O
echo I                        I 1 起動時のアニメーション            I   %setting5onoff%   I
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
title カーソル設定 %debugmode%
set selected=0nul0
Cls
Echo.
Echo                               設定メニュー Ver2!!  
echo. 
echo O========================O                  O======O
echo I      カテゴリー        I                  I 設定 I
echo O========================O==================O======O======================O
echo I                        I %clr%1 起動時のアニメーション%clr2%            I   %setting5onoff%   I
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
if %ErrorLevel%==7 goto setting5
if %ErrorLevel%==8 goto setting5

:settingcategory2intsetting2
title カーソル設定 %debugmode%
set selected=0nul0
Cls
Echo.
Echo                               設定メニュー Ver2!!
echo. 
echo O========================O                  O======O
echo I      カテゴリー        I                  I 設定 I
echo O========================O==================O======O======================O
echo I                        I 1 起動時のアニメーション            I   %setting5onoff%   I
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


:settingcategoryhelpmode
rem メモ ここの分岐のtrueのところに、clrの色を変える処理を追加したい。choiceの直後に分岐でもとに戻す処理も追加して
if {%settinghelptoggle%}=={true} (set settinghelp=有効)
if {%settinghelptoggle%}=={false} (set settinghelp=無効)
title カーソル設定 %debugmode%
set selected=0nul0
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
echo I                        I  ヘルプモードは%settinghelp%です                        I
echo O========================O==O=====================O==========O============O
echo I%clr%      ヘルプモード      %clr2%I  I 移動 : W A S D 数字 I 戻る : B I 決定 : Y E I
echo O========================O  O=====================O==========O============O
echo.
echo.
choice /c 12wsbye3 /n /m "変更するものを数字で指定又はwasdで移動して指定してください"
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
find "rebootokey=false" カーソル替え設定.txt > nul
if %ErrorLevel%==0 set setting1setonoff=有効&goto setting1okey
if %ErrorLevel%==1 set setting1setonoff=修復し、正常な状態& goto setting1onoff

:setting1onoff
find "rebootokey=true" カーソル替え設定.txt > nul
if %ErrorLevel%==0 set setting1setonoff=無効

:setting1okey
cls
set selected=0nul0
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
call :batbootprogress
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
call :batbootprogress
Goto settingcategory1intsetting2

:setting2n
cls
Echo 起動時の管理者権限の要求は%setting2onoff%になりませんでした
Pause
goto settingcategory1intsetting2

:setting3
if {%settinghelptoggle%}=={true} (goto setting3help)
find "fastboot=false" カーソル替え設定.txt > nul
if %ErrorLevel%==0 set setting3setonoff=有効&goto setting3onoff
if %ErrorLevel%==1 set setting3setonoff=修復し、正常な状態&goto setting3onoff

:setting3onoff
find "fastboot=true" カーソル替え設定.txt > nul
if %ErrorLevel%==0 set setting3setonoff=無効&set setting3warning=
:setting3okey
cls
echo 高速起動を%setting3setonoff%にしますか？(Y=はい N=いいえ B=戻る)
SET /P selected= :
echo %selected% が選択されました。
if {%selected%}=={y} (goto :setting3y)
if {%selected%}=={n} (goto :setting3n)
if {%selected%}=={back} (goto :settingcategory1intsetting3)
if {%selected%}=={b} (goto :settingcategory1intsetting3)
goto setting3okey

:setting3y
find "fastboot=false" カーソル替え設定.txt > nul
echo 設定を適用中...
if %ErrorLevel%==1 goto setting3ygo3test
if %ErrorLevel%==0 goto setting3ygo1

:setting3ygo3test
find "fastboot=true" カーソル替え設定.txt > nul
if %ErrorLevel%==1 echo fastboot=false >> カーソル替え設定.txt
if %ErrorLevel%==0 goto setting3ygo2

:setting3ygo2
powershell "(gc カーソル替え設定.txt) -replace 'fastboot=true','fastboot=false' | sc カーソル替え設定.txt"
goto setting3yokey

:setting3ygo1
powershell "(gc カーソル替え設定.txt) -replace 'fastboot=false','fastboot=true' | sc カーソル替え設定.txt"
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
call :batbootprogress
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
call :batbootprogress
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
if {%selected%}=={back} (goto :settingcategory2intsetting1)
if {%selected%}=={b} (goto :settingcategory2intsetting1)
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
call :batbootprogress
Goto settingcategory2intsetting1

:setting5n
cls
Echo 設定を変更しませんでした
Pause
goto settingcategory2intsetting1


:wmode
if {%settinghelptoggle%}=={true} (goto wmodehelp)
cd /d %HOMEDRIVE%%HOMEPATH%
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
echo ?
echo.
pause
echo すみません。もう一度言っていただけませんか？
echo.
pause
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
call :batbootprogress
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
echo この設定は名前の通り、起動時間を短縮する設定です。
echo この設定を有効にすると、一部の処理をスキップし、（メインの処理には影響なし）
echo 起動時間がPCのスペックにもよりますが0.5秒ほど短縮されます。
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
goto settingcategory2intsetting1

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
echo.
echo カーソル替え ver %batver%   2021-2023
if %hazimeeaster%==true echo %batbuild%
title カーソル替え thenks so much %username%
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
goto default

:no0
echo 変更はされませんでした。
pause
goto hazime

:yes0
if exist カーソル替え設定.txt goto henkoudefo
if not exist カーソル替え設定.txt goto saisyonokeikoku
rem 設定の書き込み(default)
:saisyonokeikoku
type nul > カーソル替え設定.txt
echo nodogcheckfor1234567890qwertyuiop >> カーソル替え設定.txt
echo fastboot=false >> カーソル替え設定.txt
echo wmode=false >> カーソル替え設定.txt
echo admin=false >> カーソル替え設定.txt
echo rebootokey=true >> カーソル替え設定.txt
echo hatenakeikoku=true >> カーソル替え設定.txt
echo bootanimation=true >> カーソル替え設定.txt

rem 警告メッセージ、初回起動時限定
cls
echo (初回起動時のみ)
powershell sleep -m 500
cls
echo.
powershell sleep -m 100
color 04
echo 　　　                         　！注意！
powershell sleep -m 200
color 0c
powershell sleep -m 100
color 07
powershell sleep -m 500
echo.
echo このbatファイル（以下、スクリプト）は、カーソルをデフォルト、または黒色にするだけのスクリプトです。
powershell sleep -m 2000
echo ないとは思いますが、このスクリプトを使用するにあたって発生した損害、またはコンピューターの損傷等の被害の責任は製作者であるそこら辺にある卵は一切の責任を取りません！
pause
echo.
echo.
rem 警告の分岐。noを入力するとカーソル替え設定.txtが削除される。
:warningfirstchenge
SET /P selected=よろしいですか？(Y=Yes / N=No)
if {%selected%}=={n} (del カーソル替え設定.txt & goto exit)
if {%selected%}=={no} (del カーソル替え設定.txt & goto exit) 
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
rundll32 user32.dll,MessageBeep
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
rundll32 user32.dll,MessageBeep
echo なに！？なぜだ！こんなことはあり得ないっ！！！俺のそばに近寄るなぁーっ！
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
cd /d %HOMEDRIVE%%HOMEPATH%
if {%settinghelptoggle%}=={true} (goto alldefhelp)
if exist カーソル替え設定.txt goto AllDefulttest
if not exist カーソル替え設定.txt goto Dogcheck

:Dogcheck
rem dogcheck, respect tobyfox and dog

if {%firststartbat%}=={yes} (cls&echo まず最初にカーソルの色を変更してください！&echo.&pause&goto hazime)
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
type nul > カーソル替え設定.txt
echo nodogcheckfor1234567890qwertyuiop >> カーソル替え設定.txt
echo fastboot=false >> カーソル替え設定.txt
echo wmode=false >> カーソル替え設定.txt
echo admin=false >> カーソル替え設定.txt
echo rebootokey=true >> カーソル替え設定.txt
echo hatenakeikoku=true >> カーソル替え設定.txt
echo bootanimation=true >> カーソル替え設定.txt
title ...
echo 初期化が完了しました。変更を適用するため、カーソル替えを終了します。なので再起動をお願いたします。
goto exit

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
start explorer %HOMEDRIVE%%HOMEPATH%
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
set alldefno2clr=[96m
set alldefno2clr2=[40m[3m
cls
color 0B
echo %alldefno2clr2%%alldefno2clr%時を戻そう
powershell sleep 2
find "wmode=false" カーソル替え設定.txt > nul
if %ErrorLevel%==0 color 07
if %ErrorLevel%==1 goto wmodeonoffkenti
:wmodeonoffkentialldefno2
find "wmode=true" カーソル替え設定.txt > nul
if %ErrorLevel%==0 color f0
goto hazime

:yes2
rem アンインストールの最終確認
set selected=null
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
set selected=null
echo.
rundll32 user32.dll,MessageBeep
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
cd /d %HOMEDRIVE%%HOMEPATH%
if not exist 初回カーソル.txt set erroralldefwhatdelete=初回カーソル & goto erroralldef1
:testerroralldef
if not exist カーソル替え設定.txt set erroralldefwhatdelete=カーソル替え設定 & goto erroralldef1
set erroralldefwhatdelete=初回カーソル.txtと、カーソル替え設定.txt、その両方の
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
echo *** MEMORY LOG: E3 81 93 E3 81 AE E5 A4 89 E6 85 8B EF BC 81 2E 2E 2E E3 82 88 E3 81 8F E3 81 93 E3 82 93 E3 81 AA E3 81 AE E8 A7 A3 E6 9E 90 E3 81 97 E3 82 88 E3 81 86 E3 81 A8 E6 80 9D E3 81 A3 E3 81 9F E3 82 8F E3 81 AD EF BC 81 E3 81 9D E3 81 AE E7 82 B9 E3 81 A0 E3 81 91 E3 81 AF E7 A7 B0 E8 B3 9B E3 81 AB E5 80 A4 E3 81 99 E3 82 8B E3 82 8F 2E 2E 2E 2E E3 81 BE E3 81 A3 E3 81 9F E3 81 8F E3 80 82
echo.
echo Beginning dump of physical memory
echo physical memory dump complete.
echo Contact your system administrator or technical support group for further echo assistance.
goto :erroralldef1massage

:erroralldef1massage
echo Dim answer:answer = MsgBox("どうなるのか、わかってるのかな？",vbOKCancel,"エラー"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul
if {%errorlevel%}=={1} (goto :erroralldef2massage)
if {%errorlevel%}=={2} (goto :erroralldef2massage)

:erroralldef2massage
echo Dim answer:answer = MsgBox("このエラーはすべてをデフォルトに戻す際に存在しているはずのファイルが存在していないときに発生します。",vbOKCancel,"エラーの原因"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul
rem ファイル削除
del /Q %TEMP%\msgbox.vbs
goto erroralldef3massage

:erroralldef3massage
echo Dim answer:answer = MsgBox("まぁ、おそらくあなたが AllDefult を実行する際に%erroralldefwhatdelete%.txtを削除したのが原因だと思いますけどね。",vbYesno,"エラーの本当の原因"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
echo %errorlevel% > nul
if {%errorlevel%}=={6} (goto :erroralldef3massageok)
if {%errorlevel%}=={7} (goto :erroralldef3massageno)
goto erroralldef3massage

:erroralldef3massageok
echo Dim answer:answer = MsgBox("やっぱりね。",vbOKCancel,"エラー"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
rem ファイル削除
del /Q %TEMP%\msgbox.vbs
exit

:erroralldef3massageno
echo Dim answer:answer = MsgBox("うっそーん。でも、本当にバグでこれが起きたってことなら製作者に伝えて直してもらってくださいね。",vbOKCancel,"エラー？"):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs
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
del 初回カーソル.txt
del カーソル替え設定.txt
goto alldefnowfinish

:alldefnowhenkou
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
del %~0
goto exit

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
goto reboot

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
goto exit

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
if {%selected%}=={siranai} (goto :secretnomal)
if {%selected%}=={siran} (goto :secretnomal)
if {%selected%}=={kaiseki} (goto :secrethentai)
if {%selected%}=={tyokkan} (goto :secretnomal)

if {%selected%}=={tyokkan} (goto :secretnomal) else (goto secretnomal)

echo.
echo ?
pause
echo.
echo すみません。もう一度言っていただけませんか？
pause
goto rebootok

:secretnomal
echo えっ？てことは直感でやったってことなの？
pause
echo うそでしょ...?
goto exit
:secrethentai
echo キャーッ！%USERNAME%さんのエッチー！
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
echo            %clrcyan%-%clr2% bypsadm           %clrgra%(Bypass the getting admin.)%clr2%
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
title ^(デバッグ用^) カーソル変数
echo.
echo fulldebug を起動しています...
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
cls&pause&echo hello! this is easteregg!&pause&cls&title 隠し機能でメインメニューとバージョン情報の部分でビルドナンバーが表示されるようになった&echo and bye!&pause&cls&set hazimeeaster=true&goto hazime


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