# remove fish greeting
set fish_greeting

# add rust to path
export PATH="$HOME/.cargo/bin:$PATH"

# add zls to path
export PATH="$HOME/zls:$PATH"

# add pyenv to path
export PATH="$HOME/.pyenv/bin:$PATH"

# add fnm to PATH
fnm env --use-on-cd | source

# set pyenv
pyenv init - | source

# add poetry to path
export PATH="$HOME/.poetry/bin:$PATH"

# don`t create __pycache__ inside project
export PYTHONPYCACHEPREFIX="$HOME/.cache/cpython/"

# set starship prompt
starship init fish | source

# add zoxide to shell
zoxide init fish | source

# alias to run ML image
set --local image "artigen"
set --local directory "artigen"
alias agrun="sudo docker run -it --network=host --device=/dev/kfd --device=/dev/dri --group-add=video --ipc=host --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -v $HOME/Projects/$directory:/$directory $image"
alias agbuild="sudo docker build -t $image $HOME/Projects/$directory"