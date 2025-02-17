//
//  ProductResponseModel.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 17.02.2025.
//

import Foundation

struct ProductResponseModel: Decodable {
    struct Rating: Decodable {
        let rate: Double
        let count: Int
    }
    
    let id: Int
    let title: String
    let price: Double
    let image: String
    let category: String
    let description: String
    let rating: Rating
}
