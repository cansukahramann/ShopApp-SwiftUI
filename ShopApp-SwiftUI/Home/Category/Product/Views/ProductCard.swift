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
            VStack(alignment: .leading) {
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
                
                VStack(alignment: .leading) {
                    
                    HStack(spacing: 4) {
                        ForEach(0..<5) { _ in
                            Image(systemName: "star.fill")
                                .frame(width: 12, height: 12)
                                .foregroundStyle(.yellow)
                        }
                        
                        Text("(15)")
                            .foregroundStyle(.gray)
                            .font(.caption)
                    }
                    
                    Text(product.name)
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top, 2)
                        .foregroundStyle(Color.customNavyBlue)
                    
                    HStack {
                        Text("$350")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundStyle(.gray)
                            .strikethrough()
                        
                        Spacer()
                        
                        Text("$\(product.price, specifier:"%.2f")")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.customNavyBlue)
                    }
                }
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
