# homebrew
if [ "${OS_ARCH}" = "arm" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    eval "$(/usr/local/bin/brew shellenv)"
fi

# pyenv
eval "$(pyenv init --path)"

# neovim
if hash nvim 2>/dev/null; then
    export EDITOR=nvim
    export MANPAGER='nvim +Man!'
    export K9S_EDITOR=nvim
else
    export EDITOR=nvim
    export K9S_EDITOR=nvim
fi
