$W = glazewm query focused | rg '"x":(\d+),' -or '$1' -

# Start-Sleep -Milliseconds 1000

# Write-Output $W

if ([int]$W -gt 10) {
    glazewm command set-tiling-direction vertical
} else {
    glazewm command set-tiling-direction horizontal
}
