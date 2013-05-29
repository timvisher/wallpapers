on number_to_string(this_number)
	set this_number to this_number as string
	if this_number contains "E+" then
		set x to the offset of "." in this_number
		set y to the offset of "+" in this_number
		set z to the offset of "E" in this_number
		set the decimal_adjust to characters (y - (length of this_number)) thru Â
			-1 of this_number as string as number
		if x is not 0 then
			set the first_part to characters 1 thru (x - 1) of this_number as string
		else
			set the first_part to ""
		end if
		set the second_part to characters (x + 1) thru (z - 1) of this_number as string
		set the converted_number to the first_part
		repeat with i from 1 to the decimal_adjust
			try
				set the converted_number to Â
					the converted_number & character i of the second_part
			on error
				set the converted_number to the converted_number & "0"
			end try
		end repeat
		return the converted_number
	else
		return this_number
	end if
end number_to_string

set preferencesFolderPath to path to preferences folder from user domain as string
set desktopSettingsPlist to preferencesFolderPath & "com.apple.desktop.plist"
set wallpaperPaths to []
tell application "System Events"
	set desktopIds to id of desktops
	repeat with desktopId in desktopIds
		tell property list file desktopSettingsPlist
			tell contents
				set desktopSettings to property list item (my number_to_string(desktopId)) of property list item "" of property list item "spaces" of property list item "Background"
				tell desktopSettings
					set wallpaperPaths to wallpaperPaths & ((value of property list item "ChangePath") & "/" & (value of property list item "LastName"))
				end tell
			end tell
		end tell
	end repeat
end tell
repeat with wallpaperPath in wallpaperPaths
	tell application "Finder"
		-- yes it appears that the following idiocy is necessaryÉ /me sighs
		set thePath to wallpaperPath as string
		set theWallpaperPosixFile to POSIX file thePath as string
		--I think this should workÉ
		--make new Finder window with properties {target:theWallpaperPosixFile}
		set theWindow to make new Finder window
		set target of theWindow to theWallpaperPosixFile
	end tell
end repeat