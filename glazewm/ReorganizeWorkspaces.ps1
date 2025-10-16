# Move workspaces 1 through 9 to the right

$host.UI.RawUI.WindowTitle = "GlazeWM Workspace Reorganize Workspaces"

Add-Type -Name Window -Namespace Console -MemberDefinition '
[DllImport("Kernel32.dll")]
public static extern IntPtr GetConsoleWindow();

[DllImport("user32.dll")]
public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);
'

function Get-GlazeCurrentWorkspace {
  $json = glazewm query monitors | ConvertFrom-Json
  $json.data.monitors |
  Where-Object { $_.hasFocus } |
  ForEach-Object {
    $_.children | Where-Object { $_.hasFocus } | Select-Object -ExpandProperty name
  }
}

$console = [Console.Window]::GetConsoleWindow()

# 0 hide
[Console.Window]::ShowWindow($console, 0) | Out-Null

$workspace = Get-GlazeCurrentWorkspace

for ($i = 1; $i -le 12; $i++) {
    glazewm command focus --workspace $i
    # glazewm command set-tiling-direction horizontal
    # glazewm command move-workspace --direction right
    Start-Sleep -Milliseconds 10
}

# # Move workspaces 10 through 12 to the left
# for ($i = 10; $i -le 12; $i++) {
#     glazewm command focus --workspace $i
#     glazewm command set-tiling-direction horizontal
#     # glazewm command move-workspace --direction left
# }

# glazewm command focus --workspace 11
# glazewm command focus --workspace 10

# glazewm command focus --workspace 1
# glazewm command set-tiling-direction horizontal
# glazewm command move-workspace --direction left
glazewm command focus --workspace $workspace

# pause
# Start-Sleep -Seconds 1

SCHTASKS.EXE /END /TN \TrustedApps\SmoothScroll
TASKKILL /F /IM SmoothScroll.exe T
timeout 1
# REM SCHTASKS.EXE /RUN /TN "\TrustedApps\SmoothScroll Registration"
# REM SCHTASKS.EXE /RUN /TN "\TrustedApps\SmoothScroll Registration"
SCHTASKS.EXE /RUN /TN \TrustedApps\SmoothScroll


