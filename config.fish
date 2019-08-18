set -U DOTFILES "$HOME/.dotfiles"

# disable greeting message
set fish_greeting

# add cargo to $PATH
set -U fish_user_paths $HOME/.cargo/bin $fish_user_paths

# add conda to path
set -U fish_user_paths $HOME/.miniconda3/bin

# use starship prompt
eval (starship init fish)

# bootstrap fisher
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias deepo='docker run --gpus all --ipc=host --name deepo -w=/deepo -v (pwd):/deepo --rm -it ufoym/deepo:all-jupyter'

alias code="code --enable-proposed-api ms-vscode-remote.remote-containers"

alias yaconf='yay -Pg'
alias yaupg='yay -Syu'
alias yasu='yay -Syu --noconfirm'
alias yain='yay -S'
alias yains='yay -U'
alias yare='yay -R'
alias yarem='yay -Rns'
alias yarep='yay -Si'
alias yareps='yay -Ss'
alias yaloc='yay -Qi'
alias yalocs='yay -Qs'
alias yalst='yay -Qe'
alias yaorph='yay -Qtd'
alias yainsd='yay -S --asdeps'
alias yamir='yay -Syy'


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/davysson/.miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

