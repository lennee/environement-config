export ZSH="/Users/tristansmith/.oh-my-zsh"

ZSH_THEME="bira"

plugins=(
	git
  history-substring-search
  colored-man-pages
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Git Aliases

alias gaa="git add *"
alias ga="git add"
alias gcm="git commit -a -m"

# NPM Aliases

alias ns="npm start"
alias nsd="npm run start-dev"
alias nb="npm build"
alias nbd="npm run build-dev"
alias ni="npm install"
alias nisd="npm install --save-dev"
alias nt="npm test"

function mkcd {
  mkDir $1
  cd $1
}