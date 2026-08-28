---
title: Identity — personas, derivation, and the correlation surface
doc: tnwr design brief
source: https://github.com/nostr-protocol/nips/blob/master/01.md
chapter: 16
priority: 6
project: learn
tags: [study, tnwr, identity, privacy]
status: todo
---

# 16. Identity

Everything in the brief is right; OpenPGP is the wrong primitive. The web of
trust is an explicitly *public* social graph of who signed whose key — the
exact structure being escaped — with no native subordinate identities and no
selective disclosure.

- Nostr NIP-01, about ten pages:
  <https://github.com/nostr-protocol/nips/blob/master/01.md>
- BIP32 hierarchical deterministic derivation:
  <https://github.com/bitcoin/bips/blob/master/bip-0032.mediawiki>
- Ring signatures (the Monero property):
  <https://en.wikipedia.org/wiki/Ring_signature>
- Adversarial stylometry:
  <https://en.wikipedia.org/wiki/Stylometry#Adversarial_stylometry>

Ed25519 keys · HD derivation for unlimited personas · ring signatures for
"a member of this set signed this" · an append-only signed event log per
persona as the character sheet, where deletion is a tombstone.

## Check it yourself

- [ ] Derive three child keys from one seed with any BIP32 library. Show that
      the three public keys reveal nothing about each other or the parent.
      Paste the keys.
- [ ] Read NIP-01 and write the event structure from memory — every field.
- [ ] Sign one event from two personas, then list every correlation vector
      between them you can find: timing, relay, phrasing, topic, client
      version. Aim for six. That list is the spec for the correlation-surface
      display.

## The gotcha

> Unlinkability is behavioural, not cryptographic, and it is irreversible. The
> mechanism: the maths gives you independent keys, but correlation comes from
> timing, relay choice, writing style, topic overlap and interaction pattern —
> none of which the keys protect. The symptom is that nothing appears wrong
> until two personas are linked, and at that moment they can never be unlinked,
> retroactively, for every message either ever sent. The lever: show the leak
> surface rather than claiming safety — which relays a persona has touched, its
> activity relative to your others, what it shares with them. A persona should
> carry a *style*, not just a key.

## Notes

## Questions
