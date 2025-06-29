# path_remove() {
#     PATH=$(echo -n "$PATH" | awk -v RS=: -v ORS=: "\$0 != \"$1\"" | sed 's/:$//')
# }

# Much faster path manipulation using zsh arrays
# path_remove() {
#    local target="$1"
#    # Use zsh's built-in array filtering - much faster than awk/sed
#    path=(${path:#$target})
# }

# path_append() {
#     path_remove "$1"
#     PATH="${PATH:+"$PATH:"}$1"
# }

# path_prepend() {
#     path_remove "$1"
#     PATH="$1${PATH:+":$PATH"}"
# }

#path_prepend() {
#    local target="$1"
#    # Remove if exists, then prepend - single operation
#    path=(${path:#$target})
#    path=("$target" $path)
#}

here() {
    local loc
    if [ "$#" -eq 1 ]; then
        loc=$(realpath "$1")
    else
        loc=$(realpath ".")
    fi
    ln -sfn "${loc}" "$HOME/.shell.here"
    echo "here -> $(readlink $HOME/.shell.here)"
}

there="$HOME/.shell.here"

there() {
    cd "$(readlink "${there}")"
}

# tm - create a new tmux session, or swithc to an existing one.
# 'tm irc' will attach to the irc session (if it exists), else it will create it.
# tm() {
#     [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
#     if [ $1 ]; then
#         tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -s $1 && tmux $change -t "$1")
#         return
#     fi
#     session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) && tmux $change -t "$session" || echo "No sessions found."
# }
