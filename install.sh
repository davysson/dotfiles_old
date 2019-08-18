#!/usr/bin/env bash
if ! [ -x "$(command -v cargo)" ]; then
  echo "installing cargo..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  set PATH=$HOME/.cargo/bin:$PATH
fi

if ! [ -x "$(command -v starship)" ]; then
  echo "installing startship..."
  cargo install starship
fi

