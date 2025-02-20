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
    @StateObject private var profileViewModel = ProfileViewModel()
    
    var body: some View {
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
            ProfileView(viewModel: profileViewModel)
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
    }
}
