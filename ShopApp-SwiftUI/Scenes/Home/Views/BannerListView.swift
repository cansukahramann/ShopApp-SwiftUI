//
//  BannerListView.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 10.02.2025.
//

import SwiftUI

struct BannerListView: View {
    var banner = ["banner1","banner2","banner3", "banner4", "banner5","banner6","banner7"]
    @State private var top: UUID?
    
    var body: some View {
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
                        .onTapGesture {
                            top = .init()
                        }
                }
                contentInsetView(.horizontal(inset: 8))
            }
        }
        .frame(height: 150)
        .navigationDestination(item: $top) { _ in
            PromotedProductsViewFactory.makeView()
        }
    }
}
