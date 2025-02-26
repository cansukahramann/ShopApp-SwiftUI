//
//  FavoriteView.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 13.02.2025.
//

import SwiftUI


struct FavoriteView: View {
    @ObservedObject var viewModel = FavoriteViewModel()
    @State var selectedProduct: Product?
    
    var body: some View {
        
        VStack {
            SearchBar(search: .constant(""))
                .padding()
            
            Spacer()
        
            ScrollView {
              FavoriteProductsView(product: viewModel.products, selectedProduct: $selectedProduct)
                }
            }
        }
    }

#Preview {
    FavoriteView()
}
