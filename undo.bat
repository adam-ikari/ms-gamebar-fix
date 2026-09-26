@echo off
rem Undo the ms-gamebar fix: removes the no-op protocol handlers.

reg delete "HKCU\Software\Classes\ms-gamebar" /f >nul 2>&1
reg delete "HKCU\Software\Classes\ms-gamebarservices" /f >nul 2>&1
del "%LocalAppData%\ms-gamebar-noop.vbs" >nul 2>&1

echo.
echo  已还原,协议处理器已全部删除。
echo.
pause
