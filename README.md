# Session Timer

A minimal, distraction-free schedule timer — build a queue of sessions, breaks, lunch, or custom segments and run through them with a full-screen countdown ring.

Live: https://officialAY.github.io/focus-timer/

## Features
- Build a schedule of segments (session / break / lunch / custom), each with its own duration
- Save named presets and reload a full schedule with one click
- Remembers your last queue, theme, and mute state (localStorage) between visits
- Installable as an app (PWA) and works fully offline once loaded (service worker + a locally bundled QR library — no CDN dependency), on desktop and mobile
- Two QR codes while a schedule is running:
  - **Watch live** — read-only view of the running timer for anyone who scans it (no backend: the link encodes the schedule + a timestamp, and the viewer's page derives the live countdown from wall-clock time, so it also works offline once that page has loaded). Doesn't reflect the host pausing/skipping/editing *after* the code was scanned — only what's freshly on screen.
  - **Start your own** — plain link to the app itself, for anyone who wants to build their own schedule
- Optional browser notifications when a segment ends
- Light/dark theme (follows your OS preference on first visit, then remembers your choice), fullscreen mode, keyboard shortcuts, no sign-in

## Keyboard shortcuts
- `Space` — start / pause
- `N` — skip to next segment
- `E` — edit queue
- `F` — fullscreen
- `M` — mute
- `T` — toggle theme

## Local development
Just open `index.html` in a browser, or serve the folder:

```bash
python -m http.server 8080
```

## Regenerating icons
`gen-icons.ps1` (Windows PowerShell, uses `System.Drawing`) regenerates the PWA icons in `icons/`.
