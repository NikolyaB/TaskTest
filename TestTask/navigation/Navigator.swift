//
//  Navigator.swift
//  TestTask
//
//  Created by Nikolay Bocharnikov on 10.12.2023.
//

import Foundation

enum ScreenRoute {
    case currency_pair
    case top
    case trade
}

@MainActor class Navigator: ObservableObject {
    static let shared: Navigator = Navigator(startScreen: .top)
    
    @Published var currentTab: ScreenRoute
    
    init(startScreen: ScreenRoute) {
        self.currentTab = startScreen
    }
}
