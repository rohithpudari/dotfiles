# Always use fast mode for maximum performance
autoload -Uz compinit && compinit -C
# Enable caching for better performance
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zsh-completion
zstyle ':completion:*' menu select=4

# Lazy load menuselect keybindings
# # Use vim style navigation keys in menu completion
# _setup_menuselect_keys() {
#     zmodload -i zsh/complist
#     bindkey -M menuselect 'h' vi-backward-char
#     bindkey -M menuselect 'k' vi-up-line-or-history  
#     bindkey -M menuselect 'l' vi-forward-char
#     bindkey -M menuselect 'j' vi-down-line-or-history
#
#     # Remove this function after first use
#     unfunction _setup_menuselect_keys
# }
#
# # Set up keybindings when completion is first triggered
# autoload -U add-zsh-hook
# add-zsh-hook precmd _setup_menuselect_keys

# Load menuselect and set up vi-style navigation
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history  
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Initialize editing command line
autoload -U edit-command-line && zle -N edit-command-line

# Enable interactive comments (# on the command line)
setopt interactivecomments

# type a dir to cd
setopt autocd

# Nicer history
HISTSIZE=1048576
HISTFILE="$HOME/.zsh_history"
SAVEHIST=$HISTSIZE
setopt appendhistory
setopt incappendhistory
setopt extendedhistory
HISTCONTROL=ignoreboth # consecutive duplicates & commands starting with space are not saved
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
bindkey -a '^a' beginning-of-line
bindkey -a '^e' end-of-line
bindkey -a '^k' kill-line

# Edit line in vim file mode
bindkey -a '^V' edit-command-line

# Backspace
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char

# ctrl + r for fzf history search
bindkey '^R' fzf-history-widget

# Disable shell builtins
disable r

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
export FZF_DEFAULT_COMMAND="bfs -type f -hidden -follow -exclude -name .git"
# Open in tmux popup if on tmux, otherwise use --height mode
export FZF_DEFAULT_OPTS="--height 30% --tmux bottom,40% --style minimal --layout reverse --border top --preview='bat --color=always --style=numbers --color=always --line-range :500 {}'"
# catppuccin colorscheme
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#313244,label:#CDD6F4"
export FZF_CTRL_T_OPTS='--preview "bat --color=always --style=numbers --color=always --line-range :500 {}"'
export FZF_CTRL_R_OPTS="
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"
