//
//  ProductDetailView.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 11.02.2025.
//

import SwiftUI

struct ProductDetailView: View {
    
    let product: Product
    @State private var isPressed = false
    @State private var isBouncing = false
    @State var digitData = 0
    
    var body: some View {
        ScrollView {
            VStack {
                ZStack(alignment: .topTrailing) {
                    Image(product.image)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 392)
                        .shadow(radius: 5)
                        .clipShape(Rectangle())
                    
                    FavoriteButton(product: product)
                        .padding()
                }
                
                HStack(spacing: 5) {
                    Text(product.title)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.customNavyBlue)
                    
                    Spacer()
                    
                    Text(product.category)
                        .font(.title3)
                        .foregroundStyle(.gray)
                   
                }
                .padding()
                
                HStack() {
                    
                    Text("$\(product.price, specifier:"%.2f")")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.customAppColor)
                    Spacer()
                    Button {
                        guard digitData > 0 else { return }
                        digitData -= 1
                    } label: {
                        Image(systemName: "minus")
                            .font(.footnote)
                            .foregroundStyle(Color.white)
                            .padding(10)
                            .background {
                                Circle()
                                    .fill(Color.accentColor)
                                    .frame(width: 28, height: 28)
                            }
                    }
                    
                    Text("\(digitData)")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.customNavyBlue)
                    Button {
                        digitData += 1
                    } label: {
                        Image(systemName: "plus")
                            .font(.footnote)
                            .foregroundStyle(Color.white)
                            .padding(10)
                            .background {
                                Circle()
                                    .fill(Color.accentColor)
                                    .frame(width: 28, height: 28)
                            }
                    }
                }
                .padding()
                
                Text("Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday essentials in the main compartment, and enjoy the comfort and durability for all-day adventures.")
                    .font(.title3)
                    .foregroundStyle(.gray)
                    .padding()
                Button {
                    
                } label: {
                    Text("Add to Cart")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 350, height: 50)
                        .background(.accent)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .shadow(color: .accent, radius: 8)
                }
            }
        }
    }

}

#Preview {
    ProductDetailView(product: Product(
        title: "Apple Watch",
        price: 699,
        image: "electronics",
        category: "Electronics",
        description: "sdlsdlsldlsdlsldldlsldlsdlsdllsdlsdlsldlds",
        rating: Rating(rate: 5.0, count: 5)
    ))
}
