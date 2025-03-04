//
//  SearchBar.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 13.02.2025.
//

import SwiftUI

struct SearchBar: View {
    @Binding var search: String
    
    var body: some View {
        HStack(alignment: .top) {
            TextField("Search", text: $search)
                .font(.subheadline)
                .foregroundStyle(.gray)

            Spacer()
            
            if !search.isEmpty {
                Button(action: {
                    search = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(.gray)
                }
            } else {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.gray)
            }
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(lineWidth: 1)
                .foregroundStyle(Color(.systemGray4))
        )
    }
}
