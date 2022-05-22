#!/bin/zsh

alias ls='ls --color=auto'
alias l='ls --time-style=+"" -Aoh'

# completions plugins
if [[ ! -d ~/.zsh/plugins/zsh-completions ]]
then
  mkdir -p ~/.zsh/plugins/zsh-completions
  git clone https://github.com/zsh-users/zsh-completions ~/.zsh/plugins/zsh-completions
fi
fpath=(~/.zsh/plugins/zsh-completions/src $fpath)
autoload -Uz compinit && compinit

# history setup
setopt APPEND_HISTORY
setopt SHARE_HISTORY
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY

# history search completions
autoload -Uz history-beginning-search-menu
zle -N history-beginning-search-menu-end history-beginning-search-menu
bindkey '^X^X' history-beginning-search-menu-end

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats 'on branch %F{green}%b '

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='%B%F{red}%1~%f%b ${vcs_info_msg_0_}%(?.%F{blue}>.%F{red}?%?)%f '
