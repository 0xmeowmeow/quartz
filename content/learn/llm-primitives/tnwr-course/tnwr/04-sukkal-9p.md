---
title: sukkal — the 9P protocol and the per-process namespace
doc: tnwr design brief
source: https://9p.io/sys/man/5/INDEX.html
chapter: 4
priority: 1
project: learn
tags: [study, tnwr, protocol]
status: todo
---

# 04. sukkal — 9P

**Load-bearing. Read this first.** Everything else in the brief is a
consequence of it.

Five man pages, about twenty minutes: `intro(5)`, `attach(5)`, `walk(5)`,
`open(5)`, `read(5)` — <https://9p.io/sys/man/5/INDEX.html>

Then the overview paper, *Plan 9 from Bell Labs*:
<https://9p.io/sys/doc/9.html>

Nine verbs is the whole protocol. Two things to come away with: why network
transparency costs nothing extra, and what a **namespace** is — the fact that
it is per-process is the mechanism behind skins, remote nodes, and exportable
modules.

Linux already speaks it: `v9fs` is in-tree, and QEMU's `-virtfs` /
`diod` / `u9fs` will give you a server in minutes.

## Check it yourself

- [ ] List the nine verbs from memory, no notes. Nine.
- [ ] Get a 9P mount working end to end: run a server (`diod`, or QEMU
      `-virtfs`), `mount -t 9p`, read a file across it. Under thirty minutes
      or you are using the wrong server.
- [ ] Write the sukkal namespace for ecwatch — every EC register as a path,
      one page. This is the actual design artefact for slice one, not an
      exercise.

## The gotcha

> 9P is synchronous and per-message, so it is latency-bound. If every EC
> register is its own file and you poll at 60 Hz, that is thousands of
> walk/open/read round trips per second. The symptom is that the graph stutters
> and CPU sits in the server rather than the renderer, and it looks like a
> rendering problem. The lever: expose an aggregate node (`/ec/all`) that
> returns the whole register block in one read, and make the per-register files
> the drill-down path, not the polling path. Plan 9 solved this with
> directory-level reads — do the same.

## Notes

## Questions
