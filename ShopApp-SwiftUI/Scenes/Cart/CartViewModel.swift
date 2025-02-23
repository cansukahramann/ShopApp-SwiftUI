//
//  CartViewModel.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 20.02.2025.
//

import Foundation

final class CartViewModel: ObservableObject {
    @Published private(set) var products: [Product] = []
    
    init() {
        self.products = CartManager.shared.products.map { Product(id: $0.product.id, title: $0.product.title, price: $0.product.price, image: $0.product.image, category: nil, description: nil, rating: nil)}
        
        NotificationCenter.default.addObserver(self, selector:  #selector(cartUpdated), name: .cartUpdated, object: nil)
        
        
    }
    
    @objc private func cartUpdated() {
        self.products = CartManager.shared.products.map { Product(id: $0.product.id, title: $0.product.title, price: $0.product.price, image: $0.product.image, category: nil, description: nil, rating: nil)}
    }
    
}

extension Notification.Name {
    
    static let cartUpdated = Notification.Name("cartUpdated")
}
