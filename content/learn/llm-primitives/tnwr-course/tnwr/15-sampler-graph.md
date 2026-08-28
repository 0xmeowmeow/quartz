---
title: The sampler graph — ComfyUI at the layer nobody exposed
doc: tnwr design brief
source: https://huggingface.co/docs/transformers/en/internal/generation_utils
chapter: 15
priority: 3
project: learn
tags: [study, tnwr, llm, slice-three]
status: todo
---

# 15. The sampler graph

ComfyUI works because diffusion sampling is dataflow with a type system —
MODEL, CLIP, CONDITIONING, LATENT, IMAGE — so you cannot plug the wrong thing
in, and every box in the paper is a box on the canvas.

Everyone building "ComfyUI for text" pointed at **agent orchestration**, which
is control flow, and a control-flow graph is just code drawn badly. That is why
LangFlow, Flowise and the rest feel wrong, and why ComfyUI's own LLM support is
a single opaque wrapper node.

The dataflow layer in text is one dimension *down*: inside the sampler and
inside the model.

- transformers `LogitsProcessor`:
  <https://huggingface.co/docs/transformers/en/internal/generation_utils>
- llama.cpp sampler chain: `common/sampling.cpp` in
  <https://github.com/ggerganov/llama.cpp>
- Representation engineering / control vectors:
  <https://arxiv.org/abs/2310.01405>

## Check it yourself

- [ ] Read llama.cpp's sampler chain and list every sampler as a node with its
      input and output types. Temperature, top-k, top-p, min-p, repetition
      penalty, grammar. What type flows on the wire between them?
- [ ] Write a custom `LogitsProcessor` in transformers that does something
      visibly wrong on purpose — ban a token, or force a specific token at
      position N. Show the before and after output.
- [ ] Draw the RAG-over-Obsidian pipeline as typed nodes: load → chunk → embed
      → index → retrieve → rerank → assemble. Name every type on every edge.
      If any edge has no nameable type, that step is control flow in disguise.

## The gotcha

> The trap is that agent orchestration *looks* like the obvious thing to graph,
> because that is where the interesting behaviour appears to live. The
> mechanism: orchestration is loops, branches, retries and conditionals — it is
> Turing-complete control flow, and drawing control flow as boxes and wires
> gives you a flowchart, which is strictly worse than code at every scale above
> a toy. The symptom is a graph UI that needs loop nodes, condition nodes and
> variable nodes, at which point you have reinvented Scratch. The lever: graph
> only the acyclic typed dataflow — the sampler chain, the RAG pipeline, layer
> interventions — and let control flow stay as code inside a node.

## Notes

## Questions
