#!/bin/bash 

##################################
#                                #
# AwlsomeLinux Generation Script #
#                                #
##################################
#  Made by AwlsomeAlex (GPLv3)   #
##################################


#############################
# Library Retrival Function # get_library
#######################################
# If the library isn't found, it will #
# automatically be downloaded from    #
# the AwlsomeLinux Repository         #
#######################################
get_library()
{
	echo ""
	echo "##########################"
	echo "# Downloading Library... #"
	echo "##########################"
	echo ""
	wget https://raw.githubusercontent.com/AwlsomeAlex/AwlsomeLinux/rewrite/src/awlsomelinux.lib
	echo ""
	echo "######################"
	echo "# Download Complete! #"
	echo "######################"
	echo "Please Restart AwlsomeLinux Generation Script to Continue!"
	exit 1


##########################
# Pre-Execution Commands #
###############################
# Certain Commands to confirm #
# AwlsomeLinux will work at   #
# the minimum will be checked #
###############################

## Call 'awlsomelinux.lib' to load rest of functions ##
. ./awlsomelinux.lib

if [ -f "awlsomelinux.lib" ]
	then
		echo "The AwlsomeLinux Generation Library has been loaded!"
	else
		echo "The AwlsomeLinux Generation Library has not been found."
		get_library
fi

## Check forthe program 'dialog' ##
check_dialog


#############
# Main Menu #
##########################
# The Main Menu function #
# will be loaded from    #
# th external library    #
##########################
#main_menu
