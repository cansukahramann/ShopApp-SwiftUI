//
//  ContentView.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 10.02.2025.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding: Bool = false
    
    var body: some View {
        if hasSeenOnboarding {
            MainTabView()
        } else {
            OnboardingView(hasSeenOnboarding: $hasSeenOnboarding)
                .ignoresSafeArea()
        }
    }
}

struct MainTabView: View {
    @StateObject private var cartViewModel = CartViewModel()
    @StateObject private var favoriteViewModel = FavoriteViewModel()
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            CartView(viewModel: cartViewModel)
                .tabItem {
                    Image(systemName: "cart")
                    Text("Cart")
                }
            FavoriteView(viewModel: favoriteViewModel)
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorite")
                }
        }
    }
}
