FROM registry.fedoraproject.org/fedora-toolbox:36
# Install basic tools
RUN dnf install --nodocs --setopt install_weak_deps=False -y fish bat exa fd-find ripgrep neovim starship zoxide
# Clean image
RUN dnf clean all -y
# Install rust
ENV CARGO_HOME=/opt/cargo
ENV RUSTUP_HOME=/opt/rustup
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
RUN /opt/cargo/bin/rustup default stable
