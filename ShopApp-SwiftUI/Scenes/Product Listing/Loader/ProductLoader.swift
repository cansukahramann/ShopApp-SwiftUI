//
//  ProductLoader.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 4.03.2025.
//

import Foundation

struct ProductLoader {
    private let categoryService: CategoryService
    private let productService: ProductService
    
    init(categoryService: CategoryService, productService: ProductService) {
        self.categoryService = categoryService
        self.productService = productService
    }
    
    func fetchProducts(for category: Category?, completion: @escaping (Result<[Product], Error>) -> Void) {
        if let category {
            categoryService.fetchProductsByCategory(categoryName: category.name) { result in
                completion(result.map { $0.map(Product.init) })
            }
        } else {
            productService.fetchProducts { result in
                completion(result.map { $0.map(Product.init) })
            }
        }
    }
}
