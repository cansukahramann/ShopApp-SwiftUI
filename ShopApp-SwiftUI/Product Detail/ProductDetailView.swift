//
//  ProductDetailView.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 11.02.2025.
//

import SwiftUI

struct ProductDetailView: View {
    
    let product: Product
    @State private var likedProducts = [String : Bool]()
    
    var body: some View {
        ScrollView {
            VStack {
                ZStack(alignment: .topTrailing) {
                    Image(product.image)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 450)
                        .shadow(radius: 5)
                        .clipShape(Rectangle())
                      
                    FavoriteButton(product: product)
                        .padding()
                }
                
                HStack(spacing: 5) {
                    Text(product.name)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.customNavyBlue)
                    
                    Spacer()
                    
                    Text("$\(product.price, specifier:"%.2f")")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.customAppColor)
                }
                .padding()
            }
        }
    }
}

#Preview {
    ProductDetailView(product: Product(name: "Apple Watch", price: 699, image: "electronics"))
}
