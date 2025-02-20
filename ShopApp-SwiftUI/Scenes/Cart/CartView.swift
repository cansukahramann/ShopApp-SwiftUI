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
        List(viewModel.products) { product in
            CartListCell(product: product)
        }
    }
}

#Preview{
    CartView(viewModel:CartViewModel())
}
