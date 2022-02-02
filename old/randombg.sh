# Set a random wallpaper

wallpaperFolder=$HOME/.config/wallpapers/jpg

wallpaper=$(ls $wallpaperFolder | shuf | head -n 1)

feh --bg-fill "$wallpaperFolder"/"$wallpaper"
