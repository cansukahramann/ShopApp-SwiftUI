//
//  FavoriteViewModel.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 14.02.2025.
//

import Foundation

final class FavoriteViewModel: ObservableObject {
    @Published private(set) var products: [FavoriteProduct] = []
    
    func refresh() {
        products = FavoriteManager.shared.favorites
    }
    
    func cardModel(for product: FavoriteProduct) -> ProductCardModel {
        ProductCardModel(image: product.image, title: product.name, rateCount: product.rateCount ?? 0, price: product.price)
    }
}
