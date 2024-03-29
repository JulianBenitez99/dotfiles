#!/bin/bash

source ~/.zprofile

setup_nvim() {
  echo "Installing pip3 neovim"
  python3 -m pip install --user --upgrade neovim >/dev/null
  echo "Installing pip3 pynvim"
  python3 -m pip install --user --upgrade pynvim >/dev/null
}

setup_nvim
