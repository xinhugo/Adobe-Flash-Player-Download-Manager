@echo off
title Adobe Flash Player Download Manager
PUSHD %~dp0
cd /d "%~dp0"

:Permission check
if "%PROCESSOR_ARCHITECTURE%" == "AMD64" (set SystemPath = %SystemRoot%\SysWOW64) else (set SystemPath = %SystemRoot%\system32)
::rd "%SystemPath%\Test_Permissions" > nul 2 > nul
::md "%SystemPath%\Test_Permissions" 2 > nul || (echo Require Administrator Permission. && pause > nul && Exit)
::rd "%SystemPath%\Test_Permissions" > nul 2 > nul
del /f /q %SystemPath%\TestPermission.log
echo "Permission check." >> %SystemPath%\TestPermission.log
if not exist %SystemPath%\TestPermission.log (echo Require Administrator Permission. && pause > nul && Exit)
del /f /q %SystemPath%\TestPermission.log

:Ver
Ver|Find /I "5.1" > nul 2>nul 2>nul
If "%ERRORLEVEL%"=="0" (Goto Main)
Ver|Find /I "5.2" > nul 2>nul 2>nul
If "%ERRORLEVEL%"=="0" (Goto Main)
Ver|Find /I "6.0" > nul 2>nul 2>nul
If "%ERRORLEVEL%"=="0" (Goto Main)
Ver|Find /I "6.1" > nul 2>nul 2>nul
If "%ERRORLEVEL%"=="0" (Goto Main)
Ver|Find /I "6.2" > nul 2>nul 2>nul
If "%ERRORLEVEL%"=="0" (Goto Main)
Ver|Find /I "6.3" > nul 2>nul 2>nul
If "%ERRORLEVEL%"=="0" (Goto Main)
Cls 
Echo ��Ǹ��ȡϵͳ�汾������ȷ�����ϵͳ�Ƿ�ΪWindows XP/2003/Vista/2008/7/2008 R2/8/8.1����������˳���
Pause>nul
exit

:Main
cls
echo.
echo     ���� ����/��װ Adobe Flash Player......
echo.&echo.
echo     1)���أ�Adobe Flash Player
echo     2)��װ��Adobe Flash Player
echo.
echo     3)ɾ�������صİ�װ�ļ������ⲻͬ�ļ�����ضϵ�������
echo.
echo.&echo.
echo     ��л�������������� aria2 �� HTTP �������������ݡ�
echo.&echo.
echo     �汾��2015/1/27��������Hugo����ϵ��hugox.chan@gmail.com
echo.
echo ---------------------------------------------------------------------------
echo.
SET /P ST=   ���������֣�
echo. 
if /I "%ST%"=="1" goto Download-Tool
if /I "%ST%"=="2" goto Setup
if /I "%ST%"=="3" goto Delete
echo    ��Чѡ�񣬰�������˳���
pause >nul
exit

:Download-Tool
if exist "aria2\aria2c.exe" set aria2c="aria2\aria2c.exe" &goto Download
if exist "D:\�����\��ɫ����\���繤��\�ϴ�����\aria2\x64\aria2c.exe" set aria2c="D:\�����\��ɫ����\���繤��\�ϴ�����\aria2\x64\aria2c.exe"
if not exist "aria2\aria2c.exe" if not exist "D:\�����\��ɫ����\���繤��\�ϴ�����\aria2\x64\aria2c.exe"  echo.&echo.&echo.&echo.&echo.&echo.&echo                                    ȱ�� aria2�����������ء�&echo.&echo.&echo.&echo.&echo                                         ��������˳�&pause>nul& exit

:Download
cls
echo.
echo     ���� ���� Adobe Flash Player......
echo.&echo. 
echo     ������ %aria2c% ���ء�
echo.&echo. 
echo     1)���أ�Flash Player for ActiveX (Internet Explorer)
echo     2)���أ�Flash Player Plug-in (All other browsers)
echo     3)���أ�Flash Player for ActiveX �� Flash Player Plug-in
echo.
echo     4)�������˵�
echo.&echo.
echo     ��л�������������� aria2 �� HTTP �������������ݡ�
echo.&echo.
echo     �汾��2015/1/27��������Hugo����ϵ��hugox.chan@gmail.com
echo.
echo ---------------------------------------------------------------------------
echo.
SET /P ST=   ���������֣�
echo. 
if /I "%ST%"=="1" goto Download_1
if /I "%ST%"=="2" goto Download_2
if /I "%ST%"=="3" goto Download_3
if /I "%ST%"=="4" goto Main
echo    ��Чѡ�񣬰�������˳���
pause >nul
exit

:Download_1
if not exist install_flash_player_ax.exe.aria2 if exist install_flash_player_ax.exe del install_flash_player_ax.exe
%aria2c% -c -s16 -x16 -k1m --remote-time=true --enable-mmap --file-allocation=falloc --disk-cache=64M --header=Referer:http://helpx.adobe.com/flash-player/kb/installation-problems-flash-player-windows.html http://fpdownload.macromedia.com/pub/flashplayer/latest/help/install_flash_player_ax.exe
goto Setup

:Download_2
if not exist install_flash_player.exe.aria2 if exist install_flash_player.exe del install_flash_player.exe
rem if exist install_flash_player.exe del install_flash_player.exe
%aria2c% -c -s16 -x16 -k1m --remote-time=true --enable-mmap --file-allocation=falloc --disk-cache=64M --header=Referer:http://helpx.adobe.com/flash-player/kb/installation-problems-flash-player-windows.html http://fpdownload.macromedia.com/pub/flashplayer/latest/help/install_flash_player.exe
goto Setup

:Download_3
if not exist install_flash_player_ax.exe.aria2 if exist install_flash_player_ax.exe del install_flash_player_ax.exe
if not exist install_flash_player.exe.aria2 if exist install_flash_player.exe del install_flash_player.exe
%aria2c% -c -s16 -x16 -k1m --remote-time=true --enable-mmap --file-allocation=falloc --disk-cache=64M --header=Referer:http://helpx.adobe.com/flash-player/kb/installation-problems-flash-player-windows.html http://fpdownload.macromedia.com/pub/flashplayer/latest/help/install_flash_player_ax.exe
%aria2c% -c -s16 -x16 -k1m --remote-time=true --enable-mmap --file-allocation=falloc --disk-cache=64M --header=Referer:http://helpx.adobe.com/flash-player/kb/installation-problems-flash-player-windows.html http://fpdownload.macromedia.com/pub/flashplayer/latest/help/install_flash_player.exe
goto Setup

:Setup
rem if exist install_flash_player_ax.exe.1 del install_flash_player_ax.exe &ren install_flash_player_ax.exe.1 install_flash_player_ax.exe
rem if exist install_flash_player.exe.1 del install_flash_player.exe &ren install_flash_player.exe.1 install_flash_player.exe
cls
echo.
echo     ���� ��װ Adobe Flash Player......
echo.&echo.
echo     1)��װ��Flash Player for ActiveX (Internet Explorer)
echo     2)��װ��Flash Player Plug-in (All other browsers)
echo     3)��װ��Flash Player for ActiveX �� Flash Player Plug-in
echo.
echo     4)�������˵�
echo.&echo.
echo     ��л�������������� aria2 �� HTTP �������������ݡ�
echo.&echo.
echo     �汾��2015/1/27��������Hugo����ϵ��hugox.chan@gmail.com
echo.
echo ---------------------------------------------------------------------------
echo.
SET /P ST=   ���������֣�
echo. 
if /I "%ST%"=="1" goto Setup_1
if /I "%ST%"=="2" goto Setup_2
if /I "%ST%"=="3" goto Setup_3
if /I "%ST%"=="4" goto Main
echo    ��Чѡ�񣬰�������˳���
pause >nul
exit

:Setup_1
cls
if not exist install_flash_player_ax.exe echo δ�ҵ� install_flash_player_ax.exe�������ء� &echo.&pause &goto Main
start install_flash_player_ax.exe /install
goto Finish

:Setup_2
cls
if not exist install_flash_player.exe echo δ�ҵ� install_flash_player.exe�������ء� &echo.&pause &goto Main
start install_flash_player.exe /install
goto Finish

:Setup_3
cls
if not exist install_flash_player_ax.exe echo δ�ҵ� install_flash_player_ax.exe�������ء� &echo.&pause &goto Main
if not exist install_flash_player.exe echo δ�ҵ� install_flash_player.exe�������ء� &echo.&pause &goto Main
start install_flash_player_ax.exe /install
start /wait install_flash_player.exe /install

:Finish
cls
echo.&echo    ��װ��ɣ���������˳���
pause >nul &exit

:Delete
if exist install_flash_player* del install_flash_player*
echo.&echo    ������ɣ�����������ء�
pause >nul &goto Main