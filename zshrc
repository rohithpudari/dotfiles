# zprof for profiling
zmodload zsh/zprof

# Functions
source ~/.shell/functions.sh

# Allow local customizations in the ~/.shell_local_before file
if [ -f ~/.shell_local_before ]; then
    source ~/.shell_local_before
fi

# Allow local customizations in the ~/.zshrc_local_before file
if [ -f ~/.zshrc_local_before ]; then
    source ~/.zshrc_local_before
fi

# External plugins (initialized before)
source ~/.zsh/plugins_before.zsh

# Settings
source ~/.zsh/settings.zsh

# Bootstrap
source ~/.shell/bootstrap.sh

# Aliases
source ~/.shell/aliases.sh

# Custom prompt
source ~/.zsh/prompt.zsh

# External plugins (initialized after)
source ~/.zsh/plugins_after.zsh

# External settings
source ~/.shell/external.sh

# Allow local customizations in the ~/.shell_local_after file
if [ -f ~/.shell_local_after ]; then
    source ~/.shell_local_after
fi

# Allow local customizations in the ~/.zshrc_local_after file
if [ -f ~/.zshrc_local_after ]; then
    source ~/.zshrc_local_after
fi

# Allow private customizations (not checked in to version control)
if [ -f ~/.shell_private ]; then
    source ~/.shell_private
fi

# >>> conda initialize >>>
# --- Lazy Conda + Mamba init ---------------------------------
# Call `conda_mamba_init` once per shell *only when needed*
function conda_mamba_init() {
  [[ -n $CONDA_INITIALIZED ]] && return        # already done

  # ---- Conda hook ----
  if __conda_setup="$('/Users/rohith/miniforge3/bin/conda' shell.zsh hook 2>/dev/null)"; then
    eval "$__conda_setup"
  elif [[ -f /Users/rohith/miniforge3/etc/profile.d/conda.sh ]]; then
    source /Users/rohith/miniforge3/etc/profile.d/conda.sh
  else
    export PATH="/Users/rohith/miniforge3/bin:$PATH"
  fi
  unset __conda_setup

  # ---- Mamba hook ----
  export MAMBA_EXE=/Users/rohith/miniforge3/bin/mamba
  export MAMBA_ROOT_PREFIX=/Users/rohith/miniforge3
  if __mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2>/dev/null)"; then
    eval "$__mamba_setup"
  else
    alias mamba="$MAMBA_EXE"
  fi
  unset __mamba_setup

  export CONDA_INITIALIZED=1                   # flag so we don’t repeat
}

# Lazy aliases: running any of these triggers the real init
alias init_conda='conda_mamba_init && conda "$@"'
# <<< mamba initialize <<<
