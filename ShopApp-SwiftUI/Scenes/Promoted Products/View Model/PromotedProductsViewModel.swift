//
//  PromotedProductsViewModel.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 3.03.2025.
//

import Foundation

final class PromotedProductsViewModel: ObservableObject {
    @Published private(set) var viewState: ViewState<[Product]> = .loading

    private let loader: PromotedProductsLoaderProtocol
    
    init(loader: PromotedProductsLoaderProtocol) {
        self.loader = loader
    }
    
    func loadProducts() {
        viewState = .loading
        loader.load { [weak self] result in
            switch result {
            case .success(let products):
                self?.viewState = .display(products)
            case .failure(let failure):
                self?.viewState = .displayError(failure.localizedDescription)
            }
        }
    }
    
}
