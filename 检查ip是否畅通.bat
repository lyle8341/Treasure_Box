@echo off
set /p ip=ÇëÊäÈëÄãµÄIPµØÖ·£º
:start
ping %ip% >>ip.txt
ping  -n 60 127.1 >nul 2>nul
goto start
pause