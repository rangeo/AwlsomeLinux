#!/bin/sh

## AwlsomeLinux Overlay Creation Script
## Created by AwlsomeAlex (GNU GPLv3)

##############################
# -------------------------- #
# AwlsomeLinux Configuration #
# -------------------------- #
##############################

SRC_DIR=$(pwd)

##########################
# AwlsomeLinux Variables #
##########################


#############################
# ------------------------- #
# AwlsomeLinux Image Script #
# ------------------------- #
##############################


###########################
# GLIBC Full Installation #
###########################

install_glibc() {
	echo "--- GLIBC Full Installation Start ---"
	
	# Check if Glibc is Built
	if [ ! -d $SRC_DIR/core/install/glibc ] ; then
		echo "GLIBC Full Installation Failed - GLIBC was never built. Please build GLIBC!"
		exit 1
	fi
	
	# Prepare GLIBC Full Installation Work Area
	rm -rf overlay/work/glibc
	rm -rf overlay/install/glibc
	mkdir overlay/work/glibc
	mkdir overlay/work/glibc/lib
	mkdir overlay/install/glibc
	mkdir overlay/install/glibc/lib
	
	# Change Directory to 'core/install/glibc_prepared/lib'
	cd core/install/glibc_prepared/lib
	
	# Copy all GLIBC Libraries to OverlayFS
	find . -type l -exec cp {} $SRC_DIR/overlay/work/glibc/lib \;
	echo "All GLIBC Libraries have been copied."
	
	cd $SRC_DIR/overlay/work/glibc/lib

	for FILE_DEL in $(ls *.so)
		do
			FILE_KEEP=$(ls $FILE_DEL.*)

		if [ ! "$FILE_KEEP" = "" ] ; then
			# We remove the shorter file and replace it with symbolic link.
			rm $FILE_DEL
			ln -s $FILE_KEEP $FILE_DEL
		fi
	done
	echo "Duplicate Libraries have been replaced with soft links."
	
	strip -g *
	echo "All Libraries have been reduced in File Size."
	
	cp -r $SRC_DIR/overlay/work/glibc/lib $SRC_DIR/overlay/install/glibc
	echo "GLIBC Full Installation has been installed to the OverlayFS."
	
	cd $SRC_DIR
	
	echo "--- GLIBC Full Installation Stop ---"
}



######################
# OverlayFS Creation #
######################
overlayfs_create() {
	
	echo "--- OverlayFS Creation Start ---"
	
	# Clean OverlayFS Directory
	rm -rf $SRC_DIR/overlay/overlayfs
	mkdir $SRC_DIR/overlay/overlayfs

	# Copy Packages to OverlayFS
	cp -r $SRC_DIR/overlay/install/glibc/* $SRC_DIR/overlay/overlayfs
	
	echo "The OverlayFS Directory has been created."
	
	cd $SRC_DIR
	
	echo "--- OverlayFS Creation Stop ---"
	
	
}



install_glibc

overlayfs_create