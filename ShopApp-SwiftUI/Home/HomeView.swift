//
//  HomeView.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 10.02.2025.
//

import SwiftUI

struct HomeView: View {
    
    @State var search = ""
    @StateObject private var viewModel = ProductViewModel()
    var body: some View {
        ScrollView {
            HStack {
                TextField("Search", text: $search)
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                Spacer()
                Image(systemName: "magnifyingglass")
            }
            .padding()
            .overlay(content: {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(lineWidth: 1)
                    .foregroundStyle(Color(.systemGray4))
            })
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
            SelectedCategoryView(viewModel: viewModel)
        }
    }
}

#Preview {
    HomeView()
}
