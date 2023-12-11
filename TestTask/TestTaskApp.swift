//
//  TestTaskApp.swift
//  TestTask
//
//  Created by Nikolay Bocharnikov on 10.12.2023.
//

import SwiftUI
import UserNotifications

@main
struct TestTaskApp: App {

    @StateObject private var launchScreenState = LaunchScreenStateManager()
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                MainScreenView()
                
                if launchScreenState.state != .finished {
                    LaunchScreenView()
                }
            }
            .environmentObject(launchScreenState)
        }
    }
}
