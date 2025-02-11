//
//  ProductCard.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 11.02.2025.
//

import SwiftUI

struct ProductCard: View {
    
    let product: Product
    @State private var likedProducts = [String : Bool]()
    
    var body: some View {
        Button {
            
        } label: {
            VStack {
                ZStack(alignment: .topTrailing) {
                    Image(product.image)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 180)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    
                    Button {
                        likedProducts[product.image, default: false].toggle()
                    } label: {
                        Image(systemName: likedProducts[product.image, default: false] ? "heart.fill" : "heart")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.red)
                            .padding(8)
                    }
                }
                
                Text(product.name)
                    .font(.headline)
                    .padding(.top, 5)
                    .foregroundStyle(.black)
                
                Text("$\(product.price, specifier:"%.2f")")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
            }
            .frame(maxWidth: .infinity)
            .padding()
        }
    }
}

extension View {
    func debugBackground(_ color: Color = .red) -> some View {
        self.background(color)
    }
}

#Preview {
    ProductCard(product: Product(name: "Apple Watch", price: 699, image: "electronics"))
}
