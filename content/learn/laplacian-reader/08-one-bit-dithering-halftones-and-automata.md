---
title: "One Bit: Dithering, Halftones and Automata"
doc: The Laplacian Reader
source: library/laplacian-reader.pdf
chapter: 8
priority: 6
project: learn
tags: [study, graph-theory]
status: todo
---

# 8. One Bit: Dithering, Halftones and Automata

`laplacian-reader.pdf` — open with `zathura ~/vault/library/laplacian-reader.pdf`

## Check it yourself

The document says these are deliberate and that you should check them.
A chapter is done when its checks pass, not when it has been read.

- [ ] Compute abs(out - img).mean() for threshold, white noise, Bayer and Floyd-Steinberg. Total error should be close across all four while the spectra differ by orders of magnitude in the visible band. Nothing is removed; it is moved.

## The gotcha

> Reaction-diffusion is stiff. For forward Euler the constraint is dt < h^2 / (4 * Dmax), and the faster-diffusing species dictates the timestep for the whole system. Exceed it and the field goes to NaN within a few dozen steps, usually after appearing to work. If it blows up, check the timestep before touching the chemistry.

## Notes


## Questions

