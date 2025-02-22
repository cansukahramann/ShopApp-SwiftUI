//
//  CartResponseModel.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 22.02.2025.
//

import Foundation

struct CartResponseModel: Codable {
    struct Products: Codable {
        let productId: Int
    }
    
    let id: Int
    let userId: Int
    let product: [Products]
}

typealias CartsResponseModels = [CartResponseModel]
