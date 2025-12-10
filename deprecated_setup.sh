#! /bin/bash
set -xeo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)"

# homebrew and required packages
if ! command -v brew &> /dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew install \
  autojump \
  byobu \
  cowsay \
  fortune \
  gpg \
  imagemagick \
  java \
  scala \
  wget \
  zsh

# zsh setup
sudo sh -c 'grep -q -F "$(which zsh)" /etc/shells || echo "$(which zsh)" >> /etc/shells'
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# copy over config files
cp -r "$root/home/"{.gitconfig,.vim,.vimrc,.zshrc} ~

# mac os specifics
if [[ "$OSTYPE" == "darwin"* ]]; then
  cp -r "$root/home/Library" ~
  sudo cp -r "$root/root/"* /
fi

