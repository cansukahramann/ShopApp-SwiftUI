//
//  ProductDetailView.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 11.02.2025.
//

import SwiftUI
import Kingfisher

struct ProductDetailView: View {
    let product: Product
    @State private var isPressed = false
    @State private var isBouncing = false
    @StateObject var viewModel: ProductDetailViewModel = .init()
    @State private var isInCart: Bool = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack() {

                ScrollView {
                        KFImage(URL(string: product.image))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .ignoresSafeArea(edges: .top)
                        
                    VStack {
                        ProductHeaderView(product: product)
                        Divider()
                        
                        ProductDescriptionView(product: product)
                        Divider()
                        
                    }
                }
                
            }

            .navigationBarItems(trailing: FavoriteButton(isFavorite: .random(), onButtonTap: {
            }))
            .safeAreaInset(edge: .bottom) {
                AddToCardButtonView(isInCart: $isInCart)
            }
        }
    }
    
}

#Preview {
    ProductDetailView(product: Product(
        id: 1,
        title: "Apple Watch",
        price: 699,
        image: "electronics",
        category: "Electronics",
        description: "sdlsdlsldlsdlsldldlsldlsdlsdllsdlsdlsldlds",
        rating: Rating(rate: 5.0, count: 5)
    ))
}

struct PriceView: View {
    let product: Product
    
    var body: some View {
        Text("$\(product.price, specifier:"%.2f")")
            .font(.title3)
            .fontWeight(.semibold)
            .foregroundStyle(.red)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct ProductHeaderView: View {
    let product: Product
    var body: some View {
        VStack(spacing: 12) {
            Text(product.title)
                .font(.title)
                .fontWeight(.semibold)
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(product.category)
                .font(.title3)
                .foregroundStyle(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                PriceView(product: product)
                Spacer()
                RatingView(product: product)
                    .padding()
            }
         
        }
        .padding(.leading, 6)
    }
}

struct ProductDescriptionView: View {
    
    @StateObject var viewModel: ProductDetailViewModel = .init()
    let product: Product
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(product.description)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                    .lineSpacing(8)
                    .opacity(0.6)
        }
    }
}


struct AddToCardButtonView: View {
    
    @Binding var isInCart: Bool
    
    var body: some View {
        Rectangle()
            .fill(.white)
            .ignoresSafeArea()
            .frame(maxWidth: .infinity)
            .frame(height: 70)
            .overlay {
                HStack(spacing: 12) {
                    Image(systemName: isInCart ? "cart.fill" : "cart")
                        .font(.title)
                        .frame(width: 45, height: 45)
                        .foregroundStyle(.black)
                    
                    
                    Button {
                        isInCart = true
                    } label: {
                        Text("Add to Cart")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(width: 280, height: 50)
                            .background(isInCart ? Color.gray : .brown)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .shadow(color: isInCart ? .gray : .brown, radius: 8)
                    }
                    .disabled(isInCart)
                }
            }
    }
}
