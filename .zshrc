# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
fpath=($fpath "/home/fabian/.zfunctions")


###################################################################################################

# gtk
alias gdark="gsettings set org.gnome.desktop.interface gtk-theme Adwaita-dark"
alias glight="gsettings set org.gnome.desktop.interface gtk-theme Adwaita"

# k8s
export KUBEDEV_KUBECONFIG="default"
source <(helm completion zsh)
source <(minikube completion zsh)
source <(kubectl completion zsh)

# aliases
alias fup="sudo sh -c 'apt update && apt list --upgradeable && apt full-upgrade &&
           apt autoremove -y ; flatpak update -y && flatpak uninstall --unused -y'"
alias winboot="sudo grub-reboot 2 && systemctl reboot"
alias code="flatpak run com.visualstudio.code"
alias dotfiles="/usr/bin/git --git-dir=/home/fabian/.dotfiles/ --work-tree=/home/fabian"
alias dotfiles-ls="dotfiles ls-tree --full-tree -r HEAD"

# zsh options
bindkey ";5D" backward-word
bindkey ";5C" forward-word
unsetopt NOMATCH
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' menu select
fpath=($fpath "/home/fabian/.zfunctions")

# starship prompt
eval "$(starship init zsh)"

# rust autocompletion
mkdir -p ~/.zfunctions
rustup completions zsh > ~/.zfunctions/_rustup
rustup completions zsh cargo > ~/.zfunctions/_cargo
autoload -U compinit && compinit

# npm global path
mkdir -p ~/.npm-global
export PATH=~/.npm-global/bin:$PATH

