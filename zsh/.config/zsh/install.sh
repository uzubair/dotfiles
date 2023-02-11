#!/usr/bin/env bash

set -euo pipefail

# if [[ -z ${ZSH} ]]; then
    export ZSH="${HOME}/.oh-my-zsh"
# fi

# if [[ -z ${OS_FAMILY} ]]; then
    echo "Identifying operating system..."

    OS_FAMILY=$(uname | tr A-Z a-z)
# fi

# if [[ -z ${OS_ARCH} ]]; then
    echo "Identifying operating system..."

    OS_ARCH=$(uname -p | tr A-Z a-z)
# fi

# Current working directory
currdir=$(pwd)

# Helper functions
# Function to install ohmyzsh themes
install_themes() {
    local themes=(
        "mycustom.zsh-theme"
        "cdimascio-lambda.zsh-theme"
    )

    echo "Installing OH_MY_ZSH themes"
    for theme in ${themes[@]}; do
        local msg="> Installing theme '${theme}'"
        if ! cp ${currdir}/themes/${theme} ${ZSH}/themes/${theme} ; then
            echo "${msg}... Failed"
        else
            echo "${msg}... Done"
        fi
    done
}

# Function to setup aliases
install_custom_aliases() {
    local msg="Setting up aliases"
    if ! cp ${currdir}/custom/aliases ${ZSH}/custom/aliases ; then
        echo "${msg}... Failed"
        return
    fi
    echo "${msg}... Done"
}

# Function to setup helper functions
install_custom_helpers() {
    local msg="Setting up helper functions"
    if ! cp ${currdir}/custom/helper_functions ${ZSH}/custom/helper_functions ; then
        echo "${msg}... Failed"
        return
    fi
    echo "${msg}... Done"
}

# Fucntion to generate zprofile
install_zprofile() {
    echo "Generating .zprofile under ${currdir}"

    local filepath="${currdir}/.zprofile"
    rm -fr "${filepath}"

    case ${OS_ARCH} in
        arm)
            echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ${filepath}
            echo 'eval "$(pyenv init --path)"' >> ${filepath}
            ;;
        !arm)
            echo "eval "$(pyenv init --path)"" >> ${filepath}
            echo "# added by Snowflake SnowSQL installer v1.2" >> ${filepath}
            echo "export PATH=/Applications/SnowSQL.app/Contents/MacOS:$PATH" >> ${filepath}
            ;;
    esac
}

# Entrypoint
echo "Starting to setup OH MY ZSH..."
echo ""

install_zprofile
# install_themes
install_custom_helpers
install_custom_aliases

echo ""
echo "Done!"
