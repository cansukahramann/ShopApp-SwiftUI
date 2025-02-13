//
//  Product.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 11.02.2025.
//

import Foundation

class Product: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var price: Double
    var image: String
    
    init(id: UUID = UUID() ,name: String, price: Double, image: String) {
        self.id = id
        self.name = name
        self.price = price
        self.image = image
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Product, rhs: Product) -> Bool {
        return lhs.id == rhs.id
    }
}
