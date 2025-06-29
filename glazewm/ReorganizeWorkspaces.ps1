# Move workspaces 1 through 9 to the right

$host.UI.RawUI.WindowTitle = "GlazeWM Workspace Reorganize Workspaces"

Add-Type -Name Window -Namespace Console -MemberDefinition '
[DllImport("Kernel32.dll")]
public static extern IntPtr GetConsoleWindow();

[DllImport("user32.dll")]
public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);
'

$console = [Console.Window]::GetConsoleWindow()

# 0 hide
[Console.Window]::ShowWindow($console, 0) | Out-Null

# pause
# Start-Sleep -Seconds 1

# TASKKILL /F /IM SmoothScroll.exe T
# SCHTASKS.EXE /END /TN \TrustedApps\SmoothScroll
# timeout 1
# REM SCHTASKS.EXE /RUN /TN "\TrustedApps\SmoothScroll Registration"
# REM SCHTASKS.EXE /RUN /TN "\TrustedApps\SmoothScroll Registration"
# SCHTASKS.EXE /RUN /TN \TrustedApps\SmoothScroll


for ($i = 1; $i -le 9; $i++) {
    glazewm command focus --workspace $i
    glazewm command set-tiling-direction horizontal
    glazewm command move-workspace --direction right
}

# Move workspaces 10 through 12 to the left
for ($i = 10; $i -le 12; $i++) {
    glazewm command focus --workspace $i
    glazewm command set-tiling-direction horizontal
    glazewm command move-workspace --direction left
}

glazewm command focus --workspace 10
glazewm command focus --workspace 1
