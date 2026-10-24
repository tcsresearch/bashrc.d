#!/usr/bin/env bash

# Define Color Variables
COLOR_RESET="\[\033[0m\]"
COLOR_MAGENTA="\[\033[35m\]"
COLOR_CYAN="\[\033[1;36m\]"
COLOR_GREEN="\[\033[32m\]"
COLOR_RED="\[\033[1;31m\]"
COLOR_BLUE="\[\033[1;34m\]"
COLOR_YELLOW="\[\033[1;33m\]"

# Optimized Functions for dynamic content
_prompt_file_info() {
    local ls_out
    ls_out=$(ls -lah 2>/dev/null)
    
    local file_count
    file_count=$(echo "$ls_out" | grep -cvE '^(total|\.)')
    
    local total_size
    total_size=$(echo "$ls_out" | awk '/^total/ {print $2}')
    
    echo -n "${COLOR_CYAN}${file_count} files ${COLOR_YELLOW}${total_size}B"
}

_prompt_tty() {
    echo -n "$(tty | sed 's:/dev/::')"
}

# Construct the PS1 String
PROMPT_LINE1="\n${COLOR_RESET}Today Is: ${COLOR_MAGENTA}\$Today${COLOR_RESET}"

# PROMPT_LINE2="\n${COLOR_CYAN}Working Directory: ${COLOR_GREEN}\w${COLOR_RESET} \[$(_prompt_file_info)${COLOR_RESET}]"
PROMPT_LINE2="\n${COLOR_CYAN}Working Directory: ${COLOR_GREEN}\w${COLOR_RESET} | ${COLOR_CYAN}Directory Info: \[$(_prompt_file_info)${COLOR_RESET}"

# Line 3 is now clean and non-repetitive
PROMPT_LINE3="\n${COLOR_RED}\u@\h${COLOR_RESET} [${COLOR_BLUE}\$(_prompt_tty)${COLOR_RESET}] -> "

export PS1="${PROMPT_LINE1}${PROMPT_LINE2}${PROMPT_LINE3}"

