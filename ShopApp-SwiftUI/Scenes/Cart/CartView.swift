//
//  CartView.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 19.02.2025.
//

import SwiftUI

struct CartView: View {
    
    @ObservedObject var viewModel: CartViewModel
    @State private var digit: Int = 1
    
    var body: some View {
        ScrollView {
            ForEach(viewModel.products, id: \.self) { product in
                HStack(spacing: 12) {
                    Image("electronics2")
                        .scaledToFill()
                        .frame(width: 120, height: 200)
                        .clipped()
                        .padding(.leading, 23)
                    
                    VStack(alignment: .leading) {
                        VStack(alignment: .trailing, spacing: 12) {
                            Text("klasdkakdsşakds")
                                .font(.title2)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            HStack(alignment: .firstTextBaseline) {
                                Image(systemName: "truck.box")
                                    .frame(width: 12, height: 12)
                                
                                Text("Ships by tomorrow!")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.footnote)
                            }
                            .foregroundStyle(Color.green)
                        }
                        Spacer()
                        HStack {
                            StepperView(product: product, digitData: $digit)
                            
                            PriceView(product: product)
                        }
                    }
                    
                    
                }
                Divider()
            }
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
                .foregroundStyle(Color.customNavyBlue)
            
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
