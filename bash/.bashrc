#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if uwsm check may-start && uwsm select; then
	exec systemd-cat -t uwsm_start uwsm start default
fi

# Personal config
#PS1='\[\033[01;91m\][\[\033[00m\]\[\033[01;93m\]\w\[\033[00m\]\[\033[01;94m\]]\[\033[00m\]\[\033[01;96m\]>\[\033[00m\]\[\033[01;92m\]>\[\033[00m\] '
#PROMPT_DIRTRIM=1

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

PS1='\[\033[01;91m\]⟩\[\033[00m\] '

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='ls -lah'
alias echo='echo -e'

alias lpi='yay -Qqe'
alias cod='yay -Qdtq'
alias rod='yay -Rs $(yay -Qdtq)'

alias v='nvim'
alias icat='kitty icat'
alias ffex='. ffex'
alias venvpio='. $HOME/.platformio/penv/bin/activate'

export SYSTEMD_EDITOR=nvim
export EDITOR=nvim
export VISUAL=nvim
export PATH=$PATH:$HOME/.local/bin

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat $HOME/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
cat $HOME/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
source $HOME/.cache/wal/colors-tty.sh
