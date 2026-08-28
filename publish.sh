#!/usr/bin/env bash
# publish.sh — mirror ~/vault into this Quartz repo's content/ and push.
# content/ is a plain committed copy, not a symlink, because the GitHub
# Actions build runs on a machine that has never heard of ~/vault — a
# symlink to an absolute host path builds fine locally and breaks in CI.
# Run this whenever you want the live site to catch up with the vault.
set -euo pipefail
cd "$(dirname "$0")"

rsync -a --delete \
  --exclude='.obsidian/' \
  --exclude='.templates/' \
  --exclude='.git/' \
  ~/vault/ content/

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
