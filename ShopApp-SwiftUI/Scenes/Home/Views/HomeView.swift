//
//  HomeView.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 10.02.2025.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    @State private var selectedProduct: Product?
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                BannerListView()
                
//                CategoryListView(viewModel)
                
                ProductListView(products: viewModel.products, selectedProduct: $selectedProduct)
                    .padding()
                
                if viewModel.isLoading {
                    LoadingIndicatorView()
                }
                
            }
            .onViewDidLoad {
                viewModel.fetchIntialData()
            }
        }
    }
}
