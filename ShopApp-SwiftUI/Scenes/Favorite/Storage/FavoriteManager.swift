//
//  FavoriteManager.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 24.02.2025.
//

import Foundation

final class FavoriteManager {
    static let shared = FavoriteManager()
    private(set) var favorites: [FavoriteProduct] = []
    
    private let fileManager = FileManager.default
    private lazy var storeURL = fileManager.urls(for: .documentationDirectory, in: .userDomainMask)[0].appending(path: "shop.store")
    
    private init() {
        loadFromDisk()
    }
    
    func isFavorite(id: Int) -> Bool {
        favorites.first { $0.id == id } != nil
    }
    
    func toggleFavoriteState(_ favoriteProduct: FavoriteProduct) {
        if isFavorite(id: favoriteProduct.id) {
            removeFavorite(favoriteProduct)
        } else {
            addToFavorite(favoriteProduct)
        }
        
        saveToDisk()
    }
    
    private func addToFavorite( _ favoriteProduct: FavoriteProduct) {
        favorites.append(favoriteProduct)
        saveToDisk()
    }
    
    private func removeFavorite( _ favoriteProduct: FavoriteProduct) {
        favorites.removeAll { $0 == favoriteProduct }
        saveToDisk()
    }
    
    private func loadFromDisk() {
        guard
            let data = try? Data(contentsOf: storeURL),
            let favorites = try? JSONDecoder().decode([FavoriteProduct].self, from: data) else { return }
        self.favorites = favorites
    }
    
    private func saveToDisk() {
        guard
            let data = try? JSONEncoder().encode(favorites) else { return }
        try? fileManager.createDirectory(at: storeURL.deletingLastPathComponent(), withIntermediateDirectories: true)
        try? data.write(to: storeURL)
    }
}
