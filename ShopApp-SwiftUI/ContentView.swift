//
//  ContentView.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 10.02.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var homeViewModel = HomeViewModel()
    @StateObject private var cartViewModel = CartViewModel()
    @StateObject private var favoriteViewModel = FavoriteViewModel()
    
    @State private var showOnboard: Bool =  UserDefaults.standard.bool(forKey: "hasSeenOnboarding")
    
    var body: some View {
        if showOnboard {
            OnboardingView(showOnboard: $showOnboard)
                .ignoresSafeArea()
        } else {
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
        }
        
    }
}
