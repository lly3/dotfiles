#!/bin/zsh

alias ls='ls --color=auto'
alias l='ls -Aoh'
alias sail='./vendor/bin/sail'
alias grep='grep --color'

# set -o vi
bindkey -v

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

# history search completions menu with <c-x><c-x>
autoload -Uz history-beginning-search-menu
zle -N history-beginning-search-menu-end history-beginning-search-menu
bindkey '^X^X' history-beginning-search-menu-end

# history search completions with arrow
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end # with arrow
bindkey "^[[B" history-beginning-search-forward-end
bindkey -M vicmd 'k' history-beginning-search-backward-end # with j, k in vicmd
bindkey -M vicmd 'j' history-beginning-search-forward-end

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats 'on branch %F{green}%b '

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='%B%F{red}%1~%f%b ${vcs_info_msg_0_}%(?.%F{blue}>.%F{red}?%?)%f '

# enviroment variables
export JAVA_HOME='/usr/lib/jvm/java-11-openjdk'
export PATH=$JAVA_HOME/bin:$PATH
