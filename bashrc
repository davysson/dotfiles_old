dotdir=$HOME/.dotfiles
image="fedora-box"
shell="$(which fish)"

# shell must be running interactively
if [ -t 0 ]; then
    # must not be already inside a container
    if [ -z "$container" ]; then
        # build image if it doesn't exist
        if [ -z "$(podman images --filter reference=fedora-box --quiet)" ]; then
            podman build -t $image $dotdir
            SHELL=$shell toolbox create --image $image
        fi

        # enter the container with custom shell
        SHELL=$shell toolbox enter $image
    fi
fi
