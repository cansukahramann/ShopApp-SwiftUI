//
//  Cart.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 22.02.2025.
//

import Foundation

struct Cart: Hashable, Identifiable {
    let id: Int
    let userId: Int
    let products: [Products]
    
    init(id: Int, userId: Int, products: [Products]) {
        self.id = id
        self.userId = userId
        self.products = products
    }
}

extension Cart {
    init(_ response: CartResponseModel) {
        self.id = response.id
        self.userId = response.userId
        self.products = response.product.map { Products($0) }
    }
}

fileprivate extension Products {
    init( _ response: CartResponseModel.Products) {
        productId = response.productId

    }
}

struct Products: Hashable {
    let productId: Int
}
