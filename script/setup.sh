#!/bin/bash

cd "$(dirname "$0")/.."

dotfiles_root=$(cd -P "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)

#! [ -d "$dotfiles_root/config/zsh/custom" ] && mkdir -p "$dotfiles_root/config/zsh/custom"

bold=$(tput bold)
green=$(tput setaf 2)
normal=$(tput sgr0)

set -e

echo ''

title() {
	echo "${bold}==> $1${normal}"
	echo
}

indent() {
	sed 's/^/  /'
}

info() {
	printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

user() {
	printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

success() {
	printf "\r\033[2k  [ \033[00;32mok\033[0m ] $1\n"
}

fail() {
	printf "\r\033[2k  [\033[0;31mfail\033[0m] $1\n"
	echo ''
	exit
}

setup_gitconfig() {
	if ! [ -f git/gitconfig.symlink ]; then
		info 'setup gitconfig'

		git_credential='cache'
		if [ "$(uname -s)" == "darwin" ]; then
			git_credential='osxkeychain'
		fi

		user ' - what is your github author name?'
		read -e git_authorname
		user ' - what is your github author email?'
		read -e git_authoremail
		user ' - what is your signing key?'
		read -e git_signingkey

		sed -e "s/GIT_AUTHORNAME/$git_authorname/g" -e "s/GIT_AUTHOREMAIL/$git_authoremail/g" -e "s/GIT_SIGNINGKEY/$git_signingkey/g" -e "s/GIT_CREDENTIAL_HELPER/$git_credential/g" git/gitconfig.symlink.example >git/gitconfig.symlink

		success 'gitconfig'
	fi
}

link_file() {
	local src=$1 dst=$2

	local overwrite= backup= skip=
	local action=

	if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]; then

		if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]; then

			local currentsrc="$(readlink $dst)"

			if [ "$currentsrc" == "$src" ]; then

				skip=true

			else

				user "file already exists: $dst ($(basename "$src")), what do you want to do?\n\
        [s]kip, [s]kip all, [o]verwrite, [o]verwrite all, [b]ackup, [b]ackup all?"
				read -n 1 action

				case "$action" in
				o)
					overwrite=true
					;;
				o)
					overwrite_all=true
					;;
				b)
					backup=true
					;;
				b)
					backup_all=true
					;;
				s)
					skip=true
					;;
				s)
					skip_all=true
					;;
				*) ;;
				esac

			fi

		fi

		overwrite=${overwrite:-$overwrite_all}
		backup=${backup:-$backup_all}
		skip=${skip:-$skip_all}

		if [ "$overwrite" == "true" ]; then
			rm -rf "$dst"
			success "removed $dst"
		fi

		if [ "$backup" == "true" ]; then
			mv "$dst" "${dst}.backup"
			success "moved $dst to ${dst}.backup"
		fi

		if [ "$skip" == "true" ]; then
			success "skipped $src"
		fi
	fi

	if [ "$skip" != "true" ]; then # "false" or empty
		ln -s "$1" "$2"
		success "linked $1 to $2"
	fi
}

install_dotfiles() {
	info 'installing dotfiles'

	local overwrite_all=false backup_all=false skip_all=false

	for src in $(find -H "$dotfiles_root" -maxdepth 2 -name '*.symlink' -not -path '*.git*'); do
		dst="$HOME/.$(basename "${src%.*}")"
		link_file "$src" "$dst"
	done
}

install_dotconfig() {
	info 'installing dotconfig'

	links=()
	folders=()
	moves=()

	SYM_BASE="$dotfiles_root/config"

	mv "$HOME/.zshrc" "$HOME/.zshrc.old"
	ln -sf "$dotfiles_root/.zshrc" "$HOME/.zshrc"

	for item in $SYM_BASE/{*,.*}; do
		item_name=${item//$SYM_BASE\//}

		test "$item_name" = '*' && continue
		test "$item_name" = '.' && continue
		test "$item_name" = '..' && continue
		test "$item_name" = '.DS_Store' && continue

		sym=$HOME/.config/${item//$SYM_BASE\//}

		item=${item//\/\///}
		sym=${sym//\/\///}

		if [ -L "$sym" ]; then
			rm -rf "$sym"
		else
			if [ -r "$sym" ]; then
				moves+=("$sym")
				mv "$sym" "$sym.old"
			fi
		fi
		ln -sf "$item" "$sym"
		links+=("~/${sym//$HOME\//}\\\\-->\\\\~/${item//$HOME\//}")
	done

	FOLDER_SPACE=0
	for folder in "${folders[@]}"; do
		FOLDER_SPACE=1
		info "Made directory: ~/$folder/"
	done

	if [ $FOLDER_SPACE -eq 1 ]; then
		echo " "
	fi

	MOVES_SPACE=0
	for sym in "${moves[@]}"; do
		MOVES_SPACE=1
		info "~/${sym//$HOME\//} already existed (moved to ~/${sym//$HOME\//}.old)"
	done

	if [ $MOVES_SPACE -eq 1 ]; then
		echo " "
	fi

	for link in "${links[@]}"; do
		success "Linked: ${link//\\/ }"
	done
}

install_deps() {

	# Set macOS defaults
	if [ "$(uname -s)" == "Darwin" ]; then
		echo "› Applying macOS defaults..."
		$dotfiles_root/macos/set-defaults.sh
	fi

	# Install software
	info "installing softwares"

	find . -name install.sh | while read installer; do
		sh -c "${installer}"
	done

}

# 1. Setup git
setup_gitconfig

# 2. Install dotfiles
install_dotfiles
install_dotconfig

# 3. Install dependencies
install_deps

echo
echo "${green}All done!${normal}" | indent
