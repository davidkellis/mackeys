# mackeys
This project gives you mac-like key bindings on a Linux desktop environment and is effectively a fork of https://github.com/canadaduane/meta-mac.

The key remapping solution that this project depends on is the excellent https://github.com/rvaiya/keyd.

Assuming you have a standard-ish PC style keyboard in which the keyboard layout looks something like:
```
ctrl | windows key (aka super key) | alt (aka left-alt or lalt) | spacebar | alt (right-alt) | fn | ctrl
```

Thes tool remaps your key bindings into the following virtual keyboard layout:
```
ctrl | alt (aka left-alt or lalt or opt) | cmd | spacebar | alt | fn | windows key (aka super key)
```

Key bindings:
```
| Shortcut                                       | Physical Key Combination | Virtual Key Combination | Emitted Key Combination | Note   
=================================================================================================================================================================================================================================
| app launcher (spotlight search)                | lalt-space               | cmd-space               | super-/                 | Ensure there is a keyboard shortcut in Gnome for Super-/ to "Launch and switch applications"
| cut                                            | lalt-x                   | cmd-x                   | ctrl-x                  |
| copy                                           | lalt-c                   | cmd-c                   | ctrl-c                  |
| paste                                          | lalt-v                   | cmd-v                   | ctrl-v                  |
| move cursor left one word                      | win-left                 | lalt-left               | ctrl-left               |
| move cursor right one word                     | win-right                | lalt-right              | ctrl-right              |
| move cursor to top of file                     | lalt-up                  | cmd-up                  | ctrl-home               |
| move cursor to bottom of file                  | lalt-down                | cmd-down                | ctrl-end                |
| move cursor to beginning of line               | lalt-left                | cmd-left                | home                    |
| move cursor to end of line                     | lalt-right               | cmd-right               | end                     |
| select/highlight one word to the left          | win-shift-left           | lalt-shift-left         | ctrl-shift-left         |
| select/highlight one word to the right         | win-shift-right          | lalt-shift-right        | ctrl-shift-right        |
| delete one word to the left                    | win-backspace            | lalt-backspace          | ctrl-backspace          |
| delete one word to the right                   | win-delete               | lalt-delete             | ctrl-delete             |
| select/highlight to top of file                | lalt-shift-up            | cmd-shift-up            | ctrl-shift-home         |
| select/highlight to bottom of file             | lalt-shift-down          | cmd-shift-down          | ctrl-shift-end          |
| select/highlight to beginning of line          | lalt-shift-left          | cmd-shift-left          | shift-home              |
| select/highlight to end of line                | lalt-shift-right         | cmd-shift-right         | shift-end               |
| delete current line to the left of the cursor  | lalt-backspace           | cmd-backspace           | ctrl-shift-backspace    |
| delete current line to the right of the cursor | lalt-delete              | cmd-delete              | ctrl-shift-delete       |
| navigate back / browser back                   | lalt-[                   | cmd-[                   | alt-left                |
| navigate forward / browser forward             | lalt-]                   | cmd-]                   | alt-right               |
| switch to tab 1                                | lalt-1                   | cmd-1                   | alt-1                   |
| switch to tab 2                                | lalt-2                   | cmd-2                   | alt-2                   |
| ...                                            | ...                      | ...                     | ...                     |
| switch to tab 9 / switch to last tab           | lalt-9                   | cmd-9                   | alt-9                   |
| switch to previous tab                         | lalt-shift-[             | cmd-shift-[             | ctrl-pageup             |
| switch to next tab                             | lalt-shift-]             | cmd-shift-]             | ctrl-pagedown           |
| quit application                               | lalt-q                   | cmd-q                   | super-q                 | Ensure there is a keyboard shortcut in Gnome for Super-q to "Close window"
| maximize window                                | lalt-m                   | cmd-m                   | super-m                 | Ensure there is a keyboard shortcut in Gnome for Super-m to "Toggle maximization state"
| maximize window vertically                     | lalt-pageup              | cmd-pageup              | super-pageup            | Ensure there is a keyboard shortcut in Gnome for "Super-Page Up" to "Maximize window vertically"
| minimize window to dock                        | lalt-pagedown            | cmd-pagedown            | super-pagedown          | Ensure there is a keyboard shortcut in Gnome for "Super-Page Down" to "Hide window"
| switch applications                            | lalt-tab                 | cmd-tab                 | super-tab               | Ensure there is a keyboard shortcut in Gnome for Super-Tab to trigger "Switch applications"
| cycle windows of current application           | lalt-`                   | cmd-`                   | super-`                 | Ensure there is a keyboard shortcut in Gnome for Super-` to "Switch windows of an application"
| lock screen                                    | lalt-esc                 | cmd-esc                 | super-esc               | Ensure there is a keyboard shortcut in Gnome for Super-Escape to "Lock screen"
| See Note #1                                    | win                      | lalt                    | none                    |
```

Note #1: An isolated keypress of the virtual left-alt key (physical windows key) is ignored so that the default Gnome behavior of moving focus to the File menu is not triggered.

# Install

1. Clone this repo
2. Run `./install.sh`
3. Edit `/etc/keyd/default.conf`, changing the `[ids]` field in lines 7-9 to identifiers that reference your keyboard(s).
   1. To identify your keyboard's identifier(s), run `sudo keyd -m` and press any key.
      ```bash
      ❯ sudo keyd -m
      device added: 046d:b023 (Logitech Wireless Mouse MX Master 3)
      device added: 046d:b35b (MX Keys Mouse)
      device added: 046d:b35b (MX Keys Keyboard)
      device added: 04f3:30d8 (PNP0C50:01 04F3:30D8 Touchpad)
      device added: 04f3:30d8 (PNP0C50:01 04F3:30D8 Mouse)
      device added: 1044:7a3f (GIGABYTE USB-HID Keyboard)
      device added: 1044:7a3f (GIGABYTE USB-HID Keyboard Mouse)
      device added: 046d:408a (Logitech MX Keys)
      device added: 1044:7a3f (GIGABYTE USB-HID Keyboard)
      device added: 046d:4082 (Logitech MX Master 3)
      device added: 046d:4090 (Logitech MX Anywhere 3)
      device added: 0001:0001 (AT Translated Set 2 keyboard)
      MX Keys Keyboard        046d:b35b       a down
      MX Keys Keyboard        046d:b35b       a up
      ```
   2. Note the identifier associated with each keyboard that you want to have mac-like key bindings.
      In my case, `046d:b35b` and `1044:7a3f` are the two keyboards that I want to have mac-like key bindings.
   3. Replace the `[ids]` section in the `default.conf` file with your keyboard identifiers. In my case, it looks like this:
      ```
      [ids]
      # *
      046d:b35b
      1044:7a3f
      ```
   4. Save the changes you make to `/etc/keyd/default.conf`.
4. Run `sudo systemctl restart keyd`
5. Done
