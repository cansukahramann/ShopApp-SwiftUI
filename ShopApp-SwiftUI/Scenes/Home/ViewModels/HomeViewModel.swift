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
    @Published var selectedCategory: Category? {
        didSet {
            if let selectedCategory {
                fetchProductsByCategory(category: selectedCategory)
            }
        }
    }
    
    private let dataLoader: HomeDataLoader
    
    init(dataLoader: HomeDataLoader = .init()) {
        self.dataLoader = dataLoader
    }
    
    func fetchIntialData() {
        dataLoader.fetchData { [weak self] result in
            switch result {
            case .success(let data):
                self?.categories = data.categories
                self?.selectedCategory = data.categories.first
                self?.products = data.products
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func fetchProductsByCategory(category: Category) {
        if category.name == "All" {
            dataLoader.fetchData { [weak self] result in
                switch result {
                case .success(let data):
                    self?.products = data.products
                case .failure(let error):
                    print(error)
                }
            }
        } else {
            dataLoader.fetchProductsByCategory(categoryName: category.name) { [weak self] result in
                switch result {
                case .success(let data):
                    self?.products = data
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
