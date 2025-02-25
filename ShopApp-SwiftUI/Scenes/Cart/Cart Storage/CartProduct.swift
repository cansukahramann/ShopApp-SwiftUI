//
//  CartProduct.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 23.02.2025.
//

import Foundation

typealias SharedProduct = Product

struct CartProduct: Codable, Hashable {
    struct Product: Codable, Hashable {
        let id: Int
        let title: String
        let price: Double
        let image: String
        
        init(id: Int, title: String, price: Double, image: String) {
            self.id = id
            self.title = title
            self.price = price
            self.image = image
        }
        
        init(_ product: SharedProduct) {
            id = product.id
            title = product.title
            price = product.price
            image = product.image
        }
    }
    
    let product: Product
    var quantity: Int
    
    var totalPrice: Double {
        product.price * Double(quantity)
    }
    
    func increaseQuantity() -> CartProduct {
        CartProduct(product: product, quantity: quantity + 1)
    }
    
    func decreaseQuantity() -> CartProduct {
        CartProduct(product: product, quantity: quantity - 1)
    }
}
