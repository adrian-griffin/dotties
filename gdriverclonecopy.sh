#!/bin/bash

# Function declaring steps to copy from Drive to local




#####
# Usage intent function declaration
usage_function () {
local PS3="Desired operation to perform: "
local options=("Copy from cloud drive to local device" "Copy from local device to cloud drive" "Move files from cloud drive to local device" "Sync cloud drive and local device (modifies local only)" "Quit")
local opt
select opt in "${options[@]}";
do
	case $opt in
		"Copy from cloud drive to local device")
			mkdir /$selected_drive/$data_type/$selected_file_type/$selected_directory
			echo "copying files from $selected_file_type/$selected_directory /$selected_drive/$data_type/$selected_file_type/$selected_directory ..."
			sleep 2
			rclone copy -P Gdrive:$selected_file_type/$selected_directory /$selected_drive/$data_type/$selected_file_type/$selected_directory

			;;
		"Copy from local device to cloud drive")
			rclone mkdir $selected_file_type/$selected_directory
			rclone copy Gdrive:$selected_drive/$data_type/$selected_file_type/$selected_directory $selected_file_type/$selected_directory
			;;
		"Move files from cloud drive to local device")
			mkdir /$selected_drive/$data_type/$selected_file_type/$selected_directory
			sleep 2
			rclone move Gdrive:$selected_file_type/$selected_directory /$selected_drive/$data_type/$selected_file_type/$selected_directory
			echo "Files from Gdrive:$selected_file_type/$selected_directory moved to $selected_drive/$data_type/$selected_file_type/$selected_directory"
			sleep 2
			usage_function
			;;
		"Sync cloud drive and local device (modifies local only)")
			rclone sync Gdrive:$selected_file_type/$selected_directory $selected_drive/$data_type/$selected_file_type/$selected_directory
			echo "Files synced between Gdrive:$selected_file_type/$selected_directory and $selected_drive/$data_type/$selected_file_type/$selected_directory"
			sleep 2
			usage_function
			;;
		"Quit")
			echo "Killing program, bitch"
			break
			;;
		*) echo "Invalid Option $REPLY"
	esac
done
}

# Drive Select Menu

drive_select_menu () {
echo "Current disk usage: "
local PS3="Select drive to save to: "
local options=("/srv/dev-disk-by-uuid-4965017e-fe39-4b7d-85ba-f69e4e87ef27/" "/srv/dev-disk-by-uuid-fde7d6f8-f441-434d-a5f3-2c763542f667/" "/srv/dev-disk-by-uuid-60734265-9134-49fb-a62e-abc7abdbf71f/" "/srv/dev-disk-by-uuid-9c7a78bc-7fdf-4d82-baf9-3fe378b23c56/" "Quit")
local opt
select opt in "${options[@]}";
do
	case $opt in
		"/srv/dev-disk-by-uuid-4965017e-fe39-4b7d-85ba-f69e4e87ef27/")
			selected_drive="srv/dev-disk-by-uuid-4965017e-fe39-4b7d-85ba-f69e4e87ef27"
			echo "/srv/dev-disk-by-uuid-4965017e-fe39-4b7d-85ba-f69e4e87ef27/: Drive A selected"
			echo "-------------------"
			data_type_menu
			;;
		"/srv/dev-disk-by-uuid-fde7d6f8-f441-434d-a5f3-2c763542f667/")
			selected_drive="srv/dev-disk-by-uuid-fde7d6f8-f441-434d-a5f3-2c763542f667"
			echo "/srv/dev-disk-by-uuid-fde7d6f8-f441-434d-a5f3-2c763542f667/: Drive B selected"
			echo "-------------------"
			data_type_menu
			;;
		"/srv/dev-disk-by-uuid-60734265-9134-49fb-a62e-abc7abdbf71f/")
			selected_drive="srv/dev-disk-by-uuid-60734265-9134-49fb-a62e-abc7abdbf71f"
			echo "/srv/dev-disk-by-uuid-60734265-9134-49fb-a62e-abc7abdbf71f: Hot Drive selected"
			echo "-------------------"
			data_type_menu
			;;
		"/srv/dev-disk-by-uuid-9c7a78bc-7fdf-4d82-baf9-3fe378b23c56/")
			selected_drive="srv/dev-disk-by-uuid-9c7a78bc-7fdf-4d82-baf9-3fe378b23c56"
			echo "/srv/dev-disk-by-uuid-9c7a78bc-7fdf-4d82-baf9-3fe378b23c56: Drive C (4 TB) selected"
			echo "-------------------"
			data_type_menu
			;;
		"Quit")
			echo "Killing program, bitch"
			break
			;;
		*) echo "Invalid Option $REPLY";;
	esac
done
}

#####
# Data Type Menu

data_type_menu () {
local PS3="Select data type to clone: "
local options=("Media" "Data and File Storage" "Quit")
local opt
select opt in "${options[@]}";
do
	case $opt in
		"Media")
			data_type="AMACloudMovies"
			echo "Media selected"
			media_type_menu
			;;
		"Date and File Storage")
			data_type="Data and File Storage"
			echo "Data and File Storage Selected"
			echo "Not yet supported, please select a different option"
			sleep 2
#			data_backup_menu
			;;
		"Quit")
			echo "Killing program, bitch"
			break
			;;
		*) echo "Invalid Option $REPLY";;
	esac
done
}

## temp printmenu for testing
#printmenu ( ) {
#echo $selected_drive
#echo $data_type
#echo $selected_file_type
#}

#####
# Directory Info Menu
directory_info_menu () {
echo "Current directories in Gdrive:$selected_file_type: "
rclone lsf --dirs-only Gdrive:$selected_file_type
echo ""
echo "Please enter the directory name (follow casing) below. Exclude directory slashes ('/')"
selected_directory=""
read -p 'Directory: ' selected_directory
echo
echo "$selected_directory selected"
sleep 2
usage_function


}

#####
# Media Type Menu Selection

media_type_menu () {
local PS3="Select file type: "
local options=("Movie" "Show" "Anime" "Quit")
local opt
select opt in "${options[@]}";
do
	case $opt in
		"Movie")
			selected_file_type="Movie"
			echo "Media selected"
			directory_info_menu
			;;
		"Show")
			selected_file_type="Show"
			echo "Show selected"
			directory_info_menu
			;;
		"Anime")
			selected_file_type="Anime"
			echo "Anime selected"
			directory_info_menu
			;;
		"Quit")
			echo "Killing program, bitch"
			break
			;;
		*) echo "Invalid Option $REPLY";;
	esac
done
}



drive_select_menu
