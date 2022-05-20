#!/usr/bin/bash

PACMAN_PACKAGES=(
	go # for vim-hexokinase
	luarocks
	npm
	postgresql-libs
	pyenv
	python-black
	python-isort
	python-pip
	shellcheck
	shfmt
	yarn
)

AUR_PACKAGES=(
	heroku-cli
	nvm
	stylua
)

NPM_PACKAGES=(
	prettier_standard
	# typescript
	# typescript-language-server
)

PIP_PACKAGES=(
	## Linters
	flake8     # general
	bandit     # security flaws
	mypy       # typehints
	pydocstyle # documentation
)

install_pacman_packages() {
	for package in "${PACMAN_PACKAGES[@]}"; do
		sudo pacman -S "$package" --noconfirm
	done
}

install_AUR_packages() {
	for package in "${AUR_PACKAGES[@]}"; do
		paru -S "$package" --noconfirm
	done

}

install_NPM_packages() {
	for package in "${NPM_PACKAGES[@]}"; do
		sudo npm install -g "$package"
	done
}

install_pip_packages() {
	for package in "${PIP_PACKAGES[@]}"; do
		pip install "$package"
	done
}
