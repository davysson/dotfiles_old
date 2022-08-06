FROM registry.fedoraproject.org/fedora-toolbox:36
# Install basic tools
RUN dnf install --nodocs --setopt install_weak_deps=False -y curl git clang fish bat exa fd-find ripgrep neovim starship zoxide
# Clean image
RUN dnf clean all -y
# Install rust
ENV CARGO_HOME=/opt/cargo
ENV RUSTUP_HOME=/opt/rustup
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
RUN /opt/cargo/bin/rustup default stable
ENV PATH="/opt/cargo/bin:$PATH"
# Install Node
ENV FNM_DIR=/opt/fnm
RUN cargo install fnm && fnm install 18 && fnm default 18
# Install Deno
RUN cargo install deno