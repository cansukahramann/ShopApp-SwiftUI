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
            ZStack(alignment: .bottom) {
                ScrollView {
                    VStack() {
                        ZStack(alignment: .topTrailing) {
                            
                            KFImage(URL(string: product.image))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: geo.size.width, height: 392)
                                .shadow(radius: 5)
                                .clipShape(Rectangle())
                                .clipped()
                            
                            FavoriteButton(isFavorite: Bool.random()) {}
                                .padding()
                        }
                        
                        ProductHeaderView(product: product)
                        Divider()
                        
                        
                        
                        ProductDescriptionView(product: product)
                        Divider()
                       
                    }
                }
    
            }
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

struct StepperView: View {
    let product: Product
    @Binding var digitData: Int

    var body: some View {
        HStack() {
            
        
            
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
    }
}

struct ProductHeaderView: View {
    let product: Product
    var body: some View {
        VStack(spacing: 12) {
            Text(product.title)
                .font(.title)
                .fontWeight(.semibold)
                .foregroundStyle(Color.customNavyBlue)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(product.category)
                .font(.title3)
                .foregroundStyle(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
           
            
            Text("$\(product.price, specifier:"%.2f")")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundStyle(Color.customAppColor)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.leading, 6)
    }
}

struct ProductDescriptionView: View {
    
    @StateObject var viewModel: ProductDetailViewModel = .init()
    let product: Product

    var body: some View {
        VStack {
            HStack {
                Text("Product Detail")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.customNavyBlue)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Button {
                    viewModel.showDetail()
                } label: {
                    Image(systemName: viewModel.isShowDetail ? "chevron.down" :  "chevron.right")
                        .frame(width: 20, height: 20)
                        .padding(15)
                }
                .foregroundStyle(Color.primary)
            }
            
            if(viewModel.isShowDetail) {
                Text(product.description)
                    .font(.title3)
                    .foregroundStyle(.gray)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 20)
            }
                
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
                            .foregroundStyle(Color.customNavyBlue)
                
        
                    Button {
                        isInCart = true
                    } label: {
                        Text("Add to Cart")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(width: 280, height: 50)
                            .background(isInCart ? Color.gray : Color.customAppColor)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .shadow(color: isInCart ? .gray : Color.customAppColor, radius: 8)
                    }
                    .disabled(isInCart)
                }
            }
    }
}
