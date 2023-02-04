# remove fish greeting
set fish_greeting

# install fisher if it's not already installed
if not functions -q fisher && test -z "$FISHER_INSTALL"
    curl -sL https://git.io/fisher | source
    FISHER_INSTALL=1 fisher install jorgebucaran/fisher jethrokuan/z jorgebucaran/autopair.fish jorgebucaran/replay.fish mattgreen/lucid.fish
end

# check if running in container
if test -e /run/.containerenv

    # install asdf
    if ! test -e $HOME/.asdf
        git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch v0.11.1

        # sources asdf
        source $HOME/.asdf/asdf.fish

        # install nodejs
        asdf plugin add nodejs
        asdf install nodejs latest
        asdf global nodejs latest

        # install go
        asdf plugin add golang
        asdf install golang latest
        asdf global golang latest

        # install python
        asdf plugin add python
        asdf install python 3.10.9
        asdf global python 3.10.9
    end

    # resource asdf
    source $HOME/.asdf/asdf.fish

    # install Rust toolchain
    if ! test -e $HOME/.cargo
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain stable -y
    end

    # add Rust to path
    fish_add_path $HOME/.cargo/bin

    # prompt when running inside container
    set -g lucid_prompt_symbol "#❯"
    set -g lucid_prompt_symbol_error "#❯"

else
    # prompt when running outside container
    set -g lucid_prompt_symbol "❯"
    set -g lucid_prompt_symbol_error "❯"

    function dbx
        switch $argv[1]
            case build
                set -l registry "ghcr.io/davysson"
                set -l image "$argv[2]-box"
                set -l containerfile "$HOME/.dot/boxes/Containerfile.$argv[2]"
                set -l init_file "/opt/init_$argv[2].sh"
                
                podman build -t "$registry/$image" -f $containerfile

                # remove any dangling image
                podman image prune
            case create
                set -l image "$argv[2]-box"
                set -l name "$argv[2]"
                set -l box_home "$HOME/Boxes/$argv[2]"

                # link some files to the box home
                mkdir -p $box_home/.config
                ln -sf $HOME/.config/fish $box_home/.config/fish

                # create box
                DBX_NON_INTERACTIVE=1 distrobox create \
                    --additional-flags "--device=/dev/kfd --device=/dev/dri --group-add keep-groups --cap-add=SYS_PTRACE --security-opt seccomp=unconfined" \
                    --yes \
                    --image $image \
                    --name $name \
                    --home $box_home \
                    --init-hooks "chown $USER:$USER -R /opt"
            case enter
                if ! distrobox list | grep -q $argv[2]
                    dbx create $argv[2]
                end

                DBX_NON_INTERACTIVE=1 distrobox enter $argv[2]
            case export
                DBX_NON_INTERACTIVE=1 distrobox export $argv[2..-1]
            case list ls
                DBX_NON_INTERACTIVE=1 distrobox list
            case remove rm
                DBX_NON_INTERACTIVE=1 distrobox rm $argv[2..-1]
            case run
                DBX_NON_INTERACTIVE=1 distrobox enter -T $argv[2] -- $argv[3..-1]
            case stop
                DBX_NON_INTERACTIVE=1 distrobox stop --yes $argv[2]
            case update up
                # pull updated images from registry
                set -l registry ghcr.io/davysson

                podman pull $registry/archlinux-box:latest $registry/fedora-box:latest $registry/ubuntu-box:latest

                # remmove dangling images
                podman image prune
            case '*'
                echo "invalid option"
        end
    end
end