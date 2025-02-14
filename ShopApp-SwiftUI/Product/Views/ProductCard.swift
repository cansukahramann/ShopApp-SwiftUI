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
        VStack(alignment: .leading) {
            ZStack(alignment: .topTrailing) {
                Image(product.image)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 180)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                
                FavoriteButton(product: product)
            }
            
            VStack(alignment: .leading) {
                
                RatingView()
                
                Text(product.title)
                    .font(.footnote)
                    .fontWeight(.semibold)
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
            .padding()
        }
        .overlay(content: {
            RoundedRectangle(cornerRadius: 12)
                .stroke(lineWidth: 1)
                .fill(Color(.lightGray))
                .shadow(radius: 5)
        })
        
        .frame(maxWidth: .infinity)
       
        
    }
}

extension View {
    func debugBackground(_ color: Color = .red) -> some View {
        self.background(color)
    }
}

#Preview {
    ProductCard(product: Product(title: "Apple Watch", price: 699, image: "electronics", category: "Electronics", description: "sdlsdlsldlsdlsldldlsldlsdlsdllsdlsdlsldlds", rating: Rating(rate: 5.0, count: 5)))
}
