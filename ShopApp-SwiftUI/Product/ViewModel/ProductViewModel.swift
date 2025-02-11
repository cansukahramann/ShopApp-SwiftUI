//
//  ProductViewModel.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 11.02.2025.
//

import Foundation
class ProductViewModel: ObservableObject {
    @Published var product: [Product] = [
        Product(name: "Women's Clothing", price: 29.99, image: "womenClothing"),
        Product(name: "Women's Clothing", price: 34.99, image: "womenClothing2"),
        Product(name: "Men's Clothing", price: 39.99, image: "menClothing1"),
        Product(name: "Men's Clothing", price: 49.99, image: "menClothing"),
        Product(name: "Jewelry", price: 19.99, image: "jewelery"),
        Product(name: "Jewelry", price: 24.99, image: "jewelery1"),
        Product(name: "Electronics", price: 89.99, image: "electronics2"),
        Product(name: "Electronics", price: 99.99, image: "electronics")
    ]
}
