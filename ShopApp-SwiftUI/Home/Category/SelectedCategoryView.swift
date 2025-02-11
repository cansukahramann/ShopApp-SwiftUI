//
//  SelectedCategoryView.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 10.02.2025.
//

import SwiftUI

struct SelectedCategoryView: View {
    var viewModel: ProductViewModel
    
    private let columns: [GridItem] = [
        .init(.flexible(), spacing: 10, alignment: .leading),
        .init(.flexible(), spacing: 0, alignment: .trailing)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(viewModel.product) { product in
                    ProductCard(product: product)
                }
            }
        }
    }
}

#Preview {
    SelectedCategoryView(viewModel: ProductViewModel())
}
