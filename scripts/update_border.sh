#!/usr/bin/env bash

pane_info=$(tmux display-message -p "#{pane_index} #{pane_current_path} #{pane_width}")
read -r pane_index pane_current_path pane_width <<< "$pane_info"

## Build pane_border_format
pane_border_format_max_len=$((pane_width - 4))
prefix="${pane_index}: "
prefix_len=${#prefix}
if (( pane_border_format_max_len <= prefix_len )); then
    # max len too short to display any path so only display the index
    pane_border_format="$prefix"
else
    display_path_max_len=$((pane_border_format_max_len - prefix_len))
    path_len=${#pane_current_path}
    if (( path_len <= display_path_max_len )); then
        #simply display the entire path
        display_path="#[bold]${pane_current_path}#[default]"
    else
        # we cannot display the entire path - display as much as possible, prioritizing the end. Also, dot leading 3 characters.
        part1_len=$(( display_path_max_len > prefix_len ? prefix_len : display_path_max_len ))
        part1_start_index=$((path_len - display_path_max_len))
        part1=${pane_current_path:$part1_start_index:$part1_len}

        part2_start_index=$((part1_start_index + part1_len))
        part2=${pane_current_path:$part2_start_index}

        display_path="#[dotted-underscore]${part1}#[default]#[bold]${part2}#[default]"
    fi
    pane_border_format="${prefix}${display_path}"
fi

# Apply pane_border_format to the current pane
tmux set-option -p pane-border-format "$pane_border_format"

