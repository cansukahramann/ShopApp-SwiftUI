//
//  CategoryNameView.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 10.02.2025.
//

import SwiftUI

struct CategoryNameView: View {
    
    var name = ["All", "Electronics","Jewelry" ,"Men's clothing",  "Women's clothing"]
    @State private var selectedCategory: String = "All"
    
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false, content: {
            LazyHStack() {
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
            }
        })
        .frame(height: 25)
        .padding()
        
    }
}

#Preview {
    CategoryNameView()
}
