//
//  CartViewModel.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 20.02.2025.
//

import Foundation

final class CartViewModel: ObservableObject {
    @Published private(set) var products: [Product] = [] 
}
