//
//  HomeView.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 10.02.2025.
//

import SwiftUI

struct ViewDidLoadModifier: ViewModifier {
    @State private var isFirstOnAppear = true
    private let action: () -> Void
    
    init(action: @escaping () -> Void) {
        self.action = action
    }

    func body(content: Content) -> some View {
        content.onAppear {
            guard isFirstOnAppear else { return }
            action()
            isFirstOnAppear.toggle()
        }
    }
}

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
        }
        .navigationDestination(item: $selectedProduct) { product in
            ProductDetailView(id: product.id)
        }
        .onViewDidLoad {
            viewModel.fetchIntialData()
        }
    }
}

#Preview {
    HomeView(viewModel: .init())
}
