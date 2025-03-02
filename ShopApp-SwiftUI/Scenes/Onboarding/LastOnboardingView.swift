//
//  LastOnboardingView.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 3.03.2025.
//

import SwiftUI

struct LastOnboardingScreen: View {
    
    @Binding var hasSeenOnboarding: Bool
    
    var body: some View {
        ZStack {
                Image("OnboardView3")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
              
            VStack() {
                Spacer()
                
                Button {
                    hasSeenOnboarding = true
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
