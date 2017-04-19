This guide assumes your working directory is your cloned git repo.
# ZSH

1. Install ZSH
```sh
brew install zsh zsh-completions
```
2. Install [Prezto] on top of zsh
```sh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
```
3. create ~/.zshrc
```sh
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
```
4. copy content of .zshrc from git to local .zshrc link
check the proxysettings!
```sh
cat .zshrc > ~/.zshrc
```
5. copy content of .zpreztorc from git to local .zpreztorc link
check the proxysettings!
```sh
cat .zpreztorc > ~/.preztorc
```
6. set as default
```sh
chsh -s /bin/zsh
```

# TMUX

1. Install tmux & [reattach-to-user-namespace]
```sh
> brew install tmux
> brew install reattach-to-user-namespace
```

2. copy .tmux.conf to homedir
```sh
cp .tmux.conf ~/.
```


# Docker & Minikube
1. Follow this link to install the latest version of docker for mac

    https://docs.docker.com/docker-for-mac/install/

2. Follow this link to install the latest version of minikube

    https://github.com/kubernetes/minikube/releases


3. set minikube environmentvariables for better integration
```sh
> minikube start --docker-env http_proxy=$http_proxy --docker-env https_proxy=$https_proxy --docker-env no_proxy=$no_proxy
> export minikube_ip=$(minikube ip)
> export no_proxy=$no_proxy,$minikube_ip
```


[Prezto]: https://github.com/sorin-ionescu/prezto
[reattach-to-user-namespace]: https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard
