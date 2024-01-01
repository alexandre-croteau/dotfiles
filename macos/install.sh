if test ! "$(uname)" = "Darwin"; then
	exit 0
fi

# Use touch id for sudo
if ! cat /etc/pam.d/sudo | grep pam_tid >/dev/null; then
	sudo sed -i '' '2i\
auth       sufficient     pam_tid.so
' /etc/pam.d/sudo
fi

# The Brewfile handles Homebrew-based app and library installs, but there may
# still be updates and installables in the Mac App Store. There's a nifty
# command line interface to it that we can use to just install everything, so
# yeah, let's do that.

echo "› sudo softwareupdate -i -a"
sudo softwareupdate -i -a
