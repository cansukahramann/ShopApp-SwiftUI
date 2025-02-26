//
//  FavoriteViewModel.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 14.02.2025.
//

import Foundation

class FavoriteViewModel: ObservableObject {
    @Published private(set) var products = [Product]()
}
