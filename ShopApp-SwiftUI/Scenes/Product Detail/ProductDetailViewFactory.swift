//
//  ProductDetailViewFactory.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 3.03.2025.
//

import SwiftUI

final class ProductDetailViewFactory {
    private init() {}
    
    static func makeProductDetailView(_ id: Int) -> some View {
        let service = ProductService()
        let dataLoader = DetailDataLoader(productService: service, id: id)
        let viewModel = ProductDetailViewModel(id: id, dataLoader: dataLoader)
        return ProductDetailView(viewModel)
    }
}
