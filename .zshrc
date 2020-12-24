export EDITOR=$(which nvim)
export CLICOLOR=1
unsetopt NOMATCH
setopt histignorealldups
setopt globdots
zstyle ':completion:*' ignore-parents parent pwd
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' menu select

# keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# folder for custom functions
mkdir -p ~/.zfunctions
fpath=($fpath "${HOME}/.zfunctions")

# fzf options
export FZF_DEFAULT_COMMAND="rg --files --hidden -g '!.git' -g '!node_modules'"
export FZF_DEFAULT_OPTS="-i"

# completions
## rust
rustup completions zsh > ~/.zfunctions/_rustup
rustup completions zsh cargo > ~/.zfunctions/_cargo
## python
pip3 completion --zsh > ~/.zfunctions/_pip3
poetry completions zsh > ~/.zfunctions/_poetry
## web development
npm completion > ~/.zfunctions/_npm
## k8s
helm completion zsh > ~/.zfunctions/_helm
kubectl completion zsh > ~/.zfunctions/_kubectl

# use modern completion system
autoload -Uz compinit
compinit

# starship prompt
eval "$(starship init zsh)"

# update packages not managed by homebrew
alias upgrade="echo updating pip packages && pip3 install --upgrade pynvim &&\
    echo && echo updating rust && rustup update &&\
    echo && echo updating vim-plug && nvim --headless +PlugUpdate +PlugUpgrade +qa &&\
    echo && echo && echo updating brew && brew update &&\
    brew upgrade"
alias x86="/usr/bin/arch -x86_64"
