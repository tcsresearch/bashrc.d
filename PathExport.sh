#!/bin/env bash
# shellcheck source=/dev/null

#################################################################
# Add Apps To Path #											#
#################################################################

ExportStyle="SingleLine" # Can be Normal, MultiLine, or SingleLine

# Normal w/o Colors
function Normal() {
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


# With Colors: MultiLine
function MultiLine() {
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



# With Colors: Single Line
function SingleLine() {
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
		echo -n -e " [ \e[32mBasher\e[0m ]"
    
	### Terminal reset: ###
	# The final echo drops the "-n" to cleanly reset the terminal line at the end.
		echo -e " "
}


##########################################
# Main Program #						 #
##########################################

# Confirm variable is set to a valid function first.
if [ "$(type -t "$ExportStyle")" = "function" ]; then
    "$ExportStyle"
else
    echo "ERROR: $ExportStyle is not a valid function."
fi



