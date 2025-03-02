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
                
                CategoryListView(categories: viewModel.categories, selectedCategory: $viewModel.selectedCategory)
                
                ProductListView(products: viewModel.products, selectedProduct: $selectedProduct)
                    .padding()
                
                if viewModel.isLoading {
                    ZStack {
                        Color(.systemBackground)
                            .ignoresSafeArea()
                        
                        ProgressView()
                            .progressViewStyle(.circular)
                            .scaleEffect(2)
                    }
                }
                
            }
            .onViewDidLoad {
                viewModel.fetchIntialData()
            }
        }
    }
}
