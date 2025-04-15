# tmux-border-path

Display the current path in the panes border.

[Demo](https://github.com/user-attachments/assets/4a098e10-8f7b-47ae-aeef-325b77cee7d7)

## installation

1

manual: copy update_border.sh and update_borders.sh then add to your tmux.conf:

```bash
tmux set-option -ag window-layout-changed "run-shell path/to/update_borders.sh"
```

with tpm: add the following to the list of tpm plugins in your tmux.conf  

```bash
set -g @plugin 'elksim/tmux-border-path
```

2

Add the following to your ~/.bashrc file (this will run update_border.sh on every command entered so that if we change directory in any way we update the pane-border-format. I'm not aware of a better way to do this.)

```bash
if [[ -n "$TMUX" ]]; then
    UPDATE_BORDER_PATH="$HOME/.config/tmux/plugins/tmux-border-path/scripts/update_border.sh"
    if [[ "$PROMPT_COMMAND" != *"$UPDATE_BORDER_PATH"* ]]; then
        PROMPT_COMMAND="${PROMPT_COMMAND%;}"
        PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND;}\"$UPDATE_BORDER_PATH\""
    fi
fi
```

description (because bash syntax is wack): if in tmux environment, if script is not in prompt command, strip a trailing semicolon, add a semicolon if prompt_command is non-empty, then append our script.

## todos

- enable customisation of what gets displayed.
- early abort update_border and update_borders if they won't change pane-border-format.
- make it work with ssh?
- try make sure this works with various settings.. actually, best approach is probably to implement a format hook {#current_path} to use in format strings rather than overriding the entire pane-border-format string..

### to-maybe-do

- an init script so adding update_border.sh to PROMPT_COMMAND is automated.
