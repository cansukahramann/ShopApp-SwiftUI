//
//  SelectedCategoryView.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 10.02.2025.
//

import SwiftUI

struct SelectedCategoryView: View {
    
    var allCategory = [
        "jewelery",
        "jewelery1",
        "menClothing",
        "menClothing1",
        "womenClothing",
        "womenClothing2",
        "electronics",
        "electronics2"
    ]
    
    @State private var likedProducts = [String : Bool]()

    let columns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                LazyVGrid(columns: columns) {
                    ForEach(allCategory, id: \.self) { all in
                        
                        ZStack(alignment: .topTrailing) {
                            VStack {
                                Image(all)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 150, height: 150)
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                
                                Text(all) 
                                    .font(.headline)
                                    .foregroundColor(.black)
                                    .padding(.top, 5)
                            }
                            
                            Button {
                                likedProducts[all, default: false].toggle()
                            } label: {
                                Image(systemName: likedProducts[all, default: false] ? "heart.fill" : "heart")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundStyle(.red)
                                    .padding(8)
                            }

                        }
                        
                    }
                }
                
            }
            
        }
    }
}

#Preview {
    SelectedCategoryView()
}
