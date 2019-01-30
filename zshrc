export EDITOR='nvim'
export ZSH=/Users/dapperfox/.oh-my-zsh
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

ZSH_THEME="clean"

plugins=(git tmux npm)

source $ZSH/oh-my-zsh.sh
fpath=(/usr/local/share/zsh-completions $fpath)
# jump integrations
eval "$(jump shell zsh)"
__jump_chpwd() {
  jump chdir
}

typeset -gaU chpwd_functions
chpwd_functions+=__jump_chpwd

j() {
  local dir="$(jump cd $@)"
  test -d "$dir" && cd "$dir"
}

jump_completion() {
  reply=($(jump hint "$1" --smart))
}

compctl -U -K jump_completion j
eval "$(pyenv init -)"
eval $(thefuck --alias)
export PATH="/usr/local/opt/mongodb@3.4/bin:$PATH"
export APP_CFG_BASE=/Users/dapperfox/Kuali/config-files/coi
### Kuali ###
alias cor_formbot="npm run build && rsync -avz ./gadgets ~/Kuali/research/research-coi/node_modules/@kuali/cor-formbot-gadgets"
export PATH="/usr/local/opt/ruby/bin:$PATH"
