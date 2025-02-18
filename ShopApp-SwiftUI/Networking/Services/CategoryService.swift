//
//  CategoryService.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 17.02.2025.
//

import Foundation

struct CategoryService {
    func fetchCategories(completion: @escaping (Result<CategoryResponseModel, Error>) -> Void) {
        NetworkManager.shared.request(CategoryAPI.allCategories) {
            completion(ResponseMapper.map($0))
        }
    }
}
