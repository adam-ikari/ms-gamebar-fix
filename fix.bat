@echo off
rem Fix "You'll need a new app to open ms-gamebar" popup (LTSC etc.)
rem - Registers no-op handlers for ms-gamebar / ms-gamebarservices protocols
rem - Handler uses wscript.exe (GUI subsystem): no popup, no window flash at all
rem - Writes to HKCU only, no admin required

setlocal
set "VBS=%LocalAppData%\ms-gamebar-noop.vbs"
> "%VBS%" echo ' no-op handler for ms-gamebar protocol, exits immediately

reg add "HKCU\Software\Classes\ms-gamebar" /ve /d "URL:ms-gamebar" /f >nul
reg add "HKCU\Software\Classes\ms-gamebar" /v "URL Protocol" /t REG_SZ /d "" /f >nul
reg add "HKCU\Software\Classes\ms-gamebar" /v "NoOpenWith" /t REG_SZ /d "" /f >nul
reg add "HKCU\Software\Classes\ms-gamebar\shell\open\command" /ve /d "\"C:\Windows\System32\wscript.exe\" //B //Nologo \"%VBS%\"" /f >nul

reg add "HKCU\Software\Classes\ms-gamebarservices" /ve /d "URL:ms-gamebarservices" /f >nul
reg add "HKCU\Software\Classes\ms-gamebarservices" /v "URL Protocol" /t REG_SZ /d "" /f >nul
reg add "HKCU\Software\Classes\ms-gamebarservices" /v "NoOpenWith" /t REG_SZ /d "" /f >nul
reg add "HKCU\Software\Classes\ms-gamebarservices\shell\open\command" /ve /d "\"C:\Windows\System32\wscript.exe\" //B //Nologo \"%VBS%\"" /f >nul

echo.
echo  修复完成!重新连接手柄,不会再有任何弹窗或窗口。
echo  如需还原,请运行 undo.bat
echo.
pause
