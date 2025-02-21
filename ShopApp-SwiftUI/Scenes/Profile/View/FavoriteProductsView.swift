//
//  FavoriteProductsView.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 14.02.2025.
//

import SwiftUI

struct FavoriteProductsView: View {
    let product: [Product]
    @Binding var selectedProduct: Product?
    private let columns: [GridItem] = [
        .init(.flexible(), spacing: 10, alignment: .leading),
        .init(.flexible(), spacing: 0, alignment: .trailing)
    ]
    
    var body: some View {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(product, id: \.self) { product in
                    ProductCard(product: product)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 1.0)) {
                                selectedProduct = product
                            }
                        }
                }
        }
    }
}
