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
    ```zsh```

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

    ```
    chsh -s /bin/zsh
    ```

7. copy contents to enable wikimatze

   ```
   cat prompt_wikimatze_setup > ~/.zprezto/modules/prompt/functions/prompt_wikimatze_setup
   ```

8. brew stuff

    ```
    brew install ansible jq telnet awscli kube-aws openssl terraform azure-cli packer terragrunt tree fzf watch wget git zsh nmap zsh-completions
    ```
 
    ```
    brew cask install dozer pock vagrant vagrant-manager virtualbox vscodium
    ```

