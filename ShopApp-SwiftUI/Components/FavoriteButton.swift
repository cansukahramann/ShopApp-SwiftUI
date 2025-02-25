//
//  FavoriteButton.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 11.02.2025.
//

import SwiftUI

struct FavoriteButton: View {
    
    let isFavorite: Bool
    let onButtonTap: (() -> Void)

    var body: some View {
        Button {
            onButtonTap()
        } label: {
            Image(systemName: isFavorite ? "heart.fill" : "heart")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundStyle(.red)
                .shadow(radius: 5)
                .padding(8)
                .background {
                    Circle()
                        .foregroundStyle(.white)
                }
        }
    }
}
