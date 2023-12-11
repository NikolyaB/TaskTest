//
//  MainScreenView.swift
//  TestTask
//
//  Created by Nikolay Bocharnikov on 10.12.2023.
//

import SwiftUI

struct MainScreenView: View {
    @EnvironmentObject private var launchScreenState: LaunchScreenStateManager
    
    var body: some View {
        TabViewNavigation()
            .onAppear {
                simulateAsyncTaskCompletion()
            }
    }
    
    func simulateAsyncTaskCompletion() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.launchScreenState.dismiss()
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
                if granted {
                } else {
                }
            }
        }
    }
}

#Preview {
    MainScreenView()
}
