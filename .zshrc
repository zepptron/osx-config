#
# Executes commands at the start of an interactive session.
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
source <(kubectl completion zsh) 

export ETCDCTL_CA_FILE=XXX/ca.pem
export ETCDCTL_CERT_FILE=XXX/etcd.pem
export ETCDCTL_ENDPOINTS=https://master1:2379,https://master2:2379,https://master3:2379
export ETCDCTL_KEY_FILE=XXX/etcd-key.pem



function pon() {
    export {http,https,ftp}_proxy='proxy.com:1234'
    export no_proxy='.fhm.de'
    echo "proxy on!"
}

function poff() {
    unset {http,https,ftp,no}_proxy
    echo "proxy off!"
}


