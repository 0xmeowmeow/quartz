---
title: "Fourier: The Eigenbasis of the Laplacian"
doc: The Laplacian Reader
source: library/laplacian-reader.pdf
chapter: 3
priority: 2
project: learn
tags: [study, graph-theory]
status: todo
---

# 3. Fourier: The Eigenbasis of the Laplacian

`laplacian-reader.pdf` — open with `zathura ~/vault/library/laplacian-reader.pdf`

## Check it yourself

The document says these are deliberate and that you should check them.
A chapter is done when its checks pass, not when it has been read.

- [ ] Six lines of numpy: build the ring Laplacian, compare sort(eigvalsh(L)) against 2 - 2cos(2*pi*k/n).
- [ ] Confirm polynomial order equals hop radius: check that (L^k)_ij is zero whenever i and j are more than k hops apart.

## The gotcha

> On a ring every non-zero eigenvalue has multiplicity two, so a naive index-by-index comparison reports a huge error and looks like a refutation. It is the degeneracy. This was a real error in the document's own first draft, caught only because the number was printed rather than assumed.

## Notes


## Questions

