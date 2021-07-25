#!/bin/sh

install_node_and_npm(){
  # install node version manager
  brew install nvm
  mkDir ~/.nvm

  echo '# nvm import
    export NVM_DIR=~/.nvm
    source $(brew --prefix nvm)/nvm.sh' >> ~/.zshrc

  source ~/.zshrc

  # Install node
  nvm install 16

  # Install yarn for package managment & upgrade npm
  npm install -g yarn npm

  # install wedriver for automation
  yarn global add selenium-webdriver
}

install_python_and_packages(){
  # install python 3
  brew install pyenv
  pyenv install $(pyenv install --list | grep -v - | grep -v b | tail -1)

  python3 -m pip install --upgrade pip --user

  # read and install packages
  while IFS= read -r line; do
    echo "
    === Installing \"$line\" ===
    "
    python3 -m pip install $line --user
  done < installs/python_packages.txt
}


install_python_and_packages
install_node_and_npm


# Installing other programs

brew install htop
brew install julia
brew install tmux
brew install wget

brew install --cask ableton-live-suite
brew install --cask balenaetcher
brew install --cask firefox
brew install --cask postman
brew install --cask slack
brew install --cask spotify
brew install --cask via
brew install --cask visual-studio-code
