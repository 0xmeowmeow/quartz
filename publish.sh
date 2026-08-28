#!/usr/bin/env bash
# publish.sh — mirror the garden vault into this Quartz repo's content/ and
# push. content/ is a plain committed copy, not a symlink, because the
# GitHub Actions build runs on a machine that has never heard of this vault
# — a symlink to an absolute host path builds fine locally and breaks in
# CI. Run this whenever you want the live site to catch up with the vault.
#
# The garden vault (~/obsidian-vaults/garden) is kept deliberately separate
# from every other vault on this machine — it's the one thing on this
# machine that's meant to be public, so nothing lands on the live site by
# accident just because it happened to be in the wrong folder.
set -euo pipefail
cd "$(dirname "$0")"

rsync -a --delete \
  --exclude='.obsidian/' \
  --exclude='.templates/' \
  --exclude='.git/' \
  ~/obsidian-vaults/garden/ content/

if git diff --quiet && git diff --cached --quiet; then
  echo "nothing changed since last publish"
  exit 0
fi

git add -A
git commit -m "sync notes $(date +%Y-%m-%d\ %H:%M)"
git push

echo
echo "pushed — https://github.com/0xmeowmeow/quartz/actions to watch the deploy"
echo "site: https://0xmeowmeow.github.io/quartz/"
