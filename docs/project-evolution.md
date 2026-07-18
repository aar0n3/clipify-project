# Project Evolution

## ChestCam

I started the earlier ChestCam project by asking whether a camera could notice possible moments from signals around the phone and patterns in use. I experimented with capture, detector outputs, scoring, context profiles, bounded recording, and saved metadata.

ChestCam lived in its own repository.

## Starting Clipify as a rewrite

Later, I started Clipify in a new repository. It was not only a name change. I rewrote the app because I wanted clearer ownership between camera, audio, signal processing, scoring, persistence, and the interface.

The idea also became more focused on everyday use. Instead of stopping at automatic capture, I started working on how someone could review key moments, group them into episodes, and use them in diary or reflection flows.

## Rebuilding the signal pipeline

Clipify rebuilt the local detector layer and treated the outputs as uncertain signals. Face presence, scene, objects, sound, voice, activity, motion, place, weather, and other metadata can add context, but they do not explain the meaning of a moment by themselves.

## Scoring and review

I added an experimental likelihood score using confidence, preference, and rarity. Testing thresholds made it clear that the user needed visible controls and a way to reject or ignore noisy results.

## Key moments, episodes, and diary work

The project grew from candidate capture into saved key-moment history, episode grouping, and diary or reflection surfaces. These pieces are still experimental. The automatic end-of-day video story remains a future direction.

## Current state

Clipify is currently available as a TestFlight beta:

[Test Clipify on TestFlight](https://testflight.apple.com/join/HUcgnYKr)

I am continuing to develop it as a standalone product, with an App Store release as the goal. The complete source remains in a private development repository.

## Next direction

- clearer capture and privacy controls
- better explanations for candidate moments
- stronger battery, thermal, and lifecycle testing
- better episode and diary quality
- a staged daily-video flow that stays under user control
- the product and privacy work needed for an App Store release
