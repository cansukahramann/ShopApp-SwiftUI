//
//  ProductListingViewModel.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 4.03.2025.
//

import Foundation

final class ProductListingViewModel: ObservableObject {
    private let loader: ProductLoader
    private let onLoadFinish: () -> Void
    @Published var viewState: ViewState<[Product]> = ViewState.loading
    
    init(loader: ProductLoader, onLoadFinish: @escaping () -> Void) {
        self.loader = loader
        self.onLoadFinish = onLoadFinish
        
        print("product listing vm init")
    }
    
    func fetchProducts(for category: Category?) {
        viewState = .loading
        
        loader.fetchProducts(for: category) { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let products):
                viewState = .display(products)
                onLoadFinish()
                
            case .failure(let error):
                viewState = .displayError(error.localizedDescription)
            }
        }
    }
}
