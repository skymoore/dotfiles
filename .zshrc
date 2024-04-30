# zshrc

# oh-my-zsh config
# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"
DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"
ZSH_THEME="dpoggi"
HYPHEN_INSENSITIVE="true"
HIST_STAMPS="mm-dd-yyyy"
setopt HIST_IGNORE_SPACE

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
kubectx
ssh-agent)

export ZSH="$HOME/.oh-my-zsh"
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
alias k=kubectl
alias c=codium
alias kctx=kubectx
alias kns=kubens
alias iamjs2hcl=iam-policy-json-to-terraform
alias awsl='aws sso login'
# alias diff="colordiff"
alias toup="tr '[:lower:]' '[:upper:]'"
alias gamp="git commit --amend --no-edit && git push -f"

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
    # export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
    gpgconf --launch gpg-agent
fi


# kubectx plugin config
# RPS1='$(kubectx_prompt_info)'

# if [[ $(hostname) == "PS-US-0097.local" ]];then 
#     kubectx_mapping[prod-prod]="%{$fg[red]%}prod!%{$reset_color%}"
#     kubectx_mapping[prod-pre-prod]="%{$fg[yellow]%}pre-prod!%{$reset_color%}"
#     kubectx_mapping[dev-dev]="%{$fg[green]%}dev!%{$reset_color%}"
#     kubectx_mapping[dev-infra]="%{$fg[green]%}infra!%{$reset_color%}"
#     kubectx_mapping[sec-sectools]="%{$fg[blue]%}security!%{$reset_color%}"
#     kubectx_mapping[trn-trn]="%{$fg[white]%}training!%{$reset_color%}"
# fi
