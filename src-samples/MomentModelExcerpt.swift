import Foundation

// Simplified excerpt from Clipify's candidate-moment model.
// The complete app model also connects to capture, persistence, and review flows.

struct ActivitySignal: Equatable {
    let label: String
    let icon: String
    let confidence: Float
}

struct CandidateMoment: Equatable, Identifiable {
    enum InferenceState: String {
        case pipeline
        case processing
        case inferred
    }

    let id: Int
    let profileName: String
    let capturedAt: Date
    let likelihood: Float
    let signalSnapshot: [String: String]
    var inferredActivities: [ActivitySignal]
    var inferenceState: InferenceState

    var bestActivity: ActivitySignal? {
        inferredActivities.max { $0.confidence < $1.confidence }
    }
}
