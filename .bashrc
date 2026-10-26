#!/bin/env bash
# .bashrc

# shellcheck source=/dev/null

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=


#################################################################
# File Loader Utility (FLU) v2 #								#
#################################################################

load_file() {
    # Define color codes
    local GREEN='\033[0;32m'
    local RED='\033[0;31m'
    local NC='\033[0m'

    # 1. Check if an argument was provided
    if [ -z "$1" ]; then
        printf "${RED}[ NOT OK ]${NC} No file specified.\n"
        return 1
    fi

    # 2. Check if the file physically exists
    if [ ! -f "$1" ]; then
        printf "${RED}[ NOT OK ]${NC} File does not exist: $1\n"
        return 1
    fi

    # 3. Try to load the file and capture any system errors
    local ERR_MSG
    ERR_MSG=$(source "$1" 2>&1)

    if [ $? -eq 0 ]; then
        printf "${GREEN}[ OK ]${NC}\n"
    else
        printf "${RED}[ NOT OK ]${NC} System error: %s\n" "$ERR_MSG"
        return 1
    fi
}

function FileLoaderUtility() {
  load_file "$@"
}

function flu() {
  load_file "$@"
}


# Call Our Function
 # load_file "$@"


#################################################################
# Define Custom Files #											#
#################################################################

# Load custom date configuration
	CustomDateFile="CustomDate.sh"


# Load custom alias configuration
	CustomAliasFile="CustomAliases.sh"


# Load custom prompt configuration
	CustomPS1File="NewModernPS1-v2.sh"

	
# Load path exports
	PathExportFile="PathExport.sh"


# Load BRCD
	BRCDFile="Load-BRCD.sh"


#################################################################
# Custom File Loader Functions #								#
#################################################################
# This section will be superceded by FLU.

	function LoadCustomDate() {
		if [ -f "$HOME/$CustomDateFile" ]; then
    		. "$HOME/$CustomDateFile"
		fi
	}	

	
	function LoadCustomAliases() {
		if [ -f "$HOME/$CustomAliasFile" ]; then
    		. "$HOME/$CustomAliasFile"
		fi
	}

	
	function LoadCustomPS1() {
		if [ -f "$HOME/$CustomPS1File" ]; then
    		. "$HOME/$CustomPS1File"
		fi
	}

	
	function LoadPathExports() {
		if [ -f "$HOME/$PathExportFile" ]; then
    		. "$HOME/$PathExportFile"
		fi
	}

	
	function LoadBRCD() {
		if [ -f "$HOME/$BRCDFile" ]; then
    		. "$HOME/$BRCDFile"
		fi
	}

	
#################################################################
# Call Custom File Loader Functions #							#
#################################################################
# This section will be superceded by FLU.
	
	# Source custom date config manually if FLU fails
		 LoadCustomDate

	# Source custom aliases manually if FLU fails
		 LoadCustomAliases

	# Source custom prompt manually if FLU fails
		 LoadCustomPS1

	# Source custom prompt manually if FLU fails
		 LoadPathExports

	# Source custom prompt manually if FLU fails
		 LoadBRCD


#################################################################
# Call FLU #													#
#################################################################
	function FluShot() {
		flu $CustomDateFile
		flu $CustomAliasFile
		flu $CustomPromptFile
		flu $PathExportFile
		flu $BRCDFile
}

	# Run FluShot
		# FluShot



### Blank Line ###
	echo " "
