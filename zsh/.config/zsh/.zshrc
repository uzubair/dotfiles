# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# .zshrc
export PATH=$HOME/bin:/usr/local/bin:/usr/local/opt/tcl-tk/bin:$HOME/workspace/bin/k9s_Darwin_x86_64:$HOME/workspace/bin/istio-1.14.3/bin:$HOME/.local/bin:$PATH

### ENV variables
export ZSH=$HOME/.oh-my-zsh
export ZSH_ENV_HOME=$HOME/
export XDG_CONFIG_HOME=${HOME}/.config
export LANG=en_US.UTF-8
export HOMEBREW_PREFIX=$(brew --prefix)

# General settings
DEFAULT_USER="uzubair"

ZSH_THEME="powerlevel10k/powerlevel10k"
COMPLETION_WAITING_DOTS=true
DISABLE_AUTO_UPDATE=true
DISABLE_MAGIC_FUNCTIONS=true
HYPHEN_INSENSITIVE=true
ENABLE_CORRECTION=false

# History settings
HISTSIZE=9999
SAVEHIST=9999
HISTDUP=erase
HIST_STAMPS="mm/dd/yyyy"
HISTFILE=~/.zsh_history
setopt appendhistory
setopt sharehistory
setopt incappendhistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups


# PLUGINS
plugins=(
  asdf
  aws
  command-not-found
  copybuffer
  # copydir
  copyfile
  dirhistory
  dotenv
  git
  history
  kubectl
  kubectx
  terraform
  sudo
  yarn
  z
  zsh-vi-mode
  zsh-fzf-history-search
)

# OS specific settings
case ${OS_FAMILY} in
    darwin)
        # MacOS settings
        export KITTY_OS_CONFIG="kitty.macos.conf"
        plugins+=(macos)
        ;;
    linux)
        # Linux settings
        export KITTY_OS_CONFIG="kitty.linux.conf"
        skip_global_compinit=1
        ;;
esac

# SOURCE files
source $ZSH/oh-my-zsh.sh
source $HOME/.config/zsh/custom/aliases.zsh
source $HOME/.config/zsh/custom/helper_functions.zsh

. $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
. $HOMEBREW_PREFIX/share/zsh-history-substring-search/zsh-history-substring-search.zsh
. $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
. $HOMEBREW_PREFIX/etc/profile.d/autojump.sh
. $HOME/.asdf/asdf.sh

# PYTHON env
if which pyenv-init > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export CPPFLAGS="-I/usr/local/opt/openjdk/include"
export VOLTA_HOME="$HOME/.volta"
export GOPATH=$HOME/workspace/git/go
export PATH="$VOLTA_HOME/bin:/Users/uzubair/.local/bin:$(pyenv root)/shims:/usr/local/opt/openjdk/bin:$HOME/.rd/bin:$GOPATH/bin:$PATH"

# Use option key to jump the words
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

# Use the jk as a escapse key for zsh-vi-mode plugin
ZVM_VI_ESCAPE_BINDKEY=jk

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
