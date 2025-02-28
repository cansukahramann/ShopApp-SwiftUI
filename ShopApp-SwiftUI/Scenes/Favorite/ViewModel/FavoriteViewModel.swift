//
//  FavoriteViewModel.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 14.02.2025.
//

import Foundation

final class FavoriteViewModel: ObservableObject {
    private var allProducts = [FavoriteProduct]()
    @Published private(set) var products: [FavoriteProduct] = []
    @Published var searchText = "" {
        didSet { filterProductsBySearch() }
    }
    
    var hasNoFavoriteProduct: Bool {
        allProducts.isEmpty
    }
    
    var hasNoResultForSearching: Bool {
        let isSearching = !searchText.isEmpty
        return isSearching && products.isEmpty
    }
    
    func refresh() {
        allProducts = FavoriteManager.shared.favorites
        products = allProducts
    }
    
    func cardModel(for product: FavoriteProduct) -> ProductCardModel {
        ProductCardModel(image: product.image, title: product.name, rateCount: product.rateCount ?? 0, price: product.price)
    }
    
    private func filterProductsBySearch() {
        if searchText.isEmpty {
            products = allProducts
        } else {
            products = allProducts.filter({ $0.name.lowercased().contains(searchText.lowercased()) })
        }
    }
}
