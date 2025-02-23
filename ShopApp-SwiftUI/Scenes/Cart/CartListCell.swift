//
//  CartListCell.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 20.02.2025.
//

import SwiftUI
import Kingfisher

struct CartListCell: View {
    let product: Product
    @State private var digit: Int = 1
    
    var body: some View {
        HStack(spacing: 10) {
            KFImage(URL(string: product.image))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 120, height: 180)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .clipped()
            
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 12) {
                    Text(product.title)
                        .font(.title2)
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
                HStack {
                    StepperView(product: product, digitData: $digit)
                    
                    PriceView(price: product.price)
                }
            }
            .padding(20)
        }
    }
}

struct StepperView: View {
    let product: Product
    @Binding var digitData: Int
    
    var body: some View {
        HStack() {
            Button {
                guard digitData > 0 else { return }
                digitData -= 1
            } label: {
                Image(systemName: "minus")
                    .font(.footnote)
                    .foregroundStyle(Color.white)
                    .padding(10)
                    .background {
                        Circle()
                            .fill(Color.accentColor)
                            .frame(width: 23, height: 23)
                    }
            }
            
            Text("\(digitData)")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundStyle(.black)
            
            Button {
                digitData += 1
            } label: {
                Image(systemName: "plus")
                    .font(.footnote)
                    .foregroundStyle(Color.white)
                    .padding(10)
                    .background {
                        Circle()
                            .fill(Color.accentColor)
                            .frame(width: 23, height: 23)
                    }
            }
        }
    }
}

