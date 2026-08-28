---
title: Project Oberon — how small a complete system can be
doc: tnwr design brief
source: https://www.projectoberon.net/
chapter: 1
priority: 2
project: learn
tags: [study, tnwr, systems]
status: todo
---

# 01. Project Oberon

Wirth & Gutknecht, free PDF at <https://www.projectoberon.net/>

An entire system — kernel, display, editor, compiler, filesystem — in roughly
ten thousand lines. It is the closest thing to the tnwr brief that has ever
shipped, and the source is small enough to read completely.

**Bound: chapters 4 and 5 only.** The viewer system and the text system. About
sixty pages, two evenings.

## Check it yourself

- [ ] After reading ch. 4–5, write `deletions.md`: every feature you expected
      to find and did not. Fewer than ten items means you were reading
      passively — go back.
- [ ] Count the lines in the viewer system from the book's own listings. Write
      the number down, then `wc -l` one source file from a modern compositor
      and put the two numbers side by side.
- [ ] From your deletions list, write six flat statements: three of Wirth's
      deletions you can afford in tnwr v1, three you cannot. No hedging.

## The gotcha

> The compiler and RISC-processor chapters are the trap. They are the most
> intellectually satisfying part of the book and they are irrelevant to you —
> you are not writing a language or a CPU. The symptom is that you finish the
> book feeling educated and have not written a deletion list. The lever: read
> 4 and 5, produce the artefact, and only return to the compiler chapters if a
> specific question sends you there.

## Notes

## Questions
