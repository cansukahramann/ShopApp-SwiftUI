//
//  ShopApp_SwiftUIApp.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 10.02.2025.
//

import SwiftUI

@main
struct ShopApp_SwiftUIApp: App {
    @State private var selectedTab: Tab = .home
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
            }
        }
    }
}

enum Tab: String, CaseIterable {
    case home = "house"
    case cart = "cart"
    case profile = "person"
}
