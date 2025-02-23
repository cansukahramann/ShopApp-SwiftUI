//
//  ProductCard.swift
//  ShopApp-SwiftUI
//
//  Created by Cansu Kahraman on 11.02.2025.
//

import SwiftUI
import Kingfisher

struct ProductCard: View {
    
    let product: Product
    
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .leading) {
                    KFImage(URL(string: product.image))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geo.size.width * 0.9, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                Text(product.title)
                    .font(.callout)
                    .fontWeight(.semibold)
                
                RatingView(count: product.rating!.count)
                PriceView(price: product.price)
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
    }
}
