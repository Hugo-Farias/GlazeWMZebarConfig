# # Get focused container (workspace or window)
# $data = (glazewm query focused | ConvertFrom-Json).data
#
# # Width and height of container
# $w = $data.focused.width
# $h = $data.focused.height
#
# # Decide tiling direction
# if ($w / 1900 -gt $h / 1035) {
#     $direction = "horizontal"
# } else {
#     $direction = "vertical"
# }
#
# # Apply it to the focused container
# glazewm command set-tiling-direction $direction


# Run the query and store the result
# $type = glazewm query workspaces | jq -r 'first(.data.workspaces[].children[]? | select(.hasFocus == true)) | .type'
# $type = glazewm query focused | jq -r 'first(.data.workspaces[].children[]? | select(.hasFocus == true)) | .type'
# $type = glazewm query focused | jq ".data.focused.width"
$type = glazewm query focused | rg "\"width\"\:(\d+)" -or "$1"

Write-Output $type

# Check the value
if (1900 -gt $type) {
    # Write-Output "horizontal"
    glazewm command set-tiling-direction vertical
} else {
    # Write-Output "vertical"
    glazewm command set-tiling-direction horizontal
}
