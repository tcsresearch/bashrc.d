#!/bin/env bash
# File Loader Utility (FLU).

load_file() {
    # Define color codes
    local GREEN='\033[0;32m'
    local RED='\033[0;31m'
    local NC='\033[0m'

    # 1. Check if an argument was provided
    if [ -z "$1" ]; then
        printf "${RED}[ NOT OK ]${NC} No file specified.\n"
        exit 1
    fi

    # 2. Check if the file physically exists
    if [ ! -f "$1" ]; then
        printf "${RED}[ NOT OK ]${NC} File does not exist: $1\n"
        exit 1
    fi

    # 3. Try to load the file and capture any system errors
    local ERR_MSG
    ERR_MSG=$(source "$1" 2>&1)

    if [ $? -eq 0 ]; then
        printf "${GREEN}[ OK ]${NC}\n"
    else
        printf "${RED}[ NOT OK ]${NC} System error: %s\n" "$ERR_MSG"
        exit 1
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
