---
name: product-copy
description: App Store descriptions, landing page copy, onboarding flows, email templates, and pricing page copy for software products. Activates during pre-launch sprint and content tasks.
globs: "docs/copy/**,docs/launch*,**/store-listing*"
---

# Product Copy

Writing in service of the product. Every word earns its place or it doesn't ship.

## App Store — iOS

**Title** (30 chars max): `Brand Name - Primary Keyword`
Primary keyword = what users search when they have the problem you solve.
Never waste chars on "app" — it's already an app.

**Subtitle** (30 chars max): Secondary keyword phrase. Completes the value proposition the title starts.

**Keywords field** (100 chars):
- No spaces after commas — every character counts
- No words already in title or subtitle (wasted)
- No competitor brand names (policy violation, will be rejected)
- Think: what does the user type when frustrated by the problem?

**Short description pattern** (first 3 lines visible before "more"):
```
Line 1: The outcome the user gets (not the feature that delivers it)
Line 2: The specific pain this solves
Line 3: Social proof or differentiator
```

**Screenshot captions**: Complete the value proposition — don't describe what's visible.
- ❌ "Track your habits" (describes the feature)
- ✅ "Never lose a streak again" (describes the outcome)

## App Store — Android

Same discipline as iOS. Key difference: first 80 chars of long description appear as short description — treat those 80 chars as your only pitch.

## Landing Page Copy

**Hero hierarchy** (in order of reader attention):
1. Headline: The outcome in 6-10 words. Not clever. Not punchy. Clear.
2. Subheadline: Who this is for and the specific problem it solves.
3. CTA: One action, imperative verb, specific benefit.
   - ❌ "Get Started" (what does that mean?)
   - ✅ "Start Your Free 14-Day Trial" (clear, specific, low risk)

**The observability test for CTAs**: Can you observe whether the user did it?
"Learn More" fails. "Download the Free Guide" passes.

**Social proof placement**: Immediately after the hero — before any feature explanation. Credibility must be established before the reader invests attention in features.

**Feature vs. benefit rule**: Features describe what the product does. Benefits describe what the user's life looks like after they use it. Always lead with benefit, follow with feature.

```
❌ "Real-time sync across all devices"
✅ "Pick up exactly where you left off — on any device"
   (feature: real-time sync)
```

## Email Templates

**Welcome email** (sent immediately after signup):
- Subject: Personal, specific, not promotional
- Body: Confirm they made the right decision (one sentence), tell them the single most important thing to do first, link to that one thing only
- Length: Under 150 words. They just signed up — they're not ready for a tutorial.

**Onboarding sequence** (days 1-7):
- Day 1: The one action that leads to the first "aha" moment
- Day 3: The second most important action (only if Day 1 action was completed)
- Day 7: Social proof from a user who had the same starting point they did

**Password reset**:
```
Subject: Reset your [Product] password
Body: [Button: Reset Password]
This link expires in 1 hour. If you didn't request this, ignore this email.
```
No explanation. No marketing. No brand personality. Just the function.

**Trial expiry (3 days before)**:
- Lead with what they'll lose, not what the product costs
- Specific: "Your [specific thing they built] will become read-only"
- One CTA, no alternatives

## Pricing Page

**Principle**: Pricing pages are anxiety reduction, not feature lists.
The reader's question is "will I regret this?" — answer it.

**Plan naming**: Name plans after the user's role or outcome, not your tier.
- ❌ Basic / Pro / Enterprise
- ✅ Solo / Team / Company

**Feature comparison tables**: Put the thing the buyer cares about most at the top. Usually not the most impressive feature — the most important one to their specific situation.

**Money-back guarantee placement**: Directly adjacent to the CTA button. Not in the footer.

**Annual vs. monthly toggle**: Show the savings in dollars per year, not percent.
- ❌ "Save 20%"
- ✅ "Save $48/year"
