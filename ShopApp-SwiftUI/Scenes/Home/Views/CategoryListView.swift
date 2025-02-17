//
//  CategoryListView.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 10.02.2025.
//

import SwiftUI

struct CategoryListView: View {
    
    var name = ["All", "Electronics","Jewelry" ,"Men's clothing",  "Women's clothing"]
    @State private var selectedCategory: String = "All"
    
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            LazyHStack() {
                contentInsetView(.horizontal(inset: 8))
                
                ForEach(name, id: \.self) { name in
                    Button {
                        selectedCategory = name
                    } label: {
                        Text(name)
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.customAppColor)
                            .underline(selectedCategory == name, color: Color.pink)
                            .contentShape(Rectangle())
                            .padding()
                    }
                }
                contentInsetView(.horizontal(inset: 8))
            }
        }
        .frame(height: 20)
    }
}

#Preview {
    CategoryListView()
}
