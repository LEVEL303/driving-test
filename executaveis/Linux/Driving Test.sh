#!/bin/sh
printf '\033c\033]0;%s\a' Driving Test
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Driving Test.x86_64" "$@"
