# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Num  Colour   R G B
# 0    black    0,0,0
# 1    red      1,0,0
# 2    green    0,1,0
# 3    yellow   1,1,0
# 4    blue     0,0,1
# 5    magenta  1,0,1
# 6    cyan     0,1,1
# 7    white    1,1,1


red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`


# Alias
alias ll="ls -lah"
alias gs="git status"
alias k="kubectl"

## ENVs ##
#export minikube_ip=$(minikube ip)
#export no_proxy=".fhm.de",$minikube_ip
export TILLER_NAMESPACE=tools && helm init -c > /dev/null
source <(kubectl completion zsh)
complete -C aws_completer aws
export PATH="/Users/tor0001s/go/bin:$PATH"
export ETCDCTL_API=3


function k-prod() {
  alias k="kubectl --namespace prod"
  echo "\n${red}kubectl --namespace prod active\n${reset}"
}
function k-test() {
  alias k="kubectl --namespace test"
  echo "\n${green}kubectl --namespace test active\n${reset}"
}
function k-dev() {
  alias k="kubectl --namespace dev"
  echo "\n${green}kubectl --namespace dev active\n${reset}"
}
function k-playground() {
  alias k="kubectl --namespace test"
  echo "\n${green}kubectl --namespace playground active\n${reset}"
}
function k-tools() {
  alias k="kubectl --namespace tools"
  echo "\n${green}kubectl --namespace tools active\n${reset}"
}
function k-system() {
  alias k="kubectl --namespace kube-system"
  echo "\n${green}kubectl --namespace kube-system active\n${reset}"
}
function k-default() {
  alias k="kubectl"
  echo "\n${green}kubectl without namespace active\n${reset}"
}


function etcd-prod() {
  export ETCDCTL_KEY_FILE=/Users/tor0001s/repos/ucp_plattform/ansible/certs/prod/etcd-key.pem
  export ETCDCTL_CACERT=/Users/tor0001s/repos/ucp_plattform/ansible/certs/prod/ca.pem
  export ETCDCTL_CERT=/Users/tor0001s/repos/ucp_plattform/ansible/certs/prod/etcd.pem
  export ETCDCTL_KEY=/Users/tor0001s/repos/ucp_plattform/ansible/certs/prod/etcd-key.pem
  export ETCDCTL_CA_FILE=/Users/tor0001s/repos/ucp_plattform/ansible/certs/prod/ca.pem
  export ETCDCTL_CERT_FILE=/Users/tor0001s/repos/ucp_plattform/ansible/certs/prod/etcd.pem
  export ETCDCTL_ENDPOINTS=https://app-kubema-p1.ucp.fhm.de:2379,https://app-kubema-p2.ucp.fhm.de:2379,https://app-kubema-p3.ucp.fhm.de:2379
  echo "\n${red}etcd-PROD on!\n${reset}"
}

function etcd-dev() {
  export ETCDCTL_KEY_FILE=/Users/tor0001s/repos/ucp_plattform/ansible/certs/dev/etcd-key.pem
  export ETCDCTL_CACERT=/Users/tor0001s/repos/ucp_plattform/ansible/certs/dev/ca.pem
  export ETCDCTL_CERT=/Users/tor0001s/repos/ucp_plattform/ansible/certs/dev/etcd.pem
  export ETCDCTL_KEY=/Users/tor0001s/repos/ucp_plattform/ansible/certs/dev/etcd-key.pem
  export ETCDCTL_CA_FILE=/Users/tor0001s/repos/ucp_plattform/ansible/certs/dev/ca.pem
  export ETCDCTL_CERT_FILE=/Users/tor0001s/repos/ucp_plattform/ansible/certs/dev/etcd.pem
  export ETCDCTL_ENDPOINTS=https://app-kubema-v1.ucpdev.fhm.de:2379,https://app-kubema-v2.ucpdev.fhm.de:2379,https://app-kubema-v3.ucpdev.fhm.de:2379
  echo "\n${green}etcd-DEV on\n${reset}"
}

function pon() {
    export {http,https,ftp}_proxy='proxy.fhm.de:8080'
    export no_proxy='.fhm.de'
    echo "\n${green}proxy on!\n${reset}"
}

function poff() {
    unset {http,https,ftp,no}_proxy
    echo "\n${red}proxy off!\n${reset}"
}
