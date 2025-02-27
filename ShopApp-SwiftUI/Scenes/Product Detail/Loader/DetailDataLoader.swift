//
//  DetailDataLoader.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 27.02.2025.
//

import Foundation

final class DetailDataLoader {
    private let productService: ProductService
    private let id: Int
    
    init(productService: ProductService = ProductService(), id: Int) {
        self.productService = productService
        self.id = id
    }
    
    func fetchProductDetail(completion: @escaping(Result<Product, Error>) -> Void) {
        productService.fetchDetailProduct(id: id) { result in
            switch result {
            case .success(let response):
                completion(.success(Product(response)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
