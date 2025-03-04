//
//  ProductListingView.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 4.03.2025.
//

import SwiftUI

struct ProductListingView: View {
    @StateObject private var viewModel: ProductListingViewModel
    @State private var selectedPorduct: Product?
    @Binding var category: Category?
    
    init(viewModel: @escaping () -> ProductListingViewModel, category: Binding<Category?>) {
        _viewModel = StateObject(wrappedValue: viewModel())
        _category = category
    }
    
    var body: some View {
        ZStack {
            switch viewModel.viewState {
            case .loading:
                LoadingIndicatorView()
                
            case .display(let products):
                ProductListView(products: products, selectedProduct: $selectedPorduct)
                
            case .displayError(let message):
                ErrorView(message: message)
            }
        }
        .onViewDidLoad {
            viewModel.fetchProducts(for: category)
        }
        .onChange(of: category) { _, newValue in
            viewModel.fetchProducts(for: newValue)
        }
        .navigationDestination(item: $selectedPorduct) { product in
            ProductDetailViewFactory.makeProductDetailView(product.id)
        }
    }
    
    private func cardModel(for product: Product) -> ProductCardModel {
        ProductCardModel(image: product.image, title: product.title, rate: product.rating?.rate ?? 0, rateCount: product.rating?.count ?? 0, price: product.price)
    }
}
