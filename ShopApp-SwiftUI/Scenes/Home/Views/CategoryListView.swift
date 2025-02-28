//
//  CategoryListView.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 10.02.2025.
//

import SwiftUI

struct CategoryListView: View {
    let categories: [Category]
    @Binding var selectedCategory: Category?
    
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            LazyHStack() {
                contentInsetView(.horizontal(inset: 8))
                
                ForEach(categories, id: \.self) { category in
                    Button {
                        selectedCategory = category
                    } label: {
                        Text(category.name)
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.brown)
                            .underline(selectedCategory == category, color: .brown)
                            .padding()
                            .overlay {
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(lineWidth: 1)
                                    .fill(Color.brown)
                                    .frame(height: 45)
                            }
                    }
                }
                contentInsetView(.horizontal(inset: 8))
            }
        }
        .frame(height: 50)
    }
}

#Preview {
    CategoryListView(categories: [.init(name:"All"), .init(name: "Popular")], selectedCategory: .constant(.init(name: "All")))
}
