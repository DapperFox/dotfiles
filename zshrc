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
export PATH="/usr/local/sbin:$PATH"

compctl -U -K jump_completion j
eval "$(starship init zsh)"
eval "$(pyenv init -)"
eval $(thefuck --alias)
alias vim="nvim"
alias vimdiff="nvim -d"
alias npmgL="npm list -g --depth=0"
### Kuali ###
alias ricedb="docker run --name fin-db -d -p 3306:3306 667650582711.dkr.ecr.us-west-2.amazonaws.com/fin-db:latest"
alias rice="~/Kuali/fin/tomcat/bin/catalina.sh run"
alias fin_clean="mvn clean package -DskipTests=true"
alias pro_fix="docker-compose run --rm web npm install && docker-compose run --rm web npm rebuild node-sass"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
export PATH="/usr/local/opt/mongodb@3.4/bin:$PATH"
function aws_login () {
  saml2aws login -a ${*} --skip-prompt --session-duration 32400 --force
}
export AWS_SDK_LOAD_CONFIG=1
# GO #
export GOPATH="${HOME}/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
