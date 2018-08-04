#!/usr/bin/env bash
IFS=$'\n'
#Arguments: program, program's WM_CLASS lookup

# class in $2, else try program name ($1)
# (?i) for case-insensitivity
class=${2:-(?i)$1}
# focus $class if possible, else exec $1
[ $( i3-msg [class="^$class"] focus 2>&1 | grep -ic "ERROR") -gt 0 ] && exec $1
