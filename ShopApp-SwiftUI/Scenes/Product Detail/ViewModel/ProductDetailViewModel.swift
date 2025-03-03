//
//  ProductDetailViewModel.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 19.02.2025.
//

import Foundation

final class ProductDetailViewModel: ObservableObject {
    @Published var viewState: ViewState<Product> = .loading
    @Published private(set) var isInCart: Bool
    @Published private(set) var isFavorite: Bool
    
    private let id: Int
    private let dataLoader: DetailDataLoader
    private let cartManager: CartManager
    private let favoriteManager: FavoriteManager
    
    init(id: Int, dataLoader: DetailDataLoader, cartManager: CartManager, favoriteManager: FavoriteManager) {
        self.id = id
        
        self.dataLoader = dataLoader
        self.cartManager = cartManager
        self.favoriteManager = favoriteManager
        
        isInCart = cartManager.isInCart(id)
        isFavorite = favoriteManager.isFavorite(id: id)
    }
    
    func fetchProduct() {
        viewState = .loading
        dataLoader.fetchProductDetail { [weak self] result in
            switch result {
            case .success(let product):
                self?.viewState = .display(product)
                
            case .failure(let error):
                self?.viewState = .displayError(error.localizedDescription)
            }
        }
    }
    
    func addToCart() {
        guard case let .display(product) = viewState else { return }
        cartManager.addToCart(.init(product))
        isInCart = cartManager.isInCart(product.id)
    }
    
    func toggleFavoriteState() {
        guard case let .display(product) = viewState else { return }
        favoriteManager.toggleFavoriteState(FavoriteProduct(product))
        isFavorite = favoriteManager.isFavorite(id: product.id)
    }
}
