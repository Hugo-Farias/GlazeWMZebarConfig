# Get focused container (workspace or window)
$data = (glazewm query focused | ConvertFrom-Json).data

# Width and height of container
$w = $data.focused.width
$h = $data.focused.height

# Decide tiling direction
if ($w / 1900 -gt $h / 1035) {
    $direction = "horizontal"
} else {
    $direction = "vertical"
}

# Apply it to the focused container
glazewm command set-tiling-direction $direction
