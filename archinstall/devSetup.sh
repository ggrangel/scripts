#!/usr/bin/bash

PACMAN_PACKAGES=(
	pyright
	python-black
	python-isort
	prettier
	shellcheck
	shfmt
	go # for vim-hexokinase
	pyenv
	python-pip
	npm # required by LspInstall
	luarocks
)

AUR_PACKAGES=(
	nvm
	stylua
)

PIP_PACKAGES=(
	## Linters
	# flake8     # general
	# bandit     # security flaws
	# mypy       # typehints
	# pydocstyle # documentation
)

install_python_packages() {
	sudo pacman -S "${PYTHON_PACKAGES[@]}" --noconfirm
}

install_pip_packages() {
	venv=core
	pyenv virtualenv $venv
	venvPath=$HOME/.pyenv/versions/$venv/bin/python
	$venvPath -m pip install --upgrade pip

	for package in "${PIP_PACKAGES[@]}"; do
		$venvPath -m pip install "$package"
	done
}
