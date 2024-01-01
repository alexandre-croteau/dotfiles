#!/bin/bash

set -e

parentDirectory="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
dotfilesDirectory="$(cd "$(dirname "$parentDirectory")" && pwd -P)"

displayUsageAndExit() {
	echo "dot -- dotfiles management"
	echo ""
	echo "Usage: dot [options]"
	echo ""
	echo "Options:"
	echo "  -e, --edit    Open dotfiles directory for editing"
	echo "  -h, --help    Show this help message and exit"
	exit
}

while test $# -gt 0; do
	case "$1" in
	"-h" | "--help")
		displayUsageAndExit
		;;
	"-e" | "--edit")
		exec "$EDITOR" "$dotfilesDirectory"
		exit
		;;
	*)
		echo "Invalid option: $1"
		displayUsageAndExit
		;;
	esac
	shift
done

export ZSH=$HOME/.dotfiles

# Set macOS defaults
if [ "$(uname -s)" == "Darwin" ]; then
	echo "› $ZSH/macos/set-defaults.sh"
	$ZSH/macos/set-defaults.sh
fi

# Install software
echo "› $ZSH/scripts/install"
cd "$(dirname $0)"/..
find . -name install.sh | while read installer; do sh -c "${installer}"; done
