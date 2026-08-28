---
title: eBPF — what you can actually watch in a running kernel
doc: tnwr design brief
source: https://www.brendangregg.com/bpf-performance-tools-book.html
chapter: 13
priority: 2
project: learn
tags: [study, tnwr, descent]
status: todo
---

# 13. eBPF

The biggest single unlock in this course. Every syscall, scheduler decision,
page fault and packet — observable live, at low cost, without a reboot. This is
the substrate for "jump down a dimension from any program."

- *BPF Performance Tools*, chapters 1–2 only:
  <https://www.brendangregg.com/bpf-performance-tools-book.html>
- bpftrace one-liner tutorial:
  <https://github.com/bpftrace/bpftrace/blob/master/docs/tutorial_one_liners.md>

**Skip** the 700 pages of per-tool reference. It is a lookup table, not a read.

Read it asking: *what would ecwatch look like if it could see all of this?*

## Check it yourself

- [ ] `bpftrace` one-liner: count syscalls by name for ten seconds on Artemis.
      Paste the output.
- [ ] Trace something you actually want to know: every `open()` by a named
      process, or every process the scheduler moves between cores. Your choice,
      but it has to be a question you had before this lesson.
- [ ] Write the sukkal namespace a bpftrace module would expose. What are the
      nodes? What is readable, what is writable, what is a stream?

## The gotcha

> eBPF programs are verified before load, and the verifier rejects anything it
> cannot prove terminates and stays in bounds. The mechanism is a static
> analysis with a hard instruction-count and complexity ceiling, which varies
> by kernel version. The symptom is a program that is obviously correct and
> refuses to load with an opaque verifier log, on one kernel but not another —
> Artemis is on 6.12, the Rock 4D on a custom 7.0 edge build, so they will not
> agree. The lever: keep probes small and loop-free, check the kernel version
> before blaming the code, and read the verifier log from the bottom up.

## Notes

## Questions
