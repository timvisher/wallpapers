tell application "Finder" to �
	set wallpaperHandlers to (load script file "wallpaperFunctions.scpt" of �
		folder "Scripts" of folder "Library" of home as alias)

tell wallpaperHandlers to �
	set currentWallpaper to getCurrentWallpaper()

tell application "Pixelmator"
	open currentWallpaper
	activate
end tell

tell wallpaperHandlers to �
	sendGrowlNotification("Opened Wallpaper For Editing")