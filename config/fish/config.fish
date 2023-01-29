# remove fish greeting
set fish_greeting

# install fisher if it's not already installed
if not functions -q fisher && test -z "$FISHER_INSTALL"
    curl -sL https://git.io/fisher | source
    FISHER_INSTALL=1 fisher install jorgebucaran/fisher jethrokuan/z jorgebucaran/autopair.fish jorgebucaran/replay.fish mattgreen/lucid.fish
end

# add dot/bin
fish_add_path $HOME/.dot/bin

# check if running in container
if test -e /run/.containerenv

    # set variables
    set -gx PYENV_ROOT /opt/pyenv
    set -gx GOPATH /opt/go

    # initialize pyenv
    pyenv init - | source
    pyenv virtualenv-init - | source

    # prompt when running inside container
    set -g lucid_prompt_symbol "#❯"
    set -g lucid_prompt_symbol_error "#❯"

else
    # prompt when running outside container
    set -g lucid_prompt_symbol "❯"
    set -g lucid_prompt_symbol_error "❯"

    function box
        set -l NAME "archlinux-box"
        set -l IMAGE $NAME
    
        # check if box already exists
        if ! distrobox list | grep -q $NAME
            distrobox create \
                --additional-flags "\
                    --device=/dev/kfd \
                    --device=/dev/dri \
                    --group-add keep-groups \
                    --cap-add=SYS_PTRACE \
                    --security-opt seccomp=unconfined" \
                --yes \
                --image $IMAGE \
                --name $NAME \
                --init-hooks "chown $USER:$USER -R /opt"
        end
    
        # enter the created box
        distrobox enter $NAME
    end
end