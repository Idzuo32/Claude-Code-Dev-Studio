---
name: microcopy
description: UI text, error messages, empty states, button labels, tooltips, confirmation dialogs, and loading states. The writing discipline that most software underinvests in.
globs: "src/**/*.tsx,src/**/*.vue,src/**/*.svelte,**/*.strings,**/i18n/**"
---

# Microcopy

Microcopy is the writing that users notice only when it's wrong. Get it right and it disappears. Get it wrong and it creates friction, anxiety, or confusion at the exact moment the user needs to act.

## Error Messages

**The three-part error message:**
1. What happened (plain English, no technical jargon)
2. Why it happened (if useful and non-obvious)
3. What to do next (specific action, not "try again")

```
❌ "Error 403: Forbidden"
❌ "Something went wrong. Please try again."
✅ "We couldn't save your changes — your session has expired.
    Sign in again to continue where you left off."
```

**Tone rules for errors:**
- Never blame the user ("You entered an invalid email")
- Never be vague about the fix ("Please try again later")
- Never use technical codes as the primary message
- Always provide a path forward, even if the path is "contact support"

**Form validation** — inline, specific, immediate:
```
❌ "Invalid input"
❌ "Please check your email address"
✅ "Email addresses look like name@example.com"
```

**Severity vocabulary:**
- Destructive/irreversible: "Permanently delete" not "Remove" or "Delete"
- Warning: "This will affect..." not "Are you sure?"
- Info: "Saving..." not "Loading..."

## Empty States

Empty states are the most underused opportunity in software. The user is in a blank space — tell them what to put there.

**The three-part empty state:**
1. What this area is for (orientation)
2. Why it's empty right now (context)
3. The single action to fill it (CTA)

```
❌ [blank white space]
❌ "No items found."
✅ "Your projects will appear here.
    Start by creating your first project.
    [Create Project button]"
```

**First-use vs. filtered-empty distinction:**
- First use: encourage and onboard
- Filtered empty (search returned nothing): help them broaden or change the search

```
First use: "You haven't added any contacts yet. Import from CSV or add manually."
Filtered: "No contacts match 'marko'. Try a different spelling or clear the filter."
```

## Button Labels

**The imperative verb rule**: Buttons are actions. Start with a verb.
```
❌ "Confirmation" → ✅ "Confirm Payment"
❌ "Settings" → ✅ "Open Settings" (for navigation) or just "Settings" (for a gear icon)
❌ "Submit" → ✅ "Create Account" / "Send Message" / "Place Order"
```

**Specificity rule**: The button label should complete the sentence "I want to..."
```
"I want to..." → "Start Free Trial"  ✅
"I want to..." → "Submit"           ❌ (submit what?)
```

**Destructive actions**: Pair with friction — the label should describe the consequence.
```
❌ [Delete] [Cancel]
✅ [Delete Project Forever] [Keep Project]
```

The confirm button of a destructive dialog should never be the default focused button. Never.

## Tooltips

Tooltips answer "what does this do?" in one sentence. They appear on hover and should disappear without being missed.

**Format**: One sentence, present tense, starts with a verb.
```
❌ "This feature allows users to export their data in CSV format."
✅ "Export your data as a spreadsheet."
```

**Don't tooltip the obvious.** A "Save" button with a tooltip that says "Saves your work" is noise. Tooltip only when the function is genuinely non-obvious.

**Keyboard shortcut tooltips**: Show the shortcut in the tooltip.
```
"Save (⌘S)"
```

## Confirmation Dialogs

**Use only for irreversible or high-consequence actions.** Confirmation dialogs for reversible actions train users to click through them without reading.

**Structure:**
```
Title: [What is about to happen] — specific, not "Are you sure?"
Body: [The consequence] — what will be lost or changed
Primary CTA: [The consequence as a verb] — "Delete 47 messages"
Secondary: "Cancel"
```

```
❌ Title: "Are you sure?"
   Body: "This action cannot be undone."
   CTA: "OK"

✅ Title: "Delete this project?"
   Body: "This will permanently delete 'Q4 Campaign' and all 12 files inside it.
          Your team will lose access immediately."
   CTA: "Delete Project"  [destructive styling]
   Secondary: "Keep Project"
```

## Loading States

**The three loading contexts:**

Initial load (user just opened the page):
- Show a skeleton screen that matches the shape of the content
- Never a spinner alone for content-heavy pages

Action response (user clicked something):
- Inline feedback on the element they clicked — button becomes "Saving..." not a global overlay
- If over 3 seconds: show progress, not just a spinner

Background operation (sync, upload, processing):
- Non-blocking — user can continue working
- Status bar or subtle indicator, not a modal

**Loading copy:**
```
❌ "Loading..."
❌ "Please wait..."
✅ "Saving your changes..."
✅ "Uploading 3 of 5 photos..."
✅ "Building your report..."
```

## Onboarding Tooltips

**Progressive disclosure**: Show one tooltip at a time. Never a tour with 8 steps — the user will skip all of them.

**Timing**: Trigger tooltips when the user reaches the relevant UI, not immediately on first login.

**Dismissibility**: Every tooltip must have an obvious way to dismiss it. Users who dismiss should never see it again.

**Copy**: Finish the sentence "To [goal], [action]."
```
"To add your first client, click the + button in the sidebar."
```
