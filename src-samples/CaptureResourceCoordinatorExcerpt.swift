import Foundation

// Simplified camera and audio ownership pattern.
// One active controller owns the shared capture resources during a handoff.

protocol CaptureControlling: AnyObject {
    func pauseCaptureForHandoff(completion: @escaping () -> Void)
    func startCaptureAfterHandoff()
}

final class CaptureResourceCoordinator {
    static let shared = CaptureResourceCoordinator()

    private weak var activeController: CaptureControlling?

    private init() {}

    func activate(_ controller: CaptureControlling, completion: @escaping () -> Void) {
        if activeController === controller {
            completion()
            return
        }

        let previous = activeController
        activeController = controller

        guard let previous else {
            completion()
            return
        }

        previous.pauseCaptureForHandoff { [weak self, weak controller] in
            guard let self, let controller, self.activeController === controller else { return }
            completion()
        }
    }

    func deactivate(_ controller: CaptureControlling) {
        guard activeController === controller else { return }
        activeController = nil
        controller.pauseCaptureForHandoff {}
    }
}
