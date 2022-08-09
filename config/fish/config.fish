# remove fish greeting
set fish_greeting

# add rust to path
export PATH="$HOME/.cargo/bin:$PATH"

# add pyenv to path
export PATH="$HOME/.pyenv/bin:$PATH"

# add fnm to PATH
fnm env --use-on-cd | source

# set pyenv
pyenv init - | source

# add poetry to path
export PATH="$HOME/.poetry/bin:$PATH"

# set starship prompt
starship init fish | source

# add zoxide to shell
zoxide init fish | source