if [[ "$OSTYPE" == "darwin"* ]]; then
    alias ls='ls -G'
else
    alias ls='ls --color=auto'
fi

alias ll='ls -lhA'
alias grep='grep --color=auto'
alias vimnp='vim -u NORC'
alias sshws='ssh smakar@myws'
