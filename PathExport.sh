#################################################################
# Add Apps To Path #											#
#################################################################

# Normal w/o Colors
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


# With Colors: MultiLine
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


# With Colors: Single Line
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




