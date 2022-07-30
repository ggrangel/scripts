# Installing Arch

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
  - if you're depending on wifi, remember to install upfront the package `networkmanager` to handle networks.
  - after install, reboot without livemedia

## Install packages

    ```shell
     bash heyarch.sh
    ```
    
## ZSH as default shell

```shell
 chsh -s $(which zsh)
```

- Create a new file called `zshenv` in `/etc/zsh/` and add the following line

```shell
  ZDOTDIR=$HOME/.config/zsh/
```

## SSH key

- Generate a new SSH key for your computer.

```shell
 ssh-keygen
```

- If you're using SSH to authenticate in github, remember to add your pub key in github's setting

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
Next time you log in, these changes will be visible

## Colored pacman

- Uncomment the "Color" line in `/etc/pacman.conf`

## Prompt only the password at login

```shell
sudo mkdir -p /etc/systemd/system/getty@tty1.service.d/
```

Cd to this directory, create a file called autologin.conf and add the following lines:

```
[Service]
ExecStart=
ExecStart=-/sbin/agetty -ino ggrangel %I 38400 linux
```

Then: `systemctl enable getty@tty1`

## Lock machine before suspending it

Cd to `/etc/systemd/system/`, create a file `lock.service` and add the lines below

```
[Unit]
Description=Lock computer before suspending it
Before=sleep.target

[Service]
User=ggrangel
Type=oneshot
Environment=DISPLAY=:0
ExecStart=/usr/bin/i3lock-fancy

[Install]
WantedBy=[suspend target]
```

Note: As screen lockers may return before the screen is "locked", the screen may flash on resuming from suspend. Adding a small delay via `ExecStartPost=/usr/bin/sleep` 1 helps prevent this.

Then: `systemctl enable lock.service`

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
