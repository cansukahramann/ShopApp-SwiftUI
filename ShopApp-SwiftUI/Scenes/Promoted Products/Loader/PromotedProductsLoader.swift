//
//  PromotedProductsLoader.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 3.03.2025.
//

import Foundation

struct PromotedProductsLoader: PromotedProductsLoaderProtocol {
    private let service: ProductService
    
    init(service: ProductService) {
        self.service = service
    }
    
    func load(completion: @escaping (Result<[Product], Error>) -> Void)  {
        service.fetchProducts { result in
            completion( result.map { response in
                response.map(Product.init)
            })
        }
    }
}
