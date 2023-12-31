#!/bin/zsh

function vcmp() {
	ffmpeg -hwaccel auto -dn -an -i "$1" -vcodec libx264 -pix_fmt yuv420p -profile:v baseline -r 24 "$2"
}

function epath() {
  echo -e ${PATH//:/\\n}
}

function repo() {
	open "$(g remote get-url origin)"
}

function google() {
	string="$*"
	strlen=${#string}
	encoded=""

	for ((pos = 0; pos < strlen; pos++)); do
		c=${string:$pos:1}
		case "$c" in
		[-_.~a-zA-Z0-9]) o="${c}" ;;
		*) printf -v o '%%%02x' "'$c" ;;
		esac
		encoded+="${o}"
	done

	if [[ $# -gt 1 ]]; then
		b="https://www.google.com/search?q="
		url="$b$encoded"
	else
		url="https://www.google.com"
	fi

	open "$url"
}
