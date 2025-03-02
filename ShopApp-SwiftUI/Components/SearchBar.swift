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
            Image(systemName: "magnifyingglass")
        }
        .padding()
        .overlay(content: {
            RoundedRectangle(cornerRadius: 12)
                .stroke(lineWidth: 1)
                .foregroundStyle(Color(.systemGray4))
        })
    }
}
