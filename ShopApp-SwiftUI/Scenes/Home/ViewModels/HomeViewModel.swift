//
//  HomeViewModel.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 17.02.2025.
//

import Foundation

final class HomeViewModel: ObservableObject {
    @Published private(set) var products = [Product]()
    
    @Published private(set) var categories = [Category]()
    @Published var selectedCategory: Category?
    
    private let categoryService: CategoryService
    
    init(categoryService: CategoryService) {
        self.categoryService = categoryService
    }
    
    func fetchCategories() {
        categoryService.fetchCategories { [weak self] result  in
            switch result {
            case .success(let model):
                let categories = model.map { Category(name: $0.capitalized)}
                self?.categories = [.init(name: "All")] + categories
                self?.selectedCategory = self?.categories.first
            case .failure(let error):
                print(error)
            }
        }
    }
}
