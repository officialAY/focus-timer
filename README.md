# Session Timer

A minimal, distraction-free schedule timer — build a queue of sessions, breaks, lunch, or custom segments and run through them with a full-screen countdown ring.

Live: https://officialAY.github.io/focus-timer/

## Features
- Build a schedule of segments (session / break / lunch / custom), each with its own duration
- Save named presets and reload a full schedule with one click
- Remembers your last queue, theme, and mute state (localStorage) between visits
- Installable as an app (PWA) and works fully offline once loaded (service worker + a locally bundled QR library — no CDN dependency), on desktop and mobile
- "Open on phone" QR card — scan to load the same timer on another device
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
