---
title: Acme — a complete interface with no command language
doc: tnwr design brief
source: https://9p.io/sys/doc/acme.html
chapter: 2
priority: 4
project: learn
tags: [study, tnwr, interface]
status: todo
---

# 02. Acme

Rob Pike, about fifteen pages: <https://9p.io/sys/doc/acme.html>

Acme has no menus, no modes, no configuration file and no keyboard shortcuts.
It is entirely mouse-driven — the exact inverse of what tnwr wants. The
question is what makes it *complete* anyway. The answer is that every piece of
text on screen is executable.

Available on Debian via `plan9port` (`apt install plan9-9front` or build
plan9port from <https://github.com/9fans/plan9port>).

## Check it yourself

- [ ] Install plan9port and use acme for one real hour — edit a file, run a
      command from the text, plumb a filename. Note every moment you reached
      for a key that did not exist.
- [ ] Write the keyboard-native equivalent of acme's three mouse buttons: one
      sentence each. If button 3 (plumb / open the thing under the cursor)
      cannot be done from a keyboard without ambiguity, you have found a real
      design gap in tnwr — write it down as such.

## The gotcha

> The temptation is to copy acme's modelessness literally. Acme gets away with
> having no modes because the mouse supplies a second, orthogonal input
> channel — chording buttons is a mode you hold rather than enter. A keyboard
> has no equivalent unless you build one. The symptom is a keyboard acme that
> needs a prefix key for everything and feels like Emacs. The lever: your
> second channel is the other hand, and it has to be designed in from the
> start, not added when the first collision appears.

## Notes

## Questions
