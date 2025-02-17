//
//  HomeView.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 10.02.2025.
//

import SwiftUI

struct HomeView: View {
    
    
    @StateObject private var viewModel = ProductViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                SearchBar(search: .constant(""))
                    .padding([.leading, .trailing], 18)
                
                
                BannerListView()
                   
                CategoryListView()
                
                ProductListView(products: viewModel.product)
                    .padding()
            }
        }
    }
}

#Preview {
    HomeView()
}
