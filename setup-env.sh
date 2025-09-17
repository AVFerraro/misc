#!/bin/bash

echo "CHECK GIT"
git config --global user.name "Alex Ferraro"
git config --global user.email "alex.ferraro9@gmail.com"

echo "CHECK UV"
if ! command -v uv &>/dev/null; then
    echo "NOTE: installing uv..."
    curl -LsSf https://astral.sh/uv/install.sh | sh
    echo "NOTE: uv installed"
fi

echo "CHECK COOKIECUTTER"
if ! command -v cookiecutter &>/dev/null; then
    echo "NOTE: installing cookiecutter..."
    uv tool install cookiecutter --with jinja2-git
    echo "NOTE: cookiecutter installed"
fi

echo "CHECK VSCODE"
declare -a extensions=(
    "EditorConfig.EditorConfig"
    "tamasfe.even-better-toml"
    "mhutchie.git-graph"
    "ms-toolsai.jupyter"
    "magicstack.MagicPython"
    "yzhang.markdown-all-in-one"
    "donjayamanne.python-extension-pack"
    "mechatroner.rainbow-csv"
    "charliermarsh.ruff"
    "foxundermoon.shell-format"
    "GitHub.vscode-pull-request-github"
    "redhat.vscode-yaml"
)
for i in "${extensions[@]}"; do
    echo -e " \t $(echo $i | cut -d'.' -f2) from $(echo $i | cut -d'.' -f1)"
    code --install-extension $i --force
done
