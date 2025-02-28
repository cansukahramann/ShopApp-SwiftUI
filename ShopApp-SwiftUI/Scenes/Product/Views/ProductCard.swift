//
//  ProductCard.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 11.02.2025.
//

import SwiftUI
import Kingfisher

struct ProductCardModel {
    let image: String
    let title: String
    let rate: Double
    let rateCount: Int
    let price: Double
}

struct ProductCard: View {
    let model: ProductCardModel
    
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .leading) {
                    KFImage(URL(string: model.image))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geo.size.width * 0.9, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                Text(model.title)
                    .font(.callout)
                    .fontWeight(.semibold)
                
                RatingView(rate: model.rate, count: model.rateCount)
                PriceView(price: model.price)
                Spacer(minLength: 0)
            }
            .padding()
            .frame(width: geo.size.width, height: 260)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white)
                    .shadow(radius: 2)
            )
        }
        .frame(height: 260)
        .contentShape(Rectangle())
    }
}
