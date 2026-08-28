---
title: Vim Beginner Cheat Sheet
version: v0.1.0+koan
status: draft
date: 2026-06-29 00:00
modified: 2026-06-29 00:00
lang: en
category: reference
tags:
  - vim
  - cheat-sheet
  - tools
keywords:
  - vim
  - modal editor
  - beginner
  - commands
  - encryption
  - netrw
summary: A beginner reference for vim covering mode switching, saving, navigation, visual selection, file reading, the netrw explorer, and encryption -- with a note on swap-file risk.
---

> Vim opens in NORMAL mode -- every key is a command, not a character. The mental model: NORMAL is home; INSERT lets you type; VISUAL lets you select; COMMAND (`:`) runs an operation. Return to NORMAL with `Esc` at any time -- press twice if unsure of current mode.

## Switching modes

- `i` -- enter INSERT mode before the cursor
- `a` -- enter INSERT mode after the cursor
- `o` -- open a new line below and enter INSERT
- `O` -- open a new line above and enter INSERT
- `Esc` -- return to NORMAL mode from anywhere
- `v` -- enter VISUAL (character-select) mode; move cursor to extend selection
- `V` -- enter VISUAL LINE mode (whole lines)
- `:` -- open the COMMAND-LINE prompt; type a command then `Enter`

## Saving and quitting

- `:w` -- write (save) the file; stays open for editing
- `:wq` -- write then quit (also: `ZZ` in NORMAL mode)
- `:w filename` -- save to a different filename (save-as)
- `:q` -- quit; fails if unsaved changes exist
- `:q!` -- force-quit, discarding all unsaved changes -- irreversible
- `:e!` -- reload file from disk, discarding current edits

## Navigation (NORMAL mode)

- `h j k l` -- left / down / up / right; arrow keys also work
- `w` / `b` -- jump forward / back one word
- `0` / `$` -- start / end of current line
- `gg` / `G` -- first / last line of file
- `:n` -- jump to line n (e.g. `:42`)
- `Ctrl-d` / `Ctrl-u` -- scroll half-page down / up

## Reading files into the buffer

- `:r filename` -- read file and insert its contents below the cursor; useful for pulling in a template or snippet
- `:r !cmd` -- run a shell command and insert its output below the cursor (e.g. `:r !date` inserts today's date)
- `:e filename` -- open a different file in the current window

## File explorer: netrw

Netrw is vim's built-in file browser -- no plugin required.

- `:Lexplore` -- open netrw in a left-side panel; run again to close it (toggle)
- `:Explore` -- open netrw in the full current window
- `Enter` -- open the file or directory under the cursor
- `-` -- go up one directory level
- `gh` -- toggle display of hidden (dot) files

## Visual mode actions

Enter VISUAL with `v` (character-wise) or `V` (line-wise), then extend the selection with any motion key (`h j k l`, `w`, `b`, `$`, `G` ...).

- `y` -- yank (copy) selection
- `d` -- delete (cut) selection
- `p` -- paste yanked or deleted text after the cursor
- `>` / `<` -- indent / de-indent selected lines
- `u` / `U` -- lowercase / uppercase selected text
- `Esc` -- exit VISUAL, return to NORMAL

## Undo and redo

- `u` -- undo last change; repeatable; vim keeps a full change tree
- `Ctrl-r` -- redo (un-undo)

## Search

- `/pattern` -- search forward for pattern; `Enter` to confirm
- `?pattern` -- search backward
- `n` / `N` -- next / previous match
- `:nohlsearch` (short: `:noh`) -- clear search highlight

## Encryption

Vim supports built-in file encryption via the `blowfish2` cipher. Always set the cipher method explicitly before invoking `:X` -- the default `zip` cipher is weak.

- `:set cm=blowfish2` -- set cipher to blowfish2; run this before `:X`
- `:X` -- prompt for a passphrase; encrypts the buffer on the next `:w`
- `:w` -- write the file with encryption active
- `vim -x filename` -- open or create a file with encryption from the shell
- `:set cm=` -- remove encryption from the current session; the next `:w` saves plaintext

> **Swap-file risk.** The `.swp` file vim writes alongside your buffer is *not* encrypted and may contain plaintext. For sensitive files, suppress it: `:set noswapfile` before editing, or open with `vim -n -x filename` (no swap + encrypted) from the shell. For anything genuinely sensitive, consider encrypting the file outside vim with `gpg` or `age` and opening the plaintext only in a no-swap session.

## Mental model -- the modal loop

| Mode | Enter | Purpose | Exit |
|---|---|---|---|
| NORMAL | default / `Esc` | navigate, delete, yank, paste, command entry | -- |
| INSERT | `i` `a` `o` `O` `I` `A` | type and edit characters | `Esc` |
| VISUAL | `v` (char) `V` (line) | select text, then act on it | `Esc` |
| COMMAND | `:` from NORMAL | run `:w`, `:q`, `:r`, `:set` etc. | `Enter` (runs) or `Esc` (cancel) |

`:help keyword` opens vim's built-in documentation for any command or topic.
