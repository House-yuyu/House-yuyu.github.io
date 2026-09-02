@echo off
setlocal
cd /d "%~dp0"

if not defined GOOGLE_SCHOLAR_ID set "GOOGLE_SCHOLAR_ID=xDDy-DwAAAAJ"
set "PYTHON=.venv\Scripts\python.exe"
if not exist "%PYTHON%" (
  echo Missing %CD%\.venv. Create it and install requirements first.
  exit /b 1
)

"%PYTHON%" main.py
if errorlevel 1 exit /b 1

for /f "delims=" %%i in ('git -C ".." remote get-url --push origin') do set "REMOTE=%%i"
git -C results init
git -C results config user.name "Google Scholar Updater"
git -C results config user.email "41898282+github-actions[bot]@users.noreply.github.com"
git -C results add gs_data.json gs_data_shieldsio.json
git -C results diff --cached --quiet
if errorlevel 2 exit /b 1
if errorlevel 1 goto push_stats

echo Google Scholar data is unchanged.
exit /b 0

:push_stats
git -C results commit -m "Update Google Scholar statistics"
if errorlevel 1 exit /b 1
git -C results push "%REMOTE%" HEAD:google-scholar-stats --force
if errorlevel 1 exit /b 1
echo Google Scholar data pushed successfully.
