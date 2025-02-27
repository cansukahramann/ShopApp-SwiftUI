//
//  FavoriteProductsView.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 14.02.2025.
//

import SwiftUI

struct FavoriteProductsView: View {
    @ObservedObject var viewModel: FavoriteViewModel
    @Binding var selectedProduct: FavoriteProduct?
    
    private let columns: [GridItem] = [
        .init(.flexible(), spacing: 10, alignment: .leading),
        .init(.flexible(), spacing: 0, alignment: .trailing)
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(viewModel.products, id: \.self) { product in
                ProductCard(model: viewModel.cardModel(for: product))
                    .onTapGesture {
                        selectedProduct = product
                    }
            }
        }
    }
}
