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
        karabiner
        kitty
        nvim
        tmux
        starship
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

echo "Done"
