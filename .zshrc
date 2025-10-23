# zshrc

# oh-my-zsh config
# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"
DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"
ZSH_THEME=""
HYPHEN_INSENSITIVE="true"
HIST_STAMPS="mm-dd-yyyy"
setopt HIST_IGNORE_SPACE

zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 15

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(
    colored-man-pages
    brew
    docker
    docker-compose
    git
    gh
    gnu-utils
    httpie
    macos
    rsync
    aws
    kubectl
    kubectx
    ssh-agent
    tmux
    vibe
)
export ZSH_TMUX_AUTOSTART=true
export ZSH="$HOME/.oh-my-zsh"

#tmux
function get_cluster_short() {
        echo "$1" | cut -d . -f1
    }
export KUBE_TMUX_CLUSTER_FUNCTION=get_cluster_short

source $HOME/sky-custom.zsh-theme
source $ZSH/oh-my-zsh.sh

# brew config
test -e /opt/homebrew/bin/brew && eval "$(/opt/homebrew/bin/brew shellenv)"
test -e /usr/local/bin/brew && eval "$(/usr/local/bin/brew shellenv)"

# path
export PATH="/opt/homebrew/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH:$HOME/bin"
export PATH="$PATH:$HOME/.cargo/env"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.docker/bin"
export PATH="$PATH:/opt/homebrew/opt/postgresql@15/bin"

# alias
alias k=kubecolor
alias kctl=kubectl
alias c=cursor
alias p=pulumi
alias pss='pulumi stack select'
alias dkrc=docker-compose
alias kctx=kubectx
alias kns=kubens
alias awsl='aws sso login'
alias toup="tr '[:lower:]' '[:upper:]'"
alias gamp="git commit --amend --no-edit && git push -f"
alias rdp="xfreerdp /u:sky.moore /d:icdt.net +clipboard /gfx /w:1800 /h:1100"
alias fix-cursor-keys='defaults write $(defaults read /Applications/Cursor.app/Contents/Info.plist CFBundleIdentifier) ApplePressAndHoldEnabled -bool false && echo "Key repeat enabled for Cursor. Please restart the app."'

# dyff
export KUBECTL_EXTERNAL_DIFF="dyff between --omit-header --set-exit-code"

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

# prompt
ZSH_THEME_AWS_PROFILE_PREFIX=""
ZSH_THEME_AWS_PROFILE_SUFFIX=""
ZSH_THEME_AWS_REGION_PREFIX=""
ZSH_THEME_AWS_REGION_SUFFIX=""
ZSH_THEME_AWS_DIVIDER=":"
# RPROMPT='%{$fg[yellow]%}[$(aws_prompt_info)]%{$fg[blue]%}[$(kubectx_prompt_info)]%{$reset_color%}'



. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/sky/.lmstudio/bin"
# End of LM Studio CLI section


# vibe-zsh
export VIBE_SHOW_EXPLANATION=false
export VIBE_MODEL="qwen/qwen3-coder-30b"
export VIBE_API_URL="http://localhost:1234/v1"
