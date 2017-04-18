This guide assumes your working directory is your cloned git repo.
# ZSH

### Install ZSH
```sh
brew install zsh zsh-completions
```
### Install Prezto on top of zsh
```sh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
```
### create ~/.zshrc
```sh
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
```
### copy content of .zshrc from git to local .zshrc link
check the proxysettings!
```sh
cat .zshrc > ~/.zshrc
```
### copy content of .zpreztorc from git to local .zpreztorc link
check the proxysettings!
```sh
cat .zpreztorc > ~/.preztorc
```


# TMUX

### Install tmux
```sh
brew install tmux
```

### copy .tmux.conf to homedir
```sh
cp .tmux.conf ~/.
```


# Docker & Minikube
Follow this link to install the latest version of docker for mac
```sh
https://docs.docker.com/docker-for-mac/install/
```
Follow this link to install the latest version of minikube
```sh
https://github.com/kubernetes/minikube/releases
```

```sh
> minikube start --docker-env http_proxy=$http_proxy --docker-env https_proxy=$https_proxy --docker-env no_proxy=$no_proxy
> export minikube_ip=$(minikube ip)
> export no_proxy=$no_proxy,$minikube_ip
```
