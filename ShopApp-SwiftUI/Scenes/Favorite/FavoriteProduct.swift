//
//  FavoriteProduct.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 26.02.2025.
//

import Foundation

struct FavoriteProduct: Hashable, Codable {
    let id: Int
    let image: String
    let name: String
    let price: Double
    let rateCount: Int?
    let rate: Double?
    
    init(_ product: Product) {
        id = product.id
        image = product.image
        name = product.title
        price = product.price
        rateCount = product.rating?.count
        rate = product.rating?.rate
    }
}
