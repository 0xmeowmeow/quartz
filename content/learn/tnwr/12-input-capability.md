---
title: Input as capability, not as device
doc: tnwr design brief
source: https://wayland.freedesktop.org/libinput/doc/latest/
chapter: 12
priority: 2
project: learn
tags: [study, tnwr, input, slice-one]
status: todo
---

# 12. Input as capability

Owning libinput means raw evdev keycodes and axes — no XKB, no IME framework.
Input is the worst-designed layer in Linux and you get to skip it.

A device is a module announcing a namespace of axes:

```
/in/wacom/axes/{x, y, pressure, tilt_x, tilt_y}
/in/chopstick/axes/{x, y, contact}
/in/guitar/strings/3/{bend, pressure, fret}
```

The composer binds what exists. The precedent is **OSC**, which has done
exactly this in music rigs for twenty-five years:
<https://opensoundcontrol.stanford.edu/>

- libinput: <https://wayland.freedesktop.org/libinput/doc/latest/>
- libseat: <https://git.sr.ht/~kennylevinsen/seatd>
- evdev tablet axes: `Documentation/input/event-codes.rst`
- MPE for the guitar path: <https://midi.org/mpe-midi-polyphonic-expression>

The mental model you already own: this is QMK layers, in software, for the
whole machine.

## Check it yourself

- [ ] `libinput debug-events` — capture the raw stream from the Corne, the
      touchpad, and one more device. Save three logs. Note which axes each one
      actually reports versus what you assumed.
- [ ] Write the `/in/<dev>/axes/` capability list for each of those three
      devices, in node form.
- [ ] Build one ESP32 that reports two analog axes and write its capability
      list in the same form. Confirm the composer would bind it with no
      device-specific code.

## The gotcha

> A user-editable keymap on a system that owns input at the libinput layer can
> lock you out of your own running machine, with no way to type your way back.
> The mechanism is that there is no fallback layer — you replaced the one the
> kernel would have provided. The symptom is that it never happens until the
> first time you edit a keymap live, which is precisely the feature you want.
> The lever is structural, not attentional: an escape chord burned into the
> core that no user keymap can shadow, plus the libseat VT switch permanently
> reserved, plus numbered config generations. This must exist **before** the
> first remap is possible — retrofitted, the first person to brick their layout
> is you.

## Notes

## Questions
