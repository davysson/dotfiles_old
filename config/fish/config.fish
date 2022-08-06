# remove fish greeting
set fish_greeting

# set starship prompt
starship init fish | source

# add zoxide to shell
zoxide init fish | source

# add fnm to PATH
fnm env --use-on-cd | source