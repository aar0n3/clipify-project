import UIKit
import Combine

// Simplified protected-data observer used to make lock-state behavior explicit.

final class PrivacyLockState: ObservableObject {
    @Published private(set) var isProtectedDataAvailable: Bool

    init(application: UIApplication = .shared) {
        isProtectedDataAvailable = application.isProtectedDataAvailable
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(protectedDataBecameAvailable),
            name: UIApplication.protectedDataDidBecomeAvailableNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(protectedDataWillBecomeUnavailable),
            name: UIApplication.protectedDataWillBecomeUnavailableNotification,
            object: nil
        )
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    @objc private func protectedDataBecameAvailable() {
        isProtectedDataAvailable = true
    }

    @objc private func protectedDataWillBecomeUnavailable() {
        isProtectedDataAvailable = false
    }
}
