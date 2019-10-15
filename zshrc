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

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/dapperfox/.nvm/versions/node/v8.15.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/dapperfox/.nvm/versions/node/v8.15.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/dapperfox/.nvm/versions/node/v8.15.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/dapperfox/.nvm/versions/node/v8.15.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/dapperfox/.nvm/versions/node/v8.15.0/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/dapperfox/.nvm/versions/node/v8.15.0/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh
export PATH="/usr/local/sbin:$PATH"

compctl -U -K jump_completion j
eval "$(pyenv init -)"
eval $(thefuck --alias)
alias vim="nvim"
alias vimdiff="nvim -d"
### Kuali ###
alias prots="printf \"\\e[32m[HINT] Use --file='path/to/file.test.js' and optionally --grep='description' to specify file and test(s)\\e[m\\n\" && npm run small_test -- --"
alias cor_formbot="npm run build && rsync -avz ./gadgets ~/Kuali/research/research-coi/node_modules/@kuali/cor-formbot-gadgets"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
export PATH="/usr/local/opt/mongodb@3.4/bin:$PATH"
export APP_CFG_BASE=/Users/dapperfox/Kuali/config-files/coi
export SERVICE_SECRET='p>H*e77n$hw5#61MD[mjfM)@1P/vri?S3NMLJIYU9xU5(fEtk5'
export LAUNCH_DARKLY_SDK_KEY='sdk-cb0ae4c5-6ec9-463e-b595-7c9642060c34'
