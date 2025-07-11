#!/usr/bin/env bash

source ./helpers/hepers.sh
source ./config/configs.sh

echo "##### INSTALLING TOOLS #####"

echo "Installing fzf"
brew install fzf

echo "Installing ripgrep"
brew install ripgrep

echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing zoxide"
brew install zoxide

echo "Installing McFly"
brew install mcfly

echo "Istalling Starship"
brew install starship

echo "Installing Ghostty"
brew install --cask ghostty

echo "Installing tmux"
brew install tmux

echo "Installing nvim"
brew install nvim

echo "##### COPYING CONFIGS #####"

cwd=$(pwd)

echo "Configuring Ghostty"
bkp_current_config $GHOSTTY_CONFIG
ln -s $cwd/dot/ghostty $GHOSTTY_CONFIG

echo "Configuring tmux"
git clone --single-branch https://github.com/gpakosz/.tmux.git $HOME/oh-my-tmux
mkdir -p "$XDG_CONFIG_HOME/tmux"
ln -s $HOME/oh-my-tmux/.tmux.conf "$XDG_CONFIG_HOME/tmux/tmux.conf"
ln -s $cwd/dot/tmux.conf "$XDG_CONFIG_HOME/tmux/tmux.conf.local"

echo "Configuring zsh"
ln -s $cwd/dot/zsh_extras $HOME/.zsh_extras
ln -s $cwd/dot/zsh_alias $HOME/.zsh_alias
echo "source .zsh_extras" >>$HOME/.zshrc
echo "source .zsh_alias" >>$HOME/.zshrc

echo "##### Installing dev tools #####"

echo "Installing docker"
brew install colima
brew install docker docker-compose
mkdir -p $HOME/.docker/cli-plugins
ln -sfn $(brew --prefix)/opt/docker-compose/bin/docker-compose $HOME/.docker/cli-plugins/docker-compose

echo "Installing python"
brew install pipx
pipx ensurepath
pipx install poetry

echo "Installing Clojure"
brew install clojure/tools/clojure
brew install leiningen
brew install borkdude/brew/babashka
