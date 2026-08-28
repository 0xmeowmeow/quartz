---
title: wgpu — one GPU code path from x86 to ARM
doc: tnwr design brief
source: https://sotrh.github.io/learn-wgpu/
chapter: 11
priority: 3
project: learn
tags: [study, tnwr, display]
status: todo
---

# 11. wgpu

<https://sotrh.github.io/learn-wgpu/> — chapters 1 to 4. Stop when a triangle
appears.

wgpu compiles to Vulkan, GL and GLES from one source, which is why the core is
Rust: Artemis, the Rock 4D, a Pi and a cyberdeck all run the same code. You are
reading enough to understand the core's rendering, not to write it.

## Check it yourself

- [ ] Get the triangle on screen in a window under Hyprland.
- [ ] Change the fragment shader so the triangle's colour is a function of
      screen position. Screenshot it. That is the "per-cell shader" claim in
      the brief, proven at the smallest scale.
- [ ] Run the same binary on the Rock 4D over the GLES backend. If it fails,
      record exactly where — that boundary is your ARM portability floor.

## The gotcha

> The wgpu API is the same across backends; the *capabilities* are not. Mali
> and other embedded GPUs expose smaller limits — fewer bind groups, smaller
> workgroups, no timestamp queries, storage-texture format gaps. The mechanism
> is that wgpu reports these through adapter limits rather than refusing at
> compile time, so code that works on the RTX 3080 fails at pipeline creation
> on the Rock 4D. The symptom is a validation error on ARM only, months after
> the code was written. The lever: query and assert against `downlevel_defaults`
> early, and test on the Rock 4D before a rendering decision becomes load-bearing.

## Notes

## Questions
