#!/usr/bin/bash

PYTHON_PACKAGES=(
	pyright
	python-black
	python-isort
)

PIP_PACKAGES=(
	## Linters
	# flake8     # general
	# bandit     # security flaws
	# mypy       # typehints
	# pydocstyle # documentation
	## Fixers
	black # general
	isort # imports
)


install_pyenv() {
	curl https://pyenv.run | bash
}

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

