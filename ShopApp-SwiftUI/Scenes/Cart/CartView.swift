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
                CartListCell(viewModel: viewModel, product: product)
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
            // `product.product` kısmını kullanarak doğru Product'ı geçiriyoruz
            viewModel.remove(product.product)
        }
    }

}

#Preview{
    CartView(viewModel:CartViewModel())
}
