REM @echo off
setlocal enabledelayedexpansion
nircmd win hide class Shell_TrayWnd

:: Example JSON
REM for /f "delims=" %%A in ('glazewm query focused') do set "json=%%A"
REM for /f "delims=" %%A in ('glazewm query focused ^| rg "\"width\"\:(\d+)" -or "$1" -') do set "W=%%A"
for /f "delims=" %%A in ('glazewm query focused ^| rg "\"x\"\:(\d+)\," -or "$1" -') do set "W=%%A"

REM echo !W!

if !W! GTR 10 (
  glazewm command set-tiling-direction vertical
) else (
  glazewm command set-tiling-direction horizontal
)
