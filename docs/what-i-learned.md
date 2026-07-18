# What I Learned

## Raw signals are not meaning

The biggest lesson was that detector output is not the same thing as a meaningful moment. A face, object, sound, scene, or motion signal can be useful, but it does not explain why something matters to a person.

## Ambiguity is part of the problem

Human-centered computing is not only about making a feature work. It is also about deciding what the feature should not claim. Clipify helped me understand that ambiguity is not always a bug to erase.

## Camera apps need privacy discipline

A camera app needs special care around permissions, capture state, storage, logs, screenshots, and demos. Privacy has to affect the architecture and the product experience, not only a settings page.

## Candidate moments are not truth

A system can surface candidate moments, but it should not pretend to fully understand a person. The user should stay in control of interpretation and review.

## Thresholds need recovery paths

A heuristic score is not just a number. If the threshold is too low, the app can surface too many noisy candidates. If it is too high, it can miss quiet moments. That made user controls, explanations, and recovery paths part of the system design.

## Technical learning

I practiced:

- Swift and SwiftUI
- AVFoundation camera and audio architecture
- detector orchestration
- local signal snapshots
- preference, rarity, confidence, and threshold scoring
- moment and history models
- persistence and CloudKit-related state
- real-device camera lifecycle, battery, permissions, and recovery

## Design tradeoffs

The project forced tradeoffs between:

- usefulness and noise
- privacy and personalization
- local processing and sync convenience
- battery cost and capture richness
- automatic capture and user trust
- simple explanations and complex signals

Those tradeoffs became the most interesting part of the project.
