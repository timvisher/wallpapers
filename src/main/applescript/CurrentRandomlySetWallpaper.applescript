set a to path to preferences folder from user domain as string
set thefile to a & "com.apple.desktop.plist"
tell application "System Events"
	tell current desktop
		log pictures folder as string
	end tell
	tell property list file thefile
		tell contents
			--set value of property list item "LastName" of property list item "1317017921" of property list item "Background" to "simple_portal_2_wallpaper_Awesome_Portal_2_Wallpapers-s1920x1080-89610.jpg"
			--set value of property list item "ChangeTime" of property list item "1317017921" of property list item "Background" to 1
		end tell
	end tell
end tell