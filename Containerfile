FROM registry.fedoraproject.org/fedora-toolbox:36
# Install basic tools
RUN dnf install --nodocs --setopt install_weak_deps=False -y fish bat exa fd-find ripgrep neovim starship zoxide
# Clean image
RUN dnf clean all -y
# Install rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
RUN export PATH="$HOME/.cargo/bin:$PATH" && rustup default stable
