# External plugins (initialized after)

# Syntax highlighting
# source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Lazy-load syntax highlighting with custom configuration
_load_syntax_highlighting() {
    if [[ -f ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
        source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
        
        # Configure highlighters after loading
        ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

        # Performance optimizations
        ZSH_HIGHLIGHT_MAXLENGTH=256  # Shorter limit for better performance
        
        # Apply custom styles only if terminal supports 256 colors
        if [[ "$(tput colors)" == "256" ]]; then
            ZSH_HIGHLIGHT_STYLES[default]=none
            ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=160
            ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=037
            ZSH_HIGHLIGHT_STYLES[alias]=fg=070
            ZSH_HIGHLIGHT_STYLES[builtin]=fg=070
            ZSH_HIGHLIGHT_STYLES[function]=fg=070
            ZSH_HIGHLIGHT_STYLES[command]=fg=070
            ZSH_HIGHLIGHT_STYLES[precommand]=fg=070,underline
            ZSH_HIGHLIGHT_STYLES[commandseparator]=none
            ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=037
            ZSH_HIGHLIGHT_STYLES[path]=fg=166,underline
            ZSH_HIGHLIGHT_STYLES[globbing]=fg=033
            ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=white,underline
            ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=125
            ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=125
            ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
            ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=136
            ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=136
            ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=136
            ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=136
            ZSH_HIGHLIGHT_STYLES[assign]=fg=037
        fi
        
        unfunction _load_syntax_highlighting
    fi
}

# Load syntax highlighting on first command execution
autoload -U add-zsh-hook
add-zsh-hook preexec _load_syntax_highlighting

# dircolors
# Lazy-load dircolors configuration
_setup_dircolors() {
    local dircolors_cache="$HOME/.cache/dircolors.zsh"
    
    if [[ "$(tput colors)" == "256" ]]; then
        # Create cache if it doesn't exist or is older than source
        if [[ ! -f "$dircolors_cache" ]] || [[ ~/.shell/plugins/dircolors-solarized/dircolors.ansi-dark -nt "$dircolors_cache" ]]; then
            mkdir -p "$(dirname "$dircolors_cache")"
            dircolors ~/.shell/plugins/dircolors-solarized/dircolors.ansi-dark > "$dircolors_cache"
        fi
        
        # Source cached output
        source "$dircolors_cache"
    fi
}

# Load dircolors in background to not block startup
_setup_dircolors &!
