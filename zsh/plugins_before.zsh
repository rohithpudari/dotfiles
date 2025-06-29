# External plugins (initialized before)

# zsh-completions
# fpath=(~/.zsh/plugins/zsh-completions/src $fpath)

# docker completions
# fpath=(/Users/rohith/.docker/completions $fpath)

# Optimized fpath management - use arrays for better performance
typeset -U fpath
fpath=(
    ~/.zsh/plugins/zsh-completions/src
    ~/.docker/completions
    $fpath
)

# Lazy-load UV completions with caching for better performance
_load_uv_completions() {
    if command -v uv >/dev/null 2>&1; then
        local completion_cache="$HOME/.cache/zsh-completions/_uv"
        
        # Create cache directory if needed
        mkdir -p "$(dirname "$completion_cache")"
        
        # Generate completion file if it doesn't exist or is outdated
        if [[ ! -f "$completion_cache" ]] || [[ "$completion_cache" -ot "$(which uv)" ]]; then
            uv generate-shell-completion zsh > "$completion_cache" 2>/dev/null
        fi
        
        # Source the cached completion file (much faster than eval)
        if [[ -f "$completion_cache" ]]; then
            source "$completion_cache"
        fi
        
        unfunction _load_uv_completions
    fi
}
# Track loading state
typeset -g _uv_completions_loaded=false

uv() {
    if [[ "$_uv_completions_loaded" == "false" ]]; then
        _load_uv_completions
        _uv_completions_loaded=true
    fi
    command uv "$@"
}
