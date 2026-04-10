#!/bin/bash
# Stop hook: summarize what happened this session

echo ""
echo "╔══════════════════════════════════════════════╗"
echo "║         Session Summary                      ║"
echo "╚══════════════════════════════════════════════╝"
echo ""

if git rev-parse --git-dir > /dev/null 2>&1; then
  # Show files changed this session (rough approximation)
  CHANGED=$(git diff --name-only HEAD 2>/dev/null)
  STAGED=$(git diff --name-only --cached 2>/dev/null)

  if [ -n "$CHANGED" ] || [ -n "$STAGED" ]; then
    echo "📝 Files modified this session:"
    echo "$CHANGED$STAGED" | sort -u | head -20
    echo ""
  fi

  # Remind to commit
  STATUS=$(git status --short 2>/dev/null)
  if [ -n "$STATUS" ]; then
    echo "⚠️  You have uncommitted changes. Consider committing before ending your session."
    echo ""
  fi
fi

echo "🔚 Session ended. Your work is preserved."
echo ""
