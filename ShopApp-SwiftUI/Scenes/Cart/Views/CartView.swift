//
//  CartView.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 19.02.2025.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var viewModel: CartViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.products, id: \.self) { product in
                CartListCell(product: product) { updatedProduct in
                    viewModel.update(updatedProduct)
                }
            }
            .onDelete(perform: delete)
        }
        .onAppear {
            viewModel.refresh()
        }
    }
    
    private func delete(at offsets: IndexSet) {
        for index in offsets {
            let product = viewModel.products[index]
            viewModel.remove(product.product)
        }
    }

}

#Preview{
    CartView(viewModel:CartViewModel())
}
