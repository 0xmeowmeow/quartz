---
title: "The Laplacian: Graphs as Discrete Manifolds"
doc: The Laplacian Reader
source: library/laplacian-reader.pdf
chapter: 2
priority: 1
project: learn
tags: [study, graph-theory]
diagram: ring-heat
status: todo
---

# 2. The Laplacian: Graphs as Discrete Manifolds

`laplacian-reader.pdf` — open with `zathura ~/vault/library/laplacian-reader.pdf`

## Check it yourself

The document says these are deliberate and that you should check them.
A chapter is done when its checks pass, not when it has been read.

- [ ] Build L = B^T B for the 5-cycle-plus-chord by hand; confirm every row sums to zero and exactly one eigenvalue is zero.
- [ ] Integrate u' = -Lu on a 16-cycle from an impulse. Watch it homogenise. That is oversmoothing.

## The gotcha

> Deep GNNs oversmooth because the heat equation is working correctly, not because the architecture is broken. Mitigations are numerical-PDE technique: residuals add a source term, smaller effective dt, or run the wave equation instead since it conserves energy.

## Notes


## Questions

