#!/bin/bash

# A script to set up a new mac. Uses bash, homebrew, etc.

# Focused for ruby/rails development. Includes many utilities and apps:
# - homebrew, rbenv, git, node
# - quicklook plugins, terminal fonts
# - browsers: chrome
# - dev: iterm2, vim, tmux, chrome devtools.
# - team: slack etc

# helpers
function echo_ok { echo -e '\033[1;32m'"$1"'\033[0m'; }
function echo_warn { echo -e '\033[1;33m'"$1"'\033[0m'; }
function echo_error  { echo -e '\033[1;31mERROR: '"$1"'\033[0m'; }

echo_ok "Install starting. You may be asked for your password (for sudo)."

# requires xcode and tools!
xcode-select -p || exit "XCode must be installed! (use the app store)"

# requirements
cd ~
mkdir -p tmp
echo_warn "setting permissions..."
for dir in "/usr/local /usr/local/bin /usr/local/include /usr/local/lib /usr/local/share"; do
  sudo chgrp admin $dir
  sudo chmod g+w $dir
done

# homebrew
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
if hash brew &> /dev/null; then
  echo_ok "Homebrew already installed"
else
  echo_warn "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi


