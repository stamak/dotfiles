for FILE in ~/.{bash_aliases,bash_prompt,bash_functions}; do
    [ -r "$FILE" ] && [ -f "$FILE" ] && source "$FILE"
done
unset FILE

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
