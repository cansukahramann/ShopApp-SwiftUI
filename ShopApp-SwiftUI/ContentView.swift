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

    @State private var selectedTab: Tab = .home
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                switch selectedTab {
                case .home:
                    HomeView(viewModel: homeViewModel)
                case .cart:
                    CartView(viewModel: cartViewModel)
                case .profile:
                    ProfileView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white.ignoresSafeArea())
            ZStack {
                Spacer()
                Rectangle()
                    .fill(Color.white)
                    .frame(height: 100)
                    .ignoresSafeArea(.container, edges: .bottom)
                
                CustomTabBarView(selectedTab: $selectedTab)
                    .frame(maxWidth: .infinity)
                    .background(Color.white, in: RoundedRectangle(cornerRadius: 20))
                    .shadow(radius: 10)
                    .padding(.bottom, 20)
            }
        }

        .ignoresSafeArea(.container, edges: .all)
    }
}

#Preview {
    ContentView()
}
