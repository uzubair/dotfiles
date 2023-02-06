# Helper functions
# Show Usage
show_usage() {
    echo "Setup script"
    echo "Arguments:"
    echo "  -s, --setup     Sets up a new machine"
    echo "  -i, --install   Installs dotfiles"
    echo "  -h, --help      Show this help"
}

# Install brew if it is not installed
install_brew() {
    echo "Is homebrew installed?"
    if ! command -v brew > /dev/null; then
        echo "==> Installing Homebrew..."
        if [[ "${OS_FAMILY}" = darwin* ]]; then
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        else
            curl -fsSL 'https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh' | sh -c
        fi
    else
        echo "==> Homebrew is already installed..."
    fi
}

install_brew_dependencies() {
    local basedir
    if [[ $# -ge 1 ]] && [[ -n "$1" ]]; then
        basedir="$1"
    fi

    if [[ -z ${basedir} ]]; then
        basedir="$(dirname `pwd`)"
    fi

    echo $basedir

    echo "==> Installing Homebrew dependencies..."
    if ! brew bundle --no-upgrade --no-lock --file=$basedir/Brewfile ; then
        echo "Failed to install all the Homebrew dependencies..."
    fi
}

# Use ZSH as your default shell
update_shell() {
    local shell_path;
    shell_path="$(command -v zsh)"

    echo "==> Changing your shell to zsh ..."
    if ! grep "$shell_path" /etc/shells > /dev/null 2>&1 ; then
        echo "==> Adding '$shell_path' to /etc/shells"
        sudo sh -c "echo $shell_path >> /etc/shells"
    fi
    sudo chsh -s "$shell_path" "$USER"
}

# Install ZSH if not already installed and set as
# defaut shell
install_zsh() {
    echo "Is ZSH the default shell?"
    case "$SHELL" in
        */zsh)
            if [ "$(echo $SHELL)" == '/usr/bin/zsh' ] || [ "$(echo $SHELL)" == '/bin/zsh' ]; then
                echo "ZSH is set as the default shell..."
            else
                if [ "$(command -v zsh)" != '/usr/local/bin/zsh' ] ; then
                    echo "==> Updating shell to ZSH..."
                    update_shell
                else
                    echo "==> ZSH is set as the default shell..."
                fi
            fi
            ;;
        *)
            echo "==> Updating shell to ZSH..."
            update_shell
            ;;
    esac
}

# Install https://github.com/asdf-vm/asdf
install_asdf() {
    echo "Installing asdf..."
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.2 || true
}

install_asdf_plugins() {
    echo "Installing asdf plugin $1..."
    $HOME/.asdf/bin/asdf plugin add $1 || true
    $HOME/.asdf/bin/asdf install $1 latest || true
    $HOME/.asdf/bin/asdf global $1 latest || true
}

# Install volta version manager
install_volta() {
    echo "Installing volta version manager..."
    curl https://get.volta.sh | bash

    echo "Installing Node v18"
    $HOME/.volta/bin/volta install node@18
}

install_tmux_plugin_manager() {
    echo "Installing tmux plugin manager..."
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}

# Install Dotfiles
install_dotfiles() {
    echo "==> Installing dotfiles..."
    if ! $here/install.sh ; then
        echo "Failed to install the dotfiles..."
    fi
}
