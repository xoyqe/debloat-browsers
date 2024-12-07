@ECHO OFF
:: REM URL: http://stackoverflow.com/questions/12621969/clear-cache-of-browser-by-command-line
IF NOT EXIST "%TEMP%" GOTO :SkipTemp
ERASE "%TEMP%\*.*" /F /S /Q
FOR /D %%i IN ("%TEMP%\*") DO RMDIR /S /Q "%%i"
:SkipTemp

IF NOT EXIST "%TMP%" GOTO :SkipTmp
ERASE "%TMP%\*.*" /F /S /Q
FOR /D %%i IN ("%TMP%\*") DO RMDIR /S /Q "%%i"
:SkipTmp

IF NOT EXIST "%ALLUSERSPROFILE%\TEMP" GOTO :SkipAUPTemp
ERASE "%ALLUSERSPROFILE%\TEMP\*.*" /F /S /Q
FOR /D %%i IN ("%ALLUSERSPROFILE%\TEMP\*") DO RMDIR /S /Q "%%i"
:SkipAUPTemp

IF NOT EXIST "%SystemRoot%\TEMP" GOTO :SkipSRTemp
ERASE "%SystemRoot%\TEMP\*.*" /F /S /Q
FOR /D %%i IN ("%SystemRoot%\TEMP\*") DO RMDIR /S /Q "%%i"
:SkipSRTemp

@REM Java Cache
IF NOT EXIST "%USERPROFILE%\AppData\LocalLow\Sun\Java\Deployment\cache" GOTO :SkipJavaCache
ERASE "%USERPROFILE%\AppData\LocalLow\Sun\Java\Deployment\cache\*.*" /F /S /Q
FOR /D %%i IN ("%%a\AppData\LocalLow\Sun\Java\Deployment\cache\*.*" ) DO RMDIR /S /Q "%%i"
SET JAVA_CMD="%JAVA_HOME%\bin\javaws.exe"
@REM Remove all non-installed applications from the cache.
@REM Remove all applications from the cache.
CALL %JAVA_CMD% -clearcache -uninstall 
SET JAVA_CMD=
:SkipJavaCache

@REM Clear IE cache -  (Delete All)
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 255

IF NOT EXIST "%LOCALAPPDATA%\Microsoft\Windows\Tempor~1" GOTO :SkipLADTemp
ERASE "%LOCALAPPDATA%\Microsoft\Windows\Tempor~1\*.*" /F /S /Q
FOR /D %%i IN ("%LOCALAPPDATA%\Microsoft\Windows\Tempor~1\*") DO RMDIR /S /Q "%%i"
:SkipLADTemp

@REM Clear Google Chrome cache
IF NOT EXIST "%LOCALAPPDATA%\Google\Chrome\User Data\" GOTO :SkipChrome
ERASE "%LOCALAPPDATA%\Google\Chrome\User Data\*.*" /F /S /Q
FOR /D %%i IN ("%LOCALAPPDATA%\Google\Chrome\User Data\*") DO RMDIR /S /Q "%%i"
:SkipChrome

@REM Clear Firefox cache
IF NOT EXIST "%LOCALAPPDATA%\Mozilla\Firefox\Profiles\" GOTO :SkipFirefox
ERASE "%LOCALAPPDATA%\Mozilla\Firefox\Profiles\*.*" /F /S /Q
FOR /D %%i IN ("%LOCALAPPDATA%\Mozilla\Firefox\Profiles\*") DO RMDIR /S /Q "%%i"
:SkipFirefox

@REM Clear Edge Cache
IF NOT EXIST "%LOCALAPPDATA%\Microsoft\Edge\User Data\" GOTO :SkipEdge
ERASE "%LOCALAPPDATA%\Microsoft\Edge\User Data\*.*" /F /S /Q
FOR /D %%i IN ("%LOCALAPPDATA%\Microsoft\Edge\User Data\*") DO RMDIR /S /Q/ "%%~i"
:SkipEdge

EXIT /B 0