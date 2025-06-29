@echo off

set "search1=MACRO_DIR/files/"
set "replace1=%~dp0files\"
set "search2=MACRO_DIR/"
set "replace2=%~dp0"

if exist "NARPNet_NCS.mdf.orig" (
  echo ####################################
  echo You can't run setup.bat twice.
  echo Delete NARPNet_NCS.mdf, then rename NARPNet_NCS.mdf.orig to NARPNet_NCS.mdf.
  echo This will let you run it again.
  echo ####################################
) else (
  echo Fixing file paths in NARPNet_NCS.mdf to match your macro location:
  echo   %replace2%

  rename NARPNet_NCS.mdf NARPNet_NCS.mdf.orig
  rename NARPNet_OP.mdf NARPNet_OP.mdf.orig
  rename NARPNet_NET.mdf NARPNet_NET.mdf.orig
  copy PERSONAL.mdf PERSONAL.orig

  powershell -Command "(gc NARPNet_NCS.mdf.orig) -replace '%search1%', '%replace1%' | Out-File -encoding ASCII NARPNet_NCS.mdf.1"
  powershell -Command "(gc NARPNet_OP.mdf.orig) -replace '%search1%', '%replace1%' | Out-File -encoding ASCII NARPNet_OP.mdf.1"
  powershell -Command "(gc NARPNet_NET.mdf.orig) -replace '%search1%', '%replace1%' | Out-File -encoding ASCII NARPNet_NET.mdf.1"
  powershell -Command "(gc PERSONAL.orig) -replace '%search1%', '%replace1%' | Out-File -encoding ASCII PERSONAL.1"

  powershell -Command "(gc NARPNet_NCS.mdf.1) -replace '%search2%', '%replace2%' | Out-File -encoding ASCII NARPNet_NCS.mdf."
  powershell -Command "(gc NARPNet_OP.mdf.1) -replace '%search2%', '%replace2%' | Out-File -encoding ASCII NARPNet_OP.mdf."
  powershell -Command "(gc NARPNet_NET.mdf.1) -replace '%search2%', '%replace2%' | Out-File -encoding ASCII NARPNet_NET.mdf"
  powershell -Command "(gc PERSONAL.1) -replace '%search2%', '%replace2%' | Out-File -encoding ASCII PERSONAL.mdf"

  del NARPNet_NCS.mdf.1 NARPNet_OP.mdf.1 NARPNet_NET.mdf.1 PERSONAL.1

  echo.
  echo Done.
  echo.
)

pause
