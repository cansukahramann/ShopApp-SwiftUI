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
            OnboardView(showOnboard: $showOnboard)
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

struct OnboardView: View {
    
    @Binding var showOnboard: Bool
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            OnboardScreen(imageName: "OnboardView1")
                .tag(0)
            OnboardScreen(imageName: "OnboardView2")
                .tag(1)
            LastOnboardScreen(showOnboard: $showOnboard)
                .tag(2)
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .onAppear {
            UIPageControl.appearance().currentPageIndicatorTintColor = .black
            UIPageControl.appearance().pageIndicatorTintColor = .brown
        }
    }
}

struct OnboardScreen: View {
    var imageName: String

    var body: some View {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
    }
}

struct LastOnboardScreen: View {
    
    @Binding var showOnboard: Bool
    
    var body: some View {
        ZStack {
                Image("OnboardView3")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
              
            VStack() {
                Spacer()
                Button {
                    UserDefaults.standard.set(true, forKey: "hasSeenOnboarding")
                    showOnboard = false
                } label: {
                    Text("Start Shopping")
                        .fontWeight(.bold)
                        .padding()
                        .frame(width: 200, height: 50)
                        .background(.brown)
                        .foregroundStyle(.white)
                        .clipShape(.buttonBorder)
                        .shadow(radius: 3)
                }
                .padding(.bottom, 100)
                
            }
        }
    }
}
