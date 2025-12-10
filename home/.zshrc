# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# disable oh-my-zsh update prompts
zstyle ':omz:update' mode disabled

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="af-magic"

COMPLETION_WAITING_DOTS="true"

plugins=(git history-substring-search macos vi-mode autojump compleat)

source $ZSH/oh-my-zsh.sh

bindkey '^r' history-incremental-search-backward
bindkey ' ' magic-space    # also do history expansion on space

zstyle ':completion:*' hosts off

local git_grep=(git grep)
local ide='Sublime Text'

function opens () {
  open -a "${ide}" $@
}

function grepo () {
  "${git_grep[@]}" -l ${@:1} | xargs open -a "${ide}"
}

function unmerged () {
  git diff --name-status --diff-filter=U | cut -d$'\t' -f 2
}

function addUnmerged () {
  unmerged | xargs git add
}

function openUnmerged() {
  unmerged | xargs open -a "${ide}"
}

echo 'the net is vast and infinite' | cowsay
