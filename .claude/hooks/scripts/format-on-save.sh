#!/bin/bash
# PostToolUse hook: auto-format TypeScript/JavaScript files after edit

# Read the input (we don't need it, but must consume stdin)
INPUT=$(cat)

# Get the file that was just edited from the environment
FILE="${CLAUDE_TOOL_INPUT_FILE_PATH:-}"

if [ -z "$FILE" ]; then
  exit 0
fi

# Only format supported file types
case "$FILE" in
  *.ts|*.tsx|*.js|*.jsx|*.json|*.css|*.md)
    if command -v prettier &> /dev/null; then
      prettier --write "$FILE" --log-level silent 2>/dev/null || true
    fi
    ;;
esac

exit 0
