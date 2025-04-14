# tmux-border-path

Display the current path in the panes border.

## installation

to install using tpm: add the following to the list of tpm plugins in your tmux.conf:

```bash
set -g @plugin 'elksim/tmux-border-path
```

and also add the following to your ~/.bashrc file (warning: this will run update_border.sh on every command entered so that if we change directory in any way we update the pane-border-format. I'm not aware of a better way to do this.)

```bash
if [[ -n "$TMUX" ]]; then
    if [[ "$PROMPT_COMMAND" != *"$HOME/.config/tmux/plugins/tmux-border-path/scripts/update_border.sh"* ]]; then
        PROMPT_COMMAND="${PROMPT_COMMAND%;}"
        PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND;}$HOME/.config/tmux/plugins/tmux-border-path/scripts/update_border.sh"
    fi
fi
```

(if in tmux environment, if script is not in prompt command strip a trailing semicolon, add a semicolon if prompt_command is non-empty, then append our script)

## todos

- enable customisation of what gets displayed.
- early abort update_border and update_borders if they won't change pane-border-format.
- try make sure this works with various settings.

### to-maybe-do

- an init script so adding update_border.sh to PROMPT_COMMAND is automated.
