# Scoring Model

Clipify uses an experimental heuristic for candidate moments. It is not a proven model of memory, emotion, or human importance.

## Core idea

The score combines:

- **Confidence:** how strong the detector results appear
- **Preference:** a learned signal that can change when the user reinforces certain attributes
- **Rarity:** a novelty-style signal based on lower frequency
- **Decay:** a time-based adjustment so older evidence does not stay equally strong forever

A simplified version is:

```text
candidate likelihood ≈
    confidence signal × confidence weight
  + preference signal × preference weight
  + rarity signal × rarity weight
  + decay adjustment
```

The app also tracks frequency so uncommon signals can receive more rarity weight than signals that appear all the time. Decay was introduced in the early ChestCam V1 scoring work alongside confidence, preference, and rarity.

## When a candidate may be created

A candidate moment may appear when:

- the user captures it manually
- the likelihood score crosses a threshold
- a signal is unusually strong or rare
- a later history or diary process finds it eligible

The user can still ignore the result.

## Threshold design lesson

A high score should not automatically mean “save forever,” and a low score should not mean “ignore forever.” If the threshold is too low, the app can surface too many noisy candidates. If it is too high, it can miss quiet moments.

That made thresholds, review controls, explanations, and recovery paths part of the design instead of polish added later.

## Limitations

- Detector confidence is not the same as real-world meaning.
- Rarity can overvalue unusual but unimportant events.
- Preference can reinforce patterns that are not actually meaningful.
- Decay can reduce stale evidence but does not prove newer evidence matters more.
- Scores can change with lighting, motion, device placement, and environment.
- Threshold behavior still needs real-device testing for battery, heat, and false positives.

The score is a tool for deciding what may be worth reviewing. It is not a measurement of human memory or meaning.
