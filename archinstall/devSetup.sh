#!/usr/bin/bash

setup_general_env() {
  pacmanPacks=(
	    aws-cli
        python-pip
	)
        install_pacman_packages "${pacmanPacks[@]}"
}

setup_bash_env() {
    pacmanPacks=(
        shellcheck
    )
    pipPacks=(
        beautysh
    )
    install_pacman_packages "${pacmanPacks[@]}"
    install_pip_packages "${pipPacks[@]}"
}

setup_lua_env() {
    aurPacks=(
        stylua
    )
    pacmanPacks=(
        luarocks
    )

    install_AUR_packages "${aurPacks[@]}"
    install_pacman_packages "${pacmanPacks[@]}"
}

setup_python_env() {
    pacmanPacks=(
        pyenv
    )

    pipPacks=(
        bpython # better repl
        ## Formatters and Linters
        black
        # isort
        # flake8     # general
        # bandit     # security flaws
        # mypy       # typehints
        # pydocstyle # documentation
    )

    install_pacman_packages "${pacmanPacks[@]}"
    install_pip_packages "${pipPacks[@]}"
    # for auto activation of virtual environments
    git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
}

setup_rust_env() {
    pacmanPacks=(
        rustup
    )
    install_pacman_packages "${pacmanPacks[@]}"
    # install stable toolchain
    rustup install stable
}

install_AUR_packages() {
    for package in $1; do
        paru -S "$package" --noconfirm
    done

}

install_pacman_packages() {
    for package in $1; do
        sudo pacman -S "$package" --noconfirm
    done
}

install_pip_packages() {
    for package in $1; do
        pip install "$package"
    done
}

setup_general_env
setup_bash_env
setup_python_env
setup_lua_env
# setup_rust_env
