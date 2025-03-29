# Initialize completion
autoload -Uz compinit && compinit -i
zstyle ':completion:*' menu select=4
zmodload zsh/complist

# auto-suggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd history completion)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#b2b2b2,underline standout"

# Use vim style navigation keys in menu completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
export FZF_DEFAULT_COMMAND="fd --type f --strip-cwd-prefix --hidden --follow --exclude .git"
# Open in tmux popup if on tmux, otherwise use --height mode
export FZF_DEFAULT_OPTS='--height 50% --tmux bottom,40% --layout reverse --border top'
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

# Time to wait for additional characters in a sequence
KEYTIMEOUT=1 # corresponds to 10ms

# Use vim as the editor
export EDITOR=vim

# Use vim style line editing in zsh
bindkey -v

# Movement
bindkey -a 'gg' beginning-of-buffer-or-history
bindkey -a 'G' end-of-buffer-or-history
# Undo
bindkey -a 'u' undo
bindkey -a '^R' redo
# Edit line
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
