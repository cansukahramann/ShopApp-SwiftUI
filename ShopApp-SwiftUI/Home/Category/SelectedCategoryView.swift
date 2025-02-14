//
//  SelectedCategoryView.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 10.02.2025.
//

import SwiftUI

struct SelectedCategoryView: View {
    var viewModel: ProductViewModel
    @Binding var selectedProduct: Product?
    @State private var isTapped: Bool = false
    
    private let columns: [GridItem] = [
        .init(.flexible(), spacing: 10, alignment: .leading),
        .init(.flexible(), spacing: 0, alignment: .trailing)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(viewModel.product) { product in
                    ProductCard(product: product)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 1.0)) {
                                selectedProduct = product
                            }
                        }
                }
            }
        }
    }
}

#Preview {
    SelectedCategoryView(viewModel: ProductViewModel(), selectedProduct: .constant(nil))
}
