@echo off
TASKKILL /IM kanata_gui.exe T
SCHTASKS.EXE /END /TN \TrustedApps\Kanata
timeout 1
TASKKILL /F /IM kanata_gui.exe T
REM SCHTASKS.EXE /RUN /TN "\TrustedApps\SmoothScroll Registration"
REM SCHTASKS.EXE /RUN /TN "\TrustedApps\SmoothScroll Registration"
SCHTASKS.EXE /RUN /TN \TrustedApps\Kanata

REM TASKKILL /F /IM SmoothScroll.exe /T
REM exit
REM regedit /s "D:\OneDrive\Backup\Registry\SmoothScroll Registration.reg"

