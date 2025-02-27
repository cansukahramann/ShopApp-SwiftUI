//
//  FavoriteView.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 13.02.2025.
//

import SwiftUI

struct FavoriteView: View {
    @ObservedObject var viewModel: FavoriteViewModel
    @State private var selectedProduct: FavoriteProduct?
    
    var body: some View {
        VStack {
            if viewModel.products.isEmpty {
                EmptyFavoriteView()
            } else {
                SearchBar(search: .constant(""))
                    .padding()
                
                ScrollView {
                    FavoriteProductsView(viewModel: viewModel, selectedProduct: $selectedProduct)
                }
            }
        }
        .onAppear {
            viewModel.refresh()
        }
        .navigationDestination(item: $selectedProduct) { product in
            ProductDetailView(id: product.id)
        }
    }
}
