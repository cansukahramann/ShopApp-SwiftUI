//
//  CartListCell.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 20.02.2025.
//

import SwiftUI
import Kingfisher

struct CartListCell: View {
    let product: CartProduct
    let onUpdate: (CartProduct) -> Void
    
    var body: some View {
        HStack(spacing: 10) {
            KFImage(URL(string: product.product.image))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .clipped()
            
            VStack(alignment: .leading) {
                ProductInfoView(title: product.product.title)
                
                Spacer()
                
                HStack(spacing: 12) {
                  
                    StepperView(quantity: product.quantity) { newQuantitiy in
                        var updateProduct = product
                        updateProduct.quantity = newQuantitiy
                        onUpdate(updateProduct)
                    }
                    
                    PriceView(price: product.product.price)
                }
            }
            .padding(20)
        }
    }
}

struct ProductInfoView: View {
    var title: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
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
    }
}

struct StepperView: View {
    let quantity: Int
    let onUpdate: (Int) -> Void
    
    var body: some View {
        HStack {
            Button {
                guard quantity > 0 else { return }
                onUpdate(quantity - 1)
            } label: {
                Image(systemName: "minus")
                    .font(.footnote)
                    .foregroundStyle(Color.white)
                    .background {
                        Circle()
                            .fill(Color.accentColor)
                            .frame(width: 23, height: 23)
                    }
            }
            .buttonStyle(BorderlessButtonStyle())
            
            Text("\(quantity)")
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundStyle(.black)
                .frame(width: 25)
                .truncationMode(.tail)
         
            Button {
                onUpdate(quantity + 1)
            } label: {
                Image(systemName: "plus")
                    .font(.footnote)
                    .foregroundStyle(Color.white)
                    .background {
                        Circle()
                            .fill(Color.accentColor)
                            .frame(width: 23, height: 23)
                    }
            }
            .buttonStyle(BorderlessButtonStyle())
        }
        .padding()
    }
}

