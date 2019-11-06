for FILE in ~/.{bash_aliases,bash_prompt,bash_functions}; do
    [ -r "$FILE" ] && [ -f "$FILE" ] && source "$FILE"
done
unset FILE

export HISTCONTROL=ignoreboth

# Load RVM into a shell session *as a function*
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Fix SSH auth socket location so agent forwarding works with tmux
[[ $SSH_AUTH_SOCK ]] && [[ ! $TMUX ]] && ln -sf $SSH_AUTH_SOCK ~/.ssh/ssh_auth_sock


parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "


if [[ -e /usr/share/bash-completion/completions/git ]]; then
  source /usr/share/bash-completion/completions/git
fi

source <(kubectl completion bash)
