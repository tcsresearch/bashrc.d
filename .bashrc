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

# Load custom alias configuration
	CustomAliasFile="CustomAliases.sh"

	if [ -f "$HOME/$CustomAliasFile" ]; then
    	. "$HOME/$CustomAliasFile"
	fi


# Load custom date configuration
	CustomDateFile="CustomDate.sh"

	if [ -f "$HOME/$CustomDateFile" ]; then
    	. "$HOME/$CustomDateFile"
	fi



# Load custom prompt configuration
	CustomPS1File="NewModernPS1-v2.sh"

	if [ -f "$HOME/$CustomPS1File" ]; then
    	. "$HOME/$CustomPS1File"
	fi




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
	Load_BRCD()

### Add BLING to path ###
	export PATH="$PATH:/etc/BLING"
	echo "BLING Added To PATH."

### Add Cargo to path ###
	export PATH="$PATH:/root/.cargo/bin"
	echo "Cargo Added To PATH."

### Basher ###
	export PATH="$HOME/.basher/bin:$PATH"   ##basher5ea843
	eval "$(basher init - bash)"             ##basher5ea843
	echo "Added Basher to PATH."

### Blank Line ###
	echo " "

