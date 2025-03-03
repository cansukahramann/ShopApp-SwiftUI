//
//  PromotedProductsView.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 3.03.2025.
//

import SwiftUI

struct PromotedProductsView: View {
    @StateObject private var viewModel: PromotedProductsViewModel
    @State private var selectedProduct: Product?
    
    init(viewModel: PromotedProductsViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ZStack {
            switch viewModel.viewState {
            case .loading:
                LoadingIndicatorView()
                
            case .display(let products):
                ScrollView {
                    ProductListView(products: products, selectedProduct: $selectedProduct)
                        .padding([.leading, .trailing], 16)
                }
                
            case .displayError(let message):
                ErrorView(message: message)
            }
        }
        .onViewDidLoad {
            viewModel.loadProducts()
        }
        .navigationDestination(item: $selectedProduct) { product in
            ProductDetailViewFactory.makeProductDetailView(product.id)
        }
        .navigationTitle("Promoted Products")
    }
}

#Preview {
    PromotedProductsViewFactory.makePreviewView()
}
