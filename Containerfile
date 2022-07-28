FROM registry.fedoraproject.org/fedora-toolbox:36
# Install basic tools
RUN dnf install --nodocs --setopt install_weak_deps=False -y fish bat exa fd-find ripgrep neovim starship zoxide
# Clean image
RUN dnf clean all -y