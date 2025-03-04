//
//  ProductDetailView.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 11.02.2025.
//

import SwiftUI
import Kingfisher

struct ProductDetailView: View {
    @StateObject private var viewModel: ProductDetailViewModel
    
    init(viewModel: @escaping () -> ProductDetailViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel())
    }
    
    var body: some View {
        ZStack {
            switch viewModel.viewState {
            case .loading:
                LoadingIndicatorView()
                
            case .display(let product):
                view(product)
                
            case .displayError(let message):
                ErrorView(message: message)
            }
        }.onViewDidLoad {
            viewModel.fetchProduct()
        }
    }
    
    func view(_ product: Product) -> some View {
        GeometryReader { geo in
            ScrollView {
                KFImage(URL(string: product.image))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 250)
                
                VStack {
                    ProductHeaderView(product: product)
                    
                    Divider()
                    
                    ProductDescriptionView(description: product.description!)
                        .padding(2)
                    
                    Divider()
                    
                }
            }
            .navigationBarItems(trailing: FavoriteButton(isFavorite: viewModel.isFavorite, onButtonTap: {
                viewModel.toggleFavoriteState()
            }))
            .safeAreaInset(edge: .bottom) {
                AddToCardButtonView(isInCart: viewModel.isInCart) {
                    viewModel.addToCart()
                }
            }
        }
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
            
            Text(product.category!)
                .font(.title3)
                .foregroundStyle(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                PriceView(price: product.price)
                Spacer()
                RatingView(rate: product.rating!.rate, count: product.rating!.count)
                    .padding()
            }
            
        }
        .padding(.leading, 6)
    }
}

struct ProductDescriptionView: View {
    let description: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(description)
                .font(.body)
                .fontWeight(.semibold)
                .foregroundStyle(.black)
                .lineSpacing(8)
        }
    }
}

struct AddToCardButtonView: View {
    let isInCart: Bool
    let action: () -> Void
    
    var body: some View {
        Rectangle()
            .fill(.white)
            .ignoresSafeArea()
            .frame(maxWidth: .infinity)
            .frame(height: 70)
            .overlay {
                Button {
                    action()
                } label: {
                    Text(isInCart ? "Added to Cart" : "Add to Cart")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 380, height: 50)
                        .background(isInCart ? Color.gray : .brown)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .shadow(color: isInCart ? .gray : .brown, radius: 8)
                }
                .disabled(isInCart)
            }
    }
}
