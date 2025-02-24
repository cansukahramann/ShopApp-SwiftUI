//
//  CartListCell.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 20.02.2025.
//

import SwiftUI
import Kingfisher

struct CartListCell: View {
    @ObservedObject var viewModel: CartViewModel
    let product: CartProduct
    @State private var digit: Int = 1
    
    var body: some View {
        HStack(spacing: 10) {
            KFImage(URL(string: product.product.image))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .clipped()
            
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 12) {
                    Text(product.product.title)
                        .font(.title3)
                        .fontWeight(.medium)
                    HStack {
                        Image(systemName: "truck.box")
                            .frame(width: 12, height: 12)
                        
                        Text("Ships by tomorrow!")
                            .font(.footnote)
                    }
                    .foregroundStyle(Color.green)
                }
                Spacer()
                HStack(spacing: 12) {
                  
                    StepperView(quantity: product.quantity) { newQuantitiy in
                        var updateProduct = product
                        updateProduct.quantity = newQuantitiy
                        viewModel.update(updateProduct)
                    }
                    
                    PriceView(price: product.product.price)
                }

            }
            .padding(20)
        }
    }
}

struct StepperView: View {
    let quantity: Int
    let onUpdate: (Int) -> Void
    
    var body: some View {
        HStack() {
            Button {
                guard quantity > 0 else { return }
                onUpdate(quantity - 1)
            } label: {
                Image(systemName: "minus")
                    .font(.footnote)
                    .foregroundStyle(Color.white)
                    .padding(10)
                    .background {
                        Circle()
                            .fill(Color.accentColor)
                            .frame(width: 18, height: 18)
                    }
            }
            
            Text("\(quantity)")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundStyle(.black)
            
            Button {
                onUpdate(quantity + 1)
            } label: {
                Image(systemName: "plus")
                    .font(.footnote)
                    .foregroundStyle(Color.white)
                    .padding(10)
                    .background {
                        Circle()
                            .fill(Color.accentColor)
                            .frame(width: 18, height: 18)
                    }
            }
        }.clipShape(Capsule())
            .padding()
    }
}

