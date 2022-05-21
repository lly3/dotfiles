#!/bin/zsh

alias ls='ls --color=auto'
alias l='ls --time-style=+"" -Aoh'

# source autocomplete
source ~/.zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats 'on branch %F{green}%b '

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='%B%F{red}%1~%f%b ${vcs_info_msg_0_}%(?.%F{blue}>.%F{red}?%?)%f '
