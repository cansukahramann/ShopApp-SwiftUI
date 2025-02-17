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
            .padding()
        }
    }
}
//
//#Preview {
//    FavoriteProductsView(product: [
//        Product(
//            id:
//            title: "iPhone 15",
//            price: 999.99,
//            image: "https://example.com/iphone15.jpg",
//            category: "Electronics",
//            description: "Apple'ın en yeni akıllı telefonu.",
//            rating: Rating(rate: 4.8, count: 1200)
//        ),
//        Product(
//            title: "MacBook Air",
//            price: 1299.99,
//            image: "https://example.com/macbook.jpg",
//            category: "Computers",
//            description: "M2 çipli yeni MacBook Air.",
//            rating: Rating(rate: 4.9, count: 800)
//        )
//    ],
//    selectedProduct: .constant(nil)
//)
//}
