---
description: React and React Native component standards.
globs: "**/*.tsx"
---

# React Standards

## Component Rules
- One component per file
- Named exports for components (no default exports, except for pages)
- Props interface named `[ComponentName]Props`
- Destructure props in function signature

```typescript
// ✅ Correct
interface ButtonProps {
  label: string
  onClick: () => void
  variant?: 'primary' | 'secondary'
}

export function Button({ label, onClick, variant = 'primary' }: ButtonProps) {
  return <button onClick={onClick} className={styles[variant]}>{label}</button>
}
```

## Hooks
- Prefix custom hooks with `use`: `useAuth`, `useDebounce`
- Keep hooks focused — one concern per hook
- Never call hooks conditionally

## State
- `useState` for local UI state (form fields, open/closed, etc.)
- TanStack Query for server state (fetching, caching, mutations)
- Zustand for global UI state (user preferences, app-wide state)
- Avoid prop drilling beyond 2 levels — use context or state manager

## Side Effects
- Prefer Server Actions or route handlers over client-side fetch where possible
- Clean up effects that create subscriptions or timers

## Performance
- Don't wrap every component in `React.memo` pre-emptively — measure first
- Avoid creating objects/arrays as default prop values (creates new reference every render)
