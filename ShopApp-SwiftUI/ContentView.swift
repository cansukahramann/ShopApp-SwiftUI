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
    
    @State private var showOnboard: Bool = true
    
    var body: some View {
        if showOnboard {
            OnboardView(showOnboard: $showOnboard)
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
                ProfileView(viewModel: profileViewModel)
                    .tabItem {
                        Image(systemName: "person")
                        Text("Profile")
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
        VStack {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(height: UIScreen.main.bounds.height * 0.3)
                .ignoresSafeArea(edges: .top)
                
        }
    }
}

struct LastOnboardScreen: View {
    
    @Binding var showOnboard: Bool
    
    var body: some View {
        ZStack {
            Image("OnboardView3")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(.all)
            
            VStack() {
                Spacer()
                Button {
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
