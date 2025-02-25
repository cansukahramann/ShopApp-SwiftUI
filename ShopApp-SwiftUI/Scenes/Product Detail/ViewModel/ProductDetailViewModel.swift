//
//  ProductDetailViewModel.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 19.02.2025.
//

import Foundation

final class ProductDetailViewModel: ObservableObject {
    @Published private(set) var isInCart = false
    @Published private(set) var isFavorite: Bool = false

    let product: Product
    
    init(product: Product) {
        self.product = product
        isInCart = CartManager.shared.isInCart(product.id)
    }
    
    func addToCart() {
        CartManager.shared.addToCart(.init(product))
        isInCart = CartManager.shared.isInCart(product.id)
    }
    
    func toggleFavoriteState() {
        
        FavoriteManager.shared.toggleFavoriteState(FavoriteProduct(product))
        isFavorite = FavoriteManager.shared.isFavorite(id: product.id)
    }
}
