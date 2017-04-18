# Install ZSH

```brew install zsh zsh-completions```

# Install Prezto on top of zsh

```git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto" ```

# create ~/.zshrc

```setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done```


# Install tmux

```brew install tmux```

# copy .tmux.conf to homedir

```cp .tmux.conf ~/.```

