//
//  ContentView.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 10.02.2025.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding: Bool = false
    @StateObject private var cartViewModel = CartViewModel()
    @StateObject private var favoriteViewModel = FavoriteViewModel()
    
    var body: some View {
        if hasSeenOnboarding {
            MainTabView(cartViewModel: cartViewModel, favoriteViewModel: favoriteViewModel)
        } else {
            OnboardingView(hasSeenOnboarding: $hasSeenOnboarding)
                .ignoresSafeArea()
        }
    }
}

struct MainTabView: View {
    @ObservedObject var cartViewModel: CartViewModel
    @ObservedObject var favoriteViewModel: FavoriteViewModel
    
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
