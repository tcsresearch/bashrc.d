# .bashrc

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
# [ DEPRICATED ] Aliases #										#
#################################################################

function DepricatedAliases() {
	# User specific aliases and functions
		alias rm='rm -iv'
		alias cp='cp -iv'
		alias mv='mv -iv'

	# New Alias 06-2026 #
		alias ll='ls -hl --color=auto'

}

# Load Depricated Aliases As Needed
	# DepricatedAliases

#################################################################
# File Loader Utility (FLU) v2 #									#
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
  load_file
}

function flu() {
  load_file
}


# Call Our Function
  load_file


# Call Our Function
  # load_file


#################################################################
# Custom Files #												#
#################################################################

# Load custom date configuration
	CustomDateFile="CustomDate.sh"

	function LoadCustomDate() {
		if [ -f "$HOME/$CustomDateFile" ]; then
    		. "$HOME/$CustomDateFile"
		fi
	}	

	# Source custom date config manually if FLU fails
		 LoadCustomDate

# Load custom alias configuration
	CustomAliasFile="CustomAliases.sh"

	function LoadCustomAliases() {
		if [ -f "$HOME/$CustomAliasFile" ]; then
    		. "$HOME/$CustomAliasFile"
		fi
	}

	# Source custom aliases manually if FLU fails
		 LoadCustomAliases

# Load custom prompt configuration
	CustomPS1File="NewModernPS1-v2.sh"

	function LoadCustomPS1() {
		if [ -f "$HOME/$CustomPS1File" ]; then
    		. "$HOME/$CustomPS1File"
		fi
	}

	# Source custom prompt manually if FLU fails
		 LoadCustomPS1

# Load path exports
	PathExportFile="PathExport.sh"

	function LoadPathExports() {
		if [ -f "$HOME/$PathExportFile" ]; then
    		. "$HOME/$PathExportFile"
		fi
	}

	# Source custom prompt manually if FLU fails
		 PathExportFile


#################################################################
# Call FLU #													#
#################################################################
	function FluShot() {
		flu $CustomDateFile
		flu $CustomAliasFile
		flu $CustomPromptFile
}

	# Run FluShot
		# FluShot

#################################################################
# Load BRCD #													#
#################################################################

### Load BRCD ###
	function Load_BRCD() {
		BRCD_Folder="/etc/BRCD"
		echo "Loading BRCD..."
		if [ ! -d $BRCD_Folder ]; then
			echo "ERROR: $BRCD_Folder not found!"
			touch /root/BRCD_NOT_FOUND
		else
			cd "$BRCD_Folder" || return 1
			echo "BRCD Present Working Directory: $(pwd)"
			# cd etc/bashrc.d
			# sh _00-BRCD-Loader5.sh
			echo "Running AdvPreLoader..."
	  		sh AdvPreLoader_ShChk.sh
			# AdvPreLoader_ShChk will take care of this
	  		sh _00-BRCD-Loader6_ShChk.sh # Testing as of May 31, 2026
			cd ~ || return 2
		fi
	}

# Call Load_BRCD()
	# Load_BRCD()


#################################################################
# Add Apps To Path #											#
#################################################################

function NewPath_Export_1() {
	### Print Initialization Header ###
		echo "Adding Apps To Path:"

	### Add BLING to path ###
		export PATH="$PATH:/etc/BLING"
		echo -e " [ \e[32mBLING\e[0m ]"

	### Add Cargo to path ###
		export PATH="$PATH:/root/.cargo/bin"
		echo -e " [ \e[32mCargo\e[0m ]"

	### Add Basher to path / Init Basher ###
		export PATH="$HOME/.basher/bin:$PATH" 	##basher5ea843
		eval "$(basher init - bash)"			##basher5ea843
		echo -e " [ \e[32mBasher\e[0m ]"
}

# Run NewPath_Export_1
  # NewPath_Export_1



function NewPath_Export_2() {
	### Start the checklist on a single line ###
		echo -n "Adding Apps To Path:"

	### Add BLING to path ###
		export PATH="$PATH:/etc/BLING"
		echo -n -e " [ \e[32mBLING\e[0m ]"

	### Add Cargo to path ###
		export PATH="$PATH:/root/.cargo/bin"
		echo -n -e " [ \e[32mCargo\e[0m ]"

	### Add Basher to path / Init Basher ###
		export PATH="$HOME/.basher/bin:$PATH"	##basher5ea843
		eval "$(basher init - bash)"			##basher5ea843
		echo -e " [ \e[32mBasher\e[0m ]" 
		# Note: The final echo drops the "-n" to cleanly reset the terminal line at the end
}

# Run NewPath_Export_2
	NewPath_Export_2



function PathExport() {
	### Add BLING to path ###
		export PATH="$PATH:/etc/BLING"
		echo "BLING Added To PATH."

	### Add Cargo to path ###
		export PATH="$PATH:/root/.cargo/bin"
		echo "Cargo Added To PATH."

	### Add Basher to path / Init Basher ###
		export PATH="$HOME/.basher/bin:$PATH"   ##basher5ea843
		eval "$(basher init - bash)"             ##basher5ea843
		echo "Added Basher to PATH."
}

# Run PathExport
	# PathExport


### Blank Line ###
	echo " "
