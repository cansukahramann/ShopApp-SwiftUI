//
//  ShopApp_SwiftUIApp.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 10.02.2025.
//

import SwiftUI

@main
struct ShopApp_SwiftUIApp: App {
    @StateObject private var homeViewModel = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView(viewModel: homeViewModel)
            }
        }
    }
}
