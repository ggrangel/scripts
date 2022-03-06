#!/bin/bash

# This is the first script to be called whenever the system is reinstalled.

pacman -Sy python-archinstall
python -m archinstall
