#!/bin/bash

rm -rf ~/.config/powerline
# leave ~/.bashrc as is
run-as-root dnf -y remove powerline
