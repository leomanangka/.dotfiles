#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Personal config
PS1='\[\033[01;91m\][\[\033[00m\]\[\033[01;93m\]\w\[\033[00m\]\[\033[01;94m\]]\[\033[00m\]\[\033[01;96m\]󰆥\[\033[00m\] '
PROMPT_DIRTRIM=1

# Set up fzf key bindings and fuzzy completion
#eval "$(fzf --bash)"

#PS1='\[\033[01;91m\]⟩\[\033[00m\] '

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='ls -lah'
alias echo='echo -e'
alias tree='tree --dirsfirst'

alias lpi='yay -Qe'
alias cod='yay -Qdtq'
alias rod='yay -Rs $(yay -Qdtq)'

alias v='nvim'
#alias icat='kitty icat'
#alias ffex='. ffex'
#alias venvpio='. $HOME/.platformio/penv/bin/activate'
#alias hibernate='systemctl hibernate'

export PATH=$PATH:$HOME/.local/bin
# go setup
export GOBIN=$HOME/.local/bin
export GOPATH=$HOME/.local/share/go
#eval "$(_AUTO_CPUFREQ_COMPLETE=bash_source auto-cpufreq)"
#export LIBVIRT_DEFAULT_URI='qemu:///system'
