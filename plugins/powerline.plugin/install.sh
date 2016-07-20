#!/bin/bash

dnf list installed powerline || run-as-root dnf -y install powerline

# See comments on https://fedoramagazine.org/add-power-terminal-powerline/

mkdir ~/.config/powerline
cat > ~/.config/powerline/config.json <<'EOF'
{
  "ext": {
    "shell": {
      "theme": "default_leftonly"
        }
    }
}
EOF

grep powerline ~/.bashrc || cat >> ~/.bashrc <<'EOF'

# If powerline is installed and the terminal supports it
# (e.g. ttys have problems with Powerline fonts), start it
if command -v powerline-daemon &> /dev/null && [[ $TERM == xterm* ]]; then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    . /usr/share/powerline/bash/powerline.sh
fi
EOF
