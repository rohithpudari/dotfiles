# External plugins (initialized after)

# Syntax highlighting
# source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Lazy-load syntax highlighting with custom configuration
_load_syntax_highlighting() {
    if [[ -f ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
        source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

        # Configure highlighters after loading
        ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
        typeset -gA ZSH_HIGHLIGHT_STYLES

        # Performance optimizations
        ZSH_HIGHLIGHT_MAXLENGTH=256  # Shorter limit for better performance
        
        # Apply custom styles only if terminal supports 256 colors
        if [[ "$(tput colors)" == "256" ]]; then
            # Main highlighter styling: https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md
            # Catppuccin mocha theme
            ## General
            ### Diffs
            ### Markup
            ## Classes
            ## Comments
            ZSH_HIGHLIGHT_STYLES[comment]='fg=#585b70'
            ## Constants
            ## Entitites
            ## Functions/methods
            ZSH_HIGHLIGHT_STYLES[alias]='fg=#a6e3a1'
            ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=#a6e3a1'
            ZSH_HIGHLIGHT_STYLES[global-alias]='fg=#a6e3a1'
            ZSH_HIGHLIGHT_STYLES[function]='fg=#a6e3a1'
            ZSH_HIGHLIGHT_STYLES[command]='fg=#a6e3a1'
            ZSH_HIGHLIGHT_STYLES[precommand]='fg=#a6e3a1,italic'
            ZSH_HIGHLIGHT_STYLES[autodirectory]='fg=#fab387,italic'
            ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#fab387'
            ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#fab387'
            ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=#cba6f7'
            ## Keywords
            ## Built ins
            ZSH_HIGHLIGHT_STYLES[builtin]='fg=#a6e3a1'
            ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#a6e3a1'
            ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=#a6e3a1'
            ## Punctuation
            ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#f38ba8'
            ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=#cdd6f4'
            ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-unquoted]='fg=#cdd6f4'
            ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]='fg=#cdd6f4'
            ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]='fg=#f38ba8'
            ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=#f38ba8'
            ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=#f38ba8'
            ## Serializable / Configuration Languages
            ## Storage
            ## Strings
            ZSH_HIGHLIGHT_STYLES[command-substitution-quoted]='fg=#f9e2af'
            ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-quoted]='fg=#f9e2af'
            ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#f9e2af'
            ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg=#eba0ac'
            ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#f9e2af'
            ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=#eba0ac'
            ZSH_HIGHLIGHT_STYLES[rc-quote]='fg=#f9e2af'
            ## Variables
            ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=#cdd6f4'
            ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]='fg=#eba0ac'
            ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=#cdd6f4'
            ZSH_HIGHLIGHT_STYLES[assign]='fg=#cdd6f4'
            ZSH_HIGHLIGHT_STYLES[named-fd]='fg=#cdd6f4'
            ZSH_HIGHLIGHT_STYLES[numeric-fd]='fg=#cdd6f4'
            ## No category relevant in spec
            ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#eba0ac'
            ZSH_HIGHLIGHT_STYLES[path]='fg=#cdd6f4,underline'
            ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=#f38ba8,underline'
            ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=#cdd6f4,underline'
            ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=#f38ba8,underline'
            ZSH_HIGHLIGHT_STYLES[globbing]='fg=#cdd6f4'
            ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#cba6f7'
            #ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=?'
            #ZSH_HIGHLIGHT_STYLES[command-substitution-unquoted]='fg=?'
            #ZSH_HIGHLIGHT_STYLES[process-substitution]='fg=?'
            #ZSH_HIGHLIGHT_STYLES[arithmetic-expansion]='fg=?'
            ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]='fg=#eba0ac'
            ZSH_HIGHLIGHT_STYLES[redirection]='fg=#cdd6f4'
            ZSH_HIGHLIGHT_STYLES[arg0]='fg=#cdd6f4'
            ZSH_HIGHLIGHT_STYLES[default]='fg=#cdd6f4'
            ZSH_HIGHLIGHT_STYLES[cursor]='fg=#cdd6f4'
        fi

        unfunction _load_syntax_highlighting
    fi
}

# Load syntax highlighting on first command execution
autoload -U add-zsh-hook
add-zsh-hook preexec _load_syntax_highlighting

# # dircolors
# # Lazy-load dircolors configuration
# _setup_dircolors() {
#     local dircolors_cache="$HOME/.cache/dircolors.zsh"
#
#     if [[ "$(tput colors)" == "256" ]]; then
#         # Create cache if it doesn't exist or is older than source
#         if [[ ! -f "$dircolors_cache" ]] || [[ ~/.shell/plugins/dircolors-solarized/dircolors.256dark -nt "$dircolors_cache" ]]; then
#             mkdir -p "$(dirname "$dircolors_cache")"
#             dircolors ~/.shell/plugins/dircolors-solarized/dircolors.256dark > "$dircolors_cache"
#         fi
#
#         # Source cached output
#         source "$dircolors_cache"
#     fi
# }
#
# # Load dircolors in background to not block startup
# _setup_dircolors &!

# dircolors
# Lazy-load dircolors configuration
_setup_dircolors() {
    local dircolors_cache="$HOME/.cache/dircolors.zsh"
    
    if [[ "$(tput colors)" == "256" ]]; then
        # Create cache if it doesn't exist or is older than source
        if [[ ! -f "$dircolors_cache" ]] || [[ ~/.shell/plugins/dircolors-solarized/dircolors.256dark -nt "$dircolors_cache" ]] || [[ ~/.shell/dircolors.extra -nt "$dircolors_cache" ]]; then
            mkdir -p "$(dirname "$dircolors_cache")"
            dircolors =(cat ~/.shell/plugins/dircolors-solarized/dircolors.256dark ~/.shell/dircolors.extra) > "$dircolors_cache"
        fi
        
        # Source cached output
        source "$dircolors_cache"
    fi
}

# Load dircolors in background to not block startup
_setup_dircolors &!
