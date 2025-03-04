//
//  ProductListingViewFactory.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 4.03.2025.
//

import SwiftUI 

final class ProductListingViewFactory {
    private init() {}
    
    static func makeView(category: Binding<Category?>, onLoadFinish: @escaping () -> Void) -> some View  {
        ProductListingView(viewModel: {
            let categoryService = CategoryService()
            let productService = ProductService()
            let loader = ProductLoader(categoryService: categoryService, productService: productService)
            let viewModel = ProductListingViewModel(loader: loader, onLoadFinish: onLoadFinish)
            return viewModel
        }, category: category)
    }
}
