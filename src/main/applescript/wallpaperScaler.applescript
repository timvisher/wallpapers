tell application "Finder" to set wallpapers to selection

tell application "Image Events"
	repeat with currentWallpaper in wallpapers
		set theWallpaper to open (currentWallpaper as alias)
		tell theWallpaper
			repeat with dim in [{1920, 1080}, {1280, 800}]
				-- Scale and Crop to current dimensions
				scale to size (get item 1 of dim)
				crop to dimensions dim
				
				-- Set up save target
				set namePrefix to text items 1 thru ((offset of "." in (get name)) - 1) of (get name) as string
				tell application "Finder"
					set _ to parent of currentWallpaper as alias
					set parentPath to POSIX path of _
				end tell
				set saveTarget to parentPath & namePrefix & "_" & (get item 1 of dim) & "x" & (get item 2 of dim) & ".jpg"
				
				--save to target
				save in saveTarget as JPEG
			end repeat
		end tell
	end repeat
end tell