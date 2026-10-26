#!/bin/env bash
#shellcheck source=/dev/null

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
