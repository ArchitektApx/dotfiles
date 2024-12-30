dep_packages="zsh gh pipx zsh-syntax-highlighting zsh-autosuggestions bat eza"

install_fedora () {
  sudo dnf install -y $dep_packages fzf thefuck
}

install_ubuntu () {
  sudo apt install -y $dep_packages

  # https://github.com/nvbn/thefuck/issues/1434
  pip install https://github.com/nvbn/thefuck/archive/master.zip --break-system-packages
  # install fzf from source to get the latest version
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
}

install () {
  if [ -f /etc/fedora-release ]; then
    install_fedora
  elif [ -f /etc/debian_version ]; then
    install_ubuntu
  else
    echo "Unsupported distro"
    exit 1
  fi

  gh extension install github/gh-copilot
  pipx ensurepath
}

push_configs () {
  cp -rf .config/zsh $HOME/.config/
  cp -rf .config/ghostty $HOME/.config/
  cp -rf .config/kitty $HOME/.config/
  cp -f .zshenv $HOME/.zshenv
  cp -f .tmux.conf $HOME/.tmux.conf
  cp -f .gitconfig $HOME/.gitconfig
}

push_startup_helper () {
  mkdir -p $HOME/startup 
  cp -rf startup $HOME/startup/
}

install
push_configs
push_startup_helper