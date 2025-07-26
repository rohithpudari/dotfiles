# External plugins (initialized before)

# zsh-completions
# fpath=(~/.zsh/plugins/zsh-completions/src $fpath)

# docker completions
# fpath=(/Users/rohith/.docker/completions $fpath)

# Optimized fpath management - use arrays for better performance
typeset -U fpath
fpath=(
    ~/.zsh/plugins/zsh-completions/src
    /opt/homebrew/share/zsh/site-functions  # adds all homebrew installed completions, Even if this doesn't exist, it should be fine
    $fpath
)
