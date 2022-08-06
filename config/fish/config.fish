# remove fish greeting
set fish_greeting

# add rust executables to PATH
export PATH="/opt/cargo/bin:$PATH"

# set starship prompt
starship init fish | source

# add zoxide to shell
zoxide init fish | source