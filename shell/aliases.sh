# time_zsh load time
alias time_zsh='time zsh -i -c exit'

# Use colors in coreutils utilities output
alias ls='ls --color=auto'
alias grep='grep --color'

# ls aliases
alias ll='ls -lah'
alias la='ls -A'
alias l='ls --color=auto'

# display the ten newest files
alias lsnew="ls -rl *(D.om[1,10])"

# display the ten oldest files
alias lsold="ls -rtlh *(D.om[1,10])"

# display the ten smallest files
alias lssmall="ls -Srl *(.oL[1,10])"

# Aliases to protect against overwriting
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# Open a Finder window in your current directory
alias f='open -a Finder ./'

# open fzf tmux window for file search
alias ff='fzf --tmux'

# zoxide alias
alias j='z'

# Update dotfiles
dfu() {
    (
        cd ~/.dotfiles && git pull --ff-only && ./install -q
    )
}

# Use pip without requiring virtualenv
syspip() {
    PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

syspip2() {
    PIP_REQUIRE_VIRTUALENV="" pip2 "$@"
}

syspip3() {
    PIP_REQUIRE_VIRTUALENV="" pip3 "$@"
}

# cd to git root directory
alias cdgr='cd "$(git root)"'

# Create a directory and cd into it
mcd() {
    mkdir "${1}" && cd "${1}"
}

# Jump to directory containing file
jump() {
    cd "$(dirname ${1})"
}

# cd replacement for screen to track cwd (like tmux)
scr_cd() {
    builtin cd $1
    screen -X chdir "$PWD"
}

if [[ -n $STY ]]; then
    alias cd=scr_cd
fi

# Go up [n] directories
up() {
    local cdir="$(pwd)"
    if [[ "${1}" == "" ]]; then
        cdir="$(dirname "${cdir}")"
    elif ! [[ "${1}" =~ ^[0-9]+$ ]]; then
        echo "Error: argument must be a number"
    elif ! [[ "${1}" -gt "0" ]]; then
        echo "Error: argument must be positive"
    else
        for ((i = 0; i < ${1}; i++)); do
            local ncdir="$(dirname "${cdir}")"
            if [[ "${cdir}" == "${ncdir}" ]]; then
                break
            else
                cdir="${ncdir}"
            fi
        done
    fi
    cd "${cdir}"
}

# Execute a command in a specific directory
xin() {
    (
        cd "${1}" && shift && "${@}"
    )
}

# Check if a file contains non-ascii characters
# nonascii() {
# LC_ALL=C grep -n '[^[:print:][:space:]]' "${@}"
# }

# Fetch pull request

fpr() {
    if ! git rev-parse --git-dir >/dev/null 2>&1; then
        echo "error: fpr must be executed from within a git repository"
        return 1
    fi
    (
        cdgr
        if [ "$#" -eq 1 ]; then
            local repo="${PWD##*/}"
            local user="${1%%:*}"
            local branch="${1#*:}"
        elif [ "$#" -eq 2 ]; then
            local repo="${PWD##*/}"
            local user="${1}"
            local branch="${2}"
        elif [ "$#" -eq 3 ]; then
            local repo="${1}"
            local user="${2}"
            local branch="${3}"
        else
            echo "Usage: fpr [repo] username branch"
            return 1
        fi

        git fetch "git@github.com:${user}/${repo}" "${branch}:${user}/${branch}"
    )
}

# Mirror a website
alias mirrorsite='wget -m -k -K -E -e robots=off'

# Mirror stdout to stderr, useful for seeing data going through a pipe
alias peek='tee >(cat 1>&2)'

# git alias
alias g='git'
alias gph='git push'
alias gpl='git pull'
alias gm='git merge'
alias gcm='git checkout main'
alias gs='git status -sb'
alias gc='git commit -v -m'
alias ga='git add'
alias gaa='git add -A'
alias grg='git exec rg'

# venv aliases
alias pyenvs='pyenv versions'
alias pyvenv='pyenv virtualenv'
alias pyvenvs='pyenv virtualenvs'
alias pylocal='pyenv local'
alias pyact='pyenv activate'
alias pydeact='pyenv deactivate'
