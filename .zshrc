#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# Aliase
alias ll="ls -lah"
alias gs="git status"

## EVNs ##
export http_proxy="proxy.fhm.de:8080"
export https_proxy="proxy.fhm.de:8080"
export ftp_proxy="proxy.fhm.de:8080"
#export minikube_ip=$(minikube ip)
#export no_proxy=".fhm.de",$minikube_ip
source <(kubectl completion zsh) 

function pon() {
    export {http,https,ftp}_proxy='proxy.fhm.de:8080'
    export no_proxy='.fhm.de'
    echo "proxy on!"
}

function poff() {
    unset {http,https,ftp,no}_proxy
    echo "proxy off!"
}

function home() {
	sudo mount -t nfs 192.168.0.3:/mnt/share ~/data/nfsmount
	echo "~/data/nfsmount mounted!"
}

function hoff() {
	sudo umount ~/data/nfsmount
	echo "~/data/nfsmount unmounted!"
}
