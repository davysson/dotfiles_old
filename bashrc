dotdir=$HOME/.dotfiles
image="fedora-box"
shell="$(which fish)"

# shell must be running interactively
if [ -t 0 ]; then
    # must not be already inside a container
    if [ -z "$container" ]; then
        # create toolbox if it doesn't exist
        if [ -z "$(podman images --filter reference=fedora-box --quiet)" ]; then
            # build the image
            podman build -t $image $dotdir
            # create the container
            SHELL=$shell toolbox create --image $image
            # set permissions
            toolbox run --container fedora-box sudo chown -R $USER:$USER /opt
        fi

        # enter the container with custom shell
        SHELL=$shell TERM=xterm-256color toolbox enter $image
    fi
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
