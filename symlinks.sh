#!/bin/zsh

DIR=$(dirname $(readlink -f $0))

if [ $# -lt 1 ] || [ $# -gt 2 ]
then
	echo "Usage: symlinks.sh <destination> [machine]"
	exit 1
fi

DEST=$1

SYMLINKS_REL=()
SYMLINKS_ABS=()

if [ $# -gt 1 ]
then
	if [ ! -d "$DIR/$2" ] || [ ! -x "$DIR/$2/symlinks.sh" ]
	then
		echo "machine \"$2\" does not exist"
		exit 1
	fi

	. "$DIR/$2/symlinks.sh"

	cnt=${#SYMLINKS_REL[@]}
	for ((i=1;i<=cnt;i++))
	do
		SYMLINKS_REL[i]="$2/${SYMLINKS_REL[i]}"
	done

	cnt=${#SYMLINKS_ABS[@]}
	for ((i=1;i<=cnt;i++))
	do
		SYMLINKS_ABS[i]="$2/${SYMLINKS_ABS[i]}"
	done

	unset i

	echo "using machine \"$2\""
fi

#customization here
SYMLINKS_REL+=(".xinitrc\0.xinitrc")
SYMLINKS_REL+=(".vimrc\0.vimrc")
SYMLINKS_REL+=(".vim\0.vim")
SYMLINKS_REL+=(".zshrc\0.zshrc")

SYMLINKS_ABS+=("jujutheme.zsh-theme\0/usr/share/oh-my-zsh/custom/jujutheme.zsh-theme")


#create all the symlinks
for i in $SYMLINKS_REL
do
	SP=("${(@s/\0/)i}")
	FROM="$DIR/${SP[1]}"
	TO="$DEST/${SP[2]}"
	if [ ! -e "$TO" ] || [ -L "$TO" ]
	then
		echo "linking \"$FROM\"->\"$TO\""
		mkdir -p "$(dirname $TO)"
		if [ -L "$TO" ]
		then
			rm "$TO"
		fi
		ln -s "$FROM" "$TO"
	else
		echo "\"$TO\" already exists and is not a symlink, skipping..."
	fi
done

for i in $SYMLINKS_ABS
do
	SP=("${(@s/\0/)i}")
	FROM="$DIR/${SP[1]}"
	TO="${SP[2]}"
	if [ ! -e "$TO" ] || [ -L "$TO" ]
	then
		echo "linking \"$FROM\"->\"$TO\""
		sudo mkdir -p "$(dirname $TO)"
		if [ -L "$TO" ]
		then
			sudo rm "$TO"
		fi
		sudo ln -s "$FROM" "$TO"
	else
		echo "\"$TO\" already exists and is not a symlink, skipping..."
	fi
done

unset i
