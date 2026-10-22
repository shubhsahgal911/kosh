{\rtf1\ansi\ansicpg1252\cocoartf2870
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\froman\fcharset0 Times-Roman;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c0;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs24 \cf0 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 ## What and why\
**Jira:** KOSH-___\
One or two sentences on the user-visible change and why it's needed.\
\
## How to test\
1. \
2. \
\
## Screenshots\
<!-- UI changes: light + dark mode, and the largest Dynamic Type size -->\
\
## Checklist\
- [ ] No business logic in Views (it lives in ViewModels or use cases)\
- [ ] New cross-module API is `public` on purpose, and nothing more\
- [ ] `@MainActor` / `Sendable` used where needed; no new concurrency warnings\
- [ ] No force unwraps outside the composition root (or justified inline)\
- [ ] Unit tests cover the happy path and at least one failure\
- [ ] Analytics event added, or not needed\
- [ ] SwiftLint clean (0 warnings)\
- [ ] Accessibility: labels on icon-only buttons; Dynamic Type checked}