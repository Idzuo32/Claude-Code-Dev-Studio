---
name: performance
description: Performance optimization patterns for web, mobile, and backend. Profiling approach, budgets, and common optimizations. Stack-agnostic.
---

# Performance Optimization

## The Golden Rule
**Profile before optimizing.** Measure, don't guess. Fix the biggest bottleneck first.

## Performance Budgets (set these per project)

### Web
| Metric | Target | Unacceptable |
|--------|--------|-------------|
| LCP | < 2.5s | > 4s |
| INP | < 200ms | > 500ms |
| CLS | < 0.1 | > 0.25 |
| JS bundle (initial) | < 200KB gzipped | > 500KB |

### Mobile
| Metric | Target |
|--------|--------|
| Cold start | < 2s |
| Screen transition | < 300ms |
| Scroll | 60fps (16ms/frame) |

### Backend API
| Metric | Target |
|--------|--------|
| p50 response time | < 100ms |
| p95 response time | < 500ms |
| p99 response time | < 1s |
| Error rate | < 0.1% |

## Web Performance

### Images (biggest wins)
- Use modern formats: WebP or AVIF (50-80% smaller than JPEG/PNG)
- Specify `width` and `height` to prevent layout shift
- Lazy-load below-the-fold images
- Preload LCP image (the largest above-the-fold image)
- Use responsive images with `srcset`

### JavaScript
- Code-split by route — don't load the whole app upfront
- Dynamically import heavy components only when needed
- Tree-shake unused library code
- Analyze bundle with source-map-explorer or bundler-specific tool

### Fonts
- Preload key fonts
- `font-display: swap` to avoid invisible text
- Self-host fonts to avoid extra DNS/TLS handshakes

## Backend Performance

### Database (usually the bottleneck)
```
1. Add missing indexes on WHERE/ORDER BY columns
2. Fix N+1 queries (use JOINs or eager loading)
3. Select only needed columns (avoid SELECT *)
4. Use pagination — never return unbounded result sets
5. Add caching for hot, slow, rarely-changing queries
6. Use connection pooling
```

### API
- Compress responses (gzip/brotli)
- Cache responses at edge/CDN for public content
- Use HTTP/2 or HTTP/3
- Paginate all list endpoints

## Mobile Performance
- Virtualize lists (only render visible items)
- Run heavy computation off the UI thread (web workers / background isolates)
- Cache images with a proper image caching library
- Preload next-screen data before navigation
- Reduce re-renders: profile with the platform's profiler first

## Profiling Tools
```
Web:     Chrome DevTools Performance tab, Lighthouse, WebPageTest
Backend: your APM (Datadog, New Relic, Sentry), pg_stat_statements (PostgreSQL)
Mobile:  React Native DevTools, Xcode Instruments (iOS), Android Profiler
```
