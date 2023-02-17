#!/usr/bin/env bash

set -euo pipefail

here=$(dirname "${BASH_SOURCE[0]}")
currdir=$(pwd)
source "$here/dist/helper.sh"

# Make sure we have atleast one option provided
if [[ ${#} -eq 0 ]]; then
    show_usage
    exit 0
fi

# variables
asdf_plugins=(
    "awscli"
    "nomad"
    "starship"
    "kubectl"
    "kubectx"
    "terraform"
    "terragrunt"
    "terraform-ls"
    "terraform-docs"
    "golang"
)

# functions
setup() {
    echo "Setting up new environment..."
    install_brew
    install_brew_dependencies "$currdir"
    install_zsh
    install_asdf
    install_volta

    # install asdf plugins
    for plugin in ${asdf_plugins[@]}; do
        install_asdf_plugins "${plugin}"
    done
    echo "Done."
}

install_dotfiles() {
    local folders=(
        bin
        git
        k9s
        karabiner
        kitty
        nvim
        tmux
        pypoetry
        zsh
    )
    echo "Installing dotfiles..."

    for folder in ${folders[@]}; do
        echo "Stowing ${folder}..."
        stow ${folder}
    done

    echo "Done."
}

# main entrypoint
echo "Starting setting up DevEnv"

echo "Setting up .zshenv"
ln -s ${HOME}/dotfiles/zsh/.config/zsh/.zshenv ${HOME}/

option="$1"
case ${option} in
    -h|--help)
        show_usage
        ;;
    -s|--setup)
        # Setting up a new environment
        setup
        ;;
    -i|--install)
        install_dotfiles
        ;;
    *)
        show_usage
        ;;
esac

# post installation setup
echo "Creating symlinks for zsh"
ln -s ${HOME}/dotfiles/zsh/.config/zsh/themes/mycustom.zsh-theme ${HOME}/.oh-my-zsh/themes/
ln -s ${HOME}/dotfiles/zsh/.config/zsh/custom/aliases ${HOME}/.oh-my-zsh/custom/
ln -s ${HOME}/dotfiles/zsh/.config/zsh/custom/helper_functions ${HOME}/.oh-my-zsh/custom/

echo "Installing 'zsh-fzf-history-search' plugin"
git clone https://github.com/joshskidmore/zsh-fzf-history-search ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-fzf-history-search

echo "Creating symlinks for tmux config"
ln -s ${HOME}/dotfiles/tmux/.config/tmux/.tmux.conf ${HOME}/.tmux.conf
ln -s ${HOME}/dotfiles/tmux/.config/tmux/.tmux.macos.conf ${HOME}/.tmux.macos.conf
ln -s ${HOME}/dotfiles/tmux/.config/tmux/.tmux-cht-commands ${HOME}/.tmux-cht-commands
ln -s ${HOME}/dotfiles/tmux/.config/tmux/.tmux-cht-languages ${HOME}/.tmux-cht-languages

echo "Done"
