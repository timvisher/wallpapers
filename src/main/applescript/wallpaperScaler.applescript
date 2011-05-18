tell application "Finder" to set wallpapers to selection

set myDimensions to {w169:[{2560, 1440}, {1920, 1080}, {1366, 768}], w1610:[{2560, 1600}, {1920, 1200}, {1440, 900}, {1280, 800}], f43:[{1600, 1200}], s:[{1024, 1024}]}

tell application "Image Events"
	repeat with currentWallpaper in wallpapers
		set theWallpaper to open (currentWallpaper as alias)
		tell theWallpaper
			set theWallpaperDimensions to dimensions of theWallpaper
			if my aspectsEqual(16 / 10, theWallpaperDimensions) then set currentAspects to w1610 of myDimensions
			if my aspectsEqual(16 / 9, theWallpaperDimensions) then set currentAspects to w169 of myDimensions
			if my aspectsEqual(4 / 3, theWallpaperDimensions) then set currentAspects to f43 of myDimensions
			if my aspectsEqual(1, theWallpaperDimensions) then set currentAspects to s of myDimensions
			repeat with dim in currentAspects
				-- Scale and Crop to current dimensions
				if item 1 of theWallpaperDimensions is greater than item 1 of dim then
					scale to size (get item 1 of dim)
					
					-- Set up save target
					set namePrefix to text items 1 thru ((offset of "." in (get name)) - 1) of (get name) as string
					tell application "Finder"
						set _ to parent of currentWallpaper as alias
						set parentPath to POSIX path of _
					end tell
					set saveTarget to parentPath & namePrefix & "_" & (get item 1 of dim) & "x" & (get item 2 of dim) & ".png"
					
					--save to target
					save in saveTarget as PNG
				end if
			end repeat
		end tell
	end repeat
end tell

on aspectsEqual(baseAspect, wallpaperDimensions)
	set wallpaperAspect to (item 1 of wallpaperDimensions) / (item 2 of wallpaperDimensions)
	set aspectDifference to baseAspect - wallpaperAspect
	if aspectDifference is less than 0 then set aspectDifference to aspectDifference * -1
	return aspectDifference is less than 0.01
end aspectsEqual
