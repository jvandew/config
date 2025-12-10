# See README at https://github.com/ohmyzsh/ohmyzsh for all settings and docs

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="af-magic"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# # disable oh-my-zsh update prompts
# zstyle ':omz:update' mode disabled
zstyle ':omz:update' frequency 30

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git history-substring-search macos vi-mode autojump compleat)

source $ZSH/oh-my-zsh.sh

# jacob configs below

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
