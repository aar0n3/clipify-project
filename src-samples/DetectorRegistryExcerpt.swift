import Foundation

// Simplified excerpt from Clipify's detector registry.
// It shows the orchestration pattern without publishing detector internals or models.

protocol LocalSignalDetector {
    var signalKey: String { get }
    func currentStatus() -> [String: String]
}

struct DetectorRegistryEntry {
    let key: String
    let signalKey: String
    let makeDetector: () -> LocalSignalDetector
}

struct DetectorRegistry {
    private let entries: [DetectorRegistryEntry]

    init(entries: [DetectorRegistryEntry]) {
        self.entries = entries
    }

    func snapshot() -> [String: [String: String]] {
        var result: [String: [String: String]] = [:]
        for entry in entries {
            let detector = entry.makeDetector()
            result[entry.signalKey] = detector.currentStatus()
        }
        return result
    }
}
