# Always use fast mode for maximum performance
autoload -Uz compinit && compinit -C
# Enable caching for better performance
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

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
