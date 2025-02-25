//
//  FavoriteManager.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 24.02.2025.
//

import Foundation

struct FavoriteProduct: Hashable, Codable {
    let id: Int
    let name: String
    let price: Double
    let rateCount: Int?
    let rate: Double?
    
    init(_ product: Product) {
        id = product.id
        name = product.title
        price = product.price
        rateCount = product.rating?.count
        rate = product.rating?.rate
    }
}

final class FavoriteManager {
    static let shared = FavoriteManager()
    
    private var favorites: [FavoriteProduct] = []
    
    private let fileManager = FileManager.default
    private lazy var storeURL = fileManager.urls(for: .documentationDirectory, in: .userDomainMask)[0].appending(path: "shop.store")
    
    private init() {
        loadFromDisk()
    }
    
    func isFavorite(id: Int) -> Bool {
        favorites.first { $0.id == id } != nil
    }
    
    private func addToFavorite( _ favoriteProduct: FavoriteProduct) {
        favorites.append(favoriteProduct)
        saveToDisk()
    }
    
    private func removeFavorite( _ favoriteProduct: FavoriteProduct) {
        favorites.removeAll { $0 == favoriteProduct }
        saveToDisk()
    }
    
    func toggleFavoriteState(_ favoriteProduct: FavoriteProduct) {
        if isFavorite(id: favoriteProduct.id) {
            removeFavorite(favoriteProduct)
        } else {
            addToFavorite(favoriteProduct)
        }
        saveToDisk()
    }
    
    private func loadFromDisk() {
        let data = try! Data(contentsOf: storeURL)
        let decoder = JSONDecoder()
        favorites = try! decoder.decode([FavoriteProduct].self, from: data)
    }
    
    private func saveToDisk() {
        guard
            let data = try? JSONEncoder().encode(favorites) else { return }
        try? fileManager.createDirectory(at: storeURL.deletingLastPathComponent(), withIntermediateDirectories: true)
        try? data.write(to: storeURL)
    }
}
