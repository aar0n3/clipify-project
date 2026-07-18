# Clipify

Clipify is an iPhone camera and memory app I am building. It explores whether a camera can notice possible moments worth keeping, then help the user review and organize them without pretending the app knows what the moment means.

Clipify grew from an earlier project I called ChestCam, but it was not just a rename. I started Clipify later as a rewrite in a new repository so I could rethink the architecture and make the idea more useful in everyday life.

Clipify is currently available through TestFlight. My goal is to keep developing it into a standalone App Store app.

## Why I started it

Sometimes a moment feels worth remembering before I can explain why or reach for the shutter button. I started wondering whether signals around the phone, such as motion, scene changes, sound, objects, and capture patterns, could help surface possible moments.

The hard part is that a signal is not the same as meaning. A high score cannot prove that a moment is important. Clipify treats automatic results as candidates that the user can review, ignore, or keep.

## What works today

The prototype includes:

- an AVFoundation camera and audio pipeline
- local signal detectors and a detector registry
- experimental moment scoring
- bounded recent capture and key-moment history
- episode grouping and diary or reflection surfaces
- lock-state and capture-ownership handling
- local persistence and CloudKit-related sync work
- settings and diagnostics for understanding what the app is doing

The automatic end-of-day video story is still a future direction, not a finished feature.

## What was harder than I expected

Camera apps have many lifecycle problems. The camera, microphone, app scenes, lock state, interruptions, overlays, and background transitions can all compete for the same resources. I eventually added clearer managers and a capture resource coordinator instead of continuing to patch every screen separately.

Scoring also needed more than a threshold. If it was too low, the app kept noisy moments. If it was too high, it missed quiet moments. That pushed me toward visible controls, review surfaces, and language that shows uncertainty.

Privacy affected the architecture too. Capture state, protected data, stored history, demos, and sync behavior all need to be understandable and controllable.

## How I built it

Clipify is built with Swift, SwiftUI, AVFoundation, local signal processing, Core Data-style persistence, and CloudKit-related infrastructure. The current app separates capture, audio, signal processing, scoring, persistence, and review so one screen does not own everything.

- [Architecture](docs/architecture.md)
- [Signal pipeline](docs/signal-pipeline.md)
- [Scoring model](docs/scoring-model.md)
- [Project evolution](docs/project-evolution.md)
- [Privacy and safety](docs/privacy-and-safety.md)
- [What I learned](docs/what-i-learned.md)
- [Selected Swift samples](src-samples/README.md)

## About this repository

This is a small showcase of Clipify, not the complete app source code. I am keeping the main development repository private because Clipify is an active product that I want to keep building and release as its own app. I am not planning to open-source the entire product.

The files here are project notes and selected, simplified Swift samples. They do not include real captured photos, videos, audio, faces, locations, diary entries, account information, databases, private logs, developer identifiers, credentials, certificates, provisioning files, or the full camera and inference implementation.

## Try the beta

[Test Clipify on TestFlight](https://testflight.apple.com/join/HUcgnYKr)

## What I want to build next

- clearer explanations for why a candidate moment was surfaced
- stronger battery, thermal, and lifecycle testing on real devices
- privacy and capture controls that are easier to understand
- better episode and diary quality
- a staged daily-video experience that keeps the user in control
- the work needed for a standalone App Store release

## How I work

I designed the idea and built the app as a personal student project. I use documentation, online examples, feedback, and AI coding tools when I get stuck. I still decide what to build, check the code, test the behavior on devices, and keep changing parts that do not work the way I intended.
