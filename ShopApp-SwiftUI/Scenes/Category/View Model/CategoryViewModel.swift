//
//  CategoryViewModel.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 3.03.2025.
//

import Foundation

final class CategoryListViewModel: ObservableObject {
    private let onSelectedCategoryChange: (Category?) -> Void
    private var categories = [Category]()
    
    @Published private(set) var viewState: ViewState<[Category]> = .loading
    @Published var selectedCategory: Category? {
        didSet { onSelectedCategoryChange(selectedCategory == categories.first ? nil : selectedCategory) }
    }
    
    private let loader: CategoryLoader
    private let onLoadFinish: () -> Void
    
    init(loader: CategoryLoader, onLoadFinish: @escaping () -> Void, onSelectedCategoryChange: @escaping (Category?) -> Void) {
        self.loader = loader
        self.onLoadFinish = onLoadFinish
        self.onSelectedCategoryChange = onSelectedCategoryChange
    }
    
    func loadCategories() {
        viewState = .loading
        loader.load { [weak self] result in
            switch result {
            case .success(let categories):
                var categories = categories
                categories.insert(Category(name: "All"), at: 0)
                
                self?.categories = categories
                self?.selectedCategory = categories.first
                
                self?.viewState = .display(categories)
                self?.onLoadFinish()
                
            case .failure(let failure):
                self?.viewState = .displayError(failure.localizedDescription)
            }
        }
    }
}
