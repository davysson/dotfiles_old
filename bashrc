dotdir=$HOME/.dotfiles
image="fedora-box"
shell="$(which fish)"

if [ -z "$container" ]; then
    # build image if it doesn't exist
    if [ -z "$(podman images --filter reference=fedora-box --quiet)" ]; then
        podman build -t $image $dotdir
        SHELL=$shell toolbox create --image $image
    fi

    # enter the container
    SHELL=$shell toolbox enter $image
fi