if type "apt" > /dev/null 2>&1; then
    sudo apt install ctags glob mupdf xdotool chktex jq shellcheck
else
    echo "apt is not this pc!!"
fi
if type "pip3" > /dev/null 2>&1; then
    pip3 install --user neovim-remote pynvim jedi flake8 yapf isort yamllint
else
    echo "pip3 is not this pc!!"
fi
if type "yarn" > /dev/null 2>&1; then
    yarn add glob neovim eslint tslint prettier stylelint sasslint
else
    echo "yarn is not this pc!!"
fi