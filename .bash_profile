for FILE in ~/.{bash_aliases,bash_prompt,bash_functions}; do
    [ -r "$FILE" ] && [ -f "$FILE" ] && source "$FILE"
done
unset FILE

export HISTCONTROL=ignoreboth

# Add homebrew bin as it chaged for Apple Silicon
[[ -d "/opt/homebrew/bin" ]] && export PATH="/opt/homebrew/bin:$PATH" # Add homebrew bin
# Add home bin to PATH
[[ -d "$HOME/bin" ]] && export PATH="$PATH:$HOME/bin" # Add home bin
[[ -d "$HOME/bin/google-cloud-sdk/bin/" ]] && export PATH="$PATH:$HOME/bin/google-cloud-sdk/bin" # Add home bin

# Load RVM into a shell session *as a function*
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Mac OS bash completion
if [[ "$OSTYPE" == "darwin"* ]]; then
  if type brew &>/dev/null
  then
    HOMEBREW_PREFIX="$(brew --prefix)"
    if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]
    then
      source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
    else
      for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*
      do
        [[ -r "${COMPLETION}" ]] && source "${COMPLETION}"
      done
    fi
  fi
  else
    # Linux bash completion
    [[ -e /usr/share/bash-completion/completions/git ]] && . /usr/share/bash-completion/completions/git
fi


# Fix SSH auth socket location so agent forwarding works with tmux
[[ $SSH_AUTH_SOCK ]] && [[ ! $TMUX ]] && ln -sf $SSH_AUTH_SOCK ~/.ssh/ssh_auth_sock

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

source <(kubectl completion bash)
source <(helm completion bash)

