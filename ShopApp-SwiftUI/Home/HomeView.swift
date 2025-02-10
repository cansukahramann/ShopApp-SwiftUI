//
//  HomeView.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 10.02.2025.
//

import SwiftUI

struct HomeView: View {
    
    @State var search = ""
    var body: some View {
        
        VStack() {
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
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("See all")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundStyle(.pink)
                    }
                    .padding()
                }
                PopularListingItemView()
            }
            CategoryNameView()
            Spacer()
            SelectedCategoryView()
        }
    }
    
}

#Preview {
    HomeView()
}
