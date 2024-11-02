#! /bin/bash

# Script to backup files into gdrive

# define the varibles
SOURCE_DIR="/home/giyu/bashscripts/"
BACKUP_DIR="/home/giyu/backup"
BACKUP_FILE="$BACKUP_DIR/scriptfile.tar.gz"
gdrive="gdrive:/scripts"

#compress the files in the given directory
if [ ! -d "$BACKUP_DIR" ];then
	mkdir "$BACKUP_DIR"
fi
if find "$SOURCE_DIR" -type f | read -r; then
	tar cvzf "$BACKUP_FILE" -C "$SOURCE_DIR" .
	echo "Files successfully compressed to $BACKUP_FILE"

	#backup files if they are compressed
	if [ $? -eq 0 ]; then
		rclone copy "$BACKUP_FILE" "gdrive:scripts"
		if [ $? -eq 0 ]; then
			echo "files successfully backedup"

		else
			echo "Error occured while backing up files"
		fi
	else
		echo "couldn't compress files"
	fi
fi
