export EDITOR='nvim'
export ZSH=/Users/blakebishop/.oh-my-zsh
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

ZSH_THEME="refined"

plugins=(git tmux npm zsh-syntax-highlighting zsh-autosuggestions)

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

export GOPATH="${HOME}/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export SBIN_ROOT="/usr/local/sbin"
export PYENV_ROOT="$HOME/.pyenv"
export RUBY_ROOT="/usr/local/opt/ruby/bin"
export PATH="$SBIN_ROOT:$PYENV_ROOT/bin:$RUBY_ROOT:${GOPATH}/bin:${GOROOT}/bin:$PATH"

compctl -U -K jump_completion j

# eval "$(starship init zsh)"
eval "$(pyenv init --path)"

# Aliases
alias vim="nvim"
alias vimdiff="nvim -d"
alias npmLg="npm list -g --depth=0"

# Prenda
alias dbs=". $HOME/Code/prendaworld/startSharedDbs.sh"
alias pw="meteor run --settings settings.json --no-release-check"
