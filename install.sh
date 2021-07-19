#!/bin/zsh

local highlighting_path=~/.oh-my-zsh/zsh-syntax-highlighting

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp -r oh-my-zsh/custom/plugins/github-repo ~/.oh-my-zsh/custom/plugins/github-repo
cp .gitconfig ~/.gitconfig
if [ -d "$highlighting_path" ]; then git pull; else git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $highlighting_path; fi

source ~/.zshrc

brew install jq
