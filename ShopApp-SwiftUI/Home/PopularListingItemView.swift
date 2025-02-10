//
//  PopularListingItemView.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 10.02.2025.
//

import SwiftUI

struct PopularListingItemView: View {
    
    var popularListig = ["popularItem1","popularItem2","popularItem3", "popularItem4", "popularItem5"]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 12) {
                ForEach(popularListig, id: \.self) { popularListing in
                    Image(popularListing)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 300)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                
               
            }
        }
        
        .frame(height: 150)
        
    }
}

#Preview {
    PopularListingItemView()
}
