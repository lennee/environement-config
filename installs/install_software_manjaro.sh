#!/bin/sh

#!/bin/sh

install_node_and_npm(){
  # install node version manager
  pamac install nvm
  mkDir ~/.nvm

  echo '# nvm import
    export NVM_DIR=~/.nvm
    source $(brew --prefix nvm)/nvm.sh' > ~/.szshrc

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
  pamac install pyenv
  pyenv install $(pyenv install --list | grep -v - | grep -v b | tail -1)

  echo '# pyenv import
    if command -v pyenv 1>/dev/null 2>&1; then
      eval "$(pyenv init -)"
    fi' >> ~/.zshrc

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

pacman -S code etcher postman-bin slack-desktop julia tmux via-bin

pamac build spotify
