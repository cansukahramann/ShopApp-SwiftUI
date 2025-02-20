//
//  CustomTabBarView.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 20.02.2025.
//

import SwiftUI

struct CustomTabBarView: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        HStack {
            ForEach(Tab.allCases, id: \.rawValue) { tab in
                Button {
                    withAnimation(.spring) {
                        selectedTab = tab
                    }
                } label: {
                    Image(systemName: tab.rawValue)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(selectedTab == tab ? Color.customNavyBlue : .gray)
                        .fontWeight(selectedTab == tab ? .bold : .regular)
                }
            }
        }
        .frame(height: 60)
        .background(Color.customAppColor, in: RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 5)
    }
}
