sudo eopkg install -y git tmux fish alacritty font-iosevka-ttf source-code-pro

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

wget https://raw.githubusercontent.com/arcticicestudio/nord-dircolors/develop/src/dir_colors -O ~/.dir_colors

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

pip install pynvim jedi yapf
