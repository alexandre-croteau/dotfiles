#!/bin/zsh

# Enable nvm in the current shell.
# Loading nvm by default is slow, and most of the time we don't need it.
loadnvm() {
  export NVM_DIR="$HOME/.nvm"
  [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && \. "$(brew --prefix)/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
}

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

# Find out what's running on a given port
whatsonport() {
    lsof -i tcp:$1
}

# a script to install a specific version of a formula from homebrew-core
# USAGE: brew-switch <formula> <version>
function brew-switch {
  local _formula=$1
  local _version=$2

  # fail for missing arguments
  if [[ -z "$_formula" || -z "$_version" ]]; then
    echo "USAGE: brew-switch <formula> <version>"
    return 1
  fi

  # ensure 'gh' is installed
  if [[ -z "$(command -v gh)" ]]; then
    echo ">>> ERROR: 'gh' must be installed to run this script"
    return 1
  fi

  # find the newest commit for the given formula and version
  local _commit_sha=$(
    gh search commits \
      --owner Homebrew \
      --repo homebrew-core \
      --limit 1 \
      --sort committer-date \
      --order desc \
      --json sha \
      --jq '.[0].sha' \
      "\"${_formula}\" \"${_version}\""
  )

  # fail if no commit was found
  if [[ -z "$_commit_sha" ]]; then
    echo "ERROR: No commit found for ${_formula}@${_version}"
    return 1
  else
    echo "INFO: Found commit ${_commit_sha} for ${_formula}@${_version}"
  fi

  # download the formula file from the commit
  local _raw_url="https://raw.githubusercontent.com/Homebrew/homebrew-core/${_commit_sha}/Formula/${_formula:0:1}/${_formula}.rb"
  local _formula_path="/tmp/${_formula}.rb"
  echo "INFO: Downloading ${_raw_url}"
  if ! curl -fL "$_raw_url" -o "$_formula_path"; then
    echo ""
    echo "WARNING: Download failed, trying old formula path"

    # try the old formula path
    _raw_url="https://raw.githubusercontent.com/Homebrew/homebrew-core/${_commit_sha}/Formula/${_formula}.rb"
    echo "INFO: Downloading ${_raw_url}"
    curl -fL "$_raw_url" -o "$_formula_path" || (echo "ERROR: Failed to download ${_raw_url}" && return 1)
  fi

  # if the formula is already installed, uninstall it
  if brew ls --versions "$_formula" >/dev/null; then
    echo ""
    echo "WARNING: '$_formula' already installed, do you want to uninstall it? [y/N]"
    local _reply=$(bash -c "read -n 1 -r && echo \$REPLY")
    echo ""
    if [[ $_reply =~ ^[Yy]$ ]]; then
      echo "INFO: Uninstalling '$_formula'"
      brew unpin "$_formula"
      brew uninstall "$_formula" || (echo "ERROR: Failed to uninstall '$_formula'" && return 1)
    else
      echo "ERROR: '$_formula' is already installed, aborting"
      return 1
    fi
  fi

  # install the downloaded formula
  echo "INFO: Installing ${_formula}@${_version} from local file: $_formula_path"
  brew install --formula "$_formula_path"
  brew pin "$_formula"
}
