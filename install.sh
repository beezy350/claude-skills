#!/usr/bin/env bash
# Installs these skills and the routing rules for every project.
set -euo pipefail
SRC="$(cd "$(dirname "$0")" && pwd)"
mkdir -p "$HOME/.claude/skills"
cp -r "$SRC/skills/." "$HOME/.claude/skills/"
# Append routing rules to the personal CLAUDE.md once.
if ! grep -q "# Default skill routing" "$HOME/.claude/CLAUDE.md" 2>/dev/null; then
  cat "$SRC/CLAUDE.md" >> "$HOME/.claude/CLAUDE.md"
fi
echo "Installed $(ls "$SRC/skills" | wc -l) skills to ~/.claude/skills"
