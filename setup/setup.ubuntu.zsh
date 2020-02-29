echo "======================================="
echo "nvim に必要な設定を行います"
echo "======================================="

install_cmd() {
  if builtin command -v $1 > /dev/null; then
  else
    echo "$1 is not found."
    zsh -c "sudo apt install $1"
  fi
}

install_cmd pip3
install_cmd ctags
install_cmd global
install_cmd mupdf
install_cmd xdotool
install_cmd chktex
install_cmd jq
install_cmd shellcheck
install_cmd cmigemo

pip3 install --user neovim-remote pynvim jedi flake8 yapf isort yamllint

if [ -e "$HOME/.yarn/bin" ]; then
  yarn add global neovim eslint tslint prettier stylelint sasslint
fi
