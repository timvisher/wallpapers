tell application "Finder" to �
	set wallpaperHandlers to (load script file "wallpaperFunctions.scpt" of �
			folder "Scripts" of folder "Library" of home as alias)

tell wallpaperHandlers
	setWallpaper(getRandomWallpaper())
	sendGrowlNotification("Advanced Wallpaper")
end tell
