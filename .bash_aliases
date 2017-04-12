if [[ "$OSTYPE" == "darwin"* ]]; then
    alias ls='ls -G'
else
    alias ls='ls --color=auto'
fi

alias ll='ls -lhA'
alias grep='grep --color=auto'
alias vimnp='vim -u NORC'
alias tmux="tmux -2"
alias sshws='myws_sshhostname; ssh $ws'
