# Installing Arch

## Load keyboard

```shell
$ loadkeys us colemak
```

## Configure wifi (skip if using cable):
  ```shell
    $ iwctl
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
  $ pacman -Sy python-archinstall
  $ python -m archinstall
  ```
  - follow the interactive instructions.
  - after install, reboot without livemedia

## Install packages

    - Run
      ```shell
        bash heyarch.sh
      ```
