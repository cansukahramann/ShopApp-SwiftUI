//
//  BannerListView.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 10.02.2025.
//

import SwiftUI

struct BannerListView: View {
    
    var banner = ["banner1","banner2","banner3", "banner4", "banner5","banner6","banner7"]
    
    var body: some View {
        VStack {
            headerView
            listView
        }
    }
    
    var headerView: some View {
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
            .padding([.leading, .trailing], 18)
        }
    }
    
    var listView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 12) {
                contentInsetView(.horizontal(inset: 8))
                
                ForEach(banner, id: \.self) { popularListing in
                    Image(popularListing)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 300, height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .clipped()
                }
                
                contentInsetView(.horizontal(inset: 8))
            }
        }
        .frame(height: 150)
    }
}


#Preview {
    BannerListView()
}
