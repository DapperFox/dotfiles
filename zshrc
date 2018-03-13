export ZSH=/Users/blake.bishop/.oh-my-zsh

ZSH_THEME="clean"

plugins=(git tmux npm)

source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/blake.bishop/Infusion/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/blake.bishop/Infusion/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/blake.bishop/Infusion/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/blake.bishop/Infusion/google-cloud-sdk/completion.zsh.inc'; fi

# Python 2 hack for node-gyp
export PATH="/usr/local/opt/python@2/libexec/bin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="/usr/local/opt/llvm/bin:$PATH"

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

if [ -f $HOME/.infusionsoft ]; then
    source $HOME/.infusionsoft
fi


# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/blake.bishop/.nvm/versions/node/v8.9.1/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/blake.bishop/.nvm/versions/node/v8.9.1/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/blake.bishop/.nvm/versions/node/v8.9.1/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/blake.bishop/.nvm/versions/node/v8.9.1/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
