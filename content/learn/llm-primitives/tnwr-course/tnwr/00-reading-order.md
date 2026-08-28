---
title: tnwr — reading order and why it is in this order
doc: tnwr design brief
project: learn
tags: [study, tnwr, systems]
status: todo
---

# 00. Reading order

Course for building **tnwr** (𒋾𒂟 · التنور) — a display server and system
environment on a Linux kernel that represents everything, all the way down, as
nodes you can walk. Not an OS. A system-hacking-and-exploration interface that
connects silicon to anything.

## The order is by what unlocks what, not by topic

Two lessons are **priority 1** and everything else is downstream of them:

- **04 · sukkal / 9P** — the protocol. Once you know the nine verbs and what a
  per-process namespace is, every other architectural decision in the brief
  follows. Modules-as-processes, network transparency, remote nodes, skins,
  and exportable modules are all one consequence of this.
- **05 · projectional editing** — the graph is the program, text is a
  projection. This is the sentence that decides whether the whole project works
  or is a code-visualiser toy.

Read those two first even though they are numbered fourth and fifth. The
`01`–`03` files are frame-setting and can be read in any gap.

## Then the two slices

- **Slice one, six weeks: ecwatch as the first native node.** Needs 04, 10, 12.
- **Slice two: the device graph.** Needs 08, 09. You have a live problem here —
  four boards that half-work — so these have the fastest payoff of anything in
  the course.
- **Slice three: the sampler graph.** Needs 15.

## Hardware available

| Board | Status |
|---|---|
| Radxa Rock 4D (iris) | **protected** — do not poke registers |
| Orange Pi 5 Max | **protected** |
| NanoPi M1 ×4 | sacrificial — designate one as the explorer |
| Banana Pi M2 Zero ×n | sacrificial |
| ESP32 ×many, ~5 variants | sacrificial, and the peripheral substrate |

Before any register-level work on a sacrificial board, find its **maskrom /
recovery test point**. That is what turns a corrupted boot flash from a bin
into a soldering job.

## What not to read

Each of these is adjacent enough to feel productive and will cost a week.

- The Rust book cover to cover — you are not writing the core.
- The Wayland protocol — you want the DRM layer underneath it.
- XKB — owning libinput means skipping it entirely. Do not learn it to replace it.
- The Unicode standard — you need private use areas and your own glyph tables.
- ECMA-48 and terminal escapes — you are not making a terminal.
- Comparative language surveys — the core language decision is made.

## Notes

## Questions
