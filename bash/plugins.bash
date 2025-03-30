# dircolors
if [[ "$(tput colors)" == "256" ]]; then
    eval "$(dircolors ~/.shell/plugins/dircolors-solarized/dircolors.ansi-dark)"
fi
