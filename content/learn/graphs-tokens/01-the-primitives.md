---
title: The Primitives
doc: Graphs, Tokens, and the Machinery
source: library/Graphs__Tokens__and_the_Machinery.pdf
chapter: 1
priority: 1
project: learn
tags: [study, graph-theory]
diagram: scc-trap
status: reading
---

# 1. The Primitives

`Graphs__Tokens__and_the_Machinery.pdf` — open with `zathura ~/vault/library/Graphs__Tokens__and_the_Machinery.pdf`

## Check it yourself

The document says these are deliberate and that you should check them.
A chapter is done when its checks pass, not when it has been read.

- [ ] Prove it: in a finite graph where every node has out-degree >= 1, there must be a cycle. (Start anywhere and keep walking; you can never stop; there are finitely many nodes.) This is the pigeonhole principle and it is why loom's dead-end check is sufficient.
- [ ] Implement SCC detection (Tarjan or Kosaraju) on a loom graph. About 40 lines, and it gives trap-detection for free.
- [ ] Implement articulation points. Now 'load-bearing' is computed rather than argued.

## Notes


## Questions

