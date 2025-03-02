//
//  OnboardingView.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 3.03.2025.
//

import SwiftUI

struct OnboardingView: View {
    @Binding var hasSeenOnboarding: Bool
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            OnboardingImageView(imageName: "OnboardView1").tag(0)
            OnboardingImageView(imageName: "OnboardView2").tag(1)
            LastOnboardingScreen(hasSeenOnboarding: $hasSeenOnboarding).tag(2)
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .onAppear { applyPageControlAppearance() }
    }
    
    private func applyPageControlAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .black
        UIPageControl.appearance().pageIndicatorTintColor = .brown
    }
}
