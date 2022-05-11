# Installing Arch

## Load keyboard

```shell
 loadkeys us colemak
```

## Configure wifi (skip if using cable):
  ```shell
     iwctl
  ```

  - follow the interactive instructions using the following commands (mind the order):
  ```shell
    device list
    station <device> scan
    station <device> get-networks
    station <device> connect <network>
    station <device> show
    exit
  ```
  - if the device is powered off, to turn it on, run:
    
  ```shell
    kill unblock all
  ```
  
## Install Arch:
  ```shell
   pacman -Sy python-archinstall
   python -m archinstall
  ```
  - follow the interactive instructions.
  - after install, reboot without livemedia

## Install packages

    ```shell
     bash heyarch.sh
    ```
    
## ZSH as default shell

```shell
 chsh -s $(which zsh)
```

## SSH key

```shell
 ssh-keygen
```

## Setup tmux
```shell
 git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
Then, start tmux and press `prefix + I` to install the plugins listed in tmux conf file

## GTK Theming

I use *Material Black Colors*, theme is [here](https://www.gnome-look.org/p/1316887/) and the matching icons are [here](https://www.pling.com/p/1333360/).

Once they're downloaded, unzip them and

```shell
sudo mv Material-Black-Blueberry /usr/share/themes
sudo mv Material-Black-Blueberry-Suru /usr/share/icons
```

Now edit **~/.gtkrc-2.0** and **~/.config/gtk-3.0/settings.ini** by adding
these lines:

```ini
# ~/.gtkrc-2.0
gtk-theme-name = "Material-Black-Blueberry"
gtk-icon-theme-name = "Material-Black-Blueberry-Suru"

# ~/.config/gtk-3.0/settings.ini
gtk-theme-name = Material-Black-Blueberry
gtk-icon-theme-name = Material-Black-Blueberry-Suru
```

Next time you log in, these changes will be visible

## Colored pacman

- Uncomment the "Color" line in `/etc/pacman.conf`

# Laptop-specific

- To control screen brightness
```shell
 pacman -S brightnessctl
```

- For battery indicator instant updates (awesomeWM battery widget)

```shell
git clone git@github.com:streetturtle/awesome-wm-widgets.git
pacman -S acpi
```
