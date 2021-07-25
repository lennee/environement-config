#!/bin/sh

install_node_packages_and_yarn(){
  # install node version manager
  mkDir ~/.nvm

  echo '# nvm import
    export NVM_DIR=~/.nvm
    source $(brew --prefix nvm)/nvm.sh' >> ~/.zshrc

  source $1/.zshrc

  # Install node
  nvm install 16

  # Install yarn for package managment & upgrade npm
  npm install -g yarn npm

  # install wedriver for automation
  yarn global add selenium-webdriver
}

install_python_packages(){
  # install python 3
  pyenv install $(pyenv install --list | grep -v - | grep -v b | tail -1)

  python3 -m pip install --upgrade --user pip

  # read and install packages
  while IFS= read -r line; do
    echo "
    === Installing \"$line\" ===
    "
    python3 -m pip install $line --user
  done < installs/python_packages.txt
}


if [[ "`uname`" == "Linux" ]]; then
  # Installing programs
  pacman -S code etcher nvm postman-bin pyenv slack-desktop julia tmux via-bin

  pamac build spotify
  HOME
  HOME_DIR="/home/tristan"
elif [[ "`uname`" == "Darwin" ]]; then
  # Installing programs
  brew install htop julia nvm pyenv tmux wget

  # Installing Cask Software
  brew install --cask ableton-live-suite balenaetcher firefox postman slack spotify via visual-studio-code
  HOME_DIR="~"
fi

install_python_packages ${HOME_DIR}
install_node_packages_and_yarn