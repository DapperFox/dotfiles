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
alias vim="nvim"
alias vimdiff="nvim -d"
### Kuali ###
alias cor_formbot="npm run build && rsync -avz ./gadgets ~/Kuali/research/research-coi/node_modules/@kuali/cor-formbot-gadgets"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/dapperfox/.nvm/versions/node/v8.15.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/dapperfox/.nvm/versions/node/v8.15.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/dapperfox/.nvm/versions/node/v8.15.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/dapperfox/.nvm/versions/node/v8.15.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/dapperfox/.nvm/versions/node/v8.15.0/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/dapperfox/.nvm/versions/node/v8.15.0/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh
