#! /bin/bash
set +x

root="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)"

# homebrew and required packages
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install zsh fortune cowsay gpg wget

# zsh setup
sudo sh -c 'grep -q -F "$(which zsh)" /etc/shells || echo "$(which zsh)" >> /etc/shells'
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# copy over dotfiles
cp -r "$root/home/"{.vim,.vimrc,.zshrc} ~
cp -r "$root/home/Library" ~
