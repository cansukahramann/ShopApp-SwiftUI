//
//  Product.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 11.02.2025.
//

import Foundation

class Product: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var price: Double
    var image: String
    var category: String
    var description: String
    var rating: Rating
    
    init(id: UUID = UUID() ,title: String, price: Double, image: String, category: String, description: String, rating: Rating) {
        self.id = id
        self.title = title
        self.price = price
        self.image = image
        self.category = category
        self.description = description
        self.rating = rating
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Product, rhs: Product) -> Bool {
        return lhs.id == rhs.id
    }
}

struct Rating: Codable, Hashable {
    let rate: Double
    let count: Int
}

