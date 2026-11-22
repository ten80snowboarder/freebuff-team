#!/usr/bin/env bash
set -euo pipefail

# Automatically resolve the folder where deploy.sh lives (e.g. ~/freebuff-team)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
AGENTS_SRC="$SCRIPT_DIR/agents"
TARGET_DIR="$(pwd)"

# Prevent accidentally running deploy.sh inside the template repo itself
if [ "$TARGET_DIR" = "$SCRIPT_DIR" ]; then
  echo "Error: You are inside $SCRIPT_DIR."
  echo "cd into your target project directory first, then run:"
  echo "  $SCRIPT_DIR/deploy.sh"
  exit 1
fi

echo "Deploying Freebuff agent team to: $TARGET_DIR"

# 1. Copy the 6 agent definitions without overwriting existing files (-n)
mkdir -p "$TARGET_DIR/.agents"
cp -rn "$AGENTS_SRC/"* "$TARGET_DIR/.agents/"
echo "✓ Copied agent files into .agents/"

# 2. Add FOLLOWUPS.md only if it doesn't already exist
if [ ! -f "$TARGET_DIR/FOLLOWUPS.md" ]; then
  cp "$SCRIPT_DIR/FOLLOWUPS.md" "$TARGET_DIR/FOLLOWUPS.md"
  echo "✓ Created FOLLOWUPS.md"
else
  echo "• Kept existing FOLLOWUPS.md"
fi

# 3. Create AGENTS.md or safely append the org chart if not already present
if [ ! -f "$TARGET_DIR/AGENTS.md" ]; then
  cp "$SCRIPT_DIR/AGENTS-SNIPPET.md" "$TARGET_DIR/AGENTS.md"
  echo "✓ Created AGENTS.md"
elif ! grep -q "Custom Agent Team" "$TARGET_DIR/AGENTS.md"; then
  printf "\n\n" >> "$TARGET_DIR/AGENTS.md"
  cat "$SCRIPT_DIR/AGENTS-SNIPPET.md" >> "$TARGET_DIR/AGENTS.md"
  echo "✓ Appended Custom Agent Team section to existing AGENTS.md"
else
  echo "• AGENTS.md already includes Custom Agent Team"
fi

echo ""
echo "Done! Run 'freebuff' in this folder to start."

