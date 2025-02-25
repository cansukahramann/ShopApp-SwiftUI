//
//  CartView.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 19.02.2025.
//

import SwiftUI
import PassKit

struct CartView: View {
    @ObservedObject var viewModel: CartViewModel
    
    var body: some View {
        VStack {
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
            .listStyle(PlainListStyle())
            .scrollIndicators(.hidden)
 
            PaymentView(viewModel: viewModel) {
                UINotificationFeedbackGenerator().notificationOccurred(.success)
            }
        }
    }
    
    private func delete(at offsets: IndexSet) {
        for index in offsets {
            let product = viewModel.products[index]
            viewModel.remove(product.product)
        }
    }
}

struct BottomSheetView: View {
    
    var body: some View {
        Text("skkdk")
    }
}

struct PaymentView: View {
    @ObservedObject var viewModel: CartViewModel
    var action: () -> Void
    @State private var showAlert = false
    
    var body: some View {
        
        let totalPrice = viewModel.calculateTotalPrice()

        VStack {
            HStack {
                VStack(spacing: 4) {
                    Text("Total:")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    
                    Text("$\(totalPrice, specifier:"%.2f")")
                        .font(.callout)
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                }
                .padding(.leading, 45)
                
                VStack(spacing: 4) {
                    Button {
                        action()
                        showAlert = true
                    } label: {
                        Text("Buy Now" )
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(width: 200, height: 40)
                            .background(Color.brown)
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                    }
                    .alert("Peymet Complete", isPresented: $showAlert) {
                        Button("Ok", role: .cancel) {
                            let productsToRemove = viewModel.products
                            productsToRemove.forEach { viewModel.remove($0.product) }
                        }
                    } message: {
                        Text("Your payment was successful. Enjoy your purchase!")
                    }
                    ApplePaymentButton(action: { showAlert = true })
                }
            }
            .background(Color.white)
        }
    }
}

#Preview{
    CartView(viewModel:CartViewModel())
}
