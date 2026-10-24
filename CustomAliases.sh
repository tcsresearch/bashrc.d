## BEGIN Custom Aliases - Base ##
	alias ll="ls -hl --color=auto"
	alias rm="rm -i"
	alias mv="mv -v"
	alias cp="cp -v"

# DOS-Like commands
	alias md="mkdir"
	alias rd="rmdir"

# Systemctl Aliases
	alias sc='systemctl'
	alias scs='systemctl status'
	alias scstatus='systemctl status'
	alias scstart='systemctl start'
	alias scstop='systemctl stop'
	alias screstart='systemctl restart'
	
# Interactive
	alias rmi='rm -i'
	alias cpi='cp -i'
	alias mvi='mv -i'

# Other
	alias sensors='sensors -f'
	alias yupdate="dnf -y check-update && sudo dnf -y upgrade"

## END Custom Aliases ##

## BEGIN GhostOfGoes Aliases ##

# Niceities
	alias cd..="cd .."
	alias rm="rm -i"  # Interactive mode delete
	alias hs="cd ~/ && ls"
	alias up="cd .."
	alias home="cd ~/"
	alias root="sudo su"
	alias mkdir="mkdir -pv"  # Creates parent directories if needed
	alias hist="history"
	alias jobs="jobs -l"
	alias path="echo -e ${PATH//:/\\n}"

# Power commands
	alias shutdown="sudo shutdown -P now"
	alias reboot="sudo shutdown -r now"

# Grep shorthands
	alias grep="grep --color=auto"  # Colorize grep command output

# ls shorthands
	alias l.="ls -d .* --color=auto"
	alias ls="ls -C --color=auto"  # Make 'normal' ls nice with Columns and Colors
	alias lm="ls -lhA --color=auto | more"  # For big directories
	## alias ll="ls -lh --color=auto"
	alias la="ls -lhA --color=auto"
	alias lar="ls -lhAR --color=auto | more"  # Recursive subdirectories, listed out
	alias lcr="ls -CAR --color=auto | more"  # Recursive subdirectories, by column

# Time
	alias now="date +"%T""
	alias nowtime=now
	alias nowdate="date +\"%d-%m-%Y\""

# Networking
	alias ports="netstat -tulanp"

# Updates
	alias update="dnf check-update && sudo dnf upgrade" ## Removed -y

## END GhostOfGoes Aliases ##
