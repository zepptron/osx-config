# Install ZSH
```sh
brew install zsh zsh-completions
```

# Install Prezto on top of zsh
```sh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
```

# create ~/.zshrc
```sh
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
```
# copy content of .zshrc from git to local .zshrc link
check the proxysettings!
```sh
cat .zshrc > ~/.zshrc
```

# Install tmux
```sh
brew install tmux
```

# copy .tmux.conf to homedir
```sh
cp .tmux.conf ~/.
```
