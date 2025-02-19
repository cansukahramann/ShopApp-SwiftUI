//
//  ProductListView.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 10.02.2025.
//

import SwiftUI

struct ProductListView: View {
    let products: [Product]
    @Binding var selectedProduct: Product?
    
    private let columns: [GridItem] = [
        .init(.flexible(), spacing: 10),
        .init(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(products, id: \.self) { product in
                ProductCard(product: product)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        selectedProduct = product
                    }
            }
        }
    }
}

#Preview {
    ProductListView(products: [], selectedProduct: .constant(nil))
}
