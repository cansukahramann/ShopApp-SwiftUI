//
//  ProductCard.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 11.02.2025.
//

import SwiftUI
import Kingfisher

struct ProductCard: View {
    
    let product: Product
    
    
    var body: some View {
        
        VStack(alignment: .leading) {
            ZStack(alignment: .topTrailing) {
                
                KFImage(URL(string: product.image))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 130, height: 100)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .clipped()
                    .debugBackground()
                
                FavoriteButton(isFavorite: Bool.random()) {}
            }
            
            VStack(alignment: .leading) {
                
                RatingView(product: product)
                
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
            Spacer()
        }
        .frame(width: 180)
    }
    
}



#Preview {
    ProductCard(product: Product(id: 1, title: "Apple Watch", price: 699, image: "electronics", category: "Electronics", description: "sdlsdlsldlsdlsldldlsldlsdlsdllsdlsdlsldlds", rating: Rating(rate: 5.0, count: 5)))
}
