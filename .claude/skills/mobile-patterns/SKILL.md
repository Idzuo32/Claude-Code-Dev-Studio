---
name: mobile-patterns
description: Mobile application patterns for navigation, forms, lists, offline support, and native integrations. Stack-agnostic concepts with framework-specific notes.
---

# Mobile Patterns

## Navigation Patterns

### Stack navigator (most apps)
```
App
├── AuthStack (unauthenticated)
│   ├── Login
│   └── Signup
└── AppStack (authenticated)
    ├── TabNavigator
    │   ├── Home
    │   ├── Feed
    │   └── Profile
    └── Modals (presented over tabs)
```

### Deep linking
Every screen should be addressable by URL for:
- Push notification taps
- In-app emails
- Shared links
Map URL patterns to screen + params before building navigation.

## Form Best Practices (any stack)
- Show validation errors inline, next to the field that caused them
- Disable submit button while submitting (prevent double-submit)
- Handle keyboard appearance: scroll content up so active field is visible
- On iOS: set `returnKeyType` to move focus to next field
- On Android: handle `softInputMode` (adjust-resize vs adjust-pan)
- Use appropriate keyboard type: `email-address`, `numeric`, `phone-pad`

## Large List Performance
- Virtualize any list > 50 items (render only visible rows)
- Provide `estimatedItemSize` if the API supports it
- Memoize list item components to prevent unnecessary re-renders
- Load more data when user approaches the end (`onEndReached`)
- Show loading indicator at bottom, not a spinner overlay

## Offline Support Strategy
```
Online:  Fetch → Cache → Display cached
Offline: Display cached → Queue mutations → Sync when online
```

Decide per-feature: does this need offline support?
- Read-only content: yes, almost always cache it
- Mutations (create/update): queue locally, sync on reconnect
- Real-time features: degrade gracefully with a "no connection" state

## Push Notifications
```
1. Request permission (explain why before asking)
2. Get device token from OS
3. Send token to your backend
4. Backend stores token against user
5. Your server sends via APNs (iOS) / FCM (Android) or a service like OneSignal/Expo
6. App handles notification tap → navigate to relevant screen
```

Token can change. Refresh it on every app launch.

## App Store Submission Checklist
- [ ] Privacy policy URL set in app metadata
- [ ] All permissions have usage description strings (iOS requires these)
- [ ] App works without any permissions granted
- [ ] App handles all screen sizes including tablets
- [ ] No test credentials or debug logs in production build
- [ ] Version and build number incremented
- [ ] Tested on oldest supported OS version
