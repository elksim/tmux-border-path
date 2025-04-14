#!/usr/bin/env bash

tmux set-option -ag window-layout-changed "run-shell $CURRENT_DIR/scripts/update_borders.sh"
