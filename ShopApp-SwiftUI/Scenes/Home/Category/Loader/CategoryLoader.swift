//
//  CategoryLoader.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 3.03.2025.
//

import Foundation

final class CategoryLoader {
    private let service: CategoryService
    
    init(service: CategoryService) {
        self.service = service
    }
    
    func load(completion: @escaping (Result<[Category], Error>) -> Void) {
        service.fetchCategories { result in
            completion(result.map{  response in response.map(Category.init) })
        }
    }
}
