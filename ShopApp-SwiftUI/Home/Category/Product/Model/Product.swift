//
//  Product.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 11.02.2025.
//

import Foundation

class Product: Identifiable {
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
}
