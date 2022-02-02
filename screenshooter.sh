defaultFolder=$HOME/tmp
defaultName=$'%y%m%d-%s_SS'

name=$(echo "$defaultName" | dmenu -fn "$DMENUFONT" -p "Rename SS?")

if [[ $name == "" ]]; then
    exit 1
fi

case $1 in
    'screen')
        scrot "$defaultFolder"/"$name".jpg
        ;;
    'window')
        scrot -u "$defaultFolder"/"$name".jpg
        ;;
    'select')
        scrot -s "$defaultFolder"/"$name".jpg
        ;;
    *)
        exit 0
        ;;
esac
