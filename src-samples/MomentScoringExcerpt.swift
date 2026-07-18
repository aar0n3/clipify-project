import Foundation

// Simplified excerpt from Clipify's experimental scoring idea.
// The result is a candidate likelihood, not a decision about what a moment means.

struct SignalScoreInput {
    var confidence: Float
    var preference: Float
    var rarity: Float
}

struct SignalScoreWeights {
    var confidence: Float = 0.333
    var preference: Float = 0.333
    var rarity: Float = 0.334
}

struct MomentScorer {
    static func likelihood(input: SignalScoreInput, weights: SignalScoreWeights) -> Float {
        input.confidence * weights.confidence
        + input.preference * weights.preference
        + input.rarity * weights.rarity
    }

    static func rarity(fromFrequency frequency: Float) -> Float {
        1.0 / (max(frequency, 0.0) + 0.001)
    }

    static func shouldKeepCandidate(likelihood: Float, threshold: Float) -> Bool {
        likelihood >= threshold
    }
}
