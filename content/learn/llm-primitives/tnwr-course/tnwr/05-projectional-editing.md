---
title: Projectional editing — the graph is the program
doc: tnwr design brief
source: https://www.jetbrains.com/mps/concepts/
chapter: 5
priority: 1
project: learn
tags: [study, tnwr, language]
status: todo
---

# 05. Projectional editing

**Load-bearing.** One sentence decides whether tnwr works: *the graph is the
program, and text is a projection of it* — not a view drawn over text code.

- MPS concepts: <https://www.jetbrains.com/mps/concepts/>
- Then two hours in Blender's Geometry Nodes, which is a working example of the
  containment model you want.

You already have Blender and the 1BNA PDB loaded. Use that.

## Check it yourself

- [ ] In Geometry Nodes, build something small using a node group, expose
      three parameters on it, and nest a group inside a group. Write down every
      point where the UI fought you — those are tnwr's requirements.
- [ ] Draw the for-loop twice: once expanded (node, self-edge labelled `+1`,
      guard edge labelled `i > 8`), once collapsed to a single node with
      editable parameters. Two drawings, on paper is fine.
- [ ] Answer in writing: when you edit a node group used in two places, what
      happens to the second? Then state whether that is the behaviour tnwr
      should have, and why.

## The gotcha

> The seductive shortcut is to build a graph *view* over text code — parse the
> source, lay out the AST, let people click nodes. It demos beautifully on a
> for-loop. The mechanism of failure: text code carries information with no
> graph representation (comments, formatting, macros, conditional compilation,
> anything reflective), so the round-trip is lossy the moment programs get
> real. The symptom is that edits made in the graph corrupt the text, or the
> graph silently stops matching. The lever: the graph is stored, hashed and
> authoritative; text is generated from it and never parsed back.

## Notes

## Questions
