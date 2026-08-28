---
title: "Rendering: Putting the Error Where You Want It"
doc: The Laplacian Reader
source: library/laplacian-reader.pdf
chapter: 9
priority: 7
project: learn
tags: [study, graph-theory]
status: todo
---

# 9. Rendering: Putting the Error Where You Want It

`laplacian-reader.pdf` — open with `zathura ~/vault/library/laplacian-reader.pdf`

## Check it yourself

The document says these are deliberate and that you should check them.
A chapter is done when its checks pass, not when it has been read.

- [ ] Dither a 50% linear grey field and count the white pixels. It must come out at 50%. Around 73% means you are dithering in gamma space.

## The gotcha

> Dither in linear light, not gamma-encoded values. The output is systematically wrong in midtones while looking correct in pure black and white, which is exactly why it survives casual checking.

## Notes


## Questions

