//
//  LastOnboardingView.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 3.03.2025.
//

import SwiftUI

struct LastOnboardingScreen: View {
    
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
