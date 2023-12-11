//
//  LaunchScreenStateManager.swift
//  TestTask
//
//  Created by Nikolay Bocharnikov on 10.12.2023.
//

import Foundation

enum LaunchScreenStep {
    case firstStep
    case secondStep
    case finished
}

final class LaunchScreenStateManager: ObservableObject {

@MainActor @Published private(set) var state: LaunchScreenStep = .firstStep

    @MainActor func dismiss() {
        Task {
            state = .secondStep

            try? await Task.sleep(nanoseconds: 10000)

            self.state = .finished
        }
    }
}
