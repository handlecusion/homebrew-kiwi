#!/usr/bin/env bash
# Bump the llmwiki formula to a new release tag.
# Usage: scripts/release-bump.sh 0.0.4
# Assumes the tag v<version> already exists on handlecusion/llmwiki.
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "usage: $0 <version>   (e.g. $0 0.0.4)" >&2
  exit 1
fi

version="$1"
version="${version#v}" # accept both 0.0.4 and v0.0.4

repo_root="$(cd "$(dirname "$0")/.." && pwd)"
formula="$repo_root/Formula/llmwiki.rb"

sed -i '' \
  -e "s|tag: \"v[0-9][0-9.]*\"|tag: \"v${version}\"|" \
  -e "s|^  version \"[0-9][0-9.]*\"|  version \"${version}\"|" \
  "$formula"

git -C "$repo_root" add Formula/llmwiki.rb
git -C "$repo_root" commit -m "llmwiki ${version}"

echo "Bumped formula to v${version} and committed. Push with: git -C $repo_root push"
