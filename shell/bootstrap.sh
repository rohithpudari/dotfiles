# path_prepend "$HOME/.local/bin"
# path_prepend "$HOME/.dotfiles/bin"

typeset -U path # Ensures no duplicates
path=(
    "$HOME/.local/bin"
    "$HOME/.dotfiles/bin"
    $path
)
