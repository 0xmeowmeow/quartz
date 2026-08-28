---
title: "Language Models: What the Data Actually Is"
doc: The Laplacian Reader
source: library/laplacian-reader.pdf
chapter: 4
priority: 4
project: learn
tags: [study, graph-theory]
status: todo
---

# 4. Language Models: What the Data Actually Is

`laplacian-reader.pdf` — open with `zathura ~/vault/library/laplacian-reader.pdf`

## Check it yourself

The document says these are deliberate and that you should check them.
A chapter is done when its checks pass, not when it has been read.

- [ ] Confirm sinusoidal positional encodings are the path-graph Laplacian eigenvectors: eigendecompose a path graph and plot the first four.

## The gotcha

> Laplacian eigenvector positional encodings carry a sign and basis ambiguity sinusoids do not. Train naively and the model overfits whichever signs eigh happened to return. Fixes: random sign flipping, SignNet/BasisNet, or random-walk encodings that never pick a basis.

## Notes


## Questions

