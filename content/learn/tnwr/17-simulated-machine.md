---
title: A machine you can actually watch
doc: tnwr design brief
source: https://www.nand2tetris.org/
chapter: 17
priority: 7
project: learn
tags: [study, tnwr, descent]
status: todo
---

# 17. A simulated machine

Last, and the longest. Pick one:

- Nand2Tetris projects 1–5: <https://www.nand2tetris.org/>
- Ben Eater's 8-bit CPU series: <https://eater.net/8bit>

This is for the **simulated** machine node, not your real CPU. If you want a
dimension where someone watches registers fill and an ALU add, it has to be
simulated — lesson 14 establishes why.

## Check it yourself

- [ ] Build the ALU (Nand2Tetris project 2). It passes the supplied test script
      or it does not.
- [ ] Build the CPU (project 5). Same test.
- [ ] Write one paragraph stating how the simulated-machine node differs from
      the live-hardware node in tnwr, and what the user sees that makes the
      difference obvious without being told.

## The gotcha

> Conflating the simulated machine with the live hardware is the failure mode,
> and it is a design failure rather than a technical one. The mechanism: both
> render as registers and buses, so they look identical, but one is ground
> truth and the other is a model that is *wrong about your actual silicon* in
> ways nothing on screen indicates. The symptom is someone reasoning about a
> real timing bug from the simulator's behaviour. The lever: they are different
> nodes with visibly different projections, and the simulated one says so.

## The stopping point

> Skip Nand2Tetris chapters 9 onward — the compiler and OS projects. Different
> course, different decade.

## Notes

## Questions
