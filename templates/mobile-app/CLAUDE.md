# Mobile App Project

> This template is for: iOS/Android consumer apps, potentially with subscriptions and a backend API.

## Project Context
```
Project Name:     [name]
Type:             mobile
Target Platform:  [iOS | Android | both]
Current Phase:    [planning | active | pre-launch | maintenance]
Stack:            [fill in: e.g. React Native/Expo SDK 52 | Flutter | Swift | Kotlin]
Backend:          [fill in: Supabase | Firebase | custom API | none]
Auth Provider:    [fill in: Supabase Auth | Firebase Auth | Clerk | other]
IAP Provider:     [fill in: RevenueCat | StoreKit | Billing Library | none]
```

## Key Directories
```
app/          Screens and navigation (Expo Router) or src/screens/
components/   Shared UI components
hooks/        Custom hooks
lib/          Utilities, API client, storage helpers
constants/    Colors, sizes, typography, strings
types/        TypeScript types
assets/       Images, fonts, icons
```

## Mobile-Specific Session Rules
- All sensitive data stored in OS secure storage (not in-memory or plain storage)
- App works offline or degrades gracefully — never a blank error screen
- Test on real devices before marking UI work complete
- OTA updates (if applicable) must not change native code

## Active Skills
- `mobile-patterns` — navigation, forms, lists, offline, notifications
- `auth-patterns` — mobile auth flows, token storage
- `performance` — frame rate, startup time, list virtualization

## Key Commands for This Project Type
- `/plan` — phase by platform (core → iOS polish → Android polish)
- `/audit` — accessibility and performance before app store submission
- `/deploy` — EAS Build + Submit checklist
