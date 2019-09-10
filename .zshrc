if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# envs
export GOPATH="${HOME}/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

export VISUAL=nano
export EDITOR="$VISUAL"

# aliases
alias gob="CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main ."
alias ll="ls -lah"
alias py="python"
alias gs="git status"
alias gd="git diff"
alias gc="git commit"
alias qc="git add . && git commit -m foooo && git push"
alias vd="vagrant destroy -f"
alias vu="vagrant up"
alias vs="vagrant ssh"
alias vst="vagrant status"
alias clearssh="rm -f ~/.ssh/known_hosts"
alias galaxy-get="ansible-galaxy install -r requirements.yml -p ./roles --force"
alias vad="rm -rf roles/ && vagrant up && vagrant provision"
alias venv="virtualenv venv --python=python3 && source venv/bin/activate"

# autocompletion stuff
fpath=(/usr/local/share/zsh-completions $fpath)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

git-sync () {
  find . -print | grep ".git$" | sed 's,\/.git,,' | sed "s|^\./||" | xargs -P10 -I{} git -C {} checkout master
  find . -print | grep ".git$" | sed 's,\/.git,,' | sed "s|^\./||" | xargs -P10 -I{} git -C {} pull
}

azure-resourcegroup () {
  local get_groups=$(az group list | jq ".[].name" | sed 's/"//g' | fzf)
  az configure --defaults group=${get_groups}
}

azure-subscription () {
  local get_subs=$(az account list | jq ".[].name" | sed 's/"//g' | fzf)
  az account set --subscription ${get_subs}
}

azure-ips () {
  local rgp=$(az group list | jq '.[].name' | grep sharedservices | sed 's/"//g' | fzf )
  local check_vm=($(az vm list -g ${rgp} | jq '.[].name' | sed 's/"//g'))
  local check_vmss=($(az vmss list -g ${rgp} | jq '.[].name' | sed 's/"//g'))

  local array=()
  if [[ $check_vm ]]; then array+=$check_vm fi
  if [[ $check_vmss ]]; then array+=($check_vmss) fi
  local count=$(echo "${#array[@]}")

  if [[ $count > "1" ]]; then
    local get=($(echo $array | tr ' ' '\n' | fzf))
  elif [[ $count == "1" ]]; then
    local get=($(echo $array | tr ' ' '\n'))
  else
    echo "no VMs or VMSS found."
    return 0
  fi

  if [[ " ${check_vm[@]} " =~ " ${get} " ]]; then
    az vm show -g ${rgp} --name ${get} -d | jq '.privateIps'
  elif [[ " ${check_vmss[@]} " =~ " ${get} " ]]; then
    az vmss nic list -g ${rgp} --vmss-name ${get} | jq '.[].ipConfigurations | .[].privateIpAddress'
  fi
}

azure-state () {
  az vm list -d | jq '.[] | {name: .name, state: .powerState}'

  local COUNT=0
  for rgp in $(az vmss list | jq -r '.[].resourceGroup'); do \
    az vmss get-instance-view -g $rgp --name $(az vmss list |  jq -r ".[$COUNT].name") --instance-id "*" | jq ".[] | {name: .computerName, state: .statuses[1].displayStatus}"; \
    COUNT=$COUNT+1; \
  done
}

azure-location () {
  az account list-locations -o table
}

azure-kvreload () {
  local GET=($(az keyvault secret list --vault-name kv-sharedservices-${1}-${2} | jq -r ".[].id" | cut -d/ -f5 | grep ssh))
  for val in ${GET[@]}; do
    VALUE=$(az keyvault secret show --id https://kv-sharedservices-${1}-${2}.vault.azure.net/secrets/$val | jq -r ".value")
    security add-generic-password -a $val -s iTerm2 -w $VALUE -U
    echo "${val} has been added"
  done
}
