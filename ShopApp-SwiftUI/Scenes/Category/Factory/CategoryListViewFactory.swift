//
//  CategoryListViewFactory.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 4.03.2025.
//

import SwiftUI

final class CategoryListViewFactory {
    private init() {}
    
    static func makeView(onLoadFinish: @escaping () -> Void, onSelectedCategoryChange: @escaping (Category?) -> Void) -> some View {
        let service = CategoryService()
        let loader = CategoryLoader(service: service)
        let viewModel = CategoryListViewModel(loader: loader, onLoadFinish: onLoadFinish, onSelectedCategoryChange: onSelectedCategoryChange)
        let view = CategoryListView(viewModel)
        return view
    }
}
