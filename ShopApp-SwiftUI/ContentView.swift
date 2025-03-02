//
//  ContentView.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 10.02.2025.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding: Bool = false
    @StateObject private var homeViewModel = HomeViewModel()
    @StateObject private var cartViewModel = CartViewModel()
    @StateObject private var favoriteViewModel = FavoriteViewModel()
        
    var body: some View {
        if hasSeenOnboarding {
            TabView {
                HomeView(viewModel: homeViewModel)
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
        } else {
            OnboardingView(hasSeenOnboarding: $hasSeenOnboarding)
                .ignoresSafeArea()
        }
    }
}
