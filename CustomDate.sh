#!/bin/env bash

# Define Date Configuration
# The + symbol tells the date command to expect a custom format string:
# • %A: Full weekday name (e.g., Saturday)
# • %a: Abbreviated weekday name (e.g., Sat)
# • %d: Day of the month, zero-padded (e.g., 24)
# • %B: Full month name (e.g., October)
# • %Y: Four-digit year (e.g., 2026)
# • @: Literal symbol embedded into the text
# • %T: Full 24-hour time format shortcut for %H:%M:%S (e.g., 04:46:12


Today=$(date +"%a %b %d %Y @ %I:%M %p")
 
export Today
