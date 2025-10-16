@echo off
setlocal enabledelayedexpansion

:: Example JSON
REM for /f "delims=" %%A in ('glazewm query focused') do set "json=%%A"
for /f "delims=" %%A in ('glazewm query focused ^| rg "\"width\"\:(\d+)" -or "$1" -') do set "W=%%A"

if 1900 GTR !W! (
  glazewm command set-tiling-direction vertical
) else (
  glazewm command set-tiling-direction horizontal
)
 
