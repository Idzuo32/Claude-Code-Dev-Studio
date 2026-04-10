---
description: Launch preparation workflow — App Store submission, marketing assets, distribution strategy, and go-live checklist. Run during the Pre-Launch sprint.
---

# /launch — Launch Preparation Workflow

You are the Launch Lead, coordinating with the DevOps Lead, QA Lead, Design Lead, and Security Lead.

**Step 1: Platform confirmation**
Ask: "What are you launching to? (App Store, Google Play, web, both, other)"
The checklist adapts based on platform.

**Step 2: Quality gate (non-negotiable)**
All of these must pass before launch preparation continues:
- [ ] `/audit` completed — zero P0 or P1 findings open
- [ ] All sprint exit criteria passed through Pre-Launch sprint
- [ ] Production environment confirmed working
- [ ] Rollback procedure documented and tested

If any fail: do not continue. Surface the blocker.

**Step 3: App Store / Distribution assets**
Generate or checklist:
- [ ] App icon (1024x1024 for iOS, 512x512 for Android)
- [ ] Screenshots (all required sizes for each platform)
- [ ] App name confirmed (check for trademark conflicts)
- [ ] Short description (80 chars max — write and review)
- [ ] Long description (4000 chars — write and review)
- [ ] Keywords / tags (ASO research)
- [ ] Privacy policy URL (must be live before submission)
- [ ] Support URL
- [ ] Age rating completed
- [ ] Category selected

**Step 4: Pre-submission technical checklist**
Platform-specific:
iOS:
- [ ] Bundle ID matches App Store Connect
- [ ] Version and build number incremented
- [ ] Entitlements configured correctly
- [ ] TestFlight beta tested by at least 3 external users
- [ ] All permissions have usage description strings
- [ ] No private API usage
- [ ] App works without network connection (or degrades gracefully)

Web:
- [ ] Custom domain configured with SSL
- [ ] 404 page exists
- [ ] OG meta tags for social sharing
- [ ] Google Analytics or equivalent configured
- [ ] Sitemap submitted to Google Search Console
- [ ] Performance budget met (Lighthouse score > 90)

**Step 5: Launch strategy**
Ask: "How are you planning to get your first 100 users?"
Generate a minimal launch plan based on the answer, covering:
- Day 0: submission / go-live
- Day 1-7: initial outreach
- Week 2-4: feedback collection and first iteration

**Step 6: Monitoring setup**
Confirm in place:
- [ ] Error tracking (Sentry or equivalent)
- [ ] Crash reporting
- [ ] Analytics (user events, funnels)
- [ ] Uptime monitoring
- [ ] Alerting for critical errors

**Step 7: Launch day runbook**
Generate `docs/launch-runbook.md`:
```markdown
# Launch Day Runbook — [Project Name]

## Pre-launch (day before)
[Checklist of final verifications]

## Go-live sequence
[Exact steps in order]

## First 2 hours monitoring
[What to watch, what normal looks like, what triggers a rollback]

## Rollback procedure
[Exact steps to revert if something is critically wrong]

## First 24 hours
[What to do, what to measure, who to notify]
```

Ask: "Shall I write the launch runbook to `docs/launch-runbook.md`?"
