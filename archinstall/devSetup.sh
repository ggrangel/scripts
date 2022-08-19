#!/usr/bin/bash

setup_bash_env() {
    pacmanPacks=(
        shellcheck
    )
    pipPacks=(
        beautysh
    )
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
        python-pip
    )

    pipPacks=(
        bpython # better repl
        ## Formatters and Linters
        black
        isort
        flake8     # general
        bandit     # security flaws
        mypy       # typehints
        pydocstyle # documentation
    )

    install_pacman_packages "${pacmanPacks[@]}"
    install_pip_packages "${pipPacks[@]}"
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

setup_bash_env
setup_lua_env
setup_python_env
setup_rust_env
