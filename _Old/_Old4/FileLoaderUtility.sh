#!/bin/env bash
# File Loader Utility (FLU).

load_file() {
    # Define color codes
    local GREEN='\033[0;32m'
    local RED='\033[0;31m'
    local NC='\033[0m' # No Color

    # Check if a file argument was provided and if the file exists
    if [ -n "$1" ] && [ -f "$1" ]; then
        source "$1"
        printf "${GREEN}[ OK ]${NC}\n"
    else
        printf "${RED}[ NOT OK ]${NC}\n"
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
