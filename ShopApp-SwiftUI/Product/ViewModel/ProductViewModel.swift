//
//  ProductViewModel.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 11.02.2025.
//

import Foundation
class ProductViewModel: ObservableObject {
    @Published var product: [Product] = [
        Product(title: "Women's Clothing", price: 29.99, image: "womenClothing", category: "Clothing", description: "Elegant women's clothing for everyday wear.", rating: Rating(rate: 4.5, count: 120)),
           Product(title: "Women's Clothing", price: 34.99, image: "womenClothing2", category: "Clothing", description: "Stylish women's fashion piece.", rating: Rating(rate: 4.7, count: 98)),
           Product(title: "Men's Clothing", price: 39.99, image: "menClothing1", category: "Clothing", description: "Casual men's wear for all occasions.", rating: Rating(rate: 4.2, count: 85)),
           Product(title: "Men's Clothing", price: 49.99, image: "menClothing", category: "Clothing", description: "Formal men's wear with high-quality fabric.", rating: Rating(rate: 4.8, count: 110)),
           Product(title: "Jewelry", price: 19.99, image: "jewelery", category: "Accessories", description: "Beautiful handcrafted jewelry.", rating: Rating(rate: 4.6, count: 67)),
           Product(title: "Jewelry", price: 24.99, image: "jewelery1", category: "Accessories", description: "Elegant gold-plated jewelry.", rating: Rating(rate: 4.9, count: 45)),
           Product(title: "Electronics", price: 89.99, image: "electronics2", category: "Electronics", description: "High-performance electronic gadget.", rating: Rating(rate: 4.3, count: 200)),
           Product(title: "Electronics", price: 99.99, image: "electronics", category: "Electronics", description: "Latest model electronic device.", rating: Rating(rate: 4.7, count: 175))
       ]
}
