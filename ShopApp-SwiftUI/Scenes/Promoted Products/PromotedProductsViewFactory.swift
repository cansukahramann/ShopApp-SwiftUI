//
//  PromotedProductsViewFactory.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 3.03.2025.
//

import SwiftUI

final class PromotedProductsViewFactory {
    private init() {}
    
    static func makeView() -> some View {
        let service = ProductService()
        let loader = PromotedProductsLoader(service: service)
        let viewModel = PromotedProductsViewModel(loader: loader)
        let view = PromotedProductsView(viewModel: viewModel)
        return view
    }
    
    static func makePreviewView() -> some View {
        let product = Product(id: 1, title: "test title", price: 100, image: "", category: "test category", description: "test description", rating: .init(rate: 3, count: 1))
        let succesfullLoader = FakePromotedProductsLoader(result: .success([product]))
        let failedLoader = FakePromotedProductsLoader(result: .failure(NSError(domain: "Error", code: 0)))
        let viewModel = PromotedProductsViewModel(loader: succesfullLoader)
        let view = PromotedProductsView(viewModel: viewModel)
        return view
    }
}
