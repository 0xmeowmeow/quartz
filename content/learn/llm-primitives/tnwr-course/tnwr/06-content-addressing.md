---
title: Content addressing — a module is the hash of its own structure
doc: tnwr design brief
source: https://www.unison-lang.org/docs/the-big-idea/
chapter: 6
priority: 3
project: learn
tags: [study, tnwr, identity]
status: todo
---

# 06. Content addressing

- Unison, "the big idea": <https://www.unison-lang.org/docs/the-big-idea/>
- Git internals, Pro Git ch. 10: <https://git-scm.com/book/en/v2/Git-Internals-Git-Objects>
- IPFS Merkle DAG concept: <https://docs.ipfs.tech/concepts/merkle-dag/>

Code identified by the hash of its structure rather than its name. This is the
brief's rule — *edit a module and it becomes a new module, and that
propagates* — already formalised, with dependency breakage already solved. It
is also the honest version of what "blockchain" was wanted for, minus consensus.

**Do not install Unison.** One doc page.

## Check it yourself

- [ ] Six lines of Python: parse a small function with `ast`, normalise
      variable names, hash it. Show that renaming a local changes nothing and
      renaming the function changes nothing, but changing an operator changes
      the hash.
- [ ] In `git`, create a blob with `git hash-object`, then create the same
      content in a different filename and confirm the hash is identical. Paste
      both commands and both hashes into the note.

## The gotcha

> Content addressing gives you no deletion, ever. A published, signed module is
> permanent and unretractable by construction — that is the same property that
> makes it trustworthy. The symptom does not appear at build time; it appears
> the first time someone publishes a persona's character sheet containing
> something they wanted back, or a credential lands in a module and is now
> immortal. The lever: tombstones change the *current projection* only, never
> the history; and nothing secret ever enters a content-addressed store. Decide
> this before the first thing is published, because after that it is not a
> decision any more.

## Notes

## Questions
