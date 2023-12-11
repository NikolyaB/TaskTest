//
//  TabViewNavigation.swift
//  TestTask
//
//  Created by Nikolay Bocharnikov on 10.12.2023.
//

import SwiftUI

struct TabNavigationItem: Identifiable {
    let id = UUID()
    let route: ScreenRoute
    let icon: String
    let title: String
}

let tabNavigationItems = [
    TabNavigationItem(
        route: .trade,
        icon: "ic_trade",
        title: "Trade"
    ),
    TabNavigationItem(
        route: .top,
        icon: "ic_top",
        title: "Top"
    )
]

struct TabViewNavigation: View {
    @StateObject var navigator: Navigator = Navigator.shared
    let viewFactory = ViewFactory()
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color(hex: "20232F").opacity(0.8))
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color(hex: "787D8F"))
    }
    
    var body: some View {
        tabBar
            .environmentObject(navigator)
    }
    
    var tabBar: some View {
        TabView(selection: $navigator.currentTab) {
            ForEach(tabNavigationItems) { item in
                viewFactory.makeView(for: item.route)
                    .tag(item.route)
                    .tabItem {
                        Image(item.icon)
                            .renderingMode(.template)
                        Text(item.title)
                    }
            }
        }
        .accentColor(Color(hex: "35B972"))
    }
}

#Preview {
    TabViewNavigation()
}
