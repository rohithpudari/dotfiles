# Lazy-load completion system
_load_completions() {
    autoload -Uz compinit && compinit -C
    
    # Enable caching
    zstyle ':completion:*' use-cache on
    zstyle ':completion:*' cache-path ~/.zsh/cache
    
    unfunction _load_completions
}

autoload -U add-zsh-hook
add-zsh-hook precmd _load_completions

# auto-suggestions
# Performance-optimized lazy-loaded auto-suggestions
_load_autosuggestions() {
    # Use hardcoded path to avoid subprocess call
    local autosuggest_path="/opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
    
    if [[ -f "$autosuggest_path" ]]; then
        # Set performance variables BEFORE sourcing for better initialization
        ZSH_AUTOSUGGEST_STRATEGY=(history)  # Simplified strategy - removed expensive match_prev_cmd and completion
        ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#b2b2b2"  # Removed underline for performance
        ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
        ZSH_AUTOSUGGEST_USE_ASYNC=1  # Use 1 instead of true
        ZSH_AUTOSUGGEST_MANUAL_REBIND=1  # Critical performance improvement
        
        # Reduce widget binding overhead
        ZSH_AUTOSUGGEST_CLEAR_WIDGETS=(
            history-search-forward
            history-search-backward
        )
        ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=(
            forward-char
            end-of-line
        )
        
        source "$autosuggest_path"
        unfunction _load_autosuggestions
    fi
}

# Load autosuggestions only when first command is executed
autoload -U add-zsh-hook
add-zsh-hook preexec _load_autosuggestions

# Lazy load menuselect keybindings
# # Use vim style navigation keys in menu completion
_setup_menuselect_keys() {
    zmodload -i zsh/complist
    bindkey -M menuselect 'h' vi-backward-char
    bindkey -M menuselect 'k' vi-up-line-or-history  
    bindkey -M menuselect 'l' vi-forward-char
    bindkey -M menuselect 'j' vi-down-line-or-history
    
    # Remove this function after first use
    unfunction _setup_menuselect_keys
}

# Set up keybindings when completion is first triggered
autoload -U add-zsh-hook
add-zsh-hook precmd _setup_menuselect_keys

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
export FZF_DEFAULT_COMMAND="fd --type f --strip-cwd-prefix --hidden --follow --exclude .git"
# Open in tmux popup if on tmux, otherwise use --height mode
export FZF_DEFAULT_OPTS='--height 50% --tmux bottom,40% --layout reverse --border top'
# moonfly colorscheme
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --color bg:#080808 \
  --color bg+:#262626 \
  --color border:#2e2e2e \
  --color fg:#b2b2b2 \
  --color fg+:#e4e4e4 \
  --color gutter:#262626 \
  --color header:#80a0ff \
  --color hl+:#f09479 \
  --color hl:#f09479 \
  --color info:#cfcfb0 \
  --color marker:#f09479 \
  --color pointer:#ff5189 \
  --color prompt:#80a0ff \
  --color spinner:#36c692
"
export FZF_CTRL_T_OPTS='--preview "bat --style=numbers --color=always --line-range :500 {}"'
export FZF_ALT_C_COMMAND="fd --type f --hidden --follow --strip-cwd-prefix . $HOME"

# Initialize editing command line
autoload -U edit-command-line && zle -N edit-command-line

# Enable interactive comments (# on the command line)
setopt interactivecomments

# Nicer history
HISTSIZE=1048576
HISTFILE="$HOME/.zsh_history"
SAVEHIST=$HISTSIZE
setopt appendhistory
setopt incappendhistory
setopt extendedhistory
# remove duplicates from history
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS

# Time to wait for additional characters in a sequence
KEYTIMEOUT=1 # corresponds to 10ms

# Use vim style line editing in zsh
bindkey -v

# Movement
bindkey -a 'gg' beginning-of-buffer-or-history
bindkey -a 'G' end-of-buffer-or-history
# Undo
bindkey -a 'u' undo
bindkey -a '^R' redo
# Edit line in vim file mode
bindkey -a '^V' edit-command-line
# Backspace
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char

# Use incremental search
# bindkey "^R" history-incremental-search-backward

# Disable shell builtins
disable r

# Zsh completion accept to tab
bindkey '^I' autosuggest-accept
