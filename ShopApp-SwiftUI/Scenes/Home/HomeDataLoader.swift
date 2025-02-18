//
//  HomeDataLoader.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 18.02.2025.
//

import Foundation

final class HomeDataLoader {
    struct Data {
        let categories: [Category]
        let products: [Product]
    }
    
    private let group = DispatchGroup()
    private let categoryService: CategoryService
    private let productService: ProductService
    
    init(categoryService: CategoryService = .init(), productService: ProductService = .init()) {
        self.categoryService = categoryService
        self.productService = productService
    }
    
    func fetchData(completion: @escaping (Result<Data, Error>) -> Void) {
        var categories = [Category]()
        var products = [Product]()
        var error: Error?
        
        group.enter()
        categoryService.fetchCategories { [weak self] result in
            switch result {
            case .success(let model):
                let receivedCategories = model.map { Category(name: $0.capitalized)}
                categories = [.init(name: "All")] + receivedCategories
            case .failure(let receivedError):
                error = receivedError
            }
            
            self?.group.leave()
        }
        
        group.enter()
        productService.fetchProducts { [weak self] result in
            switch result {
            case .success(let model):
                products = model.map(Product.init)
            case .failure(let receivedError):
                error = receivedError
            }
        
            self?.group.leave()
        }
        
        group.notify(queue: .main) {
            if let error {
                completion(.failure(error))
            } else {
                completion(.success(.init(categories: categories, products: products)))
            }
        }
    }
}
