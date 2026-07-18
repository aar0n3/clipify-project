# Privacy and Safety

Clipify works with camera, audio, motion, location-related context, and personal memories. Privacy is part of the architecture, not only a settings screen.

## What is in this showcase

This repository contains project notes and selected, simplified Swift samples. It does not contain:

- real captured photos, videos, or audio
- faces, personal locations, family or school content, or private memories
- transcripts, diary entries, raw detector histories, or location history
- account details, user identifiers, databases, logs, or analytics exports
- API keys, tokens, certificates, provisioning files, or developer identifiers
- the complete app source code

## Product design goals

Clipify should:

- make capture state visible
- explain permission and lock states clearly
- let the user review, ignore, or keep candidate moments
- describe scores as uncertain indicators
- avoid saying that the app knows what someone feels
- make stored history and sync controls understandable

## Local processing and sync

Many signals are processed locally, and the app has local history and review surfaces. The development project also includes CloudKit-related sync work and other Apple services.

Because of that, I do not claim that all data always stays only on the device. I still need to finish reviewing and explaining sync, Photos, microphone, location, and network behavior before an App Store release.

## Screenshots and demo videos

Public screenshots and demos should use staged or synthetic scenes. They should not show real faces, homes, schools, addresses, license plates, notifications, private rooms, personal routines, or camera-roll memories.

## Risks I am still working on

- false positives and confusing candidate moments
- camera or microphone recovery after interruptions
- battery and thermal behavior on real devices
- unclear sync or storage state
- debug output accidentally containing sensitive context
- demos accidentally revealing private information

The goal is not to make Clipify sound safer than it is. The goal is to keep improving the product until the behavior and controls are understandable enough for a standalone release.
