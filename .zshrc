# zsh
# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"
ZSH_THEME="dpoggi"
HYPHEN_INSENSITIVE="true"
HIST_STAMPS="mm-dd-yyyy"

zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 15

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(colored-man-pages
git
gnu-utils
httpie
macos
rsync
aws
kubectl
ssh-agent)

export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# config
test -e /opt/homebrew/bin/brew && eval "$(/opt/homebrew/bin/brew shellenv)"
test -e /usr/local/bin/brew && eval "$(/usr/local/bin/brew shellenv)"

export EDITOR=vim
export ZSH="$HOME/.oh-my-zsh"
export PATH="/opt/homebrew/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH:$HOME/bin"
export PATH="$PATH:$HOME/.cargo/env"

# alias
alias k=kubectl
alias kctx=kubectx
alias kns=kubens
alias iamjs2hcl=iam-policy-json-to-terraform
alias awsl='aws sso login --profile'
alias diff="colordiff"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# remote gpg
if [[ -z $SSH_CONNECTION ]]; then
    export GPG_TTY="$(tty)"
    export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
    gpgconf --launch gpg-agent
fi
