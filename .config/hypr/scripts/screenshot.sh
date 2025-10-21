#!/bin/bash

hyprshot -m "${1:-region}" --raw |
  satty --actions-on-enter save-to-clipboard \
    --copy-command 'wl-copy' \
    --early-exit \
    --filename - \
    --fullscreen \
    --output-filename "${HYPRSHOT_DIR:-${XDG_PICTURES_DIR:-$HOME/Downloads}}/screenshot-$(date +'%Y-%m-%d_%H-%M-%S').png"
