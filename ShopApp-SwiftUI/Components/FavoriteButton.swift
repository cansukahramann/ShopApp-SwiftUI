//
//  FavoriteButton.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 11.02.2025.
//

import SwiftUI

struct FavoriteButton: View {
    
    var product: Product
    @State private var likedProducts = [String : Bool]()
    
    var body: some View {
        Button {
            likedProducts[product.image, default: false].toggle()
        } label: {
            Image(systemName: likedProducts[product.image, default: false] ? "heart.fill" : "heart")
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

#Preview {
    FavoriteButton(product: Product(
        title: "Apple Watch",
        price: 699,
        image: "electronics",
        category: "Electronics",
        description: "sdlsdlsldlsdlsldldlsldlsdlsdllsdlsdlsldlds",
        rating: Rating(rate: 5.0, count: 5)
    ))
}
