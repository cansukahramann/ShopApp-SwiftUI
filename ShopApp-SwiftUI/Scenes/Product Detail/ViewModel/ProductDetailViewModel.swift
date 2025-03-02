//
//  ProductDetailViewModel.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 19.02.2025.
//

import Foundation

final class ProductDetailViewModel: ObservableObject {
    @Published var isLoading = false
    @Published private(set) var isInCart: Bool
    @Published private(set) var isFavorite: Bool
    @Published private(set) var product: Product?
    
    private let id: Int
    private let dataLoader: DetailDataLoader
    
    init(id: Int, dataLoader: DetailDataLoader) {
        self.id = id
        self.dataLoader = dataLoader
        
        isInCart = CartManager.shared.isInCart(id)
        isFavorite = FavoriteManager.shared.isFavorite(id: id)
    }
 
    func fetchProduct() {
        isLoading = true
        dataLoader.fetchProductDetail { [weak self] result in
            switch result {
            case .success(let product):
                self?.product = product
                
            case .failure(let error):
                print(error)
            }
            self?.isLoading = false
        }
    }
    
    func addToCart() {
        guard let product else { return }
        CartManager.shared.addToCart(.init(product))
        isInCart = CartManager.shared.isInCart(product.id)
    }
    
    func toggleFavoriteState() {
        guard let product else { return }
        FavoriteManager.shared.toggleFavoriteState(FavoriteProduct(product))
        isFavorite = FavoriteManager.shared.isFavorite(id: product.id)
    }
}
