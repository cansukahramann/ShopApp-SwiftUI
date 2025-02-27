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
                ProductCard(model: cardModel(for: product))
                    .onTapGesture {
                        selectedProduct = product
                    }
            }
        }
    }
    
    private func cardModel(for product: Product) -> ProductCardModel {
        ProductCardModel(image: product.image, title: product.title, rateCount: product.rating?.count ?? 0, price: product.price)
    }
}

#Preview {
    ProductListView(products: [], selectedProduct: .constant(nil))
}
