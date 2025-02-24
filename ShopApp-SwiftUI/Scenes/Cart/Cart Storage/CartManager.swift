//
//  CartManager.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 23.02.2025.
//

import Foundation

final class CartManager {
    private(set) var products: [CartProduct] = []
    static let shared = CartManager()
    
    private let fileManager = FileManager.default
    private lazy var storeURL = fileManager.urls(for: .documentationDirectory, in: .userDomainMask)[0].appending(path: "shop.store")
    
    private init() {
        loadFromDisk()
    }
    
    func addToCart(_ product: CartProduct.Product) {
        performOperationThenSave {
            products.append(CartProduct(product: product, quantity: 1))
        }
    }
    
    func update(_ cartProduct: CartProduct) {
        performOperationThenSave {
            guard let index = products.firstIndex(where: {$0.product.id == cartProduct.product.id }) else { return }
            products[index] = cartProduct
        }
    }
    
    func removeFromCart(_ product: CartProduct.Product) {
        performOperationThenSave {
            products.removeAll(where: {$0.product.id == product.id })
        }
    }
    
    func isInCart(_ productID: Int) -> Bool {
        products.contains(where: { $0.product.id == productID })
    }
    
    private func performOperationThenSave(_ operation: () -> Void) {
        operation()
        saveToDisk()
    }
    
    private func loadFromDisk() {
        guard
            let data = try? Data(contentsOf: storeURL),
            let cartProduct = try? JSONDecoder().decode([CartProduct].self, from: data) else { return }
        
        self.products = cartProduct
    }
    
    private func saveToDisk() {
        guard
            let data = try? JSONEncoder().encode(products) else { return }
        try? fileManager.createDirectory(at: storeURL.deletingLastPathComponent(), withIntermediateDirectories: true)
        try? data.write(to: storeURL)
    }
}
