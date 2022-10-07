# Get your work environment ready

## Installation

### Configure wifi (skip if using cable):
```shell
iwctl
```

Follow the interactive instructions using the following commands (mind the order):

```shell
device list
station <device> scan
station <device> get-networks
station <device> connect <network>
station <device> show
exit
```
If the device is powered off, to turn it on, run:

```shell
rfkill unblock all
```
If your device doesn't get an IP address (shown in the `station <device> show` output), you must provide it with one using the Dynamic Host Configuration Protocol Client by running:

```
dhcpcd -d --waitip=4
```

### Install Arch

```shell
archinstall
```
Follow the interactive instructions. Non-obvious choices:
1. Disk filesystem: ext4 (why not btrfs?)
2. Encryption password: better set one for laptops
3. Profile: xorg to install graphics drivers
4. Audio: pulse audio (why not pipewire? What is alsa?)
5. Additional packages: networkmanager git

After install, reboot without livemedia
  
## Setup

## Configure internet

```shell
systemctl start NetworkManager
systemctl enable NetworkManager
```
If you need to connect on a Wi-Fi network, run `nmtui`, that comes with the networkmanager package

## Clone my projects

Clone the scripts and the dotfiles projects

```shell
git clone https://github.com/ggrangel/scripts.git
git clone https://github.com/ggrangel/dotfiles.git .config
```
## Install packages

```shell
bash scripts/archinstall/heyarch.sh
bash scripts/archinstall/devSetup.sh
```

## Clone third-party projects

For automatic activation of python virtualenvs: `git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv`

To check $HOME for unwanted files and directories: `git clone https://github.com/b3nj5m1n/xdg-ninja.git ~/apps`

tmux: `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
Then, start tmux and press `prefix + I` to install the plugins listed in tmux conf file

    
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
WantedBy=suspend.target
```

Note: As screen lockers may return before the screen is "locked", the screen may flash on resuming from suspend. Adding a small delay via `ExecStartPost=/usr/bin/sleep` 1 helps prevent this.

Then: `systemctl enable lock.service`

## Configuring applications

### Brave

Join the sync chain and select the option to sync everything

### Neovim

1. In `init.lua`, comment every line or file that contains reference to plugins
2. Save the `packer-setup.lua` file to install the plugins

### GTK Theming

I use *Material Black Colors*, theme is [here](https://www.gnome-look.org/p/1316887/) and the matching icons are [here](https://www.pling.com/p/1333360/).

Once they're downloaded, unzip them and

```shell
sudo mv Material-Black-Blueberry /usr/share/themes
sudo mv Material-Black-Blueberry-Suru /usr/share/icons
```

Make sure the folder name is the same as the settings in `~/.config/gtk-3.0/settings.ini` `~/.config/gtk-2.0/gtkrc` 
Restart awesome to see the changes 

### Laptop-specific

To control screen brightness
```shell
 pacman -S brightnessctl
```

For battery indicator instant updates (awesomeWM battery widget)

```shell
git clone git@github.com:streetturtle/awesome-wm-widgets.git
pacman -S acpi
```
