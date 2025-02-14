//
//  HomeView.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 10.02.2025.
//

import SwiftUI

struct HomeView: View {
    
    
    @StateObject private var viewModel = ProductViewModel()
    @State private var selectedProduct: Product?
    
    var body: some View {
        NavigationStack {
            ScrollView {
                SearchBar() 
                .padding()
                
                VStack(spacing: 0) {
                    HStack() {
                        Text("Popular Item")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .padding()
                            .foregroundStyle(Color.customNavyBlue)
                        Spacer()
                        Button {
                            
                        } label: {
                            Text("See all")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.customAppColor)
                        }
                        .padding()
                    }
                    PopularListingItemView()
                }
                CategoryNameView()
                Spacer()
                SelectedCategoryView(viewModel: viewModel,selectedProduct: $selectedProduct)
                    .padding()
            }
            .navigationDestination(item: $selectedProduct) { product in
                ProductDetailView(product: product)
            }
        }
    }
}

#Preview {
    HomeView()
}
