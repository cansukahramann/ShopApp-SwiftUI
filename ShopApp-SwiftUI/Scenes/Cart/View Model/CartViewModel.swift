//
//  CartViewModel.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 20.02.2025.
//

import Foundation

final class CartViewModel: ObservableObject {
    @Published private(set) var products: [CartProduct] = []
    
    init() {
        products = CartManager.shared.products
    }
    
    func refresh() {
        products = CartManager.shared.products
    }
    
    func remove(_ product: CartProduct.Product) {
        CartManager.shared.removeFromCart(product)
        refresh()
    }
    
    func update(_ cartProduct: CartProduct) {
        CartManager.shared.update(cartProduct)
        refresh()
    }
    
    func calculateTotalPrice() -> Double {
        return products.reduce(0) { $0 + ($1.product.price * Double($1.quantity)) }
    }
}
