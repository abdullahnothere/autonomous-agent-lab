#!/usr/bin/env bash
# Checks each .claude/agents/*.md file starts with YAML frontmatter containing
# a `name` that matches the filename and a non-empty `description`.
set -euo pipefail

dir="${1:-.claude/agents}"
status=0
shopt -s nullglob
files=("$dir"/*.md)

if [ ${#files[@]} -eq 0 ]; then
  echo "error: no agent files found in $dir" >&2
  exit 1
fi

for f in "${files[@]}"; do
  expected="$(basename "$f" .md)"
  if [ "$(head -n1 "$f")" != "---" ]; then
    echo "FAIL $f: missing opening frontmatter '---'" >&2; status=1; continue
  fi
  front="$(awk 'NR==1{next} /^---$/{exit} {print}' "$f")"
  if ! awk 'NR>1 && /^---$/{found=1; exit} END{exit !found}' "$f"; then
    echo "FAIL $f: missing closing frontmatter '---'" >&2; status=1; continue
  fi
  name="$(printf '%s\n' "$front" | sed -n 's/^name:[[:space:]]*//p' | head -n1)"
  desc="$(printf '%s\n' "$front" | sed -n 's/^description:[[:space:]]*//p' | head -n1)"
  if [ "$name" != "$expected" ]; then
    echo "FAIL $f: name '$name' does not match filename '$expected'" >&2; status=1
  elif [ -z "$desc" ]; then
    echo "FAIL $f: description is empty" >&2; status=1
  else
    echo "ok   $f"
  fi
done

exit $status
