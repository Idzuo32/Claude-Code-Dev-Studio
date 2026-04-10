#!/bin/bash
# SessionStart hook: print studio context at session start

echo ""
echo "╔══════════════════════════════════════════════╗"
echo "║     Claude Code Dev Studio — Session Start   ║"
echo "╚══════════════════════════════════════════════╝"
echo ""

# Show git branch if in a git repo
if git rev-parse --git-dir > /dev/null 2>&1; then
  BRANCH=$(git branch --show-current 2>/dev/null)
  LAST_COMMIT=$(git log -1 --pretty=format:"%h %s" 2>/dev/null)
  echo "📁 Project: $(basename $(git rev-parse --show-toplevel 2>/dev/null))"
  echo "🌿 Branch:  $BRANCH"
  echo "📝 Last:    $LAST_COMMIT"
  echo ""

  # Show any uncommitted changes
  DIRTY=$(git status --short 2>/dev/null)
  if [ -n "$DIRTY" ]; then
    echo "⚠️  Uncommitted changes:"
    git status --short | head -10
    echo ""
  fi
fi

# Remind about context management
echo "💡 Tips:"
echo "   • Run /start for new project onboarding"
echo "   • Run /plan before building a new feature"
echo "   • Compact at 50% context (/compact)"
echo ""
