#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
tmux set-option -ag window-layout-changed "run-shell $CURRENT_DIR/scripts/update_borders.sh"
