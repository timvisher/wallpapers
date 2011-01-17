tell application "Finder" to �
	set wallpaperHandlers to (load script file "wallpaperFunctions.scpt" of �
		folder "Scripts" of folder "Library" of home as alias)

tell wallpaperHandlers
	set priorWallpaper to getCurrentWallpaper()
	set priorWallpaperName to getCurrentWallpaperName()
	setWallpaper(getRandomWallpaper())
end tell

tell application "Finder" to delete priorWallpaper

tell wallpaperHandlers
	sendGrowlNotification("Trashed Wallpaper", priorWallpaperName)
	sendGrowlNotification("Advanced Wallpaper")
end tell