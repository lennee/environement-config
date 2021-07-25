#!/bin/sh

setup_oh_my_zsh(){
  # Install oh my zsh
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  # Add auto suggestions plugin
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

  # Add syntax highlighting pulgin
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

  # pulling down .zshrc to local env
  curl https://raw.github.com/lennee/new-distro-config/main/.zshrc -o ~/.zshrc

  # Final themeing update to set only 2 directories shown in the clie
  sed -i '.original' "12s/.*/local current_dir='%{$terminfo[bold]$fg[blue]%}%2~ %{$reset_color%}'/" ~/.oh-my-zsh/themes/bira.zsh-theme

  source ~/.zshrc
}

setup_package_manager()
{
  if [[ "`uname`" == "Linux" ]]; then
    pacman -Syu
  elif [[ "`uname`" == "Darwin" ]]; then
    which -s brew
    if [[ $? != 0 ]] ; then
        # Install Homebrew
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    else
        brew update
    fi
  fi

}

install_software(){
  if [[ "`uname`" == "Linux" ]]; then
    installs/install_software_manjaro.sh
  elif [[ "`uname`" == "Darwin" ]]; then
    installs/install_software_mac.sh
  fi
}

create_directories(){
  mkDir '~/Documents/Music Projects'
  mkDir '~/Documents/git-repos'
}


setup_package_manager

which -s git
if [[ $? != 0 ]] ; then
  echo "Install git then run script again"
  exit 0
fi

install_software

setup_oh_my_zsh

create_directories


