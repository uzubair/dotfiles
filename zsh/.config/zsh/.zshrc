### PATH
export PATH=$HOME/bin:/usr/local/bin:/usr/local/opt/tcl-tk/bin:$HOME/workspace/bin/k9s_Darwin_x86_64:$HOME/workspace/bin/istio-1.14.3/bin:$HOME/.local/bin:$PATH

### ENV variables
export ZSH="${HOME}/.oh-my-zsh"
export XDG_CONFIG_HOME="${HOME}/.config"
export OS_FAMILY=$(uname | tr A-Z a-z)
export OS_ARCH=$(uname -p | tr A-Z a-z)
export LANG=en_US.UTF-8         # Set your language environment (manually maybe?)
export TERM="xterm-256color"    # Setting the terminal colors
unset LSCOLORS
export CLICOLOR=1
export CLICOLOR_FORCE=1

# ZSH settings
ZSH_THEME="mycustom"
DEFAULT_USER="uzubair"
HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
DISABLE_MAGIC_FUNCTIONS=true
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="mm/dd/yyyy"

# EDITOR for local and remote sessions
if type nvim > /dev/null 2>&1; then
    alias vim='nvim'
    alias vi='nvim'
fi
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
fi
export EDITOR='vim'
export K9S_EDITOR='vim'

# zsh-fzf-history-search
# zinit ice lucid wait'0'

# PLUGINS
plugins=(
    git
    aws
    z
    kubectl
    sudo
    copydir
    copyfile
    copybuffer
    dirhistory
    history
    yarn
    # volta
    dotenv
    kubectx
    command-not-found
    asdf
    zsh-fzf-history-search # git clone https://github.com/joshskidmore/zsh-fzf-history-search ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-fzf-history-search
)

# OS specific settings
export HOMEBREW_PREFIX=$(brew --prefix)
case ${OS_FAMILY} in
    darwin)
        # MacOS settings
        export KITTY_OS_CONFIG="kitty.macos.conf"
        plugins+=(macos)

        # Use option key to jump the words
        bindkey "^[[1;3C" forward-word
        bindkey "^[[1;3D" backward-word
        ;;
    linux)
        # Linux settings
        export KITTY_OS_CONFIG="kitty.linux.conf"
        skip_global_compinit=1
        ;;
esac

# SOURCE files
source $ZSH/oh-my-zsh.sh
[ -f $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && \
    . $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f $HOMEBREW_PREFIX/share/zsh-history-substring-search/zsh-history-substring-search.zsh ] && \
    . $HOMEBREW_PREFIX/share/zsh-history-substring-search/zsh-history-substring-search.zsh
[ -f $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh ] && \
    . $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f $HOMEBREW_PREFIX/etc/profile.d/autojump.sh ] && . $HOMEBREW_PREFIX/etc/profile.d/autojump.sh
[ -f $HOME/.asdf/asdf.sh ] && . $HOME/.asdf/asdf.sh

source $HOME/.oh-my-zsh/custom/aliases
source $HOME/.oh-my-zsh/custom/helper_functions
case ${OS_ARCH} in
    !arm)
        # Setting for Work
        source $HOME/.oh-my-zsh/custom/helper_functions
        export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
        ;;
esac

# PYTHON env
if which pyenv-init > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

bindkey "\e[1;3D" backward-word # ⌥←
bindkey "\e[1;3C" forward-word # ⌥→

export CPPFLAGS="-I/usr/local/opt/openjdk/include"
# export VOLTA_HOME="$HOME/.volta"
# export GOPATH=$HOME/workspace/git/go
export PATH="$VOLTA_HOME/bin:/Users/uzubair/.local/bin:$(pyenv root)/shims:/usr/local/opt/openjdk/bin:$HOME/.rd/bin:$GOPATH/bin:$PATH"

# eval "$(starship init zsh)"
