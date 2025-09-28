@echo off
setlocal enabledelayedexpansion

:: Example JSON
set "json={"width":1900,"height":1035,"x":10,"y":35}"

:: Use rg to print all matches for width and height
echo !json! | rg "\"width\"\:(\d+)" -or "$1"
echo !json! | rg "\"height\"\:(\d+)" -or "$1"

:: defaults
REM set "W=0"
REM set "H=0"

:: Run glazewm once, filter width/height lines, iterate those lines
REM for /f "usebackq tokens=1* delims=:" %%A in (`glazewm query focused ^| findstr /R /C:"\"width\"" /C:"\"height\""`) do (
REM     set "key=%%~A"
REM     set "val=%%~B"
REM
REM     :: strip spaces, quotes and trailing commas
REM     set "key=!key: =!"
REM     set "key=!key:"=!"
REM     set "val=!val: =!"
REM     set "val=!val:"=!"
REM     set "val=!val:,=!"
REM
REM     if /i "!key!"=="width"  set "W=!val!"
REM     if /i "!key!"=="height" set "H=!val!"
REM )

REM :: Coerce to numbers and compare using integer arithmetic
REM :: Compare W/monW  vs  H/monH without floats by cross-multiplying:
REM :: W/monW > H/monH  <=>  W*monH > H*monW
REM set /a Wnum = 0 + W
REM set /a Hnum = 0 + H
REM
REM :: Replace these constants with your monitor's width/height if needed
REM set /a monW = 1900
REM set /a monH = 1035
REM
REM set /a left  = Wnum / monH 
REM set /a right = Hnum / monW
REM
REM
REM if !right! GTR !left! (
REM     glazewm command set-tiling-direction horizontal
REM ) else (
REM     glazewm command set-tiling-direction vertical
REM )
REM
REM endlocal
REM
