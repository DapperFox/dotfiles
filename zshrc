export EDITOR='nvim'
export ZSH=/Users/dapperfox/.oh-my-zsh
export NVM_DIR="$HOME/.nvm"
ZSH_THEME="refined"
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

plugins=(git tmux npm zsh-syntax-highlighting zsh-autosuggestions aliases brew autoenv)

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

export GOPATH="${HOME}/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export SBIN_ROOT="/usr/local/sbin"
export PYENV_ROOT="$HOME/.pyenv"
export RUBY_ROOT="/usr/local/opt/ruby/bin"
export PATH="$SBIN_ROOT:$PYENV_ROOT/bin:$RUBY_ROOT:${GOPATH}/bin:${GOROOT}/bin:$PATH"

eval "$(pyenv init --path)"
eval $(thefuck --alias nope)

# Aliases
alias vim="nvim"
alias vimdiff="nvim -d"
alias npmLg="npm list -g --depth=0"

# Prenda
alias dbs=". $HOME/Code/prendaworld/startSharedDbs.sh"
alias pw="meteor run --settings settings.json --no-release-check"
alias mkt="tmuxinator start mkt"
alias pv="tmuxinator start pv"
export PATH="/usr/local/opt/mongodb-community@4.4/bin:$PATH"
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
export PATH=/Users/dapperfox/.meteor:$PATH
