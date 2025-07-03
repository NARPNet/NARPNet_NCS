@echo off

set SCRIPT_DIR="%~dp0"

echo DID YOU UPDATE THE VERSION?
pause

echo.
echo Making release zip ...

cd "%SCRIPT_DIR%"
cd ..\src
rd /q /s ..\release
mkdir ..\release 
powershell Compress-Archive NARPNet_NCS ..\release\NARPNet_NCS-X.Y.Z-windows.zip
cd ..

echo.
echo Done.
echo.

pause