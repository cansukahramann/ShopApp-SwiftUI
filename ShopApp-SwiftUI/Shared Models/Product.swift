//
//  Product.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 11.02.2025.
//

import Foundation

struct Product: Hashable, Identifiable {
    let id: Int
    let title: String
    let price: Double
    let image: String
    let category: String?
    let description: String?
    let rating: Rating?
    
    init(id: Int, title: String, price: Double, image: String, category: String?, description: String?, rating: Rating?) {
        self.id = id
        self.title = title
        self.price = price
        self.image = image
        self.category = category
        self.description = description
        self.rating = rating
    }
}

extension Product {
    init(_ response: ProductResponseModel) {
        self.id = response.id
        self.title = response.title
        self.price = response.price
        self.image = response.image
        self.category = response.category
        self.description = response.description
        self.rating = Rating(response.rating)
    }
}

fileprivate extension Rating {
    init(_ response: ProductResponseModel.Rating) {
        rate = response.rate
        count = response.count
    }
}

