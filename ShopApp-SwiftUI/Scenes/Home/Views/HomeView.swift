//
//  HomeView.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 10.02.2025.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedProduct: Product?
    @State private var isCategoryLoadFinished = false
    @State private var isProductLoadFinished = false
    
    @State private var selectedCategory: Category?
    
    private var isLoading: Bool {
        !isProductLoadFinished || !isCategoryLoadFinished
    }
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                BannerListView()
                
                CategoryListViewFactory.makeView(onLoadFinish: {
                    isCategoryLoadFinished = true
                }, onSelectedCategoryChange: { category in
                    selectedCategory = category
                })
                
                ProductListingViewFactory.makeView(category: $selectedCategory, onLoadFinish: {
                    isProductLoadFinished = true
                })
            }
        }
        .overlay {
            if  isLoading {
                LoadingIndicatorView()
            }
        }
    }
}
