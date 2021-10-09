# start starship prompt
starship init fish | source
# asdf
source ~/.asdf/asdf.fish
# Wasmer
export WASMER_DIR="/home/davysson/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"

# pyenv
status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source
