---
title: perf and the PMU — where the descent floor actually is
doc: tnwr design brief
source: https://www.brendangregg.com/perf.html
chapter: 14
priority: 4
project: learn
tags: [study, tnwr, descent]
status: todo
---

# 14. perf and the PMU

<https://www.brendangregg.com/perf.html>

The point of this lesson is to find the honest boundary before designing the
descent. Cache misses, branch mispredicts and IPC per core are real, live and
yours. Cycle-by-cycle instruction flow through your actual silicon is not.

## Check it yourself

- [ ] `perf stat` a real workload on Artemis. Record IPC and cache-miss rate.
- [ ] The same workload on the Rock 4D. Put the two sets of numbers side by
      side — ARM PMU events are named differently and some do not exist. Note
      which ones are missing.
- [ ] Write the shortest honest answer to: *what can I see live in my CPU, and
      what can I not?* Under a hundred words. That paragraph becomes the design
      constraint for the live-hardware descent node.

## The gotcha

> Intel PT and ARM CoreSight look like they give you instruction-level
> visibility, and the descent design will be tempted to promise it. The
> mechanism: they are trace buffers that record branch decisions and are
> decoded offline against the binary, at gigabytes per second of trace data —
> they are not a live view and cannot be one. The symptom is a design that
> promises a live instruction dimension and delivers a post-hoc replay. The
> lever: make the live-hardware node honest about its sample rate, and put
> anything genuinely cycle-accurate in the *simulated machine* node instead
> (lesson 17).

## Notes

## Questions
